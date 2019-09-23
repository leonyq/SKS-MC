package com.more.user.performance.grape.check.oracle;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查询部门信息  组成传给前端，前端以map形式保存  部门 ID 名称键值对
 * 
 * @author MMZ
 * 
 */
public class SeachDept implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String,Object> map = new HashMap();
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.setAjaxMap(map);
		String dept_id = request.getParameter("dept_id");
		
		 String auth = request.getSession().getAttribute("mcDataAuth").toString();
		 if(StringUtils.isBlank(dept_id)){
	      dept_id = auth;
	    }
		try {//客户初入考核项目配置页面时的初始化设置
//			String sql_checkLevel = "SELECT T.ID ID  , T.NAME NAME  ,(CASE WHEN T.ID=? THEN 9  ELES NVL(T2.SHOW_ME,0)) RULE FROM SY_DEPT T LEFT JOIN (select distinct grape_dept_ID  ,SHOW_ME from t_user_item) T2 ON T.ID = T2.GRAPE_DEPT_ID";
	/*		String sql_checkLevel = "SELECT T.ID ID  , T.NAME NAME  ,(CASE WHEN T.ID=? THEN 9  ELSE NVL(T2.SHOW_ME,0) END ) MMZ_RULE FROM SY_DEPT " +
					" T LEFT JOIN (select distinct grape_dept_ID  ,SHOW_ME from t_user_item) " +
					" T2 ON T.ID = T2.GRAPE_DEPT_ID order by mmz_rule desc";*/
			
			String sql_checkLevel = "select id  , name  from sy_dept t start with  t.id=? "+
			                        " connect by prior t.id = t.UP_ID ";
			List<Map<String, Object>> list = modelService.listDataSql(sql_checkLevel,new Object[]{dept_id});
			modelAction.getAjaxPage().setDataList(list);
			sql_checkLevel = "select id  , name  from sy_dept t start with  t.id=? "+
        " connect by prior t.id = t.UP_ID ";
			List<Map<String, Object>> list1 = modelService.listDataSql(sql_checkLevel,new Object[]{auth});
			modelAction.setAjaxList(list1);
			if(null!=list&&list.size()>0&&null!=list.get(0).get("ID")&&!"".equals(list.get(0).get("ID"))){//显示排在最前面的部门的项目
				showChange(request, modelService, modelAction ,	list.get(0).get("ID").toString());
			}
			map.put("success", "OK");
		} catch (Exception e) {
			log.error(e);
			map.put("error", e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
		return BaseActionSupport.AJAX;
	}
	
	//项目切换
	public void showChange(HttpServletRequest request, ModelService modelService, ModelAction modelAction ,String show){
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
