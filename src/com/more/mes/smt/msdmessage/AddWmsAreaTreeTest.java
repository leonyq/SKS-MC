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

public class AddWmsAreaTreeTest implements ValidateFuncService
{

  @Override
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
                               Object... objs)
  { // TODO Auto-generated method stub
    String CKC_SN = (String)paraMap.get("CKC_SN");//看板编码在所在组织机构下确认唯一
	String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String dataid = modelAction.getDataId();
    String sql="select * from T_CO_KANBAN_CONFIG where CKC_SN=? and data_Auth=?  ";
   List subList = modelService.listDataSql(sql, new Object[] { CKC_SN,dataAuth });
   if (subList!=null&&subList.size() > 0) {
     if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
         
        String id1=(String) ((Map)subList.get(0)).get("ID");
        if(!dataid.equals(id1)){
            return new OperResult(false, "看板编号已存在");
        }
     }
     else{
         return new OperResult(false, "看板编号已存在");
     }
 }
   return new OperResult(true);
    
    
  }

  

}
