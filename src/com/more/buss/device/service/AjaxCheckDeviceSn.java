package com.more.buss.device.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 判断设备是否已有保养计划
 * @author Administrator
 *
 */
public class AjaxCheckDeviceSn implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String deviceSn = request.getParameter("deviceSn");  //设备Sn
		String itemCode = request.getParameter("itemCode");  //项目代码
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String sql = "select t.* from T_CO_DEVICE_PLAN_CONNECT t " +
				"WHERE t.CDPI_DEVICE_SN= ? AND t.cdpi_item_code = ? and t.data_auth=? ";
		List sList = modelService.listDataSql(sql, new Object[] { deviceSn,itemCode,auth });
		CommMethod.listToEscapeJs(sList);
		modelAction.setAjaxList(sList);
		return BaseActionSupport.AJAX;
	}

}
