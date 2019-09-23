package com.more.mes.smt.app.http;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibm.sslite.t;
import com.more.buss.eis.bd.factoryModel.listfactoryTree; 
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.BaseService;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.sun.imageio.plugins.common.I18N;

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
public class getAreaCode extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String, Object> resmap = new HashMap<String, Object>();
	    Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
	    String n_area_sn = service.getParamTo().get("ID");
	    List list = new ArrayList();
	    
	    
	    
	    
	    
	    /**
	     * 0——组织机构不匹配，数据异常，无法查询到表数据；1——组织机构匹配进入
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    String  Sql= "SELECT * FROM SY_DEPT A "+ 
	    				
	                    " WHERE A.id = ?";
	    
	    res = modelService.countSql(Sql, new Object[]{n_area_sn}); 
	    
	    //List ListWorkShop = null;
	    //List ListLines = null;
	    //List ListWorkCenter = null;
	    
	    
	    	 if(res!=0){
	    		 
	    		 List<Map> ListWorkShop = new ArrayList<>();
	    		 
	    		String WorkShop =" select distinct t.CA_ID as \"_ID\",t.ca_parentareaid as \"PARENTID\",t.CA_NAME as \"NAME\",t.id from T_CO_AREA t  " + 
	    				" left join sy_dept t2 on t2.id = t.DATA_AUTH "+
	    				" where t.Ca_Type  NOT LIKE ('2') "+
	    				" connect by prior t.ca_id = t.ca_parentareaid  ";
	    		 //order by CA_TYPE
	    		ListWorkShop =modelService.listDataSql(WorkShop);
	    		
	    		    	 
	    		
	    		//jsonMap.put("data",ListWorkShop);
	    		
		    	 jsonMap.put("chkLog", true);
		    	 jsonMap.put( "Content", ListWorkShop);
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

