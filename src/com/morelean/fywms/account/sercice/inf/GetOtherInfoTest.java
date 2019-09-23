package com.morelean.fywms.account.sercice.inf;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;

import java.util.Map;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil; 
import com.more.fw.webservice.service.ServerMgrService; 
/**
 * 
 * 账户别名-账户别名清单获取
 * 接口
 */
public class GetOtherInfoTest{
	private final Log log = LogFactory.getLog(this.getClass());
	private String json=null;
	public String getOtherInfoTest(String name) {
	    Map<String,Object> dataMap;
	try {
		ServerMgrService serverMgrService=(ServerMgrService)SpringContextUtil.getBean("serverMgrService");
		dataMap=serverMgrService.execWebService ("com.morelean.fywms.account.sercice.GetOtherInfo");
	} catch (Exception e) {
		log.error(e);
	    dataMap = new HashMap<String,Object>();
        dataMap.put("isSuccess", "N");
        dataMap.put("errorMsg", CommMethod.getText("接口异常"));
        dataMap.put("data", "");
	}
	json=CommMethod.toJson(dataMap);
	return json;
	}

}