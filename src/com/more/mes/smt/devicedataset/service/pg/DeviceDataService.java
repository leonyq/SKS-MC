package com.more.mes.smt.devicedataset.service.pg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class DeviceDataService {
    /**
     * ModelService
     */
    static private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
    
    /**
     * Logger
     */
    static private final Log log = LogFactory.getLog("TerminalService");
	/**
	    * 获取设备配置信息
	    * @param deviceSn 设备SN
	    * @return
	    */
	   static public Map<String, Object> GetDeviceSetData(String deviceSn)
	   {
		   	Map<String,Object> map=new HashMap<String,Object>();//返回结果
		   	map.put("result", "success");
	       try
	       {
	    	   String strSql="SELECT t.cds_data FROM T_CO_DEVICE_SETING t WHERE t.cds_device_sn=?";
	    	   List<Map> wmsList1 = modelService.listDataSql(strSql, new Object[]{deviceSn});
	    	   if(wmsList1 == null || wmsList1.isEmpty()){
	    		   String sql1="SELECT t.CD_DEVICE_TYPE FROM T_CO_DEVICE t WHERE t.CD_DEVICE_SN=?";
	    		   List<Map> wmsList2 = modelService.listDataSql(sql1, new Object[]{deviceSn});
	    		   if(wmsList2 == null || wmsList2.isEmpty()){
	    			   map.put("result", "snNull");
	    		   }else{
	    			   String cdDeviceType=(String) wmsList2.get(0).get("CD_DEVICE_TYPE");
	    			   String sql3="SELECT t.cds_data FROM T_CO_DEVICE_SETING t WHERE t.cds_device_type=?";
	    	    	   List<Map> wmsList3 = modelService.listDataSql(sql3, new Object[]{cdDeviceType});
	    	    	   if(wmsList3 == null || wmsList3.isEmpty()){
	    	    		   map.put("result", "snNotFindData");
	    	    	   }else{
	        	    	   String sql=(String) wmsList3.get(0).get("CDS_DATA");
	       	    	   	List resouceList=modelService.listDataSql(sql);//数据源查询结果
	       	    	   	if(resouceList.size()==0){
	       	    	   		map.put("result", "resouceNull");
	       	    	   	}
	       	    	   	map.put("resultList",resouceList);
	    	    	   	}
	    	    	   }

	    	   }else{
	    		   String sql=(String) wmsList1.get(0).get("CDS_DATA");
	    		   List resouceList=modelService.listDataSql(sql);//数据源查询结果
	    			if(resouceList.size()==0){
		    	   		map.put("result", "resouceNull");
		    	   	}
	    			map.put("resultList",resouceList);
	    		 
	    	   }
	       }
	       catch(Exception ex)
	       {
	    	   log.info("GetDeviceSetData:"+ex.toString());
	    	   return null;
	       }
	       return map;
	   }
	
}

