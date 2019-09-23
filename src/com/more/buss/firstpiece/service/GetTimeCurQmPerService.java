package com.more.buss.firstpiece.service;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import java.util.HashMap;
import java.util.Map;

/**
 * 简单质检 新增 视图前加载类
 * @author:phantomsaber
 * @version:2019/7/9 10:28
 * @email:phantomsaber@foxmail.com
 **/
public class GetTimeCurQmPerService implements FuncService{
     
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		Map<String, String> dataMap=new HashMap<String, String>();
		String curUser=CommMethod.getSessionUser().getId();
		String nowDate=DateUtil.formatDate(DateUtil.getCurDate(),"yyyy-MM-dd HH:mm:ss");
		dataMap.put("curUser", curUser);
		dataMap.put("nowDate", nowDate);
		CommMethod.mapToEscapeJs(dataMap);
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
