
package com.more.mes.smt.tempreatureup;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.BaseService;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class continuousNew implements FuncService 
{
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
	//	HttpServletRequest request=modelAction.getRequest();
		String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
		
		String sqlList="SELECT * FROM T_WIP_TEMPERATURE_CURVE" +
				" where DATA_AUTH=?" +
				" ORDER BY CREATE_TIME DESC	";
		
		List list=modelService.listDataSql(sqlList,new Object[]{auth});
	    CommMethod.listToEscapeJs(list);
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
		
	}
}
