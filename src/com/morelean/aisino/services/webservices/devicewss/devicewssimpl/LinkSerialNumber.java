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
 * @ClassName:TestEquipmentInfServicerImp
 * @Description:接口接收link_sn和type，从表中查询符合条件的base_sn,返回base_sn; 
 *              若不存在符合条件的数据，查询该type的link_sn为空的base_sn,
 *              并将传入的link_sn写入表中link_sn字段;
 *              若该type没有link_sn为空的数据，则msg返回NG:没有可关联的SN
 * @author:qm
 * @version:1.0
 * @see
 * @since 2018年4月8日下午3:45:44
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class LinkSerialNumber implements IWebService {

	final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	String reMsg = "";

	public Map<String, Object> excute(Object... arg0) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = linkSerialNumber(arg0[0].toString(),arg0[1].toString());
		} catch (Exception e) {
			log.error(e);
			map.put("msg", "NG: " + e.getMessage());
			return map;
		}
		return map;
	}

	public Map<String, Object> linkSerialNumber(String linkSn,String type) {

		Map<String, Object> result = new HashMap<String, Object>();

		

		if (StringUtils.isBlank(linkSn)) {
			result.put("msg","NG: link_sn is Null");
			return result;
		}

		if (StringUtils.isBlank(type)) {
			result.put("msg","NG: type is Null");
			return result;
		}
		
		//校验输入的关联SN类型是否存在
		String checkTypeSql = "SELECT T.VALUE "
				+ " FROM SY_DICT_VAL T"
				+ " WHERE T.DICT_CODE=? AND T.CODE=?";
		String dictType = "LINK_SN_TYPE";
		List typeList = modelService.listDataSql(checkTypeSql,new Object[]{dictType,type});
		if (typeList.size() == 0) {
			result.put("msg","NG: 关联SN类型不存在");
			return result;
		}
		
		//根据传入的关联SN和type,查找满足条件的BASE_SN
		String listSql1 = "SELECT T.BASE_SN "
				+ " FROM  T_WIP_SERIAL_NUMBER_LINK T "
				+ " WHERE T.LINK_SN_TYPE=? AND T.LINK_SN=?";
		List<Map<String, String>> list1 = modelService.listDataSql(listSql1,
				new Object[] { type,linkSn});
				
		//如果查询到满足条件的BASE_SN则返回该BASE_SN
		if (list1.size() > 0) {
			String baseSn = list1.get(0).get("BASE_SN");
			result.put("base_sn",baseSn);
			result.put("msg", "OK");
			return result;
		}else {
			//如果不存在满足条件的BASE_SN,查询该type的link_sn为空的base_sn
			String listSql2 = "SELECT T.BASE_SN "
					+ " FROM  T_WIP_SERIAL_NUMBER_LINK T "
					+ " WHERE T.LINK_SN IS NULL AND T.LINK_SN_TYPE=?";
			List<Map<String, String>> list2 = modelService.listDataSql(listSql2,
					new Object[] {type});
					
			//如果有满足条件的数据,将传入的link_sn写入表中link_sn字段
			if (list2.size() > 0) {
				String baseSn = list2.get(0).get("BASE_SN");
				Date updateTime = new Date();
				String insertSql = "UPDATE T_WIP_SERIAL_NUMBER_LINK T"
						+ " SET T.LINK_SN=?,T.EDIT_TIME=?"
						+ " WHERE T.BASE_SN=? AND T.LINK_SN_TYPE=?";
				try{
					modelService.execSql(insertSql, new Object[]{linkSn,updateTime,baseSn,type});
				}catch(Exception e) {
					log.error(e);
					result.put("msg", "NG: 关联SN失败");
					return result;
				}
				result.put("msg", "OK");
				result.put("base_sn", baseSn);
				return result;
			}else {
				//如果没有满足条件的数据,返回NG结果
				result.put("msg", "NG: 没有可关联的SN");
				return result;
			}
		}

	}

}
