package com.more.mes.smt.indicatorr;

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
 * 生产指示单----生产指示单---部门确认--回填明细信息
 * 
 * @author development
 */
public class BackFillConfirmInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String indicatorSn = request.getParameter("indicatorSn");
		String itemCode = request.getParameter("itemCode");
		String sql = "";
		String sqlWhere = "";

		String dataId = request.getParameter("dataId");
		if (StringUtils.isNotBlank(dataId)) {
			String sqlString = "select DATA_AUTH from T_CO_INDICATORR " + "where ID = ?  ";
			Map<String, String> map1 = modelService.queryForMap(sqlString, new Object[] { dataId });
			dataAuth = map1.get("DATA_AUTH");
		}
		List itemList = null;
		sql = "SELECT DISTINCT T1.ID, " + " T.CO_PROJECT_CODE, " + " T2.CO_PROJECT_NAME, " + " T1.EDIT_TIME, "
				+ " T.CO_STATE CO_MODEL_STATE, T1.CO_STATE, " + " T1.CO_DEPT_ID, "
				+ " T4.NAME            CO_DEPT_NAME, " + " T1.CO_CONFIRM_ID, " + " T5.NAME            CO_CONFIRM_NAME, "
				+ " T1.CO_CONFIRM_TIME, " + " T1.CO_CHECK_ID, " + " T6.NAME            CO_CHECK_NAME, "
				+ " T1.CO_CHECK_TIME, " + " T2.CO_AFFECT_INFO, " + " T7.VALUE           AFFECT_INFO_NAME "
				+ " FROM T_CO_INDICATORR_PROJECT_INFO T1 " + " LEFT JOIN T_CO_ITEM_PROJECT T "
				+ " ON T.CO_PROJECT_CODE = T1.CO_PROJECT_CODE " + " LEFT JOIN T_CO_INDICATORR_PROJECT T2 "
				+ " ON T.CO_PROJECT_CODE = T2.CO_PROJECT_CODE " + " LEFT JOIN SY_DEPT T4 "
				+ " ON T1.CO_DEPT_ID = T4.ID " + " LEFT JOIN SY_USER T5 " + " ON T1.CO_CONFIRM_ID = T5.ID "
				+ " LEFT JOIN SY_USER T6 " + " ON T1.CO_CHECK_ID = T6.ID " + " LEFT JOIN SY_DICT_VAL T7 "
				+ " ON T2.CO_AFFECT_INFO = T7.CODE " + " AND T7.DICT_CODE = 'AFFECT_INFO'  WHERE 1=1 ";

		sqlWhere += " AND T1.CO_INDICATORR_SN= ? ";
		sqlWhere += " AND T.CO_ITEM_CODE = ? ";
		sqlWhere += " AND T.DATA_AUTH=? AND T1.DATA_AUTH=? AND T2.DATA_AUTH=? ";

		itemList = modelService.listDataSql(sql + sqlWhere,
				new Object[] { indicatorSn, itemCode, dataAuth, dataAuth, dataAuth });
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
