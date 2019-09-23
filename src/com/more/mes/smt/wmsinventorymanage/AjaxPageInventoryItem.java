package com.more.mes.smt.wmsinventorymanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 盘点中的物料 查询及分页
 * 
 * @author development
 *
 */
public class AjaxPageInventoryItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemCode = modelAction.getParaMap().get("itemCode");
		String custCode = modelAction.getParaMap().get("custCode");
		String supCode = modelAction.getParaMap().get("supCode");
		String whCode = modelAction.getParaMap().get("whCode"); // 仓库
		String districtCode = modelAction.getParaMap().get("districtCode");// 库区
		String storageCode = modelAction.getParaMap().get("storageCode");// 库位
		String storeEmp = modelAction.getParaMap().get("storeEmp");// 库管员
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT t.*,t1.wa_area_name wh_name,t2.wa_area_name district_name,"
				+ "a.wid_doc_num,a.wid_item_status,t3.wa_area_name storage_name,t4.supplier_name,"
				+ "t5.customer,t6.ci_item_name,t6.ci_item_spec,t7.name,"
				+ "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time "
				+ "FROM T_WMS_INVENTORY_DETAIL a,t_wms_stock_info t "
				+ "LEFT JOIN t_wms_area t1 ON t1.wa_area_sn=t.wsi_wh_code  "
				+ "LEFT JOIN t_wms_area t2 ON t2.wa_area_sn=t.wsi_district_code "
				+ "LEFT JOIN t_wms_area t3 ON t3.wa_area_sn=t.wsi_storage_code "
				+ "LEFT JOIN t_co_supplier t4 ON t4.supplier_code=t.wsi_sup_code "
				+ "LEFT JOIN t_co_customer t5 ON t5.cust_code=t.wsi_cust_code "
				+ "LEFT JOIN t_co_item t6 ON t6.ci_item_code=t.wsi_item_code "
				+ "LEFT JOIN sy_user t7 ON t7.login_name=t.wsi_receive_emp ";
		if (!storeEmp.equals("")) {
			sql += "LEFT JOIN T_WMS_ITEM_CONTRAL t8 ON t8.WIC_ITEM_CODE=t.wsi_item_code and t8.data_auth=:auth ";
		}
		sql += "WHERE 1=1 AND a.WID_ITEM_SN=t.WSI_ITEM_SN " + " and t1.data_auth=:auth and t2.data_auth=:auth"
				+ " and t3.data_auth=:auth and t4.data_auth=:auth" + " and t5.data_auth=:auth and t6.data_auth=:auth ";
		String sqlWhere = "";
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		sqlParaMap.put("auth", auth);
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.WSI_ITEM_CODE = :itemCode ";
			sqlParaMap.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(custCode)) {
			sqlWhere += " and t.wsi_cust_code = :custCode ";
			sqlParaMap.put("custCode", custCode);
		}
		if (StringUtils.isNotBlank(supCode)) {
			sqlWhere += " and t.wsi_sup_code = :supCode ";
			sqlParaMap.put("supCode", supCode);
		}
		if (StringUtils.isNotBlank(whCode)) {
			sqlWhere += " and t.wsi_wh_code = :whCode ";
			sqlParaMap.put("whCode", whCode);
		}
		if (StringUtils.isNotBlank(districtCode)) {
			sqlWhere += " and t.wsi_district_code = :districtCode ";
			sqlParaMap.put("districtCode", districtCode);
		}
		if (StringUtils.isNotBlank(storageCode)) {
			sqlWhere += " and t.wsi_storage_code = :storageCode ";
			sqlParaMap.put("storageCode", storageCode);
		}
		if (StringUtils.isNotBlank(storeEmp)) {
			sqlWhere += " and  t8.WIC_CTRL_EMP=:storeEmp ";
			sqlParaMap.put("storeEmp", storeEmp);
		}
		sql = "select * from(" + sql + sqlWhere + " order by t.WSI_DOC_NUM)aa ";
		List itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
