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
 * 获取功能模块列表
 * @author Administrator
 *
 */
public class GetAppMoudleList implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		String menuCode = modelAction.getRequest().getParameter("menuCode");
		String moudleName = modelAction.getRequest().getParameter("moudleName");
		Map paramMap = new HashMap<>();
		String sql = "SELECT T1.ID,T2.VALUE AS MENU_NAME , T1.TAM_MOUDLE_NAME ,T1.TAM_SEQ"
				+ " from T_APP_MOUDLE T1 LEFT JOIN SY_DICT_VAL T2 ON T1.TAM_MENU_ID = T2.CODE\n" +
				"WHERE T2.DICT_CODE = 'MAIN_MENU'";
		if (StringUtils.isNotBlank(menuCode)) {
			sql+= " AND T2.CODE = :code ";
			paramMap.put("code", menuCode);
		}
		if (StringUtils.isNotBlank(moudleName)) {
			sql+= " AND T1.TAM_MOUDLE_NAME LIKE %:moudleName% ";
			paramMap.put("moudleName", moudleName);
		}
		String sqlOrder = " ORDER BY T1.TAM_MENU_ID,T1.TAM_SEQ ";
		List list = modelService.listSql(sql+sqlOrder,modelAction.getPage(),paramMap,null,null);
		CommMethod.listMapToEscapeJs(list);
		modelAction.setAjaxPage(modelAction.getPage());
		return BaseActionSupport.AJAX;
	}
	
}
