package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * APP功能配置---获取各类下拉框信息
 * 
 * @author Administrator
 *
 */
public class GetSelectValue implements FuncService {

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String selectType = req.getParameter("selectType");
		String menuId = req.getParameter("menuId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "";
		List<Map> dataList = new ArrayList<Map>();
		if ("1".equals(selectType)) {// 导航菜单
			sql = "select * from SY_DICT_VAL where DICT_CODE = 'MAIN_MENU'  ";
			dataList = modelService.listDataSql(sql);
		}
		if ("2".equals(selectType)) {// 功能模块
			sql = "select ID,TAM_MOUDLE_NAME from T_APP_MOUDLE where TAM_MENU_ID=?";
			dataList = modelService.listDataSql(sql, new Object[] { menuId });
		}
		if ("3".equals(selectType)) {// 显示类型
			sql = "select * from SY_DICT_VAL where DICT_CODE = 'APP_SHOW_TYPE'  ";
			dataList = modelService.listDataSql(sql);
		}

		modelAction.setAjaxList(dataList);
		return BaseActionSupport.AJAX;
	}

}
