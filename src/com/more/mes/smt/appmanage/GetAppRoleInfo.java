package com.more.mes.smt.appmanage;

import java.util.List;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * APP----角色功能----配置权限前获取配置信息
 * 
 * @author Administrator
 *
 */
public class GetAppRoleInfo implements FuncService {

	public String exeFunc(ModelAction modelAction, ModelService modelservice) {

		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		// 读取角色信息并存入datalist
		String sql = "select NAME,ID from SY_ROLE where 1=1";
		List l;
		l = modelservice.listSql(sql, null, null, null, null, null);
		modelAction.setDataList(l);
		// 取出APP信息
		List l2;

		String sql2 = "select TAS_FUN_NAME,ID from t_app_showmanage where 1=1";
		l2 = modelservice.listSql(sql2, null, null, null, null, null);
		modelAction.setDataList1(l2);

		List l3;
		String sql3 = "  select distinct T.TAS_MENU_ID ,T1.VALUE  from T_APP_SHOWMANAGE T  "
				+ "  LEFT JOIN SY_DICT_VAL  T1 ON T.TAS_MENU_ID=T1.CODE " + " WHERE T1.DICT_CODE=?";
		l3 = modelservice.listDataSql(sql3, new Object[] { "MAIN_MENU"});
		modelAction.setDataList2(l3);
		return modelAction.ActionForwardExeid("4c5a1c82a3ec4388a5d263f8ed078a62");
	}
}
