package com.more.mes.smt.stationitem.oracle;

import java.text.DecimalFormat;
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

public class LoadingMassEcharts implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		//获取线别下日历
		//获取默认日历
		HttpServletRequest req = modelAction.getRequest();
		String wkTime = req.getParameter("wkTime");
		String areaSn = req.getParameter("areaSn");
		String dataAuth = req.getParameter("dataAuth");
		List<Map> timeBucketList = new ArrayList<Map>();
		List<Map> valueList = new ArrayList<Map>();
		List<Map> valList = new ArrayList<Map>();
		Date wkTime2 = DateUtil.parseDate(wkTime,"yyyy-MM-dd");
		String direcrt = null;
		DecimalFormat df = new DecimalFormat("#.00"); 
		boolean flag = false;
		if(StringUtils.isNotBlank(wkTime) && StringUtils.isNotBlank(areaSn) && StringUtils.isNotBlank(dataAuth)){
			//取配置线别日历
		       String sql = "SELECT TO_CHAR(T2.CALW_START, 'HH24') || '-' ||"
						+"	       TO_CHAR(T2.CALW_END, 'HH24') TIME_BUCKET,"
						+"	       TO_CHAR(T2.CALW_START, 'HH24:MI') START_TIME,"
						+"	       TO_CHAR(T2.CALW_END, 'HH24:MI') END_TIME,"
						+"	       T2.CALW_INTER_DAY,"
	        			+"       CASE\n" + 
	        			"         WHEN T2.CALW_INTER_DAY = 'Y' THEN\n" + 
	        			"          TO_CHAR(? - 1, 'YYYY-MM-DD')\n" + 
	        			"         ELSE\n" + 
	        			"          TO_CHAR(?, 'YYYY-MM-DD')\n" + 
	        			"       END WORK_DATE"					
						+"	  FROM T_CO_CALENDAR_WORKTIME T2"
						+"	  LEFT JOIN T_CO_CALENDAR_LINE T3"
						+"	    ON T3.CAL_ID = T2.CAL_ID AND T2.DATA_AUTH=T3.DATA_AUTH"
						+"	 WHERE T3.AREA_ID = '"+areaSn+"'"

	        	+ " and T2.DATA_AUTH =?  ORDER BY TIME_BUCKET ";
                timeBucketList = modelService.listDataSql(sql,new Object[]{wkTime2,wkTime2,dataAuth}); 

		         
		       if(timeBucketList==null || timeBucketList.isEmpty()){
		    	   //取默认日历
		    		sql = "SELECT TO_CHAR(C.CALW_START, 'HH24') || '-' || TO_CHAR(C.CALW_END, 'HH24') TIME_BUCKET,\n" + 
	            			"						       TO_CHAR(C.CALW_START, 'HH24:MI') START_TIME,\n" + 
	            			"						       TO_CHAR(C.CALW_END, 'HH24:MI') END_TIME,\n" + 
	            			"						       C.CALW_INTER_DAY,\n" + 
	            			"       CASE\n" + 
	            			"         WHEN C.CALW_INTER_DAY = 'Y' THEN\n" + 
	            			"          TO_CHAR(? - 1, 'YYYY-MM-DD')\n" + 
	            			"         ELSE\n" + 
	            			"          TO_CHAR(?, 'YYYY-MM-DD')\n" + 
	            			"       END WORK_DATE"+
	            			"						  FROM T_CO_CALENDAR B\n" + 
	            			"						  LEFT JOIN T_CO_CALENDAR_WORKTIME C\n" + 
	            			"						    ON C.CAL_ID = B.ID AND B.DATA_AUTH=C.DATA_AUTH\n" + 
	            			"						 WHERE B.CAL_DEFAULT_FLAG = 'Y'\n" 
	        	+ " and B.DATA_AUTH =?  ORDER BY TIME_BUCKET ";
                timeBucketList = modelService.listDataSql(sql,new Object[]{wkTime2,wkTime2,dataAuth}); 
                }
	           //获取产量
	            String sql2 = "SELECT bb.BEGIN_TIME as START_TIME,bb.END_TIME,bb.MGS_WORK_DATE,exp(sum(decode(bb.DIRECRT,0,0,ln(bb.DIRECRT)))) DIRECRT FROM(" +
	             		"SELECT AA.BEGIN_TIME ,AA.END_TIME,AA.MGS_WORK_DATE,\r\n" +
	             		"CASE WHEN\r\n" + 
	             		"(SUM(AA.MGS_OK_PCS)+SUM(AA.MGS_NG_PCS)) = 0 THEN 1\r\n" + 
	             		"ELSE " + 
	             		"ROUND(1 -(SUM(AA.MGS_NG_PCS)/(SUM(AA.MGS_OK_PCS)+SUM(AA.MGS_NG_PCS))),4) " +
	             		"END DIRECRT\r\n" + 
	             		",AA.MGS_GROUP_CODE\r\n" + 
	             		"  FROM (SELECT SUBSTR(T.MGS_BEGIN_TIME, 12, 5) BEGIN_TIME,\r\n" + 
	             		"               SUBSTR(T.MGS_END_TIME, 12, 5) END_TIME,\r\n" + 
	             		"               T.MGS_WORK_DATE,\r\n" + 
	             		"               T.MGS_NG_PCS,\r\n" + 
	             		"               T.MGS_OK_PCS,\r\n" + 
	             		"               T.MGS_GROUP_CODE\r\n" + 
	             		"          FROM T_MID_GROUP_STATISTIC T\r\n" + 
	             		"         WHERE T.MGS_AREA_SN =? AND T.DATA_AUTH=?\r\n" + 
	             		"           AND T.MGS_WORK_DATE =\r\n" + 
	             		"               SUBSTR(TO_CHAR(?, 'yyyy-mm-dd hh24:mi:ss'), 1, 10)\r\n" + 
	             		"        UNION ALL\r\n" + 
	             		"        SELECT SUBSTR(T.MGS_BEGIN_TIME, 12, 5) BEGIN_TIME,\r\n" + 
	             		"               SUBSTR(T.MGS_END_TIME, 12, 5) END_TIME,\r\n" + 
	             		"               T.MGS_WORK_DATE,\r\n" + 
	             		"               T.MGS_NG_PCS,\r\n" + 
	             		"               T.MGS_OK_PCS,\r\n" + 
	             		"               T.MGS_GROUP_CODE\r\n" + 
	             		"          FROM T_MID_GROUP_STATISTIC T\r\n" + 
	             		"         WHERE T.MGS_AREA_SN =? AND T.DATA_AUTH=?\r\n" + 
	             		"           AND T.MGS_WORK_DATE =\r\n" + 
	             		"               SUBSTR(TO_CHAR(? - 1, 'yyyy-mm-dd hh24:mi:ss'), 1, 10)) AA\r\n" + 
	             		"               GROUP BY AA.BEGIN_TIME,AA.END_TIME,AA.MGS_WORK_DATE,AA.MGS_GROUP_CODE\r\n" + 
	             		"               ORDER BY AA.BEGIN_TIME ) bb\r\n" + 
	             		"               GROUP BY bb.BEGIN_TIME,bb.END_TIME,bb.MGS_WORK_DATE";
	            valList = modelService.listDataSql(sql2, new Object[]{areaSn,dataAuth,wkTime2,areaSn,dataAuth,wkTime2});
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
	                				&& timeBucketList.get(i).get("WORK_DATE").equals(valList.get(j).get("MGS_WORK_DATE"))){
	                			flag = true;
	                			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
	                			objArray[1] = valList.get(j).get("DIRECRT");
	                			direcrt = df.format(Double.parseDouble(String.valueOf(valList.get(j).get("DIRECRT")))*100);
	                			if(direcrt.equals("100.00")){
	                				direcrt = "100";
	                			}
	                			dataMap.put("TIME_BUCKET", timeBucketList.get(i).get("TIME_BUCKET"));
	                			dataMap.put("DIRECRT",direcrt );
	                        	//valueList.add(objArray);
	                			valueList.add(dataMap);
	                		} 
	            		}
	            		
	            		if(objArray[0]==null ){
	             			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
	             			objArray[1] = "0";
                			dataMap.put("TIME_BUCKET", timeBucketList.get(i).get("TIME_BUCKET"));
                			dataMap.put("DIRECRT", "0");	             			
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
