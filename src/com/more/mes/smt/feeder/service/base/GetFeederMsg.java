package com.more.mes.smt.feeder.service.base;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ibm.pkcs11.r;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description FEEDER信息修改 获取信息
 * @ClassName GetFeederMsg
 * @Company: morelean
 */
public class GetFeederMsg implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    Map<String,String> map = new HashMap<String, String>();
    String ID = request.getParameter("ID");
    
    String sql="select t.* from T_CO_FEEDER_INFOR t  where 1=1 ";
    
    String sqlWhere=" ";
    
    if (StringUtils.isNotBlank(ID))
    {
      sqlWhere+=" and t.ID =:ID";
      map.put("ID", ID);
    }
    
    List list = modelService.listSql(sql+sqlWhere, null, map, null, null);
    
    CommMethod.listToEscapeJs(list);
    modelAction.setAjaxList(list);
    
    return BaseActionSupport.AJAX;
  }

}
