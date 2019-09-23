package com.more.mes.smt.appmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.bd.service.impl.oracle.BussModelServiceImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据导航菜单id获取功能模块
 * @author Administrator
 *
 */
public class AjaxGetFunMoudleById extends BussModelServiceImpl implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String menuId = request.getParameter("menuId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select ID,TAM_MOUDLE_NAME from T_APP_MOUDLE where TAM_MENU_ID=? ";
		List moList = modelService.listDataSql(sql,new Object[]{menuId});
		modelAction.setAjaxList(moList);
		return BaseActionSupport.AJAX;
	}

}
