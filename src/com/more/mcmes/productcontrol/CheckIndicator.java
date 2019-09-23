package com.more.mcmes.productcontrol;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.mes.smt.indicator.service.IndicatorTableService;
/**
 * @Title 工单下达-指示单哦按段
 * @Description 工单下达-指示单哦按段
 * @ClassName CheckIndicator
 * @author hys
 * @version 1.0 developer 2017-8-7 created
 * @see CheckIndicator
 * @since 2017-8-7
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class CheckIndicator implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String mes = "";
    HttpServletRequest request = modelAction.getRequest();
    String projectId = request.getParameter("projectId");
    String type = request.getParameter("type");
    String proStep = request.getParameter("proStep");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    IndicatorTableService idService = new IndicatorTableService();
    if ("1".equals(type))
    {
      mes = idService.checkMoNum(dataAuth,modelAction, modelService, projectId, proStep);
    }
    else if ("2".equals(type))
    {
      mes = idService.yOrnToRelease(modelAction, modelService, projectId, true);
    }
    CommMethod.escapeJs(mes);
    modelAction.setAjaxString(mes);
    return BaseActionSupport.AJAX;
  }

}
