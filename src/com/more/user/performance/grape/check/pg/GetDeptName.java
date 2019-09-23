package com.more.user.performance.grape.check.pg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 员工考核 获取部门
 * 
 * @author MMZ
 * 
 */
public class GetDeptName implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    
    String id = request.getParameter("dataAuthId");
    
    //String sql="select id  , name  from sy_dept t start with  t.id=? "+
    //  " connect by prior t.id = t.UP_ID ";
    String sql = "WITH RECURSIVE TA AS "+
      "(SELECT T.ID,T.NAME FROM SY_DEPT T WHERE T.ID = ? "+
    	"UNION ALL SELECT D.ID, D.NAME FROM SY_DEPT D "+
      "JOIN TA ON D.UP_ID = TA.ID) "+
    	"SELECT TA.ID,TA.NAME FROM TA";
    
    List<Map<String, Object>> list = modelService.listDataSql(sql,new Object[]{id});
    
    modelAction.setAjaxList(list);
    
    return BaseActionSupport.AJAX;
    
   
  }

}