package com.more.mes.smt.wmsinventorymanage;

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
 * 单据审核加载物料信息
 * 
 * @author development
 *
 */
public class AjaxGetItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String docNum = request.getParameter("docNum");
		String itemState = request.getParameter("itemState");// 物料状态(1-待盘点,2-已盘点,3-盘0,4-已审核)
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT t.*,a.ci_item_name,a.ci_item_spec,b.wa_area_name wh_name,t3.name,"
				+ "c.wa_area_name district_name,d.wa_area_name storage_name,t1.supplier_name,"
				+ "t2.customer,to_char(t.wid_inventory_time,'yyyy-mm-dd hh24:mi:ss') inventory_time "
				+ "FROM T_WMS_INVENTORY_DETAIL t "
				+ "LEFT JOIN t_co_item a ON a.ci_item_code=t.wid_item_code and a.DATA_AUTH=:auth "
				+ "LEFT JOIN t_wms_area b ON b.wa_area_sn=t.wid_wh_code and b.DATA_AUTH=:auth "
				+ "LEFT JOIN t_wms_area c ON c.wa_area_sn=t.wid_district_code and c.DATA_AUTH=:auth "
				+ "LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wid_storage_code and d.DATA_AUTH=:auth "
				+ "LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wid_sup_code and t1.DATA_AUTH=:auth "
				+ "LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wid_cust_code and t2.DATA_AUTH=:auth "
				+ "LEFT JOIN sy_user t3 ON t3.login_name=t.wid_inventory_emp where 1=1 "
				+ " and t.DATA_AUTH =:auth    ";
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		sqlParaMap.put("auth", auth);
		if (StringUtils.isNotBlank(docNum)) {
			sql += " and t.WID_DOC_NUM = :docNum ";
			sqlParaMap.put("docNum", docNum);
		}
		if (StringUtils.isNotBlank(itemState)) {
			sql += " and t.WID_ITEM_STATUS = :itemState ";
			sqlParaMap.put("itemState", itemState);
		}
		List itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
