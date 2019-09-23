package com.morelean.aisino.services.webservices.devicewss.devicewssimpl;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;


/**
 * @ClassName:SyncPrinterTestIfno
 * @Description:新增表T_WIP_PASTE_PRINTER_DEK数据
 *              返回true/false：xxxx
 * @author:zxc
 * @version:1.0
 * @see
 * @since 2018年4月23日下午2:42:35
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class SyncPrinterTestIfno implements IWebService {
	
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	//private ModelAction modelAction=(ModelAction)SpringContextUtil.getBean("modelAction");
	String reMsg = "";


	@Override
	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		String msg;
		try {
			msg = syncPrinterTestIfno(arg0[0].toString());
		} catch (Exception e) {
			log.error(e);
			map.put("MSG", e.getMessage());
			return map;
		}
		map.put("MSG", msg);
		return map;
	}


	private String syncPrinterTestIfno(String msg) throws ParseException {
		Object obj = msg;
		JSONObject jo;
		try {
			 jo = JSONObject.fromObject(obj);
		} catch (Exception e) {
			return "FALSE:JSON解析错误";
		}

		Map<String, Object> testMap = new HashMap<String, Object>();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 时间格式转化24小时制
		Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String curtimeString = format.format(new Date());


		String area_id = jo.containsKey("area_id") ? jo.getString("area_id"):"";//区域号
		String mo_number = jo.containsKey("mo_number") ? jo.getString("mo_number"):"";//机器号
		String machine = jo.containsKey("machine") ? jo.getString("machine"):"";//机型
		String backward_theta_compesation = jo.containsKey("backward_theta_compesation") ? jo.getString("backward_theta_compesation"):"";//向后印刷0补偿
		String backward_x_compesation = jo.containsKey("backward_x_compesation") ? jo.getString("backward_x_compesation"):"";//向后印刷X补偿
		String backward_y_compesation = jo.containsKey("backward_y_compesation") ? jo.getString("backward_y_compesation"):"";//向后印刷Y补偿
		String bladegap = jo.containsKey("bladegap") ? jo.getString("bladegap"):"";//印刷空隙
		String forward_theta_compesation = jo.containsKey("forward_theta_compesation") ? jo.getString("forward_theta_compesation"):"";
		String forward_x_compesation = jo.containsKey("forward_x_compesation") ? jo.getString("forward_x_compesation"):"";
		String forward_y_compesation = jo.containsKey("forward_y_compesation") ? jo.getString("forward_y_compesation"):"";
		String front_limitation_of_effective_area = jo.containsKey("front_limitation_of_effective_area") ? jo.getString("front_limitation_of_effective_area"):"";
		String front_squee_geeforce = jo.containsKey("front_squee_geeforce") ? jo.getString("front_squee_geeforce"):"";
		String front_squee_geespeed = jo.containsKey("front_squee_geespeed") ? jo.getString("front_squee_geespeed"):"";
		String rear_limitation_of_effective_area = jo.containsKey("rear_limitation_of_effective_area") ? jo.getString("rear_limitation_of_effective_area"):"";
		String rear_squee_geeforce = jo.containsKey("rear_squee_geeforce") ? jo.getString("rear_squee_geeforce"):"";
		String rear_squee_geespeed = jo.containsKey("rear_squee_geespeed") ? jo.getString("rear_squee_geespeed"):"";
		String snap_off_distance = jo.containsKey("snap_off_distance") ? jo.getString("snap_off_distance"):"";
		String snap_off_speed = jo.containsKey("snap_off_speed") ? jo.getString("snap_off_speed"):"";
		String start_from = jo.containsKey("start_from") ? jo.getString("start_from"):"";
		String wipe_frequency = jo.containsKey("wipe_frequency") ? jo.getString("wipe_frequency"):"";
		String machine_status = jo.containsKey("machine_status") ? jo.getString("machine_status"):"";
		String process_duration = jo.containsKey("process_duration") ? jo.getString("process_duration"):"";
		String production_status = jo.containsKey("production_status") ? jo.getString("production_status"):"";
		
		TableDataMapExt printer = new TableDataMapExt();
		printer.setTableName("T_WIP_PASTE_PRINTER_DEK");// 数据插入
		//CommMethod.addSysDefCol(printer.getColMap(),modelAction.getUser());
		printer.getColMap().put("id",StringUtils.getUUID());
		printer.getColMap().put("areaid", area_id);
    printer.getColMap().put("mo_number", mo_number);
    printer.getColMap().put("machine", machine);
    printer.getColMap().put("backwardthetacompesation", backward_theta_compesation);
    printer.getColMap().put("backwardxcompesation", backward_x_compesation);
    printer.getColMap().put("backwardycompesation", backward_y_compesation);
    printer.getColMap().put("bladegap", bladegap);
    printer.getColMap().put("forwardthetacompesation",forward_theta_compesation);
    printer.getColMap().put("forwardxcompesation",forward_x_compesation);
    printer.getColMap().put("forwardycompesation",forward_y_compesation);
    printer.getColMap().put("frontlimitationofeffectivearea", front_limitation_of_effective_area);
    printer.getColMap().put("frontsqueegeeforce", front_squee_geeforce);
    printer.getColMap().put("frontsqueegeespeed", front_squee_geespeed);
    printer.getColMap().put("rearlimitationofeffectivearea", rear_limitation_of_effective_area);
    printer.getColMap().put("rearsqueegeeforce", rear_squee_geeforce);
    printer.getColMap().put("rearsqueegeespeed", rear_squee_geespeed);
    printer.getColMap().put("snapoffdistance", snap_off_distance);
    printer.getColMap().put("snapoffspeed", snap_off_speed);
    printer.getColMap().put("startfrom", start_from);
    printer.getColMap().put("wipefrequency", wipe_frequency);
    printer.getColMap().put("machinestatus", machine_status);
    printer.getColMap().put("processduration", process_duration);	
    printer.getColMap().put("productionstatus", production_status);
    printer.getColMap().put("create_time", sdf1.parse(curtimeString));
    
    try{  	
    	int printsussess=modelService.save(printer);   //REARLIMITATIONOFEFFECTIVEAREA
    	if(printsussess>0){
    		return "TRUE:新增成功";
    	}else{
    		return "FALSE:新增失败";
    	}    	
    }catch(Exception e){
    	e.printStackTrace();
    }  
    return "TRUE:新增成功";
		
	}

}
