package com.more.mes.smt.wmsmodel;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增子区域视图加载前获取上级编码及类型
 * 
 * @author development
 *
 */
public class GetWmsHighInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String areaType = CommMethod.escapeJs(request.getParameter("areaType"));
		String highSn = CommMethod.escapeJs(request.getParameter("highSn"));
		Map<String, String> map = new HashMap<String, String>();
		map.put("highSn", highSn);
		map.put("areaType", areaType);
		CommMethod.mapToEscapeJs(map);
		modelAction.setDataMap(map);
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}

}
