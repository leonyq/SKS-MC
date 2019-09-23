package com.more.buss.eis.bd.route.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 流程信息----新增修改获取流程列表
 * 
 * @author Administrator
 *
 */
public class GetRountMsgSelect implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String crStep = req.getParameter("crStep");
		// 组织机构
		String auth = req.getSession().getAttribute("mcDataAuth").toString();
		String sql = "SELECT CR_ROUTE_ID,CR_ROUTE_NAME FROM T_CO_ROUTE WHERE CR_ROUTE_STEP = ? AND DATA_AUTH=? ";
		// String sql = "SELECT CR_ROUTE_ID,CR_ROUTE_NAME FROM T_CO_ROUTE WHERE
		// CR_ROUTE_STEP = ? ";
		List<Map> dataList = new ArrayList<Map>();
		dataList = modelService.listDataSql(sql, new Object[] { crStep, auth });
		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
