package com.more.mes.smt.usermanager.employeeassess;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/*
自动填充审核人为当前用户
*/

public class getUserNames implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
	
		 String   userDto=modelAction.getUser().getId();//获取ID
		 String sqllist="SELECT ID,NAME FROM SY_USER WHERE ID=?";
	
		 
		 List  list=modelService.listDataSql(sqllist,new Object[] {userDto});
		 
	   
	     
	    modelAction.setAjaxList(list);
	   CommMethod.listMapToEscapeJs(list);
		
		return BaseActionSupport.AJAX;
		
	}

}
