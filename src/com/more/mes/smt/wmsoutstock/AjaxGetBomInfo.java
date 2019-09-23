package com.more.mes.smt.wmsoutstock;

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
 * 生产领料---加载机种BOM信息
 * 
 * @author development
 */
public class AjaxGetBomInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		Map<String, String> map = new HashMap<String, String>();
		String sql = "";
		if ("empty".equals(type)) {
			sql = "SELECT DISTINCT T.CB_ITEM_CODE, " + " T2.CBD_ITEM_CODE as CMD_ITEM_CODE, "
					+ " T3.CI_ITEM_NAME as  CI_ITEM_NAME, " + " T3.CI_ITEM_SPEC as CI_ITEM_SPEC, "
					+ " T2.CBD_ITEM_NUM as CMD_POINT_NUM " + " FROM T_CO_BOM T " + " LEFT JOIN T_CO_BOM_DETAIL T2 "
					+ " ON T.ID = T2.CB_BOMID AND T2.DATA_AUTH=T.DATA_AUTH " + " LEFT JOIN T_CO_ITEM T3 "
					+ " ON T2.CBD_ITEM_CODE = T3.CI_ITEM_CODE AND T3.DATA_AUTH=T.DATA_AUTH "
					+ " WHERE T.CB_DEFAULT = 'Y' " + " AND T.CB_ITEM_CODE = '' and T.DATA_AUTH= :dataAuth    ";

			// map.put("PM_MO_NUMBER1", "-1");
			map.put("dataAuth", dataAuth);
		} else {
			sql = "SELECT DISTINCT T.CB_ITEM_CODE, " + " T2.CBD_ITEM_CODE as CMD_ITEM_CODE, "
					+ " T3.CI_ITEM_NAME as CI_ITEM_NAME, " + " T3.CI_ITEM_SPEC as CI_ITEM_SPEC , "
					+ " T2.CBD_ITEM_NUM as CMD_POINT_NUM " + " FROM T_CO_BOM T " + " LEFT JOIN T_CO_BOM_DETAIL T2 "
					+ " ON T.ID = T2.CB_BOMID  AND T2.DATA_AUTH=T.DATA_AUTH " + " LEFT JOIN T_CO_ITEM T3 "
					+ " ON T2.CBD_ITEM_CODE = T3.CI_ITEM_CODE  AND T3.DATA_AUTH=T.DATA_AUTH "
					+ " WHERE T.CB_DEFAULT = 'Y'  and T.DATA_AUTH= :dataAuth ";
			map.put("dataAuth", dataAuth);
		}
		// List itemList = modelService.listSql(sql, modelAction.getPage(), null, null,
		// null, null);
		List itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
