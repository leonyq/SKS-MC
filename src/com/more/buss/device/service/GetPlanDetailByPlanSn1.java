package com.more.buss.device.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetPlanDetailByPlanSn1 implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String planSn = request.getParameter("planSn");  //计划代码
		String sql = "select t.*,to_char(t.CDPD_CREATE_DATE,'yyyy-mm-dd hh24:mi:ss') MY_DATE ,a.name username from T_CO_DEVICE_PLAN_DETAIL t" +
				" left join sy_user a on a.id=t.CDPD_CREATE_MAN" +
				" where t.cdp_plan_sn=?";
		List sList = modelService.listDataSql(sql, new Object[] { planSn });
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}
