package com.more.buss.eis.bd.calendar.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import edu.emory.mathcs.backport.java.util.concurrent.TimeUnit;

/**
 * @Title 增加工厂日历
 * @Description 新增工厂日历信息，工作时间，休息时间
 * @ClassName AddCalendarSereice
 * @author csh.
 * @version 1.0 developer 2017-1-12 created
 * @see AddCalendarSereice
 * @since 2017-1-12
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddCalendarSereice implements FuncService {
	/**
	 * @param modelAction  modelAction
	 * @param modelService modelService
	 * @return String
	 * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
	 *      com.more.fw.core.dbo.model.service.ModelService)
	 */
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "null" })
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		HttpServletRequest hsr = modelAction.getRequest();
		String isCloseWin = hsr.getParameter("isCloseWin");
		String formId = hsr.getParameter("formId");
		// String userDeptId = CommMethod.getSessionUser().getDeptId();

		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

		if (StringUtils.isBlank(formId)) {
			formId = hsr.getParameter("formIds");
		}
		String iframeId = hsr.getParameter("iframeId");

		try { // 工厂日历数据
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			String calName = hsr.getParameter("calName");
			String sql = "select t.CAL_NAME from T_CO_CALENDAR t where t.CAL_NAME=? and t.DATA_AUTH=? ";
			int count = modelService.countSql(sql, new Object[] { calName, dataAuth });
			if (count != 0) {
				return modelAction.alertParentInfo(modelAction.getText("日历名称已存在"));
			}
			Integer calStartMonth = Integer.parseInt(hsr.getParameter("calStartMonth"));
			Integer calEndMonth = Integer.parseInt(hsr.getParameter("calEndMonth"));
			String calSatFlag = hsr.getParameter("calSatFlag");
			String calSunFlag = hsr.getParameter("calSunFlag");
			String calDefaultFlag = hsr.getParameter("calDefaultFlag");
			String sqlflag = "select t.ID from T_CO_CALENDAR t where t.CAL_DEFAULT_FLAG = ?  and t.DATA_AUTH=? ";
			int countflag = modelService.countSql(sqlflag, new Object[] { "Y", dataAuth });
			// int countflag = modelService.execSql(sqlflag);
			if (countflag != 0) {
				if ("Y".equals(calDefaultFlag)) {
					return modelAction.alertParentInfo(modelAction.getText("工厂日历已存在默认标识"));
				}
			}
			String id = StringUtils.getUUID();
			if (calSatFlag == null) {
				calSatFlag = "N";
			}
			if (calSunFlag == null) {
				calSunFlag = "N";
			}
			if (calDefaultFlag == null) {
				calDefaultFlag = "N";
			}
			// 工作时间信息数、休息时间信息数
			Integer workTime_count = Integer.parseInt(hsr.getParameter("workTime_count"));
			Integer restTime_count = Integer.parseInt(hsr.getParameter("restTime_count"));
			Integer areaCount = Integer.parseInt(hsr.getParameter("areaCount"));

			Map calMap = null;
			Map WTMap = null;
			Map areaMap = null;
			Map RTMap = null;
			Date sdate = null;
			Date edate = null;
			TableDataMapExt caltd = null;
			TableDataMapExt wttd = null;
			TableDataMapExt rttd = null;
			TableDataMapExt areatd = null;
			String wtid = null;
			String wGroup = null;
			String wTime = null;
			String wStart = null;
			String wEnd = null;
			String wOverFalg = null;
			String wInterDay = null;
			String rtid = null;
			String rEnd = null;
			String rStart = null;
			String areaID = null;
			String aid = null;
			long rt = 0;
			long countRT = 0;
			String areasql = "select t2.cal_name,t4.ca_name,t.cal_start_month,t.cal_end_month from t_co_calendar t,"
					+ "(select t1.cal_id from T_CO_CALENDAR_LINE t1 where t1.area_id = ? and t1.data_auth = ? ) t3 "
					+ "left join T_CO_CALENDAR t2 on t2.id = t3.cal_id "
					+ "left join T_CO_AREA t4 on t4.ca_id = ? and t4.data_auth = ? "
					+ "where t.id in (t3.cal_id) and t.data_auth = ? ";
			List<Map> areaList = null;
			Map areaListMap = null;
			int areaListSize;
			int calStartMonth_s = 0;
			int caEndMonth_s = 0;

			// 插入线别信息
			for (int i = 0; i < areaCount; i++) {
				areaID = hsr.getParameter("areaID" + i);
				areaList = modelService.listDataSql(areasql,
						new Object[] { areaID, dataAuth, areaID, dataAuth, dataAuth });
				areaListSize = areaList.size();
				if (!areaList.isEmpty()) {
					for (int j = 0; j < areaListSize; j++) {
						areaListMap = areaList.get(j);
						if ("" != areaListMap.get("CAL_START_MONTH") && null != areaListMap.get("CAL_START_MONTH")
								&& "" != areaListMap.get("CAL_END_MONTH") && null != areaListMap.get("CAL_END_MONTH")) {
							calStartMonth_s = Integer.parseInt(areaListMap.get("CAL_START_MONTH").toString());
							caEndMonth_s = Integer.parseInt(areaListMap.get("CAL_END_MONTH").toString());
							if ((calStartMonth <= caEndMonth_s && calStartMonth >= calStartMonth_s)
									|| (calEndMonth <= caEndMonth_s && calEndMonth >= calStartMonth_s)) {
								modelAction.setAjaxString(areaListMap.get("CA_NAME") + modelAction.getText("在")
										+ areaListMap.get("CAL_NAME") + modelAction.getText("下已存在"));
								return BaseActionSupport.AJAX;
							}
						}
					}
				}
				areatd = new TableDataMapExt();
				areaMap = areatd.getColMap();
				aid = StringUtils.getUUID();
				areatd.setTableName("T_CO_CALENDAR_LINE");
				areaMap.put("ID", aid);
				areaMap.put("CAL_ID", id);
				areaMap.put("AREA_ID", areaID);
				areaMap.put("DATA_AUTH", dataAuth);
				modelService.save(areatd);
			}

			// 插入工厂日历信息
			caltd = new TableDataMapExt();
			calMap = caltd.getColMap();
			caltd.setTableName("T_CO_CALENDAR");
			calMap.put("ID", id);
			calMap.put("CAL_NAME", calName);
			calMap.put("CAL_START_MONTH", calStartMonth);
			calMap.put("CAL_END_MONTH", calEndMonth);
			calMap.put("CAL_SAT_FLAG", calSatFlag);
			calMap.put("CAL_SUN_FLAG", calSunFlag);
			calMap.put("CAL_DEFAULT_FLAG", calDefaultFlag);
			calMap.put("DATA_AUTH", dataAuth);
			modelService.save(caltd);

			// 插入工作时间信息
			for (int i = 0; i < workTime_count; i++) {
				wGroup = hsr.getParameter("work_time_n" + i);
				wTime = hsr.getParameter("work_time_t" + i);
				wStart = hsr.getParameter("work_time_s" + i);
				wEnd = hsr.getParameter("work_time_e" + i);
				wOverFalg = hsr.getParameter("work_time_o" + i);
				wInterDay = hsr.getParameter("work_time_i" + i);
				if (wGroup != null && wStart != null && wEnd != null && wOverFalg != null) {
					wtid = StringUtils.getUUID();
					wttd = new TableDataMapExt();
					WTMap = wttd.getColMap();
					wttd.setTableName("T_CO_CALENDAR_WORKTIME");
					WTMap.put("ID", wtid);
					WTMap.put("CAL_ID", id);
					WTMap.put("CALW_GROUP", wGroup);
					WTMap.put("CALW_TIME", wTime);
					sdate = sdf.parse(wStart);
					WTMap.put("CALW_START", sdate);
					edate = sdf.parse(wEnd);
					WTMap.put("CALW_END", edate);
					WTMap.put("CALW_OVER_FALG", wOverFalg);
					WTMap.put("CALW_INTER_DAY", wInterDay);
					WTMap.put("CALW_REST_TOTAL", countRT);
					WTMap.put("DATA_AUTH", dataAuth);
					modelService.save(wttd);

					for (int j = 0; j < restTime_count; j++) {
						rStart = hsr.getParameter("rest_time_s" + wGroup + wTime + j);
						rEnd = hsr.getParameter("rest_time_e" + wGroup + wTime + j);
						if (rStart != null && rEnd != null) {
							rtid = StringUtils.getUUID();
							rttd = new TableDataMapExt();
							RTMap = rttd.getColMap();
							rttd.setTableName("T_CO_CALENDAR_RESTTIME");
							RTMap.put("ID", rtid);
							RTMap.put("DATA_AUTH", dataAuth);
							RTMap.put("CALW_ID", wtid);
							sdate = sdf.parse(rStart);
							edate = sdf.parse(rEnd);
							RTMap.put("CALR_START", sdate);
							RTMap.put("CALR_END", edate);
							rt = (TimeUnit.MINUTES.toMillis(edate.getTime() - sdate.getTime()) / (60 * 1000)) / 60000;
							if (wInterDay.equals("Y")) {
								if (sdate.getTime() < 86400000 && edate.getTime() < sdate.getTime()) {
									rt = (1440 + rt);
								}
							}
							RTMap.put("CALR_REST", rt);
							modelService.save(rttd);
							StringBuilder wtsql = new StringBuilder().append(
									"update T_CO_CALENDAR_WORKTIME  set calw_rest_total = ((select t.CALW_REST_TOTAL CALW_REST_TOTAL from T_CO_CALENDAR_WORKTIME t where t.ID='")
									.append(wtid).append("')+").append(rt).append(") where id='").append(wtid)
									.append("'");
							modelService.execSql(wtsql.toString());
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增工厂日历失败"), e);
		}

		if ("0".equals(isCloseWin)) {
			return modelAction.alertInfoClear(modelAction.getText("新增成功"), "2");
		} else {
			return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
					Constants.OPERATE_TYPE_ADD);
			// return modelAction.reloadIframeById(iframeId, modelAction.getText("保存成功"));
		}
	}

}
