package com.morelean.aisino.services.webservices.devicewss;

import com.more.fw.core.common.method.*;
import com.more.fw.webservice.service.*;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @ClassName:TestEquipMentService
 * @Description:测试设备接口 
 * 实现类：TestEquipmentInfServicerImp
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年3月28日上午9:46:04
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class DeviceServices {
	private final Log log = LogFactory.getLog(this.getClass());
	private ServerMgrService serverMgrService;

	/** 
	 * @Description: 测试设备测试数据方法
	 * @param msg 待存储的设备测试数据
	 * @return  对设备处理的结果  TRUE  和  FALSE：错误信息
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String sendTestInfoToMes(String msg) {
		if (null == msg || "".equals(msg)) {
			return "FALSE:数据为空";
		}
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.SendTestInfoToMes", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz:" + e.getMessage());
			return "FALSE:"+e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			return data.get("MSG").toString();
		} else {
			return "FALSE:存储失败";
		}

	}

	/** 
	 * @Description: MES提供WEBSERVICE接口给设备程序调用
	 * @param msg 待关联的SN和关联SN类型
	 * @return  关联成功的结果  OK||BASE_SN  和  NG：错误信息
	 * @author: QM
	 * @Company:morelean     
	 */ 
	public String linkSerialNumber(String linkSn,String type) {
		if (StringUtils.isBlank(linkSn)||StringUtils.isBlank(type)) {
			return "{'msg': 'NG:数据为空'}";
		}
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.LinkSerialNumber", linkSn,type);
			//log.info("----------------------------" + data.get("msg") + "---------------------------");
		} catch (Exception e) {
			log.error("linkSerialNumber:" + e.getMessage());
			return "FALSE:"+e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("msg")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return json.toString();
	//		return data.get("MSG").toString();
		} else {
			return "{'msg': 'NG:关联失败'}";
		}
		
	}
	
	/** 
	 * @Description: MES提供WEBSERVICE接口给设备校验程序文件名调用
	 * @param msg 待校验的程序文件数据
	 * @return  对设备处理的结果  TRUE  和  FALSE：错误信息
	 * @author: qm
	 * @Company:morelean     
	 */ 
	public String checkProgramName(String msg) {
		if (StringUtils.isBlank(msg)) {
			return "FALSE:数据为空";
		}
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.CheckProgramName", msg);
			//log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("checkProgramName:" + e);
			return "FALES"+e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			return data.get("MSG").toString();
		} else {
			return "FALSE:校验失败";
		}

	}
	
	/** 
	 * @Description: 程序加载接口
	 * @param msg
	 * @return   TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String sendLoadInfoToMes(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.SendLoadInfoToMes", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncWarehouseInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			return "FALSE:存储失败";
		}
		
	}
	
	
	public String syncPrinterTestIfno(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.SyncPrinterTestIfno", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncWarehouseInfo:" + e);
			return "FALSE:" + e.toString();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}
	
	
	public String syncReflowTestIfno(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.SyncReflowTestIfno", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncWarehouseInfo:" + e);
			return "FALSE:" + e.toString();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}
	
	
	public String syncAoiTestIfno(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.devicewss.devicewssimpl.SyncAoiTestIfno", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncWarehouseInfo:" + e);
			return "FALSE:" + e.toString();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}
	
}
