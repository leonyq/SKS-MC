package com.more.mes.smt.appmanage;

import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取类源码与当前数据库类型
 * @author Administrator
 *
 */
public class GetClassAndDb implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		//String dataId = modelAction.getRequest().getParameter("dataId");
		String curDataType = CommMethod.getCUR_DB_DIALECT();
		Map<Object, Object> map = new HashMap<Object, Object>();  
	    map.put("curDataType", curDataType);
	    modelAction.setDataMap(map);
	    return null;
	}

}
