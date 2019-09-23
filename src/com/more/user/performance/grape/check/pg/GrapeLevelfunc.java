package com.more.user.performance.grape.check.pg;

	import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

    import com.more.fw.core.base.core.action.BaseActionSupport;
    import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * GrapeLevelfunc DML事件
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月6日下午1:01:06
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
	public class GrapeLevelfunc  implements FuncService {

		public String exeFunc(ModelAction modelAction, ModelService modelService) {
			HttpServletRequest request = modelAction.getRequest();
			String model = request.getParameter("model");
			Map<String,Object> map = new HashMap();
			 modelAction.setAjaxPage(modelAction.getPage());
				modelAction.setAjaxMap(map);
				String alertMsg1 = modelAction.getText("保存成功");
				 map.put("alertMsg", msgPopData(modelAction, alertMsg1).get("alertMsg"));
			    map.put("title", msgPopData(modelAction, alertMsg1).get("title"));
			    map.put("width", msgPopData(modelAction, alertMsg1).get("width"));
			    map.put("height", msgPopData(modelAction, alertMsg1).get("height"));
			    map.put("time", msgPopData(modelAction, alertMsg1).get("time"));
				try{
			if("add".equals(model)){
				String sql="select * from t_grape_level where data_auth=? and LEVEL_SCORE=?";
				String score=request.getParameter("level_score");
				String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
				int count =modelService.countSql(sql, new Object[] {dataAuth,score});
				if(count>0) {
					map.put("returnMsg", "error");
				}else {
					insert(request,modelService);
					map.put("returnMsg", "addSucc");
				}
				
		   
		     
			}else if("del".equals(model)){
				map.put("del","del");
				update(request,modelService);
				
			}else if("modify".equals(model)){
				modify(request,modelService);
				map.put("modify","modify");
				
			}
			map.put("key", "OK");
			map.put("error", "NO");
			//map.put("key", "安全");
			//return modelAction.AJAX;
		}catch(Exception e){
			map.put("error", e.toString());
			return BaseActionSupport.AJAX;
		}	
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
		}
		
		public void update(HttpServletRequest req,ModelService modelService) {
			TableDataMapExt ext = new TableDataMapExt();
			String sql = "select row_number() over() as RN,id from (select * from t_grape_level order by level_score desc) as foo";
			List<Map<String, Object>> list = modelService.listDataSql(sql);
			if(list!=null){
				ext.setTableName("t_grape_level");
				for(Map map:list){
					ext.getColMap().put("level_code",map.get("RN") );//map.get("RN")
					ext.setSqlWhere(" and id=?");
					ext.getSqlWhereArgs().clear();
					ext.getSqlWhereArgs().add(map.get("ID"));
					modelService.edit(ext);
					
				}
			}
			
		}
		public void modify(HttpServletRequest req,ModelService modelService)throws Exception{
			TableDataMapExt ext = new TableDataMapExt();
			ext.setTableName("t_grape_level");
			ext.getColMap().put("level_color", req.getParameter("level_color"));
			//ext.getColMap().put("level_code", req.getParameter("level_code"));
			//ext.getColMap().put("level_code", Integer.valueOf(req.getParameter("level_code")));
			//ext.getColMap().put("level_score", req.getParameter("level_score"));
			ext.getColMap().put("level_score", Integer.valueOf(req.getParameter("level_score")));
			ext.setSqlWhere(" and id=?");
			ext.getSqlWhereArgs().add(req.getParameter("id"));
			modelService.edit(ext);
			update(req,modelService);
		}
		
		public void insert(HttpServletRequest req,ModelService modelService)throws Exception{
			TableDataMapExt ext = new TableDataMapExt();
			String auth = req.getSession().getAttribute("mcDataAuth").toString();
			ext.setTableName("t_grape_level");
			ext.getColMap().put("level_color", req.getParameter("level_color"));
			//ext.getColMap().put("level_code", req.getParameter("level_code"));
		    ext.getColMap().put("level_code", Integer.valueOf(req.getParameter("level_code")));
			//ext.getColMap().put("level_score", req.getParameter("level_score"));
			ext.getColMap().put("level_score", Integer.valueOf(req.getParameter("level_score")));
			ext.getColMap().put("id", StringUtils.getUUID());
			ext.getColMap().put("DATA_AUTH", auth);
			modelService.save(ext);
			update(req,modelService);
		}
		
		
		
		
		@SuppressWarnings("unchecked")
		private Map msgPopData(ModelAction modelAction, String alertMsg)
		  {
		    Map map = new HashMap<String, Object>();
		    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		    title = modelAction.getText(title);
		    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		    map.put("title", title);
		    map.put("width", width);
		    map.put("height", height);
		    map.put("time", time);
		    map.put("alertMsg", alertMsg);
		    return map;
		  }
		
		
		
	}
		