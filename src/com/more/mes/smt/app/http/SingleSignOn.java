package com.more.mes.smt.app.http;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

/**
 * @Title 获取组织机构
 * @Description 获取组织机构
 * @author ht
 * @ClassName checkLinkVal
 * @version 1.0 developer 2018-10-17 created
 * @see checkLinkVal
 * @since 2018-10-17
 * @Copyright Copyright (c) 2018
 * @Company: morelean
 */
public class SingleSignOn extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {		
	    //String login_name = service.getParamTo().get("LOGIN_NAME");
	    //String pwd = service.getParamTo().get("PWD");
	    Map<String, Object> resmap = new HashMap<String, Object>();
	  
	    /**
	     * 返回值：0——用户名不存在；1——用户名存在
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    

	    String Sql= "  select CS_USERKEY,AUTH_TYPE,PASS_KEY from SY_SSOUSER where CS_USERKEY='fygroup'  "; 
	    
	    String link="http://"+service.getRequest().getHeader("host")+service.getRequest().getContextPath()+"/mc/sso/ssoLoginAction_ssologin.ms";
	    
	    // link="http://"+service.getRequest().getHeader("host")+service.getRequest().getContextPath()+"/sys/LoginAction_forPdaLogin.ms";;
	    
	    res = modelService.countSql(Sql, null); 
	    
	    List<Map<String,Object>> list = null;
	    List<Map<String,Object>> list2 = null;
	    //Map<String, Object> map = new HashMap<>();
	    if(res==1){
	    	
	    	list =modelService.listDataSql(Sql);
	    	Map<String, Object> map = list.get(0);
	    	map.put("CS_USERKEY",list.get(0).get("CS_USERKEY"));
	    	map.put("AUTH_TYPE",list.get(0).get("AUTH_TYPE"));
	    	map.put("PASS_KEY",list.get(0).get("PASS_KEY"));
	    	map.put("link", link);
	    	
	       
	    	JSONObject jsonObject = JSONObject.fromObject(map);
	    	//list.add(map);
	    	list2.add(map);
	    	
	    	//JSONObject jsonObject1 = JSONObject.fromObject(jsonObject);
	       resmap.put("json",list2);
	    	
	    }
	    else{
	    	resmap.put("json","");
	    }
	    
	    
	     
	   
	    //resmap.put("json", CommMethod.toJson(jsonMap));
	    service.setResult(resmap);
	    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
	    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
	    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
	    return null;
	}

}
