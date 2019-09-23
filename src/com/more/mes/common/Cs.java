package com.more.mes.common;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class Cs implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		System.out.println("111111");
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
