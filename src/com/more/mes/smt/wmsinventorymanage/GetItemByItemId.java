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
 * 盘点单通过物料id获取明细
 * 
 * @author development
 *
 */
public class GetItemByItemId implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String itemId = request.getParameter("itemId");// 物料id
		String itemCode = request.getParameter("itemCode");
		String dataAuth = request.getParameter("dataAuth");
		String docNum = request.getParameter("docNum");// 盘点单号
		String status = request.getParameter("status");// 查询条件 单据状态
		String docStatus = request.getParameter("docStatus");// 单据状态
		String userId = modelAction.getUser().getId();
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		if (StringUtils.isNotBlank(docStatus)) { // 如果有单据状态，则是点击查询

			String tableName = "";
			if (docStatus.equals("3") || docStatus.equals("4")) { // 如果单据类型为关结
				tableName = "T_WMS_INVENTORY_DETAIL_L";
			} else {
				tableName = "T_WMS_INVENTORY_DETAIL";
			}
			String sql = "SELECT t.*,a.ci_item_name,a.ci_item_spec,b.wa_area_name wh_name,t3.name,"
					+ "c.wa_area_name district_name,d.wa_area_name storage_name,t1.supplier_name,"
					+ "t2.customer,to_char(t.wid_inventory_time,'yyyy-mm-dd hh24:mi:ss') inventory_time,T5.NAME AS DATANAME "
					+ "FROM " + tableName + " t ";

			Map<String, String> sqlParaMap = new HashMap<String, String>();
// 			if(StringUtils.isNotBlank(itemId)){
// 				sql += " and t.WID_ITEM_ID = :itemId ";
// 				sqlParaMap.put("itemId", itemId);
// 			}
// 			if(StringUtils.isNotBlank(itemCode)){
// 				sql += " and t.WID_ITEM_CODE like '%' || :itemCode || '%' ";
// 				sqlParaMap.put("itemCode", itemCode);
// 			}
			if (StringUtils.isNotBlank(dataAuth)) {

				sql += " LEFT JOIN t_co_item a ON a.ci_item_code=t.wid_item_code " + " and a.DATA_AUTH = t.DATA_AUTH "
						+ " LEFT JOIN t_wms_area b ON b.wa_area_sn=t.wid_wh_code " + " and b.DATA_AUTH = t.DATA_AUTH "
						+ " LEFT JOIN t_wms_area c ON c.wa_area_sn=t.wid_district_code "
						+ " and c.DATA_AUTH =t.DATA_AUTH "
						+ " LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wid_storage_code "
						+ " and d.DATA_AUTH =t.DATA_AUTH "
						+ " LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wid_sup_code "
						+ " and t1.DATA_AUTH =t.DATA_AUTH "
						+ " LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wid_cust_code "
						+ " and t2.DATA_AUTH =t.DATA_AUTH "
						+ " LEFT JOIN sy_user t3 ON t3.login_name=t.wid_inventory_emp "
						+ " LEFT JOIN T_WMS_INVENTORY_DOC t4 ON t4.wid_doc_num=t.wid_doc_num "
						+ " and t4.DATA_AUTH =t.DATA_AUTH " + " LEFT JOIN SY_DEPT T5 ON  T5.ID = T.DATA_AUTH " +
						// " and t5.DATA_AUTH = :dataAuth9 " +
						" where 1=1 and t.DATA_AUTH = :dataAuth ";
				sqlParaMap.put("dataAuth", dataAuth);
				// sqlParaMap.put("dataAuth9", dataAuth);
			} else {

				sql += " LEFT JOIN t_co_item a ON a.ci_item_code=t.wid_item_code "
						+ " and a.DATA_AUTH  in( t.DATA_AUTH ) "
						+ " LEFT JOIN t_wms_area b ON b.wa_area_sn=t.wid_wh_code "
						+ " and  b.DATA_AUTH in( t.DATA_AUTH ) "
						+ " LEFT JOIN t_wms_area c ON c.wa_area_sn=t.wid_district_code "
						+ " and c.DATA_AUTH in( t.DATA_AUTH ) "
						+ " LEFT JOIN t_wms_area d ON d.wa_area_sn=t.wid_storage_code "
						+ " AND d.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ " LEFT JOIN t_co_supplier t1 ON t1.supplier_code=t.wid_sup_code "
						+ " AND t1.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ " LEFT JOIN t_co_customer t2 ON t2.cust_code=t.wid_cust_code "
						+ " AND t2.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ " LEFT JOIN sy_user t3 ON t3.login_name=t.wid_inventory_emp "
						+ " LEFT JOIN T_WMS_INVENTORY_DOC t4 ON t4.wid_doc_num=t.wid_doc_num "
						+ " AND t4.DATA_AUTH IN ( t.DATA_AUTH )  " + " LEFT JOIN SY_DEPT T5 ON  T5.ID = T.DATA_AUTH " +
						// " and t5.DATA_AUTH = :dataAuth9 " +
						" where 1=1 "
						+ " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";
				sqlParaMap.put("userId1", userId);
				// sqlParaMap.put("userId9", userId);
			}
			if (StringUtils.isNotBlank(itemId)) {
				sql += " and t.WID_ITEM_ID = :itemId ";
				sqlParaMap.put("itemId", itemId);
			}
			if (StringUtils.isNotBlank(itemCode)) {
				sql += " and t.WID_ITEM_CODE like '%' || :itemCode || '%' ";
				sqlParaMap.put("itemCode", itemCode);
			}

			if (StringUtils.isNotBlank(docNum)) {
				sql += " and t.WID_DOC_NUM like '%' || :docNum || '%' ";
				sqlParaMap.put("docNum", docNum);
			}
			if (StringUtils.isNotBlank(status)) {
				sql += " and t4.WID_STATUS = :status ";
				sqlParaMap.put("status", status);
			}
			if (StringUtils.isNotBlank(startTime)) {
				sql += "and t4.WID_CREATE_TIME >= to_timestamp(:startTime,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("startTime", startTime);
			}
			if (StringUtils.isNotBlank(endTime)) {
				sql += " and t4.WID_CREATE_TIME <= to_timestamp(:endTime,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("endTime", endTime);
			}
			List poList = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listMapToEscapeJs(poList);
			modelAction.getAjaxPage().setDataList(poList);

		} else { // 如果单据状态为空，则表示查询所有

			String sql = "select t.wid_item_sn,t.wid_doc_num,t.wid_item_code,t.wid_item_status,t.wid_stock_num,"
					+ "t.wid_inventory_num,t.wid_profit_num,t1.wa_area_name wh_name,t2.wa_area_name district_name,"
					+ "t3.wa_area_name storage_name,t4.supplier_name,t5.customer,t6.ci_item_name,t6.ci_item_spec,"
					+ "t7.name,to_char(t.wid_inventory_time,'yyyy-mm-dd hh24:mi:ss') inventory_time,T9.NAME AS DATANAME "
					+ "from T_WMS_INVENTORY_DETAIL t ";

			Map<String, String> sqlParaMap = new HashMap<String, String>();
			String sqlWhere = " where 1=1 ";
			if (StringUtils.isNotBlank(itemId)) {
				sqlWhere += " and t.WID_ITEM_ID = :itemId ";
				sqlParaMap.put("itemId", itemId);
			}
			if (StringUtils.isNotBlank(itemCode)) {
				sqlWhere += " and t.WID_ITEM_CODE like '%' || :itemCode || '%' ";
				sqlParaMap.put("itemCode", itemCode);
			}

			if (StringUtils.isNotBlank(docNum)) {
				sqlWhere += " and t.WID_DOC_NUM like '%' || :docNum || '%' ";
				sqlParaMap.put("docNum", docNum);
			}
			if (StringUtils.isNotBlank(status)) {
				sqlWhere += " and t8.WID_STATUS = :status ";
				sqlParaMap.put("status", status);
			}
			if (StringUtils.isNotBlank(startTime)) {
				sqlWhere += " and t8.WID_CREATE_TIME >= to_timestamp(:startTime,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("startTime", startTime);
			}
			if (StringUtils.isNotBlank(endTime)) {
				sqlWhere += " and t8.WID_CREATE_TIME <=to_timestamp(:endTime,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("endTime", endTime);
			}

			String sqlWhere1 = " where 1=1 ";
			if (StringUtils.isNotBlank(itemId)) {
				sqlWhere1 += " and a.WID_ITEM_ID = :itemId1 ";
				sqlParaMap.put("itemId1", itemId);
			}
			if (StringUtils.isNotBlank(itemCode)) {
				sqlWhere1 += " and a.WID_ITEM_CODE like '%' || :itemCode1 || '%' ";
				sqlParaMap.put("itemCode1", itemCode);
			}

			if (StringUtils.isNotBlank(docNum)) {
				sqlWhere1 += " and a.WID_DOC_NUM like '%' || :docNum1 || '%' ";
				sqlParaMap.put("docNum1", docNum);
			}
			if (StringUtils.isNotBlank(status)) {
				sqlWhere1 += " and tt8.WID_STATUS = :status1 ";
				sqlParaMap.put("status1", status);
			}
			if (StringUtils.isNotBlank(startTime)) {
				sqlWhere1 += " and tt8.WID_CREATE_TIME >= to_timestamp(:startTime1,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("startTime1", startTime);
			}
			if (StringUtils.isNotBlank(endTime)) {
				sqlWhere1 += " and tt8.WID_CREATE_TIME <=to_timestamp(:endTime1,'yyyy-mm-dd hh24:mi:ss') ";
				sqlParaMap.put("endTime1", endTime);
			}

			if (StringUtils.isNotBlank(dataAuth)) {
				sqlWhere += " and t.DATA_AUTH = :dataAuth  ";
				sql += "LEFT JOIN t_wms_area t1 ON t1.wa_area_sn=t.wid_wh_code " + " and t1.DATA_AUTH =t.DATA_AUTH "
						+ "LEFT JOIN t_wms_area t2 ON t2.wa_area_sn=t.wid_district_code "
						+ " and t2.DATA_AUTH = t.DATA_AUTH "
						+ "LEFT JOIN t_wms_area t3 ON t3.wa_area_sn=t.wid_storage_code "
						+ "   and t3.DATA_AUTH =t.DATA_AUTH  "
						+ "LEFT JOIN t_co_supplier t4 ON t4.supplier_code=t.wid_sup_code "
						+ "  and t4.DATA_AUTH =t.DATA_AUTH "
						+ "LEFT JOIN t_co_customer t5 ON t5.cust_code=t.wid_cust_code "
						+ "  and t5.DATA_AUTH =t.DATA_AUTH  "
						+ "LEFT JOIN t_co_item t6 ON t6.ci_item_code=t.wid_item_code "
						+ " and t6.DATA_AUTH =t.DATA_AUTH "
						+ "LEFT JOIN sy_user t7 ON t7.login_name=t.wid_inventory_emp "
						+ "LEFT JOIN T_WMS_INVENTORY_DOC t8 ON t8.wid_doc_num=t.wid_doc_num "
						+ " and t8.DATA_AUTH =t.DATA_AUTH " + "LEFT JOIN SY_DEPT T9 ON  T9.ID = t.DATA_AUTH " +
						// " and t9.DATA_AUTH = :dataAuth9 " +
						sqlWhere;
				sqlParaMap.put("dataAuth", dataAuth);
				// sqlParaMap.put("dataAuth9", dataAuth);
			} else {
				sqlWhere += " and t.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 )";
				sql += "LEFT JOIN t_wms_area t1 ON t1.wa_area_sn=t.wid_wh_code "
						+ " and t1.DATA_AUTH  in( t.DATA_AUTH ) "
						+ "LEFT JOIN t_wms_area t2 ON t2.wa_area_sn=t.wid_district_code "
						+ " and t2.DATA_AUTH in( t.DATA_AUTH ) "
						+ "LEFT JOIN t_wms_area t3 ON t3.wa_area_sn=t.wid_storage_code "
						+ " and t3.DATA_AUTH in( t.DATA_AUTH ) "
						+ "LEFT JOIN t_co_supplier t4 ON t4.supplier_code=t.wid_sup_code "
						+ " AND t4.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ "LEFT JOIN t_co_customer t5 ON t5.cust_code=t.wid_cust_code "
						+ " AND t5.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ "LEFT JOIN t_co_item t6 ON t6.ci_item_code=t.wid_item_code "
						+ " AND t6.DATA_AUTH IN ( t.DATA_AUTH ) "
						+ "LEFT JOIN sy_user t7 ON t7.login_name=t.wid_inventory_emp "
						+ "LEFT JOIN T_WMS_INVENTORY_DOC t8 ON t8.wid_doc_num=t.wid_doc_num "
						+ "  AND t8.DATA_AUTH IN ( t.DATA_AUTH )  " + "LEFT JOIN SY_DEPT T9 ON  T9.ID = t.DATA_AUTH " +
						// " AND t9.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where
						// USER_ID=:userId10 ) " +
						sqlWhere;

				sqlParaMap.put("userId1", userId);
				// sqlParaMap.put("userId10", userId);
			}
			if (StringUtils.isNotBlank(dataAuth)) {
				sqlWhere1 += " and a.DATA_AUTH = :dataAuth8  ";
				sql += "UNION ALL "
						+ "SELECT a.wid_item_sn,a.wid_doc_num,a.wid_item_code,a.wid_item_status,a.wid_stock_num,"
						+ "a.wid_inventory_num,a.wid_profit_num,tt1.wa_area_name wh_name,"
						+ "tt2.wa_area_name district_name,tt3.wa_area_name storage_name,tt4.supplier_name,"
						+ "tt5.customer,tt6.ci_item_name,tt6.ci_item_spec,tt7.name,"
						+ "to_char(a.wid_inventory_time,'yyyy-mm-dd hh24:mi:ss') inventory_time,TT9.NAME AS DATANAME "
						+ "FROM T_WMS_INVENTORY_DETAIL_L a "
						+ "LEFT JOIN t_wms_area tt1 ON tt1.wa_area_sn=a.wid_wh_code "
						+ " and tt1.DATA_AUTH =a.DATA_AUTH "
						+ "LEFT JOIN t_wms_area tt2 ON tt2.wa_area_sn=a.wid_district_code "
						+ " and tt2.DATA_AUTH =a.DATA_AUTH "
						+ "LEFT JOIN t_wms_area tt3 ON tt3.wa_area_sn=a.wid_storage_code "
						+ "   and tt3.DATA_AUTH =a.DATA_AUTH  "
						+ "LEFT JOIN t_co_supplier tt4 ON tt4.supplier_code=a.wid_sup_code "
						+ " and tt4.DATA_AUTH =a.DATA_AUTH "
						+ "LEFT JOIN t_co_customer tt5 ON tt5.cust_code=a.wid_cust_code "
						+ "  and tt5.DATA_AUTH =a.DATA_AUTH  "
						+ "LEFT JOIN t_co_item tt6 ON tt6.ci_item_code=a.wid_item_code "
						+ "  and tt6.DATA_AUTH =a.DATA_AUTH "
						+ "LEFT JOIN sy_user tt7 ON tt7.login_name=a.wid_inventory_emp "
						+ "LEFT JOIN T_WMS_INVENTORY_DOC tt8 ON tt8.wid_doc_num=a.wid_doc_num "
						+ " and tt8.DATA_AUTH = a.DATA_AUTH  " + "LEFT JOIN SY_DEPT tt9 ON  tt9.ID = a.DATA_AUTH " +
						// " and tt9.DATA_AUTH = :dataAuth17 " +
						sqlWhere1;

				sqlParaMap.put("dataAuth8", dataAuth);
				// sqlParaMap.put("dataAuth17", dataAuth);
			} else {
				sqlWhere1 += " and a.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId9 ) ";
				sql += "UNION ALL "
						+ "SELECT a.wid_item_sn,a.wid_doc_num,a.wid_item_code,a.wid_item_status,a.wid_stock_num,"
						+ "a.wid_inventory_num,a.wid_profit_num,tt1.wa_area_name wh_name,"
						+ "tt2.wa_area_name district_name,tt3.wa_area_name storage_name,tt4.supplier_name,"
						+ "tt5.customer,tt6.ci_item_name,tt6.ci_item_spec,tt7.name,"
						+ "to_char(a.wid_inventory_time,'yyyy-mm-dd hh24:mi:ss') inventory_time,TT9.NAME AS DATANAME "
						+ "FROM T_WMS_INVENTORY_DETAIL_L a "
						+ "LEFT JOIN t_wms_area tt1 ON tt1.wa_area_sn=a.wid_wh_code "
						+ " and tt1.DATA_AUTH  in( a.DATA_AUTH )"
						+ "LEFT JOIN t_wms_area tt2 ON tt2.wa_area_sn=a.wid_district_code "
						+ " and  tt2.DATA_AUTH in( a.DATA_AUTH ) "
						+ "LEFT JOIN t_wms_area tt3 ON tt3.wa_area_sn=a.wid_storage_code "
						+ " and tt3.DATA_AUTH in( a.DATA_AUTH ) "
						+ "LEFT JOIN t_co_supplier tt4 ON tt4.supplier_code=a.wid_sup_code "
						+ " AND tt4.DATA_AUTH IN ( a.DATA_AUTH ) "
						+ "LEFT JOIN t_co_customer tt5 ON tt5.cust_code=a.wid_cust_code "
						+ " AND tt5.DATA_AUTH IN ( a.DATA_AUTH ) "
						+ "LEFT JOIN t_co_item tt6 ON tt6.ci_item_code=a.wid_item_code "
						+ " AND tt6.DATA_AUTH IN ( a.DATA_AUTH ) "
						+ "LEFT JOIN sy_user tt7 ON tt7.login_name=a.wid_inventory_emp "
						+ "LEFT JOIN T_WMS_INVENTORY_DOC tt8 ON tt8.wid_doc_num=a.wid_doc_num "
						+ " AND tt8.DATA_AUTH IN ( a.DATA_AUTH ) " + "LEFT JOIN SY_DEPT tt9 ON  tt9.ID = a.DATA_AUTH " +
						// " AND tt9.DATA_AUTH IN ( select DEPT_ID from sy_data_auth where
						// USER_ID=:userId18 ) " +
						sqlWhere1;

				sqlParaMap.put("userId9", userId);
				// sqlParaMap.put("userId18", userId);
			}

			String sql1 = "select * from (" + sql + " order by inventory_time desc )aa ";
			List poList = modelService.listSql(sql1, modelAction.getPage(), sqlParaMap, null, null);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listMapToEscapeJs(poList);
			modelAction.getAjaxPage().setDataList(poList);
		}
		return BaseActionSupport.AJAX;
	}

}
