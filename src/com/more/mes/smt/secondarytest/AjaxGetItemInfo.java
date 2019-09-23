package com.more.mes.smt.secondarytest;

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
    String dataAuth = request.getParameter("dataAuth");

    String sql = "";
    List itemList = null;

    sql = "SELECT T.QIP_INSPECT_SN, "
          + " T.QIP_SN, "
          + " T.QIP_TEST_RESULT, "
          + " T.QIP_DOC_NUM, "
          + " T.QIP_ITEM_NUM, "
          + " T.QIP_TEST_NUM, "
          + " T.QIP_SCARP_NUM, "
          + " T.QIP_ERROR_NUM, "
          + " T.QIP_ITEM_CODE, "
          + " T.QIP_TEST_TIME, "
          + " T2.NAME, "
          + " T1.QII_LIST_FLAG, "
          + " T1.QII_CUST_CODE, "
          + " T3.CUSTOMER, "
          + " T4.SUPPLIER_NAME "
          + " FROM (SELECT A.* "
          + " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY B.QIP_SN ORDER BY B.CREATE_TIME DESC) RN, "
          + " B.* " + " FROM T_QM_INSEPCT_PARENT_INFO B WHERE B.DATA_AUTH= :DATA_AUTH1) A "
          + " WHERE A.RN = 1) T " + " LEFT JOIN T_QM_INSPECT_INFO T1 "
          + " ON T.QIP_INSPECT_SN = T1.QII_INSPECT_SN " + " LEFT JOIN SY_USER T2 "
          + " ON T.QIP_TEST_EMP = T2.ID " + " LEFT JOIN T_CO_CUSTOMER T3 "
          + " ON T1.QII_CUST_CODE = T3.CUST_CODE  AND T3.DATA_AUTH= :DATA_AUTH4 " + " LEFT JOIN T_CO_SUPPLIER T4 "
          + " ON T1.QII_CUST_CODE = T4.SUPPLIER_CODE AND T4.DATA_AUTH= :DATA_AUTH5 "
          + " WHERE (T1.QII_LIST_FLAG = '4' AND T.QIP_TEST_RESULT = '2') "
          + " OR T1.QII_LIST_FLAG = '5' "
          + " AND T1.DATA_AUTH= :DATA_AUTH2 "
          + " ";
    Map<String, Object> paraMap = new HashMap<String, Object>();
    paraMap.put("DATA_AUTH1", dataAuth);
    paraMap.put("DATA_AUTH2", dataAuth);
    //paraMap.put("DATA_AUTH3", dataAuth);
    paraMap.put("DATA_AUTH4", dataAuth);
    paraMap.put("DATA_AUTH5", dataAuth);
    itemList = modelService.listSql(sql, modelAction.getPage(), paraMap, null, null);
    CommMethod.listToEscapeJs(itemList);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}