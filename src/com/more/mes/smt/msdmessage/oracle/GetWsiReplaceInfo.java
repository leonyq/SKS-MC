package com.more.mes.smt.msdmessage.oracle;

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

public class GetWsiReplaceInfo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");
    String timeBegin = request.getParameter("timeBegin");
    String timeEnd = request.getParameter("timeEnd");
    String userId = modelAction.getSessionUser().getId();
    String searchSql = " where 1=1 "; //查询条件
    Map<String, String> map = new HashMap<String, String>();
    if(StringUtils.isNotBlank(dataAuth)){
      searchSql+=" and t.DATA_AUTH =:dataAuth ";
      map.put("dataAuth", dataAuth);
    }else {
    	searchSql += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId ) ";
		map.put("userId", userId);       	
    }
    
    if (StringUtils.isNotBlank(timeBegin))
    {
      searchSql += " and T.WSI_RECEIVE_TIME >=to_timestamp(:timeBegin,'yyyy-mm-dd HH24:MI:ss')";
      map.put("timeBegin", timeBegin);
    }
    if (StringUtils.isNotBlank(timeEnd))
    {
      searchSql += " and T.WSI_RECEIVE_TIME <=to_timestamp(:timeEnd,'yyyy-mm-dd HH24:MI:ss')";
      map.put("timeEnd", timeEnd);
    }
    
   
    String sql = "SELECT distinct t.*,t1.name dept_name,t2.ci_item_name,t2.ci_item_spec,t3.supplier_name," +
        "t4.customer,to_char(t.wsi_invalid_date,'yyyy-mm-dd') invalid_date," +
        "t5.wa_area_name wh_name,t6.wa_area_name district_name,t7.wa_area_name storage_name," +
        "t8.cr_item_replace,t8.cr_item_name,t8.cr_item_desc,"+
        "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time," +
        "to_char(t.wsi_produce_date,'yyyy-mm-dd') produce_date," +
        "round(SYSDATE-t.wsi_invalid_date,2) EXTEND_TIME,round(SYSDATE-t.wsi_receive_time,2) DULL_TIME " +
        "FROM T_WMS_STOCK_INFO t " +
        "LEFT JOIN sy_dept t1 ON t1.id=t.data_auth " +
        "LEFT JOIN t_co_item t2 ON t2.ci_item_code=t.wsi_item_code and t.data_auth=t2.data_auth " +
        "LEFT JOIN t_co_supplier t3 ON t3.supplier_code=t.wsi_sup_code and t.data_auth=t3.data_auth " +
        "LEFT JOIN t_co_customer t4 ON t4.cust_code=t.wsi_cust_code and t.data_auth=t4.data_auth " +
        "LEFT JOIN t_wms_area t5 ON t5.wa_area_sn=t.wsi_wh_code and t.data_auth=t5.data_auth " +
        "LEFT JOIN t_wms_area t6 ON t6.wa_area_sn=t.wsi_district_code and t.data_auth=t6.data_auth " +
        "LEFT JOIN t_wms_area t7 ON t7.wa_area_sn=t.wsi_storage_code and t.data_auth=t7.data_auth "+
        "LEFT JOIN t_co_item_replace t8 ON t8.cr_item_mian = t.wsi_item_code and t.data_auth=t8.data_auth ";
    String sql1 = sql + searchSql + " order by t.WSI_DOC_NUM ";
    List itemList = modelService.listSql(sql1, modelAction.getPage(), map, null,null);
    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
