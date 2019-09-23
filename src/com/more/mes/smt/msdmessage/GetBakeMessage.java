package com.more.mes.smt.msdmessage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.This;

import com.datastax.driver.core.DataType.Name;
import com.datastax.driver.core.querybuilder.Select;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.echarts.model.affiliated.Data;

import examples.newsgroups;

public class GetBakeMessage implements FuncService{
	
	private final Log log = LogFactory.getLog(This.class);
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		List<Map> lists = new ArrayList<Map>();
		try {
			
		
		String sql = "SELECT T1.WMI_ITEM_SN,T1.WMI_ITEM_CODE,T1.WMI_WORK_AREA,T1.WMI_BAKE_TIME,T1.WMI_BAKE_TOTAL,"+
					" T1.WMI_BAKE_TIMES,T1.WMI_BAKE_LENGTH,T2.WSR_RULE_NAME,T2.WSR_BAKE_LIMIT,T2.WSR_BAKE_TIMES,T3.WSRD_BAKE_TEMP,"+
					" T3.WSRD_BAKE_TIME,T4.CI_ITEM_NAME,T4.CI_ITEM_SPEC"+
					" FROM T_WMS_MSD_INFO T1"+
					" LEFT JOIN T_WMS_MSD_RULE T2 ON T1.WMI_RULE_SN=T2.WSR_RULE_SN"+
					" LEFT JOIN T_WMS_MSD_RULE_DETAIL T3 ON T2.WSR_RULE_SN=T3.WSRD_RULE_SN"+
					" LEFT JOIN T_CO_ITEM T4 ON T1.WMI_ITEM_CODE=T4.CI_ITEM_CODE";
		
		
		List<Map> list = modelService.listDataSql(sql);
		
		for (int i = 0; i < list.size(); i++) {
			Map dataMap = list.get(i);
			SimpleDateFormat endData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=endData.format(new Date());
			try {
				long m = endData.parse((String)dataMap.get("WMI_BAKE_TIME")).getTime()
						+endData.parse((String)dataMap.get("WMI_BAKE_LENGTH")).getTime();
				System.out.println("m======:"+m);
				 
				String expectEndData = endData.format(new Date(m * 1000));
				
				long bakeTime = endData.parse(time).getTime()-endData.parse((String)dataMap.get("WMI_BAKE_LENGTH")).getTime();
				System.out.println("bakeTime-------"+bakeTime);
				
				String bakeTimes = endData.format(new Date(bakeTime * 1000));
				
				long times = bakeTime-endData.parse((String)dataMap.get("WMI_BAKE_TIME")).getTime();
				String state ;
				if (times <0) {
					state = "烘烤中";
				}else if (0<=times && times<=5/60) {
					state = "烘烤完成";
				}else{
					state = "烘烤超时";	
				}
				dataMap.put("WMI_BAKE_EXPECTENDDATA", expectEndData);//预计结束时间
				dataMap.put("WMI_BAKE_BAKETIMES", bakeTimes);//已烘烤时长
				dataMap.put("WMI_BAKE_STATE", state);//物料状态
				long ss=endData.parse((String)dataMap.get("WMI_BAKE_TIME")).getTime()+bakeTime;
				String WMI_BAKE_TIME = endData.format(new Date(ss * 1000));
				dataMap.put("WMI_BAKE_TIME", WMI_BAKE_TIME);//累计烘烤时长
				lists.add(dataMap);
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
		}
		modelAction.setDataList(lists);
		
		return modelAction.ActionForwardExeid();
	}
	

}
