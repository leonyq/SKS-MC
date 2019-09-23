package com.more.mes.smt.wmsFreezeItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 物料信息分页及查询
 * 
 * @author development
 */
public class AjaxPageItemInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String type = modelAction.getParaMap().get("type");
    HttpServletRequest request = modelAction.getRequest();
    String startDate = modelAction.getParaMap().get("startDate");
    String endDate = modelAction.getParaMap().get("endDate");
    String itemSN = modelAction.getParaMap().get("itemSN");
    String itemCode = modelAction.getParaMap().get("itemCode");
    String whCode = modelAction.getParaMap().get("whCode");
    String custCode = modelAction.getParaMap().get("custCode");
    String supCode = modelAction.getParaMap().get("supCode");
    String lotNo = modelAction.getParaMap().get("lotNo");
    String productStartDate = modelAction.getParaMap().get("productStartDate");//生产开始时间
    String productEndDate = modelAction.getParaMap().get("productEndDate");//生产结束时间
    String connectDoc = modelAction.getParaMap().get("connectDoc");//关联表单
    String inspectSn = modelAction.getParaMap().get("inspectSn");//检验表单
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    //String pageFlag = request.getParameter("page.pageRecord");
    
    String sql = "SELECT DISTINCT T.WSI_ITEM_SN ITEM_SN,T.ID,T.WSI_ITEM_CODE  ITEM_CODE, "
                 + " T.WSI_LOT_NO     ITEM_LOT, " + " T1.CI_ITEM_NAME  ITEM_NAME, "
                 + " T1.CI_ITEM_SPEC  ITEM_SPEC, " + " T2.CUSTOMER      CUST_NAME, "
                 + " T3.SUPPLIER_NAME SUP_NAME, " + " T.WSI_ITEM_NUM   ITEM_NUM, "
                 + " T4.WA_AREA_NAME  WH_NAME " + " FROM T_WMS_STOCK_INFO T "
                 + " LEFT JOIN T_CO_ITEM T1 " + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE and t1.DATA_AUTH=t.DATA_AUTH "
                 + " LEFT JOIN T_CO_CUSTOMER T2 " + " ON T.WSI_CUST_CODE = T2.CUST_CODE and t2.DATA_AUTH=t.DATA_AUTH "
                 + " LEFT JOIN T_CO_SUPPLIER T3 " + " ON T.WSI_SUP_CODE = T3.SUPPLIER_CODE and t3.DATA_AUTH=t.DATA_AUTH "
                 + " LEFT JOIN T_WMS_AREA T4 " + " ON T.WSI_WH_CODE = T4.WA_AREA_SN and t4.DATA_AUTH=t.DATA_AUTH "
                 + " LEFT JOIN T_QM_INSPECT_INFO T5 ON T.WSI_ITEM_CODE = T5.QII_ITEM_CODE and t5.DATA_AUTH=t.DATA_AUTH where 1=1 and t.DATA_AUTH=:auth ";
    
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("auth", auth);
    if ("1".equals(type))
    {
      sql += " AND T.WSI_FREEZE_FLAG = 'N' ";
    }
    else
    {
    	sql += " AND T.WSI_FREEZE_FLAG = 'Y' ";
    }

    if (StringUtils.isNotBlank(startDate) && StringUtils.isNotBlank(endDate))
    {
    	sql += "AND T.WSI_RECEIVE_TIME BETWEEN(TO_DATE(:startDate,'yyyy-MM-dd HH24:mi:ss')) " +
    			"AND (TO_DATE(:endDate,'yyyy-MM-dd HH24:mi:ss'))";
    	sqlParaMap.put("startDate", startDate);
    	sqlParaMap.put("endDate", endDate);
    }
    else
    {
      if (StringUtils.isNotBlank(startDate))
      {
    	  sql += "AND T.WSI_RECEIVE_TIME >= TO_DATE(:startDate,'yyyy-MM-dd HH24:mi:ss')";
    	  sqlParaMap.put("startDate", startDate);
      }
      if (StringUtils.isNotBlank(endDate))
      {
    	  sql += "AND T.WSI_RECEIVE_TIME <= TO_DATE(:endDate,'yyyy-MM-dd HH24:mi:ss' )";
    	  sqlParaMap.put("endDate", endDate);
      }
    }
    if (StringUtils.isNotBlank(itemSN))
    {
    	sql += " AND T.WSI_ITEM_SN like '%' || :itemSN || '%' ";
    	sqlParaMap.put("itemSN", itemSN);
    }
    if (StringUtils.isNotBlank(itemCode))
    {
    	sql += " AND T.WSI_ITEM_CODE =:itemCode ";
    	sqlParaMap.put("itemCode", itemCode);
    }
    if (StringUtils.isNotBlank(whCode))
    {
    	sql += " AND T.WSI_WH_CODE =:whCode ";
    	sqlParaMap.put("whCode", whCode);
    }
    if (StringUtils.isNotBlank(custCode))
    {
    	sql += " AND T.WSI_CUST_CODE =:custCode ";
    	sqlParaMap.put("custCode", custCode);
    }
    if (StringUtils.isNotBlank(supCode))
    {
    	sql += " AND T.WSI_SUP_CODE =:supCode ";
    	sqlParaMap.put("supCode", supCode);
    }
    if (StringUtils.isNotBlank(lotNo))
    {
    	sql += " AND T.WSI_LOT_NO like '%' || :lotNo || '%' ";
    	sqlParaMap.put("lotNo", lotNo);
    }
    
    if (StringUtils.isNotBlank(productStartDate))
    {
    	sql += "AND T.WSI_PRODUCE_DATE >= TO_DATE(:productStartDate,'yyyy-MM-dd') ";
    	sqlParaMap.put("productStartDate", productStartDate);
    }
    if (StringUtils.isNotBlank(productEndDate))
    {
    	sql += "AND T.WSI_PRODUCE_DATE <= TO_DATE(:productEndDate,'yyyy-MM-dd' ) ";
    	sqlParaMap.put("productEndDate", productEndDate);
    }
    if (StringUtils.isNotBlank(connectDoc))
    {
    	sql += " AND T.WSI_CONNECT_DOC =:connectDoc ";
    	sqlParaMap.put("connectDoc", connectDoc);
    }
    if (StringUtils.isNotBlank(inspectSn))
    {
    	sql += " AND T5.QII_INSPECT_SN =:inspectSn ";
    	sqlParaMap.put("inspectSn", inspectSn);
    }
    sql+=" group by T.WSI_ITEM_SN ,\r\n" + 
    		"                T.ID,\r\n" + 
    		"                T.WSI_ITEM_CODE  ,\r\n" + 
    		"                T.WSI_LOT_NO     ,\r\n" + 
    		"                T1.CI_ITEM_NAME  ,\r\n" + 
    		"                T1.CI_ITEM_SPEC  ,\r\n" + 
    		"                T2.CUSTOMER      ,\r\n" + 
    		"                T3.SUPPLIER_NAME ,\r\n" + 
    		"                T.WSI_ITEM_NUM   ,\r\n" + 
    		"                T4.WA_AREA_NAME ";
    List itemList = null;
    sql="select * from ("+sql+")";
   // if(pageFlag==null || pageFlag.trim().equals("")){
   //     itemList = modelService.listSql(sql, null, sqlParaMap, null, null);
   // }else{
        itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
    //}
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
