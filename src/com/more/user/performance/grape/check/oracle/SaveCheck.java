package com.more.user.performance.grape.check.oracle;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.util.Util;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import edu.emory.mathcs.backport.java.util.LinkedList;

/**
 * 保存葡萄图分数信息
 * 
 * @author MMZ
 * 
 */
public class SaveCheck implements FuncService {

	private  final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	 public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String auth = request.getSession().getAttribute("mcDataAuth").toString();
   
    //获取基础数据
    String date = request.getParameter("date");
    String user_id = request.getParameter("user_id"); 
    String headuser_id = request.getParameter("headuser_id");
    String main_info_id =null;
    
    
   
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    if (StringUtils.isBlank(date)) {//date为空时，设置查询时间为现在
			date = DateUtil.getCurDateStr().substring(0,10);
		}


        //获得总分
    String itemlist = request.getParameter("itemList");
    //JSONArray json = JSONArray.fromObject(itemlist);
    JSONArray json = JSONArray.fromObject(itemlist);
    int score =0;
    for (Object obj : json) {
        JSONObject jo = (JSONObject)obj;
         score += jo.getInt("item_score");
    }
    
  	// 查询出当前总分对应的等级
		String sql_checkLevel = "SELECT A.ID ID  , ROWNUM  RN FROM (SELECT ID  FROM T_GRAPE_LEVEL   WHERE LEVEL_SCORE >= ? order by LEVEL_SCORE) A WHERE ROWNUM = 1";
		try{											
			List<Map<String, Object>> levelList = modelService.listDataSql(sql_checkLevel, new Object[] { score });
			String level_id = null;
			if(null!=levelList && levelList.size()>0) {
			for (Map<String, Object> m : levelList) {
				level_id = (String) m.get("ID");
			}// 查询等级结束
			}
			 //查看是否有当日记录
			String ifhas = "select id , rownum from  T_GRAPE_MIAN_INFO  where user_id=? and to_char(check_date,'yyyy-MM-dd') = ?";//查询语句 
	    
			List<Map<String, Object>>  serchList = modelService.listDataSql(ifhas, new Object[] { user_id,date });
	    String sql =null;
	    TableDataMapExt ext = new TableDataMapExt();
	    if (null!=serchList&&serchList.size()>0){//如果存在就更新它
	    	main_info_id =  StringUtils.toString(serchList.get(0).get("id"));//获得UUID
	    	//sql ="update T_GRAPE_MIAN_INFO set check_user_id="+headuser_id+",level_id="+level_id+",total_score="+score+"	where user_id='"+user_id+ "' and '"+date+"' = to_char(check_date,'yyyy-MM-dd')";
    		ext.setTableName("T_GRAPE_MIAN_INFO");
	      ext.getColMap().put("check_user_id",headuser_id);
	      ext.getColMap().put("level_id",level_id);
	      ext.getColMap().put("total_score",score);
	      ext.setSqlWhere(" and user_id=? and ?= to_char(check_date,'yyyy-MM-dd')");
	      List list = new ArrayList<>();
	      list.add(user_id);
	      list.add(date);
	      ext.setSqlWhereArgs(list);
	      modelService.edit(ext);
	    }else{
	    	main_info_id  = StringUtils.getUUID();
	    	
	    	ext = new TableDataMapExt();
    		ext.setTableName("T_GRAPE_MIAN_INFO");
	    	ext.getColMap().put("id",main_info_id );
	    	ext.getColMap().put("user_id",user_id );
	    	ext.getColMap().put("check_user_id",headuser_id);
	    	ext.getColMap().put("check_date",sdf.parse(date));
	    	ext.getColMap().put("level_id",level_id);
	    	ext.getColMap().put("total_score",score);
	    	if (StringUtils.isNotBlank(auth))
        {
	    	  ext.getColMap().put("DATA_AUTH",auth);
        }
	    	int index = modelService.save(ext);
	    	if(index<1){
    			throw new Exception("保存校验失败");
    		}
	    }
	    
	    //插入分数信息，同样分更新和插入两种--考虑到后续部门可能会临时新增加项目，对每个项目进行单独判断插入
	    for (Object obj : json) {//遍历获得得分项目
	    	JSONObject jo = (JSONObject)obj;
	    	String item_id = jo.getString("item_id");
	    	List<Map<String, Object>> gridlist = new ArrayList<Map<String, Object>>();
	    sql = "select * from t_grape_score where  mian_id = ? and item_id =  ? ";
	    gridlist = modelService.listDataSql(sql, new Object[] { main_info_id, item_id });
	    	if(null!=gridlist&&gridlist.size()>0){//更新
	    		ext = new TableDataMapExt();

	    		ext.setTableName("t_grape_score");
	    		ext.getColMap().put("item_score", jo.getString("item_score"));
	    		ext.getColMap().put("remark", jo.getString("remark"));
	    		ext.setSqlWhere(" and mian_id=? and item_id=? ");//此处把 main_info_id 写成mian_user_id导致更新异常
	    		 List list = new ArrayList<>();
	   	      list.add(main_info_id);
	   	      list.add(item_id);
	   	      ext.setSqlWhereArgs(list);
	    		modelService.edit(ext);
	    		
	    	}else{//插入
	    		ext = new TableDataMapExt();
	    		ext.setTableName("t_grape_score");
	    		ext.getColMap().put("id", StringUtils.getUUID());
	    		ext.getColMap().put("mian_id", main_info_id);
	    		ext.getColMap().put("item_id", jo.getString("item_id"));
	    		ext.getColMap().put("item_score", jo.getString("item_score"));
	    		ext.getColMap().put("remark", jo.getString("remark"));
	    		if (StringUtils.isNotBlank(auth))
	        {
	          ext.getColMap().put("DATA_AUTH",auth);
	        }
	    		int index1 = modelService.save(ext);
	    		if(index1<1){
	    			throw new Exception("保存校验失败");
	    		}
	    	}
	   }
	    
	    //List<Map<String, Object>> itemList = modelService.listSql(sql, modelAction.getPage(), "", null,null,null);
	    
	    modelAction.setAjaxPage(modelAction.getPage());
	    //modelAction.getAjaxPage().setDataList(itemList);
	      	
	     Map ajaxMap = new HashMap<String, Object>();
	     ajaxMap.put("index", date);
	     ajaxMap.put("index1", date.length());
	     
	     modelAction.setAjaxMap(ajaxMap);
	    //String iframeId = request.getParameter("iframeId");
	    //String isCloseWin = request.getParameter("isCloseWin");
	    return BaseActionSupport.AJAX;

		}catch(Exception e){
			Map ajaxMap = new HashMap<String, Object>();
	     ajaxMap.put("error", e);
	     modelAction.setAjaxMap(ajaxMap);
	     log.error(e.toString());
	     return BaseActionSupport.AJAX;
		}
		}
}
/*
 * 
 * 	System.out.println("-----------------------");
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("_DATA_AUTH");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

			// 新建MAPEXT
			TableDataMapExt manInfoItem = new TableDataMapExt();
			String mainInfo_guid = StringUtils.getUUID();
			TableDataMapExt grapeScoreItem = new TableDataMapExt();
			String grapeScore_guid = StringUtils.getUUID();

			// 遍历表单元素，根据Key值存入不同实体表
			Map<String, String> map = new HashMap<String, String>();
			map = request.getParameterMap();

			// 获取并移出主表信息
			String user_id = map.get("USER_ID");
			map.remove("USER_ID");
			String check_user_id = map.get("CHECK_USER_ID");
			map.remove("CHECK_USER_ID");
			String check_date = map.get("CHECK_USER_ID");
			map.remove("CHECK_USER_ID");
			String total_score = map.get("TOTAL_SCORE ");
			map.remove("TOTAL_SCORE ");

			// 查询出当前总分对应的等级
			String sql_checkLevel = "SELECT A.ID ID  FROM (SELECT ID FROM T_GRAPE_LEVEL , ROWNUM  RN WHERE LEVEL_SCORE >= ? order by LEVEL_SCORE) WHERE A.RN = 1 ";
			List<Map<String, Object>> levelList = modelService.listDataSql(sql_checkLevel, new Object[] { total_score });
			String level_id = null;
			for (Map<String, Object> m : levelList) {
				level_id = (String) m.get("ID");
			}// 查询等级结束

			manInfoItem.getColMap().put("ID", mainInfo_guid);
			manInfoItem.getColMap().put("USER_ID", user_id);
			manInfoItem.getColMap().put("CHECK_USER_ID", check_user_id);
			manInfoItem.getColMap().put("TOTAL_SCORE", total_score);
			manInfoItem.getColMap().put("LEVEL_ID", level_id);
			modelService.save(manInfoItem);// 存入葡萄主表

			// 剩余的都是项目分数信息
			for (String para : map.keySet()) {
				grapeScoreItem.clear();
				grapeScoreItem.put("id", grapeScore_guid);
				grapeScoreItem.put("main_id", mainInfo_guid);
				grapeScoreItem.put("item_score", map.get(para));
				grapeScoreItem.put("item_id", para);
				modelService.save(grapeScoreItem);// 存入项目得分表
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
 * 
 * */