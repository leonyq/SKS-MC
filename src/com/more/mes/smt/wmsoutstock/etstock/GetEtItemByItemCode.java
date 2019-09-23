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
 * 委外发料---获取出库物料明细
 * 
 * @author development
 */
public class GetEtItemByItemCode implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {//
		HttpServletRequest request = modelAction.getRequest();
		String itemId = request.getParameter("itemId");// 物料id
		String itemCode = request.getParameter("itemCode");
		// String dataAuth = request.getParameter("dataAuth");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String docNum = request.getParameter("docNum");// 出库单号
		String custCode = request.getParameter("custCode");// 客户 注意：现改为委外供应商
		String connectDoc = request.getParameter("connectDoc");// 关联单号
		String woiStatus = request.getParameter("woiStatus");// 物料状态
		String supCode = request.getParameter("supCode");// 供应商
		String docType = request.getParameter("docType");// 单据类型
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		String userId = modelAction.getUser().getId();
		String sql = "SELECT DISTINCT T.ID AS ID, T.WOD_ITEM_SN      ITEM_SN, "
				+ " G.NAME AS DATA_AUTH, t.DATA_AUTH as DATA_AUTH2," + " T.WOD_ITEM_CODE    ITEM_CODE, "
				+ " B.CI_ITEM_NAME     ITEM_NAME, " + " B.CI_ITEM_SPEC     ITEM_SPEC, "
				+ " T.WOD_OUTSTOCK_NUM OUTSTOCK_NUM, " + " T.WOD_DOC_NUM      DOC_NUM, "
				+ " T.WOD_FIRST_SN     FIRST_SN, " + " T.WOD_SECOND_SN    SECOND_SN, "
				+ " T.WOD_THIRD_SN     THIRD_SN, " + " T.WOD_FOURTH_SN    FOURTH_SN, " + " T.WOD_WH_CODE      WH_CODE, "
				+ " D.WA_AREA_NAME     WH_NAME, "

				+ " E.NAME OUTSTOCK_EMP, " + " TO_CHAR(T.WOD_OUTSTOCK_TIME,'yyyy-MM-dd HH24:mi:ss') OUTSTOCK_TIME, "
				+ " T.WOD_UPLOAD_FLAG UPLOAD_FLAG, "
				+ " TO_CHAR(T.WOD_UPLOAD_TIME,'yyyy-MM-dd HH24:mi:ss') UPLOAD_TIME " + " FROM T_WMS_OUTSTOCK_DETAIL T "
				+ " LEFT JOIN T_WMS_STOCK_INFO A " + " ON A.WSI_ITEM_SN = T.WOD_ITEM_SN " + " LEFT JOIN T_CO_ITEM B "
				+ " ON B.CI_ITEM_CODE = T.WOD_ITEM_CODE " + " LEFT JOIN T_WMS_OUTSTOCK_DOC C "
				+ " ON C.WOD_DOC_NUM = T.WOD_DOC_NUM " + " LEFT JOIN T_WMS_AREA D "
				+ " ON D.WA_AREA_SN = T.WOD_WH_CODE " + " LEFT JOIN SY_USER E " + " ON E.LOGIN_NAME=T.WOD_OUTSTOCK_EMP "
				+ " LEFT JOIN T_WMS_OUTSTOCK_ITEM F " + " ON F.WOI_DOC_NUM=T.WOD_DOC_NUM"
				+ " LEFT JOIN SY_DEPT G ON G.ID=T.DATA_AUTH ";

