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

$.gridify = function (table, opt) {
  var options = {
    resizeZoneWidth:10
  };

  $.extend(options, opt);

  var box = $("<div>").addClass("gdfWrapper");
  box.append(table);

  var head = table.clone();
  head.addClass("fixHead");
  //remove non head
  head.find("tbody").remove();
  box.append(head);

  box.append(table);

  var hTh=head.find(".gdfColHeader");
  var cTh=table.find(".gdfColHeader");
  for (var i=0; i<hTh.length;i++){
    hTh.eq(i).data("fTh",cTh.eq(i));
  }

  //--------- set table to 0 to prevent a strange 100%
  table.width(0);
  head.width(0);


  //----------------------  header management start
  head.find("th.gdfColHeader.gdfResizable:not(.gdfied)").mouseover(function () {
    $(this).addClass("gdfColHeaderOver");

  }).bind("mouseout.gdf",function () {
      $(this).removeClass("gdfColHeaderOver");
      if (!$.gridify.columInResize) {
        $("body").removeClass("gdfHResizing");
      }

    }).bind("mousemove.gdf",function (e) {
      if (!$.gridify.columInResize) {
        var colHeader = $(this);
        var mousePos = e.pageX - colHeader.offset().left;

        if (colHeader.width() - mousePos < options.resizeZoneWidth) {
          $("body").addClass("gdfHResizing");
        } else {
          $("body").removeClass("gdfHResizing");
        }
      }

    }).bind("mousedown.gdf",function (e) {
      var colHeader = $(this);
      var mousePos = e.pageX - colHeader.offset().left;
      if (colHeader.width() - mousePos < options.resizeZoneWidth) {
        $("body").unselectable();
        $.gridify.columInResize = $(this);
        //bind event for start resizing
        //console.debug("start resizing");
        $(document).bind("mousemove.gdf",function (e) {
          //manage resizing
          $.gridify.columInResize.width(e.pageX - $.gridify.columInResize.offset().left);
          $.gridify.columInResize.data("fTh").width($.gridify.columInResize.outerWidth());


          //bind mouse up on body to stop resizing
        }).bind("mouseup.gdf", function () {
            //console.debug("stop resizing");
            $(this).unbind("mousemove.gdf").unbind("mouseup.gdf").clearUnselectable();
            $("body").removeClass("gdfHResizing");
            delete $.gridify.columInResize;
          });
      }
    }).addClass("gdfied unselectable").attr("unselectable", "true");


  //----------------------  cell management start wrapping
  table.find("td.gdfCell:not(.gdfied)").each(function () {
    var cell = $(this);
    if (cell.is(".gdfEditable")) {
      var inp = $("<input type='text'>").addClass("gdfCellInput");
      inp.val(cell.text());
      cell.empty().append(inp);
    } else {
      var wrp = $("<div>").addClass("gdfCellWrap");
      wrp.html(cell.html());
      cell.empty().append(wrp);
    }
  }).addClass("gdfied");

  return box;
};

