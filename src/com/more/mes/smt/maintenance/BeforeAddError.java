package com.more.mes.smt.maintenance;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 产品维修---添加不良--视图加载前
 * 
 * @author Administrator
 *
 */
public class BeforeAddError implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("dataAuth");
		modelAction.getParaMap().put("dataAuth", dataAuth);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
	}

}
