package com.more.mes.smt.msdmessage;

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
import com.more.mcmes.productcontrol.WorkOrderIssuedSave;

/**
 * @Title 物料中间信息表
 * @Description 物料中间信息表-分页
 * @ClassName WorkOrderIssuedSave
 * @author wzy
 * @version 1.0 developer 2017-8-7 created
 * @see WorkOrderIssuedSave
 * @since 2017-8-7
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GetMinInfoPage implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request =modelAction.getRequest();
    
    String wmiItemSn = request.getParameter("WMI_ITEM_SN");
    
    String wmiPo = request.getParameter("WMI_PO");
    
    String wmiProjectId = request.getParameter("WMI_PROJECT_ID");
    
    String supplierName = request.getParameter("SUPPLIER_NAME");
    
    String wmiItemCode = request.getParameter("WMI_ITEM_CODE");
    String dataAuth = request.getParameter("dataAuth");
    String userId = modelAction.getSessionUser().getId();
    
    String sqlWhere=" where 1=1";
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataAuth)){
      sqlWhere+=" and m.DATA_AUTH =:dataAuth1 ";
      map.put("dataAuth1", dataAuth);
    }else {
	        	sqlWhere += " and m.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId1 ) ";
				map.put("userId1", userId); 

	        }
    if (StringUtils.isNotBlank(wmiItemSn))
    {
      sqlWhere+=" and m.WMI_ITEM_SN like '%' || :wmiItemSn || '%' ";
      map.put("wmiItemSn", wmiItemSn);
    }
    
    if (StringUtils.isNotBlank(wmiPo))
    {
      sqlWhere+=" and m.WMI_PO like '%' || :wmiPo || '%'";
      map.put("wmiPo", wmiPo);
    }
    
    if (StringUtils.isNotBlank(wmiProjectId))
    {
      
      sqlWhere+=" and m.WMI_PROJECT_ID like '%' || :wmiProjectId || '%'";
      map.put("wmiProjectId", wmiProjectId);
    }
    
    if (StringUtils.isNotBlank(supplierName))
    {
      sqlWhere+=" and h.SUPPLIER_NAME like '%' || :supplierName || '%' ";
      map.put("supplierName", supplierName);
    }
    
    if (StringUtils.isNotBlank(wmiItemCode))
    {
      sqlWhere+=" and m.WMI_ITEM_CODE like '%' || :wmiItemCode || '%'";
      map.put("wmiItemCode", wmiItemCode);
    }
    
    
    String sqlWhere1=" where 1=1 ";
    
    if(StringUtils.isNotBlank(dataAuth)){
      sqlWhere1+=" and l.DATA_AUTH =:dataAuth2 ";
      map.put("dataAuth2", dataAuth);
    }else {
	        	sqlWhere1 += " and l.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId2 ) ";
				map.put("userId2", userId); 

	        }
    if (StringUtils.isNotBlank(wmiItemSn))
    {
      sqlWhere1+=" and l.WMI_ITEM_SN like '%' || :wmiItemSn1 || '%' ";
      map.put("wmiItemSn1", wmiItemSn);
    }
    
    if (StringUtils.isNotBlank(wmiPo))
    {
      sqlWhere1+=" and l.WMI_PO like '%' || :wmiPo1 || '%' ";
      map.put("wmiPo1", wmiPo);
    }
    
    if (StringUtils.isNotBlank(wmiProjectId))
    {
      
      sqlWhere1+=" and l.WMI_PROJECT_ID like '%' || :wmiProjectId1 || '%'";
      map.put("wmiProjectId1", wmiProjectId);
    }
    
    if (StringUtils.isNotBlank(supplierName))
    {
      sqlWhere1+=" and w.SUPPLIER_NAME like '%' || :supplierName1 || '%' ";
      map.put("supplierName1", supplierName);
    }
    
    if (StringUtils.isNotBlank(wmiItemCode))
    {
      sqlWhere1+=" and l.WMI_ITEM_CODE like '%' || :wmiItemCode1 || '%'";
      map.put("wmiItemCode1", wmiItemCode);
    }
    
    
    String sql="select m.id,t1.name dept_name, m.WMI_MANUFACTURER,to_char(m.WMI_PRODUCE_DATE,'yyyy-mm-dd HH24:MI:ss') as WMI_PRODUCE_DATE,to_char(m.WMI_CREATE_DATE,'yyyy-mm-dd HH24:MI:ss') as WMI_CREATE_DATE,t.CI_ITEM_NAME,t.CI_ITEM_SPEC, "
      +" m.WMI_FOURTH_SN,m.WMI_QUALITY_STATUS,m.WMI_PROJECT_ID,m.WMI_CUST_CODE,m.WMI_MO_NUMBER,m.WMI_ITEM_SN,"+
      " m.WMI_DOC_NO,m.WMI_PO,m.WMI_SN_NUM,m.WMI_ITEM_SEQ,m.WMI_LOT_NO,m.WMI_ITEM_TYPE,m.WMI_ITEM_CODE,m.WMI_SUP_CODE,m.WMI_SUP_LOT,"+
      " m.WMI_FIRST_SN,m.WMI_SECOND_SN,m.WMI_THIRD_SN,r.CUSTOMER,h.SUPPLIER_NAME"+
      "  from T_WMS_MID_ITEM m"+
      " LEFT JOIN sy_dept t1 ON t1.id=m.data_auth " +
      " left join T_CO_ITEM t on t.CI_ITEM_CODE=m.WMI_ITEM_CODE and m.DATA_AUTH=t.DATA_AUTH"+
      "  left join T_CO_CUSTOMER r on r.CUST_CODE=m.WMI_CUST_CODE and m.DATA_AUTH=r.DATA_AUTH"+
      "  left join t_co_supplier h on h.SUPPLIER_CODE=m.WMI_SUP_CODE and m.DATA_AUTH=h.DATA_AUTH"
      + sqlWhere +
      "  UNION ALL "+
      " select l.id,t2.name dept_name, l.WMI_MANUFACTURER,to_char(l.WMI_PRODUCE_DATE,'yyyy-mm-dd HH24:MI:ss') as WMI_PRODUCE_DATE,to_char(l.WMI_CREATE_DATE,'yyyy-mm-dd HH24:MI:ss') as WMI_CREATE_DATE,o.CI_ITEM_NAME,o.CI_ITEM_SPEC, "+
      " l.WMI_FOURTH_SN,l.WMI_QUALITY_STATUS,l.WMI_PROJECT_ID,l.WMI_CUST_CODE,l.WMI_MO_NUMBER,l.WMI_ITEM_SN,"+
      " l.WMI_DOC_NO,l.WMI_PO,l.WMI_SN_NUM,l.WMI_ITEM_SEQ,l.WMI_LOT_NO,l.WMI_ITEM_TYPE,l.WMI_ITEM_CODE,l.WMI_SUP_CODE,l.WMI_SUP_LOT,"+
      " l.WMI_FIRST_SN,l.WMI_SECOND_SN,l.WMI_THIRD_SN,s.CUSTOMER,w.SUPPLIER_NAME"+
      "  from T_WMS_MID_ITEM_L l"+
      " LEFT JOIN sy_dept t2 ON t2.id=l.data_auth " +
      " left join T_CO_ITEM o on o.CI_ITEM_CODE=l.WMI_ITEM_CODE and l.DATA_AUTH=o.DATA_AUTH "+
      "  left join T_CO_CUSTOMER s on s.CUST_CODE=l.WMI_CUST_CODE and l.DATA_AUTH=s.DATA_AUTH "
      +"  left join t_co_supplier w on w.SUPPLIER_CODE=l.WMI_SUP_CODE and l.DATA_AUTH=w.DATA_AUTH "
      + sqlWhere1 
      +" and l.wmi_item_sn not in(select wmi_item_sn from T_WMS_MID_ITEM)";
    
    
    String sql1 = "select * from ("+sql+")aa ";
    
    
    List list = modelService.listSql(sql1, modelAction.getPage(), map, null, null);
 
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(list);
    modelAction.getAjaxPage().setDataList(list);
    
    return BaseActionSupport.AJAX;
   
  }

}
