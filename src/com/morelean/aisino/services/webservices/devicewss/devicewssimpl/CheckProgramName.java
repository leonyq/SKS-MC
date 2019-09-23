package com.morelean.aisino.services.webservices.devicewss.devicewssimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mongodb.util.JSON;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.webservice.service.IWebService;

/**
 * @ClassName:CheckProgramName
 * @Description:1.判断必填项是否都是必填的;
 * 				2.校验制令单是否存在;
 * 				3.校验工作中心是否存在;
 * 				4.从表T_CO_PROGRAM_INFO查询程序文件编码是否正确，CPI_SN=PROGRAM_NAME,
 * 				  条件：依据制令单机种，工作中心工序查询默认项进行查询;;
 * 				5.查询文件编码与传入的程序名一致则返回TRUE，否则返回FALSE 
 * @author:qm
 * @version:1.0
 * @see
 * @since 2018年4月8日下午3:45:44
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class CheckProgramName implements IWebService {

	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	String reMsg = "";

	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		String result;
		try {
			result = checkProgramName(arg0[0].toString());
		} catch (Exception e) {
			log.error(e);
			map.put("MSG", e.getMessage());
			return map;
		}
		map.put("MSG", result);
		return map;
	}

	public String checkProgramName(String msg) {

		
		// 获得数据，并进行空值处理和必填项判断
		Object obj = null;
		try {
			obj = JSON.parse(msg);
		} catch (Exception e) {
			return "FALSE:JSON解析错误";
		}

		JSONObject jo = JSONObject.fromObject(obj);
		Map<String, Object> testMap = new HashMap<String, Object>();

		String programName = jo.containsKey("program_name") ? jo.getString("program_name"):"";//程序文件名
		if (StringUtils.isBlank(programName)) {
			return "FALSE:程序文件名为空";
		}
		
		String clientType = jo.containsKey("client_type") ? jo.getString("client_type"):"";//类型
		if (StringUtils.isBlank(clientType)) {
			return "FALSE:类型为空";
		}
		
		String workStation = jo.containsKey("work_station") ? jo.getString("work_station"):"";//工作中心
		if (StringUtils.isBlank(workStation)) {
			return "FALSE:工作中心为空";
		}
		
		String moNumber = jo.containsKey("mo_number") ? jo.getString("mo_number"):"";//制令单
		if (StringUtils.isBlank(moNumber)) {
			return "FALSE:制令单为空";
		}
		
		
		//校验输入的类型是否存在
		/*String checkTypeSql = "SELECT T.VALUE "
				+ " FROM SY_DICT_VAL T"
				+ " WHERE T.DICT_CODE=? AND T.CODE=?";
		String dictType = "CLIENT_TYPE";
		List typeList = modelService.listDataSql(checkTypeSql,new Object[]{dictType,clientType});
		if (typeList.size() == 0) {
			return "FALSE:菜单类型不存在";
		}*/
		
		//校验传入的制令单号是否存在
		String listSql1 = "SELECT T.PM_MODEL_CODE,T.PM_PRODUCT_STEP "
				+ " FROM  T_PM_MO_BASE T "
				+ " WHERE T.PM_MO_NUMBER=?";
		List<Map<String, String>> moList = modelService.listDataSql(listSql1,
				new Object[] {moNumber});
		
		//不存在则返回错误信息
		if (moList.size() == 0) {
			return "FALSE: 制令单不存在";
		}
		String modelCode = moList.get(0).get("PM_MODEL_CODE");//制令单机种
		String productStep = moList.get(0).get("PM_PRODUCT_STEP");//生产工序阶别
		
		//校验传入的工作中心是否存在
		String listSql2 = "SELECT T.CA_GROUP "
				+ " FROM  T_CO_AREA T "
				+ " WHERE T.CA_ID=?";
		List<Map<String, String>> workList = modelService.listDataSql(listSql2,
				new Object[] {workStation});
		
		//不存在则返回错误信息
		if (workList.size() == 0) {
			return "FALSE: 工作中心不存在";
		}
		String caGroup = workList.get(0).get("CA_GROUP");//工作中心工序
		
		//依据程序文件编码,查询软体信息表中对应的制令单机种,工作中心工序,生产阶别,和默认标志
		String cpiSql = "SELECT T.CPI_MODEL_CODE,T.CPI_GROUP,T.CPI_DEFAULT_FLAG,T.CPI_PRODUCT_STEP " 
				+ " FROM T_CO_PROGRAM_INFO T "
				+ " WHERE T.CPI_SN=?";
		List<Map<String, String>> cpiList = modelService.listDataSql(cpiSql,
				new Object[] {programName});
		
		//判断对应的程序文件编码是否与传入的文件名一致
		if (cpiList.size() > 0) {
			String cpiModelCode = cpiList.get(0).get("CPI_MODEL_CODE");//查询到的机种料号
			String cpiProductStep = cpiList.get(0).get("CPI_PRODUCT_STEP");//查询到的工序阶别
			if (!modelCode.equals(cpiModelCode)||!productStep.equals(cpiProductStep)) {
				return "FALSE: 传入的制令单号有误";
			}
			
			String cpiGroup = cpiList.get(0).get("CPI_GROUP");//查询到的工序代码
			if (!caGroup.equals(cpiGroup)) {
				return "FALSE: 传入的工作中心有误";
			}
			
			String defaultFlag = cpiList.get(0).get("CPI_DEFAULT_FLAG");//查询到的默认标志
			if (!"Y".equals(defaultFlag)) {
				return "FALSE: 默认标志未开启";
			}
			
		}else {
			
			return "FALSE: 传入的程序文件名有误";
		}
		
		return "TRUE";
	}

}
