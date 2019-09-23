package com.more.mes.smt.indicatorr;

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
 * 生产指示单----机种项目配置---新增--加载项目信息
 * 
 * @author development
 */
public class AjaxGetItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "";
		String sqlWhere = "";
		Map<String, Object> map = new HashMap<String, Object>();
		sql = "SELECT T.CO_PROJECT_CODE, " + " T.CO_PROJECT_NAME, " + " T.CO_PROJECT_TYPE, "
				+ " T1.VALUE          PROJECT_TYPE_NAME, " + " T.CO_DEFAULT, " + " T2.VALUE          CO_AFFECT_INFO, "
				+ " T3.CODE          PRODUCT_VAL, " + " T3.VALUE          PRODUCT_STEP "
				+ " FROM T_CO_INDICATORR_PROJECT T " + " LEFT JOIN SY_DICT_VAL T1 " + " ON T.CO_PROJECT_TYPE = T1.CODE "
				+ " AND T1.DICT_CODE = 'INDICATORR_PROJECT_TYPE' " + " LEFT JOIN SY_DICT_VAL T2 "
				+ " ON T.CO_AFFECT_INFO = T2.CODE " + " AND T2.DICT_CODE = 'AFFECT_INFO' "
				+ " LEFT JOIN SY_DICT_VAL T3 " + " ON T.CO_PRODUCT_STEP = T3.CODE "
				+ " AND T3.DICT_CODE = 'PROJECT_STEP' ";
		sqlWhere = " WHERE T.DATA_AUTH=:DATA_AUTH ";
		map.put("DATA_AUTH", dataAuth);
		List itemList = modelService.listSql(sql + sqlWhere, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}
}
