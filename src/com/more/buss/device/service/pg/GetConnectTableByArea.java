package com.more.buss.device.service.pg;

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
 * 加载线别下的设备
 * @author Administrator
 *
 */
public class GetConnectTableByArea implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String areaId = request.getParameter("areaId");  //线别或车间
		//获取对应的设备
		/*
		String querySql = "SELECT t.CD_DEVICE_SN FROM T_CO_DEVICE t "+
					"left join T_CO_AREA_DEVICE a on a.cad_device_id = t.id " +
				    " WHERE a.ca_id in (select CA_ID from T_CO_AREA t start with t.ca_id=? " +
				    " connect by prior t.ca_id = t.ca_parentareaid)";		
		*/
		 String querySql =     "  SELECT t.CD_DEVICE_SN FROM T_CO_DEVICE t "+
            "  left join T_CO_AREA_DEVICE a on a.cad_device_id = t.id  "+
            "  WHERE a.ca_id in ( "+
            "  WITH RECURSIVE Ta  AS ( "+
            "  SELECT * "+
            "  FROM t_co_area "+
            "  WHERE ca_id =? "   +
            "  UNION ALL "+
            "  SELECT  d.* "+
            "  FROM t_co_area D "+
            "  JOIN Ta ON  D.CA_PARENTAREAID=Ta.ca_id "  +
            "  ) "+
            "  SELECT ca_id FROM Ta ) ";
		
		List<Map<Object,Object>> areaList = modelService.listDataSql(querySql, new Object[] { areaId });
		//获取设备对应的信息
		String delsql = "select t.CD_DEVICE_SN,t.CD_DEVICE_NAME,a.cdii_item_code,a.cdii_item_name," +
				"b.value DEVICE_TYPE_NAME,c.value DEVICE_CLASS_NAME,e.ca_name,e.ca_id,f.CDP_PLAN_SN " +
				"from T_CO_DEVICE t " +
				"LEFT JOIN T_CO_DEVICE_ITEM_INFO a ON a.cdii_device_sn=t.cd_device_sn " +
				"LEFT JOIN SY_DICT_VAL b ON t.cd_device_type=b.code AND b.dict_code='DEVICE_TYPE' "+
				"LEFT JOIN SY_DICT_VAL c ON t.cd_device_class=c.code AND c.dict_code='DEVICE_CLASS' "+
				"LEFT JOIN T_CO_AREA_DEVICE d ON t.id=d.cad_device_id "+
				"LEFT JOIN T_CO_AREA e ON d.ca_id=e.ca_id " +
				"LEFT JOIN T_CO_DEVICE_PLAN_CONNECT f ON f.CDPI_DEVICE_SN = t.cd_device_sn " +
				"and f.cdpi_item_code = a.cdii_item_code "+
				"WHERE t.cd_device_sn in(SELECT t.CD_DEVICE_SN FROM T_CO_DEVICE t "+
				"left join T_CO_AREA_DEVICE a on a.cad_device_id = t.id " +
				"WHERE a.ca_id in ("+  
        "  WITH RECURSIVE Ta  AS ( "+
        "  SELECT * "+
        "  FROM t_co_area "+
        "  WHERE ca_id =? "   +
        "  UNION ALL "+
        "  SELECT  d.* "+
        "  FROM t_co_area D "+
        "  JOIN Ta ON  D.CA_PARENTAREAID=Ta.ca_id "  +
        "  ) "+
        "  SELECT ca_id FROM Ta ) "
				+") AND a.cdii_item_type='保养项目'";
		List<Map<Object,Object>> deList = modelService.listDataSql(delsql, new Object[] { areaId });
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deviceList", areaList);
		map.put("deList", deList);
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}

