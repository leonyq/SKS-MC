package com.more.mcmes.productcontrol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetWorkOrderIssued implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String projectId =request.getParameter("projectId");
    String projectStep =request.getParameter("projectStep");//生产阶别
    String pmProcessFace = request.getParameter("pmProcessFace");
    String pPlanNum = request.getParameter("planNum");//工单计划数量
    String type = request.getParameter("type");
    String comp="2";
    if (StringUtils.isNotBlank(pmProcessFace))
    {
    	//计算工单可下达数量
      String querySql = "SELECT SUM(t.pm_target_qty) PLAN_NUM FROM t_pm_mo_base t " +
        		"WHERE t.pm_project_id=? AND T.PM_PRODUCT_STEP=? AND T.PM_PROCESS_FACE=? AND T.DATA_AUTH=? ";
      Map<String, Object> map1 = modelService.queryForMap(querySql, new Object[] {projectId,projectStep,pmProcessFace,dataAuth});
      long num = 0;
      if(null!=map1 && map1.size()>0) {
      if(map1.get("PLAN_NUM")!=null){
    	  num = Long.parseLong(map1.get("PLAN_NUM").toString());
      }
      }
      long pNum = Long.parseLong(pPlanNum);
      Map<String, Object> map = new HashMap<String, Object>();
      Map<String, Object> pramap = new HashMap<String, Object>();
      map.put("plan_num", pNum-num);
      CommMethod.mapToEscapeJs(map);
      modelAction.setAjaxMap(map);
      if(type.equals("2")){
          String sql ="select PM_PROCESS_FACE from T_PM_MO_BASE where 1=1 ";
      String sqlWhere=" AND DATA_AUTH=:DATA_AUTH ";
      pramap.put("DATA_AUTH", dataAuth);
      if (StringUtils.isNotBlank(projectId));
      {
         sqlWhere=" and PM_PROJECT_ID = :PM_PROJECT_ID ";
         pramap.put("PM_PROJECT_ID", projectId);
      }
      
      List<Map> list = modelService.listSql(sql+sqlWhere,null ,pramap, null, null);
      String face;
      int lengths=list.size();
      if (null!=list &&list.size()>0)
      {
        //int num = list.size();
        //for (int i = 0; i < num; i++ )
        //{
       
        
        face=(String)list.get(0).get("PM_PROCESS_FACE");
        
        if (list.size()>1)
        {
          face=(String)list.get(1).get("PM_PROCESS_FACE");
        }
        
          if (StringUtils.isNotBlank(face))
          {
            if (face.equals("0"))
            {
              if (!pmProcessFace.equals("0"))
              {
                comp="1";
                
                modelAction.setAjaxString(comp);
                return BaseActionSupport.AJAX;
              }
            }else if (face.equals("1") || face.equals("2")) {
               if (pmProcessFace.equals("0") || pmProcessFace.equals("3"))
              {
                 comp="3";
                 modelAction.setAjaxString(comp);
                 return BaseActionSupport.AJAX;
              }
               
            }else if (face.equals("3")) {
              if (!pmProcessFace.equals("3"))
              {
                comp="4";
                modelAction.setAjaxString(comp);
                return BaseActionSupport.AJAX;
              }
            }
          }
           
        //}
        comp="2";
      }
    }
    
    modelAction.setAjaxString(comp);
          
          
      }
      
    return BaseActionSupport.AJAX;
  }

}
