package com.more.mes.smt.secondarytest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    Map<String, Object> paraMap = new HashMap<String, Object>();
    String inspectSn = modelAction.getParaMap().get("inspectSn");
    String itemCode = modelAction.getParaMap().get("itemCode");
    String itemSn = modelAction.getParaMap().get("itemSn");
    String supCode = modelAction.getParaMap().get("supCode");
    String custCode = modelAction.getParaMap().get("custCode");
    String state = modelAction.getParaMap().get("state");
    String dataAuth = modelAction.getParaMap().get("dataAuth");

    String sql = "SELECT T.QIP_INSPECT_SN, "
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
                 + " ON T.QIP_TEST_EMP = T2.ID  " + " LEFT JOIN T_CO_CUSTOMER T3 "
                 + " ON T1.QII_CUST_CODE = T3.CUST_CODE  AND T3.DATA_AUTH= :DATA_AUTH4 "
                 + " LEFT JOIN T_CO_SUPPLIER T4 "
                 + " ON T1.QII_CUST_CODE = T4.SUPPLIER_CODE  AND T4.DATA_AUTH= :DATA_AUTH5 "
                 + " WHERE  " + " T1.DATA_AUTH= :DATA_AUTH2 " + " ";
    paraMap.put("DATA_AUTH1", dataAuth);
    paraMap.put("DATA_AUTH2", dataAuth);
    paraMap.put("DATA_AUTH4", dataAuth);
    paraMap.put("DATA_AUTH5", dataAuth);
    String sqlWhere = "0";
    if (StringUtils.isNotBlank(inspectSn))
    {
      sql += " AND T1.QII_INSPECT_SN like '%' || :QIP_INSPECT_SN || '%'";
      paraMap.put("QIP_INSPECT_SN", inspectSn);
      sqlWhere = "1";
    }
    if (StringUtils.isNotBlank(itemSn))
    {
      sql += " AND T.QIP_SN like '%' || :QIP_SN || '%'";
      paraMap.put("QIP_SN", itemSn);
      sqlWhere = "1";
    }
    if (StringUtils.isNotBlank(itemCode))
    {
      sql += " AND T1.QII_ITEM_CODE = :QIP_ITEM_CODE ";
      paraMap.put("QIP_ITEM_CODE", itemCode);
      sqlWhere = "1";
    }
    if (StringUtils.isNotBlank(supCode))
    {
      sql += " AND T1.QII_CUST_CODE = :SUPPLIER_CODE ";
      paraMap.put("SUPPLIER_CODE", supCode);
      sqlWhere = "1";
    }
    if (StringUtils.isNotBlank(custCode))
    {
      sql += " AND T1.QII_CUST_CODE = :QII_CUST_CODE ";
      paraMap.put("QII_CUST_CODE", custCode);
      sqlWhere = "1";
    }
    if (StringUtils.isNotBlank(state))
    {
      if ("4".equals(state))
      {
        sql += " AND  (T1.QII_LIST_FLAG = :QII_LIST_FLAG AND T.QIP_TEST_RESULT = '2')";
        //sql += " AND T1.QII_LIST_FLAG = :QII_LIST_FLAG ";
        paraMap.put("QII_LIST_FLAG", state);
      }
      if ("5".equals(state))
      {
        sql += " AND T1.QII_LIST_FLAG = :QII_LIST_FLAG ";
        paraMap.put("QII_LIST_FLAG", state);
      }
      sqlWhere = "1";
    }
    //if ("0".equals(sqlWhere))
    //{
      sql += " AND  ((T1.QII_LIST_FLAG = '4' AND T.QIP_TEST_RESULT = '2')  OR T1.QII_LIST_FLAG = '5' ) ";
    //}
    List itemList = modelService.listSql(sql, modelAction.getPage(), paraMap, null, null);
    CommMethod.listToEscapeJs(itemList);
    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
