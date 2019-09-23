package com.more.mes.aps.service.base;

import java.math.BigDecimal;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.other.common.method.CommonMethod;
import com.more.mes.other.common.method.CommonMethod.Common;
import com.more.mes.other.common.method.CommonMethod.DataStruct;
import com.more.mes.other.common.method.CommonMethod.DataStruct.Condition;
import com.more.mes.other.common.method.CommonMethod.DataStruct.PageImpl;
import com.more.mes.other.common.method.CommonMethod.Enums;

public class GetCommonInfo {

	private static final ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");
	private static final Log log = LogFactory
			.getLog("com.more.mes.aps.service.GetCommonInfo");

	private static final DataStruct ds = new DataStruct();

	// 任务操作标识
	private enum ganttTaskOpt {
		insert, update
	}

	// 表名
	private final static String TABLE_PM_MO_BASE = "T_PM_MO_BASE";//制令单表
	private final static String TABLE_PM_PLAN_INFO="T_PM_PLAN_INFO";//月排程表

	/**
	 * 根据用户ID获取组织机构
	 * 
	 * @param userId
	 * @return
	 */
	public static List getUserDataAuth(String userId) {
		try {
			String strSql = "SELECT\r\n" + "B.ID,\r\n" + "B.NAME\r\n"
					+ "FROM SY_DATA_AUTH A\r\n"
					+ "LEFT JOIN SY_DEPT B ON A.DEPT_ID=B.ID\r\n"
					+ "WHERE A.USER_ID=?";
			List<Map> mapList = modelService.listDataSql(strSql,
					new Object[] { userId });
			return mapList;
		} catch (Exception e) {
			log.error("GetUserDataAuth:",e);
			return null;
		}
	}

	/**
	 * 获取线体信息
	 * 
	 * @param dataAuth
	 * @return
	 */
	public static List getLineArea(String dataAuth) {
		try {
			String strSql = "SELECT\r\n" + "A.CA_ID,\r\n" + "A.CA_NAME\r\n"
					+ "FROM T_CO_AREA A\r\n" + "WHERE A.CA_TYPE='1' ";
			List<Object> paramObj = new ArrayList<Object>();
			if (!StringUtils.isEmpty(dataAuth)) {
				strSql += " AND A.DATA_AUTH=?";
				paramObj.add(dataAuth);
			}

			return modelService.listDataSql(strSql, paramObj.toArray());
		} catch (Exception ex) {
			log.error("getLineArea:",ex);
			return null;
		}
	}

	/**
	 * 获取产能日历主表/明细信息
	 * 
	 * @param paramMap
	 * @return
	 */
	public static List getCalendarInfo(Map<String, Object> paramMap,
			String year, String month, PaginationImpl impl) {
		try {
			String strSql = "SELECT\r\n"
			        + "D.NAME DATA_AUTH,\r\n"
					+ "A.ID,\r\n"
					+ "A.PPC_AREA_SN,\r\n"
					+ "B.CA_NAME,\r\n"
					+ "NVL(A.PPC_SAT_FLAG,'N') AS PPC_SAT_FLAG,\r\n"
					+ "NVL(A.PPC_SUN_FLAG,'N') AS PPC_SUN_FLAG,\r\n"
					+ "NVL(A.PPC_DEFAULT_FLAG,'N') AS PPC_DEFAULT_FLAG,\r\n"
					+ "A.PPC_MEMO,\r\n"
					+ "A.PPC_PRODUCT_STEP,\r\n"
					+ "C.VALUE STEP_NAME\r\n"
					+ "FROM T_PM_PLAN_CALENDAR A\r\n"
					+ "LEFT JOIN T_CO_AREA B ON A.PPC_AREA_SN=B.CA_ID AND B.CA_TYPE='1'\r\n"
					+ "LEFT JOIN SY_DICT_VAL C ON C.CODE=A.PPC_PRODUCT_STEP AND C.DICT_CODE='PROJECT_STEP'\r\n"
			        + "LEFT JOIN SY_DEPT D ON A.DATA_AUTH=D.ID\r\n" 
					+ "WHERE 1=1";
			List<Object> paramObj = new ArrayList<Object>();
			for (Map.Entry<String, Object> map : paramMap.entrySet()) {
				strSql += " AND A." + map.getKey() + "=?";
				paramObj.add(map.getValue());
			}
			int[] paramType = new int[paramObj.size()];
			for (int i = 0; i < paramType.length; i++) {
				paramType[i] = Types.VARCHAR;
			}
			List<Map> mapList = modelService.listSql(strSql, impl, null,
					paramObj.toArray(), paramType,
					"ORDER BY A.CREATE_TIME DESC", null);
			if (mapList != null && mapList.size() > 0) {
				strSql = "SELECT\r\n"
						+ "T.*\r\n"
						+ "FROM (\r\n"
						+ "SELECT\r\n"
						+ "A.*,\r\n"
						+ "TO_CHAR(PPE_BEGIN_TIME,'YYYY') AS BEGIN_YEAR,\r\n"
						+ "TO_CHAR(PPE_END_TIME,'YYYY') AS END_YEAR,\r\n"
						+ "TO_NUMBER(TO_CHAR(PPE_BEGIN_TIME,'MM')) AS BEGIN_MONTH,\r\n"
						+ " TO_NUMBER(TO_CHAR(PPE_END_TIME,'MM')) AS END_MONTH\r\n"
						+ "FROM T_PM_PLAN_EXECPTION A\r\n"
						+ "WHERE A.PPC_ID=?\r\n" + ") T\r\n" + "WHERE 1=1";
				paramObj = new ArrayList<Object>();
				paramObj.add(null);
				if (!StringUtils.isEmpty(year)) {
					strSql += " AND T.BEGIN_YEAR=? AND T.END_YEAR=?";
					paramObj.add(year);
					paramObj.add(year);
				}
				if (!StringUtils.isEmpty(month)) {
					strSql += " AND T.BEGIN_MONTH<=? AND T.END_MONTH>=?";
					paramObj.add(month);
					paramObj.add(month);
				}
				for (Map map : mapList) {
					Object keyId = map.get("ID");
					paramObj.remove(0);
					paramObj.add(0, keyId);
					map.put("dataDetList", modelService.listDataSql(strSql,
							paramObj.toArray()));
				}

				return mapList;
			} else {
				return null;
			}
		} catch (Exception ex) {
			log.error("getCalendarInfo:",ex);
			return null;
		}
	}

	/**
	 * 获取生产阶别
	 * 
	 * @return
	 */
	public static List getProductStep(String areasn) {
		try {
			String strSql = "SELECT\r\n" + "A.CODE,\r\n" + "A.VALUE\r\n"
					+ "FROM SY_DICT_VAL A\r\n"
					+ "WHERE A.DICT_CODE='PROJECT_STEP'";
			List<Object> paramObj = new ArrayList<Object>();
			if (!StringUtils.isEmpty(areasn)) {
				strSql += " AND A.CODE IN (\r\n" + "SELECT\r\n"
						+ "B.CA_PROJECT_STEP\r\n" + "FROM T_CO_AREA B\r\n"
						+ "WHERE B.CA_ID=?\r\n" + ")";
				paramObj.add(areasn);
			}
			return modelService.listDataSql(strSql, paramObj.toArray());
		} catch (Exception ex) {
			log.error("getProductStep:",ex);
			return null;
		}
	}

	/**
	 * 删除产能日历信息
	 * 
	 * @param id
	 * @return
	 */
	public static Boolean delCalendarInfo(String id) {
		try {
			String strSql = "BEGIN\r\n"
					+ "DELETE FROM T_PM_PLAN_CALENDAR WHERE ID IN (%s);\r\n"
					+ "DELETE FROM T_PM_PLAN_EXECPTION WHERE PPC_ID IN (%s);\r\n"
					+ "COMMIT;\r\n" + "END;";
			Integer result = modelService
					.execSql(String.format(strSql, id, id));
            return result > 0;
		} catch (Exception ex) {
			log.error("delCalendarInfo:",ex);
			return false;
		}
	}

	/**
	 * 产能日历新增or修改界面获取线别信息
	 * 
	 * @param currentArea
	 * @param isWithout
	 * @return
	 */
	public static List getNoWriteLine(String currentArea) {
		try {
			String strSql = "SELECT\r\n" + "A.CA_ID,\r\n" + "A.CA_NAME\r\n"
					+ "FROM T_CO_AREA A\r\n" + "WHERE A.CA_ID NOT IN (\r\n"
					+ "SELECT\r\n" + "B.PPC_AREA_SN\r\n"
					+ "FROM T_PM_PLAN_CALENDAR B\r\n" + "WHERE 1=1 %s\r\n"
					+ ")\r\n" + "AND A.CA_TYPE='1'\r\n" + "ORDER BY A.CA_ID";
			String isCurrentArea;
			if (StringUtils.isEmpty(currentArea)) {
				isCurrentArea = "";
				return modelService.listDataSql(String.format(strSql,
						isCurrentArea));
			} else {
				isCurrentArea = " AND B.PPC_AREA_SN<>?";
				return modelService.listDataSql(
						String.format(strSql, isCurrentArea),
						new Object[] { currentArea });
			}
		} catch (Exception ex) {
			log.error("getNoWriteLine:",ex);
			return null;
		}
	}

	/**
	 * 根据线别获取工厂日历工作时间(包括工作内的休息时间)
	 * 
	 * @param lineSn
	 *            线别SN
	 * @param startTime
	 *            起始时间
	 * @param endTime
	 *            结束时间
	 * @return
	 */
	public static Map getLineCalWorkTimeInfo(String lineSn, String startTime,
			String endTime) {
		try {
			Map<String,List> returnMap=new HashMap();
			String calId = getCalendarId(lineSn, startTime, endTime);
			if (null != calId) {
				returnMap.put("workTime", getWorkTimeInfo(calId));
				returnMap.put("restTime", getRestTimeInfo(calId));
				return returnMap;
			} else {
				return null;
			}
		} catch (Exception ex) {
			log.error("getLineCalWorkTimeInfo:",ex);
			return null;
		}
	}

	/**
	 * 校验产能日历中例外时间段是否合法
	 * 
	 * @param lineSn
	 *            线别SN
	 * @param startTime
	 *            开始时间
	 * @param endTime
	 *            结束时间
	 * @param exptType
	 *            例外类型
	 * @return
	 */
	public static int getExceptionAvaliableTime(String lineSn,
			String startTime, String endTime, String exptType) {
		try {
			// //获取工厂日历ID
			// String calId=getCalendarId(lineSn,startTime,endTime);
			// if(null==calId || StringUtils.isEmpty(calId)){
			// return 0;
			// }
			// //获取工作时间
			// List<Map> workTime=getWorkTimeInfo(calId);
			// //根据例外类型获取有效时长
			// Date
			// startDate=Common.convertStr2Date(startTime,"yyyy-MM-dd HH:mm:00");
			// Date
			// endDate=Common.convertStr2Date(endTime,"yyyy-MM-dd HH:mm:00");
			// Date varDate=startDate;
			// int avaTime=0;
			// int year=0;
			// int month=0;
			// Date vStartDate;
			// Date vEndDate;
			// String innerDay;
			// while(varDate.getTime()<=endDate.getTime()){
			// for(Map map:workTime){
			// innerDay=map.get("CALW_INTER_DAY").toString();
			// vStartDate=Common.convertStr2Date(Common.date2String(varDate,
			// "yyyy-MM-dd")+" "+map.get("STARTTIME").toString());
			// vEndDate=Common.convertStr2Date(Common.date2String(varDate,
			// "yyyy-MM-dd")+" "+map.get("ENDTIME").toString());
			// //判定是否跨天
			// if("N".equals(innerDay)){
			// //加班的有效时间处于非工作时间内，其他的类型处于工作时间内
			// if(!"1".equals(exptType)){
			//
			// }
			// }
			//
			//
			// vStartDate=new
			// Date(varDate.format("yyyy-MM-dd ")+vTime[i].start);
			// vEndDate=new Date(date.format("yyyy-MM-dd ")+vTime[i].end);
			// if(time>=vStartDate.getTime() && time<=vEndDate.getTime()){
			// return true;
			// }
			// }
			// }

			return 0;
		} catch (Exception ex) {
			log.error("getExceptionAvaliableTime:",ex);
			return 0;
		}
	}

	/**
	 * 获取制令单信息
	 * 
	 * @param request
	 * @return
	 */
	public static List getMonumber(HttpServletRequest request) {
		try {
			String projectId = request.getParameter("projectId");
			String step = request.getParameter("step");
			String face = request.getParameter("face");
			String exsitInBuffer = request.getParameter("existBufferDoc");
			String moNumber = returnMonumber(projectId, step, face,exsitInBuffer);
			Map returnMap = new HashMap();
			returnMap.put("moNumber", moNumber);
			List<Map> mapList = new ArrayList();
			mapList.add(returnMap);
			return mapList;
		} catch (Exception ex) {
			log.error("requestgetMonumber:",ex);
			return null;
		}
	}

	/**
	 * 获取制令单号
	 * 
	 * @param projectId
	 * @param step
	 * @param face
	 * @return
	 */
	public static String returnMonumber(String projectId, String step,
			String face,String existMonumber) {
		try {
			String perStr=String.format("%s-0%s%s", projectId, step,
					(face != "2" ? "1" : "2"));
			String moNumber = perStr;
			String sqlStr = "SELECT\r\n" + "COUNT(1) COUNT\r\n"
					+ "FROM T_PM_MO_BASE A\r\n"
					+ "WHERE A.PM_MO_NUMBER LIKE ?||'%'";
			List dataList = modelService.listDataSql(sqlStr,
					new Object[] { moNumber });
			if (dataList == null || dataList.size() <= 0) {
				return null;
			}
			Map map = (Map) dataList.get(0);
			int seq = Integer.parseInt(map.get("COUNT").toString());
			if (seq > 0) {
				sqlStr = "SELECT\r\n" + "COUNT(1) COUNT\r\n"
						+ "FROM T_PM_MO_BASE A\r\n" + "WHERE A.PM_MO_NUMBER=?";
				do {
					seq = seq + 1;
					moNumber =perStr+ "-" + (seq >= 10 ? seq : "0" + seq);
					dataList = modelService.listDataSql(sqlStr,
							new Object[] { moNumber });
					if (dataList != null && dataList.size() > 0) {
						map = (Map) dataList.get(0);
					} else {
						break;
					}
				} while (Integer.parseInt(map.get("COUNT").toString()) > 0 || existMonumber.contains(moNumber));
			} else {
				moNumber += "-01";
				//查看缓存数据中是否存在
	            while(existMonumber.contains(moNumber)){
	            	seq++;
	            	moNumber=perStr+ "-" + (seq >= 10 ? seq : "0" + seq);
	            }
			}
			
			return moNumber;
		} catch (Exception ex) {
			log.error("returnMonumber:",ex);
			return null;
		}
	}

