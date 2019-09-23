package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.BaseService;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import examples.newsgroups;

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
public class getAuth extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@SuppressWarnings({ "unused", "unchecked" })
	@Override
	public String exeFunc(HttpCoreService service) {		
	    String login_name = service.getParamTo().get("LOGIN_NAME");
	    //String pwd = service.getParamTo().get("PWD");
	    Map<String, Object> resmap = new HashMap<String, Object>();
	    Map<String, Object> jsonMap = new HashMap<String, Object>();
	    /**
	     * 返回值：0——用户名错误；1——用户名正确
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    String Sql= "SELECT * FROM SY_USER A "+           
	               " WHERE A.LOGIN_NAME=? ";
	    
	    res = modelService.countSql(Sql, new Object[]{login_name}); 
	    
	    Sql= "SELECT C.ID AS O_CODE,C.NAME AS O_NAME FROM SY_USER A "+
               " LEFT JOIN SY_DATA_AUTH B ON A.ID=B.USER_ID "+
               " LEFT JOIN SY_DEPT C ON B.DEPT_ID=C.ID "+
               " WHERE A.LOGIN_NAME=?"; 
	    List<Map> list = null;
	    ArrayList<Map> list2 =new ArrayList<>() ;
	     if(res==1){
	    	
	    	 list =modelService.listDataSql(Sql, new Object[]{login_name});
	    	 
	    	 int as = list.size();
	    	 
	    	 if(StringUtils.isBlank(list.get(0).get("O_CODE"))){
	    		 list.get(0).put("O_CODE", "");
	    		 list.get(0).put("O_NAME", "");
	    		 jsonMap.put("msg", "该账号未配置组织机构");
	    		 }
	    	 else {
	    	 jsonMap.put("chkLog", true);
	    	 jsonMap.put( "Content", list);
	    	 jsonMap.put("msg", "");
	    	 }
	     }else {
	    	 jsonMap.put("chkLog", false);
	    	 jsonMap.put( "Content", list2);
	    	 jsonMap.put("msg", "用户不存在");
		}
	   

	    //map.put("json", "{\"error\":\""+ex.toString()+"\"}");
	    
	    
	    
	    
	   
	    resmap.put("json", CommMethod.toJson(jsonMap));
	    service.setResult(resmap);
	    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
	    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
	    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
	    return null;
	}

}
