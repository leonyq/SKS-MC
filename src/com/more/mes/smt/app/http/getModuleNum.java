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
public class getModuleNum extends InterfaceLog implements IhttpServiceJosn {
	 private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	@Override
	public String exeFunc(HttpCoreService service) {
		Map<String, Object> resmap = new HashMap<String, Object>();
	    Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
	    String login_name = service.getParamTo().get("LOGIN_NAME");
	    String dept_id = service.getParamTo().get("DEPT_ID");
	    
	    
	    
	    /**
	     * 返回值：0——用户名不存在；1——用户名存在
	     */
	    int res =0;//= CommMethod.getBaseService().getDataAuth(login_name);
	    String  Sql= "SELECT * FROM SY_USER A "+ 
	    				
	                    " WHERE A.LOGIN_NAME=?";
	    res = modelService.countSql(Sql, new Object[]{login_name}); 
	    
	       Sql=" select distinct t2.TAM_MENU_ID,t3.VALUE,t5.TAM_MENU_PHOTO,t5.TAM_MENU_PHOTO2 from T_app_user t  "+     
             "    LEFT JOIN   T_APP_ROLE  t1 on t.TAU_MOUDLE_ID  =  t1.TAR_MOUDLE_ID  "+
             "    LEFT JOIN  T_APP_MOUDLE  t2  on  t2.id  =  t1.TAR_MOUDLE_ID  "+
             "    LEFT JOIN SY_DICT_VAL t3 ON t2.TAM_MENU_ID=t3.CODE  "+
             "    LEFT JOIN SY_USER t4 ON t4.id=t.TAU_USER_ID    "+
             "    LEFT JOIN T_APP_MENU t5 ON t2.TAM_MENU_ID=t5.TAM_MENU_NAME "+ 
             "    where t3.DICT_CODE='MAIN_MENU' and t3.IS_DISP='1' and t3.IS_SELC='1'  "+ 
             "    and t4.LOGIN_NAME=?  "+
             "    ORDER BY t2.TAM_MENU_ID  ";
	   
	    
	    List list = null;
	    
	    	 if(res==1){
		    	 list =modelService.listDataSql(Sql,new Object[]{login_name});
		    	 
		    	 if (null!=list && list.size()>0)
          {
            
          }else {
            Sql=" select distinct t2.TAM_MENU_ID,t3.VALUE,t5.TAM_MENU_PHOTO,t5.TAM_MENU_PHOTO2 from T_APP_ROLE t1  "+     
              " LEFT JOIN  T_APP_MOUDLE  t2  on  t2.id  =  t1.TAR_MOUDLE_ID "+
              " LEFT JOIN SY_DICT_VAL t3 ON t2.TAM_MENU_ID=t3.CODE   "+
              " LEFT JOIN T_APP_MENU t5 ON t2.TAM_MENU_ID=t5.TAM_MENU_NAME   "+
              " where t3.DICT_CODE='MAIN_MENU' and t3.IS_DISP='1' and t3.IS_SELC='1'  "+
              " and t1.TAR_ROLE_ID in (select ROLE_ID  "+ 
              " from sy_user_role "+ 
              " where USER_ID = (select id from sy_user where login_name =?)) "+
              " ORDER BY t2.TAM_MENU_ID  ";
            list =modelService.listDataSql(Sql,new Object[]{login_name});
          }
		    	 
		    	 jsonMap.put("chkLog", true);
		    	 jsonMap.put( "Content", list);
		    	 jsonMap.put("msg", "用户未配置模块");
		     }else {
		    	 jsonMap.put("chkLog", false);
		    	 jsonMap.put( "Content", "用户未配置模块");
		    	 jsonMap.put("msg", "用户未配置模块");
			}
		   	 
		} catch (Exception e) {
			// TODO: handle exception
			jsonMap.put("chkLog", false);
	    	 jsonMap.put( "Content", "用户未配置模块");
	    	 jsonMap.put("msg", "用户未配置模块");
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

