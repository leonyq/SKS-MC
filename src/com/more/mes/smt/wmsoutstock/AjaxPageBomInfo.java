package com.more.mes.smt.wmsoutstock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 生产领料---机种BOM分页
 * 
 * @author development
 */
public class AjaxPageBomInfo implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String bomCode = modelAction.getParaMap().get("bomCode");
		String tempStr = "";
		try {
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			Map<String, String> map = new HashMap<String, String>();
			String sqlWhere = "SELECT DISTINCT C.*,B.WSI_ITEM_NUM,NVL(D.MEI_ITEM_COUNT, 0) MEI_ITEM_COUNT FROM (SELECT A.* FROM ( SELECT T.CB_ITEM_CODE, "
					+ " T2.CBD_ITEM_CODE CMD_ITEM_CODE, " + " T3.CI_ITEM_NAME  CI_ITEM_NAME, "
					+ " T3.CI_ITEM_SPEC  CI_ITEM_SPEC, " + " T2.CBD_ITEM_NUM  CMD_POINT_NUM ,T.DATA_AUTH "
					+ " FROM T_CO_BOM_DETAIL T2  " + " LEFT JOIN T_CO_BOM T "
					+ " ON T.ID = T2.CB_BOMID and T2.DATA_AUTH = T.DATA_AUTH  " + " LEFT JOIN T_CO_ITEM T3 "
					+ " ON T2.CBD_ITEM_CODE = T3.CI_ITEM_CODE and T3.DATA_AUTH = T.DATA_AUTH   where 1=1 ";
			sqlWhere += " AND T.CB_DEFAULT = 'Y' and T.DATA_AUTH= :dataAuth ";
			map.put("dataAuth", dataAuth);
			if (StringUtils.isNotBlank(bomCode)) {
				sqlWhere += " AND T.CB_ITEM_CODE = '" + bomCode + "' AND T.DATA_AUTH = '" + dataAuth + "'";
			}
			sqlWhere += " ) A ) C ";
			sqlWhere += " LEFT JOIN (SELECT T6.WSI_ITEM_CODE, SUM(T6.WSI_ITEM_NUM) WSI_ITEM_NUM FROM T_WMS_STOCK_INFO T6  GROUP BY T6.WSI_ITEM_CODE) B ";
			sqlWhere += " ON C.CMD_ITEM_CODE = B.WSI_ITEM_CODE   ";
			sqlWhere += " LEFT JOIN T_MID_EXCEED_ITEM_INFO D "
					+ " ON C.CMD_ITEM_CODE = D.MEI_ITEM_CODE and D.DATA_AUTH=C.DATA_AUTH ";
			List itemList = modelService.listSql(sqlWhere, null, map, null, null);
			// modelAction.setAjaxPage(modelAction.getPage());
			// modelAction.getAjaxPage().setDataList(itemList);
			CommMethod.listToEscapeJs(itemList);
			modelAction.setAjaxList(itemList);
		} catch (Exception e) {
			log.error(e);
			tempStr = StringUtils.toString(e);
		}
		modelAction.setAjaxString(tempStr);
		return BaseActionSupport.AJAX;
	}

}
