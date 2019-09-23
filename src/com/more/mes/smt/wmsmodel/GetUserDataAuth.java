package com.more.mes.smt.wmsmodel;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 仓库建模----根据用户获取组织机构
 * 
 * @author Administrator
 *
 */
public class GetUserDataAuth implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String userId = modelAction.getSessionUser().getId();
		String sql = "select t2.id,t2.name from sy_data_auth t " + "left join sy_dept t2 on t2.id = t.dept_id "
				+ "where user_id=? ";
		List<Map> resList = modelService.listDataSql(sql, new Object[] { userId });
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}

}
