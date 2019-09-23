package com.more.mes.smt.envinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 新增环境信息 获取下拉树
 */

public class GetEvnTree implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String type= request.getParameter("type");
    String pid = request.getParameter("id");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String imgPath = Constants.ZTREE_IMG_PATH;
    List<Map> list = new ArrayList<Map>();
    String sql = null;
    if (StringUtils.isBlank(pid))
        {
          pid = Constants.DEPT_TREE_ROOT_ID;
        }
    if(type.equals("1")){
        sql = "SELECT t.wa_area_sn AS \"id\",t.wa_area_name AS \"name\",t.wa_superior_sn \"upId\",t.WA_AREA_TYPE AREA_TYPE  FROM t_wms_area t where t.wa_superior_sn=? and t.data_auth = ?  order by t.WA_AREA_SN ";
        
         
         List<Map> list2 = modelService.listDataSql(sql,new Object[] { pid,dataAuth });
         
         Map<String, Object> map = null;
         if(list2!=null&&list2.size()>0){
           int num = list2.size();
           for(int i=0;i<num;i++){
             map = new HashMap<String, Object>();
             map.put("id", list2.get(i).get("ID"));
             map.put("name", list2.get(i).get("NAME"));
             map.put("upId", list2.get(i).get("UPID"));
             map.put("AREA_TYPE", list2.get(i).get("WA_AREA_TYPE"));
             map.put("icon", imgPath + "ico-right-last.png");
			 map.put("iconClose", imgPath + "ico-right-close.png");
			 map.put("iconOpen", imgPath + "ico-right-open.png");
             list.add(map);
           }
         }
         
    }else if(type.equals("2")){
        
        String ceiAreaSN = request.getParameter("CEI_AREA_SN");
        sql="SELECT WA_AREA_NAME FROM t_wms_area WHERE wa_area_sn=? and data_auth =? ";
        list = modelService.listDataSql(sql,new Object[] { ceiAreaSN,dataAuth});
        
    }    
    
    
    modelAction.setAjaxList(list);
    return BaseActionSupport.AJAX;
  }

}
