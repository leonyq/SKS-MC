package com.more.mes.smt.wmsrecheckstock.pg;

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
 * 库存复检加载复检信息
 * 
 * @author development
 *
 */
public class AjaxGetRecheckInfo implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemSn = request.getParameter("itemSn");
		String itemCode = request.getParameter("itemCode");
		String custCode = request.getParameter("custCode");
		String supCode = request.getParameter("supCode");
		String whCode = request.getParameter("whCode"); // 仓库
		String itemLot = request.getParameter("itemLot");// 物料批次
		String outBegin = request.getParameter("outBegin");// 复检到期时间
		String outEnd = request.getParameter("outEnd");
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT DISTINCT t.*,to_char((t.wsi_test_time + (c.ci_recheck_days || 'day')::interval),'yyyy-mm-dd hh24:mi:ss') RECHECKOUT,"
				+ "d.wa_area_name wh_name,"
				+ "CASE WHEN (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval)<now() THEN 'Y' "
				+ "ELSE 'N' END outTime,"
				+ "c.ci_item_name,c.ci_item_spec,t1.supplier_name,t2.customer,c.ci_recheck_days,"
				+ "to_char(t.wsi_test_time,'yyyy-mm-dd hh24:mi:ss') test_time,"
				+ "to_char(t.wsi_receive_time,'yyyy-mm-dd hh24:mi:ss') receive_time " + "FROM t_wms_stock_info t "
				+ "LEFT JOIN T_QM_INSEPCT_PARENT_INFO a ON a.qip_sn=t.wsi_item_sn and  a.DATA_AUTH=:auth "
				+ "AND (a.QIP_TEST_FLAG ='1' OR a.QIP_TEST_FLAG ='3' OR a.QIP_TEST_FLAG IS NULL) "
				+ "LEFT JOIN t_co_item c ON c.ci_item_code=t.wsi_item_code and  c.DATA_AUTH=:auth1 "
				+ "LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wsi_wh_code  and  d.DATA_AUTH=:auth2  "
				+ "LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wsi_sup_code and t1.DATA_AUTH=:auth3  "
				+ "LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wsi_cust_code and t2.DATA_AUTH=:auth4  ";
		String sqlWhere = " where 1=1 and t.WSI_STOCK_FLAG='2' and t.DATA_AUTH=:auth5  ";
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		sqlParaMap.put("auth", auth);
		sqlParaMap.put("auth1", auth);
		sqlParaMap.put("auth2", auth);
		sqlParaMap.put("auth3", auth);
		sqlParaMap.put("auth4", auth);
		sqlParaMap.put("auth5", auth);
		if (StringUtils.isNotBlank(itemSn)) {
			sqlWhere += " and t.WSI_ITEM_SN like '%' || :itemSn || '%' ";
			sqlParaMap.put("itemSn", itemSn);
		}
		if (StringUtils.isNotBlank(itemCode)) {
			sqlWhere += " and t.WSI_ITEM_CODE = :itemCode ";
			sqlParaMap.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(custCode)) {
			sqlWhere += " and t.wsi_cust_code = :custCode ";
			sqlParaMap.put("custCode", custCode);
		}
		if (StringUtils.isNotBlank(supCode)) {
			sqlWhere += " and t.wsi_sup_code = :supCode";
			sqlParaMap.put("supCode", supCode);
		}
		if (StringUtils.isNotBlank(whCode)) {
			sqlWhere += " and t.wsi_wh_code = :whCode";
			sqlParaMap.put("whCode", whCode);
		}
		if (StringUtils.isNotBlank(itemLot)) {
			sqlWhere += " and t.WSI_LOT_NO like '%' || :itemLot || '%' ";
			sqlParaMap.put("itemLot", itemLot);
		}
		if (StringUtils.isNotBlank(outBegin)) {
			sqlWhere += " and (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval) > to_date(:outBegin,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("outBegin", outBegin);
		}
		if (StringUtils.isNotBlank(outEnd)) {
			sqlWhere += " and (t.wsi_test_time + (c.ci_recheck_days || 'day')::interval) < to_date(:outEnd,'yyyy-mm-dd hh24:mi:ss')";
			sqlParaMap.put("outEnd", outEnd);
		}
		sql = "select * from(" + sql + sqlWhere + " ORDER BY outTime DESC,t.wsi_test_time,t.wsi_receive_time ) aa";
		List itemList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
