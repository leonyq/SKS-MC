package com.more.mcmes.moorder;

import com.more.fw.core.base.core.action.BaseActionSupport;
import java_cup.internal_error;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 制令单-判断是否上线
 * 
 */
public class EditTpmmobase implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
    String id = request.getParameter("dataId");//获取id
    //查询在线指令单
    String sql="select t.* from T_PM_MO_ONLINE t"+
                " left join T_PM_MO_BASE t1 on t1.PM_MO_NUMBER = t.PMO_NUMBER"+
                " where t1.id=? AND T.DATA_AUTH=? ";
    
    int count = modelService.countSql(sql, new Object[]{id,dataAuth});
    //判断是否在在线指令单中有数据
    String comp="1";
    if (count!=0)
    {
      comp="2";
    }
    modelAction.setAjaxString(comp);

      return BaseActionSupport.AJAX;
  }

}
