package com.more.mes.smt.indicatorr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----机种项目配置---新增--加载项目信息--分页及查询
 * 
 * @author development
 */
public class AjaxPageItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemCode = modelAction.getParaMap().get("itemCode");
		String proName = modelAction.getParaMap().get("proName");
		String sql = "SELECT T.CO_PROJECT_CODE, " + " T.CO_PROJECT_NAME, " + " T.CO_PROJECT_TYPE, "
				+ " T1.VALUE          PROJECT_TYPE_NAME, " + " T.CO_DEFAULT, " + " T2.VALUE          CO_AFFECT_INFO, "
				+ " T3.CODE          PRODUCT_VAL, " + " T3.VALUE          PRODUCT_STEP "
				+ " FROM T_CO_INDICATORR_PROJECT T " + " LEFT JOIN SY_DICT_VAL T1 " + " ON T.CO_PROJECT_TYPE = T1.CODE "
				+ " AND T1.DICT_CODE = 'INDICATORR_PROJECT_TYPE' " + " LEFT JOIN SY_DICT_VAL T2 "
				+ " ON T.CO_AFFECT_INFO = T2.CODE " + " AND T2.DICT_CODE = 'AFFECT_INFO' "
				+ " LEFT JOIN SY_DICT_VAL T3 " + " ON T.CO_PRODUCT_STEP = T3.CODE "
				+ " AND T3.DICT_CODE = 'PROJECT_STEP' ";
		String sqlWhere = " WHERE 1=1 ";

		Map<String, Object> parMap = new HashMap<String, Object>();
		sqlWhere += " AND T.DATA_AUTH=DATA_AUTH ";
		parMap.put("DATA_AUTH", dataAuth);
		if (StringUtils.isNotBlank(itemCode)) {
			parMap.put("CO_PROJECT_CODE", itemCode);
			sqlWhere += " AND T.CO_PROJECT_CODE LIKE  '%' || :CO_PROJECT_CODE ||  '%'";
		}
		if (StringUtils.isNotBlank(proName)) {
			parMap.put("CO_PROJECT_NAME", proName);
			sqlWhere += " AND T.CO_PROJECT_NAME LIKE  '%' || :CO_PROJECT_NAME ||  '%'";
		}
		List itemList = modelService.listSql(sql + sqlWhere, modelAction.getPage(), parMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}
}