$.splittify = {
  init: function(where, first, second,perc) {

    perc=perc || 50;

    var element = $("<div>").addClass("splitterContainer");
    var firstBox = $("<div>").addClass("splitElement splitBox1");
    var splitterBar = $("<div>").addClass("splitElement vSplitBar").attr("unselectable", "on").html("|").css("padding-top",where.height()/2+"px");
    var secondBox = $("<div>").addClass("splitElement splitBox2");

    var splitter= new Splitter(element,firstBox,secondBox,splitterBar);
    splitter.perc=perc;


    firstBox.append(first);
    secondBox.append(second);

    element.append(firstBox).append(secondBox).append(splitterBar);

    where.append(element);

    var w = where.innerWidth();
    var fbw = w *perc/ 100 - splitterBar.width();
    var realW=firstBox.get(0).scrollWidth;
    fbw=fbw>realW?realW:fbw;
    firstBox.width(fbw).css({left:0});
    splitterBar.css({left:firstBox.width()});
    secondBox.width(w -fbw-splitterBar.width() ).css({left:firstBox.width() + splitterBar.width()});


    splitterBar.bind("mousedown.gdf", function(e) {
      $.splittify.splitterBar = $(this);
      //bind event for start resizing
      //console.debug("start splitting");
      var realW=firstBox.get(0).scrollWidth;
      $("body").unselectable().bind("mousemove.gdf", function(e) {
        //manage resizing
        //console.debug(e.pageX - $.gridify.columInResize.offset().left)
        var sb = $.splittify.splitterBar;
        var pos = e.pageX - sb.parent().offset().left;
        var w = sb.parent().width();
        var fbw=firstBox;
        if (pos > 10 && pos < realW) {
          sb.css({left:pos});
          firstBox.width(pos);
          secondBox.css({left:pos + sb.width(),width:w - pos - sb.width()});
        }
        splitter.perc=(firstBox.width()/splitter.element.width())*100;

        //bind mouse up on body to stop resizing
      }).bind("mouseup.gdf", function() {
        //console.debug("stop splitting");
        $(this).unbind("mousemove.gdf").unbind("mouseup.gdf").clearUnselectable();
        delete $.splittify.splitterBar;

      });
    });


    // keep both side in synch when scroll
    var stopScroll=false;
    var fs=firstBox.add(secondBox);
    fs.scroll(function(e) {
      var el = $(this);
      var top = el.scrollTop();
      if (el.is(".splitBox1") && stopScroll!="splitBox2"){
        stopScroll="splitBox1";
        secondBox.scrollTop(top);
      }else if (el.is(".splitBox2") && stopScroll!="splitBox1"){
        stopScroll="splitBox2";
        firstBox.scrollTop(top);
      }
      secondBox.find(".fixHead").css('top', top);
      firstBox.find(".fixHead").css('top', top);

      where.stopTime("reset").oneTime(100,"reset",function(){stopScroll="";})
    });



    function Splitter(element,firstBox, secondBox, splitterBar) {
      this.element=element;
      this.firstBox = firstBox;
      this.secondBox = secondBox;
      this.splitterBar = splitterBar;
      this.perc=0;

      this.resize=function(){
        var totW=this.element.width();
        var realW=this.firstBox.get(0).scrollWidth;
        var newW=totW*this.perc/100;
        newW=newW<realW?newW:realW;
        this.firstBox.css({width:newW});
        this.splitterBar.css({left:newW});
        this.secondBox.css({left:newW + this.splitterBar.width(),width:totW - newW - this.splitterBar.width()});
      }
    }

    return splitter;
  }
};





