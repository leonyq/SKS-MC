package com.more.mes.smt.wmsoutstock;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产领料---新增---加载料表信息
 * 
 * @author development
 */
public class AjaxGetItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String type = request.getParameter("type");
		String sql = "";
		if ("empty".equals(type)) {
			sql = "SELECT DISTINCT A.*,B.WSI_ITEM_NUM FROM (SELECT DISTINCT T.CMD_ITEM_CODE, "
					+ " T3.PM_MO_NUMBER PROJECT_ID, " + " T4.CI_ITEM_NAME, " + " T4.CI_MIN_PACK, "
					+ " T4.CI_ITEM_SPEC, " + " T.CMD_POINT_NUM, "
					+ " RANK() OVER(PARTITION BY T.CMD_ITEM_CODE ORDER BY NVL(T.CMD_POINT_NUM, 0)) RN "
					+ " FROM T_CO_MATERIAL_DETAIL T " + " LEFT JOIN T_CO_ITEM T4 "
					+ " ON T.CMD_ITEM_CODE = T4.CI_ITEM_CODE " + " LEFT JOIN T_CO_MATERIAL_TABLE T1 "
					+ " ON T.CM_SN = T1.CM_SN " + " LEFT JOIN T_PM_MO_BASE T3 "
					+ " ON T3.PM_MODEL_CODE = T1.CM_MODEL_CODE "
					+ " AND T3.PM_PROCESS_FACE = T1.CM_PROCESS_FACE WHERE T1.CM_PROCESS_FACE='-1') A "
					+ " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM "
					+ " FROM T_WMS_STOCK_INFO T6 GROUP BY T6.WSI_ITEM_CODE) B ON A.CMD_ITEM_CODE = B.WSI_ITEM_CODE ";
		} else {
			sql = "SELECT DISTINCT A.*,B.WSI_ITEM_NUM,NVL(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT FROM (SELECT DISTINCT T.CMD_ITEM_CODE, "
					+ " T3.PM_MO_NUMBER PROJECT_ID, " + " T4.CI_ITEM_NAME, " + " T4.CI_MIN_PACK, "
					+ " T4.CI_ITEM_SPEC, " + " T.CMD_POINT_NUM, "
					+ " RANK() OVER(PARTITION BY T.CMD_ITEM_CODE ORDER BY NVL(T.CMD_POINT_NUM, 0)) RN "
					+ " FROM T_CO_MATERIAL_DETAIL T " + " LEFT JOIN T_CO_ITEM T4 "
					+ " ON T.CMD_ITEM_CODE = T4.CI_ITEM_CODE " + " LEFT JOIN T_CO_MATERIAL_TABLE T1 "
					+ " ON T.CM_SN = T1.CM_SN " + " LEFT JOIN T_PM_MO_BASE T3 "
					+ " ON T3.PM_MODEL_CODE = T1.CM_MODEL_CODE " + " AND T3.PM_PROCESS_FACE = T1.CM_PROCESS_FACE ) A "
					+ " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM "
					+ " FROM T_WMS_STOCK_INFO T6 GROUP BY T6.WSI_ITEM_CODE) B ON A.CMD_ITEM_CODE = B.WSI_ITEM_CODE "
					+ " LEFT JOIN T_MID_EXCEED_ITEM_INFO D " + " ON C.CMD_ITEM_CODE = D.MEI_ITEM_CODE ";
		}
		List itemList = modelService.listSql(sql, null, null, null, null, null);
		// modelAction.setAjaxPage(modelAction.getPage());
		// modelAction.getAjaxPage().setDataList(itemList);
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.setAjaxList(itemList);
		return BaseActionSupport.AJAX;
	}
}
