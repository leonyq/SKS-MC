package com.more.mes.smt.indicatorr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----制令单上线指示单---查看--回填明细信息
 * 
 * @author development
 */
public class BackIndictorOnlineInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String indicatorId = request.getParameter("indicatorId");
		String modelCode = request.getParameter("modelCode");
		String sql = "";
		String sqlWhere = "";
		List itemList = null;
		sql = "SELECT DISTINCT T1.ID, " + " T.CO_PROJECT_CODE, " + " T2.CO_PROJECT_NAME, " + " T1.EDIT_TIME, "
				+ " T.CO_STATE CO_MODEL_STATE, T1.CO_STATE, " + " T1.CO_DEPT_ID, "
				+ " T4.NAME            CO_DEPT_NAME, " + " T1.CO_CONFIRM_ID, " + " T5.NAME            CO_CONFIRM_NAME, "
				+ " T1.CO_CONFIRM_TIME, " + " T1.CO_CHECK_ID, " + " T6.NAME            CO_CHECK_NAME, "
				+ " T1.CO_CHECK_TIME, " + " T2.CO_AFFECT_INFO, " + " T7.VALUE           AFFECT_INFO_NAME "
				+ " FROM T_CO_INDICATORR_ONLINEPRO_INFO T1 " + " LEFT JOIN T_CO_ITEM_PROJECT T "
				+ " ON T.CO_PROJECT_CODE = T1.CO_PROJECT_CODE " + " LEFT JOIN T_CO_INDICATORR_PROJECT T2 "
				+ " ON T.CO_PROJECT_CODE = T2.CO_PROJECT_CODE " + " LEFT JOIN SY_DEPT T4 "
				+ " ON T1.CO_DEPT_ID = T4.ID " + " LEFT JOIN SY_USER T5 " + " ON T1.CO_CONFIRM_ID = T5.ID "
				+ " LEFT JOIN SY_USER T6 " + " ON T1.CO_CHECK_ID = T6.ID " + " LEFT JOIN SY_DICT_VAL T7 "
				+ " ON T2.CO_AFFECT_INFO = T7.CODE " + " AND T7.DICT_CODE = 'AFFECT_INFO' WHERE 1=1 ";

		sqlWhere += " AND T1.CO_INDICATORR_ID= ? ";
		sqlWhere += " AND T.CO_ITEM_CODE = ? ";

		itemList = modelService.listDataSql(sql + sqlWhere, new Object[] { indicatorId, modelCode });
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
