package com.more.mes.smt.stationitem;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetEnvDetail implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String envId = req.getParameter("envId");
		String sql = "select * from T_CO_ENV_INFO where ID = ?";
		List<Map> dataList = modelService.listDataSql(sql,new Object[]{envId});
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
