package com.more.mes.smt.wmsoutstock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 销售发货--物料信息分页及查询
 * 
 * @author development
 */
public class AjaxPageSaleItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String type = modelAction.getParaMap().get("type");

		Map<String, String> map = new HashMap<String, String>();
		List itemList = null;
		if ("DJ13".equals(type)) {
			String poNum = modelAction.getParaMap().get("poNum");
			String itemCode = modelAction.getParaMap().get("itemCode");
			// String dataAuth =
			// modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String sql = "SELECT T.WPD_ITEM_CODE     ITEM_CODE, " + " T2.CI_ITEM_NAME     ITEM_NAME, "
					+ " T2.CI_ITEM_SPEC     ITEM_SPEC, " + " T2.CI_SUPPLIER_CODE SUP_VAL, "
					+ " T3.SUPPLIER_NAME    SUP_NAME, " + " T.WPD_PO PO_NUM, " + " T.WPD_ITEM_SEQ ITEM_SEQ, "
					+ " T.WPD_PLAN_NUM PLAN_NUM, " + " T.WPD_RECEIVE_NUM RECEIVE_NUM " + " FROM T_WMS_PO_DETAIL T "
					+ " LEFT JOIN T_CO_ITEM T2 "
					+ " ON T.WPD_ITEM_CODE = T2.CI_ITEM_CODE and t2.DATA_AUTH = t.DATA_AUTH "
					+ " LEFT JOIN T_CO_SUPPLIER T3 "
					+ " ON T3.SUPPLIER_CODE = T2.CI_SUPPLIER_CODE and t3.DATA_AUTH = t.DATA_AUTH WHERE 1=1 ";
			if (StringUtils.isNotBlank(itemCode)) {
				sql += " AND T.WPD_ITEM_CODE like '%' || :itemCode || '%' ";
				// sql += " AND T.CI_ITEM_CODE =:itemCode";
				map.put("itemCode", itemCode);
			}
			if (StringUtils.isNotBlank(poNum)) {
				sql += " AND T.WPD_PO like '%' || :poNum || '%' ";
				// sql += " AND T.CI_ITEM_CODE =:itemCode";
				map.put("poNum", poNum);
			}
			if (StringUtils.isNotBlank(dataAuth)) {
				sql += " AND T.DATA_AUTH =:dataAuth ";
				// sql += " AND T.CI_ITEM_CODE =:itemCode";
				map.put("dataAuth", dataAuth);
			}

			itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
		} else {
			String itemCode = modelAction.getParaMap().get("itemCode");
			String itemName = modelAction.getParaMap().get("itemName");
			String itemSpec = modelAction.getParaMap().get("itemSpec");
			String itemType = modelAction.getParaMap().get("itemType");
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			// String dataAuth =
			// modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
			String sql = "SELECT A.*, B.WSI_ITEM_NUM FROM ( SELECT T.ID, " + " T.CI_ITEM_CODE  ITEM_CODE, "
					+ " T.CI_ITEM_NAME  ITEM_NAME, " + " T.CI_ITEM_SPEC  ITEM_SPEC, " + " T.CI_MIN_PACK   MIN_PACK, "
					+ " A.SUPPLIER_NAME SUP_NAME, " + " B.VALUE         ITEM_TYPE_NAME, " + " C.CUST_CODE, "
					+ " C.CUSTOMER      CUST_NAME " + " FROM T_CO_ITEM T " + " LEFT JOIN T_CO_SUPPLIER A "
					+ " ON A.SUPPLIER_CODE = T.CI_SUPPLIER_CODE and A.DATA_AUTH = T.DATA_AUTH  "
					+ " LEFT JOIN SY_DICT_VAL B " + " ON B.CODE = T.CI_ITEM_TYPE  "
					+ " AND B.DICT_CODE = 'CI_ITEM_TYPE' " + " LEFT JOIN T_CO_CUSTOMER C "
					+ " ON T.CI_CUST_CODE = C.CUST_CODE and C.DATA_AUTH = T.DATA_AUTH  WHERE 1=1";
			if (StringUtils.isNotBlank(itemCode)) {
				sql += " AND T.CI_ITEM_CODE like '%' || :itemCode || '%' ";
				// sql += " AND T.CI_ITEM_CODE =:itemCode";
				map.put("itemCode", itemCode);
			}
			if (StringUtils.isNotBlank(itemName)) {
				sql += " AND T.CI_ITEM_NAME like '%' || :itemName || '%' ";
				// sql += " AND T.CI_ITEM_NAME =:itemName";
				map.put("itemName", itemName);
			}
			if (StringUtils.isNotBlank(itemSpec)) {
				sql += " AND T.CI_ITEM_SPEC like '%' || :itemSpec || '%' ";
				// sql += " AND T.CI_ITEM_SPEC =:itemSpec";
				map.put("itemSpec", itemSpec);
			}
			if (StringUtils.isNotBlank(dataAuth)) {
				sql += " AND T.DATA_AUTH =:dataAuth";
				map.put("dataAuth", dataAuth);
			}

			sql += " ) A LEFT JOIN ";
			sql += " (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T6 GROUP BY T6.WSI_ITEM_CODE) B ";
			sql += " ON A.ITEM_CODE = B.WSI_ITEM_CODE ";
			itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
		}

		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
