package com.more.mes.smt.wmsoutstock;

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
 * 生产领料---获取所有料表信息
 * 
 * @author development
 */
public class AjaxAllItemInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {// /
		HttpServletRequest request = modelAction.getRequest();
		String moNum = request.getParameter("moNum");
		String proFace = request.getParameter("proFace");
		// 用量 其中一条

		/*
		 * String sql =
		 * "SELECT DISTINCT C.*,B.WSI_ITEM_NUM,NVL(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT FROM ( SELECT A.* "
		 * + " FROM (SELECT DISTINCT T.CMD_ITEM_CODE, " +
		 * " T3.PM_MO_NUMBER PROJECT_ID, " + " T4.CI_ITEM_NAME, " + " T4.CI_MIN_PACK, "
		 * + " T4.CI_ITEM_SPEC, " + " T.CMD_POINT_NUM, " +
		 * " RANK() OVER(PARTITION BY T.CMD_ITEM_CODE ORDER BY NVL(T.CMD_POINT_NUM, 0)) RN "
		 * + " FROM T_CO_MATERIAL_DETAIL T " + " LEFT JOIN T_CO_ITEM T4 " +
		 * " ON T.CMD_ITEM_CODE = T4.CI_ITEM_CODE " +
		 * " LEFT JOIN T_CO_MATERIAL_TABLE T1 " + " ON T.CM_SN = T1.CM_SN " +
		 * " LEFT JOIN T_PM_MO_BASE T3 " + " ON T3.PM_MODEL_CODE = T1.CM_MODEL_CODE " +
		 * " AND T3.PM_PROCESS_FACE = T1.CM_PROCESS_FACE "; String sqlWhere = ""; if
		 * (StringUtils.isNotBlank(moNum)) { sql += " WHERE T3.PM_MO_NUMBER=  '" + moNum
		 * + "'"; } if (StringUtils.isNotBlank(proFace) && !"-1".equals(proFace)) { sql
		 * += " AND T1.CM_PROCESS_FACE = '" + proFace + "'"; } sql +=
		 * " ) A WHERE A.RN = 1 ) C";
		 */

		// 算用量总数
		String sql = "SELECT DISTINCT C.*,B.WSI_ITEM_NUM,coalesce(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT "
				+ " FROM (SELECT A.* " + " FROM (SELECT DISTINCT T.CMD_ITEM_CODE, " + " T3.PM_MO_NUMBER PROJECT_ID, "
				+ " T4.CI_ITEM_NAME, " + " T4.CI_MIN_PACK, " + " T4.CI_ITEM_SPEC, "
				+ " SUM(T.CMD_POINT_NUM) CMD_POINT_NUM " + " FROM T_CO_MATERIAL_DETAIL T " + " LEFT JOIN T_CO_ITEM T4 "
				+ " ON T.CMD_ITEM_CODE = T4.CI_ITEM_CODE " + " LEFT JOIN T_CO_MATERIAL_TABLE T1 "
				+ " ON T.CM_SN = T1.CM_SN " + " LEFT JOIN T_PM_MO_BASE T3 " + " ON T3.PM_MODEL_CODE = T1.CM_MODEL_CODE "
				+ " AND T3.PM_PROCESS_FACE = T1.CM_PROCESS_FACE " + " group by T.CMD_ITEM_CODE, " + " T3.PM_MO_NUMBER, "
				+ " T4.CI_ITEM_NAME, " + " T4.CI_MIN_PACK, " + " T4.CI_ITEM_SPEC ";
		Map<String, String> map = new HashMap<String, String>();
		String sqlWhere = " where 1=1 ";
		if (StringUtils.isNotBlank(moNum)) {
			sql += " WHERE T3.PM_MO_NUMBER= :moNum ";
			map.put("moNum", moNum);
		}
		if (StringUtils.isNotBlank(proFace) && !"-1".equals(proFace)) {
			sql += " AND T1.CM_PROCESS_FACE =:proFace ";
			map.put("proFace", proFace);
		}

		sql += " ) A WHERE 1 = 1) C";

		sql += " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T6  GROUP BY T6.WSI_ITEM_CODE) B ";
		sql += " ON C.CMD_ITEM_CODE = B.WSI_ITEM_CODE ";
		sql += " LEFT JOIN T_MID_EXCEED_ITEM_INFO D " + " ON C.CMD_ITEM_CODE = D.MEI_ITEM_CODE ";
		List itemList = modelService.listSql(sql, modelAction.getPage(), map, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
