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
 * 获取指令信息
 * @author development
 *
 */
public class AjaxGetOrderInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		String type = request.getParameter("type");//新增还是修改
		String sql = "SELECT t.tcs_code,t.tcs_name,b.tcl_code,b.tcl_name FROM t_command_set t " +
				"LEFT JOIN t_command_set_detail a ON a.tcs_code=t.tcs_code " +
				"LEFT JOIN t_command_list b ON b.tcl_code=a.tcl_code ";
		String sqlWhere = " where 1 = 1 and b.tcl_code IS NOT NULL ";
		if(type.equals("2")){ //修改过滤数据
			String wdtTypeSn = request.getParameter("WDT_TYPE_SN");
			 String auth = request.getSession().getAttribute("mcDataAuth").toString();
			sqlWhere += " AND NOT EXISTS (" +
					"SELECT 1 FROM T_WMS_DOC_ORDER c WHERE c.wdo_order_sn=b.tcl_code " +
					"AND c.wdo_type_sn=:WDT_TYPE_SN1 and c.data_auth=:auth)";
			map.put("WDT_TYPE_SN1", wdtTypeSn);
			map.put("auth", auth);
		}
		List wmsList = modelService.listSql(sql+sqlWhere+" order by t.tcs_code,b.tcl_code", modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(wmsList);
		modelAction.getAjaxPage().setDataList(wmsList);
		return BaseActionSupport.AJAX;
	}

}
