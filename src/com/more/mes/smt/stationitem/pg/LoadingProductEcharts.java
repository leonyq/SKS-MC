package com.more.mes.smt.stationitem.pg;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class LoadingProductEcharts implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		//获取线别下日历
		//获取默认日历
		HttpServletRequest req = modelAction.getRequest();
		String wkTime = req.getParameter("wkTime");
		String areaSn = req.getParameter("areaSn");
		List<Map> timeBucketList = new ArrayList<Map>();
		List<Map> valueList = new ArrayList<Map>();
		List<Map> valList = new ArrayList<Map>();
		Date wkTime2 = DateUtil.parseDate(wkTime,"yyyy-MM-dd");
		boolean flag = false;
		if(StringUtils.isNotBlank(wkTime) && StringUtils.isNotBlank(areaSn)){
			//取配置线别日历
		       String sql = "SELECT TO_CHAR(T2.CALW_START, 'HH24') || '-' ||"
						+"	       TO_CHAR(T2.CALW_END, 'HH24') TIME_BUCKET,"
						+"	       TO_CHAR(T2.CALW_START, 'HH24:MI') START_TIME,"
						+"	       TO_CHAR(T2.CALW_END, 'HH24:MI') END_TIME,"
						+"	       T2.CALW_INTER_DAY,"
	        			+"       CASE\n" + 
	        			"         WHEN T2.CALW_INTER_DAY = 'Y' THEN\n" + 
	        			"          TO_CHAR(?::date - interval '1 day', 'YYYY-MM-DD')\n" + 
	        			"         ELSE\n" + 
	        			"          TO_CHAR(?::date, 'YYYY-MM-DD')\n" + 
	        			"       END WORK_DATE"					
						+"	  FROM T_CO_CALENDAR_WORKTIME T2"
						+"	  LEFT JOIN T_CO_CALENDAR_LINE T3"
						+"	    ON T3.CAL_ID = T2.CAL_ID"
						+"	 WHERE T3.AREA_ID = '"+areaSn+"'"
						+"	 ORDER BY TIME_BUCKET";
		       timeBucketList = modelService.listDataSql(sql,new Object[]{wkTime2,wkTime2});   
		       if(timeBucketList==null || timeBucketList.isEmpty()){
		    	   //取默认日历
		    		sql = "SELECT TO_CHAR(C.CALW_START, 'HH24') || '-' || TO_CHAR(C.CALW_END, 'HH24') TIME_BUCKET,\n" + 
	            			"						       TO_CHAR(C.CALW_START, 'HH24:MI') START_TIME,\n" + 
	            			"						       TO_CHAR(C.CALW_END, 'HH24:MI') END_TIME,\n" + 
	            			"						       C.CALW_INTER_DAY,\n" + 
	            			"       CASE\n" + 
	            			"         WHEN C.CALW_INTER_DAY = 'Y' THEN\n" + 
	            			"          TO_CHAR(?::date - interval '1 day', 'YYYY-MM-DD')\n" + 
	            			"         ELSE\n" + 
	            			"          TO_CHAR(?::date, 'YYYY-MM-DD')\n" + 
	            			"       END WORK_DATE"+
	            			"						  FROM T_CO_CALENDAR B\n" + 
	            			"						  LEFT JOIN T_CO_CALENDAR_WORKTIME C\n" + 
	            			"						    ON C.CAL_ID = B.ID\n" + 
	            			"						 WHERE B.CAL_DEFAULT_FLAG = 'Y'\n" + 
	            			" ORDER BY TIME_BUCKET";
		    		timeBucketList = modelService.listDataSql(sql,new Object[]{wkTime2,wkTime2});	
		       }
	           //获取产量
	            String sql2 = "SELECT SUM(AA.MPS_PO_OUTPUT) MPS_PO_OUTPUT,AA.BEGIN_TIME as START_TIME,AA.END_TIME,AA.MPS_WORK_DATE FROM(" +
	            		"SELECT T.MPS_PO_OUTPUT,\n" + 
	            		"       SUBSTR(T.MPS_BEGIN_TIME, 12, 5) BEGIN_TIME,\n" + 
	            		"       SUBSTR(T.MPS_END_TIME, 12, 5) END_TIME,\n" + 
	            		"       T.MPS_WORK_DATE\n" + 
	            		"  FROM T_MID_PRODUCT_STATISTIC T\n" + 
	            		" WHERE T.MPS_AREA_SN = ? " + 
	            		"   AND T.MPS_WORK_DATE =\n" + 
	            		"       SUBSTR(TO_CHAR(?::date, 'YYYY-MM-DD HH24:MI:SS'), 1, 10)\n" + 
	            		"UNION ALL\n" + 
	            		"SELECT T.MPS_PO_OUTPUT,\n" + 
	            		"       SUBSTR(T.MPS_BEGIN_TIME, 12, 5) BEGIN_TIME,\n" + 
	            		"       SUBSTR(T.MPS_END_TIME, 12, 5) END_TIME,\n" + 
	            		"       T.MPS_WORK_DATE\n" + 
	            		"  FROM T_MID_PRODUCT_STATISTIC T\n" + 
	            		" WHERE T.MPS_AREA_SN = ? " + 
	            		"   AND T.MPS_WORK_DATE =\n" + 
	            		"       SUBSTR(TO_CHAR(?::date - interval '1 day', 'YYYY-MM-DD HH24:MI:SS'), 1, 10)" +
	            		")AA\n" + 
	            		"            GROUP BY AA.BEGIN_TIME,AA.END_TIME,AA.MPS_WORK_DATE\n" + 
	            		"             ORDER BY AA.BEGIN_TIME  " ; 
	            valList = modelService.listDataSql(sql2, new Object[]{areaSn,wkTime2,areaSn,wkTime2});
	            // 用对象保存数据
	            Object[] objArray = null;  
	            Map<String,Object> dataMap = null;
	            int tSize = timeBucketList.size();//时段列表数量
	            int vSize = valList.size();//产量列表数量
	                        
	            Calendar calendar = Calendar.getInstance();
	            //int hour = calendar.get(Calendar.HOUR_OF_DAY);//当前小时
	            
	            //当前时段往前取6个
	            int startHour;//起始时
	            int endHour;//结束时
	            int startCount = 0;//起始取数下标值，默认为0
	            for (int i = 0; i < tSize; i++) {
	            	startHour = Integer.parseInt(String.valueOf(timeBucketList.get(i).get("START_TIME")).substring(0,2));
	            	endHour = Integer.parseInt(String.valueOf(timeBucketList.get(i).get("END_TIME")).substring(0,2));
	            	
	            	//如果当前时间落在该时段内
//	            	if(startHour <= hour && hour < endHour){
//	            		if(i > 5){//往前取6
//	            			startCount = i - 5;
//	            		}
//	            	}
				}
	            
	            for (int i = startCount; i < tSize; i++) {
//	            	if(valueList.size() == 6){
//	            		break;
//	            	}
	            	objArray = new Object[2];
	            	dataMap = new HashMap<String, Object>();
	            		for(int j = 0;j < vSize; j++){
	                		//时段相同的，在valueList中放入产量
	                		if(timeBucketList.get(i).get("START_TIME").equals(valList.get(j).get("START_TIME"))
	                				&& timeBucketList.get(i).get("END_TIME").equals(valList.get(j).get("END_TIME"))
	                				&& timeBucketList.get(i).get("WORK_DATE").equals(valList.get(j).get("MPS_WORK_DATE"))){
	                			flag = true;
	                			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
	                			objArray[1] = valList.get(j).get("MPS_PO_OUTPUT");
	                			dataMap.put("TIME_BUCKET", timeBucketList.get(i).get("TIME_BUCKET"));
	                			dataMap.put("MPS_PO_OUTPUT", valList.get(j).get("MPS_PO_OUTPUT"));
	                        	//valueList.add(objArray);
	                			valueList.add(dataMap);
	                		} 
	            		}
	            		
	            		if(objArray[0]==null){
	             			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
	             			objArray[1] = "0";
                			dataMap.put("TIME_BUCKET", timeBucketList.get(i).get("TIME_BUCKET"));
                			dataMap.put("MPS_PO_OUTPUT", "0");	             			
	             			//valueList.add(objArray);
	             			valueList.add(dataMap);
	             		}
	            		/*if((i+1) > valueList.size()){//补齐没有产量的时间段
	            			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
	            			objArray[1] = "0";
	            			valueList.add(objArray);
	            		}*/
	            	
				}   
	/*            
	            if(valueList.size() < 6){
	            	int len = 6 - valueList.size();
	            	for (int i = 0; i < len; i++) {
	            		objArray = new Object[2];
	            		objArray[0] = i;
	            		objArray[1] = "";
	            		valueList.add(objArray);
					}
	            }*/
		}
		if(flag==false){
			valueList.clear();
		}
		modelAction.setAjaxList(valueList);
		return BaseActionSupport.AJAX;
	}

}
