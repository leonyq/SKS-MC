var isOpenHolyday=false; //�Ƿ����ýڼ���
var isActiveSpecialTime=true;//�Ƿ���������ʱ���
var specialRestType=[2,3,4,6];//����ʱ�������rest
var specialWorkType=[1,5,7,8];//����ʱ�������work
var isChildTaskPainting=false;//����������ʱ����Ƿ���ɫ
var isFatherTaskPainting=true;//����������ʱ����Ƿ���ɫ
var isMoveAfter=true;//任务移动时，是否移动时间点位于其后的所有任务
var comSingleTrack="S";//AB轨/单轨标识
var comATrackFlag="A";//A轨标识
var comBTrackFlag="B";//B轨标识
var comLang={};//ͨ�ö�����

//������
function getLanguage(language)
{
	var lang=comLang[language];
	return lang==null?"?"+language:lang;
	}
//生成task
function createWeekGanttTask(param){
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
    task.lineMaxSeq=typeof(param.lineMaxSeq)=="undefined"?"":param.lineMaxSeq;//当前线别，子任务最大索引
    task.progress=typeof(param.progress)=="undefined"?"":param.progress;
    task.afterTask=typeof(param.afterTask)=="undefined"?[]:param.afterTask;
    //制令单必要属性
    //制令单表属性
    task.taskGuid=typeof(param.taskGuid)=="undefined"?"":param.taskGuid;
    task.moNumber=typeof(param.moNumber)=="undefined"?"":param.moNumber;
    task.projectId=typeof(param.projectId)=="undefined"?"":param.projectId;
    task.step=typeof(param.step)=="undefined"?"":param.step;
    task.areaSn=typeof(param.areaSn)=="undefined"?"":param.areaSn;
    task.face=typeof(param.face)=="undefined"?"":param.face;
    task.faceName=typeof(param.faceName)=="undefined"?"":param.faceName;
    task.modelCode=typeof(param.modelCode)=="undefined"?"":param.modelCode;
    task.pcbCode=typeof(param.pcbCode)=="undefined"?"":param.pcbCode;
    task.techSn=typeof(param.techSn)=="undefined"?"":param.techSn;
    task.startGroup=typeof(param.id)=="undefined"?"":param.startGroup;
    task.endGroup=typeof(param.endGroup)=="undefined"?"":param.endGroup;
    task.targetQty=typeof(param.targetQty)=="undefined"?"":param.targetQty;
    task.intputCount=typeof(param.intputCount)=="undefined"?"":param.intputCount;
    task.finshCount=typeof(param.finshCount)=="undefined"?"":param.finshCount;
    task.scarpQty=typeof(param.scarpQty)=="undefined"?"":param.scarpQty;
    task.issuedDate=typeof(param.issuedDate)=="undefined"?"":param.issuedDate;
    task.issuedEmp=typeof(param.issuedEmp)=="undefined"?"":param.issuedEmp;
    task.alterDate=typeof(param.alterDate)=="undefined"?"":param.alterDate;
    task.scheduleDate=typeof(param.scheduleDate)=="undefined"?"":param.scheduleDate;
    task.dueDate=typeof(param.dueDate)=="undefined"?"":param.dueDate;
    task.startDate=typeof(param.startDate)=="undefined"?"":param.startDate;
    task.closeDate=typeof(param.closeDate)=="undefined"?"":param.closeDate;
    task.pmStatus=typeof(param.pmStatus)=="undefined"?"":param.pmStatus;
    task.unitNum=typeof(param.unitNum)=="undefined"?"":param.unitNum;
    task.jigsawNum=typeof(param.jigsawNum)=="undefined"?"":param.jigsawNum;
    task.controlType=typeof(param.controlType)=="undefined"?"":param.controlType;
    task.snRule=typeof(param.snRule)=="undefined"?"":param.snRule;
    task.subRule=typeof(param.subRule)=="undefined"?"":param.subRule;
    task.repairMax=typeof(param.repairMax)=="undefined"?"":param.repairMax;
    task.errorScarp=typeof(param.errorScarp)=="undefined"?"":param.errorScarp;
    task.autoFqc=typeof(param.autoFqc)=="undefined"?"":param.autoFqc;
    task.fqcNum=typeof(param.fqcNum)=="undefined"?"":param.fqcNum;
    task.memo=typeof(param.memo)=="undefined"?"":param.memo;
    task.deptId=typeof(param.deptId)=="undefined"?"":param.deptId;
    task.createUser=typeof(param.createUser)=="undefined"?"":param.createUser;
    task.createTime=typeof(param.createTime)=="undefined"?"":param.createTime;
    task.editUser=typeof(param.editUser)=="undefined"?"":param.editUser;
    task.eidtTime=typeof(param.eidtTime)=="undefined"?"":param.eidtTime;
    task.closeReason=typeof(param.closeReason)=="undefined"?"":param.closeReason;
    task.dataAuth=typeof(param.dataAuth)=="undefined"?"":param.dataAuth;
    task.transferRule=typeof(param.transferRule)=="undefined"?"":param.transferRule;
    task.custCode=typeof(param.custCode)=="undefined"?"":param.custCode;
    task.planId=typeof(param.planId)=="undefined"?"":param.planId;
    task.planDocNum=typeof(param.planDocNum)=="undefined"?"":param.planDocNum;
    //非制令单表属性
    task.isLine=typeof(param.isLine)=="undefined"?"":param.isLine;
    task.isChanged=typeof(param.isChanged)=="undefined"?"":param.isChanged;
    task.taskOpt=typeof(param.taskOpt)=="undefined"?"":param.taskOpt;
    task.stepName=typeof(param.stepName)=="undefined"?"":param.stepName;
    task.statusName=typeof(param.statusName)=="undefined"?"":param.statusName;
    task.modelName=typeof(param.modelName)=="undefined"?"":param.modelName;
    task.productCount=typeof(param.productCount)=="undefined"?"":param.productCount;
    task.standarTime=typeof(param.standarTime)=="undefined"?"":param.standarTime;
    task.changeTime=typeof(param.changeTime)=="undefined"?0:param.changeTime;
    task.changeTimeSpan=typeof(param.changeTime)=="undefined"?0:param.changeTime*60*1000;
    task.planedNum=typeof(param.planedNum)=="undefined"?"":param.planedNum;
    task.planTime=typeof(param.planTime)=="undefined"?"":param.planTime;
    task.projectStartDate=typeof(param.projectStartDate)=="undefined"?"":param.projectStartDate;
    task.projectEndDate=typeof(param.projectEndDate)=="undefined"?"":param.projectEndDate;
    task.projectDelvDate=typeof(param.projectDelvDate)=="undefined"?"":param.projectDelvDate;
    task.projectStartTime=typeof(param.projectStartDate)=="undefined" || param.projectStartDate==""?"":DateStr2Time(param.projectStartDate);
    task.projectEndTime=typeof(param.projectEndDate)=="undefined" || param.projectEndDate==""?"":DateStr2Time(param.projectEndDate);
    task.projectDelvTime=typeof(param.projectDelvDate)=="undefined" || param.projectDelvDate==""?"":DateStr2Time(param.projectDelvDate);
    task.planGroup=typeof(param.planGroup)=="undefined"?"":param.planGroup;
    task.moInserting=typeof(param.moInserting)=="undefined"?false:param.moInserting;//是否属于插单
    task.perFace=typeof(param.perFace)=="undefined"?"":param.perFace;//前置面别
    task.reCalculate=typeof(param.reCalculate)=="undefined"?false:param.reCalculate;//是否进行重新计算
    task.isCalculated=typeof(param.isCalculated)=="undefined"?false:param.isCalculated;//是否已重新计算过
    task.isForSituation=typeof(param.isForSituation)=="undefined"?false:param.isForSituation;//是否为生产情况视图
    task.actStart=typeof(param.actStart)=="undefined"?"":param.actStart;//实际开工时间timespan
    task.actEnd=typeof(param.actEnd)=="undefined"?"":param.actEnd;//实际结束时间timespan
    task.multiTrack=typeof(param.multiTrack)=="undefined"?false:param.multiTrack;//是否为多轨
    task.track=typeof(param.track)=="undefined"?"":param.track;//轨道
    task.trackName=typeof(param.trackName)=="undefined"?"":param.trackName;//轨道名称
    task.changeTimePosition=typeof(param.changeTimePosition)=="undefined"?"":param.changeTimePosition;//换线时间位置
    task.realDuration=typeof(param.realDuration)=="undefined"?"":param.realDuration;//任务时间跨度（不包含换线时间的duration）
    task.taskException=typeof(param.taskException)=="undefined"?false:param.taskException;//任务是否存在异常
    //产能(针对线体)
    task.availableWorkTime=typeof(param.availableWorkTime)=="undefined"?0:param.availableWorkTime;
    task.usedWorkTime=typeof(param.usedWorkTime)=="undefined"?0:param.usedWorkTime;
    task.lostTimebyCoe=typeof(param.lostTimebyCoe)=="undefined"?0:param.lostTimebyCoe;
    task.isSat=typeof(param.isSat)=="undefined"?"":param.isSat;//周六是否上班
    task.isSun=typeof(param.isSun)=="undefined"?"":param.isSun;//周日是否上班
    //工厂日历工作时间和休息时间
    task.workTimeInfo=typeof(param.workTimeInfo)=="undefined"?[]:param.workTimeInfo;
    task.restTimeInfo=typeof(param.restTimeInfo)=="undefined"?[]:param.restTimeInfo;
    //例外时间
    task.exceptionTimeInfo=typeof(param.exceptionTimeInfo)=="undefined"?null:param.exceptionTimeInfo;
    task.specialTimeDurations=typeof(param.specialTimeDurations)=="undefined"?[]:param.specialTimeDurations;
    return task;
}
