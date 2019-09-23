package com.more.user.performance.grape.check;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @ClassName:ShowItem
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月8日下午3:49:17
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class ShowItem implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    String dept_id = request.getParameter("dept_id");
    String user_id = request.getParameter("user_id");
    String searchSql = ""; //查询条件
    if(StringUtils.isNotBlank(dataAuth)){
      searchSql+=" and DATA_AUTH = '"+dataAuth+"'";
    }
    if(StringUtils.isNotBlank(dept_id)){
    	searchSql+=" and grape_dept_id = '"+ dept_id+"' and data_status = 0";
    }
    Map map = new HashMap ();
    modelAction.setAjaxMap(map);
    String sql = "select id, dept_id, item_score, item_name from t_user_item  ";
    
    try{
    	List itemList = modelService.listSql(sql, modelAction.getPage(), searchSql, null, "",null);//获得本单位项目
      if (null==itemList||itemList.size()<1){//获得上级单位项目
      	sql ="select up_id from t_user_item left join sy_dept b on grape_dept_id = b.id and grape_dept_id = ? where data_status = 0"+
      	    "  and DATA_AUTH =? ";
  			List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {dept_id,dataAuth});//获得上级单位ID
  			if(null!=list&&list.size()>0){
  				sql = "select id, dept_id, item_score, item_name from t_user_item where dept_id = ? DATA_AUTH=?";
  				itemList= modelService.listDataSql(sql, new Object[] {list.get(0).get("up_id"),dataAuth});//获得上级单位项目
  			}
        
      }
      modelAction.setAjaxPage(modelAction.getPage());
      if(null!=itemList&&itemList.size()>0){
      	modelAction.getAjaxPage().setDataList(itemList);
      	map.put("msg","success");    	
      }else{
      	map.put("msg","none"); 
      }
    }catch(Exception e){
    	 map.put("error",e);
    }finally{
    	map.put("authour", "mmz");
    }
    return BaseActionSupport.AJAX;

  }

}
