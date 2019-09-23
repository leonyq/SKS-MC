/*
 Copyright (c) 2012-2018 Open Lab
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

  Ganttalendar.prototype.initZoomlevels = function () {
  //console.debug("Ganttalendar.prototype.initZoomlevels");

  var self = this;

  // define the zoom level arrays 
  this.zoomLevels = [];
  this.zoomDrawers = {};


  function _addZoom(zoom,zoomDrawer){
    self.zoomLevels.push(zoom);
    self.zoomDrawers[zoom] = zoomDrawer;

    //compute the scale
    self.zoomDrawers[zoom].computedScaleX=600/millisFromString(zoom);
  }

  
	_addZoom("1h", {
	    adjustDates: function (start, end) {
	      start.setHours(start.getHours() - 1,0,0,0);
          end.setHours(23, 59, 59, 999);
	      end.setHours(end.getHours() + 1);
	    },
	    row1:        function (date, ctxHead) {
	      var start = new Date(date.getTime());
		  date.setHours(date.getHours() + 1);//加1小时为th1的单位
	      self.createHeadCell(1,this,ctxHead,start.format("yyyy-MM-dd (H)"),6,"", start,date);
	    },
	    row2:        function (date, ctxHead, ctxBody) {
	      var start = new Date(date.getTime());
	      date.setMinutes(date.getMinutes() + 10);
	      var holyClass = isHoliday(start) ? "holy" : "";
	      self.createHeadCell(2,this,ctxHead,start.format("m"), 1, "headSmall "+holyClass, start,date);
		  var nd = new Date(start.getTime());
		  nd.setMinutes(start.getMinutes() + 10);
	      self.createBodyCell(this,ctxBody,1, nd.getMinutes()==0, holyClass);
	    }

	
  });
  //-----------------------------  1 DAYS  600px-----------------------------
  _addZoom("1d", {
	    adjustDates: function (start, end) {
	      start.setDate(start.getDate()-1);
//    	  start.setHours(0,0,0,0);
//    	  end.setHours(23, 59, 59, 999);
    	  end.setDate(end.getDate()+1);
	    },
	    row1:        function (date, ctxHead) {
	      var start = new Date(date.getTime());
//	      start.setHours(0,0,0,0);
//	      date.setHours(0,0,0,0);
	      date.setDate(date.getDate() + 1);
	      self.createHeadCell(1,this,ctxHead,start.format("yyyy-MM-dd"),24,"", start,date);
	    },
	    row2:        function (date, ctxHead, ctxBody) {
	      var start = new Date(date.getTime());
	      date.setHours(date.getHours() + 1);
	      var holyClass = isHoliday(start) ? "holy" : "";
	      self.createHeadCell(2,this,ctxHead,start.format("H"), 1, "headSmall "+holyClass, start,date);
		  var nd = new Date(start.getTime());
		  nd.setHours(start.getHours() + 1);
	      self.createBodyCell(this,ctxBody,1, nd.getHours()==0, holyClass);
	    }
	  });



  //-----------------------------  1 WEEK  600px -----------------------------
  _addZoom("1w", {
    adjustDates: function (start, end) {
        start.setHours(0, 0, 0, 0);
        end.setHours(23, 59, 59, 999);

        start.setFirstDayOfThisWeek();
        end.setFirstDayOfThisWeek();
        end.setDate(end.getDate() + 6);
    },
    row1:        function (date, ctxHead) {
      var start = new Date(date.getTime());
      date.setDate(date.getDate() + 6);
      self.createHeadCell(1,this,ctxHead,start.format("yyyy (MMM d") + " - " + date.format("MMM d)"), 7,"",start,date);
      date.setDate(date.getDate() + 1);
    },
    row2:        function (date, ctxHead, ctxBody) {
      var start = new Date(date.getTime());
      date.setDate(date.getDate() + 1);
      var holyClass = isHoliday(start) ? "holy" : "";
      self.createHeadCell(2,this,ctxHead,start.format("EEE"), 1, "headSmall "+holyClass, start,date);
      self.createBodyCell(this,ctxBody,1, start.getDay() % 7 == (self.master.firstDayOfWeek + 6) % 7, holyClass);
    }
  });



  //-----------------------------  1 MONTH  600px  -----------------------------
  _addZoom( "1M",{
    adjustDates: function (start, end) {
      start.setMonth(start.getMonth()-1);
      start.setDate(15);
      end.setDate(1);
      end.setMonth(end.getMonth() + 1);
      end.setDate(end.getDate() + 14);
    },
    row1:        function (date, tr1) {
      var start = new Date(date.getTime());
      date.setDate(1);
      date.setMonth(date.getMonth() + 1);
      date.setDate(date.getDate() - 1);
      var inc=date.getDate()-start.getDate()+1;
      date.setDate(date.getDate() + 1);
      self.createHeadCell(1,this,tr1,start.format("MMMM yyyy"), inc,"",start,date); //spans mumber of dayn in the month
    },
    row2:        function (date, tr2, trBody) {
      var start = new Date(date.getTime());
      date.setDate(date.getDate() + 1);
      var holyClass = isHoliday(start) ? "holy" : "";
      self.createHeadCell(2,this,tr2,start.format("d"), 1, "headSmall "+holyClass, start,date);
      var nd = new Date(start.getTime());
      nd.setDate(start.getDate() + 1);
      self.createBodyCell(this,trBody,1, nd.getDate() == 1, holyClass);
    }
  });



    //-----------------------------  1 QUARTERS   -----------------------------
  _addZoom( "2Q", {
	    adjustDates: function (start, end) {
	      start.setDate(1);
	      start.setMonth(Math.floor(start.getMonth() / 3) * 3 -3);
	      end.setDate(1);
	      end.setMonth(Math.floor(end.getMonth() / 3) * 3 + 6);
	      end.setDate(end.getDate() - 1);
	    },
	    row1:        function (date, tr1) {
	      var start = new Date(date.getTime());
	      date.setMonth(date.getMonth() + 3);
	      var quarter = (Math.floor(start.getMonth() / 3) + 1);
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
	      self.createHeadCell(1,this,tr1,start.format("yyyy")+headerText, 3,"",start,date);
	    },
	    row2:        function (date, tr2, trBody) {
	      var start = new Date(date.getTime());
	      date.setMonth(date.getMonth() + 1);
	      var lbl = start.format("MMMM");
	      self.createHeadCell(2,this,tr2,lbl, 1, "headSmall", start,date);
	      self.createBodyCell(this,trBody,1, start.getMonth() % 3 == 2);
	    }
	  });


    //-----------------------------  2 QUARTERS   -----------------------------
    _addZoom( "1Y", {
        adjustDates: function (start, end) {
          start.setDate(1);
          start.setMonth(Math.floor(start.getMonth() / 6) * 6 -6);
          end.setDate(1);
          end.setMonth(Math.floor(end.getMonth() / 6) * 6 + 12);
          end.setDate(end.getDate() - 1);
        },
        row1:        function (date, tr1) {
          var start = new Date(date.getTime());
          date.setMonth(date.getMonth() + 6);
          var sem = (Math.floor(start.getMonth() / 6) + 1)==1?GanttMaster.messages["PER_SEMESTER"]:GanttMaster.messages["PST_SEMESTER"];
          self.createHeadCell(1,this,tr1,start.format("yyyy")+"-"+sem, 6,"",start,date);
        },
        row2:        function (date, tr2, trBody) {
          var start = new Date(date.getTime());
          date.setMonth(date.getMonth() + 1);
          self.createHeadCell(2,this,tr2,start.format("MMM"), 1, "headSmall", start,date);
          self.createBodyCell(this,trBody,1, (start.getMonth() + 1) % 6 == 0);
        }
      });


  //-----------------------------  1 YEAR  -----------------------------
  _addZoom( "2Y", {
	    adjustDates: function (start, end) {
	      start.setDate(1);
	      start.setMonth(-6);
	      end.setDate(30);
	      end.setMonth(17);
	    },
	    row1:        function (date, tr1) {
	      var start = new Date(date.getTime());
	      var inc=12-start.getMonth();
	      date.setMonth(date.getMonth() + inc);
	      self.createHeadCell(1,this,tr1,start.format("yyyy"), inc/6,"",start,date);
	    },
	    row2:        function (date, tr2, trBody) {
	      var start = new Date(date.getTime());
	      date.setMonth(date.getMonth() + 6);
	      var sem = (Math.floor(start.getMonth() / 6) + 1);
	      var headerText=sem>1?GanttMaster.messages["PST_SEMESTER"]:GanttMaster.messages["PER_SEMESTER"];
	      self.createHeadCell(2,this,tr2,headerText, 1, "headSmall", start,date);
	      self.createBodyCell(this,trBody,1, sem == 2);
	    }
	  });




};




