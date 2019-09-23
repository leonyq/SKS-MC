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
 * 生产指示单----生产指示单---检查--回填明细信息
 * 
 * @author development
 */
public class BackFillIndicatorInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemCode = request.getParameter("itemCode");// ID
		String templateName = request.getParameter("templateName");
		String sql = "";
		String sqlWhere = "";
		/*
		 * String dataId = request.getParameter("dataId"); String sqlString =
		 * "select DATA_AUTH from T_CO_INDICATORR " + "where ID = ?  "; Map<String,
		 * String> map1 =modelService.queryForMap(sqlString, new Object[]{dataId});
		 * dataAuth=map1.get("DATA_AUTH");
		 */

		List itemList = null;
		Map resultMap = new HashMap<String, String>();
		// String addType = "edit";
		// 机种项目配置有没有数据
		sql = "SELECT DISTINCT T.CO_ITEM_CODE, " + " T.CO_PROJECT_CODE, " + " T2.CO_PROJECT_NAME, "
				+ " T.CO_STATE         CO_MODEL_STATE, " + " T3.CO_DEPT_ID, " + " T4.NAME            CO_DEPT_NAME, "
				+ " T3.CO_CONFIRM_ID, " + " T5.NAME            CO_CONFIRM_NAME, " + " T3.CO_CHECK_ID, "
				+ " T6.NAME            CO_CHECK_NAME, " + " T2.CO_AFFECT_INFO, "
				+ " T7.VALUE           AFFECT_INFO_NAME " + " FROM T_CO_TEMPLATE_PROJECT T8 "
				+ " LEFT JOIN T_CO_ITEM_PROJECT T " + " ON T.CO_PROJECT_CODE = T8.CTP_PROJECT_CODE "
				+ " AND T.CO_TEMPLATE_NAME = T8.CTP_TEMPLATE_NAME " + " LEFT JOIN T_CO_INDICATORR_PROJECT T2 "
				+ " ON T8.CTP_PROJECT_CODE = T2.CO_PROJECT_CODE " + " LEFT JOIN T_CO_INDICATORR_PERSONLIABLE T3 "
				+ " ON T2.ID = T3.CO_PROJECT_CODE " + " LEFT JOIN SY_DEPT T4 " + " ON T3.CO_DEPT_ID = T4.ID "
				+ " LEFT JOIN SY_USER T5 " + " ON T3.CO_CONFIRM_ID = T5.ID " + " LEFT JOIN SY_USER T6 "
				+ " ON T3.CO_CHECK_ID = T6.ID " + " LEFT JOIN SY_DICT_VAL T7 " + " ON T2.CO_AFFECT_INFO = T7.CODE "
				+ " AND T7.DICT_CODE = 'AFFECT_INFO' ";

		sqlWhere = " WHERE 1=1 AND T.CO_ITEM_CODE = ? " + " AND T8.CTP_TEMPLATE_NAME = ? "
				+ "AND T.DATA_AUTH=? AND T2.DATA_AUTH=? AND T3.DATA_AUTH=?  " + " AND T8.DATA_AUTH=? ";

		itemList = modelService.listDataSql(sql + sqlWhere,
				new Object[] { itemCode, templateName, dataAuth, dataAuth, dataAuth, dataAuth });
		if (itemList == null || itemList.isEmpty()) {
			// 没有 取模板配置表中数据
			sql = "SELECT DISTINCT T2.CO_PROJECT_CODE, " + " T2.CO_PROJECT_NAME, " + " T3.CO_DEPT_ID, "
					+ " T4.NAME            CO_DEPT_NAME, " + " T3.CO_CONFIRM_ID, "
					+ " T5.NAME            CO_CONFIRM_NAME, " + " T3.CO_CHECK_ID, "
					+ " T6.NAME            CO_CHECK_NAME, " + " T2.CO_AFFECT_INFO, "
					+ " T7.VALUE           AFFECT_INFO_NAME " + " FROM T_CO_TEMPLATE_PROJECT T8 "
					+ " LEFT JOIN T_CO_INDICATORR_PROJECT T2 " + " ON T8.CTP_PROJECT_CODE = T2.CO_PROJECT_CODE "
					+ " LEFT JOIN T_CO_INDICATORR_PERSONLIABLE T3 " + " ON T2.ID = T3.CO_PROJECT_CODE "
					+ " LEFT JOIN SY_DEPT T4 " + " ON T3.CO_DEPT_ID = T4.ID " + " LEFT JOIN SY_USER T5 "
					+ " ON T3.CO_CONFIRM_ID = T5.ID " + " LEFT JOIN SY_USER T6 " + " ON T3.CO_CHECK_ID = T6.ID "
					+ " LEFT JOIN SY_DICT_VAL T7 " + " ON T2.CO_AFFECT_INFO = T7.CODE "
					+ " AND T7.DICT_CODE = 'AFFECT_INFO' ";
			sqlWhere = " WHERE 1=1 AND T8.CTP_TEMPLATE_NAME = ? " + "  AND T2.DATA_AUTH=? AND T3.DATA_AUTH=?   "
					+ " AND T8.DATA_AUTH=? ";
			itemList = modelService.listDataSql(sql + sqlWhere,
					new Object[] { templateName, dataAuth, dataAuth, dataAuth });
		}
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		modelAction.setAjaxMap(resultMap);
		return BaseActionSupport.AJAX;
	}
}
