package com.more.mes.smt.wmsStockRecheck.pg;


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
 * @Description 复检超期--获取信息
 * @ClassName GetRecheckInfo
 * @author WZY
 */
public class GetRecheckInfo implements FuncService
{

  @SuppressWarnings({"unchecked", "rawtypes"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("DATA_AUTH");

    String sql = "SELECT t.*,to_char((t.wsi_test_time + (c.ci_recheck_days || 'day')::interval),'yyyy-mm-dd hh24:mi:ss') RECHECKOUT,"
                 + "d.wa_area_name wh_name,"
                 + "CASE WHEN (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval - (c.ci_remind_days || 'day')::interval)<=now()"
                 +" and now()<=(t.wsi_test_time + (c.ci_recheck_days || 'day')::interval) THEN '预警'"
                 + " WHEN (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval - (c.ci_remind_days || 'day')::interval)>now() THEN '正常' "
                 + " WHEN (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval)<=now() and c.ci_recheck_days!=0 THEN '超期' "
                 + "ELSE '' END outTime,"
                 + "c.ci_item_name,c.ci_remind_days,c.ci_item_spec,t1.supplier_name,t2.customer,c.ci_recheck_days,"
                 + "to_char(t.wsi_test_time,'yyyy-mm-dd hh24:mi:ss') test_time,"
                 + "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time "
                 + "FROM t_wms_stock_info t "
                 + "LEFT JOIN T_QM_INSEPCT_PARENT_INFO a ON a.qip_sn=t.wsi_item_sn "
                 + "LEFT JOIN T_QM_INSPECT_INFO b ON b.qii_inspect_sn=a.qip_inspect_sn "
                 + "AND b.qii_list_flag IN('4','5') "
                 + "LEFT JOIN t_co_item c ON c.ci_item_code=t.wsi_item_code "
                 + "LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wsi_wh_code "
                 + "LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wsi_sup_code "
                 + "LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wsi_cust_code ";

    String sqlWhere = "where 1=1 and c.ci_recheck_days not in (0)";
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " and t.DATA_AUTH =:dataAuth ";
      map.put("dataAuth", dataAuth);
    }

    sql = "select * from(" + sql + sqlWhere
          + " ORDER BY outTime DESC,t.wsi_test_time,t.wsi_receive_time )aa ";

    List itemList = modService.listSql(sql, modelAction.getPage(), map, null, null);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
