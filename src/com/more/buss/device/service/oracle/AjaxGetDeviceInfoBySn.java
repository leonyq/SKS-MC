package com.more.buss.device.service.oracle;

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
 * 根据设备SN获取设备信息
 * @author Administrator
 *
 */
public class AjaxGetDeviceInfoBySn implements FuncService {

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String deviceSn = request.getParameter("deviceSn");  //设备Sn
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if(StringUtils.isNotBlank(deviceSn)){
      String sql = "select t.CD_DEVICE_SN,t.CD_DEVICE_NAME,a.cdii_item_code,a.cdii_item_name,a.cdii_cycle," +
          "b.value DEVICE_TYPE_NAME,c.value DEVICE_CLASS_NAME,e.ca_name,e.ca_id,f.CDP_PLAN_SN " +
          "from T_CO_DEVICE t " +
          "LEFT JOIN T_CO_DEVICE_ITEM_INFO a ON a.cdii_device_sn=t.cd_device_sn and a.data_auth=? " +
          "LEFT JOIN SY_DICT_VAL b ON t.cd_device_type=b.code AND b.dict_code='DEVICE_TYPE' "+
          "LEFT JOIN SY_DICT_VAL c ON t.cd_device_class=c.code AND c.dict_code='DEVICE_CLASS' "+
          "LEFT JOIN T_CO_AREA_DEVICE d ON t.id=d.cad_device_id  and d.data_auth=? "+
          "LEFT JOIN T_CO_AREA e ON d.ca_id=e.ca_id  and e.data_auth=? "+
          "LEFT JOIN T_CO_DEVICE_PLAN_CONNECT f ON f.CDPI_DEVICE_SN = t.cd_device_sn   " +
          "and f.cdpi_item_code = a.cdii_item_code and f.data_auth=? "+
          "WHERE t.cd_device_sn = ? AND t.DATA_AUTH=? AND a.cdii_item_type='保养项目' ";
      List sList = modelService.listDataSql(sql, new Object[] { dataAuth,dataAuth,dataAuth,dataAuth,deviceSn,dataAuth });
      modelAction.setAjaxList(sList);
    }else{
      String areaId = request.getParameter("areaId");
      //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
      String delsql = "select t.CD_DEVICE_SN,t.CD_DEVICE_NAME,a.cdii_item_code,a.cdii_item_name,a.cdii_cycle," +
          "b.value DEVICE_TYPE_NAME,c.value DEVICE_CLASS_NAME,e.ca_name,e.ca_id,f.CDP_PLAN_SN " +
          "from T_CO_DEVICE t " +
          "LEFT JOIN T_CO_DEVICE_ITEM_INFO a ON a.cdii_device_sn=t.cd_device_sn and a.data_auth=?  " +
          "LEFT JOIN SY_DICT_VAL b ON t.cd_device_type=b.code AND b.dict_code='DEVICE_TYPE' "+
          "LEFT JOIN SY_DICT_VAL c ON t.cd_device_class=c.code AND c.dict_code='DEVICE_CLASS' "+
          "LEFT JOIN T_CO_AREA_DEVICE d ON t.id=d.cad_device_id and d.data_auth=?  "+
          "LEFT JOIN T_CO_AREA e ON d.ca_id=e.ca_id and e.data_auth=?  " +
          "LEFT JOIN T_CO_DEVICE_PLAN_CONNECT f ON f.CDPI_DEVICE_SN = t.cd_device_sn   " +
          "and f.cdpi_item_code = a.cdii_item_code and f.data_auth=? "+
          "WHERE t.cd_device_sn in(SELECT t.CD_DEVICE_SN FROM T_CO_DEVICE t "+
          "left join T_CO_AREA_DEVICE a on a.cad_device_id = t.id " +
          "WHERE a.ca_id in (select CA_ID from T_CO_AREA t start with t.ca_id=? AND T.DATA_AUTH=? " +
          " connect by prior t.ca_id = t.ca_parentareaid)  and t.data_auth=?) AND a.cdii_item_type='保养项目' AND T.DATA_AUTH=? ";
      List<Map<Object,Object>> deList = modelService.listDataSql(delsql, new Object[] { dataAuth,dataAuth,dataAuth,dataAuth,areaId,dataAuth,dataAuth,dataAuth});
      CommMethod.listToEscapeJs(deList);
      modelAction.setAjaxList(deList);
    }
    return BaseActionSupport.AJAX;
  }

}
