/*
  Copyright (c) 2012-2014 Open Lab
  Written by Roberto Bicchierai and Silvia Chelazzi http://roberto.open-lab.com
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

/**
 * A method to instantiate valid task models from
 * raw data.
*/
function TaskFactory() {

  /**
   * Build a new Task
   */
  this.build = function(task) {
    // Set at beginning of day
    var adjusted_start = 0;
    var calculated_end = 0;
    var act_adjusted_start = 0;
    var act_calculated_end = 0;

    if(task.isLine){
      adjusted_start=task.start;
      calculated_end=task.end;
      getSpecialTimeDurations(task);
    }
    else{
      adjusted_start = computeStart(task.start,task.areaSn);
      calculated_end = computeEndByDuration(adjusted_start, task.duration,task);
      act_adjusted_start = computeStart((task.startDate=="" || typeof(task.startDate)=="undefined"?task.start:(new Date(task.startDate)).getTime()),task.areaSn);
      act_calculated_end=(task.closeDate=="" || typeof(task.closeDate)=="undefined"?computeEndByDurationSimple(act_adjusted_start, task.duration,task.areaSn):(new Date(task.closeDate)).getTime());
    }

    return new Task(task, adjusted_start, calculated_end,act_adjusted_start,act_calculated_end);
  };

}
function Task(task, start, end,actStart,actEnd) {
  this.id = task.id;
  this.name = task.name;
  this.progress=0;
  this.description = "";
  this.code = task.code;
  this.level = task.level;
  this.status = "STATUS_UNDEFINED";
  this.depends="";
  this.canWrite=true; // by default all tasks are writeable

//  this.start = task.start
//  this.duration = task.duration;
//  this.end = task.end;
  this.start=start;
  this.duration = task.duration;
  this.realDuration=task.duration;
  this.end=end;
  this.startIsMilestone = false;
  this.endIsMilestone = false;

  this.collapsed = task.collapsed;
  
  this.rowElement; //row editor html element
  this.ganttElement; //gantt html element
  this.master;

  this.assigs = [];
  this.lineMaxSeq=task.lineMaxSeq;
  this.specialTimeDurations=task.specialTimeDurations;//special time list 2018 by cc
  //mo attributes 2018 by cc
  this.afterTask=       task.afterTask;
  this.taskGuid=        task.taskGuid;
  this.moNumber=        task.moNumber;
  this.projectId=       task.projectId;
  this.step=            task.step;
  this.areaSn=          task.areaSn;
  this.face=            task.face;
  this.faceName=        task.faceName;
  this.modelCode=       task.modelCode;
  this.pcbCode=         task.pcbCode;
  this.techSn=          task.techSn;
  this.startGroup=      task.startGroup;
  this.endGroup=        task.endGroup;
  this.targetQty=       task.targetQty;
  this.intputCount=     task.intputCount;
  this.finshCount=      task.finshCount;
  this.scarpQty=        task.scarpQty;
  this.issuedDate=      task.issuedDate;
  this.issuedEmp=       task.issuedEmp;
  this.alterDate=       task.alterDate;
  this.scheduleDate=    task.scheduleDate;
  this.dueDate=         task.dueDate;
  this.startDate=       task.startDate;
  this.closeDate=       task.closeDate;
  this.pmStatus=        task.pmStatus;
  this.unitNum=         task.unitNum;
  this.jigsawNum=       task.jigsawNum;
  this.controlType=     task.controlType;
  this.snRule=          task.snRule;
  this.subRule=         task.subRule;
  this.repairMax=       task.repairMax;
  this.errorScarp=      task.errorScarp;
  this.autoFqc=         task.autoFqc;
  this.fqcNum=          task.fqcNum;
  this.memo=            task.memo;
  this.deptId=          task.deptId;
  this.createUser=      task.createUser;
  this.createTime=      task.createTime;
  this.editUser=        task.editUser;
  this.editTime=        task.editTime;
  this.closeReason=     task.closeReason;
  this.dataAuth=        task.dataAuth;
  this.transferRule=    task.transferRule;
  this.custCode=        task.custCode;
  this.planId=          task.planId;
  this.planDocNum=      task.planDocNum;
  this.isLine=          task.isLine;
  this.taskOpt=         task.taskOpt;
  this.stepName=        task.stepName;
  this.areaName=        task.areaName;
  this.statusName=      task.statusName;
  this.modelName=       task.modelName;
  this.productCount=    task.productCount;
  this.standarTime=     task.standarTime;
  this.changeTime=      task.changeTime;
  this.changeTimeSpan=  task.changeTimeSpan;
  this.planedNum=       task.planedNum;
  this.planTime=        task.planTime;
  this.projectStartDate=task.projectStartDate;
  this.projectEndDate=  task.projectEndDate;
  this.projectDelvDate= task.projectDelvDate;
  this.projectStartTime=task.projectStartTime;
  this.projectEndTime=  task.projectEndTime;
  this.projectDelvTime= task.projectDelvTime;
  this.planGroup=       task.planGroup;
  this.availableWorkTime=task.availableWorkTime;
  this.usedWorkTime=    task.usedWorkTime;
  this.workTimeInfo=    task.workTimeInfo;
  this.restTimeInfo=    task.restTimeInfo;
  this.exceptionInfo=   task.exceptionInfo;
  this.lostTimebyCoe=   task.lostTimebyCoe;
  this.moInserting=   task.moInserting;
  this.perFace=task.perFace;
  this.reCalculate=task.reCalculate;
  this.isCalculated=task.isCalculated;
  this.isForSituation=task.isForSituation;
  this.actStart=actStart;
  this.actEnd=actEnd;
  this.multiTrack=task.multiTrack;
  this.track=task.track;
  this.changeTimePosition=task.changeTimePosition;
  this.taskException=task.taskException;
}

