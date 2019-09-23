package com.more.mes.smt.samplingplan.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class getAqlVal implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String planId = request.getParameter("planId");
    String sql = "SELECT DISTINCT QSD_AQL_VALUE FROM T_QM_SAMPLING_DETAIL WHERE QSD_PLAN_ID = ? ORDER BY QSD_AQL_VALUE ASC";
    List sList = modelService.listDataSql(sql, new Object[] {planId});

    modelAction.setAjaxList(sList);

    return BaseActionSupport.AJAX;
  }
}
