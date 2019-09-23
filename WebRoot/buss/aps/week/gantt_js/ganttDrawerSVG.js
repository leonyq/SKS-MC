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
  function Ganttalendar(zoom, startmillis, endMillis, master, minGanttSize) {
    this.master = master; // is the a GantEditor instance
    this.element; // is the jquery element containing gantt
    this.highlightBar;

    this.svg; // instance of svg object containing gantt
    this.tasksGroup; //instance of svg group containing tasks
    this.linksGroup; //instance of svg group containing links

    //this.zoom = zoom;
    this.zoom = "w";
    this.minGanttSize = minGanttSize;
    this.includeToday = true; //when true today is always visible. If false boundaries comes from tasks periods
    this.showCriticalPath = false; //when true critical path is highlighted

    //this.zoomLevels = ["d", "w", "m", "q", "s", "y"];
    this.zoomLevels = ["mi","d", "w", "m", "q", "s", "y"];//y-锟斤拷  锟斤拷 s-锟斤拷锟斤拷 锟斤拷q-锟斤拷锟饺ｏ拷m-锟铰ｏ拷 w-锟杰ｏ拷d-锟届；mi-锟斤拷锟斤拷

    this.element = this.create(zoom, startmillis, endMillis);

    this.linkOnProgress = false; //set to true when creating a new link

  }

  Ganttalendar.prototype.zoomGantt = function (isPlus) {
    var curLevel = this.zoom;
    var pos = this.zoomLevels.indexOf(curLevel + "");

    var newPos = pos;
    if (isPlus) {
      newPos = pos <= 0 ? 0 : pos - 1;
    } else {
      newPos = pos >= this.zoomLevels.length - 1 ? this.zoomLevels.length - 1 : pos + 1;
    }
    if (newPos != pos) {
      curLevel = this.zoomLevels[newPos];
      this.zoom = curLevel;
      this.refreshGantt();
    }
  };


  Ganttalendar.prototype.create = function (zoom, originalStartmillis, originalEndMillis) {
    //console.debug("Gantt.create " + new Date(originalStartmillis) + " - " + new Date(originalEndMillis));

    var self = this;
    //unit day 2018-06-22 by cc
    var dExpTime=30;// day
    var miExpTime=3;// day
    var wExpTime=30;// day
    var mExpTime=60;// day
    var qExpTime=720;// day 
    var sExpTime=1080;// day 
    var yExpTime=1800;// day
    function getPeriod(zoomLevel, stMil, endMillis) {
      var start = new Date(stMil);
      var end = new Date(endMillis);

      //reset hours day detail about hours , add by cc
      if(zoomLevel=="d")
      {
        start.setDate(start.getDate()-dExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate()+dExpTime);//锟接猴拷6锟斤拷
      }
      else if(zoomLevel=="mi")
      {
        start.setDate(start.getDate()-miExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate()+miExpTime);//锟接猴拷3锟斤拷
      }
      //reset hours
  //    else if (zoomLevel == "d") {
  //      start.setHours(0, 0, 0, 0);
  //      end.setHours(23, 59, 59, 999);
  //
  //      start.setFirstDayOfThisWeek();
  //      end.setFirstDayOfThisWeek();
  //      end.setDate(end.getDate() + 6);
  //    } 

      //reset day of week
      else if (zoomLevel == "w") {
        start.setDate(start.getDate()-wExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate() + wExpTime);
        
        //do jude
        start.setFirstDayOfThisWeek();
        end.setFirstDayOfThisWeek();
        end.setDate(end.getDate() + 6);

        //reset day of month
      } else if (zoomLevel == "m") {
        start.setDate(start.getDate()-mExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate() + mExpTime);

        //do jude
        start.setDate(1);
        end.setDate(1);
        end.setMonth(end.getMonth() + 1);
        end.setDate(end.getDate() - 1);

        //reset to quarter
      } else if (zoomLevel == "q") {
        start.setDate(start.getDate()-qExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate() + qExpTime);
        
        //do jude
        start.setDate(1);
        start.setMonth(Math.floor(start.getMonth() / 3) * 3);
        end.setDate(1);
        end.setMonth(Math.floor(end.getMonth() / 3) * 3 + 3);
        end.setDate(end.getDate() - 1);

        //reset to semester
      } else if (zoomLevel == "s") {
        start.setDate(start.getDate()-sExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate() + sExpTime);
        
        //do jude
        start.setDate(1);
        start.setMonth(Math.floor(start.getMonth() / 6) * 6);
        end.setDate(1);
        end.setMonth(Math.floor(end.getMonth() / 6) * 6 + 6);
        end.setDate(end.getDate() - 1);

        //reset to year - > gen
      } else if (zoomLevel == "y") {
        start.setDate(start.getDate()-yExpTime);
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);
        end.setDate(end.getDate() + yExpTime);

        //do jude
        start.setDate(1);
        start.setMonth(0);
        end.setDate(1);
        end.setMonth(12);
        end.setDate(end.getDate() - 1);
      }
      return {start:start.getTime(), end:end.getTime()};
    }

    function createHeadCell(lbl, span, additionalClass, width) {
      var th = $("<th>").html(lbl).attr("colSpan", span);
      if (width)
        th.width(width);
      if (additionalClass)
        th.addClass(additionalClass);
      return th;
    }

    function createBodyCell(span, isEnd, additionalClass) {
      var ret = $("<td>").html("").attr("colSpan", span).addClass("ganttBodyCell");
      if (isEnd)
        ret.addClass("end");
      if (additionalClass)
        ret.addClass(additionalClass);
      return ret;
    }

    function createGantt(zoom, startPeriod, endPeriod) {
      var tr1 = $("<tr>").addClass("ganttHead1");
      var tr2 = $("<tr>").addClass("ganttHead2");
      var trBody = $("<tr>").addClass("ganttBody");

      function iterate(renderFunction1, renderFunction2) {
        var start = new Date(startPeriod);
        var end=new Date(endPeriod);
        //loop for header1
        while (start.getTime() <= endPeriod) {
          renderFunction1(start);
        }

        //loop for header2
        start = new Date(startPeriod);
        while (start.getTime() <= endPeriod) {
          renderFunction2(start);
        }
      }

      //this is computed by hand in order to optimize cell size
      var computedTableWidth;

      // year
      if (zoom == "y") {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24 * 180)) * 100); //180gg = 1 sem = 100px
        iterate(function (date) {
          tr1.append(createHeadCell(date.format("yyyy"), 2));
          date.setFullYear(date.getFullYear() + 1);
        }, function (date) {
          var sem = (Math.floor(date.getMonth() / 6) + 1);
          var headerText=sem>1?GanttMaster.messages["PST_SEMESTER"]:GanttMaster.messages["PER_SEMESTER"];
          tr2.append(createHeadCell(headerText, 1, null, 100));
          trBody.append(createBodyCell(1, sem == 2));
          date.setMonth(date.getMonth() + 6);
        });

        //semester
      } else if (zoom == "s") {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24 * 90)) * 100); //90gg = 1 quarter = 100px
        iterate(function (date) {
          var end = new Date(date.getTime());
          end.setMonth(end.getMonth() + 6);
          end.setDate(end.getDate() - 1);
          tr1.append(createHeadCell(date.format("MMM") + " - " + end.format("MMM yyyy"), 2));
          date.setMonth(date.getMonth() + 6);
        }, function (date) {
          var quarter = ( Math.floor(date.getMonth() / 3) + 1);
          var headerText;
          if(quarter==1){
            headerText=GanttMaster.messages["ONE_QUARTER"];
          }
          else if(quarter==2){
            headerText=GanttMaster.messages["TWO_QUARTER"];
          }
          else if(quarter==3){
            headerText=GanttMaster.messages["THREE_QUARTER"];
          }
          else if(quarter==4){
            headerText=GanttMaster.messages["FOUR_QUARTER"];
          }
          
          tr2.append(createHeadCell(headerText, 1, null, 100));
          trBody.append(createBodyCell(1, quarter % 2 == 0));
          date.setMonth(date.getMonth() + 3);
        });

        //quarter
      } else if (zoom == "q") {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24 * 30)) * 300); //1 month= 300px
        iterate(function (date) {
          var end = new Date(date.getTime());
          end.setMonth(end.getMonth() + 3);
          end.setDate(end.getDate() - 1);
          tr1.append(createHeadCell(date.format("MMM") + " - " + end.format("MMM yyyy"), 3));
          date.setMonth(date.getMonth() + 3);
        }, function (date) {
          var lbl = date.format("MMM");
          tr2.append(createHeadCell(lbl, 1, null, 300));
          trBody.append(createBodyCell(1, date.getMonth() % 3 == 2));
          date.setMonth(date.getMonth() + 1);
        });

        //month
      } else if (zoom == "m") {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24 * 1)) * 25); //1 day= 20px
        iterate(function (date) {
          var sm = date.getTime();
          date.setMonth(date.getMonth() + 1);
          var daysInMonth = Math.round((date.getTime() - sm) / (3600000 * 24));
          tr1.append(createHeadCell(new Date(sm).format("yyyy - MMMM"), daysInMonth)); //spans mumber of dayn in the month
        }, function (date) {
          tr2.append(createHeadCell(date.format("d"), 1, isHoliday(date) ? "holyH" : null, 25));
          var nd = new Date(date.getTime());
          nd.setDate(date.getDate() + 1);
          trBody.append(createBodyCell(1, nd.getDate() == 1, isHoliday(date) ? "holy" : null));
          date.setDate(date.getDate() + 1);
        });

        //week
      } else if (zoom == "w") {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24)) * 40); //1 day= 40px
        iterate(function (date) {
          var end = new Date(date.getTime());
          end.setDate(end.getDate() + 6);
          tr1.append(createHeadCell(date.format("yyyy (MMM d") + " - " + end.format("MMM d)"), 7));
          date.setDate(date.getDate() + 7);
        }, function (date) {
          tr2.append(createHeadCell(date.format("EEE"), 1, isHoliday(date) ? "holyH" : null, 40));
          trBody.append(createBodyCell(1, date.getDay() % 7 == (self.master.firstDayOfWeek + 6) % 7, isHoliday(date) ? "holy" : null));
          date.setDate(date.getDate() + 1);
        });

        //days
      }
  //    else if (zoom == "d") {
  //      computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000 * 24)) * 100); //1 day= 100px
  //      iterate(function (date) {
  //        var end = new Date(date.getTime());
  //        end.setDate(end.getDate() + 6);
  //        tr1.append(createHeadCell(date.format("MMMM d") + " - " + end.format("MMMM d yyyy"), 7));
  //        date.setDate(date.getDate() + 7);
  //      }, function (date) {
  //        tr2.append(createHeadCell(date.format("EEE d"), 1, isHoliday(date) ? "holyH" : null, 100));
  //        trBody.append(createBodyCell(1, date.getDay() % 7 == (self.master.firstDayOfWeek + 6) % 7, isHoliday(date) ? "holy" : null));
  //        date.setDate(date.getDate() + 1);
  //      });
  //
  //    }
      else if(zoom=="d") //day expand
    {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (3600000*1)) * 25); //1 hours= 25px
          iterate(function (date) {
            var sm = date.getTime();
            date.setDate(date.getDate() + 1);
            tr1.append(createHeadCell(new Date(sm).format("yyyy-MM-dd"), 24));  //24 锟斤拷锟�每锟斤拷 tr1 锟斤拷元锟斤拷锟斤拷 24
          }, function (date) {
            tr2.append(createHeadCell(date.format("H"), 1, isHoliday(date) ? "holyH" : null, 25));//*****
            var nd = new Date(date.getTime());
            nd.setHours(date.getHours() + 1);
            trBody.append(createBodyCell(1, nd.getHours()==0, isHoliday(date) ? "holy" : null));
            date.setHours(date.getHours() + 1);
          });
    }
      else if(zoom=="mi")
      {
        computedTableWidth = Math.floor(((endPeriod - startPeriod) / (600000*1)) * 25); //10锟斤拷锟斤拷1锟斤拷锟斤拷元锟斤拷
          iterate(function (date) {
            var sm = date.getTime();
            date.setHours(date.getHours() + 1);
            tr1.append(createHeadCell(new Date(sm).format("yyyy-MM-dd (H)"), 6));  
          }, function (date) {
            tr2.append(createHeadCell(date.format("m"), 1, isHoliday(date) ? "holyH" : null, 25));//*****
            var nd = new Date(date.getTime());
            nd.setMinutes(nd.getMinutes()+10);
            trBody.append(createBodyCell(1, nd.getMinutes()==0, isHoliday(date) ? "holy" : null));
            date.setMinutes(date.getMinutes() + 10);
          });
      }
      else {
        console.error("Wrong level " + zoom);
      }

      //set a minimal width
      computedTableWidth = Math.max(computedTableWidth, self.minGanttSize);

      var table = $("<table cellspacing=0 cellpadding=0>");
      table.append(tr1).append(tr2).css({width:computedTableWidth});

      var head = table.clone().addClass("fixHead");

      table.append(trBody).addClass("ganttTable");


      var height = self.master.editor.element.height();
      table.height(height);

      var box = $("<div>");
      box.addClass("gantt unselectable").attr("unselectable", "true").css({position:"relative", width:computedTableWidth});
      box.append(table);

      box.append(head);


      //highlightBar
      var hlb = $("<div>").addClass("ganttHighLight");
      box.append(hlb);
      self.highlightBar = hlb;


      var rowHeight = 30; // todo get it from css?
      //create the svg
      box.svg({settings:{class:"ganttSVGBox"},
        onLoad:         function (svg) {
          //console.debug("svg loaded", svg);

          //creates gradient and definitions
          var defs = svg.defs('myDefs');
          svg.linearGradient(defs, 'taskGrad', [
            [0, '#ddd'],
            [.5, '#fff'],
            [1, '#ddd']
          ], 0, 0, 0, "100%");

          //create backgound
          var extDep = svg.pattern(defs, "extDep", 0, 0, 40, 40, 0, 0, 40, 40, {patternUnits:'userSpaceOnUse'});
          svg.image(extDep, 0, 0, 40, 40, "buss/aps/week/gantt_img/hasExternalDeps.png");

          self.svg = svg;
          $(svg).addClass("ganttSVGBox");

          //creates grid group
          var gridGroup = svg.group("gridGroup");

          //creates rows grid
          for (var i = 49.5; i <= height; i += rowHeight)
            svg.line(gridGroup, 0, i, "100%", i, {class:"ganttLinesSVG"});

          //creates links group
          self.linksGroup = svg.group("linksGroup");

          //creates tasks group
          self.tasksGroup = svg.group("tasksGroup");

          //compute scalefactor fx
          self.fx = computedTableWidth / (endPeriod - startPeriod);

          // drawTodayLine
          if (new Date().getTime() > self.startMillis && new Date().getTime() < self.endMillis) {
            var x = Math.round(((new Date().getTime()) - self.startMillis) * self.fx);
            svg.line(gridGroup, x, 0, x, "100%", {class:"ganttTodaySVG"});
          }

        }
      });

      return box;
    }

    //if include today synch extremes
    if (this.includeToday) {
      var today = new Date().getTime();
      originalStartmillis = originalStartmillis > today ? today : originalStartmillis;
      originalEndMillis = originalEndMillis < today ? today : originalEndMillis;
    }


    //get best dimension fo gantt
    var period = getPeriod(zoom, originalStartmillis, originalEndMillis); //this is enlarged to match complete periods basing on zoom level

  //  //修正线体任务的开始时间和结束时间(2018-04-08 by cc)
  //  this.master.tasks.forEach(function(task,index,array){
  //	  if(task.isLine){
  //		  task.start=period.start;
  //		  task.end=period.end;
  //	  }
  //  });
    
    //console.debug(new Date(period.start) + "   " + new Date(period.end));
    self.startMillis = period.start; //real dimension of gantt
    self.endMillis = period.end;
    self.originalStartMillis = originalStartmillis; //minimal dimension required by user or by task duration
    self.originalEndMillis = originalEndMillis;

    var table = createGantt(zoom, period.start, period.end);

    return table;
  };


  //<%-------------------------------------- GANT TASK GRAPHIC ELEMENT --------------------------------------%>
  function formouseover(e,task)
  {
    //添加提示框
      var desc;
      if(task.isLine){
        desc=getLanguage("LINE_NAME")+": "+task.name+"</br>"
            +getLanguage("TOTAL_WORKTIME")+": "+task.availableWorkTime+"(min)</br>"
            +getLanguage("USED_WORKTIME")+": "+task.usedWorkTime+"(min)</br>"
            +getLanguage("LEFT_WORKTIME")+": "+(task.availableWorkTime-task.usedWorkTime)+"(min)</br>"
            +getLanguage("USED_PERCENT")+": "+task.progress+"%</br>"
            +getLanguage("LINE_TRACK")+": "+(task.multiTrack=="Y"?getLanguage("MULIT_TRACK"):getLanguage("SINGLE_TRACK"))+"</br>";
      }
      else {
        var startDate=new Date(parseInt(("/Date("+task.start+")/").substr(6, 13))).format("yyyy-MM-dd HH:mm");
        var endtDate=new Date(parseInt(("/Date("+task.end+")/").substr(6, 13))).format("yyyy-MM-dd HH:mm");
        desc=getLanguage("MONUMBER")+": "+task.name+"</br>"
          +getLanguage("START_PLAN_DATE")+": "+startDate+"</br>"
          +getLanguage("END_PLAN_DATE")+": "+endtDate+"</br>"
          +getLanguage("START_ACTUAL_DATE")+": "+task.startDate+"</br>"
          +getLanguage("END_ACTUAL_DATE")+": "+task.closeDate+"</br>"
          +getLanguage("MO_USED_WORKTIME")+": "+(task.duration-task.changeTime)+"(min)</br>"
          +getLanguage("FACE")+": "+task.faceName+"</br>"
          +getLanguage("CHANGE_TIME")+": "+task.changeTime+"(min)</br>"
          +getLanguage("TRACK")+": "+task.trackName+"</br>"
          +getLanguage("TASKEXCEPTION_STATUS")+": "+(task.taskException?getLanguage("TASKEXCEPTION_STATUS_TRUE"):getLanguage("TASKEXCEPTION_STATUS_FALSE"))+"</br>";
      }
      
      var hint = $('<div class="gantt-msg-hint"/>').html(desc);
      $("body").append(hint);
      //hint.css("left", e.pageX);
      //hint.css("top", e.pageY);
      var winHeight=$(window).height();
      var hintHeight=$(hint).height();
      if(e.pageY+hintHeight>winHeight){
        hint.css("left", e.pageX);
        hint.css("top", e.pageY-hintHeight-20);
      }
      else {
        hint.css("left", e.pageX);
        hint.css("top", e.pageY);
      }
      hint.show();
    };

  Ganttalendar.prototype.drawTask = function (task) {
    //console.debug("drawTask", task.name,new Date(task.start));
    var self = this;
    //var prof = new Profiler("ganttDrawTask");
    editorRow = task.rowElement;
    //var top = editorRow.position().top + self.master.editor.element.parent().scrollTop();
    var top = editorRow.position().top + editorRow.offsetParent().scrollTop();
    var x = Math.round((task.start - self.startMillis) * self.fx);
    var actx= Math.round((task.actStart - self.startMillis) * self.fx);
    task.hasChild = task.isParent();
    var taskBox=$(_createTaskSVG(task, {x:x, y:top, width:Math.round((task.end - task.start) * self.fx),fx:self.fx,actx:actx,acty:top+13,actwidth:Math.round((task.actEnd - task.actStart) * self.fx)}));
    task.ganttElement = taskBox;
    if (self.showCriticalPath && task.isCritical)
      taskBox.addClass("critical");
    
    if (this.master.canWrite && task.canWrite) {
      //bind all events on taskBox
      taskBox
        .click(function (e) { // manages selection
          e.stopPropagation();// to avoid body remove focused
          self.element.find(".focused").removeClass("focused");
          $(".ganttSVGBox .focused").removeClass("focused");
          var el = $(this);
          if (!self.resDrop)
            el.addClass("focused");
          self.resDrop = false; //hack to avoid select

          $("body").off("click.focused").one("click.focused", function () {
            $(".ganttSVGBox .focused").removeClass("focused");
          });
        }).dblclick(function () {
          //self.master.showTaskEditor($(this).attr("taskid"));
        }).mouseenter(function () {
          //bring to top
          var el = $(this);
          
          //若为线体类型,则不支持连线
        var task = self.master.getTask(el.attr("taskid"));
        if(task.isLine){
          return;
        }
        if(!task.isForSituation){ //2018-06-19 by cc
	    	if (!self.linkOnProgress) { 
	
	            //el.find(".linkHandleSVG").show();
	            el.find("circle").show();
	            
	          } else {
	            el.addClass("linkOver");
	            //el.find(".linkHandleSVG"+(self.linkFromEnd?".taskLinkStartSVG ":".taskLinkEndSVG")).show()
	          }
        }
        }).mouseover(function(e){
          //锟斤拷锟斤拷锟较拷锟绞�
          formouseover(e,task);
        // console.log(e.pageX+"   "+e.pageY);
        }).mouseout(function(){
          //锟狡筹拷锟斤拷示锟斤拷息
          $(".gantt-msg-hint").remove();
        }).mouseleave(function () {
          var el = $(this);
        
          //el.removeClass("linkOver").find(".linkHandleSVG").hide();
          el.removeClass("linkOver").find("circle").hide();
        }).mouseup(function (e) {
        //锟斤拷锟脚匡拷锟斤拷锟斤拷锟絤ouseover锟铰硷拷
        if($(this).onmouseover==null)
        {
          $(this).bind("mouseover",function(e){
            //锟斤拷锟斤拷锟较拷锟绞�
              formouseover(e,task);
          });
        }
        
          $(":focus").blur(); // in order to save grid field when moving task
        }).mousedown(function () {
          //去锟斤拷锟斤拷示锟斤拷息
            $(this).unbind("mouseover");
            var hitmsg=$(".gantt-msg-hint");
            if(hitmsg) hitmsg.remove();  
          
          var task = self.master.getTask($(this).attr("taskId"));
          task.rowElement.click();
        }).dragExtedSVG($(self.svg.root()), {
          canResize:  false,
          canDrag:    (task.isLine || task.isForSituation?false:true),//线体类型任务无法拖拽 2018-04-09 by cc //!task.depends && this.master.canWrite && task.canWrite,
          startDrag:  function (e) {
            $(".ganttSVGBox .focused").removeClass("focused");
          },
          drag:       function (e) {
            $("[from=" + task.id + "],[to=" + task.id + "]").trigger("update");
          },
          drop:       function (e) {
            self.resDrop = true; //hack to avoid select
            var taskbox = $(this);
            var task = self.master.getTask(taskbox.attr("taskid"));
            var s = Math.round((parseFloat(taskbox.attr("x")) / self.fx) + self.startMillis);
            self.master.beginTransaction();
            self.master.moveTask(task, new Date(s));
            self.master.endTransaction();
            //reset task afters 2018-06-06 by cc
            try{
            	task.getParent().getChildren().forEach(function(item,index,array){
                    item.findCloserAfterParam();
                });
            }
            catch(error){}
            
          },
          startResize:function (e) {
            //console.debug("startResize");
            $(".ganttSVGBox .focused").removeClass("focused");
            var taskbox = $(this);
            var text = $(self.svg.text(parseInt(taskbox.attr("x")) + parseInt(taskbox.attr("width") + 8), parseInt(taskbox.attr("y")), "", {"font-size":"10px", "fill":"red"}));
            taskBox.data("textDur", text);
          },
          resize:     function (e) {
            //find and update links from, to
            var taskbox = $(this);
            var task = self.master.getTask(taskbox.attr("taskid"));
            var st = Math.round((parseFloat(taskbox.attr("x")) / self.fx) + self.startMillis);
            var en = Math.round(((parseFloat(taskbox.attr("x")) + parseFloat(taskbox.attr("width"))) / self.fx) + self.startMillis);
            var d = computeStartDate(st,task.areaSn).distanceInWorkingDays(computeEndDate(en,task.areaSn),task.areaSn);
            var text = taskBox.data("textDur");
            text.attr("x", parseInt(taskbox.attr("x")) + parseInt(taskbox.attr("width")) + 8).html(d);

            $("[from=" + task.id + "],[to=" + task.id + "]").trigger("update");
          },
          stopResize: function (e) {
            self.resDrop = true; //hack to avoid select
            //console.debug(ui)
            var textBox = taskBox.data("textDur");
            if (textBox)
              textBox.remove();
            var taskbox = $(this);
            var task = self.master.getTask(taskbox.attr("taskid"));
            var st = Math.round((parseFloat(taskbox.attr("x")) / self.fx) + self.startMillis);
            var en = Math.round(((parseFloat(taskbox.attr("x")) + parseFloat(taskbox.attr("width"))) / self.fx) + self.startMillis);
            self.master.beginTransaction();
            self.master.changeTaskDates(task, new Date(st), new Date(en));
            self.master.endTransaction();
          }
        });

      //binding for creating link
      //taskBox.find(".linkHandleSVG").mousedown(function (e) {
      taskBox.find("circle").mousedown(function (e) {
        e.preventDefault();
        e.stopPropagation();
        //var taskBox = $(this).closest(".taskBoxSVG");
        var taskBox = $(this).closest("svg");
        var svg = $(self.svg.root());
        var offs = svg.offset();
        self.linkOnProgress = true;
        //self.linkFromEnd = $(this).is(".taskLinkEndSVG");
        self.linkFromEnd = $(this).hasClass("taskLinkEndSVG");
        svg.addClass("linkOnProgress");

        // create the line
        var startX = parseFloat(taskBox.attr("x")) + (self.linkFromEnd ? parseFloat(taskBox.attr("width")) : 0);
        var startY = parseFloat(taskBox.attr("y")) + parseFloat(taskBox.attr("height")) / 2;
        var line = self.svg.line(startX, startY, e.pageX - offs.left - 5, e.pageY - offs.top - 5, {class:"linkLineSVG"});
        var circle = self.svg.circle(startX, startY, 5, {class:"linkLineSVG"});

        //bind mousemove to draw a line
        svg.bind("mousemove.linkSVG", function (e) {
          var offs = svg.offset();
          var nx = e.pageX - offs.left;
          var ny = e.pageY - offs.top;
          var c = Math.sqrt(Math.pow(nx - startX, 2) + Math.pow(ny - startY, 2));
          nx = nx - (nx - startX) * 10 / c;
          ny = ny - (ny - startY) * 10 / c;
          self.svg.change(line, { x2:nx, y2:ny});
          self.svg.change(circle, { cx:nx, cy:ny});
        });

        //bind mouseup un body to stop
        $("body").one("mouseup.linkSVG", function (e) {
          
          $(line).remove();
          $(circle).remove();
          self.linkOnProgress = false;
          svg.removeClass("linkOnProgress");

          $(self.svg.root()).unbind("mousemove.linkSVG");
          //var targetBox = $(e.target).closest(".taskBoxSVG");
          var targetBox = $(e.target).closest("svg");
          //console.debug("create link from " + taskBox.attr("taskid") + " to " + targetBox.attr("taskid"));

          if (targetBox && targetBox.attr("taskid") != taskBox.attr("taskid")) {
            var taskTo;
            var taskFrom;
            if (self.linkFromEnd) {
              taskTo = self.master.getTask(targetBox.attr("taskid"));
              taskFrom = self.master.getTask(taskBox.attr("taskid"));
            } else {
              taskFrom = self.master.getTask(targetBox.attr("taskid"));
              taskTo = self.master.getTask(taskBox.attr("taskid"));
            }
            var dependsList=taskTo.depends==null?[]:taskTo.depends.split(',');
            if(dependsList.indexOf(taskFrom.id.toString())<0){//判定taskTo中的前置任务是否已经包含taskFrom，若已包含不执行添加操作 2018-06-27 by cc
              if (taskTo && taskFrom) {
                var gap = 0;
                var depInp = taskTo.rowElement.find("[name=depends]");
                //前置任务发生变化,修改任务标识(2018-04-10 by cc)
                taskTo.isChanged=true;
                
                depInp.val(depInp.val() + ((depInp.val() + "").length > 0 ? "," : "") + (taskFrom.getRow() + 1) + (gap != 0 ? ":" + gap : ""));
                depInp.blur();
              }
            }
          }
        })
      });
    }
    //ask for redraw link
    self.redrawLinks();

    //prof.stop();


    function _createTaskSVG(task, dimensions) {
      if(!task.isForSituation){ //2018-06-19 by cc is not in situation show
        var svg = self.svg;
        var taskSvg = svg.svg(self.tasksGroup, dimensions.x, dimensions.y, dimensions.width, 25, {class:"taskBox taskBoxSVG", taskid:task.id});

        //svg.title(taskSvg, task.name);
        //external box
        var layout = svg.rect(taskSvg, 0, 4, "100%", "22", {class:"taskLayout", rx:"0", ry:"0"});

        // if (task.hasExternalDep) {
        //   layout.style.fill = "#ececec";
        // } else {
        //   layout.style.fill = "#ececec";
        // }

        if(task.isLine){
          layout.style.fill = "#ececec";
        }
        else {
          if(task.taskOpt==updateFlag){
            if(task.track=="S"){
              layout.style.fill = "#f8b72d";
            }
            else if(task.track=="A"){
              layout.style.fill = "#4169E1";
            }
            else if(task.track=="B"){
              layout.style.fill = "#00BFFF";
            }
          }
          else if(task.taskOpt==insertFlag){
            layout.style.fill = "#ffe5c1";
          }
          else {
            layout.style.fill = "#F0F8FF";
          }
        }

        //progress
        var taskStartToEnd=task.end-task.start;//由于存在特殊时间点的跨度，开始时间和结束时间的差不能直接使用duration
        if (task.progress > 0) {
          var progress = svg.rect(taskSvg, 0, 4, (task.progress > 100 ? 100 : task.progress) + "%", "22", {fill:(task.progress > 100 ? "#b32210" : "#aace36"), rx:"0", ry:"0"});
          //判定是否需要上色
          if((task.isLine && isFatherTaskPainting) || (!task.isLine && isChildTaskPainting)){
              //在写进度前先绘制特殊时间点，避免进度被覆盖
              var varY=0;
              var varH="0";
              task.specialTimeDurations.forEach(function(special,index,array){
                if(task.isLine){
                  varY=8;
                  varH="18";
                }
                else {
                  varY=4;
                  varH="22";
                }
                svg.rect(taskSvg, (special.datePoint-task.start)*dimensions.fx, varY, (parseInt(special.duration*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", varH, {fill:("#999999"), rx:"0", ry:"0"});
              });
          }

          //在特殊时间点之后且进度之前上色，避免被特殊时间点覆盖以及覆盖进度
          if(task.isLine && isFatherTaskPainting && task.lostTimebyCoe>0){
            svg.rect(taskSvg, (taskStartToEnd-parseInt(task.lostTimebyCoe*60*1000))*dimensions.fx, 8, (parseInt(task.lostTimebyCoe*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", "18", {fill:("#FF7F66"), rx:"0", ry:"0"});
          }

          if (dimensions.width > 50) {
            var textStyle = {fill:"#333", "font-size":"10px"};
            if (task.progress > 90)
              textStyle.transform = "translate(-30)";
            svg.text(taskSvg, (task.progress > 90 ? 100 : task.progress) + "%", 18, task.progress + "%", textStyle);
          }
        }
        else {
          //判定是否需要上色
          if((task.isLine && isFatherTaskPainting) || (!task.isLine && isChildTaskPainting)){
                var varY=0;
                var varH="0";
                task.specialTimeDurations.forEach(function(special,index,array){
                  if(task.isLine){
                    varY=8;
                    varH="18";
                  }
                  else {
                    varY=4;
                    varH="22";
                  }
                  svg.rect(taskSvg, (special.datePoint-task.start)*dimensions.fx, varY, (parseInt(special.duration*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", varH, {fill:("#999999"), rx:"0", ry:"0"});
                });
            }

          //在特殊时间点之后上色，避免被特殊时间点覆盖
          if(task.isLine && isFatherTaskPainting && task.lostTimebyCoe>0){
            svg.rect(taskSvg, (taskStartToEnd-parseInt(task.lostTimebyCoe*60*1000))*dimensions.fx, 8, (parseInt(task.lostTimebyCoe*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", "18", {fill:("#FF7F66"), rx:"0", ry:"0"});
          }
        }

        //status
        if(!task.isLine){
          if (dimensions.width > 15)
            //禁用状态颜色
              //svg.rect(taskSvg, 6, 9, 12, 12, {stroke:1, rx:"6", ry:"6", status:task.status, class:"taskStatusSVG"});

              if (task.hasChild)
                svg.rect(taskSvg, 0, 2, "100%", 2, {fill:"#333"});

              if (task.startIsMilestone) {
                svg.image(taskSvg, -8, 5, 16, 20, "buss/aps/week/gantt_img/start.png")
              }

              if (task.endIsMilestone) {
                svg.image(taskSvg, "100%", 5, 16, 20, "buss/aps/week/gantt_img/end.png", {transform:"translate(-9)"})
              }
        }
        else {
          if (task.hasChild){
            svg.rect(taskSvg, 0, 4, "100%", 4, {fill:"#333"});
            svg.image(taskSvg, -8, 5, 16, 20, "buss/aps/week/gantt_img/start.png")
            svg.image(taskSvg, "100%", 5, 16, 20, "buss/aps/week/gantt_img/end.png", {transform:"translate(-9)"})
          }
        }

        //task label
        if(task.isLine){
          svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabellineSVG", transform:"translate(8,-6)"});
        }
        else {
          if(task.taskException){
            svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabelSVGWarn", transform:"translate(8,-8)"});
          }
          else {
            svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabelSVG", transform:"translate(8,-8)"});
          }
        }

        //标记换线时间
        if(!task.isLine && typeof(task.changeTimeSpan)!="undefined"){
          var changeTimeStartPosition=task.changeTimePosition=="inside"?0:(0-task.changeTimeSpan)*dimensions.fx;
          svg.rect(taskSvg, changeTimeStartPosition, 4, (parseInt(task.changeTimeSpan)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", "22", {fill:("#DC143C"), rx:"0", ry:"0"});
        }
        
        //link tool
        svg.circle(taskSvg, "0", 15, 4, {class:"taskLinkStartSVG linkHandleSVG", transform:"translate(0)"});
        svg.circle(taskSvg, "100%", 15, 4, {class:"taskLinkEndSVG linkHandleSVG", transform:"translate(0)"});

        return taskSvg;
      }
      else { //2018-06-19 by cc is in situation show
        var svg = self.svg;
        var taskSvg = svg.svg(self.tasksGroup, dimensions.x, dimensions.y, dimensions.width, 25, {class:"taskBox taskBoxSVG", taskid:task.id});
        var actTaskSvg=svg.svg(self.tasksGroup, dimensions.actx, dimensions.acty, dimensions.actwidth, 25, {class:"taskBox taskBoxSVG", taskid:task.id+"-act"});
        
        var boxHeight=task.isLine?"22":"10";
        //svg.title(taskSvg, task.name);
        //external box
        var layout = svg.rect(taskSvg, 0, 4, "100%", boxHeight, {class:"taskLayout", rx:"0", ry:"0"});
        var actLayout;
        // if (task.hasExternalDep) {
        //   layout.style.fill = "#ececec";
        // } else {
        //   layout.style.fill = "#ececec";
        // }

        if(task.isLine){
          layout.style.fill = "#ececec";
        }
        else {
          //plan
    	  if(task.taskOpt==updateFlag){
            if(task.track=="S"){
              layout.style.fill = "#f8b72d";
            }
            else if(task.track=="A"){
              layout.style.fill = "#4169E1";
            }
            else if(task.track=="B"){
              layout.style.fill = "#00BFFF";
            }
          }
          else if(task.taskOpt==insertFlag){
            layout.style.fill = "#ffe5c1";
          }
          else {
            layout.style.fill = "#F0F8FF";
          }
    	  //act
          actLayout=svg.rect(actTaskSvg, 0, 4, "100%", boxHeight, {class:"taskLayout", rx:"0", ry:"0"});
          if(dimensions.actx!=dimensions.x){
            actLayout.style.fill="#FF4500";
          }
          else{
            actLayout.style.fill="#3CB371";
          }
        }
        
        //progress
        var taskStartToEnd=task.end-task.start;//由于存在特殊时间点的跨度，开始时间和结束时间的差不能直接使用duration
        if (task.progress > 0) {
          var progress = svg.rect(taskSvg, 0, 4, (task.progress > 100 ? 100 : task.progress) + "%", boxHeight, {fill:(task.progress > 100 ? "#b32210" : "#aace36"), rx:"0", ry:"0"});

          //判定是否需要上色
          if(task.isLine && isFatherTaskPainting){
            var varY=0;
            var varH="0";
            task.specialTimeDurations.forEach(function(special,index,array){
              if(task.isLine){
                varY=8;
                varH="18";
              }
              else {
                varY=4;
                varH="22";
              }
              svg.rect(taskSvg, (special.datePoint-task.start)*dimensions.fx, varY, (parseInt(special.duration*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", varH, {fill:("#999999"), rx:"0", ry:"0"});
            });
          }

          if (dimensions.width > 50) {
            var textStyle = {fill:"#333", "font-size":"10px"};
            if (task.progress > 90)
              textStyle.transform = "translate(-30)";
            svg.text(taskSvg, (task.progress > 90 ? 100 : task.progress) + "%", 18, task.progress + "%", textStyle);
          }
        }
        else {
          //判定是否需要上色
          if(task.isLine && isFatherTaskPainting){
            var varY=0;
            var varH="0";
            task.specialTimeDurations.forEach(function(special,index,array){
              if(task.isLine){
                varY=8;
                varH="18";
              }
              else {
                varY=4;
                varH="22";
              }
              svg.rect(taskSvg, (special.datePoint-task.start)*dimensions.fx, varY, (parseInt(special.duration*60*1000)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", varH, {fill:("#999999"), rx:"0", ry:"0"});
            });
          }
        }

        //status
        if(!task.isLine){
          if (dimensions.width > 15)
            //禁用状态颜色
              //svg.rect(taskSvg, 6, 9, 12, 12, {stroke:1, rx:"6", ry:"6", status:task.status, class:"taskStatusSVG"});

              if (task.hasChild)
                svg.rect(taskSvg, 0, 2, "100%", 2, {fill:"#333"});

              if (task.startIsMilestone) {
                svg.image(taskSvg, -8, 5, 16, 20, "buss/aps/week/gantt_img/start.png")
              }

              if (task.endIsMilestone) {
                svg.image(taskSvg, "100%", 5, 16, 20, "buss/aps/week/gantt_img/end.png", {transform:"translate(-9)"})
              }
        }
        else {
          if (task.hasChild){
            svg.rect(taskSvg, 0, 4, "100%", 4, {fill:"#333"});
            svg.image(taskSvg, -8, 5, 16, 20, "buss/aps/week/gantt_img/start.png")
            svg.image(taskSvg, "100%", 5, 16, 20, "buss/aps/week/gantt_img/end.png", {transform:"translate(-9)"})
          }
        }

        //task label
        if(task.isLine){
          svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabellineSVG", transform:"translate(8,-6)"});
        }
        else {
        	if(task.taskException){
                svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabelSVGWarn", transform:"translate(8,-13)"});
              }
              else {
                svg.text(taskSvg, "100%", 26, task.name, {class:"taskLabelSVG", transform:"translate(8,-13)"});
              }
        }

        //标记换线时间
        if(!task.isLine && typeof(task.changeTimeSpan)!="undefined"){
          var changeTimeStartPosition=(task.changeTimePosition=="inside"?0:(0-task.changeTimeSpan)*dimensions.fx);
          var actChangeTimeStartPosition=(task.changeTimePosition=="inside" && dimensions.actx==dimensions.x?0:(0-task.changeTimeSpan)*dimensions.fx);
          svg.rect(taskSvg, changeTimeStartPosition, 4, (parseInt(task.changeTimeSpan)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", boxHeight, {fill:("#DC143C"), rx:"0", ry:"0"});
          svg.rect(actTaskSvg, actChangeTimeStartPosition, 4, (parseInt(task.changeTimeSpan)/parseInt(taskStartToEnd)*100).toFixed(2) + "%", boxHeight, {fill:("#DC143C"), rx:"0", ry:"0"});
        }
        
        //link tool
        svg.circle(taskSvg, "0", 15, 4, {class:"taskLinkStartSVG linkHandleSVG", transform:"translate(0)"});
        svg.circle(taskSvg, "100%", 15, 4, {class:"taskLinkEndSVG linkHandleSVG", transform:"translate(0)"});

        return taskSvg;
      }
    }
  };


  Ganttalendar.prototype.addTask = function (task) {
    //set new boundaries for gantt
    this.originalEndMillis = this.originalEndMillis > task.end ? this.originalEndMillis : task.end;
    this.originalStartMillis = this.originalStartMillis < task.start ? this.originalStartMillis : task.start;
  };


  //<%-------------------------------------- GANT DRAW LINK SVG ELEMENT --------------------------------------%>
  //'from' and 'to' are tasks already drawn
  Ganttalendar.prototype.drawLink = function (from, to, type) {
    var self = this;
    //console.debug("drawLink")
    var peduncolusSize = 10;

    /**
     * Given an item, extract its rendered position
     * width and height into a structure.
     */
    function buildRect(item) {
      var p = item.ganttElement.position();
      var rect = {
        left:  parseFloat(item.ganttElement.attr("x")),
        top:   parseFloat(item.ganttElement.attr("y")),
        width: parseFloat(item.ganttElement.attr("width")),
        height:parseFloat(item.ganttElement.attr("height"))
      };
      return rect;
    }

    /**
     * The default rendering method, which paints a start to end dependency.
     */
    function drawStartToEnd(from, to, ps) {
      var svg = self.svg;

      //this function update an existing link
      function update() {
        var group = $(this);
        var from = group.data("from");
        var to = group.data("to");

        var rectFrom = buildRect(from);
        var rectTo = buildRect(to);

        var fx1 = rectFrom.left;
        var fx2 = rectFrom.left + rectFrom.width;
        var fy = rectFrom.height / 2 + rectFrom.top;

        var tx1 = rectTo.left;
        var tx2 = rectTo.left + rectTo.width;
        var ty = rectTo.height / 2 + rectTo.top;


        var tooClose = tx1 < fx2 + 2 * ps;
        var r = 5; //radius
        var arrowOffset = 5;
        var up = fy > ty;
        var fup = up ? -1 : 1;

        var prev = fx2 + 2 * ps > tx1;
        var fprev = prev ? -1 : 1;

        var image = group.find("image");
        var p = svg.createPath();

        if (tooClose) {
          var firstLine = fup * (rectFrom.height / 2 - 2 * r + 2);
          p.move(fx2, fy)
            .line(ps, 0, true)
            .arc(r, r, 90, false, !up, r, fup * r, true)
            .line(0, firstLine, true)
            .arc(r, r, 90, false, !up, -r, fup * r, true)
            .line(fprev * 2 * ps + (tx1 - fx2), 0, true)
            .arc(r, r, 90, false, up, -r, fup * r, true)
            .line(0, (Math.abs(ty - fy) - 4 * r - Math.abs(firstLine)) * fup - arrowOffset, true)
            .arc(r, r, 90, false, up, r, fup * r, true)
            .line(ps, 0, true);
          image.attr({x:tx1 - 5, y:ty - 5 - arrowOffset});

        } else {
          p.move(fx2, fy)
            .line((tx1 - fx2) / 2 - r, 0, true)
            .arc(r, r, 90, false, !up, r, fup * r, true)
            .line(0, ty - fy - fup * 2 * r + arrowOffset, true)
            .arc(r, r, 90, false, up, r, fup * r, true)
            .line((tx1 - fx2) / 2 - r, 0, true);
          image.attr({x:tx1 - 5, y:ty - 5 + arrowOffset});
        }

        group.find("path").attr({d:p.path()});
      }


      // create the group
      var group = svg.group(self.linksGroup, "" + from.id + "-" + to.id);
      svg.title(group, from.name + " -> " + to.name);

      var p = svg.createPath();

      //add the arrow
      svg.image(group, 0, 0, 5, 10, "buss/aps/week/gantt_img/linkArrow.png");
      //create empty path
      svg.path(group, p, {class:"taskLinkPathSVG"});

      //set "from" and "to" to the group, bind "update" and trigger it
      var jqGroup = $(group).data({from:from, to:to }).attr({from:from.id, to:to.id}).on("update", update).trigger("update");

      if (self.showCriticalPath && from.isCritical && to.isCritical)
        jqGroup.addClass("critical");

      jqGroup.addClass("linkGroup");
      return jqGroup;
    }


    /**
     * A rendering method which paints a start to start dependency.
     */
    function drawStartToStart(from, to) {
      console.error("StartToStart not supported on SVG");
      var rectFrom = buildRect(from);
      var rectTo = buildRect(to);
    }

    var link;
    // Dispatch to the correct renderer
    if (type == 'start-to-start') {
      link = drawStartToStart(from, to, peduncolusSize);
    } else {
      link = drawStartToEnd(from, to, peduncolusSize);
    }

    if (this.master.canWrite && (from.canWrite || to.canWrite)) {
      link.click(function (e) {
        var el = $(this);
        e.stopPropagation();// to avoid body remove focused
        self.element.find(".focused").removeClass("focused");
        $(".ganttSVGBox .focused").removeClass("focused");
        var el = $(this);
        if (!self.resDrop)
          el.addClass("focused");
        self.resDrop = false; //hack to avoid select

        $("body").off("click.focused").one("click.focused", function () {
          $(".ganttSVGBox .focused").removeClass("focused");
        })

      });
    }


  };

  Ganttalendar.prototype.redrawLinks = function () {
    //console.debug("redrawLinks ");
    var self = this;
    this.element.stopTime("ganttlnksredr");
    this.element.oneTime(60, "ganttlnksredr", function () {

      //var prof=new Profiler("gd_drawLink_real");

      //remove all links
      $("#linksSVG").empty();

      var collapsedDescendant = [];

      //[expand]
      var collapsedDescendant = self.master.getCollapsedDescendant();
      for (var i = 0; i < self.master.links.length; i++) {
        var link = self.master.links[i];

        if (collapsedDescendant.indexOf(link.from) >= 0 || collapsedDescendant.indexOf(link.to) >= 0) continue;

        self.drawLink(link.from, link.to);
      }
      //prof.stop();
    });
  };


  Ganttalendar.prototype.reset = function () {
    this.element.find(".linkGroup").remove();
    this.element.find("[taskId]").remove();
  };


  Ganttalendar.prototype.redrawTasks = function () {
    //[expand]
    var collapsedDescendant = this.master.getCollapsedDescendant();
    for (var i = 0; i < this.master.tasks.length; i++) {
      var task = this.master.tasks[i];
      if (collapsedDescendant.indexOf(task) >= 0) continue;
      this.drawTask(task);
    }
  };


  Ganttalendar.prototype.refreshGantt = function () {
    //console.debug("refreshGantt")

    if (this.showCriticalPath) {
      this.master.computeCriticalPath();
    }


    var par = this.element.parent();

    //try to maintain last scroll
    var scrollY = par.scrollTop();
    var scrollX = par.scrollLeft();

    this.element.remove();
    //guess the zoom level in base of period
    if (!this.zoom) {
      var days = Math.round((this.originalEndMillis - this.originalStartMillis) / (3600000 * 24));
      this.zoom = this.zoomLevels[days < 2 ? 0 : (days < 15 ? 1 : (days < 60 ? 2 : (days < 150 ? 3 : 4  ) ) )];
    }
    var domEl = this.create(this.zoom, this.originalStartMillis, this.originalEndMillis);
    this.element = domEl;
    par.append(domEl);
    this.redrawTasks();

    //set old scroll  
    //console.debug("old scroll:",scrollX,scrollY)
    par.scrollTop(scrollY);
    par.scrollLeft(scrollX);

    //set current task
    this.synchHighlight();

  };


  Ganttalendar.prototype.fitGantt = function () {
    delete this.zoom;
    this.refreshGantt();
  };

  Ganttalendar.prototype.synchHighlight = function () {
    if (this.master.currentTask && this.master.currentTask.ganttElement)
      this.highlightBar.css("top", this.master.currentTask.ganttElement.attr("y") + "px");
  };


  Ganttalendar.prototype.centerOnToday = function () {
    var x = Math.round(((new Date().getTime()) - this.startMillis) * this.fx) - 30;
    //console.debug("centerOnToday "+x);
    this.element.parent().scrollLeft(x);
  };


  /**
   * Allows drag and drop and extesion of task boxes. Only works on x axis
   * @param opt
   * @return {*}
   */
  $.fn.dragExtedSVG = function (svg, opt) {

    //doing this can work with one svg at once only
    var target;
    var svgX;
    var rectMouseDx;

    var options = {
      canDrag:        true,
      canResize:      true,
      resizeZoneWidth:15,
      minSize:        10,
      startDrag:      function (e) {},
      drag:           function (e) {},
      drop:           function (e) {},
      startResize:    function (e) {},
      resize:         function (e) {},
      stopResize:     function (e) {}
    };

    $.extend(options, opt);

    this.each(function () {
      var el = $(this);
      svgX = svg.parent().offset().left; //parent is used instead of svg for a Firefox oddity
      if (options.canDrag)
        el.addClass("deSVGdrag");

      if (options.canResize || options.canDrag) {
        el.bind("mousedown.deSVG",
          function (e) {
            if ($(e.target).is("image")) {
              e.preventDefault();
            }

            target = $(this);
            var x1 = parseFloat(el.offset().left);

            //var x1 = parseFloat(el.attr("x"));
            var x2 = x1 + parseFloat(el.attr("width"));
            var posx = e.pageX;

            $("body").unselectable();

            //start resize
            var x = x2 - posx;
            if (options.canResize && (x >= 0 && x <= options.resizeZoneWidth)) {
              //store offset mouse x1
              rectMouseDx = x2 - e.pageX;
              target.attr("oldw", target.attr("width"));

              var one = true;

              //bind event for start resizing
              $(svg).bind("mousemove.deSVG", function (e) {
                
                if (one) {
                  //trigger startResize
                  options.startResize.call(target.get(0), e);
                  one = false;
                }

                //manage resizing
                var posx = e.pageX;
                var nW = posx - x1 + rectMouseDx;

                target.attr("width", nW < options.minSize ? options.minSize : nW);
                //callback
                options.resize.call(target.get(0), e);
              });

              //bind mouse up on body to stop resizing
              $("body").one("mouseup.deSVG", stopResize);

              // start drag
            } else if (options.canDrag) {
              //store offset mouse x1
              rectMouseDx = parseFloat(target.attr("x")) - e.pageX;
              target.attr("oldx", target.attr("x"));

              var one = true;
              //bind event for start dragging
              $(svg).bind("mousemove.deSVG",function (e) {
                if (one) {
                  //trigger startDrag
                  options.startDrag.call(target.get(0), e);
                  one = false;
                }

                //manage resizing
                target.attr("x", rectMouseDx + e.pageX);
                //callback
                options.drag.call(target.get(0), e);

              }).bind("mouseleave.deSVG", drop);

              //bind mouse up on body to stop resizing
              $("body").one("mouseup.deSVG", drop);

            }
          }

        ).bind("mousemove.deSVG",
          function (e) {
            var el = $(this);
            var x1 = el.offset().left;
            var x2 = x1 + parseFloat(el.attr("width"));
            var posx = e.pageX;


            //console.debug("mousemove", options.canResize && x2 - posx)
            //set cursor handle
            var x = x2 - posx;
            if (options.canResize && (x >= 0 && x <= options.resizeZoneWidth)) {
              el.addClass("deSVGhand");
            } else {
              el.removeClass("deSVGhand");
            }
          }

        ).addClass("deSVG");
      }
    });
    return this;


    function stopResize(e) {
      $(svg).unbind("mousemove.deSVG").unbind("mouseup.deSVG").unbind("mouseleave.deSVG");
      //if (target && target.attr("oldw")!=target.attr("width"))
      if (target)
        options.stopResize.call(target.get(0), e); //callback
      target = undefined;
      $("body").clearUnselectable();
    }

    function drop(e) {
      $(svg).unbind("mousemove.deSVG").unbind("mouseup.deSVG").unbind("mouseleave.deSVG");
      if (target && target.attr("oldx") != target.attr("x"))
        options.drop.call(target.get(0), e); //callback
      target = undefined;
      $("body").clearUnselectable();
    }

  };
