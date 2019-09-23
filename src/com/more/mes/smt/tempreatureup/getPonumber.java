package com.more.mes.smt.tempreatureup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/*
根据工作中心ID判断所在的线别，查看线别有无制令单可选
*/


public class getPonumber implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		HttpServletRequest request = modelAction.getRequest();
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    String workStation=request.getParameter("workStation");//获取工作中心ID
	    
	    String auth = request.getSession().getAttribute("mcDataAuth").toString();
	    
	    String moNumber=request.getParameter("moNumber");//获取制令单号

	    
	    String sqlList="SELECT  t.id,t.pm_area_sn,t.pm_mo_number"+
	                     " FROM t_pm_mo_base t"+
	    		         " WHERE PM_AREA_SN ="+
	                     "(SELECT ca_parentareaid FROM t_co_area WHERE CA_ID=? and DATA_AUTH=?) "+
	    		         " and t.pm_mo_number =? and t.DATA_AUTH=?";
	    		         
	    List list=modelService.listDataSql(sqlList,new Object[]{workStation,auth,moNumber,auth}); //查询核实制令单和工作中心是否匹配
	    
	    String flag="0";  //判断集合有无值
	    if(list.size() >0) {
	       flag = "1";
	         
	    }
	    
	  modelAction.setAjaxString(flag);
	    
	return BaseActionSupport.AJAX;
	    
	
	}

}
