package com.more.buss.device.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * ajax回填值
 * @author Administrator
 *
 */
public class GetDeviceItemByAjaxService implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "static-access" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    List<Object> deviceItemList = null;
		try {
			String deviceType = request.getParameter("deviceType");
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String sql = "SELECT t.ID,cdi_device_type, cdi_item_type, cdi_item_code, cdi_item_name, cdi_item_class, cdi_item_maxvalue, cdi_item_minvalue, cdi_item_unit, cdi_cycle FROM t_co_device_item t where cdi_device_type=? and data_auth=? ";
		    deviceItemList = modelService.listDataSql(sql, new Object[] { deviceType,dataAuth });	
		    CommMethod.listToEscapeJs(deviceItemList);
		    modelAction.setAjaxList(deviceItemList);
		} catch (Exception e) {
			log.error(e);
		}
		 return modelAction.AJAX;// 该ID为功能对应的视图ID
	}

}