		// + " T.ET_SUP_CODE ET_SUP_CODE ,"//明细单中未加此字段 目测没必要
		String sqlWhere = " where 1=1 ";
		Map<String, String> map = new HashMap<String, String>();
		if (StringUtils.isNotBlank(itemId)) {
			sqlWhere += " AND T.WOD_ITEM_ID = :itemId ";
			// sqlWhere += " AND T.WOD_ITEM_ID = '" + itemId + "'";
			map.put("itemId", itemId);
		}
		if (StringUtils.isNotBlank(docType)) {
			sqlWhere += " AND C.WOD_DOC_TYPE = :docType ";
			// sqlWhere += " AND C.WOD_DOC_TYPE = '" + docType + "'";
			map.put("docType", docType);
		}
		if (StringUtils.isNotBlank(itemCode) && !"undefined".equals(itemCode)) {
			sqlWhere += " AND T.WOD_ITEM_CODE = :itemCode ";
			// sqlWhere += " AND T.WOD_ITEM_CODE = '" + itemCode + "'";
			map.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(dataAuth)) {
			sqlWhere += " and t.DATA_AUTH =:dataAuth  and A.DATA_AUTH =:dataAuth1  and B.DATA_AUTH =:dataAuth2  and C.DATA_AUTH =:dataAuth3  and D.DATA_AUTH =:dataAuth4  and E.DATA_AUTH =:dataAuth5  and F.DATA_AUTH =:dataAuth6  and G.DATA_AUTH =:dataAuth8  ";
			map.put("dataAuth", dataAuth);
			map.put("dataAuth1", dataAuth);
			map.put("dataAuth2", dataAuth);
			map.put("dataAuth3", dataAuth);
			map.put("dataAuth4", dataAuth);
			map.put("dataAuth5", dataAuth);
			map.put("dataAuth6", dataAuth);
			map.put("dataAuth7", dataAuth);
			map.put("dataAuth8", dataAuth);

		}

		else {
			sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )"
					+ " and A.DATA_AUTH  in( select DEPT_ID from sy_data_auth where USER_ID=:userId2 )  "
					+ " and B.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId3 )"
					+ " and C.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId4 ) "
					+ " AND D.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where USER_ID=:userId5 ) "
					+ " AND E.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where USER_ID=:userId6 ) "
					+ " AND F.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where USER_ID=:userId7 ) " +

					" AND G.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where USER_ID=:userId8 ) ";

			map.put("userId1", userId);
			map.put("userId2", userId);
			map.put("userId3", userId);
			map.put("userId4", userId);
			map.put("userId5", userId);
			map.put("userId6", userId);
			map.put("userId7", userId);
			map.put("userId8", userId);

		}
		if (StringUtils.isNotBlank(docNum) && !"undefined".equals(docNum)) {
			sqlWhere += " AND T.WOD_DOC_NUM like '%' || :docNum || '%'";
			// sqlWhere += " AND T.WOD_DOC_NUM like '%" + docNum + "%'";
			map.put("docNum", docNum);
		}

		if (StringUtils.isNotBlank(supCode) && !"undefined".equals(supCode)) {
			sqlWhere += " AND C.WOD_SUP_CODE = :supCode ";
			// sqlWhere += " AND C.WOD_SUP_CODE = '" + supCode + "'";
			map.put("supCode", supCode);
		}
		if (StringUtils.isNotBlank(woiStatus) && !"undefined".equals(woiStatus)) {
			sqlWhere += " AND F.WOI_STATUS = :woiStatus ";
			// sqlWhere += " AND F.WOI_STATUS = '" + woiStatus + "'";
			map.put("woiStatus", woiStatus);
		}

		if (StringUtils.isNotBlank(beginTime)) {
			sqlWhere += " and t.WOD_OUTSTOCK_TIME >= to_date('" + beginTime + "','yyyy-mm-dd hh24:mi:ss')";
		}
		if (StringUtils.isNotBlank(endTime)) {
			sqlWhere += " and t.WOD_OUTSTOCK_TIME <= to_date('" + endTime + "','yyyy-mm-dd hh24:mi:ss')";
		}

		String sql1 = "select * from(" + sql + sqlWhere + " order by OUTSTOCK_TIME desc )";

		List poList = modelService.listSql(sql1, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(poList);
		modelAction.getAjaxPage().setDataList(poList);
		return BaseActionSupport.AJAX;
	}

}
