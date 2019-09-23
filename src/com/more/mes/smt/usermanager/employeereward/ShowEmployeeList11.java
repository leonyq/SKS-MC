package com.more.mes.smt.usermanager.employeereward;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.more.fw.core.base.core.action.BaseActionSupport;

import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

  /**
 * @Description 获得员工列表
 * @ClassName ShowEmployeeList
 * @author qm
 * @Company: morelean
 */
public class ShowEmployeeList11 implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, Object> map = new HashMap<String, Object>();
    String zjSn = request.getParameter("zj_sn");
    /*String zjType = request.getParameter("zj_type");*/
    String sqlList = "select usr.ID,usr.LOGIN_NAME,usr.NAME,usr.DEPT_ID "
                     + " from SY_USER usr where 1=1 ";

    if (StringUtils.isNotBlank(zjSn))
    {
      sqlList += " and usr.NAME like '%" + zjSn + "%'";
    }
   /* if (StringUtils.isNotBlank(zjType) && !"0".equals(zjType))
    {
      sqlList += " and info.TCT_TYPE='" + zjType + "'";
    }*/

    List zjList = modelService.listSql(sqlList, modelAction.getPage(), null, null, null, null);
    map.put("zjList", zjList);

    modelAction.setAjaxPage(modelAction.getPage());
    modelAction.getAjaxPage().setDataList(zjList);

    return BaseActionSupport.AJAX;
  }

}
