package com.more.mes.smt.sampletype.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 获取AQL值
 * @ClassName getAqlVal
 * @author csj
 * @Company: morelean
 */
public class getAqlVal implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String planId = request.getParameter("planId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "SELECT DISTINCT QSD_AQL_VALUE FROM T_QM_SAMPLING_DETAIL WHERE QSD_PLAN_ID = ? AND DATA_AUTH = ? ORDER BY QSD_AQL_VALUE ASC";
    List sList = modelService.listDataSql(sql, new Object[] {planId,dataAuth});
    CommMethod.listMapToEscapeJs(sList);
    modelAction.setAjaxList(sList);

    return BaseActionSupport.AJAX;
  }
}
