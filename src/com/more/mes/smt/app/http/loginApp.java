package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.more.buss.eis.bd.factoryModel.listfactoryTree;
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
public class loginApp extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {		
	    String pwd = service.getParamTo().get("PWD");
    String login_name = service.getParamTo().get("LOGIN_NAME");
    Map resmap = new HashMap();
    //HashMap<String, String> resmap = new HashMap<String, String>();
   
    
   
    int res = CommMethod.getBaseService().checkPwdVal(pwd, login_name);
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpSession session = request.getSession();
    String sessionId=request.getSession().getId();
    //resmap1.put("sessionId",sessionId);
    /**
     * 返回值：0——密码错误；1——密码正确；2——用户不存在
     */
      if(res==1){
          
	    	 //list =modelService.listDataSql(Sql, new Object[]{login_name,pwd});
	    	 resmap.put("json","OK"+";"+sessionId);
	    	// resmap.put("sessionId",sessionId);
	    	 
	    	 //resmap.put("sessionId", sessionId);
	     } else if(res==2){
	    	 resmap.put("json", "用户不存在");
	    	
	    	 
		}else if (res==0){
			resmap.put("json", "密码错误");
			
		}
    //resmap.put("json", "{\"checkoutRes\":\""+res+"\"}");
      
       
    service.setResult(resmap);
    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
    
    return null;
	}

}
