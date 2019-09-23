package com.more.morelabel.tojsp;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ToBarcodeVariablesJsp implements FuncService
{
  

  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    return modelAction.ActionForwardExeid(modelAction.getExeid());//转向原来视图页面
    //return modelAction.ActionForward("/buss/jsp/barcodeVariables.jsp");
  }
}
