package com.more.buss.firstpiece.service;

import java.util.HashMap;
import java.util.Map;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 首件检测 新增 视图前加载类
 * @author cym
 * @date   2017-4-27下午2:29:28
 */
public class GetTimeCurPerService implements FuncService{
     
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
