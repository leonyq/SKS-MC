package com.morelean.aisino.services.webservices.devicewss.devicewssimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.common.collect.ImmutableMap;
import com.mongodb.util.JSON;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.webservice.service.IWebService;
import com.morelean.aisino.common.Method;

/**
 * @ClassName:SendLoadInfoToMes
 * @Description: 1.判断必填项是否都是必填的
 * 
 *               2.判断制令单管控类型是否为批次管控，批次管控的制令单直接将测试数据存入T_DEVICE_PRO_LOAD_INFO，
 *               返回TRUE
 * 
 *               非批次管控制令单再走下面流程
 * 
 *               3.非批次生产制令单，参考MESSC002 生产组装指令，进行PCB
 *               SN和产品SN组装过站，过站OK后将测试数据存入T_DEVICE_PRO_LOAD_INFO
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年4月11日上午5:27:14
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SendLoadInfoToMes implements IWebService {

	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	String reMsg = "";

	/*
	 * 
	 * @param arg0 格式为String类型，json形式 。例: {"serial_number": "","sn_type": "",
	 * "lot_no": "", "file_name": "", "load_time": "", "work_station": "",
	 * "emp_no": "", "pcb_sn", "memo": "", "mo_number": "", "remark1": "",
	 * "remark2": "", "remark3": "", "remark4": "", "remark5": ""}
	 * 
	 * @return Map 
	 */
	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		String msg;
		try {
			msg = sendTestInfoToMes(arg0[0].toString());
		} catch (Exception e) {
			log.error(e);
			msg = e.getMessage();
			map.put("MSG", "FALSE:"+e.getMessage());
			return map;
		}
		map.put("MSG", msg);
		return map;
	}

	public String sendTestInfoToMes(String msg) throws Exception {

		// 获得数据，并进行空值处理和必填项判断
		Object obj = null;
		try {
			obj = JSON.parse(msg);
		} catch (Exception e) {
			return "FALSE:JSON解析错误";
		}

		JSONObject jo = JSONObject.fromObject(obj);
		Map<String, Object> testMap = new HashMap<String, Object>();
		String serialNumber = jo.containsKey("serial_number") ? jo.getString("serial_number") : "";// 产品SN
		testMap.put("serial_number", serialNumber);
		String snType = jo.containsKey("sn_type") ? jo.getString("sn_type") : "";// 产品类型(可配置)
		testMap.put("sn_type", snType);
		String lotNo = jo.containsKey("lot_no") ? jo.getString("lot_no") : "";// 批次号
		String fileName = jo.containsKey("file_name") ? jo.getString("file_name") : "";// 记载文件
		String loadTime = jo.containsKey("load_time") ? jo.getString("load_time") : "";// 加载时间
		testMap.put("load_time", Method.parsetDate(loadTime, "yyyyMMdd hhmmss"));
		String workStation = jo.containsKey("work_station") ? jo.getString("work_station") : "";// 工作中心
		testMap.put("work_station", workStation);
		String empNo = jo.containsKey("emp_no") ? jo.getString("emp_no") : "";// 员工号
		String moNumber = jo.containsKey("mo_number") ? jo.getString("mo_number") : "";// 制令单号
																																										// ！
		testMap.put("mo_number", moNumber);
		String pcbSn = jo.containsKey("pcb_sn") ? jo.getString("pcb_sn") : "";// pcb_sn
																																					// ！
		testMap.put("pcb_sn", pcbSn);
		String memo = jo.containsKey("memo") ? jo.getString("memo") : "";// 备注

		for (Entry<String, Object> dto : testMap.entrySet()) {
			if ("".equals(dto.getValue())) {
				return "FALSE:" + dto.getKey() + " is Null";// 必须有值项
			}
		}
		// 存储完整数据
		testMap.put("lot_no", lotNo);
		testMap.put("load_file", fileName);
		testMap.put("emp_no", empNo);
		testMap.put("memo", memo);
		testMap.put("EDIT_TIME", DateUtil.getCurDate());
		String loadId = StringUtils.getUUID();
		testMap.put("ID", loadId);

		// 数据处理完成

		/*
		 * 判断制令单管控类型是否为批次管控，批次管控的制令单直接将测试数据存入 T_DEVICE_PRO_LOAD_INFO，返回TRUE
		 */
		try {
			if (checkMoNo(1, (String) testMap.get("mo_number"))) {
				return save(testMap, loadId);
			} else if (checkMoNo(0, (String) testMap.get("mo_number"))) {

				// 验证Sn
				List<Object> bill = new ArrayList<Object>();
				// 生成清单
				bill.add(testMap.get("serial_number"));
				bill.add(testMap.get("work_station"));
				bill.add("M_MARK");
				bill.add("M_MO_NUMBER");
				bill.add("FLOWCODE");
				bill.add("RES");
				reMsg = checkSn(bill, modelService);
				reMsg = getMsg(reMsg);
				if ("OK" != reMsg) {
					return "FALSE:" + reMsg;
				}
				/*搁置
				 */
		
				//检测PCB_SN
				bill.clear();
		  		bill.add(testMap.get("pcb_sn"));
		  		String M_KEYP_STR = "";
		  		bill.add(M_KEYP_STR);// 组件sn（all）
		  		bill.add(testMap.get("work_station"));
		  		String M_COUNT = "";
		  		bill.add(M_COUNT);
		  		String M_ITEM_CODE ="";
		  		bill.add(M_ITEM_CODE);
		  		bill.add(moNumber);// 制令单
	   			String M_MARK = "";
	   			bill.add(M_MARK);
	   			bill.add("FLOWCODE");
	   			bill.add("RES");
	   		reMsg = checkPcbSn(bill, modelService);
				reMsg = getMsg(reMsg);
				if ("OK" != reMsg) {
					return "FALSE:" + reMsg;
				}
				/*
	*/			
	   			
	   	  
				//存储组装信息
				bill.clear();
				bill.add(testMap.get("serial_number"));
				bill.add(testMap.get("pcb_sn"));
   			bill.add(moNumber);// 制令单
   			bill.add(testMap.get("work_station"));
   			bill.add("");
   			bill.add("");
   			bill.add("");
   			bill.add("");
   			bill.add("");
   			bill.add("");
   			bill.add("");
   			
				reMsg = pcSaveKeypInfo(bill, modelService);
				reMsg = getMsg(reMsg);
				if ("OK" != reMsg) {
					return "FALSE:" + reMsg;
				}
				
				return save(testMap, loadId);
				
				
			} else {
				return "FALSE:mo_number is undefined";
			}
			
			

		} catch (Exception e) {
			log.error(e);
			reMsg = "FALSE:" + e;
		}

		return reMsg;
	}

	public boolean checkMoNo(int model, String mo) {// 判断制令单是否为批次管控
		String sql;
		if (1 == model)
			sql = "SELECT COUNT(ID) CNT FROM T_PM_MO_BASE WHERE  PM_MO_NUMBER = '" + mo + "' AND PM_CONTROL_TYPE = 1";
		else {
			sql = "SELECT COUNT(ID) CNT FROM T_PM_MO_BASE WHERE  PM_MO_NUMBER = '" + mo + "'";
		}
		List<Map<String, Object>> list = modelService.listDataSql(sql);
		if (null == list || "".equals(list)) {
			return false;
		}
		if (list.size() > 0) {
            return !list.get(0).get("CNT").toString().equals("0");
		} else
			return false;
	}

	public String getCode(String desc, ModelService modelService) {// 获取不良代码
		String msg = null;
		String sql = "select CEC_CODE from T_CO_ERROR_CODE WHERE CEC_DESC LIKE ?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { "%" + desc + "%" });
		if (null != list) {
			if (null != list.get(0).get("CEC_CODE") && !"".equals(list.get(0).get("CEC_CODE")))
				msg = list.get(0).get("CEC_CODE").toString();
		}
		return msg;
	}

	// 处理过站信息
	public String getMsg(String resMsg) {
		String[] hitMsg = resMsg.split(":");
		if (hitMsg[0] == "OK") {
			return hitMsg[0];
		} else {
			return hitMsg[1].split("##")[0];
		}
	}

	// 检测SN
	@SuppressWarnings("unchecked")
	public String checkSn(List<Object> bill, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2 };
		int[] outplace = { 3, 4, 5 , 6 };
		List<Object> outType = new ArrayList<Object>();
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_CHECK_SN_KEYP");// 过站
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(bill.subList(0, 2));// 存储过程中输入的参数
		pf.setTotalLen(bill.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res1 =null;
		String res2 =null;
		String res3 =null;
		String res4 =null;
		
		for (int i=0 ; i<relist.size();i++){
			if(i==0){
				res1 = (String) relist.get(0); // 结果				
			}else if(i==1){
				res2 = (String) relist.get(1);
			}else if (i==2){
				
				res3 = (String) relist.get(2);
			}else if (i == 3){
				res4 = (String) relist.get(3);
			}
		}
		return res4;
	}

	// 检测PCB_SN
	@SuppressWarnings("unchecked")
	public String checkPcbSn(List<Object> bill, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3,4,5,7 };
		int[] outplace = { 2,4,5,6,7,8,9 };
		List<Object> outType = new ArrayList<Object>();
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		pf.setClassName("p_c_check_keyp");
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(bill.subList(0,6));// 存储过程中输入的参数
		pf.setTotalLen(9);// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(6);
		return res;
	}
	
	//组装过站保存产品生产信息
	public String pcSaveKeypInfo(List<Object> bill, ModelService modelService){
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4 ,5,6,7,8,9,10,11};
		int[] outplace = {5,6,7,8,12, 13 };
		List<Object> outType = new ArrayList<Object>();
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_SAVE_KEYP_INFO");
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(bill.subList(0, 11));// 存储过程中输入的参数
		pf.setTotalLen(13);// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(5);
		return res;
		
	}

	// 存储信息
	public String save(Map<String, Object> testMap, String loadId) {
		try {
			Date date = DateUtil.getCurDate();
			TableDataMapExt tdMap = new TableDataMapExt();
			tdMap.setTableName("T_DEVICE_PRO_LOAD_INFO");
			testMap.put("CREATE_TIME", date);
			tdMap.setColMap(testMap);
			modelService.save(tdMap);

		} catch (Exception e) {
			return "FALSE:" + e.getMessage();
		}
		return "TRUE";
	}
	

}
