package com.more.mes.smt.wmsoutstock;

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
 * 生产领料---获取所有制令单信息
 * 
 * @author development
 */
public class AjaxAllMoNumInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String moNum = request.getParameter("moNum");
		String sql = "SELECT DISTINCT C.*,B.WSI_ITEM_NUM,coalesce(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT FROM (SELECT A.* FROM ( SELECT T2.PM_MO_NUMBER PROJECT_ID, "
				+ " T1.CUST_CODE, " + " T.CBD_ITEM_CODE CMD_ITEM_CODE, " + " T4.CI_ITEM_NAME, " + " T4.CI_ITEM_SPEC, "
				+ " SUM(T.CBD_ITEM_NUM) CMD_POINT_NUM " + " FROM T_PM_PROJECT_DETAIL T " + " LEFT JOIN T_CO_ITEM T4 "
				+ " ON T.CBD_ITEM_CODE = T4.CI_ITEM_CODE " + " LEFT JOIN T_PM_PROJECT_BASE T1 "
				+ " ON T.PROJECT_ID = T1.PROJECT_ID " + " LEFT JOIN T_PM_MO_BASE T2 "
				+ " ON T1.PROJECT_ID = T2.PM_PROJECT_ID ";
		Map<String, String> map = new HashMap<String, String>();
		String sqlWhere = " where 1 =1 ";
		if (StringUtils.isNotBlank(moNum)) {

			sqlWhere += " AND T2.PM_MO_NUMBER=:moNum ";
			map.put("moNum", moNum);
		}
		sqlWhere += " GROUP BY T2.PM_MO_NUMBER,T1.CUST_CODE,T.CBD_ITEM_CODE,T4.CI_ITEM_NAME,T4.CI_ITEM_SPEC) A ) C ";
		sqlWhere += " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T6  GROUP BY T6.WSI_ITEM_CODE) B ";
		sqlWhere += " ON C.CMD_ITEM_CODE = B.WSI_ITEM_CODE ";
		sqlWhere += " LEFT JOIN T_MID_EXCEED_ITEM_INFO D " + " ON C.CMD_ITEM_CODE = D.MEI_ITEM_CODE ";
		List itemList = modelService.listSql(sql + sqlWhere, null, map, null, null);
		// modelAction.setAjaxPage(modelAction.getPage());
		// modelAction.getAjaxPage().setDataList(itemList);
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}

}
