package com.more.mes.smt.msdmessage.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;



public class GetMaintenance implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    Map<String,String> sqlMap = new HashMap<String, String>();
    String id= CommMethod.escapeJs(request.getParameter("ID"));
    
    String sql="select T.*,C.CEC_DESC from T_CO_FIX_MAINTENANCE T "
    +" LEFT JOIN T_CO_ERROR_CODE C ON C.ID=T.CFM_EC_CODE ";
    
    String sqlWhere= "";
    if (StringUtils.isNotBlank(id))
    {
        sqlWhere+=" and T.ID = :ID ";
        sqlMap.put("ID", id);
    }
    
    List list = modelService.listSql(sql+sqlWhere, null, sqlMap, null, null);
    CommMethod.listMapToEscapeJs(list);
    modelAction.setAjaxList(list);
    
    
    return BaseActionSupport.AJAX;
    
    

  }

}
