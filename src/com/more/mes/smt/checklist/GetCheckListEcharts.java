package com.more.mes.smt.checklist;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 品质检验单 获取图表
 * @author development
 *
 */
public class GetCheckListEcharts implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		String itemCode = req.getParameter("itemCode");
		List<Map> resList = this.supOK(itemCode, modelAction, modelService);
		//if(resList.size()>10){
	        for(int i =0;i<resList.size()-1;i++) {
	            for(int j=0;j<resList.size()-i-1;j++) {//-1为了防止溢出
				   String sup = String.valueOf(resList.get(i).get("SUP"));
	                if(Double.parseDouble(String.valueOf(resList.get(j).get("OKPER")))<Double.parseDouble(String.valueOf(resList.get(j+1).get("OKPER")))) {
	                    Object temp = resList.get(j).get("OKPER");
	                    Object tempsup =  resList.get(j).get("SUP");
	                    resList.get(j).put("OKPER", resList.get(j+1).get("OKPER"));
	                    resList.get(j).put("SUP", resList.get(j+1).get("SUP"));
	                    resList.get(j+1).put("OKPER", temp);
	                    resList.get(j+1).put("SUP", tempsup);
	            }
	            }    
	        }	
		//}
	    CommMethod.listToEscapeJs(resList);
		modelAction.setAjaxList(resList);
		return BaseActionSupport.AJAX;
	}
    public List<Map> supOK(String itemCode,ModelAction modelAction, ModelService modelService){
    	List<Map> resList = new ArrayList<Map>();
    	Map<String,Object> resMap = new HashMap<String, Object>();
    	List<Map> dataList = new ArrayList<Map>();
    	Map<String,Object> dataMap = new HashMap<String, Object>();
    	String sql = "SELECT COUNT(*) AS ONECOUNT, T1.QII_INSEPCT_RESULT, T1.QII_CUST_CODE,T2.SUPPLIER_NAME,T3.CUSTOMER "+
  "FROM T_QM_INSPECT_INFO T1 "+
 "LEFT JOIN T_CO_SUPPLIER T2 ON T2.SUPPLIER_CODE = T1.QII_CUST_CODE "+
 "LEFT JOIN T_CO_CUSTOMER T3 ON T3.CUST_CODE = T1.QII_CUST_CODE "+ 
 "WHERE T1.QII_ITEM_CODE = ? "+
 "GROUP BY T1.QII_CUST_CODE, T1.QII_INSEPCT_RESULT,T2.SUPPLIER_NAME,T3.CUSTOMER "+
 "ORDER BY T1.QII_CUST_CODE";
    	dataList = modelService.listDataSql(sql,new Object[]{itemCode});
        if(dataList!=null && !dataList.isEmpty()){
        	int totalcount = 0;
        	int okcount = 0;
        	int groupcount = 0;
        	String okper = null;
        	DecimalFormat df = new DecimalFormat("#.00");
        	String sup = "";
        	String status = "";
        	String supName = "";
        	String supName2 = "";
        	for(int i=0;i<dataList.size();i++){
        		dataMap = dataList.get(i);
        		groupcount = Integer.valueOf(String.valueOf(dataMap.get("ONECOUNT")));
        		status = String.valueOf(dataMap.get("QII_INSEPCT_RESULT"));
        		sup =  String.valueOf(dataMap.get("QII_CUST_CODE"));
        		if("null".equals(String.valueOf(dataMap.get("SUPPLIER_NAME")))){
        			supName = String.valueOf(dataMap.get("CUSTOMER"));
        		}else{
        			supName = String.valueOf(dataMap.get("SUPPLIER_NAME"));
        		}   		
        		if(i>0){
            		if("null".equals(String.valueOf(dataList.get(i-1).get("SUPPLIER_NAME")))){
            			supName2 = String.valueOf(dataList.get(i-1).get("CUSTOMER"));
            		}else{
            			supName2 = String.valueOf(dataList.get(i-1).get("SUPPLIER_NAME"));
            		}             			
        		    if(sup.equals(String.valueOf(dataList.get(i-1).get("QII_CUST_CODE")))){//同一供应商
               			totalcount = totalcount + groupcount;
            			if("1".equals(status)){
            				okcount = okcount + groupcount;	
            			}       		    	
        		    }else{
        		    	resMap = new HashMap<String, Object>();
        		    	if(okcount==0 || totalcount==0){
        		    		okper = "0.00";
        		    	}else{
        		    		okper =df.format(((double)okcount/(double)totalcount)*100);
        		    	}
        		    	
        		    	resMap.put("OKPER", okper);
        		    	resMap.put("SUP", supName2);
        		    	resList.add(resMap);
        		    	totalcount = groupcount;
               			if("1".equals(status)){
            				okcount = groupcount;	
            			}else{
            				okcount = 0;
            			}        		    	
        		    }	
        		}
                   if(i==dataList.size()-1){//最后一条
        			totalcount = totalcount + groupcount;
        			if("1".equals(status)){
        				okcount = okcount + groupcount;	
        			} 
    		    	resMap = new HashMap<String, Object>();
    		    	if(okcount==0 || totalcount==0){
    		    		okper = "0.00";
    		    	}else{
    		    		okper = df.format(((double)okcount/(double)totalcount)*100);	
    		    	}
    		    	
    		    	resMap.put("OKPER", okper);
    		    	resMap.put("SUP", supName);
    		    	resList.add(resMap);        			
        		}
                   if(i==0){
        			totalcount = totalcount + groupcount;
        			if("1".equals(status)){
        				okcount = okcount + groupcount;	
        			}        			
        		}
        	}
        }
    	return resList;
    }
}
