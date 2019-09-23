package com.more.mes.smt.wmsStockRecheck.oracle;

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
 * @Description 复检超期--获取分页信息
 * @ClassName GetRecheckPageInfo
 * @author WZY
 */
public class GetRecheckPageInfo implements FuncService
{

  @SuppressWarnings("unchecked")
@Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub

    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("dataAuth");//组织机构
    String wsiItemSn = request.getParameter("WSI_ITEM_SN");//物料sn
    String wsiItemCode = request.getParameter("WSI_ITEM_CODE");//物料料号
    String wsiWhCode = request.getParameter("WSI_WH_CODE");//仓库
    String wsiDistrictCode = request.getParameter("WSI_DISTRICT_CODE");//库区
    String wsiStorageCode = request.getParameter("WSI_STORAGE_CODE");//库位
    String wsiReceiveTimeBegin = request.getParameter("WSI_RECEIVE_TIME_BEGIN");//入库时间
    String wsiReceiveTimeEnd = request.getParameter("WSI_RECEIVE_TIME_END");//入库时间
    String wsiRecheckoutBegin = request.getParameter("WSI_RECHECKOUT_BEGIN");//复检到期时间
    String wsiRecheckoutEnd = request.getParameter("WSI_RECHECKOUT_END");//复检到期时间
    String userId = modelAction.getSessionUser().getId();

    String sql = "SELECT distinct t.*,t3.name dept_name,to_char((t.wsi_test_time + c.ci_recheck_days),'yyyy-mm-dd hh24:mi:ss') RECHECKOUT,"
                 + "d.wa_area_name wh_name,"
                 + "CASE WHEN (t.wsi_test_time + c.ci_recheck_days-c.ci_remind_days)<=SYSDATE and SYSDATE<=(t.wsi_test_time + c.ci_recheck_days) THEN '预警'"
                 + " WHEN (t.wsi_test_time + c.ci_recheck_days-c.ci_remind_days)>SYSDATE   THEN '正常' "
                 + " WHEN (t.wsi_test_time + c.ci_recheck_days)<=SYSDATE and c.ci_recheck_days!=0 THEN '超期' "
                 + "ELSE '' END outTime,"
                 + "c.ci_item_name,c.ci_remind_days,c.ci_item_spec,t1.supplier_name,t2.customer,c.ci_recheck_days,"
                 + "to_char(t.wsi_test_time,'yyyy-mm-dd hh24:mi:ss') test_time,"
                 + "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time "
                 + "FROM t_wms_stock_info t "
                 +" LEFT JOIN sy_dept t3 ON t3.id=t.data_auth " 
                 + "LEFT JOIN T_QM_INSEPCT_PARENT_INFO a ON a.qip_sn=t.wsi_item_sn and a.data_auth=t.data_auth "
                 + "LEFT JOIN T_QM_INSPECT_INFO b ON b.qii_inspect_sn=a.qip_inspect_sn and b.data_auth=t.data_auth "
                 + "AND b.qii_list_flag IN('4','5') "
                 + "LEFT JOIN t_co_item c ON c.ci_item_code=t.wsi_item_code and c.data_auth=t.data_auth "
                 + "LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wsi_wh_code and d.data_auth=t.data_auth "
                 + "LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wsi_sup_code and t1.data_auth=t.data_auth "
                 + "LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wsi_cust_code and t2.data_auth=t.data_auth ";

    String sqlWhere = "where 1=1 and c.ci_recheck_days not in (0)";//条件查询
    Map<String, String> map = new HashMap<String, String>();
    if (StringUtils.isNotBlank(dataAuth))
    {
      sqlWhere += " and t.DATA_AUTH =:dataAuth ";
      map.put("dataAuth", dataAuth);
    }
    else{
      sqlWhere += " and t.DATA_AUTH IN (SELECT DEPT_ID FROM SY_DATA_AUTH WHERE USER_ID = :userId ) ";
      map.put("userId", userId); 
    }
    if (StringUtils.isNotBlank(wsiItemSn))
    {
      sqlWhere += " and t.WSI_ITEM_SN LIKE '%' || :wsiItemSn || '%'";
      map.put("wsiItemSn", wsiItemSn);
    }
    if (StringUtils.isNotBlank(wsiItemCode))
    {
      sqlWhere += " and t.wsi_item_code LIKE '%' || :wsiItemCode || '%'";
      map.put("wsiItemCode", wsiItemCode);
    }
    if (StringUtils.isNotBlank(wsiWhCode))
    {
      sqlWhere += " and t.WSI_WH_CODE =:wsiWhCode ";
      map.put("wsiWhCode", wsiWhCode);
    }
    if (StringUtils.isNotBlank(wsiDistrictCode))
    {
      sqlWhere += " and t.WSI_DISTRICT_CODE =:wsiDistrictCode ";
      map.put("wsiDistrictCode", wsiDistrictCode);
    }
    if (StringUtils.isNotBlank(wsiStorageCode))
    {
      sqlWhere += " and t.WSI_STORAGE_CODE =:wsiStorageCode ";
      map.put("wsiStorageCode", wsiStorageCode);
    }
    if (StringUtils.isNotBlank(wsiReceiveTimeBegin))
    {
      sqlWhere += " and t.WSI_RECEIVE_TIME >=to_date(:wsiReceiveTimeBegin,'yyyy-mm-dd HH24:MI:ss')";
      map.put("wsiReceiveTimeBegin", wsiReceiveTimeBegin);
    }
    if (StringUtils.isNotBlank(wsiReceiveTimeEnd))
    {
      sqlWhere += " and t.WSI_RECEIVE_TIME <=to_date(:wsiReceiveTimeEnd,'yyyy-mm-dd HH24:MI:ss')";
      map.put("wsiReceiveTimeEnd", wsiReceiveTimeEnd);
    }

    if (StringUtils.isNotBlank(wsiRecheckoutBegin))
    {
      sqlWhere += " and (t.wsi_test_time + c.ci_recheck_days)  >=to_date(:wsiRecheckoutBegin,'yyyy-mm-dd HH24:MI:ss')";
      map.put("wsiRecheckoutBegin", wsiRecheckoutBegin);
    }

    if (StringUtils.isNotBlank(wsiRecheckoutEnd))
    {
      sqlWhere += " and (t.wsi_test_time + c.ci_recheck_days)  <=to_date(:wsiRecheckoutEnd,'yyyy-mm-dd HH24:MI:ss')";
      map.put("wsiRecheckoutEnd", wsiRecheckoutEnd);
    }

    sql = "select * from(" + sql + sqlWhere
          + " ORDER BY outTime DESC,t.wsi_test_time,t.wsi_receive_time )aa ";

    List itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(itemList);
    modelAction.getAjaxPage().setDataList(itemList);
    return BaseActionSupport.AJAX;
  }

}
