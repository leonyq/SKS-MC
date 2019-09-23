package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetEcDESCServiceTwo implements FuncService
{

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
	  // TODO Auto-generated method stub
	    HttpServletRequest request = modelAction.getRequest();
	    String cfmId = request.getParameter("cfmId");
	      String cfm_type = request.getParameter("cfm_type");
	      List<Map<String,Object>> cecDesc=new  ArrayList<Map<String, Object>>();
	      String auth = request.getSession().getAttribute("mcDataAuth").toString();
	     
	      if(cfmId==null||cfmId==""){
	    	  String sql="SELECT DATA_AUTH FROM T_CO_ERROR_CODE WHERE ID=?" ;
		    	Map map = modelService.queryForMap(sql, new Object[] {cfm_type});
		    	if(null!=map && map.size()>0) {
		    		auth=(String) map.get("DATA_AUTH");
		    	}
	    	  String sqlCfm = "select CEC_DESC from T_CO_ERROR_CODE where ID=? and DATA_AUTH=?";
	     cecDesc = modelService.listDataSql(sqlCfm, new Object[] {cfm_type,auth});
	      
	  }
	    else{
	    	 String sql="SELECT DATA_AUTH FROM t_co_fix_maintenance WHERE ID=?" ;
		    	Map map = modelService.queryForMap(sql, new Object[] {cfmId});
		    	if(null!=map && map.size()>0) {
		    		auth=(String) map.get("DATA_AUTH");
		    	}
	    String sqlCfm = "select CEC_DESC from T_CO_ERROR_CODE where ID=(select cfm_ec_code from t_co_fix_maintenance where id=?) AND DATA_AUTH=?";
	     cecDesc = modelService.listDataSql(sqlCfm, new Object[] {cfmId,auth});
	    }
	    CommMethod.listMapToEscapeJs(cecDesc);
	    modelAction.setAjaxList(cecDesc);
	    return BaseActionSupport.AJAX;
  }

}
