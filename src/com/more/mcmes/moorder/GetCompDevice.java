package com.more.mcmes.moorder;

import java.util.List;



import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制令单-关结前判断是否存在于在线设备
 * 
 */
public class GetCompDevice implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
    
    String id = request.getParameter("dataId");
    
    String sql ="select a.* from T_PM_DEVICE_ONLINE  a  "+
                " left join T_PM_MO_BASE t  on a.PDO_NUMBER= t.PM_MO_NUMBER "+
                 " where t.id=? AND A.DATA_AUTH=? ";
    
    /*
    int count = modelService.countSql(sql, new Object[]{id});
    
    if (count!=0)
    {
      modelAction.setAjaxString("1");//判断是否在在线设备信息表中有值
    }else {
      modelAction.setAjaxString("2");//判断是否在在线设备信息表中有值
    }
    */
    
    List list = modelService.listDataSql(sql, new Object[]{id,dataAuth});
    
    if (null!=list&&list.size()>0)
    {
      modelAction.setAjaxString("1");//判断是否在在线设备信息表中有值
    }else {
      modelAction.setAjaxString("2");//判断是否在在线设备信息表中有值
    }
    
    return BaseActionSupport.AJAX;
  }

}
