package com.more.buss.feeder.service.base;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SearchDesc implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request=modelAction.getRequest();
    String ecId=request.getParameter("cfm_type");
    //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    //String dataAuth = request.getParameter("dataAuth");
    String sql="select CEC_DESC from T_CO_ERROR_CODE where id=? and DATA_AUTH=?";
    List<Map<String,Object>> ecDesc=modelService.listDataSql(sql,new Object[]{ecId,dataAuth});
    //modelAction.setDataList(ecDesc);
    CommMethod.listMapToEscapeJs(ecDesc);
    modelAction.setAjaxList(ecDesc);
    return BaseActionSupport.AJAX;
  }

}