Task.prototype.clone = function () {
  var ret = {};
  for (var key in this) {
    if (typeof(this[key]) != "function") {
      ret[key] = this[key];
    }
  }
  return ret;
};

Task.prototype.getAssigsString = function () {
  var ret = "";
  for (var i=0;i<this.assigs.length;i++) {
    var ass = this.assigs[i];
    var res = this.master.getResource(ass.resourceId);
    if (res) {
      ret = ret + (ret == "" ? "" : ", ") + res.name;
    }
  }
  return ret;
};

Task.prototype.createAssignment = function (id, resourceId, roleId, effort) {
  var assig = new Assignment(id, resourceId, roleId, effort);
  this.assigs.push(assig);
  return assig;
};


//<%---------- SET PERIOD ---------------------- --%>
Task.prototype.setPeriod = function (start, end) {
  //console.debug("setPeriod ",this.name,new Date(start),new Date(end));
  //var profilerSetPer = new Profiler("gt_setPeriodJS");

  if (start instanceof Date) {
    start = start.getTime();
  }

  if (end instanceof Date) {
    end = end.getTime();
  }

  var originalPeriod = {
    start: this.start,
    end:  this.end,
    duration: this.duration
  };

  //console.debug("setStart",date,date instanceof Date);
  var wantedStartMillis = start;

  //cannot start after end
  if (start > end) {
    start = end;
  }

  //set a legal start
  if(!this.isLine){
    start = computeStart(start,this.areaSn);
  }

  //if depends -> start is set to max end + lag of superior
  var sups = this.getSuperiors();
  if (sups && sups.length > 0) {

    var supEnd = 0;
    for (var i=0;i<sups.length;i++) {
      var link = sups[i];
      
    //task duration 2018 by cc
      var totaldiff= wantedStartMillis-link.from.end;
      var diff=Math.floor(totaldiff/(1000 * 60));
      link.lag=diff;
      
      supEnd = Math.max(supEnd, incrementDateByWorkingDays(link.from.end, link.lag,this.areaSn));
    }
    //if changed by depends move it
    if(!this.isLine){
      if (computeStart(supEnd,this.areaSn) != start) {
        return this.moveTo(supEnd + 1, false);
      }
    }
  }

  var somethingChanged = false;

  //move date to closest day
  var date = new Date(start);

  if (this.start != start || this.start != wantedStartMillis) {
    this.start = start;
    somethingChanged = true;
  }

  //set end
  var wantedEndMillis = end;
  if(!this.isLine){
    end = computeEnd(end,this.areaSn);
  }

  if (this.end != end || this.end != wantedEndMillis) {
    this.end = end;
    somethingChanged = true;
  }


  this.duration = recomputeDuration(this.start, this.end,this.areaSn);

  //profilerSetPer.stop();

  //nothing changed exit
  if (!somethingChanged)
    return true;

  //cannot write exit
  if(!this.canWrite){
    this.master.setErrorOnTransaction(GanttMaster.messages["CANNOT_WRITE"] + "\n" + this.name, this);
    return false;
  }

  //external dependencies: exit with error
  if (this.hasExternalDep) {
    this.master.setErrorOnTransaction(GanttMaster.messages["TASK_HAS_EXTERNAL_DEPS"] + "\n" + this.name, this);
    return false;
  }

  var todoOk = true;

  //I'm restricting
  var deltaPeriod = originalPeriod.duration - this.duration;
  var restricting = deltaPeriod > 0;
  var restrictingStart = restricting && (originalPeriod.start < this.start);
  var restrictingEnd = restricting && (originalPeriod.end > this.end);

  //console.debug( " originalPeriod.duration "+ originalPeriod.duration +" deltaPeriod "+deltaPeriod+" "+"restricting "+restricting);

  if (restricting) {
    //loops children to get boundaries
    var children = this.getChildren();
    var bs = Infinity;
    var be = 0;
    for (var i=0;i<children.length;i++) {

      ch = children[i];
      //console.debug("restricting: test child "+ch.name+" "+ch.end)
      if (restrictingEnd) {
        be = Math.max(be, ch.end);
      } else {
        bs = Math.min(bs, ch.start);
      }
    }

    if (restrictingEnd) {
      //console.debug("restricting end ",be, this.end);
      this.end = Math.max(be, this.end);
    } else {
      //console.debug("restricting start");
      this.start = Math.min(bs, this.start);
    }

     this.duration = recomputeDuration(this.start, this.end,this.areaSn);
  } else {

    //check global boundaries
    if (this.start < this.master.minEditableDate || this.end > this.master.maxEditableDate) {
      this.master.setErrorOnTransaction(GanttMaster.messages["CHANGE_OUT_OF_SCOPE"], this);
      todoOk = false;
    }

    //console.debug("set period: somethingChanged",this);
    if (todoOk && !updateTree(this)) {
      todoOk = false;
    }
  }

  if (todoOk) {
    //and now propagate to inferiors
    var infs = this.getInferiors();
    if (infs && infs.length > 0) {
      for (var i=0;i<infs.length;i++) {
        var link = infs[i];
        if (!link.to.canWrite){
          this.master.setErrorOnTransaction(GanttMaster.messages["CANNOT_WRITE"] + "\n" + link.to.name, link.to);
          break;
        }
        todoOk = link.to.moveTo(end, false); //this is not the right date but moveTo checks start
        if (!todoOk)
          break;
      }
    }
  }

  return todoOk;
};


