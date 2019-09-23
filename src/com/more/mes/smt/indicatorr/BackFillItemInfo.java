package com.more.mes.smt.indicatorr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----检查项目---修改回填信息
 * 
 * @author development
 */
public class BackFillItemInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String infoId = request.getParameter("infoId");// ID
		String sql1 = "select T.DATA_AUTH from T_CO_INDICATORR_PROJECT t WHERE T.ID=? ";
		Map<String, String> map = modelService.queryForMap(sql1, new Object[] { infoId });
		String sql = "SELECT T.CO_DEPT_ID    DEPT_ID_VAL, " + " T.CO_CONFIRM_ID CONFIRM_ID_VAL, "
				+ "  T.CO_CHECK_ID   CHECK_ID_VAL, " + " T2.NAME         DEPT_NAME, "
				+ " T3.NAME         CONFIRM_NAME, " + " T4.NAME         CHECK_NAME "
				+ " FROM T_CO_INDICATORR_PERSONLIABLE T " + " LEFT JOIN T_CO_INDICATORR_PROJECT T1 "
				+ " ON T.CO_PROJECT_CODE = T1.ID " + "  LEFT JOIN SY_DEPT T2 " + " ON T.CO_DEPT_ID = T2.ID "
				+ " LEFT JOIN SY_USER T3 " + " ON T.CO_CONFIRM_ID = T3.ID " + " LEFT JOIN SY_USER T4 "
				+ " ON T.CO_CHECK_ID = T4.ID where 1=1 ";
		String sqlWhere = " AND T1.ID = ? AND T1.DATA_AUTH=?  ";

		List itemList = modelService.listDataSql(sql + sqlWhere, new Object[] { infoId, map.get("DATA_AUTH") });
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
