package com.more.buss.firstpiece.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetProjectFaiNumByProjectId implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String projectId = request.getParameter("projectId"); // 工单
    String dataAuth = request.getParameter("dataAuth"); 
    String sql = "select FAI_NUM " + "from T_PM_PROJECT_BASE where PROJECT_ID = ? and DATA_AUTH=?";
    List sList = modelService.listDataSql(sql, new Object[] {projectId,dataAuth});
    CommMethod.listToEscapeJs(sList);
    modelAction.setAjaxList(sList);
    return BaseActionSupport.AJAX;
  }

}
