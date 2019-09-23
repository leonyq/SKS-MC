package com.more.buss.zhiju.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ShowZJListService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String sqlList="select info.CFI_FIX_SN, sdv.value, info.CFI_ITEM_CODE," +
    		"tool.assistanttoolname,info.cfi_instock_time" +
 " from T_CO_FIXTURE_INFO info, T_CO_ASSISTANTTOOL tool,sy_dict_val sdv" +
 " where info.cfi_item_code=tool.assistanttoolno" +
 " and tool.assistanttooltype=sdv.code" +
 " and sdv.dict_code= 'ASSISTANTTOOL_TYPE'";
    @SuppressWarnings("unchecked")
    List<Map<String,String>> zjList=modelService.listDataSql(sqlList);
    modelAction.setAjaxList(zjList);
    return BaseActionSupport.AJAX;
  }

}
