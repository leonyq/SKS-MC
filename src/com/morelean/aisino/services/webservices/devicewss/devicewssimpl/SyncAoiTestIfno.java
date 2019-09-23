package com.morelean.aisino.services.webservices.devicewss.devicewssimpl;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
 * @since 2018年4月26日 下午3:41:22
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class SyncAoiTestIfno implements IWebService {
	
	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	//private ModelAction modelAction=(ModelAction)SpringContextUtil.getBean("modelAction");
	String reMsg = "";

	@Override
	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		String msg;
		try {
			msg = syncAoiTestIfno(arg0[0].toString());
		} catch (Exception e) {
			log.error(e);
			map.put("MSG", e.getMessage());
			return map;
		}
		map.put("MSG", msg);
		return map;
	}

	private String syncAoiTestIfno(String msg) throws ParseException {
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
		
		
		String id=jo.containsKey("id")?jo.getString("id"):"";
		String test_machine_name = jo.containsKey("test_machine_name") ? jo.getString("test_machine_name"):"";//
		String saved_machine_name = jo.containsKey("saved_machine_name") ? jo.getString("saved_machine_name"):"";//
		String program_name = jo.containsKey("program_name") ? jo.getString("program_name"):"";//
		String revision_no = jo.containsKey("revision_no") ? jo.getString("revision_no"):"";//
		String serial_no = jo.containsKey("serial_no") ? jo.getString("serial_no"):"";//
		String load_count = jo.containsKey("load_count") ? jo.getString("load_count"):"";//
		String pcb_no = jo.containsKey("pcb_no") ? jo.getString("pcb_no"):"";//
		String test_time = jo.containsKey("test_time") ? jo.getString("test_time"):"";//
		String end_date = jo.containsKey("end_date") ? jo.getString("end_date"):"";//
		String revise_end_date = jo.containsKey("revise_end_date") ? jo.getString("revise_end_date"):"";//
		String insert_wait_time = jo.containsKey("insert_wait_time") ? jo.getString("insert_wait_time"):"";//
		String eject_wait_time = jo.containsKey("eject_wait_time") ? jo.getString("eject_wait_time"):"";//
		String stop_time = jo.containsKey("stop_time") ? jo.getString("stop_time"):"";//
		String test_result = jo.containsKey("test_result") ? jo.getString("test_result"):"";//
		String revise_result = jo.containsKey("revise_result") ? jo.getString("revise_result"):"";//
		String barcode = jo.containsKey("barcode") ? jo.getString("barcode"):"";//
		String rot_count = jo.containsKey("rot_count") ? jo.getString("rot_count"):"";//
		String fault_rate = jo.containsKey("fault_rate") ? jo.getString("fault_rate"):"";//
		String component_total = jo.containsKey("component_total") ? jo.getString("component_total"):"";//
		String pin_total = jo.containsKey("pin_total") ? jo.getString("pin_total"):"";//
		String machine_determination = jo.containsKey("machine_determination") ? jo.getString("machine_determination"):"";//
		String visual_fault_flag = jo.containsKey("visual_fault_flag") ? jo.getString("visual_fault_flag"):"";//
		String component_name = jo.containsKey("component_name") ? jo.getString("component_name"):"";//
		String size_height = jo.containsKey("size_height") ? jo.getString("size_height"):"";//
		String size_width = jo.containsKey("size_width") ? jo.getString("size_width"):"";//
		String pin_count = jo.containsKey("pin_count") ? jo.getString("pin_count"):"";//
		String machine_fault_code = jo.containsKey("machine_fault_code") ? jo.getString("machine_fault_code"):"";//
		String fault_name = jo.containsKey("fault_name") ? jo.getString("fault_name"):"";//
		String user_fault_code = jo.containsKey("user_fault_code") ? jo.getString("user_fault_code"):"";//
		String user_fault_name = jo.containsKey("user_fault_name") ? jo.getString("user_fault_name"):"";//
		String component_revise_end_date = jo.containsKey("component_revise_end_date") ? jo.getString("component_revise_end_date"):"";//
		String image_file_path = jo.containsKey("image_file_path") ? jo.getString("image_file_path"):"";//
		String revise_time = jo.containsKey("revise_time") ? jo.getString("revise_time"):"";//
		
		//查询ID是否存在，存在的话先删除再重新插入
		String sql1 = "select T.id "
				+ " from T_DEVICE_AOI_TEST_INFO T where T.id=? ";
		List list = modelService.listDataSql(sql1, new Object[] {id});
		if (list != null && !list.isEmpty()) {
			String sql2= "delete "
					+ " from T_DEVICE_AOI_TEST_INFO T where T.ID=?";
			
			modelService.execSql(sql2, new Object[]{id});
		}
		
		TableDataMapExt aoitest = new TableDataMapExt();
		aoitest.setTableName("T_DEVICE_AOI_TEST_INFO");// 数据插入
	if(StringUtils.isNotBlank(id)){
		aoitest.getColMap().put("id",id);
	}else{
		aoitest.getColMap().put("id",StringUtils.getUUID());
	}
	     
		
		//CommMethod.addSysDefCol(printer.getColMap(),modelAction.getUser());
		
		aoitest.getColMap().put("create_time", sdf1.parse(curtimeString));
		aoitest.getColMap().put("test_machine_name",test_machine_name);
		aoitest.getColMap().put("saved_machine_name",saved_machine_name);
		aoitest.getColMap().put("program_name",program_name);
		aoitest.getColMap().put("revision_no",revision_no);
		aoitest.getColMap().put("serial_no",serial_no);
		aoitest.getColMap().put("load_count",load_count);
		aoitest.getColMap().put("pcb_no",pcb_no);
		aoitest.getColMap().put("test_time",Integer.parseInt(test_time));//
		aoitest.getColMap().put("end_date",sdf1.parse(end_date));//
		aoitest.getColMap().put("revise_end_date",sdf1.parse(revise_end_date));//
		aoitest.getColMap().put("insert_wait_time",Integer.parseInt(insert_wait_time));//
		aoitest.getColMap().put("eject_wait_time",Integer.parseInt(eject_wait_time));//
		aoitest.getColMap().put("stop_time",Integer.parseInt(stop_time));//
		aoitest.getColMap().put("test_result",test_result);
		aoitest.getColMap().put("revise_result",revise_result);
		aoitest.getColMap().put("barcode",barcode);
		aoitest.getColMap().put("rot_count",rot_count);
		aoitest.getColMap().put("fault_rate",fault_rate);
		
		aoitest.getColMap().put("component_total",component_total);
		aoitest.getColMap().put("pin_total",pin_total);
		aoitest.getColMap().put("machine_determination",machine_determination);
		aoitest.getColMap().put("visual_fault_flag",visual_fault_flag);
		aoitest.getColMap().put("component_name",component_name);
		aoitest.getColMap().put("size_height",Integer.parseInt(size_height));
		aoitest.getColMap().put("size_width",Integer.parseInt(size_width));
		aoitest.getColMap().put("pin_count",Integer.parseInt(pin_count));//
		aoitest.getColMap().put("machine_fault_code",machine_fault_code);
		aoitest.getColMap().put("fault_name",fault_name);
		aoitest.getColMap().put("user_fault_code",user_fault_code);
		aoitest.getColMap().put("user_fault_name",user_fault_name);
		aoitest.getColMap().put("component_revise_end_date",sdf1.parse(component_revise_end_date));//
		aoitest.getColMap().put("image_file_path",image_file_path);
		aoitest.getColMap().put("revise_time",Integer.parseInt(revise_time));//
		

		 try{  	
		    	int aoitestsussess=modelService.save(aoitest);   //REARLIMITATIONOFEFFECTIVEAREA
		    	if(aoitestsussess>0){
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
