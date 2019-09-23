
package com.more.mes.smt.usermanager.employeereward;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.more.fw.core.base.core.action.BaseActionSupport;

import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

  /**
 * @Description 获取用于添加奖惩员工的员工列表
 * @ClassName ShowEmployeeList
 * @author qm
 * @Company: morelean
 */
public class ShowEmployeeList1 implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    //用于搜索员工的姓名参数
    String userName = request.getParameter("zj_sn");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));//组织机构 
    String sqlList = "select usr.ID,usr.LOGIN_NAME,usr.NAME,dept.NAME DEPT_NAME from SY_USER usr " + " left join SY_DEPT dept on usr.DEPT_ID=dept.ID  ";
		sqlList += "where 1=1 and usr.DATA_AUTH = :DATA_AUTH ";
		map.put("DATA_AUTH", dataAuth);	
    if (StringUtils.isNotBlank(userName))
    {
    	sqlList += " and usr.NAME like '%' || :userName || '%'";  
      //sqlList += " and usr.NAME like '%" + userName + "%'";
     map.put("userName", userName); 
    }

    List zjList = modelService.listSql(sqlList, modelAction.getPage(), map,  null, null);
    map.put("zjList", zjList);

    modelAction.setAjaxPage(modelAction.getPage());
    CommMethod.listMapToEscapeJs(zjList);
    modelAction.getAjaxPage().setDataList(zjList);
    
    return BaseActionSupport.AJAX;
  }

}
