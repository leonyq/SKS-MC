package com.more.mes.smt.storeitemmanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import groovy.sql.Sql;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetEmpLoginName implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String WIC_CTRL_EMP=request.getParameter("WIC_CTRL_EMP");
		Map<String,String> map = new HashMap<String, String>();
		String sql="select name, LOGIN_NAME from sy_user ";
		
		String sqlWhere =" where 1=1 ";
		if (StringUtils.isNotBlank(WIC_CTRL_EMP)) {
			sqlWhere +=" and LOGIN_NAME = :LOGIN_NAME ";
			map.put("LOGIN_NAME", WIC_CTRL_EMP);
		}
		
		List Emplist = modelService.listSql(sql+sqlWhere, null,map, null, null);
		modelAction.setDataList(Emplist);
		
		return modelAction.ActionForwardExeid();
	}

}
