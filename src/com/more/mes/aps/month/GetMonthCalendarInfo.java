package com.more.mes.aps.month;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * 要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
 * 
 */
public class GetMonthCalendarInfo implements FuncService {
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String[]> param = request.getParameterMap();
		System.out.println("size ======> " + param.size());
		for (String key : param.keySet()) {
			System.out.println(key + "\t");
			String[] val = param.get(key);
			for (String v : val) {
				System.out.println("\t" + v);
			}
		}
		return null;
	}
}
