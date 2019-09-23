package com.more.mes.smt.route;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 修改流程信息前执行的获取信息类
 * @Description 〈功能详细描述〉
 * @ClassName ToAddRouteJsp
 * @author Administrator
 * @version 1.0 developer 2017-8-2 created
 * @see ToEditNewRouteJsp
 * @since 2017-8-2
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ToEditNewRouteJsp implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    
    return modelAction.ActionForwardExeid(modelAction.getExeid());//转向原来视图页面
    //return modelAction.ActionForward("/buss/viewCode/MC-MES/GYJM/LCGK/LCXX/editRouteNew.jsp");
  }
}