//<%---------- MOVE TO ---------------------- --%>
Task.prototype.moveTo = function (start, ignoreMilestones,perMoveId) {
  //console.debug("moveTo ",this,start,ignoreMilestones);
  //var profiler = new Profiler("gt_task_moveTo");

  if (start instanceof Date) {
    start = start.getTime();
  }

  var originalPeriod = {
    start:this.start,
    end:this.end,
    isMoveAfter:(this.start-start)>0?false:true//判定任务移动方向
  };

  var wantedStartMillis = start;

  //set a legal start
  if(!this.isLine){
    start = computeStart(start,this.areaSn);
  }

  //if start is milestone cannot be move
  if (!ignoreMilestones && this.startIsMilestone && start != this.start) {
    //notify error
    this.master.setErrorOnTransaction(GanttMaster.messages["START_IS_MILESTONE"], this);
    return false;
  } else if (this.hasExternalDep) {
    //notify error
    this.master.setErrorOnTransaction(GanttMaster.messages["TASK_HAS_EXTERNAL_DEPS"], this);
    return false;
  }

  //if depends start is set to max end + lag of superior
  var sups = this.getSuperiors();
  if (sups && sups.length > 0) {
    var supEnd = 0;
    for (var i=0;i<sups.length;i++) {
      var link = sups[i];
      
    //task duration 2018 by cc
      var totaldiff= wantedStartMillis-link.from.end;
      var diff=Math.floor(totaldiff/(1000 * 60));
      link.lag=diff;
      
      supEnd = Math.max(supEnd, incrementDateByWorkingDays(link.from.end, link.lag,this.areaSn));
    }
    start = supEnd + 1;
  }
  //set a legal start
  if(!this.isLine){
    start = computeStart(start,this.areaSn);
  }

  var end =0;
  if(this.isLine){
    end = this.end;
  }
  else {
    end=computeEndByDuration(start, this.duration,this);
  }

  if (this.start != start || this.start != wantedStartMillis) {
    //in case of end is milestone it never changes, but recompute duration
    if (!ignoreMilestones && this.endIsMilestone) {
      end = this.end;
      this.duration = recomputeDuration(start, end,this.areaSn);
    }

    this.start = start;
    this.end = end;
    //profiler.stop();

    //check global boundaries
    if (this.start < this.master.minEditableDate || this.end > this.master.maxEditableDate) {
      this.master.setErrorOnTransaction(GanttMaster.messages["CHANGE_OUT_OF_SCOPE"], this);
      return false;
    }

    
    var panDelta = originalPeriod.start - this.start;
    //console.debug("panDelta",panDelta);
    //loops children to shift them
    var children = this.getChildren();
    for (var i=0;i<children.length;i++) {
      ch = children[i];
      if (!ch.moveTo(ch.start - panDelta, false)) {
        return false;
      }
    }
  }

  //and now propagate to inferiors
  var infs = this.getInferiors();
  if (infs && infs.length > 0) {
    for (var i=0;i<infs.length;i++) {
      var link = infs[i];
      //this is not the right date but moveTo checks start
      if (!link.to.canWrite ) {
        this.master.setErrorOnTransaction(GanttMaster.messages["CANNOT_WRITE"]+ "\n"+link.to.name, link.to);
      } 
      //else if (!link.to.moveTo(end, false)) 
      else if (!link.to.moveTo(end+(link.lag*(1000*60)), false)) 
      {
        return false;
      }
    }
  }
  
  //deal task position or after tasks 2018-06-05 by cc 移动操作在执行 updateTree 之前
  if(!this.judePosition(originalPeriod.start!=start?true:false,originalPeriod.isMoveAfter,perMoveId)){
    return false;
  }

  //console.debug("set period: somethingChanged",this);
  if (!updateTree(this)) {
    return false;
  }

  return true;
};

