package com.more.buss.eis.bd.basedos.service;

import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ValidateContainerType implements ValidateFuncService{

	@Override
	public OperResult valJavaFun(String formId, Map paraMap,ModelService modelService,ModelAction modelAction,Object... objs) {
		//System.out.println("______________________________________________-in");
		return new OperResult(true);
	}

}
