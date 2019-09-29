package com.morelean.mcmes.feed;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 新增生产投料-视图前执行类
 * @author:phantomsaber
 * @version:2019/7/18 14:09
 * @email:phantomsaber@foxmail.com
 **/
public class ProjectToFeededitInfoImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();
        //String dataId = modelAction.getDataId();
        String projectId = request.getParameter("projectId");
        String reg = "ok";
        //验证工单是否到达投料流程
        String checkSql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND T.PROJECT_STATUS='4' AND T.PROJECT_SORT='1' AND  T.PROJECT_ID=? ";
        List clist = modelService.listDataSql(checkSql, new Object[]{projectId});
        if(clist.size() <= 0){
            reg = "ng";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
        }
        //判断工单是否已包装
        String checksql1 = "SELECT * FROM  T_PROJECT_PACK_FEED T  WHERE 1=1 AND  T.PROJECT_ID=?";
        clist = modelService.listDataSql(checksql1, new Object[]{projectId});

        if(clist.size() < 0) {
            reg = "ng1";
            modelAction.setAjaxString(reg);
            return BaseActionSupport.AJAX;
        }
        modelAction.setAjaxString(reg);
        /*-- version:2019/7/18 15:38 | desc:投料标准配方 --*/

       /* String feedDetailSql = " SELECT D.CI_ITEM_CODE  AS ITEM_CODE, " +
                "       D.STOCK_CODE    AS ITEM_STOCK, " +
                "       D.RAW_LOTNUMBER AS ITEM_LOT, " +
                "       C.CBD_ITEM_NUM  AS ITEM_NUM, " +
                "       D.CI_ITEM_NAME AS ITEM_NAME ," +
                "       F.FEED_NUM," +
                "       F.PROCESS_ORDER   AS ITEM_ORDER, " +
                "       f.WAREHOUSE AS WARE_HOUSE, " +
                "       f.WORK_SPACE    AS FACTORY_CODE, "+
                "       A.PRODUCT_LINE  AS WORK_STATION "+
                "  FROM T_PM_PROJECT_BASE A " +
                " LEFT JOIN T_PM_PROJECT_DETAIL C ON C.PROJECT_ID = A.PROJECT_ID " +
                " LEFT JOIN T_PM_PROJECT_FEED_DETAIL F ON F.PROJECT_ID = A.PROJECT_ID AND F.ITEM_CODE = C.CBD_ITEM_CODE"+
                "  LEFT JOIN T_CO_ITEM D " +
                "    ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                " WHERE 1 = 1 " +
                "   AND A.project_id  = ? order by F.PROCESS_ORDER";*/
        String feedDetailSql = "select A.ITEM_CODE,"+
                " D.STOCK_CODE AS ITEM_STOCK,"+
                " A.ITEM_NUM,"+
                " A.FEED_NUM,"+
                " A.RAW_LOTNUMBER AS ITEM_LOT,"+
                " A.PROCESS_ORDER  AS ITEM_ORDER,"+
                "  D.CI_ITEM_NAME  AS ITEM_NAME,"+
                "  A.WORK_SPACE AS FACTORY_CODE,"+
                " A.WORK_SPACE,"+
                " T.PRODUCT_LINE  AS WORK_STATION,"+
                "  A.WAREHOUSE AS WARE_HOUSE "+
                " from T_PM_PROJECT_FEED_DETAIL A "+
                " left join T_CO_ITEM D "+
                "  ON A.ITEM_CODE = D.CI_ITEM_CODE "+
                " LEFT JOIN T_PM_PROJECT_BASE T ON T.PROJECT_ID = A.PROJECT_ID "+
                "  where 1=1 "+
                " AND A.project_id = ? "+
                " order by TO_NUMBER(A.PROCESS_ORDER) ASC ";
        List<Map<String, Object>> list = modelService.listDataSql(feedDetailSql, new Object[]{projectId});

        //  int countSql = modelService.countSql(feedDetailSql, new Object[]{projectId});

        /*-- version:2019/7/18 15:39 | desc:基础信息 --*/
        String sql = "SELECT T1.PROJECT_ID,T5.PRODUCT_MATERIAL,T5.PRODUCT_NAME,T5.LOT_NUMBER,T5.PM_MEMO,T5.PRODUCT_COUNT,T3.FEED_COUNT,T1.RECEIVE_COUNT,T1.VAT_NO,T1.RAW_LICENSE, T4.FEED_NUM "+
                " FROM T_PM_PROJECT_FEED_BASE T1"+
                " LEFT JOIN (SELECT A.PROJECT_ID,SUM(A.ITEM_NUM) AS PREPARE_COUNT FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) T2"+
                " ON T2.PROJECT_ID = T1.PROJECT_ID"+
                " LEFT JOIN (SELECT A.PROJECT_ID,SUM(A.FEED_NUM) AS FEED_COUNT FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) T3"+
                " ON T3.PROJECT_ID = T1.PROJECT_ID"+
                " LEFT JOIN (SELECT A.PROJECT_ID,COUNT(1) AS FEED_NUM FROM T_PM_PROJECT_FEED_DETAIL A WHERE 1=1 GROUP BY A.PROJECT_ID) T4"+
                " ON T4.PROJECT_ID = T1.PROJECT_ID"+
                " LEFT JOIN T_PM_PROJECT_BASE T5 ON T5.PROJECT_ID = T1.PROJECT_ID WHERE T1.PROJECT_ID=?";
        Map<String, String> map11 = modelService.queryForMap(sql, new Object[]{projectId});

        String curUserName = modelAction.getCurrUser().getName();
        map11.put("CUR_USER", curUserName);
        //  map.put("COUNT", StringUtils.toString(countSql));

        /*
         * 阀值信息
         * */
        Object factoryCodeObj = list.get(0).get("FACTORY_CODE");
        String factoryCode = getString(factoryCodeObj);
        Object workStationObj = list.get(0).get("WORK_STATION");
        String workStation = getString(workStationObj);

        String getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                " WHERE 1=1 " +
                "   AND T.Threshold_Type='1' " +
                "   AND T.FACTORY_CODE " + factoryCode +
                "   AND T.WORK_STATION_CODE "+workStation +
                "   AND T.ITEM_CODE IS NULL ";
        Map<String, String> map = modelService.queryForMap(getThresholdSQL);

        if (map == null || map.size()==0) {
            String getThresholdSQL2 = " SELECT T.ID, T.THRESHOLD_NUM " +
                    "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                    " WHERE 1=1 " +
                    "   AND T.Threshold_Type='1' " +
                    "   AND T.FACTORY_CODE " + factoryCode +
                    "   AND T.WORK_STATION_CODE IS NULL " +
                    "   AND T.ITEM_CODE IS NULL ";
            map = modelService.queryForMap(getThresholdSQL2);
        }

        //得到量级里的阀值
        String thresholdID = "";
        if(map!=null && !map.isEmpty()){
            //得到量级表里的阀值ID
            thresholdID = map.get("ID");
        }

        //如果物料有设置阀值,则使用物料的,无则使用上级的;
      /*  for (int i=0; i<list.size(); i++) {
            Map<String, Object> map1 = list.get(i);
            Object itemCodeObj = map1.get("ITEM_CODE");
            if(itemCodeObj!=null && !itemCodeObj.toString().isEmpty()){
                String itemCode = itemCodeObj.toString();
                Object itemFactoryCodeObj = map1.get("WORK_SPACE");
                String itemFactoryCode = getString(itemFactoryCodeObj);
                double planNum = Double.parseDouble(map1.get("ITEM_NUM").toString());
                getThresholdSQL = " SELECT T.ID, T.THRESHOLD_NUM " +
                        "  FROM T_CO_THRESHOLD_CONFIGURATION T " +
                        " WHERE 1=1 " +
                        "   AND T.Threshold_Type='1' " +
                        "   AND T.FACTORY_CODE " + itemFactoryCode +
                        "   AND T.WORK_STATION_CODE "+workStation +
                        "   AND T.ITEM_CODE = '"+itemCode+"' ";
                Map<String, String> map2 = modelService.queryForMap(getThresholdSQL);
                if(map2!=null && !map2.isEmpty()){
                    String itemThresholdNum = getQuantity(modelService, map2.get("ID"), planNum);
                    if(itemThresholdNum!=null && !itemThresholdNum.isEmpty()){
                        list.get(i).put("THRESHOLD_NUM", itemThresholdNum);
                    }else{
                        list.get(i).put("THRESHOLD_NUM", map2.get("THRESHOLD_NUM"));
                    }
                }else{
                    String thresholdNum = getQuantity(modelService, thresholdID, planNum);
                    if(thresholdNum.isEmpty()){
                        list.get(i).put("THRESHOLD_NUM", map.get("THRESHOLD_NUM"));
                    }else{
                        list.get(i).put("THRESHOLD_NUM", thresholdNum);
                    }
                }
            }else{
                list.remove(i);
            }
        }*/

        if(map11.size() > 0){
            CommMethod.mapToEscapeJs(map11);
            // modelAction.setDataMap(map);
            modelAction.setAjaxMap(map11);
        }

        if (list.size() > 0) {
            CommMethod.listToEscapeJs(list);
            // modelAction.setDataList(list);
            modelAction.setAjaxList(list);
        }

        // return modelAction.ActionForwardExeid(modelAction.getExeid());
        return BaseActionSupport.AJAX;
    }

    private String getString(Object object) {
        return object != null && !object.toString().isEmpty() ?
                "= '" + object.toString() + "'" : "IS NULL";
    }

    private String getQuantity(ModelService modelService, String thresholdId, double planInNum) {
        String thresholdNum = "";
        String quantityLevelThresholdSQL = " SELECT T.THRESHOLD_NUM  " +
                "  FROM T_CO_QUANTITY_LEVEL T  " +
                " WHERE 1 = 1  " +
                "   AND T.THRESHOLD_ID = ? " +
                "   AND T.LEVEL_LOW <= ?  " +
                "   AND T.LEVEL_HIGHT > ? ";
        Map<String, Object> map0 = modelService.queryForMap(quantityLevelThresholdSQL,
                new Object[]{thresholdId, planInNum, planInNum});
        if(map0!=null && !map0.isEmpty()){
            thresholdNum = map0.get("THRESHOLD_NUM").toString();
        }
        return thresholdNum;
    }
}
