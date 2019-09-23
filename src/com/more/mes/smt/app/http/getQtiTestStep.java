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
public class getQtiTestStep extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String, Object> resmap = new HashMap<String, Object>();
	    Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
	    String n_test_step = service.getParamTo().get("ID");
	    
	    
	    
	    
	    /**
	     * 返回值：0——用户名不存在；1——用户名存在
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    String  Sql= "SELECT * FROM SY_DEPT A "+ 
	    				
	                    " WHERE A.id = ?";
	    
	    res = modelService.countSql(Sql, new Object[]{n_test_step}); 
	    
	    
	    
	    Sql="select t.CODE as DICT_VAL_ID,t.value"+
	    		"  from sy_dict_val t"+
	    		"  where t.DICT_CODE='QTI_TEST_STEP' ";
	    		
	    
	    		
	    		//" left join sy_dept t2 on t2.id = t.DATA_AUTH"+
	    	//	" where wa_area_type = '1'"+
	    	//	" and  t2.id = ? ";
	   
	   
	    
	    List list = null;
	    
	    	 if(res==1){
		    	 list =modelService.listDataSql(Sql,new Object[]{});
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

