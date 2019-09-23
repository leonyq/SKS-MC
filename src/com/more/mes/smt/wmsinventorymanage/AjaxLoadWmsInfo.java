package com.more.mes.smt.wmsinventorymanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据仓库代码加载信息
 * 
 * @author development
 *
 */
public class AjaxLoadWmsInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String whCode = request.getParameter("whCode");// 仓库
		String DISTRICT_CODE = request.getParameter("DISTRICT_CODE");// 库区
		String sql = "SELECT t.wa_area_sn,t.wa_area_name FROM t_wms_area t ";
		String sqlWhere = "";
		if (StringUtils.isNotBlank(DISTRICT_CODE)) {
			sqlWhere = " where 1=1 and t.wa_superior_sn = ? and t.WA_AREA_TYPE='3' and t.DATA_AUTH=? order by t.wa_area_sn ";
			sql = sql + sqlWhere;
			List poList = modelService.listDataSql(sql, new Object[] { DISTRICT_CODE, auth });
			CommMethod.listMapToEscapeJs(poList);
			modelAction.setAjaxList(poList);
		} else {
			sqlWhere = " where 1=1 and t.wa_superior_sn = ? and t.WA_AREA_TYPE='3' and t.DATA_AUTH=? order by t.wa_area_sn ";
			sql = sql + sqlWhere;
			List poList = modelService.listDataSql(sql, new Object[] { whCode, auth });
			CommMethod.listMapToEscapeJs(poList);
			modelAction.setAjaxList(poList);
		}
		return BaseActionSupport.AJAX;
	}

}
