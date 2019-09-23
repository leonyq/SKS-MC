package com.more.buss.zhiju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 视图前加载类 制具报废
 * @author development
 *
 */
public class ScarpZJService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    Map<String,String> dataMap=new HashMap<String,String>();
    String cfiId=modelAction.getDataId();
    
    String sqlScarp="select info.id,"+
      " info.cfi_fix_sn,"+
      " info.cfi_item_code,"+
      " tool.assistanttoolname,"+
      " tool.assistanttoolspec,"+
      " tool.assistanttooltype,"+
      " info.cfi_supplier_code"+
 " from T_CO_FIXTURE_INFO info " +
 "LEFT JOIN T_CO_ASSISTANTTOOL tool ON info.cfi_item_code = tool.assistanttoolno "+
" where "+
 "  info.id=?";
  
    @SuppressWarnings("unchecked")
    List<Map<String,String>> scarpMap=modelService.listDataSql(sqlScarp, new Object[]{cfiId});
    
    if(scarpMap!=null&&!scarpMap.isEmpty()){
      String scarpId =scarpMap.get(0).get("id");
      String cfsItemType =scarpMap.get(0).get("assistanttooltype");
      
      String ctfsTinSn =scarpMap.get(0).get("cfi_fix_sn");
      String cfsItemCode =scarpMap.get(0).get("cfi_item_code");
      String cfiAssistanttoolName =scarpMap.get(0).get("assistanttoolname");
      String cfiAssistanttoolSpec =scarpMap.get(0).get("assistanttoolspec");
      String cfiSupplier =scarpMap.get(0).get("cfi_supplier_code");
      dataMap.put("scarpId", scarpId);
      dataMap.put("cfsItemType", cfsItemType);
      dataMap.put("ctfsTinSn", ctfsTinSn);
      dataMap.put("cfsItemCode", cfsItemCode);
      dataMap.put("cfiAssistanttoolName", cfiAssistanttoolName);
      dataMap.put("cfiAssistanttoolSpec", cfiAssistanttoolSpec);
      dataMap.put("cfiSupplier", cfiSupplier);
      
    }
    CommMethod.mapToEscapeJs(dataMap);
    modelAction.setDataMap(dataMap);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
