package com.more.mes.smt.wmsoutstock.etstock;

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
 * @ClassName:DataCollection
 * @Description: 委外库存汇总
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年5月2日上午12:19:06
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class DataCollection implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String itemCode = modelAction.getParaMap().get("itemCode");
		String supCode = modelAction.getParaMap().get("supCode");// 供应商
		String dataAuth = request.getParameter("dataAuth");
		String userId = modelAction.getUser().getId();
		String sql = " SELECT distinct G.NAME AS DATA_AUTH, WOS_ITEM_CO ITEM_CODE, CI_ITEM_NAME  ITEM_NAME, CI_ITEM_SPEC ITEM_SPEC ,sum( WOS_ITEM_N) WOS_ITEM_N ,sum (WOS_ITEM_RN) WOS_ITEM_RN FROM  T_WMS_OUTSOURCE_STOCK T1 "
				+ " LEFT JOIN T_CO_ITEM T2  ON T1.WOS_ITEM_CO = T2.CI_ITEM_CODE AND T2.DATA_AUTH=T1.DATA_AUTH "
				+ " LEFT JOIN SY_DEPT G ON G.ID=T1.DATA_AUTH ";

		String sqlWhere = " where 1=1 ";
		Map<String, String> map = new HashMap<String, String>();
		if (StringUtils.isNotBlank(itemCode) && !"undefined".equals(itemCode)) {
			sqlWhere += " AND T1.WOS_ITEM_CO = :itemCode";
			map.put("itemCode", itemCode);
			// sqlWhere += " AND T1.WOS_ITEM_CO = '" + itemCode + "'";
		}
		if (StringUtils.isNotBlank(supCode) && !"undefined".equals(supCode)) {
			sqlWhere += " AND T1.WOS_SUP_CO = :supCode";
			map.put("supCode", supCode);
			// sqlWhere += " AND T1.WOS_SUP_CO = '" + supCode + "'";
		}
		if (StringUtils.isNotBlank(dataAuth)) {
			sqlWhere += " and t1.DATA_AUTH =:dataAuth    and t2.DATA_AUTH =:dataAuth2      ";
			map.put("dataAuth", dataAuth);
			map.put("dataAuth2", dataAuth);
		} else {
			sqlWhere += " and t1.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )"
					+ " and t2.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId2 )";
			map.put("userId1", userId);
			map.put("userId2", userId);
		}
		String sql1 = "select * from(" + sql + sqlWhere
				+ " group by G.NAME, WOS_ITEM_CO, CI_ITEM_NAME , CI_ITEM_SPEC )";
		List poList = modelService.listSql(sql1, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(poList);
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
