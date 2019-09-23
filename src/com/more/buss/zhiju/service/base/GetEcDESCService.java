package com.more.buss.zhiju.service.base;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制具维保 获取不良内容
 * @author development
 *
 */
public class GetEcDESCService implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String cfmId = request.getParameter("cfm_type");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sqlCfm = "select CEC_DESC from T_CO_ERROR_CODE where ID=? AND DATA_AUTH=?";
    List<Map<String,Object>> cecDesc = modelService.listDataSql(sqlCfm, new Object[] {cfmId,dataAuth});
    CommMethod.listMapToEscapeJs(cecDesc);
    modelAction.setAjaxList(cecDesc);
    return BaseActionSupport.AJAX;
  }

}