//<%------------------------------------------------------------------------  UTILITIES ---------------------------------------------------------------%>
  function computeStart(start,areaSn) {
      if(typeof(areaSn)=="undefined"){
          return computeStartDate(start).getTime();
      }
      else {
          return computeStartDate(start,areaSn).getTime();
      }
  }
  function computeStartDate(start,areaSn) {
    var logStart;
    var logEnd;
    var logDuration=0;
    logStart=new Date();
    consoleLog("computeStartDate:"+areaSn,logStart,true);
    if(typeof(areaSn)=="undefined"){
        //var d = new Date(start+3600000*12);
        var d = new Date(start);
        //d.setHours(0, 0, 0, 0);
        d.setMinutes(d.getMinutes(), 0, 0);
        //move to next working day
        while (isHoliday(d)) {
          d.setDate(d.getDate() + 1);
          d.setHours(0, 0, 0, 0); //��Ϊ�ڼ��գ������ڼ��գ��ӵڶ���0ʱ��ʼ����
        } 
        //d.setHours(0, 0, 0, 0);
        logEnd=new Date();
        consoleLogDuration(logStart,logEnd);
        consoleLog("computeStartDate",logEnd,false);
        return d;
    }
    else { // FOR N2 APS
        // var d = new Date(start);
        // d.setMinutes(d.getMinutes(), 0, 0);
        // while (isSpecialDate(d,areaSn)) {
        //   d.setMinutes(d.getMinutes() + 1);
        // } 
        // consoleLog("computeStartDate",false);
        // return d;
        var d = new Date(start);
        var specialCheck;
        d.setMinutes(d.getMinutes(), 0, 0);
        while (specialRestType.indexOf((specialCheck=checkSpecialDate(d,areaSn)).type)>=0) {
          d.setMinutes(d.getMinutes() + parseInt(specialCheck.duration));
        } 
        logEnd=new Date();
        consoleLogDuration(logStart,logEnd);
        consoleLog("computeStartDate",logEnd,false);
        return d;
    }
  }

  function computeEnd(end,areaSn) {
      if(typeof(areaSn)=="undefined"){
          return computeEndDate(end).getTime()
      }
      else {
          return computeEndDate(end,areaSn).getTime()
      }
  }
  function computeEndDate(end,areaSn) {
    var logStart;
    var logEnd;
    var logDuration=0;
    logStart=new Date();
    consoleLog("computeEndDate:"+areaSn,logStart,true);
      if(typeof(areaSn)=="undefined"){
        //var d = new Date(end-3600000*12);
            var d = new Date(end);
            //d.setHours(23, 59, 59, 999);
            d.setMinutes(d.getMinutes(), 0, 0);
            //move to next working day
            while (isHoliday(d)) {
              d.setDate(d.getDate() + 1);
              d.setMinutes(d.getMinutes(), 0, 0);
            }
            //d.setHours(23, 59, 59, 999);
            logEnd=new Date();
        consoleLogDuration(logStart,logEnd);
        consoleLog("computeEndDate",logEnd,false);
            return d;
      }
      else { //FOR N2 APS
            // var d = new Date(end);
            // d.setMinutes(d.getMinutes(), 0, 0);
            // while (isSpecialDate(d,areaSn)) {
            //   d.setMinutes(d.getMinutes() + 1);
            // }
            // consoleLog("computeEndDate",false);
            // return d;

            var d = new Date(end);
            var specialCheck;
            d.setMinutes(d.getMinutes(), 0, 0);
            while (specialRestType.indexOf((specialCheck=checkSpecialDate(d,areaSn)).type)>=0) {
              d.setMinutes(d.getMinutes() + parseInt(specialCheck.duration));
            } 
            logEnd=new Date();
            consoleLogDuration(logStart,logEnd);
            consoleLog("computeEndDate",logEnd,false);
            return d;
      }
  }
  
  //����ͬcomputeEndByDuration����������¼
  function computeEndByDurationSimple(start, duration,areaSn) {
    var logStart;
    var logEnd;
    var logDuration=0;
    logStart=new Date();
    consoleLog("computeEndByDurationSimple:"+areaSn,logStart,true);
         if(typeof(areaSn)=="undefined"){
             var d = new Date(start);
                //console.debug("computeEndByDuration start ",d,duration)
                var q = duration - 1; //1��ʾ��߾��� 1��λ�� ���磺Сʱ�����ӣ�
                while (q > 0) {
                  d.setMinutes(d.getMinutes()+1);
                  if (!isHoliday(d))
                    q--;
                }
                //d.setHours(23, 59, 59, 999);
                logEnd=new Date();
            consoleLogDuration(logStart,logEnd);
            consoleLog("computeEndByDurationSimple",logEnd,false);
                return d.getTime();
         }
         else {//FOR N2 APS
                var d = new Date(start);
                var q = duration - 1; //1��ʾ��߾��� 1��λ�� ���磺Сʱ�����ӣ�
                var specialCheck={duration:1};
                while (q > 0) {
                	d.setMinutes(d.getMinutes()+parseInt(specialCheck.duration));
                	specialCheck=checkSpecialDate(d,areaSn);
                	if(specialRestType.indexOf(specialCheck.type)<0){
	            		if(q-parseInt(specialCheck.duration)<=0){
	                        //����ʣ��ʱ��ȱʧ
	                       d.setMinutes(d.getMinutes()+q);
	                      }
	                      q=q-parseInt(specialCheck.duration);
                	}
                }
                logEnd=new Date();
            consoleLogDuration(logStart,logEnd);
            consoleLog("computeEndByDurationSimple",logEnd,false);
                return d.getTime();
         }
      }
  //��ȡ����ʱ����¼���
  function getSpecialTimeDurations(task){
    try{
        var d = new Date(task.start);
        var ed=new Date(task.end);
        var vSpe={datePoint:null,type:0,duration:0};
        var specialCheck={endDate:new Date(task.start),duration:1};
        task.specialTimeDurations=[];//��ʼ������ʱ���
        while (specialCheck.endDate<ed) {
          d.setMinutes(d.getMinutes()+parseInt(specialCheck.duration));
          //��¼����ʱ����Լ������
          specialCheck=checkSpecialDate(d,task.areaSn);
          if(specialRestType.indexOf(specialCheck.type)>=0){//�ǹ���ʱ��
            vSpe={datePoint:null,type:0,duration:0};
            vSpe.datePoint=specialCheck.date.getTime();
            if(specialCheck.endDate>ed){
              vSpe.duration=(ed.getTime()-specialCheck.date.getTime())/(1000*60);
            }
            else {
              vSpe.duration=specialCheck.duration;
            }
            task.specialTimeDurations.push(vSpe);
          }
      }
    }
    catch(error){
      console.error(error);
    }
  }
  
  function computeEndByDuration(start, duration,task) {
    var logStart;
    var logEnd;
    var logDuration=0;
    logStart=new Date();
    consoleLog("computeEndByDuration:"+task.areaSn,logStart,true);
     try{
      if(typeof(task)=="undefined"){
          var d = new Date(start);
             //console.debug("computeEndByDuration start ",d,duration)
             var q = duration - 1; //1��ʾ��߾��� 1��λ�� ���磺Сʱ�����ӣ�
             while (q > 0) {
               d.setMinutes(d.getMinutes()+1);
               if (!isHoliday(d))
                 q--;
             }
             //d.setHours(23, 59, 59, 999);
             logEnd=new Date();
            consoleLogDuration(logStart,logEnd);
            consoleLog("computeEndByDuration",logEnd,false);
             return d.getTime();
      }
      else {//FOR N2 APS
             /*var d = new Date(start);
           var q = duration - 1; //1��ʾ��߾��� 1��λ�� ���磺Сʱ�����ӣ�
           var isSpeacial=false;
           var vSpe={datePoint:null,duration:0};
           task.specialTimeDurations=[];//��ʼ������ʱ���
             while (q > 0) {
             d.setMinutes(d.getMinutes()+1);
             //��¼����ʱ����Լ������
             isSpeacial=isSpecialDate(d,task.areaSn);
             if(isSpeacial){
               if(vSpe.datePoint==null){
                 vSpe.datePoint=d.getTime();
               }
               vSpe.duration++;
             }
             else {
               if(vSpe.datePoint!=null){
                 task.specialTimeDurations.push(vSpe);
                 vSpe={datePoint:null,duration:0};
               }
               q--;
             }
             }
             return d.getTime();*/
        var d = new Date(start);
          var q = duration - 1; //1��ʾ��߾��� 1��λ�� ���磺Сʱ�����ӣ�
          var vSpe={datePoint:null,type:0,duration:0};
          var specialCheck={duration:1};
          task.specialTimeDurations=[];//��ʼ������ʱ���
          while (q > 0) {
            d.setMinutes(d.getMinutes()+parseInt(specialCheck.duration));
            //��¼����ʱ����Լ������
            specialCheck=checkSpecialDate(d,task.areaSn);
            if(specialRestType.indexOf(specialCheck.type)>=0){//�ǹ���ʱ��
            vSpe={datePoint:null,type:0,duration:0};
              vSpe.datePoint=specialCheck.date.getTime();
              vSpe.type=specialCheck.type;
              vSpe.duration=specialCheck.duration;
              task.specialTimeDurations.push(vSpe);
            }
            else {
               if(q-parseInt(specialCheck.duration)<=0){
                 //����ʣ��ʱ��ȱʧ
                d.setMinutes(d.getMinutes()+q);
               }
               q=q-parseInt(specialCheck.duration);
            }
         }
         console.log(task.specialTimeDurations);
         logEnd=new Date();
            consoleLogDuration(logStart,logEnd);
            consoleLog("computeEndByDuration",logEnd,false);
         return d.getTime();
      }
     }
     catch(error){
         console.error(error);
     }
  }

  function incrementDateByWorkingDays(date, days) {
    var d = new Date(date);
    d.incrementDateByWorkingDays(days);
    return d.getTime();
  }

function recomputeDuration(start, end,areaSn) {
   //console.debug("recomputeDuration");
   if(typeof(areaSn)=="undefined"){
       return new Date(start).distanceInWorkingDays(new Date(end));
   }
   else {
       return new Date(start).distanceInWorkingDays(new Date(end),areaSn);
   }
 }

 function consoleLog(func,date,isbegin){
     if(isbegin){
       console.log("["+func+"]begin:"+date.format("yyyy-MM-dd HH:mm:ss"));
     }
     else {
      console.log("["+func+"]end:"+date.format("yyyy-MM-dd HH:mm:ss"));
     }
 }
 function consoleLogDuration(start,end){
  console.log("[duration]:"+(end.getTime()-start.getTime())+"ms");
 }


//This prototype is provided by the Mozilla foundation and
//is distributed under the MIT license.
//http://www.ibiblio.org/pub/Linux/LICENSES/mit.license

if (!Array.prototype.filter){
  Array.prototype.filter = function (fun) {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var res = new Array();
    var thisp = arguments[1];
    for (var i = 0; i < len; i++) {
      if (i in this) {
        var val = this[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, this))
          res.push(val);
      }
    }
    return res;
  };
}
