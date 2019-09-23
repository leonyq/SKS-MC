package com.morelean.mcmes.craftsetting;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取工艺名称
 * @author Administrator
 *
 */
public class GetRouteCode implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String routeCode=request.getParameter("CT_ROUTE_CODE");
    String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String id=request.getParameter("id");
    String step=request.getParameter("step");
    String face=request.getParameter("face");
    String sql="select CR_ROUTE_NAME from T_CO_ROUTE where CR_ROUTE_ID=? AND DATA_AUTH=? ";
    List<Map> list = modService.listDataSql(sql, new Object[]{routeCode,dataAuth});
    String routeName = null ;
    if (null!=list && !list.isEmpty())
    {
      routeName=list.get(0).get("CR_ROUTE_NAME").toString();
    }
    
    sql=" select distinct T3.ID,t1.CTM_MODEL_CODE,t3.CI_ITEM_NAME,t3.CI_ITEM_SPEC " +
    		" from T_CO_TECH_MODEL t1" +
    		" left join T_CO_TECHNICS t2  " +
    		" on t1.CTM_ID = t2.CT_ID  and t2.DATA_AUTH=t1.DATA_AUTH " +//
    		" left join T_CO_ITEM  t3 on" +
    		" t1.CTM_MODEL_CODE = t3.CI_ITEM_CODE   " +//
    		" where t2.id=? and t1.CTM_PROCESS_FACE=? and t3.DATA_AUTH=t1.DATA_AUTH " +
    		" and t1.CTM_PRODUCT_STEP = ? and t1.DATA_AUTH = ?";//
    
    List list2 = modService.listDataSql(sql, new Object[]{id,face,step,dataAuth});//,dataAuth
     
    
    
    
    
    modelAction.setAjaxString(routeName);
    modelAction.setAjaxList(list2);
    
    return BaseActionSupport.AJAX;
  }

}
