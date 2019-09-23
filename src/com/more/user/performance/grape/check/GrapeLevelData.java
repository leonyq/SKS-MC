package com.more.user.performance.grape.check;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @ClassName:GrapeLevelData 查询等级配置信息
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月6日下午1:01:06
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class GrapeLevelData implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String id = request.getParameter("id");
		
		
		String sql = "select id , LEVEL_CODE , LEVEL_COLOR,LEVEL_SCORE from T_GRAPE_LEVEL order by level_code";
		try {
			List<Map<String, Object>> list = modelService.listDataSql(sql);
			modelAction.setAjaxPage(modelAction.getPage());
			CommMethod.listMapToEscapeJs(list);
			modelAction.getAjaxPage().setDataList(list);
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			Map<String,Object> map = new HashMap();
			map.put("error", e);
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.setAjaxMap(map);
			return BaseActionSupport.AJAX;
		}
	}
}
	