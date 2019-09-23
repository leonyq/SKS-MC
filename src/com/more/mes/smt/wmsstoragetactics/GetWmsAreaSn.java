package com.more.mes.smt.wmsstoragetactics;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 仓库存储策略信息获取当前仓库编码
 * @author development
 *
 */
public class GetWmsAreaSn implements FuncService{
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String areaSn = request.getParameter("id");
		Map<String, String> map = new HashMap<String, String>();
		map.put("areaSn", areaSn);
		modelAction.setDataMap(map);
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
