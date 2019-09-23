package com.more.mes.parameterconfig;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取组织机构
 * 
 * @author Administrator
 *
 */
public class GetDataAuthFor implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select id,name from sy_dept where id=?";
		List dataList = modelService.listDataSql(sql, new Object[] { dataAuth });
		modelAction.setAjaxString(dataAuth);
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
