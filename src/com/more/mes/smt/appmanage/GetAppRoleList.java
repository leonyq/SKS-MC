package com.more.mes.smt.appmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetAppRoleList implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		String tarRoleId = request.getParameter("tarRoleId");
		String tarMenuId = request.getParameter("tarMenuId");
		String baseSql = "SELECT\n" +
				"	t2. NAME AS \"ROLE_NAME\",\n" +
				"	T3.VALUE AS \"MENU_NAME\",\n" +
				"	T4.TAM_MOUDLE_NAME AS \"MOUDLE_NAME\",\n" +
				"	T5.TAS_FUN_NAME AS \"FUN_NAME\",\n" +
				"	T1.TAR_SEQ\n" +
				"FROM\n" +
				"	T_APP_ROLE t1\n" +
				"LEFT JOIN SY_ROLE t2 ON t1.TAR_ROLE_ID = t2. ID\n" +
				"LEFT JOIN SY_DICT_VAL t3 ON t1.tar_menu_id = t3.CODE\n" +
				"AND t3.dict_code = 'MAIN_MENU'\n" +
				"LEFT JOIN T_APP_MOUDLE t4 ON t1.tar_moudle_id = t4. ID\n" +
				"LEFT JOIN T_APP_SHOWMANAGE t5 ON t1.tas_fun_id = t5. ID";
		String sqlOrder = "ORDER BY\n" +
				"	T2. ID,\n" +
				"	T3.CODE,\n" +
				"	T4. ID,\n" +
				"	TAR_SEQ ";
		String sqlWhere = " where 1=1 ";
		Map dataMap = new HashMap<>();
		if (StringUtils.isNotBlank(tarRoleId)) {
			sqlWhere+= " AND t2.ID = :roleId ";
			dataMap.put("roleId", tarRoleId);
		}
		if (StringUtils.isNotBlank(tarMenuId)) {
			sqlWhere+= " AND t3.CODE = :menuId ";
			dataMap.put("menuId", tarMenuId);
		}
		List list = modelService.listSql(baseSql+sqlWhere+sqlOrder, modelAction.getPage(), dataMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		return BaseActionSupport.AJAX;
	}

}
