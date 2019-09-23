package com.more.mes.smt.wmsmodel;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 视图加载前获取当前仓库编码
 * @author development
 *
 */
public class GetWmsSn implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String areaSn = CommMethod.escapeJs(request.getParameter("id"));
		String iframeid = CommMethod.escapeJs(request.getParameter("iframeid"));
		Map<String, String> map = new HashMap<String, String>();
		map.put("areaSn", areaSn);
		map.put("iframeid", iframeid);
		CommMethod.mapToEscapeJs(map);
		modelAction.setDataMap(map);
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}