//自动调整任务位置
Task.prototype.judePosition=function(needMove,isMoveAfter,perMoveId){
  try{
    //任务移动规则：1、任务后移，只会整体后移，不会触发插入事件
    //             2、任务前移，但没与其他任务交叉，只会整体前移
    //             3、任务前移，但遭遇与其他任务交叉，当前任务会插入到被交叉任务位置，被交叉任务后移到当前任务end+(1000*60)处
    //jude task
    var currentTask=this;
    var judeTask;
    var isAfterMove=true;
    var doStatus=true;
    var errorIndex=-1;
    
    if(needMove){
      //1、判定任务是否与其他任务存在交集
      this.getParent().getChildren().forEach(function(task,index,array){
        if(errorIndex!=-1){
          return;
        }
        judeTask=currentTask.master.getTask(task.id);
        if(judeTask.id==currentTask.id){
          return;
        }
        //添加轨道判断 2018-06-25 by cc
        if((currentTask.track==comSingleTrack || judeTask.track==comSingleTrack || currentTask.track==judeTask.track) && ((currentTask.start>judeTask.start && currentTask.start<judeTask.end) 
          || (currentTask.end>judeTask.start && currentTask.end<judeTask.end) 
          || (currentTask.start>judeTask.start && currentTask.end<judeTask.end) 
          || (currentTask.start<judeTask.start && currentTask.end>judeTask.end)
          || (currentTask.start==judeTask.start && currentTask.end==judeTask.end))){
          //当前操作为后移
          if(isMoveAfter){ 
            if(typeof(perMoveId)!="undefined"){//typeof(perMoveId)!="undefined" 表示任务是由于被交叉而被迫后移
              if(!judeTask.moveTo(currentTask.end+(1000*60),false,perMoveId)){
                doStatus=false;
                errorIndex=index;
              }
              isAfterMove=false;
            }
          }
          //当前操作为前移
          else { 
            if(!judeTask.moveTo(currentTask.end+(1000*60),false,currentTask.id)){
              doStatus=false;
              errorIndex=index;
            }
            isAfterMove=false;
          }
        }
      });
      //2、触发后段任务移动
      if(currentTask.afterTask!=null && isAfterMove){
        if(typeof(perMoveId)!="undefined" && currentTask.matchAfterTask(perMoveId)){
          //主动挪单的任务，无需除非后置任务移动
        }
        else {
          for(var af=0,len=currentTask.afterTask.length;af<len;af++){
            if(!currentTask.master.getTask(currentTask.afterTask[af].task.taskId).moveTo(currentTask.end+currentTask.afterTask[af].task.rangeSpan,false,perMoveId)){
              doStatus=false;
              errorIndex=index;
              return;
            }
          }

            /*if(!currentTask.master.getTask(currentTask.afterTask.taskId).moveTo(currentTask.end+currentTask.afterTask.rangeSpan,false,perMoveId)){
              doStatus=false;
              errorIndex=index;
            }*/
          }
        }
    }

    return doStatus;
  }
  catch(error){
    console.error(error);
  }
}

//检测是否存储指定ID的后段任务
Task.prototype.matchAfterTask=function(id){
  try{
    var currentTask=this;
    for(var i=0,len=currentTask.afterTask.length;i<len;i++){
      if(currentTask.afterTask[i].task.taskId==id){
        return true;
      }
    }
    return false;
  }
  catch(error){
    console.error(error);
    return false;
  }
}

//查找线体中最靠近的后段任务
Task.prototype.findCloserAfterParam=function(){
  try{
    var closerStart=0;
    var currentTask=this;
    currentTask.afterTask=[];
    var judeTask;
    this.getParent().getChildren().forEach(function(task,index,array){
      judeTask=currentTask.master.getTask(task.id);
      if(currentTask.track!=judeTask.track && currentTask.track!=comSingleTrack && judeTask.track!=comSingleTrack){
    	  return;
      }
      if(judeTask.start<currentTask.start || judeTask.id==currentTask.id){
        return;
      }
      if(closerStart==0){
        closerStart=judeTask.start;
      }
      if(closerStart>=judeTask.start){
        closerStart=judeTask.start;
        //后段任务中每个轨道只会存在一个任务
        isTrackAfterExist(judeTask.track,currentTask.afterTask,{taskId:judeTask.id,rangeSpan:judeTask.start-currentTask.end});
      }
    });

    return true;
  }
  catch(error){
    console.error(error);
  }
}

//是否已存在指定轨道的后端任务，若已存在，则替换。
function isTrackAfterExist(track,afterTask,task){
  try{
    var isExist=false;
    for(var i=0,len=afterTask.length;i<len;i++){
      if(track==afterTask.track){
        isExist=true;
        afterTask.task=task;
        break;
      }
    }
    if(!isExist){
      afterTask.push({track:track,task:task});
    }
  }
  catch(error){
    console.error(error);
  }
}

