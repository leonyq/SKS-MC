package com.more.mes.smt.msdmessage;

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
 * @Description 看板配置---新增页面--获取下拉树
 * @ClassName GetWmsAreaTreeTest
 * @author CSJ
 * 
 */
public class GetWmsAreaTreeTest implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String pid = request.getParameter("id");
    String type = request.getParameter("type");
    List<Map> list = new ArrayList<Map>();
    String imgPath = Constants.ZTREE_IMG_PATH;
    String sql = null;
    if (StringUtils.isBlank(pid))
        {
          pid = Constants.DEPT_TREE_ROOT_ID;
        }
    if (type.equals("2"))
    {
      sql = "SELECT t.wa_area_sn AS id,t.wa_area_name AS name,t.wa_superior_sn upId,t.WA_AREA_TYPE  AREA_TYPE  FROM t_wms_area t where t.wa_superior_sn=? and WA_AREA_TYPE='1' and DATA_AUTH=? order by t.WA_AREA_SN ";
      //"SELECT t.wa_area_sn AS \"id\",t.wa_area_name AS \"name\",t.wa_superior_sn \"upId\",t.WA_AREA_TYPE AREA_TYPE  FROM t_wms_area t where t.wa_superior_sn=? and WA_AREA_TYPE='1' order by t.WA_AREA_SN ";
    
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
      
      
    }else if (type.equals("1")) {
      sql = "SELECT T.CA_ID AS ID,T .CA_NAME AS NAME,T.CA_PARENTAREAID AS upId,T.CA_TYPE  AREA_TYPE FROM T_CO_AREA T WHERE  T.CA_PARENTAREAID = ? AND T.CA_TYPE IN ('0','1' ) AND T.DATA_AUTH=?  ORDER BY t.CA_ID";
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
		  map.put("isParent","true");
          list.add(map);
        }
      }
    }else if (type.equals("3")){
      String id = request.getParameter("id");
      sql = "SELECT name from sy_user where id=?";
      list = modelService.listDataSql(sql,new Object[] { id });
    }
    modelAction.setAjaxList(list);
        return BaseActionSupport.AJAX;
  }
}
