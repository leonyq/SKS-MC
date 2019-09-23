package com.morelean.aisino.services.webservices.erpwss;

import java.util.Map;

import net.sf.json.JSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.webservice.service.ServerMgrService;

/**
 * @ClassName:ErpServices
 * @Description: ERP接口服务
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年3月28日上午10:13:08
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
/**
 * @ClassName:ErpServices
 * @Description:
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月3日上午4:27:38
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class ErpServices {
	private final Log log = LogFactory.getLog(this.getClass());
	private ServerMgrService serverMgrService;

	/**
	 *  
	 * 
	 * @Description: TODO
	 * @param msg
	 *          传入的供应商信息
	 * @return 存储成功时 TRUE 失败时 FALSE:错误友好提示信息
	 * @author: mmz  @Company:morelean    
	 */
	public String syncSupplierInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncSupplierInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncSupplierInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			return data.get("MSG").toString();
		} else {

			return "FALSE:存储失败";
		}

		
	}

	/**
	 *  
	 * 
	 * @Description: TODO
	 * @param msg
	 *          传入采购单信息
	 * @return
	 * @author: mmz  @Company:morelean    
	 */
	public String syncPurchaseOrderInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncPurchaseOrderInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncPurchaseOrderInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			// JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();// json.toString();//
		} else {

			return "FALSE:存储失败";
		}

	}

	/**
	 *  
	 * 
	 * @Description: 客户信息存储
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz  @Company:morelean    
	 */
	public String syncCustomerInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncCustomerInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncCustomerInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			//JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();// 
		} else {

			return "FALSE:存储失败";
		}

	}
	
	/** 
	 * @Description: 物料信息接口
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncMaterialInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncMaterialInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncMaterialInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();// 
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 存储ERP仓库信息接口
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncWarehouseInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncWarehouseInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncWarehouseInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();// json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 账户别名信息接口
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncAccountAliasInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncAccountAliasInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncAccountAliasInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	
	/** 
	 * @Description: 入库单信息接口
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncInStockDocInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncInStockDocInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncInStockDocInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 出庫單信息
	 * @param msg
	 * @return TRUE | FALSE:XXXXXX
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncOutStockDocInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncOutStockDocInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncOutStockDocInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
//			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 挑库单接口
	 * @param msg
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncAllotDocInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncAllotDocInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncAllotDocInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
//			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 工单信息接口
	 * @param msg
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncProductOrderInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncProductOrderInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncProductOrderInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
//			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
		
	}

	/** 
	 * @Description: 工单物料信息
	 * @param msg
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncProductMaterialInfo(String msg) {
		Map<String, Object> data = null;
		try {
			serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
			data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncProductMaterialInfo", msg);
			log.info("----------------------------" + data.get("MSG") + "---------------------------");
		} catch (Exception e) {
			log.error("mmz-syncProductMaterialInfo:" + e);
			return "FALSE:" + e.getMessage();
		}
		if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
//			JSON json = net.sf.json.JSONObject.fromObject(data);
			return data.get("MSG").toString();//json.toString();//
		} else {
			
			return "FALSE:存储失败";
		}
	}
	
	/** 
	 * @Description: 机种BOM信息
	 * @param msg
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public String syncBomInfo(String msg) {
			Map<String, Object> data = null;
			try {
				serverMgrService = (ServerMgrService) SpringContextUtil.getBean("serverMgrService");
				data = serverMgrService.execWebService("com.morelean.aisino.services.webservices.erpwss.erpwssimpl.SyncBomInfo", msg);
				log.info("----------------------------" + data.get("MSG") + "---------------------------");
			} catch (Exception e) {
				log.error("mmz-syncBomInfo:" + e);
				return "FALSE:" + e.getMessage();
			}
			if (data != null && !"".equals(data) && data.size() > 0 && data.containsKey("MSG")) {
//			JSON json = net.sf.json.JSONObject.fromObject(data);
				return data.get("MSG").toString();//json.toString();//
			} else {
				
				return "FALSE:存储失败";
			}
		
	}


}