function updateTree(task) {
  //console.debug("updateTree ",task);
  var error;

  //try to enlarge parent
  var p = task.getParent();

  //no parent:exit
  if (!p)
    return true;
  
  //2018 by cc
  if(task.pmStatus!="0" && !task.reCalculate){ // allow reCalculate skip 2018-06-13 by cc
	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_ILEGSTATUS"]+"("+task.name+")" , task);
	  return false;
  }

  var newStart = p.start;
  var newEnd = p.end;

//2018 by cc
//  if(task.start<task.projectStartTime){
//	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PLAN_START"]+"("+task.name+")" , task);
//	  return false;
//  }
//2018 by cc
  if(task.end>task.projectEndTime){
	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PLAN_END"]+"("+task.name+")" , task);
	  return false;
  }
  
  //avaliable calTime
  if (p.start > task.start) {
//    if (p.startIsMilestone) {
//      task.master.setErrorOnTransaction(GanttMaster.messages["START_IS_MILESTONE"] + "\n" + p.name, task);
//      return false;
//    } else if (p.depends) {
//      task.master.setErrorOnTransaction(GanttMaster.messages["TASK_HAS_CONSTRAINTS"] + "\n" + p.name, task);
//      return false;
//    }

	//2018 by cc
		task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_OUTOF_AVA_CALTIME"]+"("+task.name+")", task);
	    return false;
	  
//    newStart = task.start;
  }

  if (p.end < task.end) {
//    if (p.endIsMilestone) {
//      task.master.setErrorOnTransaction(GanttMaster.messages["END_IS_MILESTONE"] + "\n" + p.name, task);
//      return false;
//    }
	  
	//2018 by cc
		task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_OUTOF_AVA_CALTIME"] +"("+task.name+")", task);
	    return false;

    //newEnd = task.end;
  }

  //propagate updates if needed
  if (newStart != p.start || newEnd != p.end) {

    //can write?
    if (!p.canWrite){
      task.master.setErrorOnTransaction(GanttMaster.messages["CANNOT_WRITE"] +"("+task.name+")", task);
      return false;
    }

    //has external deps ?
    if (p.hasExternalDep) {
      task.master.setErrorOnTransaction(GanttMaster.messages["TASK_HAS_EXTERNAL_DEPS"] +"("+task.name+")", task);
      return false;
    }
    return p.setPeriod(newStart, newEnd);
  }

  //check per face 2018-06-11 by cc
  if(null!=task.perFace && ""!=task.perFace){
    if(!getFaceCountByTaskMoved(task)){
      task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_MOVE_PER_FACE_COUNT"] +"("+task.name+")", task);
      return false;
    }
  }
  
   //2018 by cc 取消该校验，换成在moveTo中进行自动排序
   /*var childTasks=p.getChildren();
   var vTask;
   for(var i=0,len=childTasks.length;i<len;i++){
	   vTask=childTasks[i];
	   if(vTask.id==task.id){//2018 by cc
	 	  continue;
	   }
       if(task.start>vTask.start && task.start<vTask.end){
     	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_TIMEIN_START"]+"("+task.name+")", task);
     	  return false;
	   }
       else if(task.end>vTask.start && task.end<vTask.end){
     	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_TIMEIN_END"]+"("+task.name+")", task);
     	  return false;
       }
       else if(task.start<vTask.start && task.end>vTask.end){
     	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_TASKIN"]+"("+task.name+")", task);
     	  return false;
       }
       //2018 by cc
       else if(task.end>=(vTask.start-vTask.changeTimeSpan) && task.end<vTask.start){
     	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_TASK_END_CHANGE_TIME"]+"("+task.name+")", task);
     	  return false;
       }
       //2018 by cc
       else if(vTask.end>=(task.start-task.changeTimeSpan) && vTask.end<task.start){
     	  task.master.setErrorOnTransaction(GanttMaster.messages["VALIDATE_CANNOT_PER_TASK_END_CHANGE_TIME"]+"("+task.name+")", task);
     	  return false;
       }
   }*/

  //2018 by cc
  task.isChanged=true;
  
  return true;
}

