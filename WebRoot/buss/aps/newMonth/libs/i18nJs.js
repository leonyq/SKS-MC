/*
 Copyright (c) 2012-2017 Open Lab
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


function dateToRelative(localTime){
  var diff=new Date().getTime()-localTime;
  var ret="";

  var min=60000;
  var hour=3600000;
  var day=86400000;
  var wee=604800000;
  var mon=2629800000;
  var yea=31557600000;

  if (diff<-yea*2)
    ret ="in ## years".replace("##",(-diff/yea).toFixed(0));

  else if (diff<-mon*9)
    ret ="in ## months".replace("##",(-diff/mon).toFixed(0));

  else if (diff<-wee*5)
    ret ="in ## weeks".replace("##",(-diff/wee).toFixed(0));

  else if (diff<-day*2)
    ret ="in ## days".replace("##",(-diff/day).toFixed(0));

  else if (diff<-hour)
    ret ="in ## hours".replace("##",(-diff/hour).toFixed(0));

  else if (diff<-min*35)
    ret ="in about one hour";

  else if (diff<-min*25)
    ret ="in about half hour";

  else if (diff<-min*10)
    ret ="in some minutes";

  else if (diff<-min*2)
    ret ="in few minutes";

  else if (diff<=min)
    ret ="just now";

  else if (diff<=min*5)
    ret ="few minutes ago";

  else if (diff<=min*15)
    ret ="some minutes ago";

  else if (diff<=min*35)
    ret ="about half hour ago";

  else if (diff<=min*75)
    ret ="about an hour ago";

  else if (diff<=hour*5)
    ret ="few hours ago";

  else if (diff<=hour*24)
    ret ="## hours ago".replace("##",(diff/hour).toFixed(0));

  else if (diff<=day*7)
    ret ="## days ago".replace("##",(diff/day).toFixed(0));

  else if (diff<=wee*5)
    ret ="## weeks ago".replace("##",(diff/wee).toFixed(0));

  else if (diff<=mon*12)
    ret ="## months ago".replace("##",(diff/mon).toFixed(0));

  else
    ret ="## years ago".replace("##",(diff/yea).toFixed(0));

  return ret;
}

//override date format i18n

Date.monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
// Month abbreviations. Change this for local month names
Date.monthAbbreviations = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
// Full day names. Change this for local month names
Date.dayNames =["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
// Day abbreviations. Change this for local month names
Date.dayAbbreviations = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
// Used for parsing ambiguous dates like 1/2/2000 - default to preferring 'American' format meaning Jan 2.
// Set to false to prefer 'European' format meaning Feb 1
Date.preferAmericanFormat = false;

Date.firstDayOfWeek =1;
Date.defaultFormat = "dd/MM/yyyy";

Number.decimalSeparator = ".";
Number.groupingSeparator = ",";
Number.minusSign = "-";
Number.currencyFormat = "###,##0.00";



var millisInWorkingDay =36000000;
var workingDaysPerWeek =5;

function isHoliday(date) {
 if(isOpenHolyday)	  
    {
	    var friIsHoly =false;
	    var satIsHoly =true;
	    var sunIsHoly =true;
	
	    pad = function (val) {
	      val = "0" + val;
	      return val.substr(val.length - 2);
	    };
	
	    var holidays = "#01_01#04_25#08_15#11_01#12_25#12_26#06_02#12_08#05_01#2010_04_05#2010_10_19#2010_05_15#2011_04_04#";
	
	    var ymd = "#" + date.getFullYear() + "_" + pad(date.getMonth() + 1) + "_" + pad(date.getDate()) + "#";
	    var md = "#" + pad(date.getMonth() + 1) + "_" + pad(date.getDate()) + "#";
	    var day = date.getDay();
	
	    return  (day == 5 && friIsHoly) || (day == 6 && satIsHoly) || (day == 0 && sunIsHoly) || holidays.indexOf(ymd) > -1 || holidays.indexOf(md) > -1;
    }
    else return false;
}

//当前时间点是否为特定时间点(Date) 2018-04-20 by cc
var innerSpecial=[];
//当前时间点是否为特定时间点(TimeSpan) 2018-04-20 by cc
function isSpecialTime(time,areaSn){
  try{
     var specialCheck=checkSpecialDate(new Date(time),areaSn);
     if(specialRestType.indexOf(specialCheck.type)>=0){
  	   return true;
     }
     else {
  	   return false;
     }
  }
  catch(error){
      console.error(error);
      return false;
  }
}
//判定当前时间点是属于正常工作时间点或非工作时间点，并返回持续的分钟数(Date) 2018-04-20 by cc
//特殊时间优先级：A-工作时间：1-例外时间 2-工作时间内的休息时间 3-工作时间; B-休息时间：1-例外时间 2-休息时间
var specialCheck={
  type:null,//类型：
            //1-正常上班时间
            //2-正常上班时间内的休息时间
            //3-正常休息时间
            //4-周末休息时间(周末上班标识为"N")
            //5-例外加班时间
            //6-例外休息时间
            //7-周末上班时间(周末上班标识为"Y")
            //8-未识别的时间
  date:new Date(),
  duration:0, //持续时间(精度min)
  endDate:null
};
function checkSpecialDate(date,areaSn,isException){
  try{
    //初始化specialCheck
    specialCheck.type=null;
    specialCheck.date=new Date(date.getTime());
    specialCheck.date.setMinutes(specialCheck.date.getMinutes(),0,0);
    specialCheck.duration=0;
    specialCheck.endDate=null;
    //判定是否启用特殊时间点校验
    if(!isActiveSpecialTime){
      specialCheck.type=1;
      specialCheck.duration=1;
      return specialCheck;
    }
    //判定当前线别是否存在特殊时间点
    if(!(areaSn in innerSpecial)){
      specialCheck.type=1;
      specialCheck.duration=1;
      return specialCheck;
    }
    //获取线体特殊时间点信息
    var specialTime=innerSpecial[areaSn];
    //校验变量
    var day=specialCheck.date.getDay();//获取当前时间点是周几
    var workTime=specialTime.workTime;//正常工作时间
    var restTime=specialTime.restTime;//工作内休息时间
    var exceptionTime=specialTime.exceptionTime;//例外时间
    var restTimeWithoutWork=specialTime.restTimeWithoutWork;//正常休息时间
    var workStart,restStart,expStart,restWorkStart;
    var workEnd,restEnd,expEnd,restWorkEnd;
    var dateformat=specialCheck.date.format("yyyy-MM-dd ");
    var weekDay=new Date(date.getTime());
    var errorDate=new Date(date.getTime());//异常时间
    var isCheckException=typeof(isException)=="undefined"?true:isException;//是否校验例外时间
    //特定变量
    var restTimeIn={start:null};//某个时间内的休息时间
    var expTimeWorkIn={start:null};//某个时间内休息时间的例外加班时间
    var expTimeRestIn={start:null};//某个时间内的例外休息时间
    /////////////////////////////////////////////////////////////////////////校验周末不上班（周末不上班不走工作时间和休息时间流程，放最前面校验）
    if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
        //初始化特定变量
        expTimeWorkIn.start=null;
        weekDay.setDate(weekDay.getDate()+1);
        weekDay.setHours(0,0,0);
        //****************************************************************************当目标时间处于特定时间内时
        //判定是否处于周末例外加班时间内
        for(var i=0,ilen=exceptionTime.length;i<ilen && null==specialCheck.type && isCheckException;i++){
          if(exceptionTime[i].type!="1"){
            continue;
          }
          expStart=new Date(exceptionTime[i].start);
          expEnd=new Date(exceptionTime[i].end);
          if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
            //赋值=例外加班时间
            if(null==specialCheck.type){
              specialCheck=dateSet(specialCheck,5,new Date(expEnd));
            }
            break;
          }
          //收集有效时间内的特定变量(<有效时间=目标时间点~有效截至时间点，只校验开始时间处于有效域内>取最接近目标时间点的时间)=例外加班
          if(expStart>=specialCheck.date.getTime() && expStart<=weekDay.getTime()){
            if(null==expTimeWorkIn.start){
              expTimeWorkIn.start=expStart;
            }
            else {
              if(expTimeWorkIn.start>expStart){
                expTimeWorkIn.start=expStart;
              }
            }
          }
        }
        //****************************************************************************
        //****************************************************************************当目标时间不处于特定时间内时(判定特定变量)
        //比较特定变量
        if(null==specialCheck.type && null!=expTimeWorkIn.start){
          specialCheck=dateSet(specialCheck,4,new Date(expTimeWorkIn.start));
        }
        //****************************************************************************
        //赋值=周末休息时间
        if(null==specialCheck.type){
          specialCheck=dateSet(specialCheck,4,weekDay);
        }
    }
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////校验工作时间（周末不上班除外）
    for(var i=0,ilen=workTime.length;i<ilen && null==specialCheck.type;i++){
      //判定周末是否上班（若周末不上班，则不走该流程）
      if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
        break;
      }
      //初始化特定变量
      restTimeIn.start=null;
      expTimeWorkIn.start=null;
      expTimeRestIn.start=null;
      //开始判定
      workStart=new Date(dateformat+workTime[i].start);
      workEnd=new Date(dateformat+workTime[i].end);
      //若为跨天，则判定起始时间和结束时间
      if(workTime[i].isInerDay=="Y"){
          if(specialCheck.date.getTime()>=workStart.getTime()){
            workEnd.setDate(workEnd.getDate()+1);
          }
          else {
            workStart.setDate(workStart.getDate()-1);
          }
        }
      if(specialCheck.date.getTime()>=workStart.getTime() && specialCheck.date.getTime()<=workEnd.getTime()){
        //****************************************************************************当目标时间处于特定时间内时
        //判定是否处于工作时间内的例外休息时间 优先级1
        for(var z=0,zlen=exceptionTime.length;z<zlen && null==specialCheck.type && isCheckException;z++){
          if(exceptionTime[z].type=="1"){
            continue;
          }
          expStart=new Date(exceptionTime[z].start);
          expEnd=new Date(exceptionTime[z].end);
          if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
            //赋值=例外休息时间
            if(null==specialCheck.type){
              specialCheck=dateSet(specialCheck,6,new Date(expEnd));
            }
            break;
          }
          //收集有效时间内的特定变量(<有效时间=目标时间点~有效截至时间点，只校验开始时间处于有效域内>取最接近目标时间点的时间)=例外休息
          if(expStart>=specialCheck.date.getTime() && expStart<=workEnd.getTime()){
            if(null==expTimeRestIn.start){
              expTimeRestIn.start=expStart;
            }
            else {
              if(expTimeRestIn.start>expStart){
                expTimeRestIn.start=expStart;
              }
            }
          }
        }
        //判定是否处于工作时间的休息时间内 优先级2
        for(var j=0,jlen=restTime.length;j<jlen && null==specialCheck.type;j++){
          restStart=new Date(dateformat+restTime[j].start);
          restEnd=new Date(dateformat+restTime[j].end);
          //若工作时间段存在跨天并且休息时间的结束时间小于开始时间，则判定为休息时间跨天，则休息结束时间天数+1
          if(workTime[i].isInerDay=="Y" && restEnd<restStart){
            if(specialCheck.date.getTime()>=restStart.getTime()){
              restEnd.setDate(restEnd.getDate()+1);
            }
            else {
              restStart.setDate(restStart.getDate()-1);
            }
          }
          if(specialCheck.date.getTime()>=restStart.getTime() && specialCheck.date.getTime()<=restEnd.getTime()){
            //判定是否处于工作时间的休息时间内的例外加班时间中
            for(var k=0,klen=exceptionTime.length;k<klen && null==specialCheck.type && isCheckException;k++){
              if(exceptionTime[k].type!="1"){
                continue;
              }
              expStart=new Date(exceptionTime[k].start);
              expEnd=new Date(exceptionTime[k].end);
              if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
                //赋值=例外加班时间
                if(null==specialCheck.type){
                  specialCheck=dateSet(specialCheck,5,new Date(expEnd));
                }
                break;
              }
              //收集有效时间内的特定变量(<有效时间=目标时间点~有效截至时间点，只校验开始时间处于有效域内>取最接近目标时间点的时间)=例外加班
              if(expStart>=specialCheck.date.getTime() && expStart<=restEnd.getTime()){
                if(null==expTimeWorkIn.start){
                  expTimeWorkIn.start=expStart;
                }
                else {
                  if(expTimeWorkIn.start>expStart){
                    expTimeWorkIn.start=expStart;
                  }
                }
              }
            }
            //赋值=工作时间内的休息时间
            if(null==specialCheck.type){
              specialCheck=dateSet(specialCheck,2,restEnd);
            }
            break;
          }
          //收集有效时间内的特定变量(<有效时间=目标时间点~有效截至时间点，只校验开始时间处于有效域内>取最接近目标时间点的时间)=工作时间内的休息时间
          if(restStart.getTime()>=specialCheck.date.getTime() && restStart.getTime()<=workEnd.getTime()){
            if(null==restTimeIn.start){
              restTimeIn.start=restStart;
            }
            else {
              if(restTimeIn.start>restStart){
                restTimeIn.start=restStart;
              }
            }
          }
        }
        //****************************************************************************
        //****************************************************************************当目标时间不处于特定时间内时
        //比较特定变量
        if(null==specialCheck.type && (null!=restTimeIn.start || null!=expTimeWorkIn.start || null!=expTimeRestIn.start)){
          var timeArray=[];
          if(null!=restTimeIn.start){
            timeArray.push(restTimeIn.start.getTime());
          }
          if(null!=expTimeWorkIn.start){
            timeArray.push(expTimeWorkIn.start);
          }
          if(null!=expTimeRestIn.start){
            timeArray.push(expTimeRestIn.start);
          }

          var finalend=Math.min.apply(null,timeArray);
          specialCheck=dateSet(specialCheck,1,new Date(finalend));
        }
        //****************************************************************************
        //赋值=工作时间
        if(null==specialCheck.type){
          //赋值工作时间是要判定，收集到的结束时间是否处于不上班的周末内。若处于不上班的周末内，则要重新定位结束时间点
          if((workEnd.getDay()==0 && !specialTime.isSun) || (workEnd.getDay()==6 && !specialTime.isSat)){
            workEnd.setDate(workEnd.getDate()-1);
            workEnd.setHours(23,59,0);
          }
          specialCheck=dateSet(specialCheck,1,workEnd);
        }
        break;
      }
    }
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////校验正常休息时间（周末不上班除外）
    for(var i=0,ilen=restTimeWithoutWork.length;i<ilen && null==specialCheck.type;i++){
      //判定周末是否上班（若周末不上班，则不走该流程）
      if((day==0 && !specialTime.isSun) || (day==6 && !specialTime.isSat)){
        break;
      }
      //初始化特定变量
      expTimeWorkIn.start=null;
      //开始判定
      restWorkStart=new Date(dateformat+restTimeWithoutWork[i].start);
      restWorkEnd=new Date(dateformat+restTimeWithoutWork[i].end);
      //若未跨天，则结束时间天数+1
      if(restTimeWithoutWork[i].isInerDay=="Y"){
        if(specialCheck.date.getTime()>=restWorkStart.getTime()){
          restWorkEnd.setDate(restWorkEnd.getDate()+1);
        }
        else {
          restWorkStart.setDate(restWorkStart.getDate()-1);
        }
      }
      if(specialCheck.date.getTime()>=restWorkStart.getTime() && specialCheck.date.getTime()<=restWorkEnd.getTime()){
          //****************************************************************************当目标时间处于特定时间内时
          //判定是否处于休息时间内的例外加班时间
          for(var j=0,jlen=exceptionTime.length;j<jlen && null==specialCheck.type && isCheckException;j++){
            if(exceptionTime[j].type!="1"){
              continue;
            }
            expStart=new Date(exceptionTime[j].start);
            expEnd=new Date(exceptionTime[j].end);
            if(specialCheck.date.getTime()>=expStart && specialCheck.date.getTime()<=expEnd){
              //赋值=例外加班时间
              if(null==specialCheck.type){
                specialCheck=dateSet(specialCheck,5,new Date(expEnd));
              }
              break;
            }
            //收集有效时间内的特定变量(<有效时间=目标时间点~有效截至时间点，只校验开始时间处于有效域内>取最接近目标时间点的时间)=例外加班
            if(expStart>=specialCheck.date.getTime() && expStart<=restWorkEnd.getTime()){
              if(null==expTimeWorkIn.start){
                expTimeWorkIn.start=expStart;
              }
              else {
                if(expTimeWorkIn.start>expStart){
                  expTimeWorkIn.start=expStart;
                }
              }
            }
          }
          //****************************************************************************
          //****************************************************************************当目标时间不处于特定时间内时
          //比较特定变量
          if(null==specialCheck.type && null!=expTimeWorkIn.start){
            specialCheck=dateSet(specialCheck,3,new Date(expTimeWorkIn.start));
          }
          //****************************************************************************
          //赋值=正常休息时间
          if(null==specialCheck.type){
            specialCheck=dateSet(specialCheck,3,restWorkEnd);
          }
          break;
      }
    }
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////未识别到任何时间处理
    if(null==specialCheck.type){
      specialCheck=dateSet(specialCheck,8,new Date(errorDate.setMinutes(errorDate.getMinutes()+1)));
    }
    /////////////////////////////////////////////////////////////////////////
    return specialCheck;
  }
  catch(error){
    console.error(error);
  }
}

//特殊时间点赋值
function dateSet(specialCheck,type,endDate){
    specialCheck.type=type;
    specialCheck.endDate=endDate;
    specialCheck.duration=parseInt(((endDate.getTime()-specialCheck.date.getTime())/(1000*60)+1).toFixed(0));
    return specialCheck;
}

//设置特定时间点
function setInnerSpecial(lineSpecial){
	  if(!isActiveSpecialTime){
		  return;
	  }
	  try{
		  //收集特定时间点
		  innerSpecial[lineSpecial.areaSn]={
				  workTime:typeof(lineSpecial.workTime)=="undefined"?[]:lineSpecial.workTime,
				  restTime:typeof(lineSpecial.restTime)=="undefined"?[]:lineSpecial.restTime,//工作时间内的休息时间
				  exceptionTime:typeof(lineSpecial.exceptionTime)=="undefined"?[]:lineSpecial.exceptionTime,
        overTime:[],
        restTimeWithoutWork:[],//工作时间外的休息时间
        isSat:typeof(lineSpecial.isSat)=="undefined"?false:lineSpecial.isSat,
        isSun:typeof(lineSpecial.isSun)=="undefined"?false:lineSpecial.isSun
		  };
		  //收集线体加班信息
		  var vTime=innerSpecial[lineSpecial.areaSn].exceptionTime;
		  var vStartDate;
		  var vEndDate;
		  for(var i=0,len=vTime.length;i<len;i++){
      vStartDate=new Date(vTime[i].start);
      vEndDate=new Date(vTime[i].end);
      if(vTime[i].type=="1"){
        //记录加班时间段
        innerSpecial[lineSpecial.areaSn].overTime.push({
          start:vStartDate.getTime(),
          end:vEndDate.getTime()
        });
      }
    }
    //收集工作时间外的休息时间，与restTime不同，restTime为工作时间内的休息时间
    innerSpecial[lineSpecial.areaSn].workTime.forEach(function(item,index,array){
  	  if(item.end==(array[(index+1)>=array.length?0:(index+1)].start)){
  		  return;
  	  }
        innerSpecial[lineSpecial.areaSn].restTimeWithoutWork.push({
          start:item.end,
          end:array[(index+1)>=array.length?0:(index+1)].start,
          isInerDay:(index+1)>=array.length?"Y":"N"
        });
    });
	  }
	  catch(error){}
}

//改变特殊时间点集合中的对应线体的周末上班标识
function setWeekDayFlag(areaSn,isSat,isSun){
  try{
    var specialTime=innerSpecial[areaSn];
    if(null!=specialTime && typeof(specialTime)!="undefined"){
      innerSpecial[areaSn].isSat=isSat;
      innerSpecial[areaSn].isSun=isSun;
    }
  }
  catch(error){
    console.error(error);
  }
}



var i18n = {
  YES:                 "Yes",
  NO:                  "No",
  FLD_CONFIRM_DELETE:  "confirm the deletion?",
  INVALID_DATA:        "The data inserted are invalid for the field format.",
  ERROR_ON_FIELD:      "Error on field",
  OUT_OF_BOUDARIES:      "Out of field admitted values:",
  CLOSE_ALL_CONTAINERS:"close all?",
  DO_YOU_CONFIRM:      "Do you confirm?",
  ERR_FIELD_MAX_SIZE_EXCEEDED:      "Field max size exceeded",
  WEEK_SHORT:      "W.",

  FILE_TYPE_NOT_ALLOWED:"File type not allowed.",
  FILE_UPLOAD_COMPLETED:"File upload completed.",
  UPLOAD_MAX_SIZE_EXCEEDED:"Max file size exceeded",
  ERROR_UPLOADING:"Error uploading",
  UPLOAD_ABORTED:"Upload aborted",
  DROP_HERE:"Drop files here",

  FORM_IS_CHANGED:     "You have some unsaved data on the page!",

  PIN_THIS_MENU: "PIN_THIS_MENU",
  UNPIN_THIS_MENU: "UNPIN_THIS_MENU",
  OPEN_THIS_MENU: "OPEN_THIS_MENU",
  CLOSE_THIS_MENU: "CLOSE_THIS_MENU",
  PROCEED: "Proceed?",

  PREV: "Previous",
  NEXT: "Next",
  HINT_SKIP: "Got it, close this hint.",

  WANT_TO_SAVE_FILTER: "save this filter",
  NEW_FILTER_NAME: "name of the new filter",
  SAVE: "Save",
  DELETE: "Delete",
  HINT_SKIP: "Got it, close this hint.",

  COMBO_NO_VALUES: "no values available...?",

  FILTER_UPDATED:"Filter updated.",
  FILTER_SAVED:"Filter correctly saved."

};


