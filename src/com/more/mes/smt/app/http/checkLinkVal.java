package com.more.mes.smt.app.http;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

/**
 * @Title 验证修改链接是否正确
 * @Description 验证修改是否正确 
 * @author ht
 * @ClassName checkLinkVal
 * @version 1.0 developer 2018-10-17 created
 * @see checkLinkVal
 * @since 2018-10-17
 * @Copyright Copyright (c) 2018
 * @Company: morelean
 */

public class checkLinkVal extends InterfaceLog implements IhttpServiceJosn {
	
	@Override
	public String exeFunc(HttpCoreService service) {
		//String url = "";
		//url = StringUtils.toString(service.getParamTo().get("URL"));
		HttpServletRequest requet=ServletActionContext.getRequest();
		
		Map<String, String> resmap = new HashMap<String, String>();				
	
				 
		 
		 	resmap.put("json", "OK");
		  service.setResult(resmap);
		return null;
	}

}
