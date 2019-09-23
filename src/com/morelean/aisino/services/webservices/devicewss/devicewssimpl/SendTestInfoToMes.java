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
	 * @ClassName:TestEquipmentInfServicerImp
	 * @Description:测试设备接口服务实现类 1.判断必填项是否都是必填的 2.判断制令单管控类型是否为批次管控，批次管控的制令单直接将测试数据存入
	 *                          T_DEVICE_TEST_INFO和T_DEVICE_TEST_INFO_DETAIL，返回TRUE
	 *                          非批次管控制令单再走下面流程
	 *                          3.判断为非批次制令单时，调用过站存储过程P_C_SAVE_SN_INFO，存储过程返回OK时，
	 *                          将数据保存到T_DEVICE_TEST_INFO和T_DEVICE_TEST_INFO_DETAIL，
	 *                          返回TRUE；存储过程返回NG时，接口函数返回FALSE:NG信息
	 *                          4.调用P_C_SAVE_SN_INFO时
	 *                          ，remark1有值时，通过test_item与不良代码表不良描述关联获取不良代码
	 * @author:mmz
	 * @version:1.0
	 * @see
	 * @since 2018年3月25日下午1:45:44
	 * @Copyright: Copyright (c) 2018
	 * @Company: morelean
	 */
	public class SendTestInfoToMes implements IWebService {

		final Log log = LogFactory.getLog(this.getClass());
		private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
		String reMsg = "";

		
		
		/*  
		 * @param arg0  格式为String类型，json形式 。例: {"serial_number":"661866887747","sn_type":"金税盘","test_result":"OK","work_station":"涿州工厂生产车间二层","mo_number":"gd-011-02","test_time":"20180330091700","test_items":[{"test_item":"底层版本","test_result":"SKN6K08L1-180313","test_time":"20180330091700"},{"test_item":"时钟","test_result":"2018-03-3009:49:48","test_time":"20180330091700"}]} 
		 * @return 
		 */
		public Map<String, Object> excute(Object... arg0) {
			Map<String, Object> map = new HashMap<String, Object>();
			String msg;
			try {
				msg = sendTestInfoToMes(arg0[0].toString());
			} catch (Exception e) {
				log.error(e);
				msg = e.getMessage();
				map.put("MSG", e.getMessage());
				return map;
			}
			map.put("MSG", msg);
			return map;
		}

		public String sendTestInfoToMes(String msg) {

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
																																																	// ！
			testMap.put("serial_number", serialNumber);

			String snType = jo.containsKey("sn_type") ? jo.getString("sn_type") : "";// 产品类型(可配置)
																																								// ！
			testMap.put("sn_type", snType);

			String testWay = jo.containsKey("test_way") ? jo.getString("test_way") : "";// 测试方法

			String testResult = jo.containsKey("test_result") ? jo.getString("test_result") : "";// 测试结果
																																														// OK/NG
																																														// ！
			testMap.put("test_result", testResult);

			String lotNo = jo.containsKey("lot_no") ? jo.getString("lot_no") : "";// 批次号

			String workStation = jo.containsKey("work_station") ? jo.getString("work_station") : "";// 工作中心
																																															// ！
			testMap.put("work_station", workStation);

			String empNo = jo.containsKey("emp_no") ? jo.getString("emp_no") : "";// 员工号

			String moNumber = jo.containsKey("mo_number") ? jo.getString("mo_number") : "";// 制令单
																																											// ！
			testMap.put("mo_number", moNumber);

			String memo = jo.containsKey("memo") ? jo.getString("memo") : "";// 备注

			String mark1 = jo.containsKey("remark1") ? jo.getString("remark1") : "";// 备用项

			String mark2 = jo.containsKey("remark2") ? jo.getString("remark2") : "";

			String mark3 = jo.containsKey("remark3") ? jo.getString("remark3") : "";

			String mark4 = jo.containsKey("remark4") ? jo.getString("remark4") : "";

			String mark5 = jo.containsKey("remark5") ? jo.getString("remark5") : "";

			String testItems = jo.containsKey("test_items") ? jo.getString("test_items") : "";// 测试项
			if ("".equals(testItems))
				return "FALSE:test_items isNull";
			for (Entry<String, Object> dto : testMap.entrySet()) {
				if ("".equals(dto.getValue())) {
					return "FALSE:" + dto.getKey() + " is Null";// 必须有值项
				}
			}
	try {
			// 存储完整数据
			testMap.put("test_way", testWay);
			testMap.put("lot_no", lotNo);
			testMap.put("emp_no", empNo);
			testMap.put("memo", memo);
			testMap.put("remark1", mark1);
			testMap.put("remark2", mark2);
			testMap.put("remark3", mark3);
			testMap.put("remark4", mark4);
			testMap.put("remark5", mark5);
			// testMap.remove("test_items");//test_items
			testMap.put("EDIT_TIME", DateUtil.getCurDate());
			String deviceTestId = StringUtils.getUUID();
			testMap.put("ID", deviceTestId);

			JSONArray itemList = JSONArray.fromObject(testItems);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			StringBuffer errCode = new StringBuffer();
			int inx = 0;
			for (Object o : itemList) {
				inx++;
				JSONObject item = (JSONObject) o;
				if (!item.containsKey("test_result"))
					return "FALSE:test_result" + inx + " isNull";
				if (!item.containsKey("test_item"))
					return "FALSE:test_item" + inx + " isNull";
			//	if (!item.containsKey("test_time"))
				//	return "FALSE:test_time" + inx + " isNull";
				list.add(new ImmutableMap.Builder<String, Object>()
						.put("test_item", item.containsKey("test_item") ? item.getString("test_item") : "")
						.put("test_result", item.containsKey("test_result") ? item.getString("test_result") : "")
						.put("test_time", item.containsKey("test_time") ? Method.parsetDate(item.getString("test_time"), "yyyyMMdd hhmmss"): "")
						.put("memo", item.containsKey("memo") ? item.getString("memo") : "")
						.put("remark1", item.containsKey("remark1") ? item.getString("remark1") : "")
						.put("remark2", item.containsKey("remark2") ? item.getString("remark2") : "")
						.put("remark3", item.containsKey("remark3") ? item.getString("remark3") : "")
						.put("remark4", item.containsKey("remark4") ? item.getString("remark4") : "")
						.put("remark5", item.containsKey("remark5") ? item.getString("remark5") : "").put("id", StringUtils.getUUID()).build());
			}
			// 数据处理完成

			/*
			 * 判断制令单管控类型是否为批次管控，批次管控的制令单直接将测试数据存入
			 * T_DEVICE_TEST_INFO和T_DEVICE_TEST_INFO_DETAIL，返回TRUE
			 */
				if (checkMoNo(1, (String) testMap.get("mo_number"))) {
					return save(testMap, list, deviceTestId);
				} else if (checkMoNo(0, (String) testMap.get("mo_number"))) {
					int ngNo = 0;// 不良产品数
					StringBuffer ecStr = new StringBuffer();
					StringBuffer pointStr = new StringBuffer();
					StringBuffer cntStr = new StringBuffer();
					boolean ides = true;
					for (Map<String, Object> map : list) {
						if (!"".equals(map.get("remark1"))) {
							String code = getCode(map.get("remark1").toString(), modelService);
							if (null != code) {// 方法中排除""值
								if (ides) {
									ngNo = 1;// 注意
									ides = false;
									
									ecStr.append("|").append(code);
//									pointStr.append("1");
//									cntStr.append("1");// 默认算一合适吗
								} else {
									ecStr.append("|").append(code);
//									pointStr.append("|").append("1");
//									cntStr.append("|").append("1");

								}
							}
                        }
					}

					List<Object> bill = new ArrayList<Object>();
					// 生成清单
					bill.add(testMap.get("serial_number"));
					bill.add(testMap.get("mo_number"));
					bill.add(testMap.get("work_station"));
					bill.add(ecStr.toString());// M_EC_STR.toString()//不良代码	
					bill.add(pointStr.toString());// M_POINT_STR.toString() 不良点位
					bill.add(cntStr.toString());// M_COUNT_STR.toString() 不良点数
					bill.add(ngNo);// 0M_NG_NUM不良产品数
					bill.add("");// M_EMP测试员工
					bill.add(0);// M_FLAG
					bill.add("FLOWCODE");
					bill.add("RES");
					reMsg = saveInfo(bill, modelService);
					reMsg = getMsg(reMsg);
					if ("OK" != reMsg) {
						return "FALSE:" + reMsg;

					} else {
						return save(testMap, list, deviceTestId);
					}

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

		// 过站方法
		@SuppressWarnings("unchecked")
		public String saveInfo(List<Object> bill, ModelService modelService) {
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
			int[] outplace = { 10, 11 };
			List<Object> outType = new ArrayList<Object>();
			outType.add("String");
			outType.add("String");
			pf.setClassName("P_C_SAVE_SN_INFO");// 过站
			pf.setInPlace(inPlace);// 存储过程中in
			pf.setOutPlace(outplace); // 存储过程中out
			pf.setValArgs(bill.subList(0, 9));// 存储过程中输入的参数
			pf.setTotalLen(bill.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			List<Object> relist = modelService.procComm(pf);// 接收返回值
			String res = (String) relist.get(0); // 结果
			String res1 = (String) relist.get(1);
			return res1;
		}

		// 存储信息
		public String save(Map<String, Object> testMap, List<Map<String, Object>> list, String deviceTestId) {
			try {
				Date date = DateUtil.getCurDate();
				// 主表信息存储
				TableDataMapExt tdMap = new TableDataMapExt();
				tdMap.setTableName("T_DEVICE_TEST_INFO");
				// CommMethod.addSysDefCol(testMap, modelAction.getUser());
				//testMap.put("edit_time", date);大小写map认  oracle不认
				testMap.put("CREATE_TIME", date);
				tdMap.setColMap(testMap);

				modelService.save(tdMap);

				// 详情表信息存储
				tdMap = new TableDataMapExt();
				tdMap.setTableName("T_DEVICE_TEST_INFO_DETAIL");
				Map<String, Object> infoMap = tdMap.getColMap();
				infoMap.put("TI_ID", deviceTestId);
				infoMap.put("EDIT_TIME", date);
				infoMap.put("CREATE_TIME", date);
				for (Map<String, Object> map : list) {
					infoMap.putAll(map);
					modelService.save(tdMap);
				}
			} catch (Exception e) {
				return "FALSE:" + e.getMessage();
			}
			return "TRUE";
		}

	}
