package com.more.mes.smt.devicedataconfig;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存设备配置源配置信息（修改）
 * 
 * @author development
 */
public class EditSaveDeviceSnConfigInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	   // String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String dataId = request.getParameter("dataId");
	        String cdsData = request.getParameter("paraMapObj.CDS_DATA");
	        String cdDeviceSn = request.getParameter("paraMapObj.CDS_DEVICE_SN");
	        String cdsAreaSn= request.getParameter("paraMapObj.CDS_AREA_SN");
	        String cdsAreaName = request.getParameter("paraMapObj.CDS_AREA_NAME");
	        String cdsDeviceType = request.getParameter("paraMapObj.CDS_DEVICE_TYPE");
    		
			// 插入设备数据源配置信息表
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_CO_DEVICE_SETING");
		 	CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.setSqlWhere(" and ID = ?");
		 	List<Object> wList = new ArrayList<Object>();
            wList.add(dataId);
            wms.setSqlWhereArgs(wList);
		 	wms.getColMap().put("CDS_DEVICE_TYPE", cdsDeviceType);
		 	wms.getColMap().put("CDS_DEVICE_SN", cdDeviceSn);
		 	wms.getColMap().put("CDS_AREA_SN", cdsAreaSn);
		 	wms.getColMap().put("CDS_AREA_NAME", cdsAreaName);
		 	wms.getColMap().put("CDS_DATA", cdsData);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.edit(wms);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("请勿修改已存在的设备"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
