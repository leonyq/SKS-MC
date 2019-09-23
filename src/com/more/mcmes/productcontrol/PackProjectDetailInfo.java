package com.more.mcmes.productcontrol;


        import com.more.fw.core.base.core.action.ModelAction;
        import com.more.fw.core.dbo.model.service.ModelService;
        import com.more.fw.core.dbo.model.service.impl.base.FuncService;
        import org.apache.commons.logging.Log;
        import org.apache.commons.logging.LogFactory;


public class PackProjectDetailInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
    //return modelAction.ActionForward("/buss/msbg/productControl/workOrderEdit.jsp");
  }
}