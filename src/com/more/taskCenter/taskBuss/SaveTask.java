package com.more.taskCenter.taskBuss;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;

public class SaveTask implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		//预估工时 = 计划完成时间-计划开始时间+加班时间-休息时间
//		paraMap1@0#TASK_NAME 任务名称
//		paraMap1@0#PROJECT_ID 产品项目
//		paraMap1@0#TASK_STATE 任务状态
//		paraMap1@0#PRIORITY 优先级
//		paraMap1@0#TASK_DIFFICULTY 任务难度
//		paraMap1@0#TASK_SCORE 任务分值
//		paraMap1@0#PUBLISHER 任务发布人
//		paraMap1@0#EXECUTOR 任务执行人
//		paraMap1@0#CREATE_TIME 创建时间
//		paraMap1@0#PLAN_OVER_TIME 计划完成时间
//		paraMap1@0#FACT_BEG_TIME 实际开始时间
//		paraMap1@0#SPEED_PROGRESS任务进度
//		paraMap1@0#PRE_HOURS预估工时
		HttpServletRequest request=modelAction.getRequest();
		String isCloseWin = request.getParameter("isCloseWin");//判断是否关闭窗口所需的参数
		String taskName = request.getParameter("paraMap1@0#TASK_NAME");//任务名称
		String taskState = request.getParameter("paraMap1@0#TASK_STATE");//任务状态
		String priority = request.getParameter("paraMap1@0#PRIORITY");//优先级
		String taskDifficulty = request.getParameter("paraMap1@0#TASK_DIFFICULTY");//任务难度
		String taskScore = request.getParameter("paraMap1@0#TASK_SCORE");//任务分值
		String publisher = request.getParameter("paraMap1@0#PUBLISHER");//任务发布人
		String executor = request.getParameter("paraMap1@0#EXECUTOR");//任务执行人
		String factBegTime = request.getParameter("paraMap1@0#FACT_BEG_TIME");//实际开始时间
		String speedProgress = request.getParameter("paraMap1@0#SPEED_PROGRESS");//任务进度
		String projectId = request.getParameter("paraMap1@0#PROJECT_ID");//产品项目
		String prapPlanOverTime =  request.getParameter("paraMap1@0#PLAN_OVER_TIME");//计划完成时间
		//String prapCreateTime =  request.getParameter("paraMap1@0#CREATE_TIME");//创建时间
		String prapPlanBeginTime = request.getParameter("paraMap1@0#PLAN_BEGIN_TIME");//计划开始时间
		String prapOverHours =request.getParameter("paraMap1@0#OVER_HOURS");//加班时间
		String prapLeaHours =  request.getParameter("paraMap1@0#LEA_HOURS");//请假时间
		String taskDesc = request.getParameter("paraMap1@0#TASK_DESC");//任务描述
		Double reaTime = 0.0;
		String realHours = null;
		if(prapOverHours == null || prapOverHours==""){
			prapOverHours = "0" ;
		}
		if(prapLeaHours == null || prapLeaHours==""){
			prapLeaHours = "0";
		}
		Double OverHours = Double.parseDouble(prapOverHours);
		Double LeaHours = Double.parseDouble(prapLeaHours);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		try {
			Date planOverTime =  sdf.parse(prapPlanOverTime);
			//Date createTime =  sdf.parse(prapCreateTime);
			Date planBeginTime =  sdf.parse(prapPlanBeginTime);
			Double planHours1 = (double)planOverTime.getHours();
			Double planHours2 = (double)planOverTime.getMinutes()/60;
			Double planHours = planHours1 + planHours2;//计划完成时间当天小时数值
			
			//Double createHours1 = (double)createTime.getHours();
			//Double createHours2 = (double)createTime.getMinutes()/60;
			Double planBeginHours1 = (double)planBeginTime.getHours();
			Double planBeginHours2 = (double)planBeginTime.getMinutes()/60;			
			//Double createHours = createHours1 + createHours2;//创建时间当天小时数值
			//Double createHoursTes = createHours1 + createHours2;//创建时间当天小时数值			
			Double planHoursTes = planHours1 + planHours2;//计划完成时间当天小时数值	
			
			Double planBeginHours = planBeginHours1 + planBeginHours2;//计划开始时间小时数值
			Double planBeginHoursTes = planBeginHours1 + planBeginHours2;//计划开始时间小时数值			
			long day = (planOverTime.getTime()-planBeginTime.getTime())/(24*60*60*1000);
			if(planOverTime.getTime()<planBeginTime.getTime()){
				return modelAction.alertParentInfo((modelAction.getText("计划完成时间的填写早于计划开始时间，有误")));
			}
			if(planHours>=planBeginHours){
				day--;
			}
			//int createWeekDay = createTime.getDay();//创建时间星期数
			int planBeginDay = planBeginTime.getDay();//计划开始时间星期数
			int planWeekDay = planOverTime.getDay();//计划完成时间星期数
			//判断计划开始时间是否周末、工时的计算
			if(planBeginDay == 0 || planBeginDay == 6){
				planBeginHours = 17.5;
			}else{
				if(12<planBeginHours && planBeginHours<13){
				planBeginHours = 12.0;
				}
				if(planBeginHours>17.5){
				planBeginHours = 17.5;//当天开始时间不在工作时间内，不计算
				}
				if(planBeginHours < 9){
					planBeginHours = 9.0;//开始时间早于开班时间，按9点计算	
				}
				if(planBeginHours < 13){
					planBeginHours++;
				}
			}
			//判断计划完成时间是否周末、工时的计算
			if(planWeekDay == 0 || planWeekDay ==6){
				planHours = 9.0;
			}else{
				if(12<planHours && planHours<13){
					planHours = 12.0;
				}
				if(planHours>17.5){
					planHours = 17.5;//计划完成时间超出工作时间按17.5计算
				}
				if(planHours<9){
					planHours = 9.0;//时间延长至下一天不算
				}
				if(planHours>12){
					planHours--;
				}
			}
			//判断计划开始时间与计划完成之间是否有周末
			if(day<=7){
				if((planWeekDay<planBeginDay || (planWeekDay==planBeginDay && planHoursTes<planBeginHoursTes)) && planWeekDay!=0 && planBeginDay!=6){
					day = day -2;
				}
				if(((planWeekDay<planBeginDay || (planWeekDay==planBeginDay && planHoursTes<planBeginHoursTes)) &&(planWeekDay!=0 && planBeginDay==6 )) ||
						((planWeekDay<planBeginDay || (planWeekDay==planBeginDay && planHoursTes<planBeginHoursTes)) &&(planWeekDay==0 && planBeginDay!=6 )) ){
					day--;
				}	
			}else{
				int week =  (int)(day/7);
				day = day-2*week;
				if(planBeginDay==0 || planBeginDay==6){
					day--;
				}
                if(planWeekDay==0 || planWeekDay==6){
					day--;
				}
			}
			//计算 
			Double a = 17.5 - planBeginHours;
			Double b = planHours - 9;
			Double workDay = (double)day;
			reaTime = 7.5*workDay +a +b;//计算正常工作时间
			reaTime = reaTime+OverHours-LeaHours;
			if(reaTime<0){
				reaTime = 0.0;
			}
			realHours = String.format("%.1f", reaTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//存入数据
		TableDataMapExt taskTabke = new TableDataMapExt();
		taskTabke.getColMap().put("ID",StringUtils.getUUID());
		taskTabke.getColMap().put("TASK_NAME",taskName);
		taskTabke.getColMap().put("TASK_STATE",taskState);
		taskTabke.getColMap().put("PRIORITY",priority);
		taskTabke.getColMap().put("TASK_DIFFICULTY",taskDifficulty);
		taskTabke.getColMap().put("TASK_SCORE",taskScore);
		taskTabke.getColMap().put("PUBLISHER",publisher);
		taskTabke.getColMap().put("EXECUTOR",executor);
		taskTabke.getColMap().put("FACT_BEG_TIME",DateUtil.parseDate(factBegTime, "yyyy-MM-dd HH:mm:ss"));
		taskTabke.getColMap().put("SPEED_PROGRESS",speedProgress);
		taskTabke.getColMap().put("PROJECT_ID",projectId);
		taskTabke.getColMap().put("PLAN_OVER_TIME",DateUtil.parseDate(prapPlanOverTime, "yyyy-MM-dd HH:mm:ss"));
        taskTabke.getColMap().put("CREATE_TIME",DateUtil.getCurDate());
		taskTabke.getColMap().put("PLAN_BEGIN_TIME",DateUtil.parseDate(prapPlanBeginTime, "yyyy-MM-dd HH:mm:ss"));
		taskTabke.getColMap().put("TASK_DESC",taskDesc);
		taskTabke.getColMap().put("OVER_HOURS",prapOverHours);
		taskTabke.getColMap().put("LEA_HOURS",prapLeaHours);
		taskTabke.getColMap().put("PRE_HOURS",realHours);
		taskTabke.getColMap().put("FACT_END_TIME",null);
		taskTabke.getColMap().put("REA_HOURS","0");
 		taskTabke.getColMap().put("COMPLETION_SCORE","0");
 		taskTabke.setTableName("T_TK_TASKCENTER");
 		int res = modelService.save(taskTabke);
 		if (res < 1)
        {
          throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("sql出错"));
        }
		if( StringUtils.isBlank(isCloseWin)){
			return modelAction.alertInfoClear(modelAction.getText("新增成功"), "2");
		}else{		
			
			return modelAction.reloadParent(modelAction.getText("新增成功"));
		}//判断，并返回所需的效果
	}

}
