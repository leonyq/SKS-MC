package com.more.mes.smt.maintenance;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * @Title 产品维修
 * @description 产品维修
 * @ClassName ProductMaintenance
 * @author msad013
 * @version 1.0 developer 2017-7-20 created
 * @see ProductMaintenance
 * @since 2017-7-20
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ProductMaintenance implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

	    //return modelAction.ActionForward("/buss/viewCode/MC-MES/SCGK/wxgl/productInfoAdd.jsp");
	}
}