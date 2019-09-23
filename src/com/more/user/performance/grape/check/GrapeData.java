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
 * @ClassName:GrapeData 葡萄图颗粒信息
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月7日上午10:06:13
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class GrapeData implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String user_id = request.getParameter("user_id");
		String date = request.getParameter("date");
		String dataAuth = request.getParameter("dataAuth");
		if(dataAuth==null||dataAuth.trim().equals(""))dataAuth=String.valueOf(request.getSession().getAttribute("mcDataAuth"));
		date = date.substring(0, 7);
		
		// 查询葡萄信息 包括 表grap_mian_info 和 grape_score 的信息
		String sql = "select a.id as id ,to_char(a.check_date,'yyyy-mm-dd') as check_date,a.check_user_id , b.level_color from T_GRAPE_MIAN_INFO  a left join v_grap_score b on a.total_score <= b.hig and a.total_score > b.low where  user_id = ? and to_char(check_date,'yyyy-mm') = ? and b.data_auth=?";
		try {
			List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { user_id, date,dataAuth });
			modelAction.setAjaxPage(modelAction.getPage());
			modelAction.getAjaxPage().setDataList(list);
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
