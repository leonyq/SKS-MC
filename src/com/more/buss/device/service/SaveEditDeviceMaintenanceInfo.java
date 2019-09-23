package com.more.buss.device.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.Constants;

public class SaveEditDeviceMaintenanceInfo  implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String formId = request.getParameter("formId");
        	if(StringUtils.isBlank(formId)){
          		formId = request.getParameter("formIds");
       		}
        	String iframeId = request.getParameter("iframeId");
		try {
			String dataId = request.getParameter("dataId");
			String CDM_MT_CONTENT = request.getParameter("paraMapObj.CDM_MT_CONTENT");
			String deviceItemReal = null;
			String CDM_ITEM_TYPE = request.getParameter("CDM_ITEM_TYPE");
			if(CDM_ITEM_TYPE.equals("设备参数")){
				deviceItemReal = request.getParameter("deviceItemReal1");
			}
			if(CDM_ITEM_TYPE.equals("保养项目")){
				deviceItemReal = request.getParameter("deviceItemReal2");
			}
			if(CDM_ITEM_TYPE.equals("点检项目")){
				deviceItemReal = request.getParameter("deviceItemReal3");
			}
			if(CDM_ITEM_TYPE.equals("校验项目")){
				deviceItemReal = request.getParameter("deviceItemReal4");
			}
			
			TableDataMapExt deviceMaintenance = new TableDataMapExt();
			deviceMaintenance.setTableName("T_CO_DEVICE_MAINTENANCE");	
			deviceMaintenance.setSqlWhere(" and ID='" + dataId + "'");
			deviceMaintenance.getColMap().put("CDM_ITEM_REAL", deviceItemReal);
			deviceMaintenance.getColMap().put("CDM_MT_CONTENT", CDM_MT_CONTENT);
			modelService.edit(deviceMaintenance);
			
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
		return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
		//return modelAction.reloadParent(modelAction.getText("保存成功"));
	}

}
