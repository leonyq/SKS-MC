package com.more.mes.smt.indicatorr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产指示单----机种项目配置---修改回填信息
 * 
 * @author development
 */
public class BackFillConfigureInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemCode = request.getParameter("itemCode");// ID

		/*
		 * String dataId = request.getParameter("dataId");// ID String sql1 =
		 * "select T.DATA_AUTH from T_CO_ITEM_PROJECT t WHERE T.ID=? "; Map<String,
		 * String> map = modelService.queryForMap(sql1, new Object[]{dataId});
		 */
		String sql = "SELECT T.CO_PROJECT_CODE, " + " T.CO_PROJECT_NAME, " + " T.CO_PROJECT_TYPE, "
				+ " T1.VALUE          PROJECT_TYPE_NAME, " + " T.CO_DEFAULT, " + " T2.VALUE          CO_AFFECT_INFO, "
				+ " T3.CODE          PRODUCT_VAL, " + " T3.VALUE          PRODUCT_STEP "
				+ " FROM T_CO_INDICATORR_PROJECT T " + " LEFT JOIN SY_DICT_VAL T1 " + " ON T.CO_PROJECT_TYPE = T1.CODE "
				+ " AND T1.DICT_CODE = 'INDICATORR_PROJECT_TYPE' " + " LEFT JOIN SY_DICT_VAL T2 "
				+ " ON T.CO_AFFECT_INFO = T2.CODE " + " AND T2.DICT_CODE = 'AFFECT_INFO' "
				+ " LEFT JOIN SY_DICT_VAL T3 " + " ON T.CO_PRODUCT_STEP = T3.CODE "
				+ " AND T3.DICT_CODE = 'PROJECT_STEP' where 1=1 ";
		String sqlWhere = " AND T.CO_ITEM_CODE = ? AND T.DATA_AUTH=? ";

		List itemList = modelService.listDataSql(sql + sqlWhere, new Object[] { itemCode, dataAuth });
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