//<%---------- CHANGE STATUS ---------------------- --%>
Task.prototype.changeStatus = function(newStatus) {
  //console.debug("changeStatus: "+this.name+" from "+this.status+" -> "+newStatus);
  //compute descendant for identify a cone where status changes propagate
  var cone = this.getDescendant();

  function propagateStatus(task, newStatus, manuallyChanged, propagateFromParent, propagateFromChildren) {
	//2018 by cc
	return true;
    //console.debug("propagateStatus",task.name, task.status,newStatus)
    var oldStatus = task.status;

    //no changes exit
    if(newStatus == oldStatus){
      return true;
    }
    //console.debug("propagateStatus: "+task.name + " from " + task.status + " to " + newStatus + " " + (manuallyChanged?" a manella":"")+(propagateFromParent?" da parent":"")+(propagateFromChildren?" da children":""));

    var todoOk = true;
    task.status = newStatus;

    if( task.master.cannotCloseTaskIfIssueOpen && newStatus=="STATUS_DONE" && task.openIssues>0){
      task.master.setErrorOnTransaction(GanttMaster.messages["CANNOT_CLOSE_TASK_IF_OPEN_ISSUE"] +" " +task.name);
      return false;
    }

    //xxxx -> STATUS_DONE            may activate dependent tasks, both suspended and undefined. Will set to done all descendants.
    //STATUS_FAILED -> STATUS_DONE          do nothing if not forced by hand
    if (newStatus == "STATUS_DONE") {

      if ((manuallyChanged || oldStatus != "STATUS_FAILED")) { //cannot change for cascade when failed

        //can be closed only if superiors are already done
        var sups = task.getSuperiors();
        for (var i=0;i<sups.length;i++) {
          if (cone.indexOf(sups[i].from) < 0) {
            if (sups[i].from.status != "STATUS_DONE") {
              if (manuallyChanged || propagateFromParent)
                task.master.setErrorOnTransaction(GanttMaster.messages["GANTT_ERROR_DEPENDS_ON_OPEN_TASK"] + "\n" + sups[i].from.name + " -> " + task.name);
              todoOk = false;
              break;
            }
          }
        }

        if (todoOk) {
          //todo set progress to 100% if set on config

          var chds = task.getChildren();
          //set children as done
          for (var i=0;i<chds.length;i++)
            propagateStatus(chds[i], "STATUS_DONE", false,true,false);

          //set inferiors as active if outside the cone
          propagateToInferiors(cone, task.getInferiors(), "STATUS_ACTIVE");
        }
      } else {
        todoOk = false;
      }


      //  STATUS_UNDEFINED -> STATUS_ACTIVE       all children become active, if they have no dependencies.
      //  STATUS_SUSPENDED -> STATUS_ACTIVE       sets to active all children and their descendants that have no inhibiting dependencies.
      //  STATUS_DONE -> STATUS_ACTIVE            all those that have dependencies must be set to suspended.
      //  STATUS_FAILED -> STATUS_ACTIVE          nothing happens: child statuses must be reset by hand.
    } else if (newStatus == "STATUS_ACTIVE") {

      if ((manuallyChanged || oldStatus != "STATUS_FAILED")) { //cannot change for cascade when failed

        //activate parent if closed
        var par=task.getParent();
        if (par && par.status != "STATUS_ACTIVE") {
          todoOk=propagateStatus(par,"STATUS_ACTIVE",false,false,true);
        }

        if(todoOk){
          //can be active only if superiors are already done
          var sups = task.getSuperiors();
          for (var i=0;i<sups.length;i++) {
            if (sups[i].from.status != "STATUS_DONE") {
              if (manuallyChanged || propagateFromChildren)
              task.master.setErrorOnTransaction(GanttMaster.messages["GANTT_ERROR_DEPENDS_ON_OPEN_TASK"] + "\n" + sups[i].from.name + " -> " + task.name);
              todoOk = false;
              break;
            }
          }
        }

        if (todoOk) {
          var chds = task.getChildren();
          if (oldStatus == "STATUS_UNDEFINED" || oldStatus == "STATUS_SUSPENDED") {
            //set children as active
            for (var i=0;i<chds.length;i++)
              if (chds[i].status != "STATUS_DONE" )
                propagateStatus(chds[i], "STATUS_ACTIVE", false,true,false);
          }

          //set inferiors as suspended
          var infs = task.getInferiors();
          for (var i=0;i<infs.length;i++)
            propagateStatus(infs[i].to, "STATUS_SUSPENDED", false,false,false);
        }
      } else {
        todoOk = false;
      }

      // xxxx -> STATUS_SUSPENDED       all active children and their active descendants become suspended. when not failed or forced
      // xxxx -> STATUS_UNDEFINED       all active children and their active descendants become suspended. when not failed or forced
    } else if (newStatus == "STATUS_SUSPENDED" || newStatus == "STATUS_UNDEFINED") {
      if (manuallyChanged || oldStatus != "STATUS_FAILED") { //cannot change for cascade when failed

        //suspend parent if not active
        var par=task.getParent();
        if (par && par.status != "STATUS_ACTIVE") {
          todoOk=propagateStatus(par,newStatus,false,false,true);
        }


        var chds = task.getChildren();
        //set children as active
        for (var i=0;i<chds.length;i++){
          if (chds[i].status != "STATUS_DONE")
            propagateStatus(chds[i], newStatus, false,true,false);
        }

        //set inferiors as STATUS_SUSPENDED or STATUS_UNDEFINED
        propagateToInferiors(cone, task.getInferiors(), newStatus);
      } else {
        todoOk = false;
      }

      // xxxx -> STATUS_FAILED children and dependent failed
    } else if (newStatus == "STATUS_FAILED") {
      var chds = task.getChildren();
      //set children as failed
      for (var i=0;i<chds.length;i++)
        propagateStatus(chds[i], "STATUS_FAILED", false,true,false);

      //set inferiors as active
      //set children as done
      propagateToInferiors(cone, task.getInferiors(), "STATUS_FAILED");
    }
    if (!todoOk){
      task.status = oldStatus;
      //console.debug("status rolled back: "+task.name + " to " + oldStatus);
    }

    return todoOk;
  }

  /**
   * A helper method to traverse an array of 'inferior' tasks
   * and signal a status change.
   */
  function propagateToInferiors(cone, infs, status) {
    for (var i=0;i<infs.length;i++) {
      if (cone.indexOf(infs[i].to) < 0) {
        propagateStatus(infs[i].to, status, false, false, false);
      }
    }
  }

  var todoOk = true;
  var oldStatus = this.status;

  todoOk = propagateStatus(this, newStatus, true,false,false);

  if (!todoOk)
    this.status = oldStatus;

  return todoOk;
};

Task.prototype.synchronizeStatus=function(){
  var oldS=this.status;
  this.status="";
  return this.changeStatus(oldS);
};

Task.prototype.isLocallyBlockedByDependencies=function(){
  var sups = this.getSuperiors();
  var blocked=false;
  for (var i=0;i<sups.length;i++) {
    if (sups[i].from.status != "STATUS_DONE") {
      blocked=true;
      break;
    }
  }
  return blocked;
};

//<%---------- TASK STRUCTURE ---------------------- --%>
Task.prototype.getRow = function() {
  ret = -1;
  if (this.master)
    ret = this.master.tasks.indexOf(this);
  return ret;
};


Task.prototype.getParents = function() {
  var ret;
  if (this.master) {
    var topLevel = this.level;
    var pos = this.getRow();
    ret = [];
    for (var i = pos; i >= 0; i--) {
      var par = this.master.tasks[i];
      if (topLevel > par.level) {
        topLevel = par.level;
        ret.push(par);
      }
    }
  }
  return ret;
};


