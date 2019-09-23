package com.more.mes.smt.invalidproducttime.oracle;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * 无效生产时间--定时器
 * @author development
 *
 */
public class InvalidProductTimer implements IJobx{
	
	private final Log log = LogFactory.getLog(this.getClass());

	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

	@SuppressWarnings("unchecked")
	@Override
	public void exec(Args arg0) throws Exception {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
			//判断是否是节假日     0:工作日，1周末，2法定节假日
			String holiday = getHolidayJson("date="+sdf.format(new Date()));
			if(holiday.equals("0")){ 
				//取出需要统计停线记录的在线制令单信息   线别
				String moSql = "select t.*,a.CA_STOP_TIME,b.PM_CONTROL_TYPE from T_PM_MO_ONLINE t " +
						"LEFT JOIN t_co_area a ON a.ca_id=t.pmo_area_sn " +
						"LEFT JOIN t_pm_mo_base b ON b.pm_mo_number=t.pmo_number " +
						"WHERE a.ca_stop_flag='Y' ";
				List<Map<String, Object>> moList = modelService.listDataSql(moSql);
				if(moList!=null&&moList.size()>0){
					int num = moList.size();
					String stopTime = null;//停线间隔
					String curTime = null;//当前时间
					Date curDate = null;
					Date nowDate = null;
					Date curHDate = null;
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					DateFormat df1 = new SimpleDateFormat("HH:mm:ss"); 
					//获取默认的停线间隔
					String stopSql = "select t.VR_VALUE from T_SYS_PARAMETER_INI t where t.VR_CLASS='MES0004' ";
					Map<String, Object> map = modelService.queryForMap(stopSql);
					//取出系统默认用户sys001
					String userSql = "select t.* from SY_USER t WHERE t.login_name='sys001' ";
					List<UserDto> user = modelService.listSql(userSql, null, null, null, null, new UserDto());
					//获取工厂日历   ----根据线体
					String lineWork = "select t.cal_id from T_CO_CALENDAR_LINE t where t.area_id =? ";
					List<Map<String, Object>> lineWorkList = null;//工作时间
					//获取工厂日历   ----默认
					String workSql = "SELECT a.id FROM t_co_calendar a WHERE a.cal_default_flag = 'Y' ";
					Map<String, Object> workMap = modelService.queryForMap(workSql);
					//工厂日历Id
					String workId = null;
					//取出工作时间的最后时间与开始工作时间
					String maxWorkSql = "SELECT to_char(max(t.calw_end),'hh24:mi:ss') max_time," +
							"to_char(MIN(t.calw_start),'hh24:mi:ss') MIN_TIME FROM T_CO_CALENDAR_WORKTIME t " +
							"WHERE t.cal_id=? ";
					List<Map<String, Object>> maxWorkList = null;//工作时间的最后时间
					//最后采集时间
					String colSql = "SELECT t.* FROM T_MID_STOPLINE_TIME t WHERE t.mst_area_sn=? ";
					List<Map<String, Object>> colList = null;//最后采集时间
					//判断线别，当前时间是否在停线记录表中有数据
					String checkSql = "SELECT t.* FROM T_CO_STOPLINE_INFO t WHERE t.csi_area_sn=? AND t.CSI_STATUS='1' AND t.CSI_TYPE='2' ";
					List<Map<String, Object>> checkList = null;//是否有数据
					//工作时间
					String workSql1 = "SELECT t.* FROM T_CO_CALENDAR_WORKTIME t " +
							"WHERE t.cal_id=? AND ? >= to_char(t.calw_start,'hh24:mi:ss') " +
							"AND ? <= to_char(t.calw_end,'hh24:mi:ss') ";
					List<Map<String, Object>> workList = null;//工作时间
					for(int i=0;i<num;i++){
						if(moList.get(i).get("CA_STOP_TIME")==null){
							if(map.get("VR_VALUE")!=null){
								stopTime = (String) map.get("VR_VALUE");
							}
						}else{
							stopTime = moList.get(i).get("CA_STOP_TIME").toString();
						}
						if(!moList.get(i).get("PM_CONTROL_TYPE").equals("0")&&stopTime!=null){//取到了停线间隔且制令单管控类型为批次
							lineWorkList = modelService.listDataSql(lineWork,new Object[]{moList.get(i).get("PMO_AREA_SN")});
							if(lineWorkList!=null&&lineWorkList.size()>0){
								workId = lineWorkList.get(0).get("CAL_ID").toString();
							}else{
								if(workMap.get("ID")!=null){
									workId = (String)workMap.get("ID");
								}
							}
							if(workId!=null){  //取到了工厂日历
								curTime = DateUtil.getCurTimeStr();
								nowDate = new Date();
								curDate = df.parse(df.format(nowDate));
								curHDate = df1.parse(df1.format(nowDate));
								maxWorkList = modelService.listDataSql(maxWorkSql,new Object[]{workId});
								Date maxWorkDate = df1.parse(maxWorkList.get(0).get("MAX_TIME").toString());
								Date minWorkDate = df1.parse(maxWorkList.get(0).get("MIN_TIME").toString());
								//出现跨天则修改最后采集时间为当前系统时间
								if(curHDate.getTime()>maxWorkDate.getTime()||curHDate.getTime()<minWorkDate.getTime()){
									TableDataMapExt mid = new TableDataMapExt();
									mid.setTableName("T_MID_STOPLINE_TIME");
									CommMethod.editSysDefCol(mid.getColMap(), user.get(0));
									mid.setSqlWhere(" and mst_area_sn ='"+moList.get(i).get("PMO_AREA_SN")+"'");
									mid.getColMap().put("MST_LASTCOLLECT_TIME", curDate);
									modelService.edit(mid);
								}
								colList = modelService.listDataSql(colSql,new Object[]{moList.get(i).get("PMO_AREA_SN")});
								Date lastDate = df.parse(colList.get(0).get("MST_LASTCOLLECT_TIME").toString());
								long diff = curDate.getTime() - lastDate.getTime();	
								long minu = diff / (1000 * 60);//系统时间减去最后采集时间  分钟
								TableDataMapExt stop = new TableDataMapExt();
								stop.setTableName("T_CO_STOPLINE_INFO");
								checkList = modelService.listDataSql(checkSql,new Object[]{moList.get(i).get("PMO_AREA_SN")});
								workList = modelService.listDataSql(workSql1,new Object[]{workId,curTime,curTime});
								if(workList!=null&&workList.size()>0&&checkList!=null&&checkList.size()>0){ //存在数据则修改结束停线时间    在工厂日历范围内（）
									CommMethod.editSysDefCol(stop.getColMap(), user.get(0));
									stop.setSqlWhere(" and id ='"+checkList.get(0).get("ID")+"'");
									stop.getColMap().put("CSI_END_TIME", curDate);
									if(!colList.get(0).get("MST_LASTCOLLECT_TIME").equals(checkList.get(0).get("CSI_BEGIN_TIME"))){//开始停线时间不等于最后采集时间则认为恢复生产
										Date beginDate = df.parse(checkList.get(0).get("CSI_BEGIN_TIME").toString());
										long beginDiff = curDate.getTime() - beginDate.getTime();
										long beginMinu = beginDiff / (1000 * 60);//系统时间减去停线开始时间  分钟  停线时长
										stop.getColMap().put("CSI_STATUS", "2");
										stop.getColMap().put("CSI_STOP_TIMES", beginMinu);
									}
									modelService.edit(stop);
								}
								if(workList!=null&&workList.size()>0&&minu>Long.parseLong(stopTime)){ //系统时间减去线体最后采集时间 大于停线间隔     在工厂日历范围内
									//往表中记录停线记录，状态为未确认
									if(checkList!=null&&checkList.size()>0){ //存在数据则修改结束停线时间
										stop.getColMap().clear();
										CommMethod.editSysDefCol(stop.getColMap(), user.get(0));
										stop.setSqlWhere(" and id ='"+checkList.get(0).get("ID")+"'");
										stop.getColMap().put("CSI_END_TIME", curDate);
										if(!colList.get(0).get("MST_LASTCOLLECT_TIME").equals(checkList.get(0).get("CSI_BEGIN_TIME"))){//开始停线时间不等于最后采集时间则认为恢复生产
											stop.getColMap().put("CSI_STATUS", "2");
										}
										modelService.edit(stop);
									}else{
										stop.getColMap().clear();
										CommMethod.addSysDefCol(stop.getColMap(), user.get(0));
										stop.getColMap().put("CSI_TYPE", "2");
										stop.getColMap().put("CSI_AREA_SN", moList.get(i).get("PMO_AREA_SN"));
										stop.getColMap().put("CSI_PROJECT_ID", moList.get(i).get("PMO_PROJECT_ID"));
										stop.getColMap().put("CSI_MO_NUMBER", moList.get(i).get("PMO_NUMBER"));
										stop.getColMap().put("CSI_STATUS", "1");
										stop.getColMap().put("CSI_BEGIN_TIME", colList.get(0).get("MST_LASTCOLLECT_TIME"));
										stop.getColMap().put("CSI_END_TIME", curDate);
										stop.getColMap().put("CSI_RECORD_EMP", user.get(0).getId());
										stop.getColMap().put("CSI_RECORD_TIME", DateUtil.getCurDate());
									 	modelService.save(stop);
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new Exception();
		}
	}
	
	//获取法定节假日
	public static String getHolidayJson(String httpArg){  
        String httpUrl="http://api.goseek.cn/Tools/holiday";  
           BufferedReader reader = null;  
           String result = null;  
           StringBuffer sbf = new StringBuffer();  
           httpUrl = httpUrl + "?" + httpArg;  
           try {  
               URL url = new URL(httpUrl);  
               HttpURLConnection connection = (HttpURLConnection) url  
                       .openConnection();  
               connection.setRequestMethod("GET");  
               connection.connect();  
               InputStream is = connection.getInputStream();  
               reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));  
               String strRead = null;  
               while ((strRead = reader.readLine()) != null) {  
                   sbf.append(strRead);
                   sbf.append("\r\n");
               }  
               reader.close();  
               result = sbf.toString();  
               JSONObject jsonObj = JSONObject.fromObject(result);
               result = jsonObj.get("data").toString();
           } catch (Exception e) {  
               e.printStackTrace();  
           }  
           return result;  
    }  

}
