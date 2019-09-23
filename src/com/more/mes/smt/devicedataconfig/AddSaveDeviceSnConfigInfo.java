package com.more.mes.smt.devicedataconfig;

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
 * 保存设备配置源配置信息（新增）
 * 
 * @author development
 */
public class AddSaveDeviceSnConfigInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
		HttpServletRequest request = modelAction.getRequest();
	   // String dataAuth = request.getParameter("_DATA_AUTH");
	    String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    
	    
	    
	    String iframeId = request.getParameter("iframeId");
	    try {
	      String cdsData= request.getParameter("paraMap1@0#CDS_DATA");
        String cdDeviceSn = request.getParameter("paraMap1@0#CDS_DEVICE_SN");
        String cdsAreaSn = request.getParameter("paraMap1@0#CDS_AREA_SN");
        String cdsAreaName = request.getParameter("paraMap1@0#CDS_AREA_NAME");
        String cdsDeviceType = request.getParameter("paraMap1@0#CDS_DEVICE_TYPE");
        String addType = request.getParameter("paraMap1@0#CDS_ADD_TYPE");
        String sql1 = "select * from T_CO_DEVICE_SETING where CDS_DEVICE_SN=? and DATA_AUTH=?";
        int count = 0;
        if(addType.equals("1")){
             sql1="select * from T_CO_DEVICE_SETING where  cds_device_type=? and DATA_AUTH=? ";
             count=modelService.countSql(sql1, new Object[]{cdsDeviceType,dataAuth});
        }
        if(addType.equals("0")){
            count=modelService.countSql(sql1, new Object[]{cdDeviceSn,dataAuth});
        }
	      
	        
	       if (count!=0)
        {
	         return modelAction.alertParentInfo(modelAction.getText("已存在请勿重复添加"));
        }
    		
			// 插入设备数据源配置信息表
		 	TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_CO_DEVICE_SETING");
		 	CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.getColMap().put("ID", StringUtils.getUUID());
		 	wms.getColMap().put("CDS_DEVICE_TYPE", cdsDeviceType);
		 	wms.getColMap().put("CDS_DEVICE_SN", cdDeviceSn);
		 	wms.getColMap().put("CDS_AREA_SN", cdsAreaSn);
		 	wms.getColMap().put("CDS_AREA_NAME", cdsAreaName);
		 	wms.getColMap().put("CDS_DATA", cdsData);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.save(wms);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException("新增失败", e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}

