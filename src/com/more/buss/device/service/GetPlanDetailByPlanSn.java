package com.more.buss.device.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 加载计划明细信息
 * @author Administrator
 *
 */
public class GetPlanDetailByPlanSn implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataId = request.getParameter("dataId");  //id
		String sql0 = "select CDP_PLAN_SN,DATA_AUTH  from T_CO_DEVICE_PLAN_INFO where id =? ";
		List<Map> sList0 = modelService.listDataSql(sql0, new Object[] { dataId });
		if (sList0==null||sList0.isEmpty()) {
			return BaseActionSupport.AJAX;
		}
		String planSn = sList0.get(0).get("CDP_PLAN_SN").toString();  //计划代码
		
		String dataAuth = sList0.get(0).get("DATA_AUTH").toString();
		String sql = "select t.*,to_char(t.CDPD_CREATE_DATE,'yyyy-mm-dd hh24:mi:ss') MY_DATE ,a.name username from T_CO_DEVICE_PLAN_DETAIL t" +
				" left join sy_user a on a.id=t.CDPD_CREATE_MAN" +
				" where t.cdp_plan_sn=? and t.data_auth=? ";
		List sList = modelService.listDataSql(sql, new Object[] { planSn,dataAuth });
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}
