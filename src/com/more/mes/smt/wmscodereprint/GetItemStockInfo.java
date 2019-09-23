package com.more.mes.smt.wmscodereprint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @author development
 */
public class GetItemStockInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String itemSn = request.getParameter("itemSn");
    String labelId = request.getParameter("labelId");
    String type = request.getParameter("type"); // 1、条码重打 2、拆分打印
    Map<String, Object> map = new HashMap<String, Object>();
    List<Map<String, Object>> labelList = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> stockList = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
    String resStr = "";
    String cldSql = "";
    boolean paramError = false;
    boolean paramError2 = false;
    try
    {
      
      // 获取标签数据项信息
      // String sql = "SELECT T.* FROM T_CO_LABEL_DATACONFIGURE T WHERE T.CLD_LABEL_ID=?";
      String sql = " SELECT DISTINCT T.CLD_ITEM_ALIAS, T1.DATA_ITEMS_NAME,T.CLD_COLUMN_NAME "
                   + " FROM T_CO_LABEL_DATACONFIGURE T " + " LEFT JOIN ML_DATA_ITEMS T1 "
                   + " ON T.CLD_LABEL_ID = T1.TEMPLATE_ID  "
                   + " AND T.CLD_ITEM_ALIAS = T1.DATA_ITEMS_ALIAS " 
                   + " WHERE T.CLD_LABEL_ID = ?  ";
      labelList = modelService.listDataSql(sql, new Object[] {labelId});

      String sql2 = "SELECT T.CLD_SQL,T.CLD_CODE_ALIAS,T.CLD_NUM_ALIAS  FROM T_CO_LABEL_DATASOURCE T "
        + "WHERE T.CLD_LABEL_ID=?  ";
      map = modelService.queryForMap(sql2, new Object[] {labelId});

      Map<String, Object> tempMap2 = new HashMap<String, Object>();
      String sql3 = "SELECT T.MSS_MAX_NUM FROM T_WMS_MID_SPLIT_SN T WHERE T.MSS_ITEM_SN=? AND T.DATA_AUTH=? ";
      tempMap2 = modelService.queryForMap(sql3, new Object[] {itemSn,dataAuth});
      if (tempMap2 != null && tempMap2.size() != 0)
      {
        map.put("MSS_MAX_NUM", tempMap2.get("MSS_MAX_NUM"));
      }
      else
      {
        map.put("MSS_MAX_NUM", "0");
      }
      Map<String, Object> tempMap3 = new HashMap<String, Object>();
      String sql4 = "SELECT T.DATA_ITEMS_NAME FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID=? "
        + "AND T.LABEL_COUNT ='Y'  ";
      tempMap3 = modelService.queryForMap(sql4, new Object[] {labelId});
      if (tempMap3 != null && tempMap3.size() != 0)
      {
        map.put("DATA_ITEMS_NUM", tempMap3.get("DATA_ITEMS_NAME"));
      }
      else
      {
        map.put("DATA_ITEMS_NUM", "数量");
      }

      String tempSql = StringUtils.toString(map.get("CLD_SQL"));
      String dataAuthStr="'"+dataAuth+"'";
      
      tempSql=tempSql.replace("{DATA_AUTH}",dataAuthStr);
      
      cldSql = StringUtils.toString(map.get("CLD_SQL"));
      
      cldSql=tempSql;
      // String[] tempSql = cldSql.toUpperCase().split(":");
      cldSql = cldSql.replaceAll(";", "");
      cldSql = cldSql.replaceAll("\\{[^{}]+\\}", "?");
      String[] tempSqls = cldSql.split("\\?", -1);
      int tempLen = tempSqls.length - 1;
      // 20180710 判断多个参数是否一致的情况
      List<String> paramList = new ArrayList<String>();
      Pattern pattern = Pattern.compile("(?<=\\{)(.+?)(?=\\})");
      Matcher matcher = pattern.matcher(tempSql);
      while (matcher.find())
      {
        paramList.add(matcher.group(1));
      }
      if (tempLen != 1)
      {
        boolean tempFlag = false;
        String tempStr = paramList.get(0);
        for (int i = 1; i < paramList.size(); i++ )
        {
          String tempStr2 = paramList.get(i);
          if (!tempStr.equals(tempStr2))
          {
            tempFlag = true;
          }
        }
        if (tempFlag == true)
        {
          paramError = true;
        }
      }
      Object[] params = new Object[tempLen];
      params[0] = itemSn;
      for (int i = 1; i < tempLen; i++ )
      {
        params[i] = itemSn;
      }
      stockList = modelService.listDataSql(cldSql, params);
      if ("2".equals(type))
      {
         //判断该物料是否已冻结，如果已冻结则不允许拆分动作
      String queryCount = "SELECT * FROM T_WMS_FREEZE_INFO WHERE wfi_freeze_flag='1' AND wfi_sn=? AND data_auth=?";
      int count = modelService.countSql(queryCount,new Object[]{itemSn, dataAuth});
      if(count>0){
          modelAction.setAjaxString("isFreeze");
          return BaseActionSupport.AJAX;
      }
        // 拆分打印 判断是否是库存表或物料中间表数据
        String getStockInfoSql = "SELECT T.WSI_ITEM_CODE,T.WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T "
          + "WHERE T.WSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
        tempList = modelService.listDataSql(getStockInfoSql, new Object[] {itemSn,dataAuth});

        if ((tempList == null) || tempList.isEmpty())
        {
          getStockInfoSql = "SELECT T.MSI_ITEM_CODE,T.MSI_ITEM_COUNT FROM T_MID_SPOT_ITEM_INFO T "
            + "WHERE T.MSI_ITEM_SN = ? AND T.DATA_AUTH=? ";
          tempList = modelService.listDataSql(getStockInfoSql, new Object[] {itemSn,dataAuth});

          if ((tempList == null) || tempList.isEmpty())
          {
            stockList = null;
          }
        }
      }
      if (stockList != null && !stockList.isEmpty())
      {
        if ("3".equals(type))
        {
          // 清单打印

          for (int i = 0; i < labelList.size(); i++ )
          {
            String dataItemName = StringUtils.toString(labelList.get(i).get("DATA_ITEMS_NAME"));
            String colName = StringUtils.toString(labelList.get(i).get("CLD_COLUMN_NAME"));
            String otherName = StringUtils.toString(labelList.get(i).get("CLD_ITEM_ALIAS"));
            Map<String, Object> resMap = new HashMap<String, Object>();

            for (int j = 0; j < stockList.size(); j++ )
            {
              Map<String, Object> tempMap = stockList.get(j);
              for (String key : tempMap.keySet())
              {
                String value = StringUtils.toString(tempMap.get(key));
                if (key.equals(colName))
                {
                  // String itemSql =
                  // "SELECT T.* FROM T_CO_LABEL_ITEM_DATASOURCE T WHERE T.CLD_LABEL_ID = ? AND T.CLD_ITEM_ALIAS=?";
                  // List<Map<String, Object>> itemList = modelService.listDataSql(itemSql,
                  // new Object[] {labelId, otherName});
                  resMap.put("CLD_ITEM_ALIAS", otherName);
                  resMap.put("CLD_ITEM_VALUE", value);
                  resMap.put("CLD_COLUMN_NAME", dataItemName);

                }
              }
            }

            String itemSql = "SELECT T.* FROM T_CO_LABEL_ITEM_DATASOURCE T "
              + "WHERE T.CLD_LABEL_ID = ? AND T.CLD_ITEM_ALIAS=? ";
            List<Map<String, Object>> itemList = modelService.listDataSql(itemSql, new Object[] {
              labelId, otherName});
            if (!itemList.isEmpty())
            {
              paramError2 = false;
              String tempSql2 = "SELECT T.* FROM T_CO_LABEL_DATACONFIGURE T "
                + "WHERE T.CLD_LABEL_ID=? AND T.CLD_ITEM_ALIAS=?  ";
              List<Map<String, Object>> tempList2 = modelService.listDataSql(tempSql2,
                new Object[] {labelId, otherName});
              String itemSql2 = StringUtils.toString(tempList2.get(0).get("CLD_SQL"));
              
              String dataAuthStr2="'"+dataAuth+"'";
              itemSql2=itemSql2.replace("{DATA_AUTH}",dataAuthStr2);
              
              resMap.put("CLD_DISPLAY_WAY", itemList.get(0).get("CLD_DISPLAY_WAY"));
              resMap.put("CLD_COLUMN_NAME", dataItemName);
              // String[] tempSql = cldSql.toUpperCase().split(":");
              itemSql2 = itemSql2.replaceAll(";", "");
              itemSql2 = itemSql2.replaceAll("\\{[^{}]+\\}", "?");
              String[] itemSql2s = cldSql.split("\\?", -1);
              int tempLen2 = itemSql2s.length - 1;
              // 20180710 判断多个参数是否一致的情况
              List<String> paramList2 = new ArrayList<String>();
              Pattern pattern2 = Pattern.compile("(?<=\\{)(.+?)(?=\\})");
              Matcher matcher2 = pattern.matcher(tempSql);
              while (matcher.find())
              {
                paramList.add(matcher.group(1));
              }
              if (tempLen != 1)
              {
                boolean tempFlag = false;
                String tempStr = paramList.get(0);
                for (int k = 1; k < paramList.size(); k++ )
                {
                  String tempStr2 = paramList.get(k);
                  if (!tempStr.equals(tempStr2))
                  {
                    tempFlag = true;
                  }
                }
                if (tempFlag == true)
                {
                  paramError2 = true;
                }
              }
              Object[] params2 = new Object[tempLen];
              params2[0] = itemSn;
              for (int k = 1; k < tempLen; k++ )
              {
                params2[k] = itemSn;
              }
              List<Map<String, Object>> stockList2 = new ArrayList<Map<String, Object>>();
              stockList2 = modelService.listDataSql(itemSql2, params2);
              if (stockList2 != null && !stockList2.isEmpty())
              {
                resMap.put("CLD_TITLE_INFO", itemList);
                resMap.put("CLD_ITEM_INFO", stockList2);
              }
            }
            else
            {
              resMap.put("CLD_DISPLAY_WAY", "0");
              resMap.put("CLD_TITLE_INFO", null);
              resMap.put("CLD_ITEM_INFO", null);
            }

            resList.add(resMap);
          }
        }
        else
        {
          // 条码打印 拆分打印
          for (int i = 0; i < labelList.size(); i++ )
          {
            String colName = StringUtils.toString(labelList.get(i).get("CLD_COLUMN_NAME"));
            String otherName = StringUtils.toString(labelList.get(i).get("CLD_ITEM_ALIAS"));
            Map<String, Object> resMap = new HashMap<String, Object>();
            for (int j = 0; j < stockList.size(); j++ )
            {
              Map<String, Object> tempMap = stockList.get(j);
              for (String key : tempMap.keySet())
              {
                String value = StringUtils.toString(tempMap.get(key));
                if (key.equals(colName))
                {
                  resMap.put("CLD_ITEM_ALIAS", otherName);
                  resMap.put("CLD_ITEM_VALUE", value);
                  resMap.put("CLD_COLUMN_NAME", colName);
                }
              }
            }
            resList.add(resMap);
          }
        }
      }
      else
      {
        resStr = "FALSE";
      }
    }
    catch (Exception e)
    {
      log.error(e);
      resStr = "ERROR";
    }
    // if (stockList == null || stockList.isEmpty())
    // {
    // resStr = "FALSE";
    // }
    if ("".equals(cldSql) || cldSql == null)
    {
      resStr = "SQLFALSE";
    }
    if (stockList == null || stockList.isEmpty())
    {
      if (!"".equals(cldSql) && cldSql != null)
      {
        // 拆分打印 数据源配置错误
        resStr = "SQLFALSE2";
      }
    }
    if (paramError == true || paramError2 == true)
    {
      // 参数个数错误
      resStr = "SQLFALSE3";
    }
    resStr=labelId;
    modelAction.setAjaxString(resStr);
    modelAction.setAjaxList(resList);
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }
}
