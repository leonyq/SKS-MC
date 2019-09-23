package com.more.mes.smt.appmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取导航图片列表
 * @author Administrator
 *
 */
public class GetNavigationList implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String menuCode = modelAction.getRequest().getParameter("menuCode");
		Map paramMap = new HashMap<>();
		String sql = "SELECT\n" +
				"	T1.ID,T1.TAM_PHOTO_PATH,T1.TAM_PHOTO_PATH2,T2.VALUE AS MENU_NAME\n" +
				"FROM\n" +
				"	T_APP_MENU T1 LEFT JOIN SY_DICT_VAL T2 ON T1.TAM_MENU_NAME = T2.CODE \n" +
				"WHERE T2.DICT_CODE = 'MAIN_MENU'";
		if (StringUtils.isNotBlank(menuCode)) {
			sql+= " AND T2.CODE = :code ";
			paramMap.put("code", menuCode);
		}
		List list = modelService.listSql(sql,modelAction.getPage(),paramMap,null,null);
		CommMethod.listMapToEscapeJs(list);
		modelAction.setAjaxPage(modelAction.getPage());
		return BaseActionSupport.AJAX;
	}
	
}
