package com.more.mes.smt.storeitemmanager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;
/**
 * @Description 物料管控新增获取员工名字
 * @ClassName DelParameter
 * @author WZY
 * 
 */
public class GetName implements FuncService
{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) 
	{
		// TODO Auto-generated method stub
		
		String loginName = modelAction.getRequest().getParameter("LOGIN_NAME");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		Map<String, String> map = new HashMap<String, String>();
		String sql="select name from sy_user ";
		
		String sqlWhere = " where 1 = 1 ";
				
		if (StringUtils.isNotBlank(loginName)) {
			sqlWhere += " and id =:loginName1 ";
			map.put("loginName1", loginName);
		}
		sqlWhere += " and DATA_AUTH =:DATA_AUTH ";
		map.put("DATA_AUTH", dataAuth);		
		List list = modelService.listSql(sql+sqlWhere,null,map, null, null);
		
		CommMethod.listToEscapeJs(list);
		modelAction.setAjaxList(list);
		 
		return BaseActionSupport.AJAX;
	}

}
