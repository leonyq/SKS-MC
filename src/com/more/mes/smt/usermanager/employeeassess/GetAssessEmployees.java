package com.more.mes.smt.usermanager.employeeassess;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetAssessEmployees  implements FuncService{
	@Override
	  public String exeFunc(ModelAction modelAction, ModelService modelService)
	  {
	    HttpServletRequest request = modelAction.getRequest();
	    Map<String, Object> map = new HashMap<String, Object>();
	    String assessId = request.getParameter("assessId");//获取考核ID，根据员工关联表获取员工信息
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String sqlList = "select usr.ID,usr.LOGIN_NAME,usr.NAME,dept.NAME DEPT_NAME from SY_USER usr "
	                    + "LEFT JOIN  T_USER_ASSESS_USER rew ON rew.USER_ID=usr.ID LEFT JOIN  SY_DEPT dept ON usr.DEPT_ID=dept.ID  "
	                    + "where rew.ASSESS_ID=?  and rew.DATA_AUTH=?  ";
 
	    List zjList = modelService.listDataSql(sqlList, new Object[]{assessId,dataAuth});
	    map.put("zjList", zjList);

	    modelAction.setAjaxMap(map);
        CommMethod.listMapToEscapeJs(zjList);
	    return BaseActionSupport.AJAX;
	  }

}