	/**
	 * 获取排程信息
	 * 
	 * @param paramMap
	 * @param impl
	 * @return
	 */
	public static List getPlanInfo(HttpServletRequest request,
			PaginationImpl impl) {
		try {
			// 计划开始时间不处于时间段内：（状态不为2 & 计划开始时间要小于条件开始时间）
			// 计划开始时间处于时间段内：（状态不为2 ）
			// 已下达完成的排程单无需显示
			String sqlStr = "SELECT        \r\n" + 
					"T.*        \r\n" + 
					"FROM(        \r\n" + 
					"SELECT        \r\n" + 
					"A.ID,        \r\n" + 
					"A.DATA_AUTH,        \r\n" + 
					"F_GET_LANGUAGE(D.VALUE) AS PROJECT_STEP_TEXT,      \r\n" + 
					"B.PROJECT_STEP,        \r\n" + 
					"A.PPW_DOC_NO,        \r\n" + 
					"A.PPW_PROJECT_ID,        \r\n" + 
					"E.VALUE AS PROJECT_STATUS_TEXT,       \r\n" + 
					"B.PROJECT_STATUS,      \r\n" + 
					"B.PRODUCT_MATERIAL,        \r\n" + 
					"C.CI_ITEM_NAME,        \r\n" + 
					"NVL(A.PPW_TARGET_NUM,0) AS PPW_TARGET_NUM,        \r\n" + 
					"NVL(A.PPW_NOW_NUM,0)-NVL(PR.PM_TARGET_QTY,0) AS PPW_NOW_NUM,    \r\n" + 
					"NVL(MO.MO_PLAN_NUM,0) AS TRANSMIT_NUM,      \r\n" + 
					"ROUND(NVL(A.PPW_NOW_NUM,0)*NVL(F.CST_STANDARD_TIME,0)/3600,2) PPW_NOW_PRODUCT_TIME,       \r\n" + 
					"TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS') PPW_START_DATE,        \r\n" + 
					"TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI:SS') PPW_END_DATE,        \r\n" + 
					"TO_CHAR(B.ACTUAL_START_DATE,'YYYY-MM-DD HH24:MI:SS') ACTUAL_START_DATE,        \r\n" + 
					"TO_CHAR(A.PPW_DELIVERY_DATE,'YYYY-MM-DD HH24:MI:SS') PPW_DELIVERY_DATE,        \r\n" + 
					"NVL(B.FQC_COUNT,0) AS FQC_COUNT,        \r\n" + 
					"NVL(B.FINISH_COUNT,0) AS FINISH_COUNT,        \r\n" + 
					"NVL(A.PPW_GROUP,' ') AS PPW_GROUP,        \r\n" + 
					"TO_CHAR(B.PROLEPSIS_START_DATE,'YYYY-MM-DD HH24:MI:SS') PROLEPSIS_START_DATE,        \r\n" + 
					"TO_CHAR(B.PROLEPSIS_END_DATE,'YYYY-MM-DD HH24:MI:SS') PROLEPSIS_END_DATE,        \r\n" + 
					"NVL(A.PPW_PRE_TASK,' ') AS PPW_PRE_TASK,     \r\n" + 
					"NVL(F.CST_STANDARD_TIME,0) CST_STANDARD_TIME,     \r\n" + 
					"ROUND(NVL(B.PRODUCT_COUNT,0)*NVL(F.CST_STANDARD_TIME,0)/3600,2) AS PRODUCT_TIME        \r\n" + 
					"FROM T_PM_PLAN_INFO A        \r\n" + 
					"LEFT JOIN T_PM_PROJECT_BASE B ON A.PPW_PROJECT_ID=B.PROJECT_ID        \r\n" + 
					"LEFT JOIN T_CO_ITEM C ON B.PRODUCT_MATERIAL=C.CI_ITEM_CODE        \r\n" + 
					"LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='PROJECT_STEP' AND D.CODE=B.PROJECT_STEP        \r\n" + 
					"LEFT JOIN SY_DICT_VAL E ON E.DICT_CODE='PROJECT_STATUS' AND E.CODE=B.PROJECT_STATUS       \r\n" + 
					"LEFT JOIN (  \r\n" + 
					"SELECT  \r\n" + 
					"NVL(SUM(H.CST_STANDARD_TIME),0) AS CST_STANDARD_TIME,  \r\n" + 
					"H.CST_MODEL_CODE,  \r\n" + 
					"H.CST_STEP_CODE  \r\n" + 
					"FROM T_CO_STANDARD_TIME H   \r\n" + 
					"WHERE H.CST_SCHEDULE_FLAG='Y'  \r\n" + 
					"GROUP BY H.CST_MODEL_CODE,H.CST_STEP_CODE  \r\n" + 
					") F ON B.PRODUCT_MATERIAL=F.CST_MODEL_CODE AND B.PROJECT_STEP=F.CST_STEP_CODE  \r\n" + 
					"LEFT JOIN (    \r\n" + 
					"SELECT \r\n" + 
					"EP.PM_PLAN_ID, \r\n" + 
					"MIN(EP.PM_TARGET_QTY) AS MO_PLAN_NUM \r\n" + 
					"FROM ( \r\n" + 
					"SELECT   \r\n" + 
					"E.PM_PLAN_ID, \r\n" + 
					"E.PM_PROCESS_FACE, \r\n" + 
					"NVL(SUM(E.PM_TARGET_QTY),0) AS PM_TARGET_QTY  \r\n" + 
					"FROM T_PM_MO_BASE E   \r\n" + 
					"GROUP BY E.PM_PLAN_ID,E.PM_PROCESS_FACE \r\n" + 
					") EP \r\n" + 
					"GROUP BY EP.PM_PLAN_ID \r\n" + 
					") MO ON MO.PM_PLAN_ID=A.ID \r\n" + 
					"LEFT JOIN ( \r\n" + 
					"SELECT \r\n" + 
					"F.PM_PROJECT_ID, \r\n" + 
					"SUM(NVL(F.PM_TARGET_QTY,0)) AS PM_TARGET_QTY  \r\n" + 
					"FROM T_PM_MO_BASE F \r\n" + 
					"WHERE F.PM_PLAN_ID IS NULL \r\n" + 
					"GROUP BY F.PM_PROJECT_ID \r\n" + 
					") PR ON A.PPW_PROJECT_ID=PR.PM_PROJECT_ID   \r\n" + 
					"WHERE ((TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND B.PROJECT_STATUS<>'2') OR (TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')>='%s' AND TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND B.PROJECT_STATUS<>'2')) AND NVL(MO.MO_PLAN_NUM,0)<NVL(A.PPW_NOW_NUM,0)) T        \r\n" + 
					"WHERE 1=1";
			// 获取条件
			String dataAuth = request.getParameter("dataAuth");
			String step = request.getParameter("step");
			String material = request.getParameter("material");
			String projectId = request.getParameter("projectId");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			List<Condition> conditions = new ArrayList();
			sqlStr = String.format(sqlStr, startTime, startTime, endTime)
					+ " %s";

			if (!StringUtils.isEmpty(dataAuth)) {
				conditions.add(ds.new Condition("DATA_AUTH", dataAuth));
			}
			if (!StringUtils.isEmpty(step)) {
				conditions.add(ds.new Condition("PROJECT_STEP", step));
			}
			if (!StringUtils.isEmpty(projectId)) {
				conditions.add(ds.new Condition(Enums.conditionReference.like,
						Enums.conditionType.varchar, "PPW_PROJECT_ID",
						projectId));
			}
			if (!StringUtils.isEmpty(material)) {
				conditions.add(ds.new Condition(Enums.conditionReference.like,
						Enums.conditionType.varchar, "PRODUCT_MATERIAL",
						material));
			}
			// if (!StringUtils.isEmpty(startTime)) {
			// conditions
			// .add(ds.new Condition(Enums.conditionReference.greaterEqual,
			// "PPW_START_DATE",
			// startTime));
			// }
			// if (!StringUtils.isEmpty(endTime)) {
			// conditions
			// .add(ds.new Condition(Enums.conditionReference.lessEqual,
			// "PPW_END_DATE",
			// endTime));
			// }

			PageImpl pIpml = ds.new PageImpl(impl,
					"ORDER BY PPW_START_DATE DESC,PROLEPSIS_START_DATE DESC");
			// 查询
			return CommonMethod.Common.getDataList(sqlStr, conditions, pIpml);

			// return modelService.listSql(sqlStr, impl, null, param.toArray(),
			// type, "ORDER BY PPW_START_DATE ASC", null);
		} catch (Exception ex) {
			log.error("getPlanInfo:" + ex.toString());
			return null;
		}
	}
	/**
	 * 获取隶属与月排程但下的制令单信息
	 * @param request
	 * @return
	 */
	public static List getPlanMonumberInfo(HttpServletRequest request){
		try{
			String planDoc=request.getParameter("planDoc");
			String sqlStr="SELECT\r\n" + 
					"A.*\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"LEFT JOIN T_PM_PLAN_INFO B ON A.PM_PLAN_ID=B.ID\r\n" + 
					"WHERE B.PPW_DOC_NO=?";
			return modelService.listDataSql(sqlStr,new Object[]{planDoc});
		}
		catch(Exception ex){
			log.error("getPlanMonumberInfo:",ex);
			return null;
		}
	}

	/**
	 * 获取甘特图信息
	 * 
	 * @return json
	 */
	public static String getWeekGantt(HttpServletRequest request) {
		try {
			// 获取参数
			String dataAuth = request.getParameter("dataAuth");
			String step = request.getParameter("step");
			String projectId = request.getParameter("projectId");
			String material = request.getParameter("material");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			// 计划开始时间不处于时间段内：（状态不为4、5 & 计划开始时间要小于条件开始时间）
			// 计划开始时间处于时间段内：（状态不为4、5 ）
			// 计划开始时间和结束时间都不处于时间段内：（开始和结束时间都小于时间段的开始时间）这种制令单不要
			String appendStr = String
					.format(" AND ((TO_CHAR(PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND TO_CHAR(PM_DUE_DATE,'YYYY-MM-DD HH24:MI:SS')>='%s' AND PM_STATUS NOT IN ('4','5')) OR (TO_CHAR(PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS')>='%s' AND TO_CHAR(PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND PM_STATUS NOT IN ('4','5')))",
							startTime, startTime,startTime, endTime);
			/*String appendStr = String
					.format(" AND (TO_CHAR(PM_DUE_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND PM_STATUS NOT IN ('4','5'))",endTime);*/
			String sqlStr = "SELECT      \r\n" + 
					"A.ID,    \r\n" + 
					"A.PM_MO_NUMBER,    \r\n" + 
					"A.PM_PROJECT_ID,    \r\n" + 
					"A.PM_PRODUCT_STEP,    \r\n" + 
					"A.PM_AREA_SN,    \r\n" + 
					"A.PM_PROCESS_FACE,    \r\n" + 
					"A.PM_MODEL_CODE,    \r\n" + 
					"A.PM_PCB_CODE,    \r\n" + 
					"A.PM_TECH_SN,    \r\n" + 
					"A.PM_START_GROUP,    \r\n" + 
					"A.PM_END_GROUP,    \r\n" + 
					"A.PM_TARGET_QTY,    \r\n" + 
					"A.PM_INPUT_COUNT,    \r\n" + 
					"A.PM_FINISH_COUNT,    \r\n" + 
					"A.PM_SCRAP_QTY,    \r\n" + 
					"A.PM_ISSUED_DATE,    \r\n" + 
					"A.PM_ISSUED_EMP,    \r\n" + 
					"A.PM_ALTER_DATE,    \r\n" + 
					"A.PM_TRACK,   \r\n" + 
					"TO_DATE(TO_CHAR(A.PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PM_SCHEDULE_DATE,    \r\n" + 
					"TO_DATE(TO_CHAR(A.PM_DUE_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PM_DUE_DATE,    \r\n" + 
					"A.PM_START_DATE,    \r\n" + 
					"A.PM_CLOSE_DATE,    \r\n" + 
					"A.PM_STATUS,    \r\n" + 
					"A.PM_UNIT_NUM,    \r\n" + 
					"A.PM_JIGSAW_NUM,    \r\n" + 
					"A.PM_CONTROL_TYPE,    \r\n" + 
					"A.PM_SN_RULE,    \r\n" + 
					"A.PM_SUB_RULE,      \r\n" + 
					"A.PM_REPAIR_MAX,    \r\n" + 
					"A.PM_ERROR_SCRAP,    \r\n" + 
					"A.PM_AUTO_FQC,    \r\n" + 
					"A.PM_FQC_NUM,    \r\n" + 
					"A.PM_MEMO,    \r\n" + 
					"A.DEPT_ID,    \r\n" + 
					"A.CREATE_USER,      \r\n" + 
					"A.CREATE_TIME,    \r\n" + 
					"A.EDIT_USER,    \r\n" + 
					"A.EDIT_TIME,    \r\n" + 
					"A.PM_CLOSE_REASON,    \r\n" + 
					"A.DATA_AUTH,    \r\n" + 
					"A.PM_TRANSFER_RULE,    \r\n" + 
					"A.PM_CUST_CODE,    \r\n" + 
					"A.PM_PER_TASK,    \r\n" + 
					"A.PM_GROUP,  \r\n" + 
					"A.PM_PLAN_ID,  \r\n" + 
					"B.VALUE AS STEP,      \r\n" + 
					"G.CA_NAME,    \r\n" + 
					"NVL(G.CA_TRACK_FLAG,'N') AS CA_TRACK_FLAG,   \r\n" + 
					"C.VALUE AS STATUS,      \r\n" + 
					"D.CI_ITEM_NAME,    \r\n" + 
					"I.PPW_TARGET_NUM AS PRODUCT_COUNT,    \r\n" + 
					"NVL(F.CST_STANDARD_TIME,0) AS STANDAR_TIME,      \r\n" + 
					"NVL(F.CST_CHANGE_TIME,0) AS CST_CHANGE_TIME,      \r\n" + 
					"0 AS PLANED_NUM,      \r\n" + 
					"ROUND(NVL(F.CST_STANDARD_TIME,0)*NVL(A.PM_TARGET_QTY,0)/3600,2) AS PLAN_TIME,      \r\n" + 
					"'' AS PLAN_GROUP,      \r\n" + 
					"'' AS DEPANED,      \r\n" + 
					"I.PPW_DOC_NO,      \r\n" + 
					"I.PPW_START_DATE AS PROLEPSIS_START_DATE,      \r\n" + 
					"I.PPW_END_DATE AS PROLEPSIS_END_DATE,    \r\n" + 
					"TO_DATE(TO_CHAR(I.PPW_DELIVERY_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PPW_DELIVERY_DATE,  \r\n" + 
					"L.CT_PREPOSE_TECH AS PER_TECH,  \r\n" + 
					"L.CT_ID AS TECH, \r\n" + 
					"M.CT_PROCESS_FACE AS PER_FACE,\r\n" + 
					"f_c_get_multilingual(P.VALUE) AS PROCESS_FACE_NAME\r\n" + 
					"FROM T_PM_MO_BASE A      \r\n" + 
					"LEFT JOIN SY_DICT_VAL B ON B.DICT_CODE='PROJECT_STEP' AND A.PM_PRODUCT_STEP=B.CODE      \r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PM-STATUS' AND A.PM_STATUS=C.CODE \r\n" + 
					"LEFT JOIN SY_DICT_VAL P ON P.DICT_CODE='PROCESS_FACE' AND A.PM_PROCESS_FACE=P.CODE     \r\n" + 
					"LEFT JOIN T_CO_ITEM D ON A.PM_MODEL_CODE=D.CI_ITEM_CODE  \r\n" + 
					"LEFT JOIN T_PM_PLAN_INFO I ON A.PM_PLAN_ID=I.ID  \r\n" + 
					"LEFT JOIN T_CO_STANDARD_TIME F ON A.PM_MODEL_CODE=F.CST_MODEL_CODE       \r\n" + 
					"                              AND A.PM_PRODUCT_STEP=F.CST_STEP_CODE      \r\n" + 
					"                              AND A.PM_PROCESS_FACE=F.CST_PROCESS_FACE      \r\n" + 
					"                              AND A.PM_AREA_SN=F.CST_AREA_SN      \r\n" + 
					"                              AND A.PM_TRACK=F.CST_TRACK      \r\n" + 
					"LEFT JOIN T_CO_AREA G ON A.PM_AREA_SN=G.CA_ID   \r\n" + 
					"LEFT JOIN (  \r\n" + 
					"SELECT  \r\n" + 
					"H.CIC_ITEM_CODE,  \r\n" + 
					"J.CIG_TEC_ID,  \r\n" + 
					"J.CIG_PROCESS_FACE  \r\n" + 
					"FROM T_CO_ITEM_CONNECT H  \r\n" + 
					"LEFT JOIN T_CO_ITEM_GROUP J ON H.CIG_SN=J.CIG_SN  \r\n" + 
					"GROUP BY H.CIC_ITEM_CODE,J.CIG_TEC_ID,J.CIG_PROCESS_FACE  \r\n" + 
					") K ON A.PM_MODEL_CODE=K.CIC_ITEM_CODE AND A.PM_PROCESS_FACE=K.CIG_PROCESS_FACE  \r\n" + 
					"LEFT JOIN T_CO_TECHNICS L ON K.CIG_TEC_ID=L.CT_ID  \r\n" + 
					"LEFT JOIN T_CO_TECHNICS M ON L.CT_PREPOSE_TECH=M.CT_ID \r\n" + 
					"WHERE 1=1 AND A.PM_PLAN_ID IS NOT NULL AND A.PM_AREA_SN IN (   \r\n" + 
					"SELECT   \r\n" + 
					"H.CA_ID   \r\n" + 
					"FROM T_CO_AREA H   \r\n" + 
					"WHERE H.CA_TYPE='1'   \r\n" + 
					")"
					+ appendStr
					+ " %s ORDER BY PM_PRODUCT_STEP ASC,PM_AREA_SN ASC,PM_TRACK ASC,PM_SCHEDULE_DATE ASC";
			// 获取条件
			List<Condition> conditions = new ArrayList();
			// 组织机构
			if (!StringUtils.isEmpty(dataAuth)) {
				conditions.add(ds.new Condition("A", "DATA_AUTH", dataAuth));
			}
			// 生产阶别
			if (!StringUtils.isEmpty(step)) {
				conditions.add(ds.new Condition("A", "PM_PRODUCT_STEP", step));
			}
			// 工单号
			if (!StringUtils.isEmpty(projectId)) {
				conditions.add(ds.new Condition("A",
						Enums.conditionReference.rightLike, "PM_PROJECT_ID",
						projectId));
			}
			// 机种
			if (!StringUtils.isEmpty(material)) {
				conditions.add(ds.new Condition("A",
						Enums.conditionReference.rightLike, "PM_MODEL_CODE",
						material));
			}
			// if (!StringUtils.isEmpty(startTime)) {
			// conditions
			// .add(ds.new Condition(Enums.conditionReference.greaterEqual,
			// "TO_CHAR(PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS')",
			// startTime));
			// }
			// if (!StringUtils.isEmpty(endTime)) {
			// conditions
			// .add(ds.new Condition(Enums.conditionReference.lessEqual,
			// "TO_CHAR(PM_DUE_DATE,'YYYY-MM-DD HH24:MI:SS')",
			// endTime));
			// }

			List<Map> dataList = CommonMethod.Common.getDataList(sqlStr,
					conditions, null);
			// 构造甘特图对象
			WeekGantt gantt = new GetCommonInfo().new WeekGantt();
			gantt.setGanttDefault(startTime, endTime);
			gantt.createTask(dataList);
			gantt.getCapacity();
			gantt.calculate();// 进行甘特图数据计算
			return CommonMethod.Common.formatObjectToJson(gantt.instance());
		} catch (Exception ex) {
			log.error("getWeekGantt:",ex);
			return null;
		}
	}
    /**
     * 获取月排程数据
     * @param request
     * @return
     */
	public static String getMonthGantt(HttpServletRequest request){
		try{
			// 获取参数
			String dataAuth = request.getParameter("dataAuth");
			String step = request.getParameter("step");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			// 计划开始时间不处于时间段内：（状态不为2 & 计划开始时间要小于条件开始时间）
			// 计划开始时间处于时间段内：（状态不为2）
			// 计划开始时间和结束时间都不处于时间段内：（开始和结束时间都小于时间段的开始时间）这种工单不要
			String appendStr = String
					.format(" AND ((TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI:SS')>='%s' AND B.PROJECT_STATUS NOT <> '2') OR (TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')>='%s' AND TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND B.PROJECT_STATUS NOT <> '2'))",
							startTime, startTime,startTime, endTime);
			/*String appendStr = String
					.format(" AND (TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI:SS')<='%s' AND B.PROJECT_STATUS NOT IN ('2'))", endTime);*/
			//查询语句
			String sqlStr="SELECT\r\n" + 
		  	  "H.NAME DATA_AUTH_NAME,\r\n" + 
					"A.ID,\r\n" + 
					"A.DEPT_ID,\r\n" + 
					"A.CREATE_USER,\r\n" + 
					"A.CREATE_TIME,\r\n" + 
					"A.EDIT_USER,\r\n" + 
					"A.EDIT_TIME,\r\n" + 
					"A.DATA_AUTH,\r\n" + 
					"B.PROJECT_STEP,\r\n" + 
					"f_get_language(G.VALUE) AS STEP_NAME,\r\n" + 
					"A.PPW_DOC_NO,\r\n" + 
					"A.PPW_PROJECT_ID,\r\n" + 
					"B.PROJECT_STATUS,\r\n" + 
					"D.VALUE STATUS_VALUE,\r\n" + 
					"C.CI_ITEM_CODE,\r\n" + 
					"C.CI_ITEM_NAME,\r\n" + 
					"NVL(B.PRODUCT_COUNT,0) AS PRODUCT_COUNT,\r\n" + 
					"NVL(F.CST_STANDARD_TIME,0) AS CST_STANDARD_TIME,\r\n" + 
					"ROUND(NVL(B.PRODUCT_COUNT,0)*NVL(F.CST_STANDARD_TIME,0)/3600,2) AS TOTAL_NEED_TIME,\r\n" + 
					"NVL(A.PPW_PLAN_NUM,0) AS PPW_PLAN_NUM,\r\n" + 
					"NVL(A.PPW_NOW_NUM,0) AS PPW_NOW_NUM,\r\n" + 
					"ROUND(NVL(F.CST_STANDARD_TIME,0)*NVL(A.PPW_NOW_NUM,0)/3600,2) AS NEED_TIME,\r\n" + 
					"TO_DATE(TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PPW_START_DATE,\r\n" + 
					"TO_DATE(TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PPW_END_DATE,\r\n" + 
					"TO_DATE(TO_CHAR(A.PPW_DELIVERY_DATE,'YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI') AS PPW_DELIVERY_DATE,\r\n" + 
					"NVL(B.FQC_COUNT,0) AS FQC_COUNT,\r\n" + 
					"NVL(B.FINISH_COUNT,0) AS FINISH_COUNT,\r\n" + 
					"A.PPW_GROUP,\r\n" + 
					"A.PPW_PRE_TASK\r\n" + 
					"FROM T_PM_PLAN_INFO A\r\n" + 
					"LEFT JOIN T_PM_PROJECT_BASE B ON A.PPW_PROJECT_ID=B.PROJECT_ID\r\n" + 
					"LEFT JOIN SY_DICT_VAL G ON G.DICT_CODE='PROJECT_STEP' AND B.PROJECT_STEP=G.CODE\r\n" + 
					"LEFT JOIN T_CO_ITEM C ON B.PRODUCT_MATERIAL=C.CI_ITEM_CODE\r\n" + 
					"LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='PROJECT_STATUS' AND B.PROJECT_STATUS=D.CODE\r\n" + 
					"LEFT JOIN (\r\n" + 
					"SELECT\r\n" + 
					"E.CST_MODEL_CODE,\r\n" + 
					"E.CST_STEP_CODE,\r\n" + 
					"NVL(SUM(E.CST_STANDARD_TIME),0) AS CST_STANDARD_TIME\r\n" + 
					"FROM T_CO_STANDARD_TIME E\r\n" + 
					"WHERE E.CST_SCHEDULE_FLAG='Y'\r\n" + 
					"GROUP BY E.CST_MODEL_CODE,E.CST_STEP_CODE\r\n" + 
					") F ON B.PRODUCT_MATERIAL=F.CST_MODEL_CODE AND B.PROJECT_STEP=F.CST_STEP_CODE\r\n" + 
					"LEFT JOIN SY_DEPT H ON A.DATA_AUTH=H.ID\r\n" + 
					"WHERE 1=1\r\n" + 
					appendStr + 
					" %s ORDER BY B.PROJECT_STEP ASC,A.PPW_START_DATE ASC";
			// 获取条件
			List<Condition> conditions = new ArrayList();
			// 组织机构
			if (!StringUtils.isEmpty(dataAuth)) {
				conditions.add(ds.new Condition("A", "DATA_AUTH", dataAuth));
				conditions.add(ds.new Condition("B", "DATA_AUTH", dataAuth));
			  conditions.add(ds.new Condition("C", "DATA_AUTH", dataAuth));
			}
			// 阶别
			if (!StringUtils.isEmpty(step)) {
				conditions.add(ds.new Condition("B", "PROJECT_STEP", step));
			}
			List<Map> dataList = CommonMethod.Common.getDataList(sqlStr,
					conditions, null);
			// 构造甘特图对象
			MonthGantt gantt = new GetCommonInfo().new MonthGantt();
			gantt.setGanttDefault(startTime, endTime);
			gantt.createTask(dataList);
			gantt.getCapacity();
			gantt.calculate();// 进行甘特图数据计算
			return CommonMethod.Common.formatObjectToJson(gantt.instance());
		}
		catch(Exception ex){
			log.error("getMonthGantt:",ex);
			return null;
		}
	}
	/**
	 * 验证月排程月排产单是否可以删除
	 * msg:0-校验成功 1-执行失败  2-存在已下达的制令单
	 * returnMap：docNum-月排产单；msg-提示信息；
	 * @param request
	 * @return
	 */
	public static List validateMonthCanToDelete(HttpServletRequest request){
		try{
			Map<String,Object> returnMap=new HashMap();
			List returnList=new ArrayList();
			String planDocList = request.getParameter("planDocList");
			List<Map> planDocMaps = CommonMethod.Common.jsonStr2Map(planDocList);
			Object doc=null;
			List<Map> dataList;
			//校验是否存在已下达的制令单
			String sqlStr="SELECT\r\n" + 
					"COUNT(1) COUNT\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"LEFT JOIN T_PM_PLAN_INFO B ON A.PM_PLAN_ID=B.ID\r\n" + 
					"WHERE B.PPW_DOC_NO=?";
			for(Map map:planDocMaps){
				doc=map.get("planDoc");
				if(null==doc){
					continue;
				}
				dataList=modelService.listDataSql(sqlStr,new Object[]{doc});
				if(null==dataList){
					returnMap.put("docNum", doc.toString());
					returnMap.put("msg", 1);
					returnList.add(returnMap);
					return returnList;
				}
				else {
					if(Integer.parseInt(dataList.get(0).get("COUNT").toString())>0){
						returnMap.put("docNum", doc.toString());
						returnMap.put("msg", 2);
						returnList.add(returnMap);
						return returnList;
					}
				}
			}
			returnMap.put("docNum", "");
			returnMap.put("msg", 0);
			returnList.add(returnMap);
			return returnList;
		}
		catch(Exception ex){
			log.error("validateMonthCanToDelete:",ex);
			return null;
		}
	}
	
