package com.more.buss.device.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.Constants;

public class SaveDeviceMaintenanceInfo1  implements FuncService {

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
			String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN");
			String deviceType = request.getParameter("deviceType");
			String content = request.getParameter("CDM_MT_CONTENT");
			
			//获取项目类别
			String deviceItemType1 = request.getParameter("type1");  //设备参数
			String deviceItemType2 = request.getParameter("type2");	 //保养项目
			String deviceItemType3 = request.getParameter("type3");  //点检项目
			String deviceItemType4 = request.getParameter("type4");  //校验项目
			//获取每个项目类别里面的记录条数
			int num1 = Integer.parseInt(request.getParameter("trCount1"));
			int num2 = Integer.parseInt(request.getParameter("trCount2"));
			int num3 = Integer.parseInt(request.getParameter("trCount3"));
			int num4 = Integer.parseInt(request.getParameter("trCount4"));
			//获取当前时间与登录用户
			Date nowDate = DateUtil.getCurDate();
			String nowUser = CommMethod.getSessionUser().getName();
			//记录数不为空时
			if(num1!=0){
				//循环信息条数并插入数据库
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode1 = null;
				String deviceItemName1 = null;
				String deviceItemClass1 = null;
				String deviceItemMaxValue1 = null;
				String deviceItemMinValue1 = null;
				String deviceItemReal1 = null;
				String deviceItemUnit1 = null;
				for(int i=1;i<num1+1;i++){
					 deviceItemCode1 = request.getParameter("deviceItemCode1_"+i);
					 deviceItemName1 = request.getParameter("deviceItemName1_"+i);
					 deviceItemClass1 = request.getParameter("deviceItemClass1_"+i);
					 deviceItemMaxValue1 = request.getParameter("deviceitemMaxvalue1_"+i);
					 deviceItemMinValue1 = request.getParameter("deviceitemMinvalue1_"+i);
					 deviceItemReal1 = request.getParameter("deviceItemReal1_"+i);
					 deviceItemUnit1 = request.getParameter("deviceItemUnit1_"+i);
					 deviceMaintenance.setTableName("T_CO_DEVICE_MAINTENANCE");
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDM_DEVICE_SN", deviceSn);
					 deviceMaintenance.getColMap().put("CDM_DEVICE_TYPE", deviceType);
					 deviceMaintenance.getColMap().put("CDM_ITEM_TYPE", deviceItemType1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CODE", deviceItemCode1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_NAME", deviceItemName1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CLASS", deviceItemClass1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MAXVALUE", deviceItemMaxValue1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MINVALUE", deviceItemMinValue1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_REAL", deviceItemReal1);
					 deviceMaintenance.getColMap().put("CDM_ITEM_UNIT", deviceItemUnit1);
					 deviceMaintenance.getColMap().put("CDM_MT_CONTENT", content);
					 deviceMaintenance.getColMap().put("CDM_MT_EMP", nowUser);
					 deviceMaintenance.getColMap().put("CDM_MT_TIME", nowDate);
					 modelService.save(deviceMaintenance);
				}
			}
			if(num2!=0){
				//循环信息条数并插入数据库
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode2 = null;
				String deviceItemName2 = null;
				String deviceItemClass2 = null;
				String deviceItemMaxValue2 = null;
				String deviceItemMinValue2 = null;
				String deviceItemUnit2 = null;
				String deviceItemCycle2 = null;
				String deviceItemReal2 = null;
				for(int i=1;i<num2+1;i++){
					 deviceItemCode2 = request.getParameter("deviceItemCode2_"+i);
					 deviceItemName2 = request.getParameter("deviceItemName2_"+i);
					 deviceItemClass2 = request.getParameter("deviceItemClass2_"+i);
					 deviceItemMaxValue2 = request.getParameter("deviceitemMaxvalue2_"+i);
					 deviceItemMinValue2 = request.getParameter("deviceitemMinvalue2_"+i);
					 deviceItemReal2 = request.getParameter("deviceItemReal2_"+i);
					 deviceItemUnit2 = request.getParameter("deviceItemUnit2_"+i);
					 deviceItemCycle2 = request.getParameter("deviceItemCycle2_"+i);
					 deviceMaintenance.setTableName("T_CO_DEVICE_MAINTENANCE");
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDM_DEVICE_SN", deviceSn);
					 deviceMaintenance.getColMap().put("CDM_DEVICE_TYPE", deviceType);
					 deviceMaintenance.getColMap().put("CDM_ITEM_TYPE", deviceItemType2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CODE", deviceItemCode2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_NAME", deviceItemName2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CLASS", deviceItemClass2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MAXVALUE", deviceItemMaxValue2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MINVALUE", deviceItemMinValue2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_REAL", deviceItemReal2);
					 deviceMaintenance.getColMap().put("CDM_ITEM_UNIT", deviceItemUnit2);
					 deviceMaintenance.getColMap().put("CDM_CYCLE", deviceItemCycle2);
					 deviceMaintenance.getColMap().put("CDM_MT_CONTENT", content);
					 deviceMaintenance.getColMap().put("CDM_MT_EMP", nowUser);
					 deviceMaintenance.getColMap().put("CDM_MT_TIME", nowDate);
					 modelService.save(deviceMaintenance);
				}
			}
			if(num3!=0){
				//循环信息条数并插入数据库
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode3 = null;
				String deviceItemName3 = null;
				String deviceItemClass3 = null;
				String deviceItemMaxValue3 = null;
				String deviceItemMinValue3 = null;
				String deviceItemReal3 = null;
				String deviceItemUnit3 = null;
				for(int i=1;i<num3+1;i++){
					 deviceItemCode3 = request.getParameter("deviceItemCode3_"+i);
					 deviceItemName3 = request.getParameter("deviceItemName3_"+i);
					 deviceItemClass3 = request.getParameter("deviceItemClass3_"+i);
					 deviceItemMaxValue3 = request.getParameter("deviceitemMaxvalue3_"+i);
					 deviceItemMinValue3 = request.getParameter("deviceitemMinvalue3_"+i);
					 deviceItemReal3 = request.getParameter("deviceItemReal3_"+i);
					 deviceItemUnit3 = request.getParameter("deviceItemUnit3_"+i);
					 deviceMaintenance.setTableName("T_CO_DEVICE_MAINTENANCE");
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDM_DEVICE_SN", deviceSn);
					 deviceMaintenance.getColMap().put("CDM_DEVICE_TYPE", deviceType);
					 deviceMaintenance.getColMap().put("CDM_ITEM_TYPE", deviceItemType3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CODE", deviceItemCode3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_NAME", deviceItemName3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CLASS", deviceItemClass3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MAXVALUE", deviceItemMaxValue3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MINVALUE", deviceItemMinValue3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_REAL", deviceItemReal3);
					 deviceMaintenance.getColMap().put("CDM_ITEM_UNIT", deviceItemUnit3);
					 deviceMaintenance.getColMap().put("CDM_MT_CONTENT", content);
					 deviceMaintenance.getColMap().put("CDM_MT_EMP", nowUser);
					 deviceMaintenance.getColMap().put("CDM_MT_TIME", nowDate);
					 modelService.save(deviceMaintenance);
				}
			}
			if(num4!=0){
				//循环信息条数并插入数据库
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode4 = null;
				String deviceItemName4 = null;
				String deviceItemClass4 = null;
				String deviceItemMaxValue4 = null;
				String deviceItemMinValue4 = null;
				String deviceItemUnit4 = null;
				String deviceItemCycle4 = null;
				String deviceItemReal4 = null;
				for(int i=1;i<num4+1;i++){
					 deviceItemCode4 = request.getParameter("deviceItemCode4_"+i);
					 deviceItemName4 = request.getParameter("deviceItemName4_"+i);
					 deviceItemClass4 = request.getParameter("deviceItemClass4_"+i);
					 deviceItemMaxValue4 = request.getParameter("deviceitemMaxvalue4_"+i);
					 deviceItemMinValue4 = request.getParameter("deviceitemMinvalue4_"+i);
					 deviceItemReal4 = request.getParameter("deviceItemReal4_"+i);
					 deviceItemUnit4 = request.getParameter("deviceItemUnit4_"+i);
					 deviceItemCycle4 = request.getParameter("deviceItemCycle4_"+i);
					 deviceMaintenance.setTableName("T_CO_DEVICE_MAINTENANCE");
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDM_DEVICE_SN", deviceSn);
					 deviceMaintenance.getColMap().put("CDM_DEVICE_TYPE", deviceType);
					 deviceMaintenance.getColMap().put("CDM_ITEM_TYPE", deviceItemType4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CODE", deviceItemCode4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_NAME", deviceItemName4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_CLASS", deviceItemClass4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MAXVALUE", deviceItemMaxValue4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_MINVALUE", deviceItemMinValue4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_REAL", deviceItemReal4);
					 deviceMaintenance.getColMap().put("CDM_ITEM_UNIT", deviceItemUnit4);
					 deviceMaintenance.getColMap().put("CDM_CYCLE", deviceItemCycle4);
					 deviceMaintenance.getColMap().put("CDM_MT_CONTENT", content);
					 deviceMaintenance.getColMap().put("CDM_MT_EMP", nowUser);
					 deviceMaintenance.getColMap().put("CDM_MT_TIME", nowDate);
					 modelService.save(deviceMaintenance);
					
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
		return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_EDIT);
		//return modelAction.reloadParent(modelAction.getText("保存成功"));
	}

}
