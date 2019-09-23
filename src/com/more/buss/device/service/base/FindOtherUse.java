package com.more.buss.device.service.base;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除设备信息
 * @author Administrator
 *
 */
public class FindOtherUse  implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		
		//获取设备sn
		String delDoc = request.getParameter("deviceSn") ;//需要删除的设备sn串
		if (StringUtils.isBlank(delDoc)) {
			return modelAction.alertParentInfo(modelAction.getText("设备sn为空"));
		}
		String[] strArray = delDoc.split(",");
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String deviceSn = "";//需要删除的设备sn
		String sql1 = "SELECT\r\n" + 
				"		t1.id \r\n" + 
				"	FROM\r\n" + 
				"		T_CO_AREA_DEVICE t1 \r\n" + 
				"		LEFT JOIN T_CO_DEVICE t2 ON T1.CAD_DEVICE_ID = t2.id \r\n" + 
				"		AND t2.data_auth = t1.data_auth\r\n" + 
				"	WHERE\r\n" + 
				"		t2.CD_DEVICE_SN=? and t1.data_auth = ? ";
		//查找车间建模是否引用设备
		for(int i=0;i<strArray.length;i++) {
			List<Map> deviceList = modelService.listDataSql(sql1,new Object[] {strArray[i],dataAuth});
			if (deviceList != null &&  !deviceList.isEmpty()) {
			return modelAction.alertParentInfo(strArray[i]+modelAction.getText("设备被车间建模占用"));
			 }		
		}
		TableDataMapExt ext = new TableDataMapExt();
		ext.setTableName("T_CO_DEVICE");
		List paramList = new ArrayList<>();
		for(int i=0;i<strArray.length;i++){
			ext.setSqlWhere(" AND CD_DEVICE_SN = ? AND DATA_AUTH = ? ");
			paramList.clear();
			paramList.add(strArray[i]);
			paramList.add(dataAuth);
			ext.setSqlWhereArgs(paramList);
			modelService.del(ext);
		}
		
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
