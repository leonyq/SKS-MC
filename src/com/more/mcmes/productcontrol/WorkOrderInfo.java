package com.more.mcmes.productcontrol;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title
 * @description 工单新增-视图加载前
 * @ClassName WorkOrderInfo
 * @author msad013
 * @version 1.0 developer
 * @see WorkOrderInfo
 * @since
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class WorkOrderInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "SELECT T.VR_DEF_VALUE FROM T_SYS_PARAMETER_INI T WHERE T.VR_CLASS='SMT0002' AND T.VR_VALUE='1' AND T.DATA_AUTH=? ";
    String sql2 = "select vr_value from  t_sys_parameter_ini where vr_class='MES0001' AND DATA_AUTH=?  ";
    Map map2 = modelService.queryForMap(sql2,new Object[]{dataAuth});
    Map map=modelService.queryForMap(sql,new Object[]{dataAuth});
    modelAction.setDataMap(map);
    modelAction.setDataMap1(map2);
    return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
   
  }
}