package com.more.mes.smt.feeder.service.base;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 获得不良描述
 * @ClassName GetEcDescService
 * @author csj
 * @Company: morelean
 */
public class GetEcDescService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String ecId = request.getParameter("ecCode");
    String sql = "select CEC_DESC from T_CO_ERROR_CODE where ID=? AND DATA_AUTH=? ";
    List ecDesc = modelService.listDataSql(sql, new Object[] {ecId,dataAuth});
    CommMethod.listToEscapeJs(ecDesc);
    modelAction.setAjaxList(ecDesc);
    return BaseActionSupport.AJAX;
  }

}
