package com.more.mes.smt.msdmessage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.datastax.driver.core.querybuilder.Select;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class AddWmsAreaTreeTestS implements ValidateFuncService
{

  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
                               Object... objs)
  {
    // TODO Auto-generated method stub
    String CFI_FUNC_SN = (String)paraMap.get("CFI_FUNC_SN");
    String dataid = modelAction.getDataId();
   String sql="select * from T_CO_FUNC_INFO where CFI_FUNC_SN=?";
   List subList = modelService.listDataSql(sql, new Object[] { CFI_FUNC_SN });
   if (subList!=null&&subList.size() > 0) {
     if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
        String id1=(String) ((Map)subList.get(0)).get("CFI_FUNC_SN");
        if(!CFI_FUNC_SN.equals(id1)){
            return new OperResult(false, "功能编码已存在");
        }
     }
     else{
         return new OperResult(false, "功能编码已存在");
     }
 }
   return new OperResult(true);
    
    
  }

  

}
