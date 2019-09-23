package com.more.mes.smt.packtactics;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 包装策略配置获取策略代码
 * 
 * @author development
 *
 */
public class AjaxGetTacticsSn implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String checkVal = request.getParameter("checkVal");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select PTC_SN from T_PACK_TACTICS_CONNECT_INFO where (PTC_PROJECT_ID=? "
				+ "or PTC_MODEL_CODE=? or PTC_CUST_CODE=?) AND DATA_AUTH=? ";
		Map map = modelService.queryForMap(sql, new Object[] { checkVal, checkVal, checkVal, dataAuth });
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
