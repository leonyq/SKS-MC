package com.more.taskCenter.taskBuss;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 任务反馈-保存
 * 
 */
public class TaskCenterFeedbackSave implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unused")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        HttpServletRequest request=modelAction.getRequest();
        String taskId =request.getParameter("paraMap1@0#TASK_ID").trim();//对应任务中心表格的任务ID
        String speed =request.getParameter("paraMap1@0#TASK_SPEED");
        String factBegTime =request.getParameter("paraMap2@0#FACT_BEG_TIME");
        String factEndTime =request.getParameter("paraMap2@0#FACT_END_TIME");
        //String feedBackTime = request.getParameter("") //paraMap1_FEEDBACK_TIME
        String nowDate=DateUtil.formatDate(DateUtil.getCurDate(),DateUtil.yyyyMMddHHmmss);
        String realHours = request.getParameter("reahour");//实际工时
        if(realHours==null || realHours==""){
        	realHours = "0";
        }
        String score = request.getParameter("score");//完成分值
        if(score == null || score==""){
        	score = "0";
        }
        String realEndTime = null;
        String state="";
       
        //取加班工时和请假工时
        String sqlTaskM = "select OVER_HOURS,LEA_HOURS,PRE_HOURS,TASK_SCORE from T_TK_TASKCENTER where ID=? ";
        List<Map> taskList = modelService.listDataSql(sqlTaskM, new Object[]{taskId});
		Map<String,Object> taskMap = new HashMap<String,Object>();
		taskMap = taskList.get(0);
		
		Object overHoursP = taskMap.get("OVER_HOURS");
		Object leaHoursP = taskMap.get("LEA_HOURS");
		Object preHoursP = taskMap.get("PRE_HOURS");//预估工时
		Object taskScoreP = taskMap.get("TASK_SCORE");//任务分值
		if(taskScoreP == null || taskScoreP==""){
			taskScoreP = "100";
		}
		
		if(overHoursP==null || overHoursP==""){
			overHoursP = "0";
		}
		if(leaHoursP==null || leaHoursP==""){
			leaHoursP = "0";
		}
		String overHoursPP = overHoursP.toString();
		String leaHoursPP = leaHoursP.toString();
		String taskScore = taskScoreP.toString();
        Double overHours = Double.parseDouble(overHoursPP);
        Double leaHours = Double.parseDouble(leaHoursPP);
        Double worktime = null;
        if(speed!=null&&!"".equals(speed)){
            Double i=Double.parseDouble(speed);
            if(i>0)  state="2";
            if(i==100) {
                state="6";
                if(StringUtils.isBlank(factEndTime)){
                    return modelAction.alertParentInfo((modelAction.getText("请填写实际完成时间")));
                }else{
                	realEndTime = factEndTime;
                	
                	
                }
            }else{
            	realEndTime = nowDate;
            	
            	
          }
          //计算实际工时（若实际完成时间未填，则取当前系统时间）
        	//1.判断实际时间
        	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	try {
				Date begDate = sdf.parse(factBegTime);
				Date endDate = sdf.parse(realEndTime);
				Double beginDayHours1 = (double)begDate.getHours();
				Double endDayHours1 =  (double)endDate.getHours();
				Double beginDayHours2 = (double)begDate.getMinutes()/60;
				Double endDayHours2 =  (double)endDate.getMinutes()/60;
				Double beginDayHours = beginDayHours1 + beginDayHours2;
				Double beginDayHoursTes = beginDayHours1 + beginDayHours2;
				Double endDayHours = endDayHours1 + endDayHours2;
				Double endDayHoursTes = endDayHours1 + endDayHours2;
				long  day=(endDate.getTime()-begDate.getTime())/(24*60*60*1000);//计算天数
				if(endDate.getTime()<begDate.getTime()){
					return modelAction.alertParentInfo((modelAction.getText("完成时间早于开始时间，填写有误")));
				}
				if(endDayHours>=beginDayHours){
					day--;
				}
				int begWeekDay = begDate.getDay();//获取星期
                int endWeekDay = endDate.getDay();//获取星期
				//long beginDayTime =begDate.getTime();//天数是否减一判断
				//long endDayTime = endDate.getTime();//天数是否减一判断
                //判断开始时间所在时间段
                if(begWeekDay == 0 || begWeekDay == 6){
                	beginDayHours = 17.5;//周末不计算时间
                }else{
                	if(12<beginDayHours && beginDayHours<13){
                		beginDayHours = 12.0;//午休时间内按早上工时3小时计算
    				}
    				
    				if(beginDayHours>17.5){
    					beginDayHours = 17.5;//当天内开始时间不在正常工作时间，不计算
    				}
    				if(beginDayHours<9){
    					beginDayHours = 9.0 ;//当天内开始时间小于9点，按9点计算
    				}
    				if(beginDayHours<13){
    					beginDayHours++;
    				}
    				
                }
				//判断反馈时间所在时间段
                if(endWeekDay == 0 || endWeekDay == 6){
                	endDayHours = 9.0;//周末不计算时间
                }else{
                	if(12<endDayHours && endDayHours<13){
    					endDayHours = 12.0;//午休时间内按早上工时3小时计算
    				}
    				
    				if(endDayHours>17.5){
    					endDayHours = 17.5;//当天内超时按一天7.5计算
    				}
    				if(endDayHours<9){
    					endDayHours = 9.0 ;//时间延长到下一天，不算
    				}
    				if(endDayHours>12){
    					endDayHours--;
    				}
                }
				//判断开始与结束之间是否有周末
                if(day<=7){
                	if((endWeekDay<begWeekDay || (endWeekDay==begWeekDay && endDayHoursTes<beginDayHoursTes)) && endWeekDay!=0 && begWeekDay!=6){
    					day = day-2;
    				}
    				if(((endWeekDay<begWeekDay || (endWeekDay==begWeekDay && endDayHoursTes<beginDayHoursTes)) &&(endWeekDay!=0 && begWeekDay==6 )) ||
    						((endWeekDay<begWeekDay || (endWeekDay==begWeekDay && endDayHoursTes<beginDayHoursTes)) &&(endWeekDay==0 && begWeekDay!=6 )) ){
    					day--;
    				}	
                }else{
                	int week =  (int)(day/7);
    				day = day-2*week;
    				if(begWeekDay==0 || begWeekDay==6){
    					day--;
    				}
                    if(endWeekDay==0 || endWeekDay==6){
    					day--;
    				}
                }
				
				
				Double a = 17.5 - beginDayHours;
				Double b = endDayHours -9;
				
				Double workDay = (double) day;
				worktime = 7.5*workDay + a + b;//计算正常工作时间
				worktime = worktime + overHours - leaHours;
				if(worktime==0){
					worktime = 0.1;
				}
				realHours = String.format("%.1f", worktime);//实际工时
				
				//System.out.println(realHours);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        
        if(preHoursP == null || preHoursP==""){
        	preHoursP = realHours;
		}
        String preHours = preHoursP.toString();
        Double nowScoreP = (Double.parseDouble(taskScore)*Double.parseDouble(preHours))/Double.parseDouble(realHours);
        if(nowScoreP>150.0){
           nowScoreP = 150.0;
        }
        String nowScore = String.format("%.1f", nowScoreP);
        TableDataMapExt tdmap = new TableDataMapExt();
        //CommMethod.editSysDefCol(tdmap.getColMap(), userDto);
        tdmap.getColMap().put("TASK_STATE", state);
        tdmap.getColMap().put("SPEED_PROGRESS", speed);
        tdmap.getColMap().put("REA_HOURS", realHours);//COMPLETION_SCORE
        tdmap.getColMap().put("COMPLETION_SCORE", nowScore);
        if(StringUtils.isNotBlank(factBegTime)){
            tdmap.getColMap().put("FACT_BEG_TIME", DateUtil.parseDate(factBegTime, "yyyy-MM-dd HH:mm:ss"));
        }
        
        if(StringUtils.isNotBlank(factEndTime)){
           tdmap.getColMap().put("FACT_END_TIME", DateUtil.parseDate(factEndTime, "yyyy-MM-dd HH:mm:ss")); 
        }
        else{
            tdmap.getColMap().put("FACT_END_TIME", "");   
        }
        tdmap.setTableName("T_TK_TASKCENTER");
        tdmap.setSqlWhere("and ID = ?");
        tdmap.getSqlWhereArgs().add(taskId);
        int res = modelService.edit(tdmap);
        if (res < 1)
        {
          throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("未找到数据"));
        }
        return modelAction.addComm();
        
    }
}