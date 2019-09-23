package com.more.mes.smt.wmsdoc;

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
 * 修改页面获取关联的指令集
 * @author development
 *
 */
public class GetEditWmsDocOrderSet implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		String wdoTypeSn = request.getParameter("wdo_type_sn");//类型编码  T_WMS_DOC_TYPE
		String dataId = modelAction.getDataId();
		String sql0 = "select DATA_AUTH from T_WMS_DOC_TYPE WHERE id = ? ";
		List<Map> list0 = modelService.listDataSql(sql0, new Object[] {dataId});
		String dataAuth = list0.get(0).get("DATA_AUTH").toString();
		//String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		//类型编码所关联的指令
		String sql = "SELECT b.tcl_code,b.tcl_name,a.tcs_code,a.tcs_name FROM T_WMS_DOC_ORDER t " +
				"LEFT JOIN t_Command_Set a ON a.tcs_code=t.wdo_order_set " +
				"LEFT JOIN t_Command_list b ON b.tcl_code=t.wdo_order_sn ";
		String sqlWhere = " where 1=1 and t.wdo_type_sn = :wdo_type_sn1 and t.data_auth = :data_auth ";
		map.put("wdo_type_sn1", wdoTypeSn);
		map.put("data_auth", dataAuth);
		List<Map> wmsList = modelService.listSql(sql+sqlWhere, null,map, null,null);
		//单据类型关联收发类型信息
		String sql1 = "select t.*,t2.ccc_configure_name from T_WMS_DISPATCH_TYPE t left join T_CO_SN_CONFIGURE t2 on t.wdt_create_rule=t2.id ";
		String sqlWhere1 = " where 1=1 and t.wdt_type_sn = :wdo_type_sn1  and t.data_auth = :data_auth ";
		List<Map> wmsList1 = modelService.listSql(sql1+sqlWhere1, null,map, null,null);
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("orderList", wmsList);
		maps.put("typeList", wmsList1);
		CommMethod.mapToEscapeJs(maps);
		modelAction.setAjaxMap(maps);
		return BaseActionSupport.AJAX;
	}

}
