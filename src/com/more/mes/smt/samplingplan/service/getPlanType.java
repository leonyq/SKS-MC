package com.more.mes.smt.samplingplan.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class getPlanType implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String testStep = CommMethod.escapeJs(request.getParameter("testStep"));
    String sql = "SELECT ID, QSP_PLAN_NAME  FROM T_QM_SAMPLING_PLAN WHERE QSP_TEST_STEP  = ?";
    List sList = modelService.listDataSql(sql, new Object[] {testStep});
    CommMethod.listMapToEscapeJs(sList);
    modelAction.setAjaxList(sList);

    return BaseActionSupport.AJAX;
  }
}
