package com.more.user.performance.grape.check;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

/**
 * @ClassName:CheckUser
 * @Description: 获取判定人员姓名项目信息和葡萄图信息
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月10日上午7:54:12
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class CheckUser implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String dept_id = request.getParameter("dept_id");
		if(StringUtils.isBlank(date)){
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		  date=sdf.format(new Date());
		}
		// 查询判定人信息
		String sql = "select b.id as id, b.name as name from  T_GRAPE_MIAN_INFO a left join sy_user b on check_user_id = b.id where a.user_id = ? and to_char(a.check_date,'yyyy-mm-dd') = ?";
		Map<String,Object> map = new HashMap();
		List<Map<String, Object>> list = new ArrayList();
		List<Map<String, Object>> itemList = new ArrayList();
		List<Map<String, Object>> grapeList = new ArrayList();
		try {
			list = modelService.listDataSql(sql, new Object[] {id,date});//判定人信息
			modelAction.setAjaxPage(modelAction.getPage());
			if(null!=list&&list.size()>0){
			map.put("check_user_name", list.get(0).get("name"));
			map.put("check_user_id", list.get(0).get("id"));
			map.put("date", date);
			
			}else{
				map.put("check_user_name", "");
				map.put("check_user_id", "");				
				map.put("date", date);
			}
			//判定人信息查询结束
			//获取项目信息
			itemList = getItem(modelService, modelAction, dept_id);
			map.put("itemList", itemList);
			//获得葡萄图信息
			grapeList = getGrapeList(modelService, modelAction, id, date);
			map.put("grapeList", grapeList);
			modelAction.setAjaxMap(map);
			//modelAction.getAjaxPage().setDataList(list);
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			map.put("error", e);
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.setAjaxMap(map);
			return BaseActionSupport.AJAX;

		}
	}
		


 public  List getItem(ModelService modelService , ModelAction  modelAction ,String dept_id) {
    Map<String, String> map1 = new HashMap<String, String>();	 
   String searchSql = ""; //查询条件
   if(StringUtils.isNotBlank(dept_id)){
   	searchSql+=" and grape_dept_id = :dept_id";
   	map1.put("dept_id", dept_id);
   }
	 String sql = "select id, dept_id, item_score, item_name from t_user_item";
   
 	List itemList = modelService.listSql(sql, modelAction.getPage(), searchSql, null, "",null);//获得本单位项目
 	CommMethod.listMapToEscapeJs(itemList);
   if (null==itemList||itemList.size()<1){//获得上级单位项目
  	 		sql ="select up_id from t_user_item left join sy_dept b on grape_dept_id = b.id and grape_dept_id = ?";
				List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {dept_id});
				if(null!=list&&list.size()>0){
				sql = "select id, dept_id, item_score, item_name from t_user_item where dept_id = ?";
				itemList= modelService.listDataSql(sql, new Object[] {list.get(0).get("up_id")});
				
				}
			
   	}
   return  itemList;
  
 	}
 
 public List getGrapeList(ModelService modelService , ModelAction  modelAction ,String user_id,String date) {
	 date = date.substring(0, 7);
		// 查询葡萄信息 包括 表grap_mian_info 和 grape_score 的信息
		String sql = "select a.id as id ,to_char(a.check_date,'yyyy-mm-dd') check_date,a.check_user_id , b.level_color from T_GRAPE_MIAN_INFO  a left join v_grap_score b on a.total_score <= b.hig and a.total_score > b.low where  user_id = ? and to_char(check_date,'yyyy-mm') = ?";
			List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { user_id, date });
			return list;
 }
 
 
}
 