	/**
	 * 获取拆分数据
	 * @param request
	 * @return
	 */
	public static List getSplitInfo(HttpServletRequest request){
		try{
			// 获取参数
			String planDoc = request.getParameter("planDoc");
			String sqlStr="SELECT \r\n" + 
					"A.PPW_DOC_NO,\r\n" + 
					"A.PPW_PROJECT_ID,\r\n" + 
					"B.PROJECT_STATUS,\r\n" + 
					"C.VALUE AS STATUS_NAME,\r\n" + 
					"B.PROJECT_STEP,\r\n" + 
					"f_get_language(D.VALUE) AS STEP_NAME,\r\n" + 
					"E.CI_ITEM_CODE,\r\n" + 
					"E.CI_ITEM_NAME,\r\n" + 
					"NVL(B.PRODUCT_COUNT,0) AS PRODUCT_COUNT,\r\n" + 
					"NVL(B.FQC_COUNT,0) AS FQC_COUNT,\r\n" + 
					"NVL(B.FINISH_COUNT,0) AS FINISH_COUNT,\r\n" + 
					"NVL(A.PPW_NOW_NUM,0) AS PPW_NOW_NUM,\r\n" + 
					"TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI:SS') AS PPW_START_DATE,\r\n" + 
					"TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI:SS') AS PPW_END_DATE\r\n" + 
					"FROM T_PM_PLAN_INFO A\r\n" + 
					"LEFT JOIN T_PM_PROJECT_BASE B ON A.PPW_PROJECT_ID=B.PROJECT_ID\r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PROJECT_STATUS' AND B.PROJECT_STATUS=C.CODE\r\n" + 
					"LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='PROJECT_STEP' AND B.PROJECT_STEP=D.CODE\r\n" + 
					"LEFT JOIN T_CO_ITEM E ON B.PRODUCT_MATERIAL=E.CI_ITEM_CODE\r\n" + 
					"WHERE A.PPW_DOC_NO=?";
			return modelService.listDataSql(sqlStr,new Object[]{planDoc});
		}
		catch(Exception ex){
			log.error("getSplitInfo:",ex);
			return null;
		}
	}
	
	/**
	 * 手动获取单个线体产能，不附带任务信息
	 * 
	 * @param request
	 * @return
	 */
	public final static String getSingleLineWorkTime(HttpServletRequest request) {
		try {
			String dataAuth = request.getParameter("dataAuth");
			String line = request.getParameter("line");
			String startPlanTime = request.getParameter("startPlanTime");
			String endPlanTime = request.getParameter("endPlanTime");
			String sqlStr = "SELECT\r\n" 
			        + "A.CA_ID,\r\n" 
					+ "A.CA_NAME,\r\n"
					+ "NVL(A.CA_TRACK_FLAG,'N') AS CA_TRACK_FLAG\r\n"
					+ "FROM T_CO_AREA A\r\n" + "WHERE A.CA_ID=?\r\n"
					+ "AND A.CA_TYPE='1'";
			List dataList = modelService.listDataSql(sqlStr,
					new Object[] { line });
			if (null == dataList || dataList.size() <= 0) {
				return null;
			}
			Map areaInfoMap=(Map) dataList.get(0);
			// 构造甘特图对象
			WeekGantt gantt = new GetCommonInfo().new WeekGantt();
			gantt.setDateTime(line,startPlanTime, endPlanTime);
			gantt.putArea(line, areaInfoMap);
			gantt.getCapacity();
			gantt.calculate();// 进行甘特图数据计算
			return CommonMethod.Common.formatObjectToJson(gantt.instance());
		} catch (Exception ex) {
			log.error("getSingleLineWorkTime:",ex);
			return null;
		}
	}
	
	/**
	 * 手动获取单个阶别产能，不附带任务信息
	 * 
	 * @param request
	 * @return
	 */
	public final static String getSingleStepWorkTime(HttpServletRequest request) {
		try {
			// 获取参数
			String stepSn = request.getParameter("stepSn");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String sqlStr = "SELECT\r\n" + 
					"A.CODE,\r\n" + 
					"f_get_language(A.VALUE) AS VALUE\r\n" + 
					"FROM SY_DICT_VAL A\r\n" + 
					"WHERE A.DICT_CODE='PROJECT_STEP' AND A.CODE=?";
			List dataList = modelService.listDataSql(sqlStr,
					new Object[] { stepSn });
			if (null == dataList || dataList.size() <= 0) {
				return null;
			}
			MonthGantt gantt = new GetCommonInfo().new MonthGantt();
			gantt.setGanttDefault(startTime, endTime);
			gantt.setStepDateTime(stepSn,startTime, endTime);
			gantt.putStep(stepSn, ((Map) dataList.get(0)).get("VALUE"));
			gantt.getCapacity();
			gantt.calculate();// 进行甘特图数据计算
			return CommonMethod.Common.formatObjectToJson(gantt.instance());
		} catch (Exception ex) {
			log.error("getSingleStepWorkTime:",ex);
			return null;
		}
	}

