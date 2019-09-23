package com.more.mes.smt.facility;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 设备保养计划前执行的类
 * @Description 〈功能详细描述〉
 * @ClassName ToAddRouteJsp
 * @author Administrator
 * @version 1.0 developer 2017-8-2 created
 * @see ToFacilitiesMaintenancePlanJsp
 * @since 2017-9-18
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class ToFacilitiesMaintenancePlanJsp implements FuncService
{

  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    return modelAction.ActionForwardExeid(modelAction.getExeid());//转向原来视图页面
    // return modelAction.ActionForward("/buss/viewCode/MC-MES/1cca6d88262948499078fae3b41e927c/sbxx/machineryMaintenanceSchedule.jsp");
  }
}
