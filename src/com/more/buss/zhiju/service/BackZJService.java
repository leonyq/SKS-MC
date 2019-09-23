package com.more.buss.zhiju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.CommMethod;
/**
 * 视图前加载类 制具归还
 * @author development
 *
 */
public class BackZJService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String cfiId=modelAction.getDataId();
    String sqlCfi="select info.id,"+
      " info.cfi_fix_sn,"+
      " info.cfi_item_code,"+
      " tool.assistanttoolname,"+
      " tool.assistanttoolspec,"+
      " tool.assistanttooltype,"+
      " info.cfi_left_top,"+
      " info.cfi_right_top,"+
      " info.cfi_left_lower,"+
      " info.cfi_right_lower,"+
      " info.cfi_middle,"+
      " info.cfi_strain_dis,"+
      " info.cfi_tinckness,"+
      " info.cfi_flatness,"+
      " log.cfo_item_curuser"+
   " FROM T_CO_FIXTURE_INFO info LEFT JOIN  T_CO_ASSISTANTTOOL tool ON info.cfi_item_code = tool.assistanttoolno "+
   " LEFT JOIN  T_CO_FIX_OPERATE_LOG log ON log. ID = info. ID  "+
   " where info.id=?"; 
   String curUser = CommMethod.getSessionUser().getName();
     String loginName=CommMethod.getSessionUser().getLoginName();
   
    @SuppressWarnings("unchecked")
    List<Map<String,String>> cfiList=modelService.listDataSql(sqlCfi,new Object[]{cfiId});
    Map<String,Object> dataMap=new HashMap<String,Object>();
    if(cfiList!=null&&!cfiList.isEmpty()){
      dataMap.put("id", cfiList.get(0).get("id"));//
      dataMap.put("cfi_fix_sn", cfiList.get(0).get("cfi_fix_sn"));
      dataMap.put("cfi_item_code", cfiList.get(0).get("cfi_item_code"));
      dataMap.put("assistanttoolname", cfiList.get(0).get("assistanttoolname"));
      dataMap.put("assistanttoolspec", cfiList.get(0).get("assistanttoolspec"));
      dataMap.put("assistanttooltype", cfiList.get(0).get("assistanttooltype"));//
      dataMap.put("cfi_left_top", cfiList.get(0).get("cfi_left_top"));
      dataMap.put("cfi_right_top", cfiList.get(0).get("cfi_right_top"));
      dataMap.put("cfi_left_lower", cfiList.get(0).get("cfi_left_lower"));
      dataMap.put("cfi_right_lower", cfiList.get(0).get("cfi_right_lower"));
      dataMap.put("cfi_middle", cfiList.get(0).get("cfi_middle"));
      dataMap.put("cfo_item_curuser", curUser);
      dataMap.put("loginName", loginName);
      dataMap.put("cfi_strain_dis", cfiList.get(0).get("cfi_strain_dis"));
      dataMap.put("cfi_tinckness", cfiList.get(0).get("cfi_tinckness"));
      dataMap.put("cfi_flatness", cfiList.get(0).get("cfi_flatness"));
      
    }
    CommMethod.mapToEscapeJs(dataMap);
    modelAction.setDataMap(dataMap);
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
