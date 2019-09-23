package com.more.mes.smt.deliverinfo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

//获取用户部门信息
public class GetUserDeptInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String project = request.getParameter("project");
		String sql = "select * from (select t.TWD_UNIT from T_WIP_DELIVER t " +
				"where t.TWD_PROJECT=? order by t.CREATE_TIME desc) where rownum=1 ";
		Map<String, Object> map = modelService.queryForMap(sql,new Object[]{project});
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
