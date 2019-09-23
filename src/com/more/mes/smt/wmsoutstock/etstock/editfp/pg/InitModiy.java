package com.more.mes.smt.wmsoutstock.etstock.editfp.pg;

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
 * @ClassName:InitModiy
 * @Description: 委外发料---修改页面获取数据
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月28日下午5:13:28
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class InitModiy implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		List<Map<String, Object>> itemList;// 工单关联的物料信息
		String cnt = "0";
		Map<String, Object> map = new HashMap();
		// modelAction.setAjaxPage(modelAction.getPage());
		modelAction.setAjaxMap(map);
		try {
			HttpServletRequest request = modelAction.getRequest();
			String docItemId = modelAction.getParaMap().get("docItemId");
			String docNum = request.getParameter("paraMap.docNum");
			// String projectId= modelAction.getParaMap().get("projectId");
			String sql = "    SELECT   T4.SUPPLIER_NAME SUPPLIER_NAME, WOD_DOC_NUM  ,WOD_URGENT_FLAG, ET_CONECT_PROJECT_ID ,ET_FQC_COUNT,PRODUCT_COUNT,"
					+ "   to_char(WOD_OUTSTOCK_DATE,'yyyy-mm-dd') WOD_OUTSTOCK_DATE,   WOD_SUP_CODE ,WOD_DOC_TYPE, WOD_MEMO ,  PRODUCT_MATERIAL,  CI_ITEM_NAME , CI_ITEM_SPEC"
					+ " FROM  (SELECT  " + "  WOD_DOC_NUM  ,WOD_URGENT_FLAG, ET_CONECT_PROJECT_ID , ET_FQC_COUNT, "
					+ "   WOD_OUTSTOCK_DATE,   WOD_SUP_CODE ,WOD_DOC_TYPE, WOD_MEMO "
					+ " FROM T_WMS_OUTSTOCK_DOC WHERE WOD_DOC_NUM = ? ) T1 "// C01-ET-20180428001
					+ " LEFT JOIN T_PM_PROJECT_BASE  T2 ON T1.ET_CONECT_PROJECT_ID = T2.PROJECT_ID "
					+ " LEFT JOIN T_CO_ITEM T3 ON  T2.PRODUCT_MATERIAL = T3.CI_ITEM_CODE "
					+ "  left join T_CO_SUPPLIER t4 on t1.wod_sup_code = t4.supplier_code  ";

			// 获得初始数据
			itemList = modelService.listDataSql(sql, new Object[] { docNum });
			Map<String, Object> initMap = new HashMap();
			if (null != itemList && itemList.size() > 0) {
				initMap = itemList.get(0);
			}
			String projectId = String.valueOf(initMap.get("ET_CONECT_PROJECT_ID"));

			// 计算当前 相对投入量 = 总投入量 - 该出库单投入量 注： 页面用投入量+输入值 > 计划数 做判断
			String cntsql = "  SELECT sum( coalesce(ET_FQC_COUNT,0)) ET_FQC_COUNTS  FROM  T_WMS_OUTSTOCK_DOC A WHERE ET_CONECT_PROJECT_ID = ? AND wod_doc_type ='DJ27'  ";
			List<Map<String, Object>> clist = modelService.listDataSql(cntsql, new Object[] { projectId });
			if (null != clist && !"".equals(clist) && clist.size() > 0) {
				// 获得已投入数量
				cnt = (clist.get(0).get("ET_FQC_COUNTS")).toString();
			}
			int etfacnt = 0;
			if (null != initMap.get("ET_FQC_COUNT") && !"".equals(initMap.get("ET_FQC_COUNT"))) {
//        etfacnt = ((BigDecimal)initMap.get("ET_FQC_COUNT")).intValue();
				etfacnt = (Integer.parseInt(initMap.get("ET_FQC_COUNT").toString()));
			}
			modelAction.getAjaxMap().put("ET_FQC_COUNTS", Integer.parseInt(cnt) - etfacnt);
			modelAction.getAjaxMap().put("initMap", initMap);

			// 查物料信息
			sql = "SELECT DISTINCT C.*, B.WSI_ITEM_NUM" + "           , coalesce(D.wos_item_rn, 0) WOS_ITEM_RN"
					+ "           , coalesce(D.wos_item_n, 0) WOS_ITEM_N"
					+ "  FROM ( SELECT T3.PROJECT_ID       PROJECT_ID," + "         T3.CUST_CODE        CUST_CODE,"
					+ "         T3.PRODUCT_COUNT    PLAN_NUM," + "         T3.PRODUCT_MATERIAL MATERIAL,"
					+ "         T3.PROJECT_STEP     STEP,"
					+ "         T1.ID  ID,  T1.WOI_REQUEST_NUM  WOI_REQUEST_NUM ,"
					+ "    T1.WOI_WH_CODE  WOI_WH_CODE,     T1.ET_SUP_CODE  DEVICE_SUP_CODE,to_char(T1.WOI_DELIVERY_DATE,'yyyy-mm-dd') WOI_DELIVERY_DATE , "
					+ "         T2.ci_item_code     CBD_ITEM_CODE,"
					+ "         T1.woi_cbd_item_num      CBD_ITEM_NUM,  T1.ET_ITEM_USERNUM       ET_ITEM_USERNUM, "
					+ "         T1.woi_output_rate       OUTPUT_RATE," + "         T2.ci_item_name     CBD_ITEM_NAME,  "
					+ "         T2.CI_ITEM_SPEC     CBD_ITEM_SPEC"
					+ "    from (select * from  T_WMS_OUTSTOCK_item where woi_doc_num = ? ) T1 "
					+ "    left join T_CO_ITEM t2 on t1.woi_item_code = t2.ci_item_code "
					+ "    left join T_PM_PROJECT_BASE t3 on  t1.woi_connect_doc  = t3.project_id ) C"
					+ "    LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM"
					+ "         FROM T_WMS_STOCK_INFO T6" + "        GROUP BY T6.WSI_ITEM_CODE) B"
					+ " ON C.CBD_ITEM_CODE = B.WSI_ITEM_CODE" + " LEFT JOIN T_WMS_OUTSOURCE_STOCK D"
					+ " ON C.CBD_ITEM_CODE = D.WOS_ITEM_CO AND C.DEVICE_SUP_CODE = D.WOS_SUP_CO WHERE C.CBD_ITEM_CODE IS NOT NULL ORDER BY CBD_ITEM_CODE ";
			itemList = modelService.listDataSql(sql, new Object[] { docNum });
			CommMethod.listMapToEscapeJs(itemList);
			modelAction.setAjaxList(itemList);
			// 物料 余量信息
			sql = " select wos_item_co , wos_item_rn  from T_WMS_OUTSOURCE_STOCK"
					+ " where wos_sup_co = ? and wos_item_co in"
					+ " (select cbd_item_code  from (SELECT ID from T_CO_BOM "
					+ "where CB_ITEM_CODE = ? AND CB_DEFAULT = 'Y' AND CB_STATUS = 'Y') T1  "
					+ "     LEFT JOIN T_CO_BOM_DETAIL T2      ON T1.ID = T2.cb_bomid)";

			List<Map<String, Object>> rnList = modelService.listDataSql(sql,
					new Object[] { initMap.get("WOD_SUP_CODE"), initMap.get("PRODUCT_MATERIAL") });
			Map<String, Object> rnMap = new HashMap();
			if (null != rnList && rnList.size() > 0) {
				rnMap = rnList.get(0);
			}
			modelAction.setAjaxString(docNum);

		} catch (Exception e) {
			modelAction.getAjaxMap().put("error", e);
			e.printStackTrace();
			return BaseActionSupport.AJAX;
		}

		return BaseActionSupport.AJAX;
	}

}
