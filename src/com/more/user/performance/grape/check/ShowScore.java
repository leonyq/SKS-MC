package com.more.user.performance.grape.check;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @ClassName:ShowScore
 * @Description:点击葡萄时候展示出  各项目 分数  描述
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月13日下午2:52:32
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class ShowScore implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String id = request.getParameter("id");
		String check_user_id = request.getParameter("check_user_id");
		// 查询葡萄信息 包括 表grap_mian_info 和 grape_score 的信息
		String sql = "select  item_id,a.item_score item_score,b.item_score max_score,remark ,b.item_name item_name from t_grape_score a left join  t_user_item b on a.item_id = b.id where mian_id = ? ";//外连t_user_item表  
		try {
			List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] {id});
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.getAjaxPage().setDataList(list);
			CommMethod.listMapToEscapeJs(list);
			modelAction.setAjaxMap(new HashMap<String,Object>());
			if(StringUtils.isNotBlank(check_user_id)){
				sql = "select name, id  from sy_user where id = ?";
				List<Map<String, Object>> check_user = modelService.listDataSql(sql, new Object[] {check_user_id});
				if(null!=check_user&&check_user.size()>0){
					modelAction.getAjaxMap().put("check_user_name",check_user.get(0).get("name"));
					modelAction.getAjaxMap().put("check_user_id",check_user.get(0).get("id"));
				}else{
					modelAction.getAjaxMap().put("check_user_name","");
					modelAction.getAjaxMap().put("check_user_id","");
				}				
			}else{
				modelAction.getAjaxMap().put("check_user_name","");
				modelAction.getAjaxMap().put("check_user_id","");
			}
			return BaseActionSupport.AJAX;
		} catch (Exception e) {
			Map<String,Object> map = new HashMap();
			map.put("error", e);
			modelAction.setAjaxPage(modelAction.getPage());
			
			modelAction.setAjaxMap(map);
			return BaseActionSupport.AJAX;

		}

	}



}
