var isOpenHolyday=false; //�Ƿ����ýڼ���
var isActiveSpecialTime=true;//�Ƿ���������ʱ���
var specialRestType=[2,3,4,6];//����ʱ�������rest
var specialWorkType=[1,5,7,8];//����ʱ�������work
var isChildTaskPainting=true;//����������ʱ����Ƿ���ɫ
var isFatherTaskPainting=true;//����������ʱ����Ƿ���ɫ
var comLang={};//ͨ�ö�����

//������
function getLanguage(language)
{
	var lang=comLang[language];
	return lang==null?"?"+language:lang;
	}

function createMonthGanttTask(param){
  try{
	var task={};
	//插件必要属性
	task.id=typeof(param.id)=="undefined"?"":param.id;
	task.code=typeof(param.code)=="undefined"?"":param.code;
	task.name=typeof(param.name)=="undefined"?"":param.name;
	task.level=typeof(param.level)=="undefined"?"":param.level;
	task.status=typeof(param.status)=="undefined"?"":param.status;
	task.start=typeof(param.start)=="undefined"?"":param.start;
	task.duration=typeof(param.duration)=="undefined"?0:param.duration;
	task.end=typeof(param.end)=="undefined"?"":param.end;
	task.startIsMilestone=typeof(param.startIsMilestone)=="undefined"?"":param.startIsMilestone;
	task.endIsMilestone=typeof(param.endIsMilestone)=="undefined"?"":param.endIsMilestone;
	task.depends=typeof(param.depends)=="undefined"?"":param.depends;
	task.hasChild=typeof(param.hasChild)=="undefined"?"":param.hasChild;
	task.collapsed=typeof(param.collapsed)=="undefined"?"":param.collapsed;
	task.stepMaxSeq=typeof(param.stepMaxSeq)=="undefined"?"":param.stepMaxSeq;//当前阶别，子任务最大索引
	task.progress=typeof(param.progress)=="undefined"?"":param.progress;
	//月排程表工单必要属性
	task.taskGuid=typeof(param.taskGuid)=="undefined"?"":param.taskGuid;
	task.monthPlanDoc=typeof(param.monthPlanDoc)=="undefined"?"":param.monthPlanDoc;
	task.dataAuth=typeof(param.dataAuth)=="undefined"?"":param.dataAuth;
	task.deptId=typeof(param.deptId)=="undefined"?"":param.deptId;
	task.createUser=typeof(param.createUser)=="undefined"?"":param.createUser;
	task.createTime=typeof(param.createTime)=="undefined"?"":param.createTime;
	task.editUser=typeof(param.editUser)=="undefined"?"":param.editUser;
	task.eidtTime=typeof(param.eidtTime)=="undefined"?"":param.eidtTime;
	task.projectId=typeof(param.projectId)=="undefined"?"":param.projectId;
	task.projectPlanNum=typeof(param.projectPlanNum)=="undefined"?"":param.projectPlanNum;//计划数量
	task.monthPlanNum=typeof(param.monthPlanNum)=="undefined"?"":param.monthPlanNum;//已排产数量
	task.monthNowNum=typeof(param.monthNowNum)=="undefined"?"":param.monthNowNum;//当前排产数量
	task.startDate=typeof(param.startDate)=="undefined"?"":param.startDate;
	task.endDate=typeof(param.endDate)=="undefined"?"":param.endDate;
	task.deliveryDate=typeof(param.deliveryDate)=="undefined"?"":param.deliveryDate;
	task.perTask=typeof(param.perTask)=="undefined"?"":param.perTask;
	task.planGroup=typeof(param.taskGroup)=="undefined"?"":param.taskGroup;
	//非月排程表必要属性
	task.isStep=typeof(param.isStep)=="undefined"?"":param.isStep;
	task.taskOpt=typeof(param.taskOpt)=="undefined"?"":param.taskOpt;
	task.isChanged=typeof(param.isChanged)=="undefined"?"":param.isChanged;
	task.addType=typeof(param.addType)=="undefined"?"":param.addType;//添加任务到甘特图中的方式
	task.stepSn=typeof(param.stepSn)=="undefined"?"":param.stepSn;
	task.stepName=typeof(param.stepName)=="undefined"?"":param.stepName;
	task.projectStatus=typeof(param.projectStatus)=="undefined"?"":param.projectStatus;
	task.projectStatusName=typeof(param.projectStatusName)=="undefined"?"":param.projectStatusName;
	task.itemCode=typeof(param.itemCode)=="undefined"?"":param.itemCode;
	task.itemName=typeof(param.itemName)=="undefined"?"":param.itemName;
	task.standarTime=typeof(param.standarTime)=="undefined"?"":param.standarTime;//阶别标准工时
	task.projectPlanTime=typeof(param.projectPlanTime)=="undefined"?"":param.projectPlanTime;//依据工单计划数量所需要的工时
	task.monthPlanTime=typeof(param.monthPlanTime)=="undefined"?"":param.monthPlanTime;
	task.projectInputNum=typeof(param.projectInputNum)=="undefined"?0:param.projectInputNum;
	task.projectFinishedNum=typeof(param.projectFinishedNum)=="undefined"?0:param.projectFinishedNum;
	task.countEditMax=typeof(param.countEditMax)=="undefined"?0:param.countEditMax;//拆分和添加工单后，任务可拉伸的最大值
	task.countEditMin=typeof(param.countEditMin)=="undefined"?0:param.countEditMin;//拆分和添加工单后，任务可拉伸的最小值
	task.taskException=typeof(param.taskException)=="undefined"?false:param.taskException;//任务是否存在异常
	task.isPlanNumChanging=typeof(param.isPlanNumChanging)=="undefined"?false:param.isPlanNumChanging;//计划数量是否正在改变
	//阶别必要属性
	task.availableWorkTime=typeof(param.availableWorkTime)=="undefined"?0:param.availableWorkTime;
	task.usedWorkTime=typeof(param.usedWorkTime)=="undefined"?0:param.usedWorkTime;
	task.lostTimebyCoe=typeof(param.lostTimebyCoe)=="undefined"?0:param.lostTimebyCoe;
	task.dayWorkTimeInfo=typeof(param.dayWorkTimeInfo)=="undefined"?[]:param.dayWorkTimeInfo;
	task.dayRestTimeInfo=typeof(param.dayRestTimeInfo)=="undefined"?[]:param.dayRestTimeInfo;
	task.exceptionTimeInfo=typeof(param.exceptionTimeInfo)=="undefined"?[]:param.exceptionTimeInfo;
	task.stepLineInfo=typeof(param.stepLineInfo)=="undefined"?[]:param.stepLineInfo;
	task.lineCount=typeof(param.lineCount)=="undefined"?0:param.lineCount;
	return task;
  }
  catch(error){}
}

/**
 * 控制台输出日志
 * @param {标识} flag 
 */
function logger(flag){
  try{
      var output="at "+(new Date())+":"+flag;
      console.log(output);
  }
  catch(error){
    console.error(error);
  }
}

