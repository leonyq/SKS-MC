package com.more.user.performance.grape.check;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 员工考核 新增获取分数
 * 
 * @author MMZ
 * 
 */
public class GetCode implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modsService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String id = request.getParameter("ID");
    
    String sql=" select NVL(SUM(ITEM_SCORE),0) CODE from T_USER_ITEM  where  GRAPE_DEPT_ID =? and data_status !=-1";
    
    Map<String, Object> map = modsService.queryForMap(sql, new Object[]{id});
    
    modelAction.setAjaxMap(map);
    
    return BaseActionSupport.AJAX;
  }

}
