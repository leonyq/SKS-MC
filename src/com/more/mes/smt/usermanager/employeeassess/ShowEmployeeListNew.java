
package com.more.mes.smt.usermanager.employeeassess;


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
 * @Description 获得员工列表
 * @ClassName ShowEmployeeListNew
 * @author zxc
 * @Company: morelean
 */
public class ShowEmployeeListNew implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    String zjSn = request.getParameter("zj_sn");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    /*String zjType = request.getParameter("zj_type");*/
    String sqlList = "select usr.ID, usr.LOGIN_NAME, usr.NAME, dept.NAME DEPT_NAME from SY_USER usr "
                     + " LEFT JOIN SY_DEPT dept ON usr.DEPT_ID = dept.ID WHERE 1=1 ";

    sqlList += " and usr.DATA_AUTH = :DATA_AUTH ";
    map.put("DATA_AUTH", dataAuth);

    if (StringUtils.isNotBlank(zjSn))
    {
        sqlList += " and usr.NAME like '%' || :zjSn || '%'";
        map.put("zjSn", zjSn);
    // sqlList += " and usr.NAME like '%" + zjSn + "%'";
    }
   /* if (StringUtils.isNotBlank(zjType) && !"0".equals(zjType))
    {
      sqlList += " and info.TCT_TYPE='" + zjType + "'";
    }*/

    List zjList = modelService.listSql(sqlList, modelAction.getPage(), map, null, null);
    map.put("zjList", zjList);

    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(zjList);
    CommMethod.listMapToEscapeJs(zjList);

    return BaseActionSupport.AJAX;
  }

}
