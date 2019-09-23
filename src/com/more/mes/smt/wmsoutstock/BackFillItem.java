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
 * 生产领料---修改---回填物料信息
 * 
 * @author development
 */
public class BackFillItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");// 入库单号
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		// String dataAuth=request.getParameter("dataAuth");
		String pickType = request.getParameter("pickType");// 入库单号
		Map<String, String> map = new HashMap<String, String>();
		// 无用量
		String sql = "SELECT T.ID,T.WOI_ITEM_CODE ITEM_CODE, " + " T.WOI_PLAN_NUM PLAN_NUM, "
				+ " T.WOI_PACK_NUM MIN_PACK, " + " T.WOI_WH_CODE WH_CODE, " + " T.WOI_CONNECT_DOC MO_NUM, "
				+ " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC, "
				+ " TO_CHAR(T.WOI_DELIVERY_DATE, 'yyyy-MM-dd') DELIVERY_DATE " + " FROM T_WMS_OUTSTOCK_ITEM T "
				+ " LEFT JOIN T_CO_ITEM T1 " + " ON T1.CI_ITEM_CODE = T.WOI_ITEM_CODE ";
		String sql2 = "";
		String sqlWhere = "";
		if ("3".equals(pickType)) {
			// 机种BOM
			sql2 = "SELECT DISTINCT A.*, " + " B.WSI_ITEM_NUM, " + " coalesce(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT "
					+ " FROM (SELECT DISTINCT T.ID, " + " T.WOI_ITEM_CODE ITEM_CODE, " + " T.WOI_PLAN_NUM PLAN_NUM, "
					+ " T.WOI_ITEM_SEQ ITEM_SEQ, " + " T.WOI_PACK_NUM MIN_PACK, " + " T.WOI_WH_CODE WH_CODE, "
					+ " T.WOI_CONNECT_DOC MO_NUM, " + " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC, "
					+ " TO_CHAR(T.WOI_DELIVERY_DATE, 'yyyy-MM-dd') DELIVERY_DATE, " + " T.WOI_MIN_PACK POINT_NUM, "
					+ " T.WOI_REQUEST_NUM, " + " T.WOI_EXCEED_NUM " + " FROM T_WMS_OUTSTOCK_ITEM T "
					+ " LEFT JOIN T_CO_ITEM T1 "
					+ " ON T1.CI_ITEM_CODE = T.WOI_ITEM_CODE AND T1.DATA_AUTH = T.DATA_AUTH ";
			sqlWhere = " where 1=1 AND T.WOI_DOC_NUM =:docNum  ) A LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM "// and
																																			// t.DATA_AUTH=:dataAuth
					+ "FROM T_WMS_STOCK_INFO T6 GROUP BY T6.WSI_ITEM_CODE) B ON A.ITEM_CODE = B.WSI_ITEM_CODE "
					+ " LEFT JOIN T_MID_EXCEED_ITEM_INFO D " + " ON A.ITEM_CODE = D.MEI_ITEM_CODE ";
			map.put("docNum", docNum);
			// map.put("dataAuth", dataAuth);

		} else {
			// 有用量
			sql2 = "SELECT DISTINCT A.*,B.WSI_ITEM_NUM,coalesce(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT FROM (SELECT DISTINCT T.ID, "
					+ " T.WOI_ITEM_CODE ITEM_CODE, " + " T.WOI_PLAN_NUM PLAN_NUM, " + " T.WOI_ITEM_SEQ ITEM_SEQ, "
					+ " T.WOI_PACK_NUM MIN_PACK, " + " T.WOI_WH_CODE WH_CODE, " + " T.WOI_CONNECT_DOC MO_NUM, "
					+ " T1.CI_ITEM_NAME ITEM_NAME, " + " T1.CI_ITEM_SPEC ITEM_SPEC, "
					+ " TO_CHAR(T.WOI_DELIVERY_DATE, 'yyyy-MM-dd') DELIVERY_DATE , "
					+ " T3.CBD_ITEM_NUM POINT_NUM,T.WOI_REQUEST_NUM, T.WOI_EXCEED_NUM  "
					+ " FROM T_WMS_OUTSTOCK_ITEM T " + " LEFT JOIN T_CO_ITEM T1 "
					+ " ON T1.CI_ITEM_CODE = T.WOI_ITEM_CODE  AND T1.DATA_AUTH=T.DATA_AUTH "
					+ " LEFT JOIN T_PM_MO_BASE T2 "
					+ " ON T.WOI_CONNECT_DOC = T2.PM_MO_NUMBER AND T2.DATA_AUTH=T.DATA_AUTH "
					+ " LEFT JOIN T_PM_PROJECT_DETAIL T3 "
					+ " ON T2.PM_PROJECT_ID = T3.PROJECT_ID AND T.WOI_ITEM_CODE=T3.CBD_ITEM_CODE AND T3.DATA_AUTH=T.DATA_AUTH ";
			sqlWhere = " where 1=1 AND T.WOI_DOC_NUM =:docNum  ) A LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM "// and
																																			// t.DATA_AUTH
																																			// =:dataAuth
					+ "FROM T_WMS_STOCK_INFO T6 GROUP BY T6.WSI_ITEM_CODE) B ON A.ITEM_CODE = B.WSI_ITEM_CODE "
					+ " LEFT JOIN T_MID_EXCEED_ITEM_INFO D " + " ON A.ITEM_CODE = D.MEI_ITEM_CODE ";
			map.put("docNum", docNum);
			// map.put("dataAuth", dataAuth);

		}

		List itemList = modelService.listSql(sql2 + sqlWhere, null, map, null, null);
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
