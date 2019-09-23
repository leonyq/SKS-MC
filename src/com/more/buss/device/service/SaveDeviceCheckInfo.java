package com.more.buss.device.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
 * 设备校验保存
 * @author development
 *
 */
public class SaveDeviceCheckInfo  implements FuncService {
	
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
        	//设备校验信息字段
        	String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN"); //设备sn
			String deviceType = request.getParameter("CD_DEVICE_TYPE");	//设备类型
			String deviceClass = request.getParameter("CD_DEVICE_CLASS");//设备型号
			String checkType = request.getParameter("paraMapObj.CDC_CHECK_TYPE");//校验类型
			String taskTime = request.getParameter("paraMapObj.CDC_TASK_TIME");//校验工时(H)
			String checkCompany = null;//外校单位
			String outTime = null;//外校时间
			String returnTime = null;//返回时间
			String reportEmp = request.getParameter("paraMapObj.CDC_REPORT_EMP");//报检人
			String repairEmp = request.getParameter("paraMapObj.CDC_REPAIR_EMP");//校验人
			String checkContant = request.getParameter("paraMapObj.CDC_CHECK_CONTANT");//校验内容
			String dataAuth =request.getParameter("paraMapObj._DATA_AUTH");//组织机构
			String checkId = StringUtils.getUUID();//设备校验信息id
			if(checkType.equals("1")){ //外部
				checkCompany = request.getParameter("paraMapObj.CDC_CHECK_COMPANY");//外校单位
				outTime = request.getParameter("paraMapObj.CDC_OUT_TIME");//外校时间
				returnTime = request.getParameter("paraMapObj.CDC_RETURN_TIME");//返回时间
			}
			TableDataMapExt deviceMtInfo = new TableDataMapExt(); //设备校验信息表
			deviceMtInfo.setTableName("T_CO_DEVICE_CHCEK_INFO");
			CommMethod.addSysDefCol(deviceMtInfo.getColMap(), modelAction.getUser());
			deviceMtInfo.getColMap().put("ID", checkId);
			deviceMtInfo.getColMap().put("CDC_DEVICE_SN", deviceSn);
			deviceMtInfo.getColMap().put("CDC_DEVICE_TYPE", deviceType);
			deviceMtInfo.getColMap().put("CDC_DEVICE_CLASS", deviceClass);
			deviceMtInfo.getColMap().put("CDC_CHECK_TYPE", checkType);
			deviceMtInfo.getColMap().put("CDC_TASK_TIME", Double.valueOf(taskTime));
			if(checkType.equals("1")){ //外部
				deviceMtInfo.getColMap().put("CDC_CHECK_COMPANY", checkCompany);
				deviceMtInfo.getColMap().put("CDC_OUT_TIME", sdf.parse(outTime));
				deviceMtInfo.getColMap().put("CDC_RETURN_TIME", sdf.parse(returnTime));
			}
			deviceMtInfo.getColMap().put("CDC_REPORT_EMP", reportEmp);
			deviceMtInfo.getColMap().put("CDC_REPAIR_EMP", repairEmp);
			deviceMtInfo.getColMap().put("CDC_CHECK_CONTANT", checkContant);
			deviceMtInfo.getColMap().put("CDC_AUDIT_EMP", CommMethod.getSessionUser().getId());
			deviceMtInfo.getColMap().put("CDC_CHECK_TIME", sdf.parse(sdf.format(new Date())));
			if(dataAuth!=null){
      				deviceMtInfo.getColMap().put("DATA_AUTH", dataAuth);
      			}
			
			modelService.save(deviceMtInfo);
			//获取项目类别
			String deviceItemType1 = request.getParameter("type1");  //校验项目
			//获取项目类别里面的记录条数
			int num1 = Integer.parseInt(request.getParameter("trCount1"));
			//记录数不为空时
			if(num1!=0){
				//循环信息条数并插入数据库 设备保养明细表
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode1 = null;
				String deviceItemName1 = null;
				String deviceItemClass1 = null;
				String deviceItemMaxValue1 = null;
				String deviceItemMinValue1 = null;
				String deviceItemReal1 = null;
				String deviceItemContent1 = null;
				for(int i=1;i<num1+1;i++){
					 deviceItemCode1 = request.getParameter("deviceItemCode1_"+i);
					 deviceItemName1 = request.getParameter("deviceItemName1_"+i);
					 deviceItemClass1 = request.getParameter("deviceItemClass1_"+i);
					 deviceItemMaxValue1 = request.getParameter("deviceitemMaxvalue1_"+i);
					 deviceItemMinValue1 = request.getParameter("deviceitemMinvalue1_"+i);
					 deviceItemReal1 = request.getParameter("deviceItemReal1_"+i);
					 deviceItemContent1 = request.getParameter("deviceItemContent1_"+i);
					 deviceMaintenance.getColMap().clear();
					 deviceMaintenance.setTableName("T_CO_DEVICE_MT_DETAIL"); //设备保养明细表
					 CommMethod.addSysDefCol(deviceMaintenance.getColMap(), modelAction.getUser());
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDMI_ID", checkId);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_TYPE", deviceItemType1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_CODE", deviceItemCode1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_NAME", deviceItemName1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_CLASS", deviceItemClass1);
					 if (StringUtils.isNotBlank(deviceItemMaxValue1))
          {
					   deviceMaintenance.getColMap().put("CDMI_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue1));
          }
					 if (StringUtils.isNotBlank(deviceItemMinValue1))
          {
					   deviceMaintenance.getColMap().put("CDMI_ITEM_MINVALUE", Double.valueOf(deviceItemMinValue1));
          }
					if (StringUtils.isNotBlank(deviceItemReal1))
          {
					  deviceMaintenance.getColMap().put("CDMI_ITEM_REAL", Double.valueOf(deviceItemReal1));
          }
					 
					 deviceMaintenance.getColMap().put("CDMI_MT_CONTENT", deviceItemContent1);
					 if(dataAuth!=null){
      						deviceMaintenance.getColMap().put("DATA_AUTH", dataAuth);
      					 }
					 
					 modelService.save(deviceMaintenance);
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
        //return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
	}

}
