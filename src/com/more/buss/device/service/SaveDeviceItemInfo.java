package com.more.buss.device.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import bsh.StringUtil;

import com.more.fw.core.common.method.CommMethod;

/**
 * @Description 保存设备项目
 * @ClassName SaveDeviceItemInfo
 * @author development
 * @Company: morelean
 */
public class SaveDeviceItemInfo implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());
	

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    //String dataAuth = request.getParameter("_DATA_AUTH");
	    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String formId = request.getParameter("formId");
        if(StringUtils.isBlank(formId)){
          	formId = request.getParameter("formIds");
       	}
        String iframeId = request.getParameter("iframeId");
        String ef = null;
		try{
		
		//获取设备sn
		String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN");
		//获取设备项目ids
		String deviceItemIds = request.getParameter("deviceItemIds");
	/*	if(deviceItemIds.equals("''")){
			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
		}		*/
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
		List<String> tList = new ArrayList<String>();
		List<String> tnList = new ArrayList<String>();
		TableDataMapExt deviceItem1 = new TableDataMapExt();
		TableDataMapExt deviceItem2 = new TableDataMapExt();
		TableDataMapExt deviceItem3 = new TableDataMapExt();
		TableDataMapExt deviceItem4 = new TableDataMapExt();
		
		if(num1!=0){
			//循环信息条数
		    String deviceItemCode1 = null;
			String deviceItemName1 = null;
			String deviceItemClass1 = null;
			String deviceItemMaxValue1 = null;
			String deviceItemMinValue1 = null;
			String deviceItemUnit1 = null;
			for(int i=1;i<num1+1;i++){
				 deviceItemCode1 = request.getParameter("deviceItemCode1_"+i);
				 deviceItemName1 = request.getParameter("deviceItemName1_"+i);
				 deviceItemClass1 = request.getParameter("paraMap"+i+"@1#CDII_ITEM_CLASS");
				 deviceItemMaxValue1 = request.getParameter("deviceitemMaxvalue1_"+i);
				 deviceItemMinValue1 = request.getParameter("deviceitemMinvalue1_"+i);
				 deviceItemUnit1 = request.getParameter("deviceItemUnit1_"+i);
				 if(deviceItemCode1=="" && deviceItemName1=="" && deviceItemClass1=="" && deviceItemMaxValue1=="" 
						 && deviceItemMinValue1 =="" && deviceItemUnit1==""){
					 
					 continue;
				 }
				 if(deviceItemCode1==null && deviceItemName1==null && deviceItemClass1==null && deviceItemMaxValue1==null 
						 && deviceItemMinValue1 ==null && deviceItemUnit1==null){
					 
					 continue;
					 
				 }
				 tList.add(deviceItemCode1);
				 tnList.add(deviceItemName1);
			}
		}
		if(num2!=0){
			//循环信息条数
		    String deviceItemCode2 = null;
			String deviceItemName2 = null;
			String deviceItemClass2 = null;
			String deviceItemMaxValue2 = null;
			String deviceItemMinValue2 = null;
			String deviceItemUnit2 = null;
			String deviceItemCycle2 = null;
			for(int i=1;i<num2+1;i++){
				 deviceItemCode2 = request.getParameter("deviceItemCode2_"+i);
				 deviceItemName2 = request.getParameter("deviceItemName2_"+i);
				 deviceItemClass2 = request.getParameter("paraMap"+i+"@2#CDII_ITEM_CLASS");
				 deviceItemMaxValue2 = request.getParameter("deviceitemMaxvalue2_"+i);
				 deviceItemMinValue2 = request.getParameter("deviceitemMinvalue2_"+i);
				 deviceItemUnit2 = request.getParameter("deviceItemUnit2_"+i);
				 deviceItemCycle2 = request.getParameter("deviceItemCycle2_"+i);
				 if(deviceItemCode2=="" && deviceItemName2=="" && deviceItemClass2=="" && deviceItemMaxValue2=="" 
						 && deviceItemMinValue2 =="" && deviceItemUnit2=="" && deviceItemCycle2==""){
					 continue;
				 }
				 if(deviceItemCode2==null && deviceItemName2==null && deviceItemClass2==null && deviceItemMaxValue2==null 
						 && deviceItemMinValue2 ==null && deviceItemUnit2==null){
					 
					 continue;
				 }
				 tList.add(deviceItemCode2);
				 tnList.add(deviceItemName2);
			}
		}
		if(num3!=0){
		    String deviceItemCode3 = null;
			String deviceItemName3 = null;
			String deviceItemClass3 = null;
			String deviceItemMaxValue3 = null;
			String deviceItemMinValue3 = null;
			String deviceItemUnit3 = null;
			for(int i=1;i<num3+1;i++){
				 deviceItemCode3 = request.getParameter("deviceItemCode3_"+i);
				 deviceItemName3 = request.getParameter("deviceItemName3_"+i);
				 deviceItemClass3 = request.getParameter("paraMap"+i+"@3#CDII_ITEM_CLASS");
				 deviceItemMaxValue3 = request.getParameter("deviceitemMaxvalue3_"+i);
				 deviceItemMinValue3 = request.getParameter("deviceitemMinvalue3_"+i);
				 deviceItemUnit3 = request.getParameter("deviceItemUnit3_"+i);
				 if(deviceItemCode3=="" && deviceItemName3=="" && deviceItemClass3=="" && deviceItemMaxValue3=="" 
						 && deviceItemMinValue3 =="" && deviceItemUnit3==""){
					 continue;
				 }
				 if(deviceItemCode3==null && deviceItemName3==null && deviceItemClass3==null && deviceItemMaxValue3==null 
						 && deviceItemMinValue3 ==null && deviceItemUnit3==null){
					 
					 continue;
				 }
				 tList.add(deviceItemCode3);
				 tnList.add(deviceItemName3);
			}
		}
		if(num4!=0){
		    String deviceItemCode4 = null;
			String deviceItemName4 = null;
			String deviceItemClass4 = null;
			String deviceItemMaxValue4 = null;
			String deviceItemMinValue4 = null;
			String deviceItemUnit4 = null;
			String deviceItemCycle4 = null;
			for(int i=1;i<num4+1;i++){
				 deviceItemCode4 = request.getParameter("deviceItemCode4_"+i);
				 deviceItemName4 = request.getParameter("deviceItemName4_"+i);
				 deviceItemClass4 = request.getParameter("paraMap"+i+"@4#CDII_ITEM_CLASS");
				 deviceItemMaxValue4 = request.getParameter("deviceitemMaxvalue4_"+i);
				 deviceItemMinValue4 = request.getParameter("deviceitemMinvalue4_"+i);
				 deviceItemUnit4 = request.getParameter("deviceItemUnit4_"+i);
				 deviceItemCycle4 = request.getParameter("deviceItemCycle4_"+i);
				 if(deviceItemCode4=="" && deviceItemName4=="" && deviceItemClass4=="" && deviceItemMaxValue4=="" 
						 && deviceItemMinValue4 =="" && deviceItemUnit4=="" && deviceItemCycle4==""){
					 continue;
				 }
				 if(deviceItemCode4==null && deviceItemName4==null && deviceItemClass4==null && deviceItemMaxValue4==null 
						 && deviceItemMinValue4 ==null && deviceItemUnit4==null){

					 continue;
				 }
				 tList.add(deviceItemCode4);
				 tnList.add(deviceItemName4);
			}
		}
		//项目代码唯一性验证
		HashSet hSet = new HashSet();
		Map<String, String> map = new HashMap<String, String>();
		String deviceId[] = {};
		  if (StringUtils.isNotBlank(deviceItemIds)) {
			  deviceId  = deviceItemIds.split(",");
		}
		String notIn = null;
		for (int i = 0; i < deviceId.length; i++ )
    {
      if(null==notIn){
        notIn="select id from T_CO_DEVICE_ITEM_INFO t where t.cdii_item_code =:tList1 AND t.cdii_device_sn=:deviceSn AND t.data_auth=:data_auth AND t.id not in(:id0"; 
        map.put("tList1", tList.get(i));
        map.put("deviceSn", deviceSn);
        map.put("data_auth", dataAuth);
        map.put("id0", deviceId[i]);
      }else {
        notIn+=",:id"+i+""; 
        
        map.put("id"+i+"", deviceId[i]);
      }
    }
		notIn+=")";
		//String sql = "select id from T_CO_DEVICE_ITEM_INFO t where t.cdii_item_code = ? AND t.cdii_device_sn=? AND t.id not in(?)";
		for(int i=0;i<tList.size();i++){
			hSet.add(tList.get(i));
			//List count = modelService.listDataSql(notIn, new Object[] { tList.get(i),deviceSn ,deviceItemIds});
			List count = modelService.listSql(notIn, null, map,null,null);
			//验证输入的项目代码在数据库中是否存在
			if (count.size() != 0) {
		        return modelAction.alertParentInfo(modelAction.getText("项目代码已存在"));
		    }
		}
		//验证输入的项目代码是否重复
		if(hSet.size()!=tList.size()){
			return modelAction.alertParentInfo(modelAction.getText("项目代码已存在"));
		}
		//项目名称唯一性验证
		HashSet hSet1 = new HashSet();
		map.clear();
		notIn=null;
		for (int i = 0; i < deviceId.length; i++ )
    {
      if(null==notIn){
        notIn="select id from T_CO_DEVICE_ITEM_INFO t where t.cdii_item_name =:tList1 AND t.cdii_device_sn=:deviceSn AND T.DATA_AUTH=:DATA_AUTH AND t.id not in(:id0"; 
        map.put("tList1", tnList.get(i));
        map.put("deviceSn", deviceSn);
        map.put("DATA_AUTH", dataAuth);
        map.put("id0", deviceId[i]);
      }else {
        notIn+=",:id"+i+""; 
        
        map.put("id"+i+"", deviceId[i]);
      }
    }
		notIn+=")";
		//String sql1 = "select id from T_CO_DEVICE_ITEM_INFO t where t.cdii_item_name = ? AND t.cdii_device_sn=? AND t.id not in (?)";
		for(int i=0;i<tnList.size();i++){
			hSet1.add(tnList.get(i));
			//List count = modelService.listDataSql(sql1, new Object[] { tnList.get(i),deviceSn ,deviceItemIds});
			List count = modelService.listSql(notIn, null, map,null,null);
			//验证输入的项目名称在数据库中是否存在
			if (count.size() != 0) {
		        return modelAction.alertParentInfo(modelAction.getText("项目名称已存在"));
		    }
		}
		//验证输入的项目名称是否重复
		if(hSet1.size()!=tnList.size()){
			return modelAction.alertParentInfo(modelAction.getText("项目名称已存在"));
		}
		//验证通过则先删除已有记录然后保存
		if(!deviceItemIds.equals("")){
			TableDataMapExt deviceItemTable = new TableDataMapExt();
			deviceItemTable.setTableName("T_CO_DEVICE_ITEM_INFO");
			notIn=null;
			List list = new ArrayList();
	    for (int i = 0; i < deviceId.length; i++ )
	    {
	      if(null==notIn){
	        notIn="and id in(?"; 
	        list.add(deviceId[i]);
	      }else {
	        notIn+=",?"; 
	        list.add(deviceId[i]);
	      }
	    }
	    notIn+=")";
			deviceItemTable.setSqlWhere(notIn);
			deviceItemTable.setSqlWhereArgs(list);
	    	modelService.del(deviceItemTable);
		}
		//记录数不为空时
		if(num1!=0){
			//循环信息条数并插入数据库
		    String deviceItemCode1 = null;
			String deviceItemName1 = null;
			String deviceItemClass1 = null;
			String deviceItemMaxValue1 = null;
			String deviceItemMinValue1 = null;
			String deviceItemUnit1 = null;
			for(int i=1;i<num1+1;i++){
				 deviceItemCode1 = request.getParameter("deviceItemCode1_"+i);
				 deviceItemName1 = request.getParameter("deviceItemName1_"+i);
				 deviceItemClass1 = request.getParameter("paraMap"+i+"@1#CDII_ITEM_CLASS");
				 deviceItemMaxValue1 = request.getParameter("deviceitemMaxvalue1_"+i);
				 deviceItemMinValue1 = request.getParameter("deviceitemMinvalue1_"+i);
				 deviceItemUnit1 = request.getParameter("deviceItemUnit1_"+i);
				 if(deviceItemCode1=="" && deviceItemName1=="" && deviceItemClass1=="" && deviceItemMaxValue1=="" 
						 && deviceItemMinValue1 =="" && deviceItemUnit1==""){
					 
					 continue;
				 }
				 if(deviceItemCode1==null && deviceItemName1==null && deviceItemClass1==null && deviceItemMaxValue1==null 
						 && deviceItemMinValue1 ==null && deviceItemUnit1==null){
					 
					 continue;
				 }
				 deviceItem1.setTableName("T_CO_DEVICE_ITEM_INFO");
				 CommMethod.addSysDefCol(deviceItem1.getColMap(), modelAction.getUser());
				 deviceItem1.getColMap().put("ID", StringUtils.getUUID());
				 deviceItem1.getColMap().put("CDII_DEVICE_SN", deviceSn);
				 deviceItem1.getColMap().put("CDII_ITEM_TYPE", deviceItemType1);
				 deviceItem1.getColMap().put("CDII_ITEM_CODE", deviceItemCode1);
				 deviceItem1.getColMap().put("CDII_ITEM_NAME", deviceItemName1);
				 deviceItem1.getColMap().put("CDII_ITEM_CLASS", deviceItemClass1);
				 if (StringUtils.isNotBlank(deviceItemMaxValue1))
        {
				   deviceItem1.getColMap().put("CDII_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue1));
        }
				 if (StringUtils.isNotBlank(deviceItemMinValue1))
	        {
				   deviceItem1.getColMap().put("CDII_ITEM_MINVALUE",  Double.valueOf(deviceItemMinValue1));
	        }
				
				 deviceItem1.getColMap().put("CDII_ITEM_UNIT", deviceItemUnit1);
				 if(dataAuth!=null){
      					deviceItem1.getColMap().put("DATA_AUTH", dataAuth);
      				 }
				 
				 modelService.save(deviceItem1);
			}
		}
		if(num2!=0){
			//循环信息条数并插入数据库
		    String deviceItemCode2 = null;
			String deviceItemName2 = null;
			String deviceItemClass2 = null;
			String deviceItemMaxValue2 = null;
			String deviceItemMinValue2 = null;
			String deviceItemUnit2 = null;
			String deviceItemCycle2 = null;
			for(int i=1;i<num2+1;i++){
				 deviceItemCode2 = request.getParameter("deviceItemCode2_"+i);
				 deviceItemName2 = request.getParameter("deviceItemName2_"+i);
				 deviceItemClass2 = request.getParameter("paraMap"+i+"@2#CDII_ITEM_CLASS");
				 deviceItemMaxValue2 = request.getParameter("deviceitemMaxvalue2_"+i);
				 deviceItemMinValue2 = request.getParameter("deviceitemMinvalue2_"+i);
				 deviceItemUnit2 = request.getParameter("deviceItemUnit2_"+i);
				 deviceItemCycle2 = request.getParameter("deviceItemCycle2_"+i);
				 if(deviceItemCode2=="" && deviceItemName2=="" && deviceItemClass2=="" && deviceItemMaxValue2=="" 
						 && deviceItemMinValue2 =="" && deviceItemUnit2=="" && deviceItemCycle2==""){
					 continue;
				 }
				 if(deviceItemCode2==null && deviceItemName2==null && deviceItemClass2==null && deviceItemMaxValue2==null 
						 && deviceItemMinValue2 ==null && deviceItemUnit2==null){
					 
					 continue;
				 }
				 deviceItem2.setTableName("T_CO_DEVICE_ITEM_INFO");
				 CommMethod.addSysDefCol(deviceItem2.getColMap(), modelAction.getUser());
				 deviceItem2.getColMap().put("ID", StringUtils.getUUID());
				 deviceItem2.getColMap().put("CDII_DEVICE_SN", deviceSn);
				 deviceItem2.getColMap().put("CDII_ITEM_TYPE", deviceItemType2);
				 deviceItem2.getColMap().put("CDII_ITEM_CODE", deviceItemCode2);
				 deviceItem2.getColMap().put("CDII_ITEM_NAME", deviceItemName2);
				 deviceItem2.getColMap().put("CDII_ITEM_CLASS", deviceItemClass2);
				 if (StringUtils.isNotBlank(deviceItemMaxValue2))
	        {
				   deviceItem2.getColMap().put("CDII_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue2));
	        }
	         if (StringUtils.isNotBlank(deviceItemMinValue2))
	          {
	           deviceItem2.getColMap().put("CDII_ITEM_MINVALUE",  Double.valueOf(deviceItemMinValue2));
	          }
				
				 deviceItem2.getColMap().put("CDII_ITEM_UNIT", deviceItemUnit2);
				 if (StringUtils.isNotBlank(deviceItemCycle2))
         {
				   deviceItem2.getColMap().put("CDII_CYCLE",  Double.valueOf(deviceItemCycle2));
         }
				 
				 if(dataAuth!=null){
      					deviceItem2.getColMap().put("DATA_AUTH", dataAuth);
      				 }
				 
				 modelService.save(deviceItem2);
			}
		}
		if(num3!=0){
			//循环信息条数并插入数据库
		    String deviceItemCode3 = null;
			String deviceItemName3 = null;
			String deviceItemClass3 = null;
			String deviceItemMaxValue3 = null;
			String deviceItemMinValue3 = null;
			String deviceItemUnit3 = null;
			for(int i=1;i<num3+1;i++){
				 deviceItemCode3 = request.getParameter("deviceItemCode3_"+i);
				 deviceItemName3 = request.getParameter("deviceItemName3_"+i);
				 deviceItemClass3 = request.getParameter("paraMap"+i+"@3#CDII_ITEM_CLASS");
				 deviceItemMaxValue3 = request.getParameter("deviceitemMaxvalue3_"+i);
				 deviceItemMinValue3 = request.getParameter("deviceitemMinvalue3_"+i);
				 deviceItemUnit3 = request.getParameter("deviceItemUnit3_"+i);
				 if(deviceItemCode3=="" && deviceItemName3=="" && deviceItemClass3=="" && deviceItemMaxValue3=="" 
						 && deviceItemMinValue3 =="" && deviceItemUnit3==""){
					 continue;
				 }
				 if(deviceItemCode3==null && deviceItemName3==null && deviceItemClass3==null && deviceItemMaxValue3==null 
						 && deviceItemMinValue3 ==null && deviceItemUnit3==null){
					 
					 continue;
				 }
				 deviceItem3.setTableName("T_CO_DEVICE_ITEM_INFO");
				 CommMethod.addSysDefCol(deviceItem3.getColMap(), modelAction.getUser());
				 deviceItem3.getColMap().put("ID", StringUtils.getUUID());
				 deviceItem3.getColMap().put("CDII_DEVICE_SN", deviceSn);
				 deviceItem3.getColMap().put("CDII_ITEM_TYPE", deviceItemType3);
				 deviceItem3.getColMap().put("CDII_ITEM_CODE", deviceItemCode3);
				 deviceItem3.getColMap().put("CDII_ITEM_NAME", deviceItemName3);
				 deviceItem3.getColMap().put("CDII_ITEM_CLASS", deviceItemClass3);
				 if (StringUtils.isNotBlank(deviceItemMaxValue3))
	        {
				   deviceItem3.getColMap().put("CDII_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue3));
	        }
	         if (StringUtils.isNotBlank(deviceItemMinValue3))
	          {
	           deviceItem3.getColMap().put("CDII_ITEM_MINVALUE",  Double.valueOf(deviceItemMinValue3));
	          }
				 
				 deviceItem3.getColMap().put("CDII_ITEM_UNIT", deviceItemUnit3);
				 if(dataAuth!=null){
      					deviceItem3.getColMap().put("DATA_AUTH", dataAuth);
      				 }
				 
				 modelService.save(deviceItem3);
			}
		}
		if(num4!=0){
			//循环信息条数并插入数据库
		    String deviceItemCode4 = null;
			String deviceItemName4 = null;
			String deviceItemClass4 = null;
			String deviceItemMaxValue4 = null;
			String deviceItemMinValue4 = null;
			String deviceItemUnit4 = null;
			String deviceItemCycle4 = null;
			for(int i=1;i<num4+1;i++){
				 deviceItemCode4 = request.getParameter("deviceItemCode4_"+i);
				 deviceItemName4 = request.getParameter("deviceItemName4_"+i);
				 deviceItemClass4 = request.getParameter("paraMap"+i+"@4#CDII_ITEM_CLASS");
				 deviceItemMaxValue4 = request.getParameter("deviceitemMaxvalue4_"+i);
				 deviceItemMinValue4 = request.getParameter("deviceitemMinvalue4_"+i);
				 deviceItemUnit4 = request.getParameter("deviceItemUnit4_"+i);
				 deviceItemCycle4 = request.getParameter("deviceItemCycle4_"+i);
				 if(deviceItemCode4=="" && deviceItemName4=="" && deviceItemClass4=="" && deviceItemMaxValue4=="" 
						 && deviceItemMinValue4 =="" && deviceItemUnit4=="" && deviceItemCycle4==""){
					 continue;
				 }
				 if(deviceItemCode4==null && deviceItemName4==null && deviceItemClass4==null && deviceItemMaxValue4==null 
						 && deviceItemMinValue4 ==null && deviceItemUnit4==null){

					 continue;
				 }
				 deviceItem4.setTableName("T_CO_DEVICE_ITEM_INFO");
				 CommMethod.addSysDefCol(deviceItem4.getColMap(), modelAction.getUser());
				 deviceItem4.getColMap().put("ID", StringUtils.getUUID());
				 deviceItem4.getColMap().put("CDII_DEVICE_SN", deviceSn);
				 deviceItem4.getColMap().put("CDII_ITEM_TYPE", deviceItemType4);
				 deviceItem4.getColMap().put("CDII_ITEM_CODE", deviceItemCode4);
				 deviceItem4.getColMap().put("CDII_ITEM_NAME", deviceItemName4);
				 deviceItem4.getColMap().put("CDII_ITEM_CLASS", deviceItemClass4);
				 if (StringUtils.isNotBlank(deviceItemMaxValue4))
	        {
				   deviceItem4.getColMap().put("CDII_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue4));
	        }
	         if (StringUtils.isNotBlank(deviceItemMinValue4))
	          {
	           deviceItem4.getColMap().put("CDII_ITEM_MINVALUE",  Double.valueOf(deviceItemMinValue4));
	          }
				
				 deviceItem4.getColMap().put("CDII_ITEM_UNIT", deviceItemUnit4);
				 if (StringUtils.isNotBlank(deviceItemCycle4))
         {
				   deviceItem4.getColMap().put("CDII_CYCLE", Double.valueOf(deviceItemCycle4));
         }
				
				 if(dataAuth!=null){
      					deviceItem4.getColMap().put("DATA_AUTH", dataAuth);
      				 }
				 
				 modelService.save(deviceItem4);
			}
			
		}
	   
		}catch (NumberFormatException e) {
			// TODO: handle exception
			throw new BussException(modelAction.getText("格式转换失败"), e);
		}
		catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
		
	}

}
