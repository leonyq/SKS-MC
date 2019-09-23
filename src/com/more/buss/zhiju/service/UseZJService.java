package com.more.buss.zhiju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 视图前加载类 制具领用
 * @author development
 *
 */
public class UseZJService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String cfiId = modelAction.getDataId();
    String sqlCfi = "select info.id,info.cfi_fix_sn,info.cfi_item_code,tool.assistanttoolname,"
                    + "tool.assistanttoolspec,tool.assistanttooltype"
                    + " from T_CO_FIXTURE_INFO  info,T_CO_ASSISTANTTOOL tool"
                    + " where info.cfi_item_code=tool.assistanttoolno" + " and info.id=?";
    String curUser = CommMethod.getSessionUser().getName();
    // 查看制具表，遍历该条信息
    List<Map<String, String>> cfiList = modelService.listDataSql(sqlCfi, new Object[] {cfiId});
    Map<String, String> dataMap = new HashMap<String, String>();
    if (cfiList!=null&&!cfiList.isEmpty())
    {
      dataMap.put("id", cfiList.get(0).get("id"));
      dataMap.put("cfi_fix_sn", cfiList.get(0).get("cfi_fix_sn"));
      dataMap.put("cfi_item_code", cfiList.get(0).get("cfi_item_code"));
      dataMap.put("assistanttoolname", cfiList.get(0).get("assistanttoolname"));
      dataMap.put("assistanttoolspec", cfiList.get(0).get("assistanttoolspec"));
      dataMap.put("assistanttooltype", cfiList.get(0).get("assistanttooltype"));
      dataMap.put("curUser", curUser);
    }
    CommMethod.mapToEscapeJs(dataMap);
    modelAction.setDataMap(dataMap);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
