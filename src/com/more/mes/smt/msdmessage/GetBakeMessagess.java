package com.more.mes.smt.msdmessage;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import java_cup.internal_error;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.This;

import com.datastax.driver.core.DataType.Name;
import com.datastax.driver.core.querybuilder.Select;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.echarts.model.affiliated.Data;

import examples.newsgroups;

public class GetBakeMessagess implements FuncService{
	
	private final Log log = LogFactory.getLog(This.class);
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
	  
	  HttpServletRequest request = modelAction.getRequest();
	  String begin =request.getParameter("begin");
	  String end = request.getParameter("end");
	  String DATA_AUTH = request.getParameter("DATA_AUTH");
		List<Map> lists = new ArrayList<Map>();
		try {
			
		
			String sql = "SELECT  T1.ID,T1.DATA_AUTH,T1.WMI_ITEM_SN,T1.WMI_ITEM_CODE,T1.WMI_WORK_AREA,T1.WMI_BAKE_TIME,T1.WMI_BAKE_TOTAL,"+
					" T1.WMI_BAKE_TIMES,T1.WMI_BAKE_LENGTH,T2.WSR_RULE_NAME,T2.WSR_BAKE_LIMIT,T2.WSR_BAKE_TIMES,T3.WSRD_BAKE_TEMP,"+
					" T3.WSRD_BAKE_TIME,T4.CI_ITEM_NAME,T4.CI_ITEM_SPEC,T5.NAME,T6.WA_AREA_NAME"+
					" FROM T_WMS_MSD_INFO T1"+
					" LEFT JOIN T_WMS_MSD_RULE T2 ON T1.WMI_RULE_SN=T2.WSR_RULE_SN"+
					" LEFT JOIN T_WMS_MSD_RULE_DETAIL T3 ON T2.WSR_RULE_SN=T3.WSRD_RULE_SN"+
					" LEFT JOIN T_CO_ITEM T4 ON T1.WMI_ITEM_CODE=T4.CI_ITEM_CODE"+
					" LEFT JOIN SY_DEPT T5 ON T5.ID=T1.DATA_AUTH"+
					" LEFT JOIN T_WMS_AREA T6 ON T6.WA_AREA_SN = T1.WMI_WORK_AREA";
		
			String sqlWhere="";
			
			if (StringUtils.isNotBlank(DATA_AUTH)) {
	      sqlWhere+=" and T1.DATA_AUTH ='"+DATA_AUTH+"'";
	    }
			
			if (StringUtils.isNotBlank(begin)){
	      sqlWhere+=" and T1.WMI_BAKE_TIME >=to_date('"+begin+"','yyyy-mm-dd HH24:MI:ss')";
	      
	    }
	    if (StringUtils.isNotBlank(end)){
	      sqlWhere+=" and T1.WMI_BAKE_TIME <=to_date('"+end+"','yyyy-mm-dd HH24:MI:ss')";
	    }
			
		//List<Map> list = modelService.listDataSql(sql);
		List<Map> list = modelService.listSql(sql, modelAction.getPage(), sqlWhere, null, null, null);
		System.out.println("list###################:"+list);
		if(null!=list){
	    for (int i = 0; i < list.size(); i++) {
	      Map dataMap = list.get(i);
	      SimpleDateFormat endData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String time=endData.format(new Date());
	      long bakeTime;
	    
	      
	      if(null!=dataMap.get("WMI_BAKE_TIME") ){
	        
	        if (null==dataMap.get("WMI_BAKE_LENGTH")) {
	          dataMap.put("WMI_BAKE_LENGTH", 0);
	        }
	        
	        Date timeDate = (Date)dataMap.get("WMI_BAKE_TIME");
	        long TIME =timeDate.getTime();//开始时间
	        
	        Double date = Double.parseDouble(dataMap.get("WMI_BAKE_LENGTH").toString());
	        long date2 = (long) (date * 3600 * 1000);  //标准时间
	        
	        long expectEndData = TIME+date2;
	        
	        String d = endData.format(expectEndData);  
	          Date datew=DateUtil.parseDate(d, "yyyy-MM-dd HH:mm:ss");  //预计结束时间
	        
	          dataMap.put("WMI_BAKE_EXPECTENDDATA", d);
	          
	        long t = new Date().getTime();//当前时间
	        
	        Double  BAKE_BAKETIMES =(double)t-TIME;
	        
	        
	        Double BAKE_BAKETIME = BAKE_BAKETIMES / (1000 * 60 * 60);//已烘烤市长
	        
	        BigDecimal   bs   =   new   BigDecimal(BAKE_BAKETIME);  
	        double   f1   =   bs.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
	        
	        dataMap.put("WMI_BAKE_BAKETIMES", f1);
	        
	        Double ds = BAKE_BAKETIMES-date2 / (1000 * 60 * 60);//判断状态
	        
	        String state ;
	        if (ds <0) {
	          state = "烘烤中";
	        }else if (0<=ds && ds<=5/60) {
	          state = "烘烤完成";
	        }else{
	          state = "烘烤超时"; 
	        }
	        dataMap.put("WMI_BAKE_STATE", state);
	        if (null!=dataMap.get("WMI_BAKE_TOTAL")) {
	          BigDecimal bigDecimalData = (BigDecimal)dataMap.get("WMI_BAKE_TOTAL");
	          String aString = bigDecimalData.toString();
	          Double dateq = Double.parseDouble(aString);
	        
	          //double TOTAL =f1+dateq.intValue();
	          double TOTAL =f1+dateq;//累积烘烤时间
	          BigDecimal   bsS   =   new   BigDecimal(TOTAL);
	          double   TOTALS   =   bsS.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
	          dataMap.put("WMI_BAKE_TOTAL", TOTALS);
	          
	        }else {
	          
	          
	          Double TOTAL =f1; //累积烘烤时间
	          
	          
	          dataMap.put("WMI_BAKE_TOTAL", TOTAL);
	        }
	        String s = endData.format(TIME);  
	        dataMap.put("WMI_BAKE_TIME", s);
	        

	        lists.add(dataMap);
	      }else{
	if(null==dataMap.get("WMI_BAKE_TIME")){
	          
	          if (null==dataMap.get("WMI_BAKE_LENGTH")) {
	            dataMap.put("WMI_BAKE_LENGTH", 0);
	          }
	          dataMap.put("WMI_BAKE_TIME", "");
	          
	          long TIME=0;
	          
	          Double date = Double.parseDouble(dataMap.get("WMI_BAKE_LENGTH").toString());
	          long date2 = (long) (date * 3600 * 1000); //标准时间
	          
	          long expectEndData = date2;//预计结束时间
	          
	          String d = endData.format(expectEndData);
	            
	            dataMap.put("WMI_BAKE_EXPECTENDDATA", "");
	           
	            
	          long t = new Date().getTime();//当前时间
	          
	          Double  BAKE_BAKETIMES =(double)t-TIME;
	          
	          
	          double BAKE_BAKETIME = BAKE_BAKETIMES / (1000 * 60 * 60);//已烘烤市长
	          
	          BigDecimal   bs   =   new   BigDecimal(BAKE_BAKETIME);  
	          double   f1   =   bs.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
	          
	          dataMap.put("WMI_BAKE_BAKETIMES", f1);
	          
	          Double ds = BAKE_BAKETIMES-date2 / (1000 * 60 * 60);//判断状态
	          
	          String state = null ;
	          if (ds <0) {
	            state = "烘烤中";
	          }else if (0<=ds && ds<=5/60) {
	            state = "烘烤完成";
	          }else if(ds>5/60){
	            state = "烘烤超时"; 
	          }
	          dataMap.put("WMI_BAKE_STATE", state);
	          if (null!=dataMap.get("WMI_BAKE_TOTAL")) {
	            Double dateq = Double.parseDouble(dataMap.get("WMI_BAKE_TOTAL").toString());
	            
	           // double TOTAL =f1+dateq.intValue(); 
	            double TOTAL =f1+dateq;//累积烘烤时间
	            BigDecimal   bsS   =   new   BigDecimal(TOTAL);
	            double   TOTALS   =   bsS.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
	            dataMap.put("WMI_BAKE_TOTAL", TOTALS);
	          }else {
	            
	            
	            double TOTAL =f1; //累积烘烤时间
	            
	           
	            dataMap.put("WMI_BAKE_TOTAL", TOTAL);
	          }
	          
	          

	          lists.add(dataMap);
	          
	        }
	        
	        
	      }
	      
	      
	    }
	    }
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(e);
		}
		modelAction.setAjaxPage(modelAction.getPage());
		modelAction.getAjaxPage().setDataList(lists);
		
		return BaseActionSupport.AJAX;
	}
	

}