Task.prototype.getParent = function() {
  var ret;
  if (this.master) {
    for (var i = this.getRow(); i >= 0; i--) {
      var par = this.master.tasks[i];
      if (this.level > par.level) {
        ret = par;
        break;
      }
    }
  }
  return ret;
};


Task.prototype.isParent = function() {
  var ret = false;
  if (this.master) {
    var pos = this.getRow();
    if (pos < this.master.tasks.length - 1)
      ret = this.master.tasks[pos + 1].level > this.level;
  }
  return ret;
};


Task.prototype.getChildren = function() {
  var ret = [];
  if (this.master) {
    var pos = this.getRow();
    for (var i = pos + 1; i < this.master.tasks.length; i++) {
      var ch = this.master.tasks[i];
      if (ch.level == this.level + 1)
        ret.push(ch);
      else if (ch.level <= this.level) // exit loop if parent or brother
        break;
    }
  }
  return ret;
};


Task.prototype.getDescendant = function() {
  var ret = [];
  if (this.master) {
    var pos = this.getRow();
    for (var i = pos + 1; i < this.master.tasks.length; i++) {
      var ch = this.master.tasks[i];
      if (ch.level > this.level)
        ret.push(ch);
      else
        break;
    }
  }
  return ret;
};


Task.prototype.getSuperiors = function() {
  var ret = [];
  var task = this;
  if (this.master) {
    ret = this.master.links.filter(function(link) {
      return link.to == task;
    });
  }
  return ret;
};

Task.prototype.getSuperiorTasks = function() {
  var ret=[];
  var sups = this.getSuperiors();
  for (var i=0;i<sups.length;i++)
    ret.push(sups[i].from);
  return ret;
};


Task.prototype.getInferiors = function() {
  var ret = [];
  var task = this;
  if (this.master) {
    ret = this.master.links.filter(function(link) {
      return link.from == task;
    });
  }
  return ret;
};

Task.prototype.getInferiorTasks = function() {
  var ret=[];
  var infs = this.getInferiors();
  for (var i=0;i<infs.length;i++)
    ret.push(infs[i].to);
  return ret;
};

  Task.prototype.deleteTask = function() {
  //delete both dom elements
  this.rowElement.remove();
  this.ganttElement.remove();

  //remove children
  var chd = this.getChildren();
  for (var i=0;i<chd.length;i++) {
    //add removed child in list
    if(!chd[i].isNew())
      this.master.deletedTaskIds.push(chd[i].id);
    chd[i].deleteTask();
  }

  if(!this.isNew())
    this.master.deletedTaskIds.push(this.id);


  //remove from in-memory collection
  this.master.tasks.splice(this.getRow(), 1);

  //remove from links
  var task = this;
  this.master.links = this.master.links.filter(function(link) {
    return link.from != task && link.to != task;
  });
};


Task.prototype.isNew=function(){
  return (this.id+"").indexOf("tmp_")==0;
};

Task.prototype.isDependent=function(t) {
  //console.debug("isDependent",this.name, t.name)
  var task=this;
  var dep= this.master.links.filter(function(link) {
    return link.from == task ;
  });

  // is t a direct dependency?
  for (var i=0;i<dep.length;i++) {
    if (dep[i].to== t)
      return true;
  }
  // is t an indirect dependency
  for (var i=0;i<dep.length;i++) {
    if (dep[i].to.isDependent(t)) {
      return true;
    }
  }
  return false;
};

Task.prototype.setLatest=function(maxCost) {
  this.latestStart = maxCost - this.criticalCost;
  this.latestFinish = this.latestStart + this.duration;
};


//<%------------------------------------------  INDENT/OUTDENT --------------------------------%>
Task.prototype.indent = function() {
  //console.debug("indent", this);
  //a row above must exist
  var row = this.getRow();

  //no row no party
  if (row <=0)
    return false;

  var ret = false;
  var taskAbove = this.master.tasks[row - 1];
  var newLev = this.level + 1;
  if (newLev <= taskAbove.level + 1) {
    ret = true;
    //trick to get parents after indent
    this.level++;
    var futureParents = this.getParents();
    this.level--;
    var oldLevel = this.level;
    for (var i = row; i < this.master.tasks.length; i++) {
      var desc = this.master.tasks[i];
      if (desc.level > oldLevel || desc == this) {
        desc.level++;
        //remove links from descendant to my parents
        this.master.links = this.master.links.filter(function(link) {
          var linkToParent = false;
          if (link.to == desc)
            linkToParent = futureParents.indexOf(link.from) >= 0;
          else if (link.from == desc)
            linkToParent = futureParents.indexOf(link.to) >= 0;
          return !linkToParent;
        });
      } else
        break;
    }

    var parent = this.getParent();
    // set start date to parent' start if no deps
    if(parent && !this.depends){
      var new_end = 0;
      if(this.isLine){
        new_end=task.end;
      }
      else {
        new_end = computeEndByDuration(parent.start, this.duration,this);
      }
    	this.master.changeTaskDates(this, parent.start, new_end);
    }
    //recompute depends string
    this.master.updateDependsStrings();
    //enlarge parent using a fake set period
    this.setPeriod(this.start + 1, this.end + 1);

    //force status check
    this.synchronizeStatus();
  }
  return ret;
};


