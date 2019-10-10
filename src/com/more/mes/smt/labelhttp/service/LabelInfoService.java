/**
 *
 */
package com.more.mes.smt.labelhttp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * @author csj
 * @version 1.0 developer 2018-04-24 created
 * @Title 云标签接口公共类
 * @Description
 * @ClassName LabelInfoService
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 * @see:LineListService
 * @since 2017-8-14
 */
public class LabelInfoService {

    private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

    private final Log log = LogFactory.getLog(this.getClass());

    /**
     * @return List
     * @throws
     * @Description: 获取数据项信息
     */
    public List getDataItem(String labelId, String itemSn, String dataAuth) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Map<String, Object>> labelList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> stockList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
        Map<String, Object> resMsgMap = new HashMap<String, Object>();
        String resStr = "";
        String cldSql = "";
        boolean paramError = false;
        try {
            // 获取标签数据项信息
            String sql3 = "SELECT T.ID,T.LABEL_NAME LABEL_NAME,T.LABELCSS FROM ML_TEMPLATE T WHERE T.ID=?";
            itemList = modelService.listDataSql(sql3, new Object[]{labelId});

            Map<String, Object> labelMap = new HashMap<String, Object>();
            if (!itemList.isEmpty() && itemList != null) {
                labelMap.put("LABELCSS", itemList.get(0).get("LABELCSS"));
                // labelMap.put("LABEL_NAME", itemList.get(0).get("LABEL_NAME"));
                dataList.add(labelMap);
            }

            //
            String sql = "SELECT DISTINCT T.CLD_LABEL_ID, " + " T.CLD_ITEM_ALIAS, "
                    + " T.CLD_COLUMN_NAME, " + " T1.DATA_ITEMS_NAME "
                    + " FROM T_CO_LABEL_DATACONFIGURE T " + " LEFT JOIN ML_DATA_ITEMS T1 "
                    + " ON T.CLD_ITEM_ALIAS = T1.DATA_ITEMS_ALIAS " + " WHERE T.CLD_LABEL_ID = ? "
                    + " and t1.template_id = ? "
                    + " AND T1.PICTURE_FLAG != 'Y' AND T.DATA_AUTH =? AND T1.DATA_AUTH=? ";
            labelList = modelService.listDataSql(sql, new Object[]{labelId, labelId, dataAuth, dataAuth});

            String sql2 = "SELECT T.CLD_SQL,T.CLD_CODE_ALIAS,T.CLD_NUM_ALIAS  FROM T_CO_LABEL_DATASOURCE T WHERE T.CLD_LABEL_ID=? AND T.DATA_AUTH=? ";
            map = modelService.queryForMap(sql2, new Object[]{labelId, dataAuth});

            if (!(map == null) && !(map.size() == 0)) {

                String tempSql = StringUtils.toString(map.get("CLD_SQL"));
                String dataAuthStr = "'" + dataAuth + "'";

                tempSql = tempSql.replace("{DATA_AUTH}", dataAuthStr);

                cldSql = StringUtils.toString(map.get("CLD_SQL"));

                cldSql = tempSql;
                // String[] tempSql = cldSql.toUpperCase().split(":");
                cldSql = cldSql.replaceAll(";", "");
                cldSql = cldSql.replaceAll("\\{[^{}]+\\}", "?");
                String[] tempSqls = cldSql.split("\\?", -1);
                int tempLen = tempSqls.length - 1;
                // if (tempLen != 1)
                // {
                // paramError = true;
                // }
                // Object[] params = new Object[tempLen];
                // params[0] = itemSn;
                // for (int i = 1; i < tempLen; i++ )
                // {
                // params[i] = "";
                // }
                // stockList = modelService.listDataSql(cldSql, params);
                // 20180710 判断多个参数是否一致的情况
                //String tempSql = StringUtils.toString(map.get("CLD_SQL"));
                List<String> paramList = new ArrayList<String>();
                Pattern pattern = Pattern.compile("(?<=\\{)(.+?)(?=\\})");
                Matcher matcher = pattern.matcher(tempSql);
                while (matcher.find()) {
                    paramList.add(matcher.group(1));
                }

                if(paramList.size() > 0){
                    if (tempLen != 1) {
                        boolean tempFlag = false;
                        String tempStr = paramList.get(0);
                        for (int i = 1; i < paramList.size(); i++) {
                            String tempStr2 = paramList.get(i);
                            if (!tempStr.equals(tempStr2)) {
                                tempFlag = true;
                            }
                        }
                        if (tempFlag == true) {
                            paramError = true;
                        }
                    }
                }

                if (tempLen != 0) {
                    Object[] params = new Object[tempLen];
                    params[0] = itemSn;
                    for (int i = 1; i < tempLen; i++) {
                        params[i] = itemSn;
                    }
                    stockList = modelService.listDataSql(cldSql, params);
                } else {
                    stockList = modelService.listDataSql(cldSql);
                }

                Map<String, Object> resMap = new HashMap<String, Object>();
                if (stockList != null && !stockList.isEmpty()) {
                    for (int i = 0; i < labelList.size(); i++) {
                        String colName = StringUtils.toString(labelList.get(i).get("CLD_COLUMN_NAME"));
                        String otherName = StringUtils.toString(labelList.get(i).get("CLD_ITEM_ALIAS"));
                        String dataName = StringUtils.toString(labelList.get(i).get("DATA_ITEMS_NAME"));

                        for (int j = 0; j < stockList.size(); j++) {
                            Map<String, Object> tempMap = stockList.get(j);
                            for (String key : tempMap.keySet()) {
                                String value = StringUtils.toString(tempMap.get(key));
                                if (key.equals(colName)) {
                                    // resMap.put("CLD_COLUMN_NAME", colName);
                                    // resMap.put("CLD_ITEM_VALUE", value);
                                    resMap.put(dataName, value);
                                }
                            }
                        }
                    }
                    resList.add(resMap);
                    Map<String, Object> dataMap = new HashMap<String, Object>();
                    dataMap.put("DATA_INFO", resList);
                    resMsgMap.put("RES", "SUCCESS");
                    dataList.add(dataMap);
                    dataList.add(resMsgMap);
                } else {
                    resStr = "FALSE";
                    Map<String, Object> dataMap = new HashMap<String, Object>();
                    dataMap.put("DATA_INFO", resList);
                    dataList.add(dataMap);
                    resMsgMap.put("RES", "ERROR");
                    dataList.add(resMsgMap);
                }
            } else {
                resStr = "FALSE";
                Map<String, Object> dataMap = new HashMap<String, Object>();
                dataMap.put("DATA_INFO", resList);
                dataList.add(dataMap);
                resMsgMap.put("RES", "ERROR");
                dataList.add(resMsgMap);
            }
        } catch (Exception e) {
            log.error("___________", e);
            resStr = "ERROR";
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("DATA_INFO", resList);
            dataList.add(dataMap);
            resMsgMap.put("RES", "ERROR");
            dataList.add(resMsgMap);
        }
        return dataList;
    }

    public List getLabelIdAndName(String dataAuth) {
        String sql = "SELECT T.ID LABEL_ID,T.LABEL_NAME LABEL_NAME FROM ML_TEMPLATE T WHERE T.DATA_AUTH=?";
        // List itemList = modelService.listDataSql(sql);
        List itemList = modelService.listDataSql(sql, new Object[]{dataAuth});
        return itemList;
    }
}
