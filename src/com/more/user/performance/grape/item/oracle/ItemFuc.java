package com.more.user.performance.grape.item.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.aliyuncs.http.HttpRequest;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 员工考核 项目操作
 * 
 * @author MMZ
 * 
 */
public class ItemFuc implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String model = request.getParameter("model");
		Map<String, Object> map = new HashMap();
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.setAjaxMap(map);

		try {
			
			if ("add".equals(model)) {
				insert(request, modelService);
				map.put("returnMsg", "addSucc");

			} else if ("chang_status".equals(model)) {
				map.put("chang", "change");
				change_status(request, modelService);

			} else if ("modify".equals(model)) {
				modify(request, modelService);
				map.put("modify", "modify");
			} else if ("checkScore".equals(model)) {
				checkScore(request, modelService, modelAction);
			}else if ("show_me".equals(model)){
				showChange(request, modelService, modelAction);
				
			}
			map.put("key", "OK");
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			map.put("error", e);
			return BaseActionSupport.AJAX;
		}
	}

	public void update(HttpServletRequest req, ModelService modelService) {
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		ext.setSqlWhere(" and id=?");
		ext.getSqlWhereArgs().add(req.getParameter("ID"));
		modelService.del(ext);
		// update(req, modelService);
	}

	public void modify(HttpServletRequest req, ModelService modelService) {

		String itemlist = req.getParameter("list");
		System.out.println(itemlist);
		JSONArray json = JSONArray.fromObject(itemlist);
		// 更新信息
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		String grape_dept_id = req.getParameter("GRAPE_DEPT_ID");
		for (Object obj : json) {
			JSONObject jo = (JSONObject) obj;
			ext.getColMap().put("item_score", jo.getString("ITEM_SCORE"));
			ext.getColMap().put("item_name", jo.getString("ITEM_NAME"));
			//ext.getColMap().put("grape_dept_id", grape_dept_id);
			ext.setSqlWhere("and id = ?");
			ext.getSqlWhereArgs().clear();
			ext.getSqlWhereArgs().add(jo.getString("ID"));
			modelService.edit(ext);
		}
	}

	public void insert(HttpServletRequest req, ModelService modelService) {
		TableDataMapExt ext = new TableDataMapExt();
		String auth = req.getSession().getAttribute("mcDataAuth").toString();
		ext.setTableName("t_user_item");
		ext.getColMap().put("item_score", req.getParameter("ITEM_SCORE"));
		ext.getColMap().put("item_name", req.getParameter("ITEM_NAME"));
		ext.getColMap().put("grape_dept_id", req.getParameter("GRAPE_DEPT_ID"));
		ext.getColMap().put("id", StringUtils.getUUID());
		ext.getColMap().put("DATA_AUTH",auth);
		modelService.save(ext);

	}

	public void checkScore(HttpServletRequest req, ModelService modelService, ModelAction ac) {
		int score = "".equals(req.getParameter("score")) ? 0 : Integer.parseInt(req.getParameter("score"));
		String deptId = req.getParameter("dept_id");
		String id = req.getParameter("id");//项目ID
		String sql = "SELECT NVL(SUM(ITEM_SCORE),0) total FROM T_USER_ITEM  WHERE GRAPE_DEPT_ID =? and id != ? and data_status !=-1";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { deptId , id});
		if (null != list && list.size() > 0) {
			Object total = list.get(0).get("total");
			ac.getAjaxMap().put("toatal", total);
		} else {
			ac.getAjaxMap().put("toatal", 0);
		}
	}

	@SuppressWarnings("unchecked")
	private Map msgPopData(ModelAction modelAction, String alertMsg) {
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

	public void change_status(HttpServletRequest req, ModelService modelService) {
		String itemlist = req.getParameter("list");
		String[] list = itemlist.split(",");

		// 更新信息
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("t_user_item");
		for (Object obj : list) {
			ext.getColMap().put("DATA_STATUS", -1);
			ext.setSqlWhere("and id = ?");
			ext.getSqlWhereArgs().clear();
			ext.getSqlWhereArgs().add(obj);
			modelService.edit(ext);
		}

	}
	//项目切换
	public void showChange(HttpServletRequest request, ModelService modelService, ModelAction modelAction){
			String show = request.getParameter("show");//FA174AFF136D496A87B65443D22357E3
			TableDataMapExt ext = new TableDataMapExt();
			ext.setTableName("T_USER_ITEM");
			ext.getColMap().put("SHOW_ME", 0);
			ext.setSqlWhere(" and SHOW_ME=1 ");
			modelService.edit(ext);
			
			ext.getColMap().put("SHOW_ME",1);
			ext.setSqlWhere(" and GRAPE_DEPT_ID = ?");
			ext.getSqlWhereArgs().clear();
			ext.getSqlWhereArgs().add(show);
			int inx = modelService.edit(ext);
			if(inx==-1){
				modelAction.getAjaxMap().put("error", "FALSE");
			}
	}
	

}