	/**
	 * 保存下达信息
	 * 
	 * @param request
	 * @return
	 */
	public static Boolean saveTransmit(HttpServletRequest request,
			ModelAction modelAction, ModelService modelService) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			String tasks = request.getParameter("tasks");
			String planId = request.getParameter("planId");// 月排程数据ID
			List<Map> taskMaps = CommonMethod.Common.jsonStr2Map(tasks);
			Boolean returnResult = true;
			String taskOpt = null;
			for (Map task : taskMaps) {
				// 获取task操作标识
				taskOpt = CommonMethod.Common
						.validateValue(task.get("taskOpt"));
				task.remove("taskOpt");
				// 制令单物料信息赋值
				task = getTransmitItemInfo(task);
				// 保存制令单对象
				if (!StringUtils.isEmpty(taskOpt)) {
					// 操作task
					if (!saveTask(task, modelAction, modelService,
							ganttTaskOpt.valueOf(taskOpt),TABLE_PM_MO_BASE)) {
						hbtran.rollback();// 错误时，回滚数据
						return false;
					}
				}
				// 修改月排程已排产数量
				// Object planNum=task.get("PM_TARGET_QTY");
				// planNum=planNum!=null?Integer.parseInt(planNum.toString()):0;
				// String
				// sqlStr="UPDATE T_PM_PLAN_INFO SET PPW_NOW_NUM=NVL(PPW_NOW_NUM,0)+? WHERE ID=?";
				// if(modelService.execSql(sqlStr,new
				// Object[]{planNum,planId})<=0){
				// hbtran.rollback();// 错误时，回滚数据
				// return false;
				// }
			}
			hbtran.commit();// 提交数据
			return true;
		} catch (Exception ex) {
			log.error("saveTransmit:",ex);
			hbtran.rollback();// 错误时，回滚数据
			return false;
		}
	}

	/**
	 * 获取工单信息 IN
	 * @param request
	 * @return
	 */
	public static List getProjectByContian(HttpServletRequest request){
		try{
			String projects = request.getParameter("projects");
			String strSql="SELECT\r\n" + 
					"A.ID, \r\n" + 
					"A.DEPT_ID, \r\n" + 
					"A.CREATE_USER, \r\n" + 
					"TO_CHAR(A.CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') AS CREATE_TIME,\r\n" + 
					"A.EDIT_USER, \r\n" + 
					"TO_CHAR(A.EDIT_TIME,'YYYY-MM-DD HH24:MI:SS') AS EDIT_TIME,\r\n" + 
					"A.DATA_AUTH, \r\n" + 
					"A.PROJECT_STEP,\r\n" + 
					"A.PROJECT_ID,\r\n" + 
					"A.PROJECT_STATUS, \r\n" + 
					"f_get_language(B.VALUE) AS STEP_NAME,\r\n" + 
					"C.VALUE STATUS_VALUE, \r\n" + 
					"D.CI_ITEM_CODE, \r\n" + 
					"D.CI_ITEM_NAME,\r\n" + 
					"NVL(A.PRODUCT_COUNT,0) AS PRODUCT_COUNT, \r\n" + 
					"NVL(F.CST_STANDARD_TIME,0) AS CST_STANDARD_TIME, \r\n" + 
					"ROUND(NVL(A.PRODUCT_COUNT,0)*NVL(F.CST_STANDARD_TIME,0)/3600,2) AS TOTAL_NEED_TIME, \r\n" + 
					"TO_CHAR(A.PROLEPSIS_START_DATE,'YYYY-MM-DD HH24:MI:SS') AS PROLEPSIS_START_DATE, \r\n" + 
					"TO_CHAR(A.PROLEPSIS_END_DATE,'YYYY-MM-DD HH24:MI:SS') AS PROLEPSIS_END_DATE, \r\n" + 
					"TO_CHAR(A.TPPB_PLAN_DELIVERY_DATE,'YYYY-MM-DD HH24:MI:SS') AS TPPB_PLAN_DELIVERY_DATE, \r\n" + 
					"NVL(A.FQC_COUNT,0) AS FQC_COUNT, \r\n" + 
					"NVL(A.FINISH_COUNT,0) AS FINISH_COUNT,\r\n" + 
					"NVL(A.PRODUCT_COUNT,0)-NVL(I.SUM_NOW_NUM,0) AS CANPLAN\r\n" + 
					"FROM T_PM_PROJECT_BASE A\r\n" + 
					"LEFT JOIN SY_DICT_VAL B ON B.DICT_CODE='PROJECT_STEP' AND A.PROJECT_STEP=B.CODE \r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PROJECT_STATUS' AND A.PROJECT_STATUS=C.CODE\r\n" + 
					"LEFT JOIN T_CO_ITEM D ON A.PRODUCT_MATERIAL=D.CI_ITEM_CODE\r\n" + 
					"LEFT JOIN ( \r\n" + 
					"SELECT \r\n" + 
					"E.CST_MODEL_CODE, \r\n" + 
					"E.CST_STEP_CODE, \r\n" + 
					"NVL(SUM(E.CST_STANDARD_TIME),0) AS CST_STANDARD_TIME \r\n" + 
					"FROM T_CO_STANDARD_TIME E \r\n" + 
					"WHERE E.CST_SCHEDULE_FLAG='Y' \r\n" + 
					"GROUP BY E.CST_MODEL_CODE,E.CST_STEP_CODE \r\n" + 
					") F ON A.PRODUCT_MATERIAL=F.CST_MODEL_CODE AND A.PROJECT_STEP=F.CST_STEP_CODE\r\n" + 
					"LEFT JOIN (\r\n" + 
					"SELECT\r\n" + 
					"H.PPW_PROJECT_ID,\r\n" + 
					"NVL(SUM(H.PPW_NOW_NUM),0) SUM_NOW_NUM\r\n" + 
					"FROM T_PM_PLAN_INFO H\r\n" + 
					"GROUP BY H.PPW_PROJECT_ID\r\n" + 
					") I ON A.PROJECT_ID=I.PPW_PROJECT_ID\r\n" + 
					"WHERE A.PROJECT_ID IN ("+projects+")";
			return modelService.listDataSql(strSql);
		}
		catch(Exception ex){
			log.error("getProjectByContian:",ex);
			return null;
		}
	}
	
	/**
	 * 保存拆分信息
	 * @param request
	 * @param modelAction
	 * @param modelService
	 * @return
	 */
	public static Boolean saveSplit(HttpServletRequest request,
			ModelAction modelAction, ModelService modelService){
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try{
			String tasks = request.getParameter("tasks");
			List<Map> taskMaps = CommonMethod.Common.jsonStr2Map(tasks);
			Boolean returnResult = true;
			String taskOpt = null;
			for (Map task : taskMaps) {
				// 获取task操作标识
				taskOpt = CommonMethod.Common
						.validateValue(task.get("taskOpt"));
				task.remove("taskOpt");
				// 保存月排程信息
				if (!StringUtils.isEmpty(taskOpt)) {
					// 操作task
					if (!saveTask(task, modelAction, modelService,
							ganttTaskOpt.valueOf(taskOpt),TABLE_PM_PLAN_INFO)) {
						hbtran.rollback();// 错误时，回滚数据
						return false;
					}
				}
			}
			hbtran.commit();// 提交数据
			return true;
		}
		catch(Exception ex){
			log.error("saveSplit:",ex);
			hbtran.rollback();// 错误时，回滚数据
			return false;
		}
	}
	
	/**
	 * 删除制令单
	 * 
	 * @param request
	 * @return
	 */
	public static Boolean deleteTask(HttpServletRequest request,
			ModelService modelService) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			String moList = request.getParameter("moNumberList");
			List<Map> moMaps = CommonMethod.Common.jsonStr2Map(moList);
			String strSql = "DELETE FROM T_PM_MO_BASE A WHERE A.PM_MO_NUMBER=?";
			for (Map map : moMaps) {
				if (modelService.execSql(strSql,
						new Object[] { map.get("moNumber") }) <= 0) {
					hbtran.rollback();
					return false;
				}
			}
			hbtran.commit();
			return true;
		} catch (Exception ex) {
			log.error("deleteTask:", ex);
			hbtran.rollback();
			return false;
		}
	}
	
	/**
	 * 删除月排产单
	 * 
	 * @param request
	 * @return
	 */
	public static Boolean deleteMonthPlanTask(HttpServletRequest request,
			ModelService modelService) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			String docList = request.getParameter("planDocList");
			List<Map> docMaps = CommonMethod.Common.jsonStr2Map(docList);
			String strSql = "DELETE FROM T_PM_PLAN_INFO A WHERE A.PPW_DOC_NO=?";
			for (Map map : docMaps) {
				if (modelService.execSql(strSql,
						new Object[] { map.get("planDoc") }) <= 0) {
					hbtran.rollback();
					return false;
				}
			}
			hbtran.commit();
			return true;
		} catch (Exception ex) {
			log.error("deleteMonthPlanTask:",ex);
			hbtran.rollback();
			return false;
		}
	}

	/**
	 * 新增月排产单时，生产月排产单号
	 * @return
	 */
	public static List getMonthPlanDoc(HttpServletRequest request,
			ModelAction modelAction, ModelService modelService){
		try{
			String prefix = request.getParameter("prefix");
			ProFuncDto pf = new ProFuncDto();
			int[] inPlace = { 1, 2, 3 };
			int[] outplace = { 4, 5 };
			List<Object> list = new ArrayList<Object>();
			List<Object> outType = new ArrayList<Object>();
			list.add(modelAction.getCurrUser().getDeptId());
			list.add(prefix);
			list.add("");
			outType.add("String");
			outType.add("String");
			pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
			pf.setInPlace(inPlace);// 存储过程中in
			pf.setOutPlace(outplace); // 存储过程中out
			pf.setValArgs(list);// 存储过程中输入的参数
			pf.setTotalLen(list.size() + outType.size());// 总个数
			pf.setOutValType(outType);// 输出的参数
			return modelService.procComm(pf);// 接收返回值
		}
		catch(Exception ex){
			log.error("getMonthPlanDoc:",ex);
			return null;
		}
	}
	
	/**
	 * 下达时替换制令单物料相关的信息
	 * 
	 * @param map
	 * @return
	 */
	public static Map getTransmitItemInfo(Map map) {
		try {
			// 物料信息
			String strSql = "SELECT\r\n"
					+ "NVL(A.CI_LINK_NUM,NVL(T.CIG_LINK_NUM,1)) PM_UNIT_NUM,\r\n"
					+ "NVL(A.CI_JIGSAW_NUM,NVL(T.CIG_SN_NUM,1)) PM_JIGSAW_NUM,\r\n"
					+ "NVL(A.CI_SN_RULE_B,T.CIG_SN_RULE_B) PM_SN_RULE,\r\n"
					+ "NVL(A.CI_SN_RULE_S,T.CIG_SN_RULE_S) PM_SUB_RULE,\r\n"
					+ "NVL(A.CI_REPAIR_MAX,NVL(T.CIG_REPAIR_MAX,0)) PM_REPAIR_MAX,\r\n"
					+ "NVL(A.CI_SCRAP_FLAG,T.CIG_REJ_FLAG) PM_ERROR_SCRAP,\r\n"
					+ "NVL(A.CI_AUTO_FQC,T.CIG_AUTO_FQC) PM_AUTO_FQC,\r\n"
					+ "NVL(A.CI_FQC_QTY,NVL(T.CIG_FQC_NUM,0)) PM_FQC_NUM,\r\n"
					+ "NVL(A.CI_CONTRAL_TYPE,NVL(T.CIG_CONTRAL_TYPE,1)) PM_CONTROL_TYPE\r\n"
					+ "FROM T_CO_ITEM A\r\n" + "LEFT JOIN (\r\n" + "SELECT\r\n"
					+ "C.CIC_ITEM_CODE,\r\n" + "B.CIG_LINK_NUM,\r\n"
					+ "B.CIG_SN_NUM,\r\n" + "B.CIG_SN_RULE_B,\r\n"
					+ "B.CIG_SN_RULE_S,\r\n" + "B.CIG_REPAIR_MAX,\r\n"
					+ "B.CIG_REJ_FLAG,\r\n" + "B.CIG_AUTO_FQC,\r\n"
					+ "B.CIG_FQC_NUM,\r\n" + "B.CIG_CONTRAL_TYPE\r\n"
					+ "FROM T_CO_ITEM_GROUP B \r\n"
					+ "LEFT JOIN T_CO_ITEM_CONNECT C ON B.CIG_SN=C.CIG_SN\r\n"
					+ "WHERE C.CIC_ITEM_CODE=?\r\n"
					+ ") T ON A.CI_ITEM_CODE=T.CIC_ITEM_CODE\r\n"
					+ "WHERE A.CI_ITEM_CODE=?\r\n" + "AND ROWNUM=1";
			Object itemCode = map.get("PM_MODEL_CODE");
			List<Map> dataList = modelService.listDataSql(strSql, new Object[] {
					itemCode, itemCode });
			if (dataList != null && dataList.size() > 0) {
				Map<String, Object> dataMap = dataList.get(0);
				for (Map.Entry<String, Object> m : dataMap.entrySet()) {
					map.put(m.getKey(), m.getValue());
				}
			}
			// PCB料号
			strSql = "SELECT\r\n" + "A.CBD_ITEM_CODE\r\n"
					+ "FROM T_PM_PROJECT_DETAIL A\r\n"
					+ "WHERE A.PROJECT_ID=?\r\n" + "AND A.CBD_ITEM_TYPE=1";
			dataList = modelService.listDataSql(strSql,
					new Object[] { map.get("PM_PROJECT_ID") });
			if (dataList == null || dataList.size() <= 0) {
				map.put("PM_PCB_CODE", null);
			} else {
				map.put("PM_PCB_CODE", dataList.get(0).get("CBD_ITEM_CODE"));
			}
			return map;
		} catch (Exception ex) {
			log.error("getTransmitItemInfo+",ex);
			return null;
		}
	}

	/**
	 * 保存周排程甘特图信息
	 * 
	 * @param request
	 * @return
	 */
	public static Boolean saveWeekGantt(HttpServletRequest request,
			ModelAction modelAction, ModelService modelService) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			String tasks = request.getParameter("tasks");
			List<Map> taskMaps = CommonMethod.Common.jsonStr2Map(tasks);
			String taskOpt = null;
			for (Map task : taskMaps) {
				// 获取task操作标识
				taskOpt = CommonMethod.Common
						.validateValue(task.get("taskOpt"));
				task.remove("taskOpt");
				if(ganttTaskOpt.insert==ganttTaskOpt.valueOf(taskOpt)){
					// 制令单物料信息赋值
					task = getTransmitItemInfo(task);
				}
				if (!StringUtils.isEmpty(taskOpt)) {
					// 操作task
					if (!saveTask(task, modelAction, modelService,
							ganttTaskOpt.valueOf(taskOpt),TABLE_PM_MO_BASE)) {
						hbtran.rollback();// 错误时，回滚数据
						return false;
					}
				}
			}
			hbtran.commit();// 提交数据
			return true;
		} catch (Exception ex) {
			hbtran.rollback();// 错误时，回滚数据
			log.error("saveWeekGantt:",ex);
			return false;
		}
	}

	/**
	 * 保存月排程甘特图信息
	 * 
	 * @param request
	 * @return
	 */
	public static Boolean saveMonthGantt(HttpServletRequest request,
			ModelAction modelAction, ModelService modelService) {
		MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
		try {
			String tasks = request.getParameter("tasks");
			List<Map> taskMaps = CommonMethod.Common.jsonStr2Map(tasks);
			String taskOpt = null;
			String projectId=null;//工单号
			String pStart=null;//工单起始时间（相同工单的最早起始时间）
			String pEnd=null;//工结束时间（相同工单的最晚结束时间）
			for (Map task : taskMaps) {
				// 获取task操作标识
				taskOpt = CommonMethod.Common
						.validateValue(task.get("taskOpt"));
				task.remove("taskOpt");
				pStart=CommonMethod.Common
						.validateValue(task.get("pStart"));
				pEnd=CommonMethod.Common
						.validateValue(task.get("pEnd"));
				task.remove("pStart");
				task.remove("pEnd");
				projectId=CommonMethod.Common
						.validateValue(task.get("PPW_PROJECT_ID"));
				//保存月排程表信息
				if (!StringUtils.isEmpty(taskOpt)) {
					// 操作task
					if (!saveTask(task, modelAction, modelService,
							ganttTaskOpt.valueOf(taskOpt),TABLE_PM_PLAN_INFO)) {
						hbtran.rollback();// 错误时，回滚数据
						return false;
					}
				}
				//保存工单信息
				if(!updatePorjectInfo(projectId,pStart,pEnd)){
					hbtran.rollback();// 错误时，回滚数据
					return false;
				}
			}
			hbtran.commit();// 提交数据
			return true;
		} catch (Exception ex) {
			hbtran.rollback();// 错误时，回滚数据
			log.error("saveMonthGantt:" ,ex);
			return false;
		}
	}

	/**
	 * 月排程中排产单改变时更新工单信息
	 * @return
	 */
	public static Boolean updatePorjectInfo(String projectId,String startDate,String endDate){
		try{
			int isSuc=-1;
			if(null!=projectId && null!=startDate && null!=endDate){
				String sqlStr="UPDATE T_PM_PROJECT_BASE A\r\n" + 
						"SET A.PROLEPSIS_START_DATE=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),\r\n" + 
						"A.PROLEPSIS_END_DATE=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),\r\n" + 
						"A.PM_CHANGE_TIMES=NVL(A.PM_CHANGE_TIMES,0)+1\r\n" + 
						"WHERE A.PROJECT_ID=?";
				isSuc=modelService.execSql(sqlStr,new Object[]{startDate,endDate,projectId});
			}
			return isSuc > 0;
		}
		catch(Exception ex){
			log.error("updatePorjectInfo:"+ex.toString());
			return false;
		}
	}
	/**
	 * 保存甘特图任务数据
	 * 
	 * @param taskMap
	 * @param opt
	 * @return
	 */
	private final static Boolean saveTask(Map<String, Object> taskMap,
			ModelAction modelAction, ModelService modelService, ganttTaskOpt opt,String updateObj) {
		try {
			// 新增
			if (ganttTaskOpt.insert.equals(opt)) {
				// TableDataMapExt tableExt = new TableDataMapExt();
				// tableExt.setTableName(TABLE_PM_MO_BASE);
				// tableExt.getColMap().put("ID",
				// CommonMethod.Common.getUUID());
				// tableExt.setColMap(taskMap);
				// if (modelService.save(tableExt) <= 0) {
				// return false;
				// }
				String insertStr = "INSERT INTO "+updateObj+"(%s)VALUES(%s)";
				String colName = "";
				String colValue = "";
				List<Object> params = new ArrayList();
				String keyName = null;
				Object id = taskMap.get("ID");
				if(null!=id && !StringUtils.isEmpty(id.toString())){
					taskMap.put("ID", id);
				}
				else {
					taskMap.put("ID", CommonMethod.Common.getUUID());
				}
				for (Map.Entry<String, Object> map : taskMap.entrySet()) {
					keyName = map.getKey();
					colName += keyName + ",";
					if (moDateKey.contains(keyName)) {
						if (null == map.getValue()) {
							colValue += "?,";
						} else {
							colValue += "TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),";
						}
					} else {
						colValue += "?,";
					}
					params.add(map.getValue());
				}
                return modelService.execSql(String.format(insertStr,
                        colName.substring(0, colName.length() - 1),
                        colValue.substring(0, colValue.length() - 1)), params
                        .toArray()) > 0;
			}
			// 修改
			else if (ganttTaskOpt.update.equals(opt)) {
				// TableDataMapExt tableExt = new TableDataMapExt();
				// tableExt.setTableName(TABLE_PM_MO_BASE);
				// tableExt.setSqlWhere(" AND PM_MO_NUMBER=?");
				// tableExt.getSqlWhereArgs().add(taskMap.get("PM_MO_NUMBER"));
				// tableExt.setColMap(taskMap);
				// if (modelService.edit(tableExt) <= 0) {
				// return false;
				// }

				String updateStr = "UPDATE "+updateObj+" SET %s WHERE 1=1 %s";
				String colSet = "";
				String whereStr = " AND ID=?";
				Object id = taskMap.get("ID");
				List<Object> params = new ArrayList();
				String keyName = null;
				for (Map.Entry<String, Object> map : taskMap.entrySet()) {
					keyName = map.getKey();
					if (moDateKey.contains(keyName)) {
						if (null == map.getValue()) {
							colSet += keyName + "=?,";
						} else {
							colSet += keyName
									+ "=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),";
						}
					} else {
						colSet += keyName + "=?,";
					}
					params.add(map.getValue());
				}
				params.add(id);
                return modelService.execSql(String.format(updateStr,
                        colSet.substring(0, colSet.length() - 1), whereStr),
                        params.toArray()) > 0;
			}
			return true;
		} catch (Exception ex) {
			log.error("saveTask:" ,ex);
			return false;
		}
	}

	/**
	 * 转换对应键值的时间字段
	 */
	private final static ArrayList moDateKey = new ArrayList() {
		{
			//制令单
			add("PM_ISSUED_DATE");
			add("PM_ALTER_DATE");
			add("PM_SCHEDULE_DATE");
			add("PM_DUE_DATE");
			add("PM_START_DATE");
			add("PM_CLOSE_DATE");
			//月排程单
			add("PPW_START_DATE");
			add("PPW_END_DATE");
			add("PPW_DELIVERY_DATE");
			//公用
			add("CREATE_TIME");
			add("EDIT_TIME");
		}
	};

	/**
	 * 获取工厂日历ID
	 * 
	 * @param areaSn
	 * @param startPlanTime
	 * @param endPlanTime
	 * @return
	 */
	private static String getCalendarId(String areaSn, String startPlanTime,
			String endPlanTime) {
		try {
			Date startDate = CommonMethod.Common.convertStr2Date(startPlanTime);
			Date endDate = CommonMethod.Common.convertStr2Date(endPlanTime);
			int startMonth = startDate.getMonth() + 1;
			int endMonth = endDate.getMonth() + 1;

			// 获取工厂日历ID（A：取对应线体，对应月份；B：取对应月分；C：取默认）
			String strSql = "SELECT \r\n" + "T.ID AS CAL_ID,\r\n"
					+ "T.CAL_SAT_FLAG AS PPC_SAT_FLAG,\r\n"
					+ "T.CAL_SUN_FLAG AS PPC_SUN_FLAG\r\n" + "FROM (\r\n"
					+ "SELECT \r\n" + "B.ID,\r\n" + "B.CAL_SAT_FLAG,\r\n"
					+ "B.CAL_SUN_FLAG\r\n" + "FROM T_CO_CALENDAR_LINE A\r\n"
					+ "LEFT JOIN T_CO_CALENDAR B ON A.CAL_ID=B.ID\r\n"
					+ "WHERE A.AREA_ID=?\r\n" 
					+ "ORDER BY B.CAL_DEFAULT_FLAG ASC,B.CAL_NAME ASC ) T\r\n"
					+ "WHERE ROWNUM=1";
			List dataList = modelService.listDataSql(strSql, new Object[] {areaSn });
			if (dataList == null || dataList.size() <= 0) {
				strSql = "SELECT \r\n"
						+ "T.ID AS CAL_ID,\r\n"
						+ "T.CAL_SAT_FLAG AS PPC_SAT_FLAG,\r\n"
						+ "T.CAL_SUN_FLAG AS PPC_SUN_FLAG\r\n"
						+ "FROM (\r\n"
						+ "SELECT \r\n"
						+ "B.ID,\r\n"
						+ "B.CAL_SAT_FLAG,\r\n"
						+ "B.CAL_SUN_FLAG\r\n"
						+ "FROM T_CO_CALENDAR B\r\n"
						+ "WHERE B.CAL_DEFAULT_FLAG='Y'\r\n"
						+ "ORDER BY B.CAL_DEFAULT_FLAG ASC,B.CAL_NAME ASC ) T\r\n"
						+ "WHERE ROWNUM=1";
				dataList = modelService.listDataSql(strSql);
				if (dataList == null || dataList.size() <= 0) {
					return null;
				}
			}
			return Common.validateValue(((Map) dataList.get(0)).get("CAL_ID"));

		} catch (Exception ex) {
			log.error("getCalendarId:" ,ex);
			return null;
		}
	}

	/**
	 * 获取工厂日历主表
	 * 
	 * @param areaSn
	 * @param startPlanTime
	 * @param endPlanTime
	 * @return
	 */
	private static Map getCalendarMasterInfo(String areaSn,
			Object startPlanTime, Object endPlanTime) {
		try {
			Date startDate = CommonMethod.Common.convertObject2Date(startPlanTime);
			Date endDate = CommonMethod.Common.convertObject2Date(endPlanTime);
			int startMonth = startDate.getMonth() + 1;
			int endMonth = endDate.getMonth() + 1;

			// 获取工厂日历ID（A：取对应线体，对应月份；B：取对应月分；C：取默认）
			String strSql = "SELECT \r\n" + "T.ID AS CAL_ID,\r\n"
					+ "T.CAL_SAT_FLAG AS PPC_SAT_FLAG,\r\n"
					+ "T.CAL_SUN_FLAG AS PPC_SUN_FLAG\r\n" + "FROM (\r\n"
					+ "SELECT \r\n" + "B.ID,\r\n" + "B.CAL_SAT_FLAG,\r\n"
					+ "B.CAL_SUN_FLAG\r\n" + "FROM T_CO_CALENDAR_LINE A\r\n"
					+ "LEFT JOIN T_CO_CALENDAR B ON A.CAL_ID=B.ID\r\n"
					+ "WHERE A.AREA_ID=?\r\n"
					+ "ORDER BY B.CAL_DEFAULT_FLAG ASC,B.CAL_NAME ASC ) T\r\n"
					+ "WHERE ROWNUM=1";
			List dataList = modelService.listDataSql(strSql, new Object[] {areaSn });

			if (dataList == null || dataList.size() <= 0) {
				strSql = "SELECT \r\n"
						+ "T.ID AS CAL_ID,\r\n"
						+ "T.CAL_SAT_FLAG AS PPC_SAT_FLAG,\r\n"
						+ "T.CAL_SUN_FLAG AS PPC_SUN_FLAG\r\n"
						+ "FROM (\r\n"
						+ "SELECT \r\n"
						+ "B.ID,\r\n"
						+ "B.CAL_SAT_FLAG,\r\n"
						+ "B.CAL_SUN_FLAG\r\n"
						+ "FROM T_CO_CALENDAR B\r\n"
						+ "WHERE B.CAL_DEFAULT_FLAG='Y'\r\n"
						+ "ORDER BY B.CAL_DEFAULT_FLAG ASC,B.CAL_NAME ASC ) T\r\n"
						+ "WHERE ROWNUM=1";
				dataList = modelService.listDataSql(strSql);
				if (dataList == null || dataList.size() <= 0) {
					return null;
				}
			}
			return (Map) dataList.get(0);

		} catch (Exception ex) {
			log.error("getCalendarId:" ,ex);
			return null;
		}
	}

	/**
	 * 获取上班时长(正常上班时间-工作内休息时间)
	 * 
	 * @return
	 */
	private static double getWorkTime(String calendarId) {
		try {
			if (StringUtils.isEmpty(calendarId)) {
				return 0;
			}
			// 获取工厂日历信息
			String strSql = "SELECT\r\n"
					+ "SUM(NVL(T.DURATIONMIN,0)) DURATIONMIN\r\n"
					+ "FROM (\r\n"
					+ "SELECT\r\n"
					+ "A.CALW_START,\r\n"
					+ "A.CALW_END,\r\n"
					+ "A.CALW_INTER_DAY,\r\n"
					+ "DECODE(A.CALW_INTER_DAY,'Y',CEIL((((A.CALW_END+1)- A.CALW_START))*24*60),CEIL(((A.CALW_END- A.CALW_START))*24*60))-NVL(A.CALW_REST_TOTAL,0) AS DURATIONMIN\r\n"
					+ "FROM T_CO_CALENDAR_WORKTIME A\r\n"
					+ "WHERE A.CAL_ID=?\r\n" + ")T";
			List dataList = modelService.listDataSql(strSql,
					new Object[] { calendarId });
			if (dataList == null || dataList.size() <= 0) {
				return 0;
			} else {
				BigDecimal workTime = Common.validateValue(((Map) dataList
						.get(0)).get("DURATIONMIN"));
				return workTime.doubleValue();
			}
		} catch (Exception ex) {
			log.error("getWorkTime：" ,ex);
			return 0;
		}
	}

	/**
	 * 获取上班时间段
	 * 
	 * @return
	 */
	private static List getWorkTimeInfo(String calendarId) {
		try {
			if (StringUtils.isEmpty(calendarId)) {
				return null;
			}
			// 获取工厂日历信息(ORDER BY 排序不要改变，若需要改变，不能影响之前的排序顺序)
			String strSql = "SELECT\r\n"
					+ "TO_CHAR(A.CALW_START,'HH24:MI') AS STARTTIME,\r\n"
					+ "TO_CHAR(A.CALW_END,'HH24:MI') AS ENDTIME,\r\n"
					+ "NVL(A.CALW_INTER_DAY,'N') AS CALW_INTER_DAY\r\n"
					+ "FROM T_CO_CALENDAR_WORKTIME A\r\n"
					+ "WHERE A.CAL_ID=? ORDER BY A.CALW_START ASC";
			return modelService
					.listDataSql(strSql, new Object[] { calendarId });
		} catch (Exception ex) {
			log.error("getWorkTimeInfo：" ,ex);
			return null;
		}
	}

	/**
	 * 获取上班内的休息时间段
	 * 
	 * @return
	 */
	private static List getRestTimeInfo(String calendarId) {
		try {
			if (StringUtils.isEmpty(calendarId)) {
				return null;
			}
			// 获取工厂日历信息
			String strSql = "SELECT\r\n" + 
					"TO_CHAR(A.CALR_START,'HH24:MI') AS STARTTIME,\r\n" + 
					"TO_CHAR(A.CALR_END,'HH24:MI') AS ENDTIME,\r\n" + 
					"B.CALW_INTER_DAY\r\n" + 
					"FROM T_CO_CALENDAR_RESTTIME A\r\n" + 
					"LEFT JOIN T_CO_CALENDAR_WORKTIME B ON A.CALW_ID=B.ID\r\n" + 
					"WHERE B.CAL_ID=? \r\n" + 
					"ORDER BY A.CALR_START ASC";
			return modelService
					.listDataSql(strSql, new Object[] { calendarId });
		} catch (Exception ex) {
			log.error("getWorkTimeInfo：" ,ex);
			return null;
		}
	}

	/**
	 * 获取产能日历主表信息
	 * 
	 * @param areaSn
	 * @return
	 */
	private static List getPlanCalendarInfo(String areaSn) {
		try {
			if (StringUtils.isEmpty(areaSn)) {
				return null;
			}
			String strSql = "SELECT\r\n" + "NVL(A.PPC_SAT_FLAG,'N') AS PPC_SAT_FLAG,\r\n"
					+ "NVL(A.PPC_SUN_FLAG,'N') AS PPC_SUN_FLAG\r\n" + "FROM T_PM_PLAN_CALENDAR A\r\n"
					+ "WHERE A.PPC_AREA_SN=?\r\n" + "AND ROWNUM=1";
			return modelService.listDataSql(strSql, new Object[] { areaSn });
		} catch (Exception ex) {
			log.error("getPlanCalendar:" ,ex);
			return null;
		}
	}

	/**
	 * 获取例外明细信息
	 * 
	 * @param areaSn
	 * @param exceptionType
	 * @param year
	 * @param month
	 * @return
	 */
	private static List getException(String areaSn, Object startPlanTime,
			Object endPlanTime) {
		try {
			if (StringUtils.isEmpty(areaSn)) {
				return null;
			}
			String start=CommonMethod.Common.date2String(CommonMethod.Common.convertObject2Date(startPlanTime), "yyyy-MM-dd HH:mm:00");
			String end=CommonMethod.Common.date2String(CommonMethod.Common.convertObject2Date(endPlanTime), "yyyy-MM-dd HH:mm:00");
			String strSql = "SELECT\r\n" + "NVL(A.PPC_SAT_FLAG,'N') AS PPC_SAT_FLAG,\r\n"
					+ "NVL(A.PPC_SUN_FLAG,'N') AS PPC_SUN_FLAG\r\n" + "FROM T_PM_PLAN_CALENDAR A\r\n"
					+ "WHERE A.PPC_AREA_SN=?\r\n" + "AND ROWNUM=1";
			List dataList = modelService.listDataSql(strSql,
					new Object[] { areaSn });
			if (dataList.size() <= 0) {
				return null;
			}

			// 例外信息
			strSql = "SELECT\r\n" + "B.PPE_AREA_SN,\r\n"
					+ "B.PPE_EXECPTION_TYPE,    \r\n" + "B.PPE_BEGIN_TIME,\r\n"
					+ "B.PPE_END_TIME,\r\n" + "B.PPE_DURATION,\r\n"
					+ "NVL(A.PPC_SAT_FLAG,'N') AS PPC_SAT_FLAG,\r\n" + "NVL(A.PPC_SUN_FLAG,'N') AS PPC_SUN_FLAG,\r\n"
					+ "NVL(A.PPC_DEFAULT_FLAG,'N') AS PPC_DEFAULT_FLAG,\r\n" + "A.PPC_PRODUCT_STEP\r\n"
					+ "FROM T_PM_PLAN_CALENDAR A\r\n"
					+ "LEFT JOIN T_PM_PLAN_EXECPTION B ON A.ID=B.PPC_ID\r\n"
					+ "WHERE 1=1 %s";
			List<Condition> conditions = new ArrayList();
			if (!StringUtils.isEmpty(areaSn)) {
				conditions.add(ds.new Condition("PPE_AREA_SN", areaSn));
			}
			if (!StringUtils.isEmpty(start)) {
				conditions.add(ds.new Condition(
						Enums.conditionReference.greaterEqual,
						"TO_CHAR(B.PPE_BEGIN_TIME,'YYYY-MM-DD HH24:MI:SS')",
						start));
			}
			if (!StringUtils.isEmpty(end)) {
				conditions.add(ds.new Condition(
						Enums.conditionReference.lessEqual,
						"TO_CHAR(B.PPE_END_TIME,'YYYY-MM-DD HH24:MI:SS')",
						end));
			}

			return CommonMethod.Common.getDataList(strSql, conditions, null);
		} catch (Exception ex) {
			log.error("");
			return null;
		}
	}

	/**
	 * 获取线体系数
	 * 
	 * @param area
	 * @return
	 */
	public static List getCoefficient(String areaSn) {
		try {
			String strSql = "SELECT\r\n"
					+ "NVL(B.PPQ_DEVICE_QUOTIETY,1) PPQ_DEVICE_QUOTIETY,\r\n"
					+ "NVL(B.PPQ_MANPOWER_QUOTIETY,1) PPQ_MANPOWER_QUOTIETY,\r\n"
					+ "NVL(B.PPQ_EFFICIENCY_QUOTIETY,1) PPQ_EFFICIENCY_QUOTIETY,\r\n"
					+ "NVL(B.PPQ_QUALITY_QUOTIETY,1) PPQ_QUALITY_QUOTIETY,\r\n"
					+ "NVL(B.PPQ_DUAL_QUOTIETY,1) PPQ_DUAL_QUOTIETY\r\n"
					+ "FROM T_PM_PLAN_QUOTIETY B\r\n"
					+ "WHERE B.PPQ_AREA_SN=?\r\n" + "AND ROWNUM=1";
			return modelService.listDataSql(strSql, new Object[] { areaSn });
		} catch (Exception ex) {
			log.error("getCoefficient:" ,ex);
			return null;
		}
	}

	/**
	 * 获取下达信息
	 * 
	 * @return
	 */
	public final static List getExpectInfo(HttpServletRequest request) {
		try {
			String id = request.getParameter("dataid");
			if (StringUtils.isEmpty(id)) {
				return null;
			}
			String sqlStr = "SELECT   \r\n" + 
					"A.DATA_AUTH,   \r\n" + 
					"B.PROJECT_ID,   \r\n" + 
					"D.VALUE AS STATUS,   \r\n" + 
					"C.VALUE AS STEP,   \r\n" + 
					"B.PRODUCT_MATERIAL,   \r\n" + 
					"B.PRODUCT_NAME,   \r\n" + 
					"B.PRODUCT_STANDARD,   \r\n" + 
					"B.PROJECT_STEP,   \r\n" + 
					"A.PPW_DOC_NO, \r\n" + 
					"A.PPW_TARGET_NUM AS PRODUCT_COUNT, \r\n" + 
					"A.PPW_NOW_NUM AS PLAN_NUM, \r\n" + 
					"NVL(MO.PM_TARGET_QTY,0) AS PLANED_NUM,   \r\n" + 
					"NVL(A.PPW_NOW_NUM,0)-NVL(MO.PM_TARGET_QTY,0) AS CANPLAN,   \r\n" + 
					"TO_CHAR(A.PPW_START_DATE,'YYYY-MM-DD HH24:MI')||':00' AS PROLEPSIS_START_DATE,   \r\n" + 
					"TO_CHAR(A.PPW_END_DATE,'YYYY-MM-DD HH24:MI')||':00' AS PROLEPSIS_END_DATE,   \r\n" + 
					"TO_CHAR(B.ACTUAL_START_DATE,'YYYY-MM-DD HH24:MI') AS ACTUAL_START_DATE,   \r\n" + 
					"TO_CHAR(B.ACTUAL_END_DATE,'YYYY-MM-DD HH24:MI') AS TPPB_PLAN_DELIVERY_DATE \r\n" + 
					"FROM T_PM_PLAN_INFO A   \r\n" + 
					"LEFT JOIN T_PM_PROJECT_BASE B ON A.PPW_PROJECT_ID=B.PROJECT_ID   \r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PROJECT_STEP' AND B.PROJECT_STEP=C.CODE   \r\n" + 
					"LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='PROJECT_STATUS' AND B.PROJECT_STATUS=D.CODE   \r\n" + 
					"LEFT JOIN (  \r\n" + 
					"SELECT\r\n" + 
					"EP.PM_PLAN_ID,\r\n" + 
					"MIN(EP.PM_TARGET_QTY) AS PM_TARGET_QTY\r\n" + 
					"FROM (\r\n" + 
					"SELECT  \r\n" + 
					"E.PM_PLAN_ID,\r\n" + 
					"E.PM_PROCESS_FACE,\r\n" + 
					"NVL(SUM(E.PM_TARGET_QTY),0) AS PM_TARGET_QTY \r\n" + 
					"FROM T_PM_MO_BASE E  \r\n" + 
					"GROUP BY E.PM_PLAN_ID,E.PM_PROCESS_FACE\r\n" + 
					") EP\r\n" + 
					"GROUP BY EP.PM_PLAN_ID\r\n" + 
					") MO ON MO.PM_PLAN_ID=A.ID WHERE A.ID=?";
			return modelService.listDataSql(sqlStr, new Object[] { id });
		} catch (Exception ex) {
			log.error("getExpectInfo:" ,ex);
			return null;
		}
	}

	/**
	 * 下达时，获取面别可下达数量
	 * @param request
	 * @return
	 */
	public final static List getFaceCanPlanNum(HttpServletRequest request){
		try{
			String monthDoc=request.getParameter("monthDoc");
			String face=request.getParameter("face");
			String sqlStr="SELECT     \r\n" + 
					"NVL(A.PPW_NOW_NUM,0)-NVL(MO.PM_TARGET_QTY,0)-NVL(T.PM_TARGET_QTY,0) AS CANPLAN  \r\n" + 
					"FROM T_PM_PLAN_INFO A     \r\n" + 
					"LEFT JOIN (   \r\n" + 
					"SELECT   \r\n" + 
					"E.PM_PLAN_ID, \r\n" + 
					"NVL(SUM(E.PM_TARGET_QTY),0) AS PM_TARGET_QTY  \r\n" + 
					"FROM T_PM_MO_BASE E   \r\n" + 
					"WHERE E.PM_PROCESS_FACE=?\r\n" + 
					"GROUP BY E.PM_PLAN_ID \r\n" + 
					") MO ON MO.PM_PLAN_ID=A.ID \r\n" + 
					"LEFT JOIN (\r\n" + 
					"SELECT\r\n" + 
					"F.PM_PROJECT_ID,\r\n" + 
					"SUM(NVL(F.PM_TARGET_QTY,0)) AS PM_TARGET_QTY \r\n" + 
					"FROM T_PM_MO_BASE F\r\n" + 
					"WHERE F.PM_PROCESS_FACE=? AND F.PM_PLAN_ID IS NULL\r\n" + 
					"GROUP BY F.PM_PROJECT_ID\r\n" + 
					") T ON A.PPW_PROJECT_ID=T.PM_PROJECT_ID\r\n" + 
					"WHERE A.PPW_DOC_NO=?";
			return modelService.listDataSql(sqlStr,new Object[]{face,face,monthDoc});
		}
		catch(Exception ex){
			log.error("getFaceCanPlanNum:",ex);
			return null;
		}
	}
	
	/**
	 * 获取标准工时
	 * 
	 * @param request
	 * @return
	 */
	public final static List getStandarTime(HttpServletRequest request) {
		try {
			String itemCode = request.getParameter("itemCode");
			String face = request.getParameter("face");
			String line = request.getParameter("line");
			String step = request.getParameter("step");
			String track = request.getParameter("track");
			if (StringUtils.isEmpty(itemCode) || StringUtils.isEmpty(face)
					|| StringUtils.isEmpty(line) || StringUtils.isEmpty(step) || StringUtils.isEmpty(track)) {
				return null;
			}
			String sqlStr = "SELECT\r\n" 
			        + "A.CST_STANDARD_TIME,\r\n"
					+ "A.CST_CHANGE_TIME\r\n" 
					+ "FROM T_CO_STANDARD_TIME A\r\n"
					+ "WHERE A.CST_MODEL_CODE=?\r\n"
					+ "AND A.CST_STEP_CODE=?\r\n"
					+ "AND A.CST_PROCESS_FACE=?\r\n"
					+ "AND A.CST_AREA_SN=?\r\n" 
					+ "AND A.CST_TRACK=?\r\n"
					+ "AND ROWNUM=1";
			return modelService.listDataSql(sqlStr, new Object[] { itemCode,
					step, face, line,track});
		} catch (Exception ex) {
			log.error("getStandarTime:" ,ex);
			return null;
		}
	}

	/**
	 * 获取线别信息
	 * 
	 * @param request
	 * @return
	 */
	public final static List getLineInfo(HttpServletRequest request) {
		try {
			String sqlStr = "SELECT \r\n" + 
					"A.CA_ID, \r\n" + 
					"A.CA_NAME,\r\n" + 
					"NVL(A.CA_TRACK,'S') AS CA_TRACK\r\n" + 
					"FROM T_CO_AREA A \r\n" + 
					"WHERE A.CA_TYPE='1'";
			List<Object> paramList = new ArrayList();
			String step = request.getParameter("step");
			if (!StringUtils.isEmpty(step)) {
				sqlStr += " AND A.CA_PROJECT_STEP=?";
				paramList.add(step);
			}
			return modelService.listDataSql(sqlStr, paramList.toArray());
		} catch (Exception ex) {
			log.error("getLineInfo:" + ex.toString());
			return null;
		}
	}

	/**
	 * 获取前置面别
	 * @param request
	 * @return
	 */
	public final static List getPerFace(HttpServletRequest request){
		try{
			String itemCode=request.getParameter("itemCode");
			String face=request.getParameter("face");
			String strSql="SELECT \r\n" + 
					"T.CIG_TEC_ID AS TECH, \r\n" + 
					"C.CT_PREPOSE_TECH AS PER_TECH,\r\n" + 
					"D.CT_PROCESS_FACE AS PER_FACE\r\n" + 
					"FROM ( \r\n" + 
					"SELECT \r\n" + 
					"B.CIG_TEC_ID \r\n" + 
					"FROM T_CO_ITEM_CONNECT A \r\n" + 
					"LEFT JOIN T_CO_ITEM_GROUP B ON A.CIG_SN=B.CIG_SN \r\n" + 
					"WHERE A.CIC_ITEM_CODE=? AND B.CIG_PROCESS_FACE=? \r\n" + 
					") T \r\n" + 
					"LEFT JOIN T_CO_TECHNICS C ON T.CIG_TEC_ID=C.CT_ID\r\n" + 
					"LEFT JOIN T_CO_TECHNICS D ON C.CT_PREPOSE_TECH=D.CT_ID";
			return modelService.listDataSql(strSql,new Object[]{itemCode,face});
		}
		catch(Exception ex){
			log.error("getItemGroupTech:",ex);
			return null;
		}
	}
	/**
	 * 获取前置面别制令单总计划数量和当前面别制令单总计划数量
	 * @param request
	 * @return
	 */
	public final static List getCurOrPerFaceMoCount(HttpServletRequest request){
		try{
			Map<String,Integer> returnMap=new HashMap();
			// 获取参数
			String dataAuth = request.getParameter("dataAuth");
			String currentFace=request.getParameter("currentFace");
			String perFace=request.getParameter("perFace");
			String projectId = request.getParameter("projectId");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String whereStr="";
			// 组织机构
			if (!StringUtils.isEmpty(dataAuth)) {
				whereStr+=" AND A.DATA_AUTH='"+dataAuth+"'";
			}
			String strSql="SELECT\r\n" + 
					"SUM(T.PER_FACE_COUNT) AS PER_FACE_COUNT,  \r\n" + 
					"SUM(T.CUR_FACE_COUNT) AS CUR_FACE_COUNT, \r\n" + 
					"SUM(T.BF_PER_FACE_COUNT) AS BF_PER_FACE_COUNT,  \r\n" + 
					"SUM(T.BF_CUR_FACE_COUNT) AS BF_CUR_FACE_COUNT \r\n" + 
					"FROM (\r\n" + 
					"SELECT\r\n" + 
					"NVL(SUM(H.PM_TARGET_QTY),0) AS PER_FACE_COUNT,  \r\n" + 
					"0 AS CUR_FACE_COUNT, \r\n" + 
					"0 AS BF_PER_FACE_COUNT,  \r\n" + 
					"0 AS BF_CUR_FACE_COUNT \r\n" + 
					"FROM T_PM_MO_BASE H\r\n" + 
					"WHERE H.PM_MO_NUMBER NOT IN(\r\n" + 
					"SELECT\r\n" + 
					"A.PM_MO_NUMBER\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"WHERE ((A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_DUE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5')) OR (PM_SCHEDULE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5'))) %s\r\n" + 
					")\r\n" + 
					"AND H.PM_PROJECT_ID=? AND H.PM_PROCESS_FACE=?\r\n" + 
					"\r\n" + 
					"UNION ALL\r\n" + 
					"\r\n" + 
					"SELECT\r\n" + 
					"0 AS PER_FACE_COUNT,  \r\n" + 
					"NVL(SUM(H.PM_TARGET_QTY),0) AS CUR_FACE_COUNT, \r\n" + 
					"0 AS BF_PER_FACE_COUNT,  \r\n" + 
					"0 AS BF_CUR_FACE_COUNT   \r\n" + 
					"FROM T_PM_MO_BASE H\r\n" + 
					"WHERE H.PM_MO_NUMBER NOT IN(\r\n" + 
					"SELECT\r\n" + 
					"A.PM_MO_NUMBER\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"WHERE ((A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_DUE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5')) OR (PM_SCHEDULE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5'))) %s\r\n" + 
					")\r\n" + 
					"AND H.PM_PROJECT_ID=? AND H.PM_PROCESS_FACE=?\r\n" + 
					"\r\n" + 
					"UNION ALL\r\n" + 
					"\r\n" + 
					"SELECT\r\n" + 
					"0 AS PER_FACE_COUNT,  \r\n" + 
					"0 AS CUR_FACE_COUNT, \r\n" + 
					"NVL(SUM(H.PM_TARGET_QTY),0) AS BF_PER_FACE_COUNT,  \r\n" + 
					"0 AS BF_CUR_FACE_COUNT \r\n" + 
					"FROM T_PM_MO_BASE H\r\n" + 
					"WHERE H.PM_MO_NUMBER NOT IN(\r\n" + 
					"SELECT\r\n" + 
					"A.PM_MO_NUMBER\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"WHERE ((A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_DUE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5')) OR (PM_SCHEDULE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5'))) %s\r\n" + 
					")\r\n" + 
					"AND H.PM_PROJECT_ID=? AND H.PM_PROCESS_FACE=?\r\n" + 
					"\r\n" + 
					"UNION ALL\r\n" + 
					"\r\n" + 
					"SELECT\r\n" + 
					"0 AS PER_FACE_COUNT,  \r\n" + 
					"0 AS CUR_FACE_COUNT, \r\n" + 
					"0 AS BF_CUR_FACE_COUNT,  \r\n" + 
					"NVL(SUM(H.PM_TARGET_QTY),0) AS BF_CUR_FACE_COUNT   \r\n" + 
					"FROM T_PM_MO_BASE H\r\n" + 
					"WHERE H.PM_MO_NUMBER NOT IN(\r\n" + 
					"SELECT\r\n" + 
					"A.PM_MO_NUMBER\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"WHERE ((A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_DUE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5')) OR (PM_SCHEDULE_DATE>=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_SCHEDULE_DATE<=TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND A.PM_STATUS NOT IN ('4','5'))) %s\r\n" + 
					")\r\n" + 
					"AND H.PM_PROJECT_ID=? AND H.PM_PROCESS_FACE=?\r\n" + 
					")T";
			List<Map> dataList= modelService.listDataSql(String.format(strSql,whereStr,whereStr,whereStr,whereStr),new Object[]{
				startTime,startTime,startTime,endTime,projectId,perFace,
				startTime,startTime,startTime,endTime,projectId,currentFace,
				startTime,startTime,startTime,endTime,projectId,perFace,
				startTime,startTime,startTime,endTime,projectId,currentFace
			});
			if(null!=dataList && dataList.size()>0){
				returnMap.put("PER_FACE_COUNT",Integer.parseInt(dataList.get(0).get("PER_FACE_COUNT").toString()));
				returnMap.put("CUR_FACE_COUNT",Integer.parseInt(dataList.get(0).get("CUR_FACE_COUNT").toString()));
				returnMap.put("BF_PER_FACE_COUNT",Integer.parseInt(dataList.get(0).get("BF_PER_FACE_COUNT").toString()));
				returnMap.put("BF_CUR_FACE_COUNT",Integer.parseInt(dataList.get(0).get("BF_CUR_FACE_COUNT").toString()));
			}
			else {
				returnMap.put("PER_FACE_COUNT", 0);
				returnMap.put("CUR_FACE_COUNT", 0);
				returnMap.put("BF_PER_FACE_COUNT", 0);
				returnMap.put("BF_CUR_FACE_COUNT", 0);
			}
			List<Map> returnList=new ArrayList();
			returnList.add(returnMap);
			return returnList;
		}
		catch(Exception ex){
			log.error("getPerTechMonumber:",ex);
			return null;
		}
	}
	
	/**
	 * 获取面别信息
	 * 
	 * @param request
	 * @return
	 */
	public final static List getFaceInfo(HttpServletRequest request) {
		try {
			String sqlStr = "SELECT\r\n" + "A.CODE,\r\n" + "f_c_get_multilingual(A.VALUE) AS VALUE\r\n"
					+ "FROM SY_DICT_VAL A\r\n"
					+ "WHERE A.DICT_CODE='PROCESS_FACE'\r\n"
					+ "ORDER BY A.CODE";
			return modelService.listDataSql(sqlStr);
		} catch (Exception ex) {
			log.error("getFaceInfo:" ,ex);
			return null;
		}
	}

	/**
	 * 获取阶别线体信息
	 * @param stepSn
	 * @return
	 */
	public final static List getStepLineInfo(String stepSn){
		try{
			String strSql="SELECT\r\n" + 
					"A.CA_ID,\r\n" + 
					"A.CA_PROJECT_STEP AS LINE_STEP\r\n" + 
					"FROM T_CO_AREA A\r\n" + 
					"WHERE A.CA_PROJECT_STEP=?\r\n" + 
					"AND A.CA_TYPE='1'";
			return modelService.listDataSql(strSql,new Object[]{stepSn});
		}
		catch(Exception ex){
			log.error("getStepLineInfo:"+ex.toString());
			return null;
		}
	}
	
	/**
	 * 获取轨道信息
	 * @param request
	 * @return
	 */
	public final static List getTrackInfo(HttpServletRequest request){
		try{
			String sqlStr="SELECT \r\n" + 
					"A.CODE, \r\n" + 
					"f_c_get_multilingual(A.VALUE) AS VALUE\r\n" + 
					"FROM SY_DICT_VAL A \r\n" + 
					"WHERE A.DICT_CODE='TRACK_TYPE' ORDER BY A.CODE";
			return modelService.listDataSql(sqlStr);
		}
		catch(Exception ex){
			log.error("getTrackInfo:",ex);
			return null;
		}
	}
	
	/**
	 * 甘特图数据对象(周排程)
	 * 
	 * @author Chaos 所有时长最大精度到分钟m
	 */
	public class WeekGantt {
		// 常量
		private final String EXC_TYPE_NAME = "PPE_EXECPTION_TYPE";// 列外类型字段
		private final String EXC_TIME_NAME = "PPE_DURATION";// 列外时长字段
		private final String CAL_LINE_SN = "PPC_AREA_SN";// 产能日历线体字段
		private final String CAL_MASTER_ID = "CAL_ID";// 工厂日历主表ID标识
		private final String CAL_IS_SAT = "PPC_SAT_FLAG";// 周六是否上班字段
		private final String CAL_IS_SUN = "PPC_SUN_FLAG";// 周末是否上班字段
		private final String LINE_AVA_DAYS = "LINE_AVA_DAYS";// 线体有效天数字段
		private final String LINE_DATA_SN = "PM_AREA_SN";// 线体SN字段标识
		private final String LINE_DATA_NAME = "CA_NAME";// 线体名称字段标识
		private final String LINE_TRACK_FLAG = "CA_TRACK_FLAG";// 线体双轨标识
		private final String STEP_DEVICE_COE = "PPQ_DEVICE_QUOTIETY";// 阶别设备系数
		private final String STEP_MANPOWER_COE = "PPQ_MANPOWER_QUOTIETY";// 阶别人力系数
		private final String STEP_EFFICIENCY_COE = "PPQ_EFFICIENCY_QUOTIETY";// 阶别效率系数
		private final String STEP_QUALITY_COE = "PPQ_QUALITY_QUOTIETY";// 阶别品质系数
		private final String STEP_DUAL_COE = "PPQ_DUAL_QUOTIETY";// SMT双轨系数
		private final String LINE_START_TIME = "LINE_START_TIME";// 线体计算起始时间
		private final String LINE_END_TIME = "LINE_END_TIME";// 线体计算结束时间
		private final String LINE_DAYS="LINE_DAYS";//线体有效产能天数
		private final String LINE_SAT_DAYS="LINE_SAT_DAYS";//线体有效天数中的包含的周六天数
		private final String LINE_SUN_DAYS="LINE_SUN_DAYS";//线体有效天数中的包含的周日天数
		private final String TASK_START_TIME = "PM_SCHEDULE_DATE";// 任务开始时间字段
		private final String TASK_END_TIME = "PM_DUE_DATE";// 任务结束时间字段
		private final String TASK_PROJECT_START_TIME = "PROLEPSIS_START_DATE";// 任务工单开始时间
		private final String TASK_PROJECT_END_TIME = "PROLEPSIS_END_DATE";// 任务工单结束时间
		private final String FORMAT_TIME_FOR_MIN = "yyyy-MM-dd HH:mm:00";// 时间格式（精确到分钟m）
		private final String LINE_TIME_LOST_BY_COE="LINE_TIME_LOST_BY_COE";//线体因系数而损耗的产能

		// 线体变量
		private Map<String, Map<String, Object>> areaSn = new HashMap();// 存储涉及到的线别
		private Map<String, List> task = new HashMap();// 存储甘特图任务信息
		private Map<String, List> dayWorkTimeInfo = new HashMap();// 线体工厂日历中一天内工作时间段
		private Map<String, List> dayRestTimeInfo = new HashMap();// 线体工厂日历中一天内休息时间段
		private Map<String, Double> oneDayWorkTime = new HashMap();// 存储一天工作时长
		private Map<String, List> planCalendar = new HashMap();// 存储产能日历主表信息
		private Map<String, List> exceptionInfo = new HashMap();// 存储例外信息
		private Map<String, Double> availableTime = new HashMap();// 存储有效工时
		private Map<String, Double> avilableDays = new HashMap();// 存储有效天数
		private Map<String, List> coefficient = new HashMap();// 存储系数
		private Map<String, Map> lineCalenddarMasterInfo = new HashMap();// 存储线体工厂日历主表信息

		//甘特图默认变量
		String ganttDefualtCalStartTime=null;//甘特图默认产能有效开始时间
		String ganttDefualtCalEndTime=null;//甘特图默认产能有效结束时间
		
		// get set
		public WeekGantt instance() {
			return this;
		}

		public Map<String, List> getTask() {
			return task;
		}

		public void setTask(Map<String, List> task) {
			this.task = task;
		}

		public Map<String, Double> getOneDayWorkTime() {
			return oneDayWorkTime;
		}

		public void setOneDayWorkTime(Map<String, Double> oneDayWorkTime) {
			this.oneDayWorkTime = oneDayWorkTime;
		}

		public Map<String, List> getPlanCalendar() {
			return planCalendar;
		}

		public void setPlanCalendar(Map<String, List> planCalendar) {
			this.planCalendar = planCalendar;
		}

		public Map<String, List> getExceptionInfo() {
			return exceptionInfo;
		}

		public void setExceptionInfo(Map<String, List> exceptionInfo) {
			this.exceptionInfo = exceptionInfo;
		}

		public Map<String, List> getCoefficient() {
			return coefficient;
		}

		public void setCoefficient(Map<String, List> coefficient) {
			this.coefficient = coefficient;
		}

		public Map<String, Map<String, Object>> getAreaSn() {
			return areaSn;
		}

		public void setAreaSn(Map<String, Map<String, Object>> areaSn) {
			this.areaSn = areaSn;
		}

		public Map<String, List> getDayWorkTimeInfo() {
			return dayWorkTimeInfo;
		}

		public void setDayWorkTimeInfo(Map<String, List> dayWorkTimeInfo) {
			this.dayWorkTimeInfo = dayWorkTimeInfo;
		}

		public Map<String, List> getDayRestTimeInfo() {
			return dayRestTimeInfo;
		}

		public void setDayRestTimeInfo(Map<String, List> dayRestTimeInfo) {
			this.dayRestTimeInfo = dayRestTimeInfo;
		}

		public Map<String, Map> getLineCalenddarMasterInfo() {
			return lineCalenddarMasterInfo;
		}

		public void setLineCalenddarMasterInfo(
				Map<String, Map> lineCalenddarMasterInfo) {
			this.lineCalenddarMasterInfo = lineCalenddarMasterInfo;
		}

		public Map<String, Double> getAvilableDays() {
			return avilableDays;
		}

		public void setAvilableDays(Map<String, Double> avilableDays) {
			this.avilableDays = avilableDays;
		}
		
		public Map<String, Double> getAvailableTime() {
			return availableTime;
		}

		public void setAvailableTime(Map<String, Double> availableTime) {
			this.availableTime = availableTime;
		}
		
		// Method
		/**
		 * 设置甘特图默认变量
		 * @param defaultStartTime
		 * @param defaultEndTime
		 */
		public void setGanttDefault(String defaultStartTime,String defaultEndTime){
			try{
				this.ganttDefualtCalStartTime=defaultStartTime;
				this.ganttDefualtCalEndTime=defaultEndTime;
			}
			catch(Exception ex){
				log.error("setGanttDefault:"+ex.toString());
			}
		}

		/**
		 * 手动放入线体信息
		 * 
		 * @param areaSn
		 * @param areaName
		 */
		public void putArea(String areaSn, Map areaInfo) {
			try {
				this.getAreaSn().get(areaSn).put(LINE_DATA_NAME, areaInfo.get(LINE_DATA_NAME));// 记录涉及到的线别名称
				this.getAreaSn().get(areaSn).put(LINE_TRACK_FLAG, areaInfo.get(LINE_TRACK_FLAG));// 记录涉及到的线别双轨标识
			} catch (Exception ex) {
				log.error("putArea:" ,ex);
			}
		}

		/**
		 * 添加任务
		 * 
		 * @param newTask
		 */
		public void addTask(Map newTask) {
			try {
				// 放入任务
				String areaSn = CommonMethod.Common.validateValue(newTask
						.get(LINE_DATA_SN));
				final String areaName = CommonMethod.Common
						.validateValue(newTask.get(LINE_DATA_NAME));
				final String areaTrackFlag=CommonMethod.Common
						.validateValue(newTask.get(LINE_TRACK_FLAG));
				if (StringUtils.isEmpty(areaSn)) {
					return;
				}
				//创建任务
				if (!this.getTask().keySet().contains(areaSn)) {
					//设置线体产能时间点
					this.setDateTime(areaSn, this.ganttDefualtCalStartTime, this.ganttDefualtCalEndTime);
					this.getTask().put(areaSn, new ArrayList());
					this.getAreaSn().get(areaSn).put(LINE_DATA_NAME, areaName);// 记录涉及到的线别名称
					this.getAreaSn().get(areaSn).put(LINE_TRACK_FLAG, areaTrackFlag);// 记录涉及到的线别双轨标识
				}
				this.getTask().get(areaSn).add(newTask);// 放入对应阶别的任务
				// 修正线体起始时间和结束时间
				Map<String, Object> snMap = this.getAreaSn().get(areaSn);
				Date startTime = (Date)snMap.get(LINE_START_TIME);
				Date endTime = (Date)snMap.get(LINE_END_TIME);
				
				Date taskStartTime = CommonMethod.Common.convertStr2Date(newTask.get(TASK_START_TIME).toString());
				Date taskEndTime = CommonMethod.Common.convertStr2Date(newTask.get(TASK_END_TIME).toString());
				//1、若制令单开始时间小于线体产能计算时间域中的开始时间，则taskStartTime取制令单开始时间。并重新设置线体产能计算域中的开始时间为制令单开始时间
				//2、若制令单开始时间大于线体产能计算时间域中的开始时间，则taskStartTime取线体产能计算域的开始时间。
				if(startTime.getTime()>taskStartTime.getTime()){
					//重新设置产能计算域中的开始时间为制令单开始时间
					this.reSetDateTime(areaSn,CommonMethod.Common.date2String(taskStartTime, FORMAT_TIME_FOR_MIN), CommonMethod.Common.date2String(endTime, FORMAT_TIME_FOR_MIN));
				}
				else {
					taskStartTime=startTime;
				}
				if (null == startTime) {
					this.getAreaSn().get(areaSn)
							.put(LINE_START_TIME, taskStartTime);
				} else {
					this.getAreaSn()
							.get(areaSn)
							.put(LINE_START_TIME,
									CommonMethod.Common.compareDateMin(
											startTime, taskStartTime,
											FORMAT_TIME_FOR_MIN));
				}

				/*if (null == endTime) {
					this.getAreaSn().get(areaSn)
							.put(LINE_END_TIME, taskEndTime);
				} else {
					this.getAreaSn()
							.get(areaSn)
							.put(LINE_END_TIME,
									CommonMethod.Common.compareDateMax(endTime,
											taskEndTime, FORMAT_TIME_FOR_MIN));
				}*/
				//修改，线体结束时间始终为产能有效结束时间
				this.getAreaSn()
				.get(areaSn)
				.put(LINE_END_TIME,endTime);
			} catch (Exception ex) {
				log.error("addTask:" ,ex);
			}
		}

		/**
		 * 计算产能
		 * 
		 * @return
		 */
		public Boolean getCapacity() {
			try {
				String calId;
				// 计算有效产能
				for (Map.Entry<String, Map<String,Object>> areaSnMap: this.getAreaSn().entrySet()) {
					// 获取线体工厂日历ID
					this.getLineCalenddarMasterInfo().put(
							areaSnMap.getKey(),
							getCalendarMasterInfo(areaSnMap.getKey(),
									areaSnMap.getValue().get(LINE_START_TIME),
									areaSnMap.getValue().get(LINE_END_TIME)));
					// 获取工作时间段
					calId = this.getLineCalenddarMasterInfo().get(areaSnMap.getKey()) == null ? ""
							: this.getLineCalenddarMasterInfo().get(areaSnMap.getKey())
									.get(CAL_MASTER_ID).toString();
					this.getDayWorkTimeInfo().put(areaSnMap.getKey(),
							getWorkTimeInfo(calId));
					// 获取休息时间
					this.getDayRestTimeInfo().put(areaSnMap.getKey(),
							getRestTimeInfo(calId));
					// 获取每个线别一天的工作工时
					this.getOneDayWorkTime().put(areaSnMap.getKey(), getWorkTime(calId));
					// 获取产能日历主表信息
					this.getPlanCalendar().put(areaSnMap.getKey(),
							getPlanCalendarInfo(areaSnMap.getKey()));
					// 获取每个线别例外信息
					this.getExceptionInfo().put(
							areaSnMap.getKey(),
							getException(areaSnMap.getKey(), areaSnMap.getValue().get(LINE_START_TIME),
									areaSnMap.getValue().get(LINE_END_TIME)));
					// 获取线体系数
					this.getCoefficient().put(areaSnMap.getKey(),
							GetCommonInfo.getCoefficient(areaSnMap.getKey()));
				}

				return true;
			} catch (Exception ex) {
				log.error("getCapacity:" ,ex);
				return false;
			}
		}

		/**
		 * 生成任务对象集合
		 * 
		 * @param dataList
		 * @param gantt
		 * @return
		 */
		public Boolean createTask(List<Map> dataList) {
			try {
				// 筛选任务
				this.setTask(new LinkedHashMap());
				for (Map task : dataList) {
					this.addTask(task);
				}

				return true;
			} catch (Exception ex) {
				log.error("createTask:" ,ex);
				return false;
			}
		}

		/**
		 * 设置开始时间和结束时间（产能计算范围）
		 * 
		 * @param planStartTime
		 * @param planEndTime
		 */
		public void setDateTime(String areaSn, String planStartTime, String planEndTime) {
			try {
				Date date = null;
				Date startDate = CommonMethod.Common
						.convertStr2Date(planStartTime);
				Date EndDate = CommonMethod.Common.convertStr2Date(planEndTime);
			    //校验是否存在线体信息，若不存在则创建
				if(null==this.getAreaSn().get(areaSn)){
					this.getAreaSn().put(areaSn, new HashMap<String,Object>());
				}
				//放入线体开始时间和结束时间
				this.getAreaSn().get(areaSn).put(LINE_START_TIME,startDate.clone());
				this.getAreaSn().get(areaSn).put(LINE_END_TIME, EndDate.clone());
                //开始计算
				long diffTime = 0;
				double diffTimeDouble=0;
				double days = 0; //天要保留2位小数，精确到分钟min
				double satday = 0;
				double sunday = 0;
				double ms=1000;
				double sec=60;
				double min=60;
				double hour=24;
				double toDay=ms*sec*min*hour;
				if (null != startDate && null != EndDate) {
					diffTime = EndDate.getTime() - startDate.getTime();
					// 获取有效天数
					diffTimeDouble=Double.parseDouble(Long.toString(diffTime)) / toDay;
					//days = CommonMethod.Common.doubleMathRound(Double.parseDouble(Long.toString(diffTime)), 2);
					days = doubleMathR(diffTimeDouble, 2);
					this.getAreaSn().get(areaSn).put(LINE_DAYS,days);
					// 获取有效时间段内周六/周日天数
					date = startDate;
					while (date.getTime() <= EndDate.getTime()) {
						if (date.getDay() == 0) {
							sunday++;
						} else if (date.getDay() == 6) {
							satday++;
						}
						date.setDate(date.getDate() + 1);
					}
					this.getAreaSn().get(areaSn).put(LINE_SAT_DAYS,satday);
					this.getAreaSn().get(areaSn).put(LINE_SUN_DAYS,sunday);
				}
			} catch (Exception ex) {
				log.error("setDateTime:" ,ex);
			}
		}
		
		/**
		 * 重新设置开始时间和结束时间（产能计算范围）
		 * @param planStartTime
		 * @param planEndTime
		 */
		public void reSetDateTime(String areaSn, String planStartTime, String planEndTime) {
			try{
				setDateTime(areaSn,planStartTime,planEndTime);
			}
			catch(Exception ex){
				log.error("reSetDateTime:" ,ex);
			}
		} 

		/**
		 * 计算甘特图信息
		 */
		public void calculate() {
			setLineAvailableDays();// 计算线体有效工作天数
			setAvailableTime();// 计算有效工时
		}

		/**
		 * 计算线体有效工作天数
		 */
		public void setLineAvailableDays() {
			try {
				Object isSat = null;
				Object isSun = null;
				Map var = null;
				Boolean isBoolSat = false;
				Boolean isBoolSun = false;
				double avaDays = 0;// 有效天数(保留2位小数，精确到分钟min)
				List excVar = null;
				for (Map.Entry<String, Map<String,Object>> areaSnMap : this.getAreaSn().entrySet()) {
					// 设置周六/周日是否上班
					excVar = this.getPlanCalendar().get(areaSnMap.getKey());
					if (null != excVar && excVar.size() > 0) {
						var = (Map) excVar.get(0);
						isSat = var.get(CAL_IS_SAT);
						isSun = var.get(CAL_IS_SUN);
					} else {
						// 若不存在产能日历信息，则取工厂日历中的标识
						var = this.getLineCalenddarMasterInfo().get(areaSnMap.getKey());
					}
					isSat = var == null ? "" : var.get(CAL_IS_SAT);
					isSun = var == null ? "" : var.get(CAL_IS_SUN);
					isBoolSat = null != isSat
                            && !StringUtils.isEmpty(isSat.toString()) && "Y".equals(isSat.toString());
					isBoolSun = null != isSun
                            && !StringUtils.isEmpty(isSun.toString()) && "Y".equals(isSun.toString());
					// 赋值
					this.getAreaSn().get(areaSnMap.getKey()).put(CAL_IS_SAT, isBoolSat);
					this.getAreaSn().get(areaSnMap.getKey()).put(CAL_IS_SUN, isBoolSun);
					// 计算线体有效天数(若周六、周日不上班，则不用扣减)
					avaDays=((double)areaSnMap.getValue().get(LINE_DAYS))-(isBoolSat ? 0 : (double)areaSnMap.getValue().get(LINE_SAT_DAYS))-(isBoolSun ? 0 : (double)areaSnMap.getValue().get(LINE_SUN_DAYS));
					this.getAreaSn().get(areaSnMap.getKey()).put(LINE_AVA_DAYS, avaDays);
				}
			} catch (Exception ex) {
				log.error("setLineAvailableDays:" ,ex);
			}
		}

		/**
		 * 计算有效工时（精度为分钟m）
		 */
		private void setAvailableTime() {
			try {
				List<Map> exceptionInfo = null;// 例外信息
				List<Map> coefficientInfo = null;// 系数信息
				String excType = null;// 例外类型
				double excTime = 0;// 列外时长
				double varTime = 0;// 时长变量
				double varTimeLostbyCoe=0;//因系数而损耗的产能
				double avaDays = 0;// 线体有效工作天数
				double devCoe = 1.0;// 设备系数
				double manCoe = 1.0;// 人力系数
				double effCoe = 1.0;// 效率系数
				double qutyCoe = 1.0;// 品质系数
				double dualCoe = 1.0;// SMT双轨系数
				for (String areasn : this.getAreaSn().keySet()) {
					// 获取线体有效工作天数
					avaDays = (double)this.getAreaSn().get(areasn)
							.get(LINE_AVA_DAYS);
					// 获取总工作时长（一天工作时长*有效天数）
					varTime = this.getOneDayWorkTime().get(areasn) * avaDays;
					// 计算例外时长
					exceptionInfo = this.getExceptionInfo().get(areasn);
					if (exceptionInfo != null) {
						for (Map excMap : exceptionInfo) {
							if (null == excMap.get(EXC_TYPE_NAME)) {
								continue;// 若类型为空，可能数据，则跳过
							}
							excType = excMap.get(EXC_TYPE_NAME).toString();
							excTime = hourTomin(excMap.get(EXC_TIME_NAME));
							switch (excType) {
							case "1": // 加班
								varTime += excTime;
								break;
							case "2": // 放假
							case "3": // 调休
							case "4": // 设备维修
							case "5": // 其他
								varTime -= excTime;
								break;
							default:
								break;
							}
						}
					}
					// 计算系数
					devCoe = 1.0; // 重置系数
					manCoe = 1.0;
					effCoe = 1.0;
					qutyCoe = 1.0;
					dualCoe = 1.0;
					// 获取
					coefficientInfo = this.getCoefficient().get(areasn);
					if (null != coefficientInfo && coefficientInfo.size() > 0) {
						Map coeMap = coefficientInfo.get(0);// 每个阶别只会有一条记录，若异常有多条记录，只取一条
						devCoe = null == coeMap.get(STEP_DEVICE_COE) ? 1
								: Double.parseDouble(coeMap
										.get(STEP_DEVICE_COE).toString());
						manCoe = null == coeMap.get(STEP_MANPOWER_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_MANPOWER_COE).toString());
						effCoe = null == coeMap.get(STEP_EFFICIENCY_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_EFFICIENCY_COE).toString());
						qutyCoe = null == coeMap.get(STEP_QUALITY_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_QUALITY_COE).toString());
						dualCoe = null == coeMap.get(STEP_DUAL_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_DUAL_COE).toString());
					}
					varTime = (int) (varTime * dualCoe);//先处理轨道系数，算出线体总可用产能
					varTimeLostbyCoe=varTime;
					varTime = (int) (varTime * devCoe * manCoe
							* effCoe * qutyCoe);//再处理其他系数
					varTimeLostbyCoe=(int)(varTimeLostbyCoe-varTime);//记录因系数而损耗的产能
					// 记录线体有效时长
					this.getAvailableTime().put(areasn, varTime);
					// 放入因系数而损耗的产能
					this.getAreaSn().get(areasn).put(LINE_TIME_LOST_BY_COE, varTimeLostbyCoe);
				}
			} catch (Exception ex) {
				log.error("setAvailableTime:" ,ex);
			}
		}

		/**
		 * 小时转分钟
		 * 
		 * @param hours
		 * @return
		 */
		private int hourTomin(Object hours) {
			if (null == hours || "" == hours.toString()) {
				return 0;
			} else {
				Double min = Math
						.floor(Double.parseDouble(hours.toString()) * 60);
				return min.intValue();
			}
		}
		
		/**
		 * double保留小数
		 * 
		 * @param value
		 *            double原值
		 * @param roundNum
		 *            小数位数
		 * @return
		 */
		private double doubleMathR(double value, int roundNum) {
			try {
				BigDecimal b = new BigDecimal(value);
				return b.setScale(roundNum, BigDecimal.ROUND_UP).doubleValue();
			} catch (Exception ex) {
				log.error("doubleMathR:" ,ex);
				return -1;
			}
		}
	}
	
	/**
	 * 获取机种制具信息
	 * @param request
	 * @return
	 */
	public static List getManufacture(HttpServletRequest request){
		try{
			//获取机种
			String itemCode=request.getParameter("itemCode");
			String strSql="SELECT\r\n" + 
					"B.CFI_FIX_SN\r\n" + 
					"FROM T_CO_TECH_ITEM A\r\n" + 
					"LEFT JOIN T_CO_FIXTURE_INFO B ON A.CTI_ITEM_CODE=B.CFI_ITEM_CODE\r\n" + 
					"WHERE A.CTI_ITEM_TYPE='1'\r\n" + 
					"AND A.CTI_MODEL_CODE=?\r\n" + 
					"AND B.CFI_ITEM_TYPE IN ('2','3')\r\n" + 
					"AND B.CFI_FIX_STATUS IN ('0','1','2')";
			return modelService.listDataSql(strSql,new Object[]{itemCode});
		}
		catch(Exception ex){
			log.error("getManufacture:",ex);
			return null;
		}
	}
    
	/**
	 * 甘特图数据对象(月排程)
	 * 
	 * @author Chaos 所有时长最大精度到分钟m
	 */
	public class MonthGantt{
		//常量
		private final String STEP_DATA_SN="PROJECT_STEP";//阶别代码字段
		private final String STEP_DATA_NAME="STEP_NAME";//阶别名称
		private final String STEP_START_TIME="STEP_START_TIME";//阶别起始时间
		private final String STEP_END_TIME="STEP_END_TIME";//阶别起始时间
		private final String EXC_TYPE_NAME = "PPE_EXECPTION_TYPE";// 列外类型字段
		private final String EXC_TIME_NAME = "PPE_DURATION";// 列外时长字段
		private final String CAL_LINE_SN = "PPC_AREA_SN";// 产能日历线体字段
		private final String CAL_MASTER_ID = "CAL_ID";// 工厂日历主表ID标识
		private final String CAL_IS_SAT = "PPC_SAT_FLAG";// 周六是否上班字段
		private final String CAL_IS_SUN = "PPC_SUN_FLAG";// 周末是否上班字段
		private final String LINE_AVA_DAYS = "LINE_AVA_DAYS";// 线体有效天数字段
		private final String LINE_DATA_ID="CA_ID";//线体SN ID字段标识
		private final String LINE_DATA_SN = "PM_AREA_SN";// 线体SN字段标识
		private final String LINE_DATA_NAME = "CA_NAME";// 线体名称字段标识
		private final String STEP_DEVICE_COE = "PPQ_DEVICE_QUOTIETY";// 阶别设备系数
		private final String STEP_MANPOWER_COE = "PPQ_MANPOWER_QUOTIETY";// 阶别人力系数
		private final String STEP_EFFICIENCY_COE = "PPQ_EFFICIENCY_QUOTIETY";// 阶别效率系数
		private final String STEP_QUALITY_COE = "PPQ_QUALITY_QUOTIETY";// 阶别品质系数
		private final String STEP_AVA_WORK_TIME="STEP_AVA_WORK_TIME";//阶别可用产能
		private final String LINE_START_TIME = "LINE_START_TIME";// 线体计算起始时间
		private final String LINE_END_TIME = "LINE_END_TIME";// 线体计算结束时间
		private final String LINE_DAYS="LINE_DAYS";//线体有效产能天数
		private final String LINE_SAT_DAYS="LINE_SAT_DAYS";//线体有效天数中的包含的周六天数
		private final String LINE_SUN_DAYS="LINE_SUN_DAYS";//线体有效天数中的包含的周日天数
		private final String PROJECT_START_TIME="PPW_START_DATE";//工单计划开始时间
		private final String PROJECT_END_TIME="PPW_END_DATE";//工单计划开始时间
		private final String FORMAT_TIME_FOR_MIN = "yyyy-MM-dd HH:mm:00";// 时间格式（精确到分钟m）
		private final String LINE_TIME_LOST_BY_COE="LINE_TIME_LOST_BY_COE";//线体因系数而损耗的产能
		private final String STEP_TIME_LOST_BY_COE="STEP_TIME_LOST_BY_COE";//阶别因系数而损耗的产能
		private final String LINE_STEP="LINE_STEP";//线体阶别
		//阶别变量
		private Map<String, Map<String, Object>> stepSn = new HashMap();// 存储涉及到的阶别
		// 线体变量
		private Map<String, Map<String, Object>> areaSn = new HashMap();// 存储涉及到的线别
		private Map<String, List> project = new HashMap();// 存储甘特图工单任务信息（工单信息来自月排程表中的工单信息）
		private Map<String, List> dayWorkTimeInfo = new HashMap();// 线体工厂日历中一天内工作时间段
		private Map<String, List> dayRestTimeInfo = new HashMap();// 线体工厂日历中一天内休息时间段
		private Map<String, Double> oneDayWorkTime = new HashMap();// 存储一天工作时长
		private Map<String, List> planCalendar = new HashMap();// 存储产能日历主表信息
		private Map<String, List> exceptionInfo = new HashMap();// 存储例外信息
		private Map<String, Double> availableTime = new HashMap();// 存储线体有效工时
		private Map<String, Double> avilableDays = new HashMap();// 存储有效天数
		private Map<String, List> coefficient = new HashMap();// 存储系数
		private Map<String, Map> lineCalenddarMasterInfo = new HashMap();// 存储线体工厂日历主表信息
		private Map<String,Integer> stepAppendWorkTime=new HashMap();//在出现未关结的工单，且使阶别的开始时间发生变化时，需要额外添加的产能（min）
        private Map<String,List> stepLineInfo=new HashMap();//阶别线体信息
		
		//甘特图默认变量
		String ganttDefualtCalStartTime=null;//甘特图默认产能有效开始时间
		String ganttDefualtCalEndTime=null;//甘特图默认产能有效结束时间
		
		// get set
		public MonthGantt instance() {
			return this;
		}

		public Map<String, Map<String, Object>> getStepSn() {
			return stepSn;
		}

		public void setStepSn(Map<String, Map<String, Object>> stepSn) {
			this.stepSn = stepSn;
		}

		public Map<String, Map<String, Object>> getAreaSn() {
			return areaSn;
		}

		public void setAreaSn(Map<String, Map<String, Object>> areaSn) {
			this.areaSn = areaSn;
		}

		public Map<String, List> getProject() {
			return project;
		}

		public void setProject(Map<String, List> project) {
			this.project = project;
		}

		public Map<String, List> getDayWorkTimeInfo() {
			return dayWorkTimeInfo;
		}

		public void setDayWorkTimeInfo(Map<String, List> dayWorkTimeInfo) {
			this.dayWorkTimeInfo = dayWorkTimeInfo;
		}

		public Map<String, List> getDayRestTimeInfo() {
			return dayRestTimeInfo;
		}

		public void setDayRestTimeInfo(Map<String, List> dayRestTimeInfo) {
			this.dayRestTimeInfo = dayRestTimeInfo;
		}

		public Map<String, Double> getOneDayWorkTime() {
			return oneDayWorkTime;
		}

		public void setOneDayWorkTime(Map<String, Double> oneDayWorkTime) {
			this.oneDayWorkTime = oneDayWorkTime;
		}

		public Map<String, List> getPlanCalendar() {
			return planCalendar;
		}

		public void setPlanCalendar(Map<String, List> planCalendar) {
			this.planCalendar = planCalendar;
		}

		public Map<String, List> getExceptionInfo() {
			return exceptionInfo;
		}

		public void setExceptionInfo(Map<String, List> exceptionInfo) {
			this.exceptionInfo = exceptionInfo;
		}

		public Map<String, Double> getAvailableTime() {
			return availableTime;
		}

		public void setAvailableTime(Map<String, Double> availableTime) {
			this.availableTime = availableTime;
		}

		public Map<String, Double> getAvilableDays() {
			return avilableDays;
		}

		public void setAvilableDays(Map<String, Double> avilableDays) {
			this.avilableDays = avilableDays;
		}

		public Map<String, List> getCoefficient() {
			return coefficient;
		}

		public void setCoefficient(Map<String, List> coefficient) {
			this.coefficient = coefficient;
		}

		public Map<String, Map> getLineCalenddarMasterInfo() {
			return lineCalenddarMasterInfo;
		}

		public void setLineCalenddarMasterInfo(Map<String, Map> lineCalenddarMasterInfo) {
			this.lineCalenddarMasterInfo = lineCalenddarMasterInfo;
		}

		public String getGanttDefualtCalStartTime() {
			return ganttDefualtCalStartTime;
		}

		public void setGanttDefualtCalStartTime(String ganttDefualtCalStartTime) {
			this.ganttDefualtCalStartTime = ganttDefualtCalStartTime;
		}

		public Map<String, List> getStepLineInfo() {
			return stepLineInfo;
		}

		public void setStepLineInfo(Map<String, List> stepLineInfo) {
			this.stepLineInfo = stepLineInfo;
		}

		public String getGanttDefualtCalEndTime() {
			return ganttDefualtCalEndTime;
		}

		public void setGanttDefualtCalEndTime(String ganttDefualtCalEndTime) {
			this.ganttDefualtCalEndTime = ganttDefualtCalEndTime;
		}
		
		// Method
		
		public Map<String, Integer> getStepAppendWorkTime() {
			return stepAppendWorkTime;
		}

		public void setStepAppendWorkTime(Map<String, Integer> stepAppendWorkTime) {
			this.stepAppendWorkTime = stepAppendWorkTime;
		}

		/* 设置甘特图默认变量
		 * @param defaultStartTime
		 * @param defaultEndTime
		 */
		public void setGanttDefault(String defaultStartTime,String defaultEndTime){
			try{
				this.ganttDefualtCalStartTime=defaultStartTime;
				this.ganttDefualtCalEndTime=defaultEndTime;
			}
			catch(Exception ex){
				log.error("setGanttDefault:"+ex.toString());
			}
		}

		/* 生成任务对象集合
		 * 
		 * @param dataList
		 * @param gantt
		 * @return
		 */
		public Boolean createTask(List<Map> dataList) {
			try {
				// 筛选任务
				this.setProject(new LinkedHashMap());
				for (Map task : dataList) {
					this.addTask(task);
				}

				return true;
			} catch (Exception ex) {
				log.error("createTask:" ,ex);
				return false;
			}
		}

		/* 添加任务
		 * 
		 * @param newTask
		 */
		public void addTask(Map newTask) {
			try {
				// 放入任务
				String stepSn = CommonMethod.Common.validateValue(newTask
						.get(STEP_DATA_SN));
				final String stepName = CommonMethod.Common
						.validateValue(newTask.get(STEP_DATA_NAME));
				if (StringUtils.isEmpty(stepSn)) {
					return;
				}
				//创建任务
				if (!this.getProject().keySet().contains(stepSn)) {
					//设置线体产能时间点
					this.setStepDateTime(stepSn, this.ganttDefualtCalStartTime, this.ganttDefualtCalEndTime);
					this.getProject().put(stepSn, new ArrayList());
					this.getStepSn().get(stepSn).put(STEP_DATA_NAME, stepName);// 记录涉及到的阶别
					//添加阶别下线体信息
					this.getStepLineInfo().put(stepSn, GetCommonInfo.getStepLineInfo(stepSn));
					//初始化当前阶别下的所有线体信息
					setAreaSn(stepSn,(List<Map>)this.getStepLineInfo().get(stepSn));
				}
				this.getProject().get(stepSn).add(newTask);// 放入对应阶别的任务
				// 修正阶别起始时间和结束时间
				Map<String, Object> snMap = this.getStepSn().get(stepSn);
				Date startTime = (Date)snMap.get(STEP_START_TIME);
				Date endTime = (Date)snMap.get(STEP_END_TIME);
				
				Date taskStartTime = CommonMethod.Common.convertStr2Date(newTask.get(PROJECT_START_TIME).toString());
				Date taskEndTime = CommonMethod.Common.convertStr2Date(newTask.get(PROJECT_END_TIME).toString());
				//1、若制令单开始时间小于线体产能计算时间域中的开始时间，则taskStartTime取制令单开始时间。并重新设置线体产能计算域中的开始时间为制令单开始时间
				//2、若制令单开始时间大于线体产能计算时间域中的开始时间，则taskStartTime取线体产能计算域的开始时间。
				if(startTime.getTime()>taskStartTime.getTime()){
					//重新设置产能计算域中的开始时间为制令单开始时间
					this.reSetStepDateTime(stepSn,CommonMethod.Common.date2String(taskStartTime, FORMAT_TIME_FOR_MIN), CommonMethod.Common.date2String(endTime, FORMAT_TIME_FOR_MIN));
					//当阶别的开始时间变化时，补充额外产能
					setStepAppendWorkTime(stepSn,startTime,taskStartTime);
				}
				else {
					taskStartTime=startTime;
				}
				if (null == startTime) {
					this.getStepSn().get(stepSn)
							.put(STEP_START_TIME, taskStartTime);
				} else {
					this.getStepSn()
							.get(stepSn)
							.put(STEP_START_TIME,
									CommonMethod.Common.compareDateMin(
											startTime, taskStartTime,
											FORMAT_TIME_FOR_MIN));
				}

				//修改，线体结束时间始终为产能有效结束时间
				this.getStepSn()
				.get(stepSn)
				.put(STEP_END_TIME,endTime);
			} catch (Exception ex) {
				log.error("addTask:" ,ex);
			}
		}
		
		/**
		 * 初始化阶别线体信息
		 */
		public void setAreaSn(String step,List<Map> lineInfo){
			try{
				final String vStep=step;
				for(Map map:lineInfo){
					this.getAreaSn().put(map.get(LINE_DATA_ID).toString(), new HashMap<String, Object>(){{
						put(LINE_STEP,vStep);
						put(LINE_START_TIME,CommonMethod.Common.convertStr2Date(ganttDefualtCalStartTime));
						put(LINE_END_TIME,CommonMethod.Common.convertStr2Date(ganttDefualtCalEndTime));
					}});
					setLineDateTime(map.get(LINE_DATA_ID).toString(),this.ganttDefualtCalStartTime,this.ganttDefualtCalEndTime);
				}
			}
			catch(Exception ex){
				log.error("setAreaSn:"+ex.toString());
			}
		}
		
		 /** 计算产能
		 * 
		 * @return
		 */
		public Boolean getCapacity() {
			try {
				String calId;
				// 计算有效产能
				for (Map.Entry<String, Map<String,Object>> areaSnMap: this.getAreaSn().entrySet()) {
					// 获取线体工厂日历ID
					this.getLineCalenddarMasterInfo().put(
							areaSnMap.getKey(),
							getCalendarMasterInfo(areaSnMap.getKey(),
									areaSnMap.getValue().get(LINE_START_TIME),
									areaSnMap.getValue().get(LINE_END_TIME)));
					// 获取工作时间段
					calId = this.getLineCalenddarMasterInfo().get(areaSnMap.getKey()) == null ? ""
							: this.getLineCalenddarMasterInfo().get(areaSnMap.getKey())
									.get(CAL_MASTER_ID).toString();
					this.getDayWorkTimeInfo().put(areaSnMap.getKey(),
							getWorkTimeInfo(calId));
					// 获取休息时间
					this.getDayRestTimeInfo().put(areaSnMap.getKey(),
							getRestTimeInfo(calId));
					// 获取每个线别一天的工作工时
					this.getOneDayWorkTime().put(areaSnMap.getKey(), getWorkTime(calId));
					// 获取产能日历主表信息
					this.getPlanCalendar().put(areaSnMap.getKey(),
							getPlanCalendarInfo(areaSnMap.getKey()));
					// 获取每个线别例外信息
					this.getExceptionInfo().put(
							areaSnMap.getKey(),
							getException(areaSnMap.getKey(), areaSnMap.getValue().get(LINE_START_TIME),
									areaSnMap.getValue().get(LINE_END_TIME)));
					// 获取线体系数
					this.getCoefficient().put(areaSnMap.getKey(),
							GetCommonInfo.getCoefficient(areaSnMap.getKey()));
				}

				return true;
			} catch (Exception ex) {
				log.error("getCapacity:" ,ex);
				return false;
			}
		}

		
		/**
		 * 添加阶别额外产能
		 * @param stepSn
		 * @param stepOldStartTime
		 * @param taskStartTime
		 */
		public void setStepAppendWorkTime(String stepSn,Date oldStartTime,Date newStartTime){
			try{
				//若不存在当前阶别的信息，则添加
				if(null==this.getStepAppendWorkTime().get(stepSn)){
					this.getStepAppendWorkTime().put(stepSn, 0);
				}
				//累加额外产能
				this.getStepAppendWorkTime().put(stepSn, this.getStepAppendWorkTime().get(stepSn)+((int)(oldStartTime.getTime()-newStartTime.getTime())/(1000*60)));
			}
			catch(Exception ex){
				log.error("setStepAppendWorkTime:"+ex.toString());
			}
		}
		
		/**
		 * 设置阶别开始时间和结束时间
		 * @param stepSn
		 * @param planStartTime
		 * @param planEndTime
		 */
		public void setStepDateTime(String stepSn, String planStartTime, String planEndTime){
			try{
				Date startDate = CommonMethod.Common
						.convertStr2Date(planStartTime);
				Date EndDate = CommonMethod.Common.convertStr2Date(planEndTime);
			    //校验是否存在阶别信息，若不存在则创建
				if(null==this.getStepSn().get(stepSn)){
					this.getStepSn().put(stepSn, new HashMap<String,Object>());
				}
				//放入阶别开始时间和结束时间
				this.getStepSn().get(stepSn).put(STEP_START_TIME,startDate.clone());
				this.getStepSn().get(stepSn).put(STEP_END_TIME, EndDate.clone());
			}
			catch(Exception ex){
				log.error("setStepDateTime:"+ex.toString());
			}
		}
		
		/**
		 * 重新设置阶别开始时间和结束时间
		 * @param stepSn
		 * @param planStartTime
		 * @param planEndTime
		 */
		public void reSetStepDateTime(String stepSn, String planStartTime, String planEndTime){
			try{
				setStepDateTime(stepSn,planStartTime,planEndTime);
			}
			catch(Exception ex){
				log.error("reSetStepDateTime："+ex.toString());
			}
		}

		/** 设置线体开始时间和结束时间（产能计算范围）
		 * 
		 * @param planStartTime
		 * @param planEndTime
		 */
		public void setLineDateTime(String areaSn, String planStartTime, String planEndTime) {
			try {
				Date date = null;
				Date startDate = CommonMethod.Common
						.convertStr2Date(planStartTime);
				Date EndDate = CommonMethod.Common.convertStr2Date(planEndTime);
			    //校验是否存在线体信息，若不存在则创建
				if(null==this.getAreaSn().get(areaSn)){
					this.getAreaSn().put(areaSn, new HashMap<String,Object>());
				}
				//放入线体开始时间和结束时间
				this.getAreaSn().get(areaSn).put(LINE_START_TIME,startDate.clone());
				this.getAreaSn().get(areaSn).put(LINE_END_TIME, EndDate.clone());
               //开始计算
				long diffTime = 0;
				double days = 0; //天要保留2位小数，精确到分钟min
				double satday = 0;
				double sunday = 0;
				if (null != startDate && null != EndDate) {
					diffTime = EndDate.getTime() - startDate.getTime();
					// 获取有效天数
					diffTime=diffTime / (1000 * 60 * 60 * 24);
					days = doubleMathR(Double.parseDouble(Long.toString(diffTime)), 2);
					this.getAreaSn().get(areaSn).put(LINE_DAYS,days);
					// 获取有效时间段内周六/周日天数
					date = startDate;
					while (date.getTime() <= EndDate.getTime()) {
						if (date.getDay() == 0) {
							sunday++;
						} else if (date.getDay() == 6) {
							satday++;
						}
						date.setDate(date.getDate() + 1);
					}
					this.getAreaSn().get(areaSn).put(LINE_SAT_DAYS,satday);
					this.getAreaSn().get(areaSn).put(LINE_SUN_DAYS,sunday);
				}
			} catch (Exception ex) {
				log.error("setLineDateTime:" ,ex);
			}
		}
		
		/**
		 * 手动放入阶别信息
		 * @param stepSn
		 * @param stepName
		 */
		public void putStep(String stepSn, Object stepName) {
			try {
				this.getStepSn().get(stepSn).put(STEP_DATA_NAME, stepName);// 记录涉及到的阶别
				//添加阶别下线体信息
				this.getStepLineInfo().put(stepSn, GetCommonInfo.getStepLineInfo(stepSn));
				//初始化当前阶别下的所有线体信息
				setAreaSn(stepSn,(List<Map>)this.getStepLineInfo().get(stepSn));
			} catch (Exception ex) {
				log.error("putStep:" ,ex);
			}
		}

		/**
		 * 计算甘特图信息
		 */
		public void calculate() {
			setLineAvailableDays();// 计算线体有效工作天数
			setAvailableTime();// 计算线体有效工时
			setStepAvailableTime();//计算阶别有效工时
		}
		
		/**
		 * 计算线体有效工作天数
		 */
		public void setLineAvailableDays() {
			try {
				Object isSat = null;
				Object isSun = null;
				Map var = null;
				Boolean isBoolSat = false;
				Boolean isBoolSun = false;
				double avaDays = 0;// 有效天数(保留2位小数，精确到分钟min)
				List excVar = null;
				for (Map.Entry<String, Map<String,Object>> areaSnMap : this.getAreaSn().entrySet()) {
					// 设置周六/周日是否上班
					excVar = this.getPlanCalendar().get(areaSnMap.getKey());
					if (null != excVar && excVar.size() > 0) {
						var = (Map) excVar.get(0);
						isSat = var.get(CAL_IS_SAT);
						isSun = var.get(CAL_IS_SUN);
					} else {
						// 若不存在产能日历信息，则取工厂日历中的标识
						var = this.getLineCalenddarMasterInfo().get(areaSnMap.getKey());
					}
					isSat = var == null ? "" : var.get(CAL_IS_SAT);
					isSun = var == null ? "" : var.get(CAL_IS_SUN);
					isBoolSat = null != isSat
                            && !StringUtils.isEmpty(isSat.toString()) && "Y".equals(isSat.toString());
					isBoolSun = null != isSun
                            && !StringUtils.isEmpty(isSun.toString()) && "Y".equals(isSun.toString());
					// 赋值
					this.getAreaSn().get(areaSnMap.getKey()).put(CAL_IS_SAT, isBoolSat);
					this.getAreaSn().get(areaSnMap.getKey()).put(CAL_IS_SUN, isBoolSun);
					// 计算线体有效天数(若周六、周日不上班，则不用扣减)
					avaDays=((double)areaSnMap.getValue().get(LINE_DAYS))-(isBoolSat ? 0 : (double)areaSnMap.getValue().get(LINE_SAT_DAYS))-(isBoolSun ? 0 : (double)areaSnMap.getValue().get(LINE_SUN_DAYS));
					this.getAreaSn().get(areaSnMap.getKey()).put(LINE_AVA_DAYS, avaDays);
				}
			} catch (Exception ex) {
				log.error("setLineAvailableDays:" ,ex);
			}
		}

		/**
		 * 计算有效工时（精度为分钟m）
		 */
		private void setAvailableTime() {
			try {
				List<Map> exceptionInfo = null;// 例外信息
				List<Map> coefficientInfo = null;// 系数信息
				String excType = null;// 例外类型
				double excTime = 0;// 列外时长
				double varTime = 0;// 时长变量
				double varTimeLostbyCoe=0;//因系数而损耗的产能
				double avaDays = 0;// 线体有效工作天数
				double devCoe = 1.0;// 设备系数
				double manCoe = 1.0;// 人力系数
				double effCoe = 1.0;// 效率系数
				double qutyCoe = 1.0;// 品质系数
				for (String areasn : this.getAreaSn().keySet()) {
					// 获取线体有效工作天数
					avaDays = (double)this.getAreaSn().get(areasn)
							.get(LINE_AVA_DAYS);
					// 获取总工作时长（一天工作时长*有效天数）
					varTime = this.getOneDayWorkTime().get(areasn) * avaDays;
					varTimeLostbyCoe=varTime;
					// 计算例外时长
					exceptionInfo = this.getExceptionInfo().get(areasn);
					if (exceptionInfo != null) {
						for (Map excMap : exceptionInfo) {
							if (null == excMap.get(EXC_TYPE_NAME)) {
								continue;// 若类型为空，可能数据，则跳过
							}
							excType = excMap.get(EXC_TYPE_NAME).toString();
							excTime = hourTomin(excMap.get(EXC_TIME_NAME));
							switch (excType) {
							case "1": // 加班
								varTime += excTime;
								break;
							case "2": // 放假
							case "3": // 调休
							case "4": // 设备维修
							case "5": // 其他
								varTime -= excTime;
								break;
							default:
								break;
							}
						}
					}
					// 计算系数
					devCoe = 1.0; // 重置系数
					manCoe = 1.0;
					effCoe = 1.0;
					qutyCoe = 1.0;
					// 获取
					coefficientInfo = this.getCoefficient().get(areasn);
					if (null != coefficientInfo && coefficientInfo.size() > 0) {
						Map coeMap = coefficientInfo.get(0);// 每个阶别只会有一条记录，若异常有多条记录，只取一条
						devCoe = null == coeMap.get(STEP_DEVICE_COE) ? 1
								: Double.parseDouble(coeMap
										.get(STEP_DEVICE_COE).toString());
						manCoe = null == coeMap.get(STEP_MANPOWER_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_MANPOWER_COE).toString());
						effCoe = null == coeMap.get(STEP_EFFICIENCY_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_EFFICIENCY_COE).toString());
						qutyCoe = null == coeMap.get(STEP_QUALITY_COE) ? 1
								: Double.parseDouble(coeMap.get(
										STEP_QUALITY_COE).toString());
					}
					varTime = (int) (varTime * devCoe * manCoe
							* effCoe * qutyCoe);
					varTimeLostbyCoe=(int)(varTimeLostbyCoe-varTime);//记录因系数而损耗的产能
					// 记录线体有效时长
					this.getAvailableTime().put(areasn, varTime);
					// 放入因系数而损耗的产能
					this.getAreaSn().get(areasn).put(LINE_TIME_LOST_BY_COE, varTimeLostbyCoe);
				}
			} catch (Exception ex) {
				log.error("setAvailableTime:" ,ex);
			}
		}
		
		/**
		 * 统计阶别有效总工时
		 */
		private void setStepAvailableTime(){
			try{
				double stepWorkTime=0;//阶别总产能
				double lostTimebyCoe=0;//阶别因系数而损失的产能
				for(String step:this.getStepSn().keySet()){
					//遍历阶别下的所有线体
					stepWorkTime=0;
					lostTimebyCoe=0;
					List<Map> areaInfo=this.getStepLineInfo().get(step);
					if(null==areaInfo){
						continue;
					}
					//获取阶别总产能/阶别因系数而损失的产能
					for(Map area:areaInfo){
						stepWorkTime+=this.getAvailableTime().get(area.get(LINE_DATA_ID).toString()); 
						lostTimebyCoe+=Double.parseDouble(this.getAreaSn().get(area.get(LINE_DATA_ID).toString()).get(LINE_TIME_LOST_BY_COE).toString());
					}
					//阶别总产能=阶别下的所有产能+阶别额外产能
					stepWorkTime+=this.getStepAppendWorkTime().get(step)==null?0:this.getStepAppendWorkTime().get(step);
					//填入阶别总产能
					this.getStepSn().get(step).put(STEP_AVA_WORK_TIME, stepWorkTime);
					//填入阶别因系数而损失的产能
					this.getStepSn().get(step).put(STEP_TIME_LOST_BY_COE, lostTimebyCoe);
				}
			}
			catch(Exception ex){
				log.error("setStepAvailableTime:"+ex.toString());
			}
		}
		
		/* 小时转分钟
		 * 
		 * @param hours
		 * @return
		 */
		private int hourTomin(Object hours) {
			if (null == hours || "" == hours.toString()) {
				return 0;
			} else {
				Double min = Math
						.floor(Double.parseDouble(hours.toString()) * 60);
				return min.intValue();
			}
		}
		
		/**
		 * double保留小数
		 * 
		 * @param value
		 *            double原值
		 * @param roundNum
		 *            小数位数
		 * @return
		 */
		private double doubleMathR(double value, int roundNum) {
			try {
				BigDecimal b = new BigDecimal(value);
				return b.setScale(roundNum, BigDecimal.ROUND_UP).doubleValue();
			} catch (Exception ex) {
				log.error("doubleMathR:" ,ex);
				return -1;
			}
		}
	}
}  
