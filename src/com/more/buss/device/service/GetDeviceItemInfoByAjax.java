package com.more.buss.device.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax获取设备项目
 * @author Administrator
 *
 */
public class GetDeviceItemInfoByAjax implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String deviceSn = request.getParameter("deviceSn");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		try {
			String sql = "SELECT * FROM T_CO_DEVICE_ITEM_INFO where CDII_DEVICE_SN=? AND DATA_AUTH = ? ";
			List<Map> deviceItemList = modelService.listDataSql(sql, new Object[] { deviceSn,dataAuth });	   
			CommMethod.listToEscapeJs(deviceItemList);
		    modelAction.setAjaxList(deviceItemList);
		} catch (Exception e) {
			log.error(e);
		}
		return BaseActionSupport.AJAX;
	}
}
