package com.more.buss.eis.bd.factoryModel;

import java.util.List;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 列表显示树菜单数据-部门
 */

public class listfactoryTree2 implements FuncService{
     
  @Override
    public String exeFunc(ModelAction modelaction, ModelService modelservice) {
      
      String sql = "select * from T_CO_AREA where 1=1";
      List l;
      l = modelservice.listSql(sql, null, null, null, null, null);
      modelaction.setDataList(l);

      return modelaction.ActionForwardExeid("modelAction.getExeid()");    
   
  }

  
}
