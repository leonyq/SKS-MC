package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取APP功能配置信息
 * 
 * @author Administrator
 *
 */
public class AjaxGetAppManage implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String menuId = request.getParameter("menuId");// 导航菜单
		String moudleId = request.getParameter("moudleId");// 功能模块
		String funName = request.getParameter("funName");// 功能细项
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "select t4.NAME as DATA_AUTH , t.*,t1.value as FUNCNAME,t2.TAM_MOUDLE_NAME,T3.VALUE AS TYPENAME from T_APP_SHOWMANAGE t "
				+ " LEFT JOIN SY_DICT_VAL T1 ON T1.CODE = T.TAS_MENU_ID AND T1.DICT_CODE = 'MAIN_MENU' "
				+ " LEFT JOIN SY_DICT_VAL T3 ON T3.CODE = T.TAS_SHOW_TYPE AND T3.DICT_CODE = 'APP_SHOW_TYPE' "
				+ " LEFT JOIN T_APP_MOUDLE T2 on t2.id = t.tas_moudle_id    "
				+ " LEFT JOIN SY_DEPT T4 on t4.id = t.DATA_AUTH   where 1=1  ";
		ArrayList<String> arr = new ArrayList<String>();
		if (StringUtils.isNotBlank(menuId)) {
			sql += " and t.TAS_MENU_ID =? ";
			arr.add(menuId);
		}

		if (StringUtils.isNotBlank(moudleId)) {
			sql += " and t.TAS_MOUDLE_ID =? ";
			arr.add(moudleId);
		}

		if (StringUtils.isNotBlank(funName)) {
			sql += " and t.TAS_FUN_NAME =? ";
			arr.add(funName);
		}

		int num = arr.size();
		Object[] sObj = new Object[num];
		for (int i = 0; i < num; i++) {
			sObj[i] = arr.get(i);
		}
		sql = sql + " order by t.TAS_MENU_ID,t2.TAM_SEQ,t.TAS_SEQ ";
		List list = modelService.listDataSql(sql, sObj);
		modelAction.setAjaxList(list);
		return BaseActionSupport.AJAX;
	}

}
