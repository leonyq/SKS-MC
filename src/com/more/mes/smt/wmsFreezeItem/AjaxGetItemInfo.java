package com.more.mes.smt.wmsFreezeItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料信息
 * 
 * @author development
 */
public class AjaxGetItemInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String type = modelAction.getParaMap().get("type");
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
    String flag = request.getParameter("flag");
    Map<String, String> map = new HashMap<String, String>();
    String sql = "";
    List itemList = null;
    if ("empty".equals(flag))
    {
      itemList = null;
    }
    else
    {
      if ("1".equals(type))
      {
        sql = "SELECT T.WSI_ITEM_SN ITEM_SN,T.ID,T.WSI_ITEM_CODE  ITEM_CODE, "
              + " T.WSI_LOT_NO     ITEM_LOT, " + " T1.CI_ITEM_NAME  ITEM_NAME, "
              + " T1.CI_ITEM_SPEC  ITEM_SPEC, " + " T2.CUSTOMER      CUST_NAME, "
              + " T3.SUPPLIER_NAME SUP_NAME, " + " T.WSI_ITEM_NUM   ITEM_NUM, "
              + " T4.WA_AREA_NAME  WH_NAME " + " FROM T_WMS_STOCK_INFO T "
              + " LEFT JOIN T_CO_ITEM T1 " + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE and t.DATA_AUTH=t1.DATA_AUTH "
              + " LEFT JOIN T_CO_CUSTOMER T2 " + " ON T.WSI_CUST_CODE = T2.CUST_CODE and t.DATA_AUTH=t2.DATA_AUTH "
              + " LEFT JOIN T_CO_SUPPLIER T3 " + " ON T.WSI_SUP_CODE = T3.SUPPLIER_CODE and t.DATA_AUTH=t3.DATA_AUTH "
              + " LEFT JOIN T_WMS_AREA T4 " + " ON T.WSI_WH_CODE = T4.WA_AREA_SN and t.DATA_AUTH=t4.DATA_AUTH "
              + " WHERE T.WSI_FREEZE_FLAG = 'N' and  t.DATA_AUTH=:auth ";
        
      }
      else
      {
        sql = "SELECT T.WSI_ITEM_SN ITEM_SN,T.ID,T.WSI_ITEM_CODE  ITEM_CODE, "
              + " T.WSI_LOT_NO     ITEM_LOT, " + " T1.CI_ITEM_NAME  ITEM_NAME, "
              + " T1.CI_ITEM_SPEC  ITEM_SPEC, " + " T2.CUSTOMER      CUST_NAME, "
              + " T3.SUPPLIER_NAME SUP_NAME, " + " T.WSI_ITEM_NUM   ITEM_NUM, "
              + " T4.WA_AREA_NAME  WH_NAME " + " FROM T_WMS_STOCK_INFO T "
              + " LEFT JOIN T_CO_ITEM T1 " + " ON T.WSI_ITEM_CODE = T1.CI_ITEM_CODE and t.DATA_AUTH=t1.DATA_AUTH "
              + " LEFT JOIN T_CO_CUSTOMER T2 " + " ON T.WSI_CUST_CODE = T2.CUST_CODE and t.DATA_AUTH=t2.DATA_AUTH "
              + " LEFT JOIN T_CO_SUPPLIER T3 " + " ON T.WSI_SUP_CODE = T3.SUPPLIER_CODE and t.DATA_AUTH=t3.DATA_AUTH "
              + " LEFT JOIN T_WMS_AREA T4 " + " ON T.WSI_WH_CODE = T4.WA_AREA_SN and t.DATA_AUTH=t4.DATA_AUTH "
              + " WHERE T.WSI_FREEZE_FLAG = 'Y' and  t.DATA_AUTH=:auth ";
      }
      map.put("auth", auth);
      itemList = modelService.listSql(sql, modelAction.getPage(), map,  null, null);
    }
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
