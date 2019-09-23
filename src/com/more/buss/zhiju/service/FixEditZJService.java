package com.more.buss.zhiju.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制具维保 修改 视图前加载类
 * @author development
 *
 */
public class FixEditZJService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    String fixId=modelAction.getDataId();
    if(fixId==null){
      
    }else{
      String sqlFix="select * from T_CO_FIX_MAINTENANCE where id=?";
      List<Map<String,Object>> fisList=modelService.listDataSql(sqlFix, new Object[]{fixId});
      if(!fisList.isEmpty()){
    	CommMethod.listMapToEscapeJs(fisList);
        modelAction.setDataList(fisList);
      }
      
    }
    return modelAction.ActionForwardExeid(modelAction.getExeid());
  }

}
