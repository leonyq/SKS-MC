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
 * 销售发货--获取物料信息
 * 
 * @author development
 */
public class AjaxGetSaleItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		String type = request.getParameter("type");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "";
		String sqlWhere = "";
		if ("DJ13".equals(type)) {
			sql = "SELECT T.WPD_ITEM_CODE     ITEM_CODE, " + " T2.CI_ITEM_NAME     ITEM_NAME, "
					+ " T2.CI_ITEM_SPEC     ITEM_SPEC, " + " T2.CI_SUPPLIER_CODE SUP_VAL, "
					+ " T3.SUPPLIER_NAME    SUP_NAME, " + " T.WPD_PO PO_NUM, " + " T.WPD_ITEM_SEQ ITEM_SEQ, "
					+ " T.WPD_PLAN_NUM PLAN_NUM, " + " T.WPD_RECEIVE_NUM RECEIVE_NUM " + " FROM T_WMS_PO_DETAIL T "
					+ " LEFT JOIN T_CO_ITEM T2 "
					+ " ON T.WPD_ITEM_CODE = T2.CI_ITEM_CODE AND t2.DATA_AUTH=T.DATA_AUTH  "
					+ " LEFT JOIN T_CO_SUPPLIER T3 "
					+ " ON T3.SUPPLIER_CODE = T2.CI_SUPPLIER_CODE  AND t3.DATA_AUTH=T.DATA_AUTH ";

			sqlWhere = " where 1=1 AND t.DATA_AUTH=:DATA_AUTH1    ";

			map.put("DATA_AUTH1", dataAuth);

		} else {
			sql = "SELECT A.*,B.WSI_ITEM_NUM " + " FROM (SELECT T.ID, " + " T.CI_ITEM_CODE  ITEM_CODE, "
					+ " T.CI_ITEM_NAME  ITEM_NAME, " + " T.CI_ITEM_SPEC  ITEM_SPEC, " + " T.CI_MIN_PACK   MIN_PACK, "
					+ " A.SUPPLIER_NAME SUP_NAME, " + " T.DATA_AUTH     DATA_AUTH,"
					+ " B.VALUE         ITEM_TYPE_NAME, " + " C.CUST_CODE, " + " C.CUSTOMER      CUST_NAME "
					+ "  FROM T_CO_ITEM T " + " LEFT JOIN T_CO_SUPPLIER A "
					+ " ON A.SUPPLIER_CODE = T.CI_SUPPLIER_CODE and A.DATA_AUTH = t.DATA_AUTH   "
					+ " LEFT JOIN SY_DICT_VAL B " + " ON B.CODE = T.CI_ITEM_TYPE  "
					+ " AND B.DICT_CODE = 'CI_ITEM_TYPE'  " + " LEFT JOIN T_CO_CUSTOMER C "
					+ " ON T.CI_CUST_CODE = C.CUST_CODE ) A "
					+ " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM "
					+ " FROM T_WMS_STOCK_INFO T6 " + " GROUP BY T6.WSI_ITEM_CODE) B "
					+ " ON A.ITEM_CODE = B.WSI_ITEM_CODE ";

			sqlWhere = "WHERE A.DATA_AUTH=:DATA_AUTH1   ";

			map.put("DATA_AUTH1", dataAuth);

		}
		// String sql1 = "select * from("+sql + sqlWhere+") ret";
		List itemList = modelService.listSql(sql + sqlWhere, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
