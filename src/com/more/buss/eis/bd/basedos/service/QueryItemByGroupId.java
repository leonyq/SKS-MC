package com.more.buss.eis.bd.basedos.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class QueryItemByGroupId implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    
		String groupId = request.getParameter("groupId");
		//根据物料组id取出已分配当前组的物料信息
		String querySql = "select t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t WHERE t.ci_group_id=?";
		List itemList = modelService.listDataSql(querySql, new Object[] { groupId });
		//根据物料组id取出未分配当前组的物料信息
		String querySql1 = "select t.ci_item_type,t.ci_item_code,t.ci_item_name,t.ci_item_spec from T_CO_ITEM t WHERE t.ci_group_id!=?";
		List itemList1 = modelService.listDataSql(querySql1, new Object[] { groupId });
		Map map = new HashMap();
	    	map.put("yList", itemList);
	    	map.put("nList", itemList1);
	    	modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
