package com.more.mes.smt.wmsoutstock.etstock.addfp.oracle;

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
 * @ClassName:SearchItem
 * @Description: 委外发料---新增--查询物料信息
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月26日上午2:41:17
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SearchItem implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		List itemList;
		String cnt = "0";
		Map<String, Object> map = new HashMap();
		// modelAction.setAjaxPage(modelAction.getPage());
		modelAction.setAjaxMap(map);
		try {
			String supCode = modelAction.getParaMap().get("supCode");
			String itemCode = modelAction.getParaMap().get("itemCode");
			String existCode = modelAction.getParaMap().get("existCode");
			String codes = modelAction.getParaMap().get("codes");
			String projectId = modelAction.getParaMap().get("projectId");
			String dataAuth = modelAction.getParaMap().get("dataAuth");

			String sql = " SELECT DISTINCT C.*, B.WSI_ITEM_NUM, NVL(D.wos_item_rn, 0) WOS_ITEM_RN  , NVL(D.wos_item_n, 0) WOS_ITEM_N    "
					+ "    FROM (SELECT T1.PROJECT_ID       PROJECT_ID,       "
					+ "         T1.cust_code        CUST_CODE,         " + "       T1.product_count    PLAN_NUM,      "
					+ "         T1.product_material MATERIAL,          " + "      T1.project_step     STEP,          "
					+ "      T2.id               cb_bomid,         " + "   T2.ID  ID,        "
					+ "     T2.cbd_item_code    CBD_ITEM_CODE,          "
					+ "     T2.cbd_item_num     CBD_ITEM_NUM,     "
					+ "           T2.output_rate      OUTPUT_RATE,              "
					+ "   T4.ci_item_name     CBD_ITEM_NAME,             " + "   T4.CI_ITEM_SPEC     CBD_ITEM_SPEC     "
					+ "   from (SELECT *   FROM T_PM_PROJECT_BASE     WHERE PROJECT_ID = '" + projectId + "' ) T1   "
					+ "   left join T_PM_PROJECT_DETAIL T2     ON T2.PROJECT_ID = T1.PROJECT_ID   AND T1.DATA_AUTH='"
					+ dataAuth + "'   "
					+ "    LEFT JOIN T_CO_ITEM T4         ON T2.CBD_ITEM_CODE = T4.CI_ITEM_CODE AND T4.DATA_AUTH='"
					+ dataAuth + "' WHERE T2.DATA_AUTH='" + dataAuth + "') C  "
					+ "    LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM     "
					+ "    FROM T_WMS_STOCK_INFO T6   WHERE T6.DATA_AUTH='" + dataAuth
					+ "'   GROUP BY T6.WSI_ITEM_CODE) B  ON C.CBD_ITEM_CODE = B.WSI_ITEM_CODE "
					+ "    LEFT JOIN T_WMS_OUTSOURCE_STOCK D  ON C.CBD_ITEM_CODE = D.WOS_ITEM_CO  AND D.WOS_SUP_CO = '"
					+ supCode + "' AND D.DATA_AUTH='" + dataAuth + "' ";
			String sqlWhere = " AND  C.CBD_ITEM_CODE IS NOT NULL ";
			sqlWhere = " AND  C.data_auth='" + dataAuth + "' ";

			if (StringUtils.isNotBlank(itemCode)) {
				sqlWhere += " and C.CBD_ITEM_CODE like '%" + itemCode + "%'";
			}
			if (StringUtils.isNotBlank(existCode)) {
				String[] str = existCode.split(",");
				for (int i = 0; i < str.length; i++) {
					sqlWhere += " and C.ID != '" + str[i] + "'";
				}
			}
			if (StringUtils.isNotBlank(codes)) {
				String[] str1 = codes.split(",");
				for (int i = 0; i < str1.length; i++) {
					sqlWhere += " and C.CBD_ITEM_CODE != '" + str1[i] + "'";
				}
			}
			// 计算当前投入量
			String cntsql = "  SELECT NVL(sum( NVL(ET_FQC_COUNT,0)),0)  ET_FQC_COUNTS  FROM  T_WMS_OUTSTOCK_DOC A WHERE ET_CONECT_PROJECT_ID = ? AND wod_doc_type ='DJ27'  ";
			List<Map<String, Object>> clist = modelService.listDataSql(cntsql, new Object[] { projectId });
			if (null != clist && !"".equals(clist) && clist.size() > 0) {
				cnt = (clist.get(0).get("ET_FQC_COUNTS")).toString();
			}

			// modelAction.setAjaxMap(new HashMap<String,Object>());
			// 获得已投入数量
			itemList = modelService.listSql(sql, null, sqlWhere, null, null, null);
			modelAction.getAjaxMap().put("ET_FQC_COUNTS", cnt);
			CommMethod.listMapToEscapeJs(itemList);
			modelAction.setAjaxList(itemList);
		} catch (Exception e) {
			modelAction.getAjaxMap().put("error", e);
			return BaseActionSupport.AJAX;
		}

		return BaseActionSupport.AJAX;
	}

}
