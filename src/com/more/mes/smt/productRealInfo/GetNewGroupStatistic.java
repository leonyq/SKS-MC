package com.more.mes.smt.productRealInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class GetNewGroupStatistic implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest req = modelAction.getRequest();
		List<Map> resList = new ArrayList<Map>();
		String moNumber = req.getParameter("moNumber");//制令单号
		String dataAuth = modelAction.getRequest().getParameter("dataAuth");
		String getTechSql = " select * from t_pm_mo_base where PM_MO_NUMBER =? AND DATA_AUTH = ? ";
	    List<Map> dataList = modelService.listDataSql(getTechSql,new Object[]{moNumber,dataAuth});
	    if(dataList==null || dataList.size()<=0) {modelAction.setAjaxList(resList);return BaseActionSupport.AJAX;}
	    String techSn = String.valueOf(dataList.get(0).get("PM_TECH_SN"));//工艺编码  
	    String getRountSql = "select * from t_co_technics where CT_ID = ? and DATA_AUTH = ?  ";
	    List<Map> dataList2 = modelService.listDataSql(getRountSql,new Object[]{techSn,dataAuth});
	    if(dataList2==null || dataList2.size()<=0) {modelAction.setAjaxList(resList);return BaseActionSupport.AJAX;}
	    String rountCode = String.valueOf(dataList2.get(0).get("CT_ROUTE_CODE"));//流程编码
	    String getRountGroupSql = "select * from T_CO_ROUTE_CONTROL where CR_ROUTE_ID = ? and DATA_AUTH = ?  order by CRC_STEP_SEQU ";
	    List<Map> dataList3 = modelService.listDataSql(getRountGroupSql,new Object[]{rountCode,dataAuth});
	    if(dataList3==null || dataList3.size()<=0) {modelAction.setAjaxList(resList);return BaseActionSupport.AJAX;}
	    LinkedHashSet<Map> groupSet = new LinkedHashSet<Map>();
	    for(Map group : dataList3){
	    	Map<String,Object> linkMap = new HashMap<String,Object>();
	    	linkMap.put("CRC_GROUP_CODE", (group.get("CRC_GROUP_CODE")==null)?"":group.get("CRC_GROUP_CODE"));
	    	linkMap.put("CRC_STEP_SEQU", String.valueOf(group.get("CRC_STEP_SEQU")));
	    	groupSet.add(linkMap);
	    }
	    
	    for(Map groupMap : groupSet){
	    	Map<String,Object> resMap = new HashMap<String, Object>();
	    	resMap.put("MGS_MO_NUMBER", moNumber);//制令单号
	    	resMap.put("MGS_GROUP_CODE", groupMap.get("CRC_GROUP_CODE"));//工序
	    	resMap.put("MGS_GROUP_SEQ", groupMap.get("CRC_STEP_SEQU"));//工序顺序
	    	String groupNameSql = "select GROUP_NAME from t_co_group where group_code =? and data_auth=?   ";
	    	List<Map> groupList = modelService.listDataSql(groupNameSql,new Object[]{groupMap.get("CRC_GROUP_CODE"),dataAuth});
	    	if(null!=groupList && groupList.size()>0){
	    	    String groupName = String.valueOf(groupList.get(0).get("GROUP_NAME"));
	    	resMap.put("GROUP_NAME",groupName);
	    	String rwFlagSql = " select CRI_DOC_NUMBER from t_co_rework_info where CRI_REWORK_MO = ? and CRI_REWORK_INPUT = ? and CRI_INPUT_SEQ = ? and DATA_AUTH = ? ";
	    	List<Map> rwList = modelService.listDataSql(rwFlagSql,new Object[]{moNumber,groupMap.get("CRC_GROUP_CODE"),groupMap.get("CRC_STEP_SEQU"),dataAuth});
	    	if(rwList.size()>0){
	    		resMap.put("RW_FLAG","Y");	
	    	}else{
	    		resMap.put("RW_FLAG","N");
	    	}
	    	String wipSql = "SELECT nvl(SUM(WT_NUM),0) WIP_NUM FROM T_WIP_TRACKING B " +
	        		"WHERE B.WT_MO_NUMBER = ? AND B.WT_GROUP_CODE = ? "+
	        		"AND B.WT_GROUP_SEQ = ? AND B.DATA_AUTH = ? ";
	    	List<Map> WipData = modelService.listDataSql(wipSql,new Object[]{moNumber,groupMap.get("CRC_GROUP_CODE"),groupMap.get("CRC_STEP_SEQU"),dataAuth}); 
	    	if(WipData!=null && WipData.size()>0){
		    	resMap.put("WIP_NUM", WipData.get(0).get("WIP_NUM"));//WIP数量
	    	}else{
		    	resMap.put("WIP_NUM", 0);//WIP数量	
	    	}
	        String statisticSql = "SELECT SUM(T.MGS_OK_PCS+T.MGS_T_OK_PCS) AS PASSNUM,SUM(T.MGS_T_OK_PCS) MGS_T_OK_PCS," +
	        		"SUM(T.MGS_NG_PCS) MGS_NG_PCS,SUM(T.MGS_T_NG_PCS) MGS_T_NG_PCS,SUM(T.MGS_SCRAP_QTY) MGS_SCRAP_QTY " +
	        		"FROM T_MID_GROUP_STATISTIC T " +
	        		"WHERE T.MGS_MO_NUMBER = ? AND T.MGS_GROUP_CODE = ? AND T.MGS_GROUP_SEQ = ? AND T.DATA_AUTH = ?  ";
	    	List<Map> sticData = modelService.listDataSql(statisticSql,new Object[]{moNumber,groupMap.get("CRC_GROUP_CODE"),groupMap.get("CRC_STEP_SEQU"),dataAuth}); 
	    	if(sticData!=null && sticData.size()>0){
	    	        resMap.put("PASSNUM", sticData.get(0).get("PASSNUM"));//过站数量
	    	        resMap.put("MGS_T_OK_PCS", sticData.get(0).get("MGS_T_OK_PCS"));//二次过站数量
	    	        resMap.put("MGS_NG_PCS", sticData.get(0).get("MGS_NG_PCS"));//一次不良数量
	    	        resMap.put("MGS_T_NG_PCS", sticData.get(0).get("MGS_T_NG_PCS"));//二次不良数量
	    	        resMap.put("MGS_SCRAP_QTY", sticData.get(0).get("MGS_SCRAP_QTY"));//报废数量

	    	}else{
		    	resMap.put("PASSNUM", 0);//过站数量
		    	resMap.put("MGS_T_OK_PCS", 0);//二次过站数量
		    	resMap.put("MGS_NG_PCS", 0);//一次不良数量
		    	resMap.put("MGS_T_NG_PCS", 0);//二次不良数量
		    	resMap.put("MGS_SCRAP_QTY", 0);//报废数量	
	    	}	        
	        
	    	resList.add(resMap);
	    	}
	    	
	    }
	    
	    //返工单
	   
	    

	    
	    
	    
	       modelAction.setAjaxList(resList);
			return BaseActionSupport.AJAX;
	}

}
