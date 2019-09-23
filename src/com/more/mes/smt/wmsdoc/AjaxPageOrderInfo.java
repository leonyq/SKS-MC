package com.more.mes.smt.wmsdoc;

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
 * 指令信息分页及查询
 * @author development
 *
 */
public class AjaxPageOrderInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String orderSet = modelAction.getParaMap().get("orderSet");//指令集
		String orderSn = modelAction.getParaMap().get("orderSn");//指令代码
		String type = modelAction.getParaMap().get("type");//新增还是修改
		Map<String, String> map = new HashMap<String, String>();
		String sql = "SELECT t.tcs_code,t.tcs_name,b.tcl_code,b.tcl_name FROM t_command_set t " +
				"LEFT JOIN t_command_set_detail a ON a.tcs_code=t.tcs_code " +
				"LEFT JOIN t_command_list b ON b.tcl_code=a.tcl_code ";
		String sqlWhere = " where 1=1  and b.tcl_code IS NOT NULL ";
		if(StringUtils.isNotBlank(orderSet)){
			sqlWhere += " and t.TCS_CODE = :orderSet1";
			map.put("orderSet1", orderSet);
		}
		if(StringUtils.isNotBlank(orderSn)){
			sqlWhere += " and b.TCL_CODE like '%' || :orderSn1 || '%'";
			map.put("orderSn1", orderSn);
		}
		if(type.equals("2")){ //修改过滤数据
		    HttpServletRequest request = modelAction.getRequest();	 
			String wdtTypeSn = modelAction.getParaMap().get("WDT_TYPE_SN");
			 String auth = request.getSession().getAttribute("mcDataAuth").toString(); 
			sqlWhere += " AND NOT EXISTS (" +
					"SELECT 1 FROM T_WMS_DOC_ORDER c WHERE c.wdo_order_sn=b.tcl_code " +
					"AND c.wdo_type_sn=:WDT_TYPE_SN1 and c.data_auth=:auth )";
			  map.put("WDT_TYPE_SN1", wdtTypeSn);
			  map.put("auth", auth);
		}
		List orderList = modelService.listSql(sql+sqlWhere+" order by t.tcs_code,b.tcl_code", modelAction.getPage(), map, null, null);
        modelAction.setAjaxPage(modelAction.getPage());
        CommMethod.listToEscapeJs(orderList);
		modelAction.getAjaxPage().setDataList(orderList);
		return BaseActionSupport.AJAX;
	}

}
