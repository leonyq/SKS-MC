package com.more.buss.zhiju.service;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;

public class ValidateContainerSNn implements ValidateFuncService 
{
  
  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
                               Object... objs)
  {  
    
    String conSn = StringUtils.toString(paraMap.get("CONTAINER_SN"));
    String sqlConId="select ID from T_CO_CONTAINER where CONTAINER_SN=?";
    @SuppressWarnings("unchecked")
    List<Map<String,String>> sqlList=modelService.listDataSql(sqlConId,new Object[]{conSn});
    String editID= modelAction.getDataId() ;
    
    if(!sqlList.isEmpty()){//先判断SN是否存在
        if((sqlList.get(0).get("ID")).equals(editID)){
          return new OperResult(true);
        }else{
          return new OperResult(false, CommMethod.getText("容器SN ") + conSn + CommMethod.getText("已存在"));
        }
    }
    return new OperResult(true);
  }
}
