package com.more.mes.smt.stationitem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;

import com.more.fw.core.dbo.model.service.ModelService;

import com.more.fw.core.dbo.model.service.impl.base.FuncService;


/**
 * 仓库建模树形
 * @author development
 *
 */
public class InitProInfo implements FuncService{
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String pid = request.getParameter("id");
		if (StringUtils.isBlank(pid))
        {
          pid = Constants.DEPT_TREE_ROOT_ID;
        }
	      String proSn = null;
	      String proSn2 = request.getParameter("proSn");//查询条件		
	      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			List<Map> list = new ArrayList<Map>();
			List<Map> list2 = new ArrayList<Map>();
			Map<String,String> nullMap = new HashMap<String,String>();
	       // if("".equals(proSn2)){
//	        	nullMap.put("id", "111");
//	        	nullMap.put("name", "111");
//	        	nullMap.put("upId", "-1");
//	        	list.add(nullMap);
	      //  }else{
	            if("-1".equals(pid)){
	           	 proSn = proSn2;
	           }else{
	           	proSn = pid;
	           }		
	     		if("-1".equals(pid)){
	     	   		list2 =	this.selectTreeP(proSn, modelService, list2,dataAuth);
	     	   		list.addAll(list2);
	     	   		}else{
	     	   			if(proSn2.equals(proSn)){
	     	   				list2 =	this.selectTreeC(proSn, modelService, list2,dataAuth);
	     	   				list.addAll(list2);
	     	   			}
	     	   		}       	
	  //   	        	}
	     	CommMethod.listToEscapeJs(list);
			modelAction.setAjaxList(list);
	        return BaseActionSupport.AJAX;
	}
	
	/**
	 * 仓库建模树形数据
	 * @param modelService
	 * @return
	 */
	

    public List<Map> selectTreeC(String proSn,ModelService modelService,List<Map> resList,String dataAuth){
    	List<Map> dataList = new ArrayList<Map>();
    	Map<String,Object> paramMap = new HashMap<String,Object>();
    	
    	String wkiKeypSn = null;
    	String wkiSn = null;
    	String sql = "select * from t_wip_keyp_info where WKI_SN = ? and WKI_FLAG = 'Y' and DATA_AUTH=? ";
    	dataList = modelService.listDataSql(sql, new Object[]{proSn,dataAuth});
    	if(dataList!=null && !dataList.isEmpty()){ 
    		for(int i =0;i<dataList.size();i++){
    			Map<String,Object> resMap = new HashMap<String,Object>();
    			paramMap = dataList.get(i);
    			wkiKeypSn = String.valueOf(paramMap.get("WKI_KEYP_SN"));
    			wkiSn = String.valueOf(paramMap.get("WKI_SN"));
    			resMap.put("id", wkiKeypSn);
    			resMap.put("name", wkiKeypSn);
    			resMap.put("upId", wkiSn);
    			resList.add(resMap);
    			this.selectTreeC(wkiKeypSn, modelService, resList,dataAuth);
    		}
    	}
    	return resList;
    }
    public List<Map> selectTreeP(String proSn,ModelService modelService,List<Map> resList,String dataAuth){
      	List<Map> dataList = new ArrayList<Map>();
    	Map<String,Object> paramMap = new HashMap<String,Object>();
    	
    	String wkiKeypSn = null;
    	String wkiSn = null;
    	String sql = "select * from t_wip_keyp_info where WKI_KEYP_SN = ? and WKI_FLAG = 'Y' and DATA_AUTH=? ";
    	dataList = modelService.listDataSql(sql, new Object[]{proSn,dataAuth});
    	if(dataList!=null && !dataList.isEmpty()){ 
    		for(int i =0;i<dataList.size();i++){
    			Map<String,Object> resMap = new HashMap<String,Object>();
    			paramMap = dataList.get(i);
    			wkiKeypSn = String.valueOf(paramMap.get("WKI_KEYP_SN"));
    			wkiSn = String.valueOf(paramMap.get("WKI_SN"));
    			resMap.put("id", wkiKeypSn);
    			resMap.put("name", wkiKeypSn);
    			resMap.put("upId", wkiSn);
    			resList.add(resMap);
    			this.selectTreeP(wkiSn, modelService, resList,dataAuth);
    		}
    	}else{
    		Map<String,Object> resMap = new HashMap<String,Object>();
    		resMap.put("id", proSn);
    		resMap.put("name", proSn);
			resMap.put("upId", "-1"); 
			resList.add(resMap);
    	}
    	return resList;    	
    }

}
