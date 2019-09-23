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

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;



/**
 * @ClassName:SyncReflowTestIfno
 * @Description:.新增表T_DEVICE_REFLOW，
 *              返回true/false：xxxx
 * @author:zxc
 * @version:1.0
 * @see
 * @since 2018年4月25日 下午1:42:35
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */


public class SyncReflowTestIfno implements IWebService {
	
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	//private ModelAction modelAction=(ModelAction)SpringContextUtil.getBean("modelAction");
	String reMsg = "";

	@Override
	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		String msg;
		try {
			msg = syncReflowTestIfno(arg0[0].toString());
		} catch (Exception e) {
			log.error(e);
			map.put("MSG", e.getMessage());
			return map;
		}
		map.put("MSG", msg);
		return map;
	}

	private String syncReflowTestIfno(String msg) throws ParseException {
		Object obj = msg;
		JSONObject jo;
		try {
			 jo = JSONObject.fromObject(obj);
		} catch (Exception e) {
			return "FALSE:JSON解析错误";
		}

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 时间格式转化24小时制
		Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String curtimeString = format.format(new Date());
		
		String areaname = jo.containsKey("area_name") ? jo.getString("area_name"):"";//
		String mo_number = jo.containsKey("mo_number") ? jo.getString("mo_number"):"";//
		String speed_perminute = jo.containsKey("speed_perminute") ? jo.getString("speed_perminute"):"";//
		String title = jo.containsKey("title") ? jo.getString("title"):"";//
		String side_flag = jo.containsKey("side_flag") ? jo.getString("side_flag"):"";//
		String target_temperature = jo.containsKey("target_temperature") ? jo.getString("target_temperature"):"";//
		String actual_temperature = jo.containsKey("actual_temperature") ? jo.getString("actual_temperature"):"";//
		String belt_run_rate = jo.containsKey("belt_run_rate") ? jo.getString("belt_run_rate"):"";//
		String row_index = jo.containsKey("row_index") ? jo.getString("row_index"):"";//
		String conveyor_width = jo.containsKey("conveyor_width") ? jo.getString("conveyor_width"):"";//
		String library = jo.containsKey("library") ? jo.getString("library"):"";//
		String solder_program = jo.containsKey("solder_program") ? jo.getString("solder_program"):"";//
		
		
		TableDataMapExt reflow = new TableDataMapExt();
		reflow.setTableName("T_DEVICE_REFLOW");// 数据插入
		//CommMethod.addSysDefCol(printer.getColMap(),modelAction.getUser());
		reflow.getColMap().put("id",StringUtils.getUUID());
		reflow.getColMap().put("create_time", sdf1.parse(curtimeString));
		reflow.getColMap().put("areaname",areaname);
		reflow.getColMap().put("mo_number",mo_number);
		reflow.getColMap().put("speed_perminute",speed_perminute);
		reflow.getColMap().put("title",title);
		reflow.getColMap().put("side_flag",side_flag);
		reflow.getColMap().put("target_temperature",target_temperature);
		reflow.getColMap().put("actual_temperature",actual_temperature);
		reflow.getColMap().put("belt_run_rate",belt_run_rate);
		reflow.getColMap().put("row_index",row_index);
		reflow.getColMap().put("conveyor_width",conveyor_width);
		reflow.getColMap().put("library",library);
		reflow.getColMap().put("solder_program",solder_program);
		
	
		 try{  	
		    	int reflowsussess=modelService.save(reflow);   //REARLIMITATIONOFEFFECTIVEAREA
		    	if(reflowsussess>0){
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
