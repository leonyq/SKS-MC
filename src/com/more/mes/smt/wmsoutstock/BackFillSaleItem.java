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
 * 销售发货--修改页面回填物料信息
 * 
 * @author development
 */
public class BackFillSaleItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");// 入库单号
		String docNum = request.getParameter("docNum");// 入库单号
		String sql = "";
		if ("DJ13".equals(type)) {
			sql = "SELECT DISTINCT T.ID,T.WOI_ITEM_CODE ITEM_CODE, " + " T2.CI_ITEM_NAME ITEM_NAME, "
					+ " T2.CI_ITEM_SPEC ITEM_SPEC, " + " T2.CI_SUPPLIER_CODE SUP_VAL, " + " T3.SUPPLIER_NAME SUP_NAME, "
					+ " T5.WPD_PO PO_NUM, " + " T5.WPD_ITEM_SEQ ITEM_SEQ, " + " T5.WPD_PLAN_NUM PLAN_NUM, "
					+ " T5.WPD_RECEIVE_NUM RECEIVE_NUM, " + " T.WOI_RETURN_NUM RETURN_NUM, "
					+ " T.WOI_WH_CODE WH_CODE, " + " TO_CHAR(T.WOI_DELIVERY_DATE, 'yyyy-MM-dd') OUTSTOCK_DATE "
					+ " FROM T_WMS_OUTSTOCK_ITEM T " + " LEFT JOIN T_WMS_PO_DETAIL T5 "
					+ " ON T.WOI_CONNECT_DOC = T5.WPD_PO AND T5.DATA_AUTH=T.DATA_AUTH "
					+ " AND T.WOI_ITEM_CODE=T5.WPD_ITEM_CODE " + " AND T.WOI_ITEM_SEQ=T5.WPD_ITEM_SEQ   "
					+ " LEFT JOIN T_CO_ITEM T2 "
					+ " ON T.WOI_ITEM_CODE = T2.CI_ITEM_CODE  AND T2.DATA_AUTH=T.DATA_AUTH "
					+ " LEFT JOIN T_CO_SUPPLIER T3 "
					+ " ON T3.SUPPLIER_CODE = T2.CI_SUPPLIER_CODE  AND T3.DATA_AUTH=T.DATA_AUTH ";
		} else {
			sql = "SELECT T.ID,T.WOI_ITEM_CODE ITEM_CODE, " + " T.WOI_PLAN_NUM PLAN_NUM, "
					+ " T.WOI_PACK_NUM MIN_PACK, " + " T.WOI_WH_CODE WH_CODE, " + " T.WOI_CONNECT_DOC CONNECT_NUM, "
					+ " T1.CI_ITEM_NAME ITEM_NAME, "
					+ " T1.CI_ITEM_SPEC ITEM_SPEC, T1.CI_CUST_CODE CUST_CODE,T2.CUSTOMER CUST_NAME, "
					+ " TO_CHAR(T.WOI_DELIVERY_DATE, 'yyyy-MM-dd') OUTSTOCK_DATE,T3.SUPPLIER_NAME SUP_NAME "
					+ " FROM T_WMS_OUTSTOCK_ITEM T " + " LEFT JOIN T_CO_ITEM T1 "
					+ " ON T1.CI_ITEM_CODE = T.WOI_ITEM_CODE  AND T1.DATA_AUTH=T.DATA_AUTH "
					+ " LEFT JOIN T_CO_CUSTOMER T2 "
					+ " ON T1.CI_CUST_CODE = T2.CUST_CODE  AND T2.DATA_AUTH=T.DATA_AUTH"
					+ " LEFT JOIN T_CO_SUPPLIER T3 ON T1.CI_SUPPLIER_CODE = T3.SUPPLIER_CODE  AND T3.DATA_AUTH=T.DATA_AUTH";
		}
		sql += " where 1=1 AND T.WOI_DOC_NUM =:docNum ";
		Map<String, String> map = new HashMap<String, String>();
		map.put("docNum", docNum);
		List itemList = modelService.listSql(sql, null, map, null, null);
		CommMethod.listToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
