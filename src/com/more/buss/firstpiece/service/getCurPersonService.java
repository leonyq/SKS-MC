package com.more.buss.firstpiece.service;

import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 首件检测 审核 视图前加载类
 * @author development
 *
 */
public class getCurPersonService implements FuncService
{
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    // TODO Auto-generated method stub
    Map<String, String> dataMap=new HashMap<String, String>();
    String curUser=CommMethod.getSessionUser().getId();
    dataMap.put("curUser", curUser);
    modelAction.setDataMap(dataMap);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }
}
