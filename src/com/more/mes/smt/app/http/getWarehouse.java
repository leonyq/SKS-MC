package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class getWarehouse extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String, Object> resmap = new HashMap<String, Object>();
	    Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
	    String n_data_auth = service.getParamTo().get("ID");
	    
	    
	    
	    
	    /**
	     * 0——组织机构不匹配，数据异常，无法查询到表数据；1——组织机构匹配进入
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    String  Sql= "SELECT * FROM SY_DEPT A "+ 
	    				
	                    " WHERE A.id = ?";
	    
	    res = modelService.countSql(Sql, new Object[]{n_data_auth}); 
	    
	    
	    
	    Sql="select  t.WA_AREA_SN AS id,t.WA_AREA_NAME"+
	    		"  from T_wms_area t"+
	    		 " left join sy_dept t2 on t2.id = t.DATA_AUTH"+
	    		" where wa_area_type = '1'"+
	    		 "and t2.is_auth='1' "+
	    		 "and  t2.id = ? ";
	   
	   
	    
	    List list = null;
	    
	    	 if(res!=0){
		    	 list =modelService.listDataSql(Sql,new Object[]{n_data_auth});
		    	 jsonMap.put("chkLog", true);
		    	 jsonMap.put( "Content", list);
		    	 jsonMap.put("msg", "");
		     }else {
		    	 jsonMap.put("chkLog", false);
		    	 jsonMap.put( "Content", "");
		    	 jsonMap.put("msg", "数据异常");
			}
		   	 
		} catch (Exception e) {
			// TODO: handle exception
			 jsonMap.put("chkLog", false);
	    	 jsonMap.put( "Content", "");
	    	 jsonMap.put("msg", e.toString());	 
			resmap.put("json", CommMethod.toJson(jsonMap));
		    service.setResult(resmap);
		    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
		    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
		    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
		    return null;
		}
	      
	    resmap.put("json", CommMethod.toJson(jsonMap));
	    service.setResult(resmap);
	    service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
	    service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
	    service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
	    return null;
	}

}

