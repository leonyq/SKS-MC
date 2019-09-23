package com.more.mes.smt.inspection.service;

import java.util.HashMap;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 获得巡检报警信息
 * @ClassName RelieveBeforeShow
 * @author csj
 * @Company: morelean
 */
public class RelieveBeforeShow implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    Map<String, String> dataMap = new HashMap<String, String>();
    String curUser = CommMethod.getSessionUser().getName();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    dataMap.put("curUser", curUser);
    dataMap.put("nowDate", nowDate);

    String infoId = modelAction.getDataId();

    CommMethod.mapToEscapeJs(dataMap);
    modelAction.setDataMap(dataMap);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
