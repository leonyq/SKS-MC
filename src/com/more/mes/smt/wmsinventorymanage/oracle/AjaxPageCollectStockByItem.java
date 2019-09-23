package com.more.mes.smt.wmsinventorymanage.oracle;

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
 * 通过物料进行库存汇总
 * 
 * @author development
 *
 */
public class AjaxPageCollectStockByItem implements FuncService {

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
		String invenCount = modelAction.getParaMap().get("invenCount");// 当月盘点次数
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sqlWhere = "";
		String sqlWhere1 = "";// 有当月盘点次数 条件
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.WSI_ITEM_CODE =:itemCode";
			sqlWhere1 += " and b.wid_item_code =:itemCode";
			sqlParaMap.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(custCode)) {
			sqlWhere += " and t.wsi_cust_code =:custCode";
			sqlWhere1 += " and b.wid_cust_code =:custCode";
			sqlParaMap.put("custCode", custCode);
		}
		if (StringUtils.isNotBlank(supCode)) {
			sqlWhere += " and t.wsi_sup_code =:supCode";
			sqlWhere1 += " and b.wid_sup_code =:supCode";
			sqlParaMap.put("supCode", supCode);
		}
		if (StringUtils.isNotBlank(whCode)) {
			sqlWhere += " and t.wsi_wh_code =:whCode";
			sqlWhere1 += " and b.wid_wh_code =:whCode";
			sqlParaMap.put("whCode", whCode);
		}
		if (StringUtils.isNotBlank(districtCode)) {
			sqlWhere += " and t.wsi_district_code =:districtCode";
			sqlWhere1 += " and b.wid_district_code =:districtCode";
			sqlParaMap.put("districtCode", districtCode);
		}
		if (StringUtils.isNotBlank(storageCode)) {
			sqlWhere += " and t.wsi_storage_code =:storageCode";
			sqlWhere1 += " and b.wid_storage_code =:storageCode";
			sqlParaMap.put("storageCode", storageCode);
		}
		if (StringUtils.isNotBlank(storeEmp)) {
			sqlWhere += " and  t8.WIC_CTRL_EMP=:storeEmp";
			sqlWhere1 += " and t8.WIC_CTRL_EMP =:storeEmp";
			sqlParaMap.put("storeEmp", storeEmp);
		}
		String sql = "select t.wsi_item_code,SUM(t.wsi_item_num) item_num,"
				+ "(SELECT a.ci_item_name FROM t_co_item a WHERE a.ci_item_code=t.wsi_item_code and a.DATA_AUTH=:auth5) ci_item_name,"
				+ "(SELECT b.ci_item_spec FROM t_co_item b WHERE b.ci_item_code=t.wsi_item_code and b.DATA_AUTH=:auth6) ci_item_spec "
				+ "from T_WMS_STOCK_INFO t ";
		sqlParaMap.put("auth5", auth);
		sqlParaMap.put("auth6", auth);
		if (!storeEmp.equals("")) {
			sql += "LEFT JOIN T_WMS_ITEM_CONTRAL t8 ON t8.WIC_ITEM_CODE=t.wsi_item_code and t8.DATA_AUTH=:auth4 ";
			sqlParaMap.put("auth4", auth);
		}
		sql += "where 1=1 and NOT exists(select 1 from T_WMS_INVENTORY_DETAIL a where a.WID_ITEM_SN=t.WSI_ITEM_SN"
				+ " and a.DATA_AUTH=:auth3 ) and t.DATA_AUTH=:auth2 ";
		String groupSql = " GROUP BY t.wsi_item_code ";
		String querySql = null;
		sqlParaMap.put("auth2", auth);
		sqlParaMap.put("auth3", auth);
		if (StringUtils.isNotBlank(invenCount)) {
			sql += " and t.WSI_ITEM_SN IN(SELECT B.WID_ITEM_SN FROM T_WMS_INVENTORY_DETAIL_L b "
					+ "WHERE b.wid_inventory_time>= trunc(sysdate, 'month')  and b.DATA_AUTH=:auth1 "
					+ "AND b.wid_inventory_time<=trunc(last_day(sysdate)) " + sqlWhere1
					+ " GROUP BY B.WID_ITEM_SN HAVING COUNT(b.wid_item_sn) =:invenCount)";
			sqlParaMap.put("invenCount", invenCount);
			sqlParaMap.put("auth1", auth);
			querySql = " select * from(" + sql + groupSql + ")aa ";
		} else {
			querySql = " select * from(" + sql + sqlWhere + groupSql + ")aa ";
		}

		List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}