Task.prototype.outdent = function() {
  //console.debug("outdent", this);

  //a level must be >1 -> cannot escape from root
  if (this.level <= 1)
    return false;

  var ret = false;
  var oldLevel = this.level;

  ret = true;
  var row = this.getRow();
  for (var i = row; i < this.master.tasks.length; i++) {
    var desc = this.master.tasks[i];
    if (desc.level > oldLevel || desc == this) {
      desc.level--;
    } else
      break;
  }

  var task = this;
  var chds = this.getChildren();
  //remove links from me to my new children
  this.master.links = this.master.links.filter(function(link) {
    var linkExist = (link.to == task && chds.indexOf(link.from) >= 0 || link.from == task && chds.indexOf(link.to) >= 0);
    return !linkExist;
  });


  //enlarge me if inherited children are larger
  for (var i=0;i<chds.length;i++) {
    //remove links from me to my new children
    chds[i].setPeriod(chds[i].start + 1, chds[i].end + 1);
  }

  //recompute depends string
  this.master.updateDependsStrings();

  //enlarge parent using a fake set period
  this.setPeriod(this.start + 1, this.end + 1);

  //force status check
  this.synchronizeStatus();
  return ret;
};


//<%------------------------------------------  MOVE UP / MOVE DOWN --------------------------------%>
Task.prototype.moveUp = function() {
  //console.debug("moveUp", this);
  var ret = false;

  //a row above must exist
  var row = this.getRow();

  //no row no party
  if (row <=0)
    return false;

  //find new row
  var newRow;
  for (newRow = row - 1; newRow >= 0; newRow--) {
    if (this.master.tasks[newRow].level <= this.level)
      break;
  }

  //is a parent or a brother
  if (this.master.tasks[newRow].level == this.level) {
    ret = true;
    //compute descendant
    var descNumber = 0;
    for (var i = row + 1; i < this.master.tasks.length; i++) {
      var desc = this.master.tasks[i];
      if (desc.level > this.level) {
        descNumber++;
      } else {
        break;
      }
    }
    //move in memory
    var blockToMove = this.master.tasks.splice(row, descNumber + 1);
    var top = this.master.tasks.splice(0, newRow);
    this.master.tasks = [].concat(top, blockToMove, this.master.tasks);
    //move on dom
    var rows = this.master.editor.element.find("tr[taskId]");
    var domBlockToMove = rows.slice(row, row + descNumber + 1);
    rows.eq(newRow).before(domBlockToMove);

    //recompute depends string
    this.master.updateDependsStrings();
  } else {
    this.master.setErrorOnTransaction(GanttMaster.messages["TASK_MOVE_INCONSISTENT_LEVEL"], this);
    ret = false;
  }
  return ret;
};


Task.prototype.moveDown = function() {
  //console.debug("moveDown", this);

  //a row below must exist, and cannot move root task
  var row = this.getRow();
  if (row >= this.master.tasks.length - 1 || row==0)
    return false;

  var ret = false;

  //find nearest brother
  var newRow;
  for (newRow = row + 1; newRow < this.master.tasks.length; newRow++) {
    if (this.master.tasks[newRow].level <= this.level)
      break;
  }

  //is brother
  if (this.master.tasks[newRow] && this.master.tasks[newRow].level == this.level) {
    ret = true;
    //find last desc
    for (newRow = newRow + 1; newRow < this.master.tasks.length; newRow++) {
      if (this.master.tasks[newRow].level <= this.level)
        break;
    }

    //compute descendant
    var descNumber = 0;
    for (var i = row + 1; i < this.master.tasks.length; i++) {
      var desc = this.master.tasks[i];
      if (desc.level > this.level) {
        descNumber++;
      } else {
        break;
      }
    }

    //move in memory
    var blockToMove = this.master.tasks.splice(row, descNumber + 1);
    var top = this.master.tasks.splice(0, newRow - descNumber - 1);
    this.master.tasks = [].concat(top, blockToMove, this.master.tasks);


    //move on dom
    var rows = this.master.editor.element.find("tr[taskId]");
    var aft = rows.eq(newRow - 1);
    var domBlockToMove = rows.slice(row, row + descNumber + 1);
    aft.after(domBlockToMove);

    //recompute depends string
    this.master.updateDependsStrings();
  }

  return ret;
};


//<%------------------------------------------------------------------------  LINKS OBJECT ---------------------------------------------------------------%>
function Link(taskFrom, taskTo, lagInWorkingDays) {
  this.from = taskFrom;
  this.to = taskTo;
  this.lag = lagInWorkingDays;
}


//<%------------------------------------------------------------------------  ASSIGNMENT ---------------------------------------------------------------%>
function Assignment(id, resourceId, roleId, effort) {
  this.id = id;
  this.resourceId = resourceId;
  this.roleId = roleId;
  this.effort = effort;
}


//<%------------------------------------------------------------------------  RESOURCE ---------------------------------------------------------------%>
function Resource(id, name) {
  this.id = id;
  this.name = name;
}


//<%------------------------------------------------------------------------  ROLE ---------------------------------------------------------------%>
function Role(id, name) {
  this.id = id;
  this.name = name;
}




