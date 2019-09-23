package com.more.mes.common;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 数据穿透过滤
 * @author Administrator
 *
 */
public class JumpFilter implements FuncService{

	@Override
	public String exeFunc(ModelAction action, ModelService service) {
		// TODO Auto-generated method stub
		String dataAuth = String.valueOf(action.getRequest().getSession().getAttribute("mcDataAuth"));
		String sql = "SELECT\n" +
				"	VR_VALUE\n" +
				"FROM\n" +
				"	T_SYS_PARAMETER_INI\n" +
				"WHERE\n" +
				"	VR_CLASS = 'MES0010'\n" +
				"AND DATA_AUTH = ?";
		List<Map<String, Object>> queryList = service.listDataSql(sql,new Object[]{dataAuth});
		if (queryList!=null&&queryList.size()>0) {
			Map<String, Object> queryMap = queryList.get(0);
			if ("1".equals(queryMap.get("VR_VALUE"))) {
				action.setAjaxString("true");
			}else{
				action.setAjaxString("false");
			}
		}else {
			TableDataMapExt device = new TableDataMapExt();
		      device.setTableName("T_SYS_PARAMETER_INI");
		      CommMethod.addSysDefCol(device.getColMap(), action.getUser());
		      device.getColMap().put("PRG_NAME", "MES");
		      device.getColMap().put("VR_TYPE", "1");
		      device.getColMap().put("VR_CLASS", "MES0010");
		      device.getColMap().put("VR_ITEM", "是否启用数据穿透");
		      device.getColMap().put("VR_DESC", "0：不启用|1：启用");
		      device.getColMap().put("VR_NAME", "2");
		      device.getColMap().put("VR_VALUE", "1");
		      device.getColMap().put("VR_FLAG", "Y");
		      device.getColMap().put("DEL_FLAG", "N");
		      device.getColMap().put("VR_MEMO", null);
		      device.getColMap().put("VR_DEF_VALUE", "1");
		      device.getColMap().put("VR_FUNC", null);
		      service.save(device);
			action.setAjaxString("true");
		}
		
		return BaseActionSupport.AJAX;
	}

}
