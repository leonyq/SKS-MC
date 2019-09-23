var _oldSselectedTr = null;
var _oldSselectedTdCssBGC = null;
var _tableListSelTdCssBGC = "#e0e0e0";// 选中行的背景色
function trClickColor(obj) {
	if (null != _oldSselectedTr) {
		_oldSselectedTr.css("background-color", _oldSselectedTdCssBGC);
	}
	_oldSselectedTr = $(obj);
	_oldSselectedTdCssBGC = $(obj).css("background-color");
	$(obj).css("background-color", _tableListSelTdCssBGC);
}
function _toClickColor(jObj) {
	jObj.click(function() {
		trClickColor(this);
	});
}
function _tongLineColor(jObj) {
	jObj.each(function(i) {
		if (i % 2 == 0) {
		} else {
			$(this).addClass("tr-hover");
		}
	});
}
/** *********************************支持多个表格******************************** */

var _oldSselectedTrMap = {};
var _oldSselectedTdCssBGCMap = {};
function trClickColorMap(obj, tableId) {
	if (null != _oldSselectedTrMap[tableId]) {
		_oldSselectedTrMap[tableId].css("background-color",
				_oldSselectedTdCssBGCMap[tableId]);
	}
	_oldSselectedTrMap[tableId] = $(obj);
	_oldSselectedTdCssBGCMap[tableId] = $(obj).css("background-color");
	$(obj).css("background-color", _tableListSelTdCssBGC);
}
function _toClickColorMap(jObj, tableId) {
	jObj.click(function() {
		trClickColorMap(this, tableId);
	});
}

// 监控滚动条
function tableScroll(){
	var flag = $("#datagrid-view-kz").length > 0 ?"-kz":"";
	var isLeft =$("#tableContainer"+flag).length > 0 ?"left-":"";
	var datagridBodyscrollTop=document.getElementById("datagrid-body"+flag).scrollTop;
	var datagridBodyscrollLeft=document.getElementById("datagrid-body"+flag).scrollLeft;

	document.getElementById("datagrid-header-inner").scrollTop=datagridBodyscrollTop;
	document.getElementById("datagrid-header-inner").scrollLeft=datagridBodyscrollLeft;
}

// 美化滚动条
var _isFirstSetScroll = 0;
function setScroll(formId){
    if(_isFirstSetScroll != 0){
    	return;
    }
    _isFirstSetScroll++;
    var axis = "yx";
    if(formId && $("#tbody_"+formId+" tr").length<=1){
    	axis = "x";
    };
	/*var brow = $.browser;
	if(brow.is!="msie"){*/
	 $(".datagrid-body-ajax").mCustomScrollbar({
		    axis:axis,
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:80,
			callbacks:{
			whileScrolling:function(){ 
				var formId  = $(this).attr("id").replace("tableDiv","");
				if($("#leftTableDiv"+formId).length>0){
					$("#leftTableDiv"+formId)[0].scrollTop=this.mcs.top;
					$("#leftTableDiv"+formId)[0].scrollLeft=this.mcs.left;
				}
				if(this.mcs.left||this.mcs.left==0){
					$("#datagrid-header-inner"+formId).scrollLeft((-this.mcs.left));
				}
			},
			onInit:function(){
				$(this).css("overflow-y","hidden");
			}
		  }
	  });
	 
	//}
}

function setPopScroll(elem,head,left){	
	$(elem).mCustomScrollbar({
	    axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
		autoHideScrollbar:true,
		callbacks:{
			whileScrolling:function(){
				_closeChosen();//关闭被展开的下拉框
				if(head){
					if(this.mcs.left){		
						$(head)[0].scrollLeft=(-this.mcs.left);
					}
				}else{
					return;
				}
				if(left){
					if(this.mcs.top){		
						$(left)[0].scrollTop=(-this.mcs.top);
					}
				}
				else{
					return;
				}
			}
		}
	  });
}

// 异步表格滚动条监控
function ajaxTableScroll(thisObj,formId){
	var datagridBodyscrollTop=$(thisObj)[0].scrollTop;
	var datagridBodyscrollLeft=$(thisObj)[0].scrollLeft;
	
	if($("#leftTableDiv"+formId).length>0){
		$("#leftTableDiv"+formId)[0].scrollTop=datagridBodyscrollTop;
		$("#leftTableDiv"+formId)[0].scrollLeft=datagridBodyscrollLeft;
	}
	var inner=document.getElementById("datagrid-header-inner" +formId);
	inner.scrollLeft=datagridBodyscrollLeft;
	if(!window.ActiveXObject){
		ajustP($(inner),$(thisObj));
	}
	
}
function ajustP($inner,$datagridBody){
	var $innerP=$inner.parent();
	var bodyWidth=$datagridBody.outerWidth();
	var tableWidth=$datagridBody.children('table').outerWidth();
	var datagridBodyscrollLeft=$datagridBody.scrollLeft();
	return;
	if(hasScrollBar($datagridBody)){
		var lastTd=$datagridBody.find('tr:first-child').children('td:last');
		var adjust=lastTd.outerWidth()==0;
		adjust=adjust&&Math.abs((datagridBodyscrollLeft+bodyWidth-barWidth)-tableWidth)<=barWidth;
		
		if(adjust){
			$innerP.css('marginLeft',(tableWidth-bodyWidth-datagridBodyscrollLeft));
		}else{
			$innerP.css('marginLeft',0);
		}
	}else{
		$innerP.css('marginLeft',0);
	}
}

var search;
var flag;
var isLeft;

function initTableHight(){
	var top = 56;//查询条件到顶部的高度
	var serchHeight = $('.search-box').height();
	
	//var serchHeight = parseInt((search - 1)/3 + 1) * 39;//查询条件的高度
	var pagingHeight = 30; //分页的高度	
	var bottom = 10;//分页到底部的距离
	var panelHeight = $(window).height() - top - serchHeight - bottom;//内容区域的高度
	var tableCount = $("#tableCount").val();//表单数量 
	
	
	//判断是否弹窗
    if($("#isOpener") &&  $("#isOpener").val()=="1"){
    	//是弹窗
      	 $('.panel').height($(window).height() - top - 39 - bottom - pagingHeight);   // 
       	 $("#tableContainer"+flag).height($(window).height()- 70 - parseInt((search - 1)/3 + 1) * 39);
       	   	 
    }else{
   	 	 $('.panel').height((panelHeight - 10 * (tableCount - 1))/tableCount - pagingHeight);   
   	 $(".tableContainer"+flag).height($(parent.window).height() - 65 - 100 - parseInt((search - 1)/3 + 1) * 39);
    }
	 
    //写在CSS中
	 //$('.panel').height($(parent.window).height() - 65 - 100 - parseInt((search - 1)/3 + 1) * 39);   
	 //$(".dlist .datagrid-view"+flag).css('height','100%').css('box-sizing','border-box');
	//$(".dlist .datagrid-body"+flag).css('height',$(".datagrid-view"+flag).height() - 32 + 'px');
	 // $("#left-datagrid-view"+flag).css('height','100%').css('box-sizing','border-box');
	// $("#left-datagrid-body"+flag).css('height', $("#left-datagrid-view"+flag).height() - 32 + 'px');
	 

	 $(".datagrid-view"+flag).css('width','100%');
	 

	 $(".dlist .datagrid-header").not(".left-datagrid-header-ajax").width($(window).width() - 2);
     $(".dlist .datagrid-body").not(".left-datagrid-body-ajax").width($(window).width() - 2);

     
     
     $(".query-list").width($(window).width() - 2);
    
 }
  // 异步表格高度设置 
function initAjaxTableHight(){
	var top = 56;//查询条件到顶部的高度
	var serchHeight = $('.search-box').height();
	//var serchHeight = parseInt((search - 1)/3 + 1) * 39;//查询条件的高度
	var pagingHeight = 30; //分页的高度	
	var bottom = 10;//分页到底部的距离
	var panelHeight = $(window).height() - top - serchHeight - bottom;//内容区域的高度
	var tableCount = $("#tableCount").val();//表单数量 
	 
	if($("#isOpener") &&  $("#isOpener").val()=="1"){//弹窗 
      	$('.panel-ajax').height($(window).height() - top - 39 - bottom - pagingHeight);   // 
       	$(".tableContainer-ajax").height(($(window).height()- 70 - parseInt((search - 1)/3 + 1) * 39)/tableCount-30);
      
	}else{
	 	$('.panel-ajax').height((panelHeight - 10 * (tableCount - 1))/tableCount - pagingHeight);   
	 	$(".tableContainer-ajax").height(($(parent.window).height() - 65 - 100 - parseInt((search - 1)/3 + 1) * 39)/tableCount-30);
	}
	
	//写在css中
	//$(".datagrid-view-ajax").css('height','100%').css('box-sizing','border-box');
	//$(".datagrid-body-ajax").css('height', $(".datagrid-view-ajax").height() - 40 + 'px');
	//$(".left-datagrid-view-ajax").css('height','100%').css('box-sizing','border-box');
	//$(".left-datagrid-body-ajax").css('height', $(".left-datagrid-view-ajax").height() - 40 + 'px');
  }
	 

$(function(){

	
	 search = $('#searchParaNull').attr('value'); 
	 flag = $("#datagrid-view-kz").length > 0 ?"-kz":"";
	 

	 var offsetWidth=0,offsetWidthKz=0,resizeCount=0,screenHeight = $(window).height;
	 
	 var isLeft =$("#tableContainer"+flag).length > 0 ?"left-":"";
	
	
	
	if($("#datagrid-header-inner").length > 0){
		offsetWidth =  $("#datagrid-view"+flag).css("width");
//		$("#datagrid-htable"+flag).width(offsetWidth);
//		$("#datagrid-btable"+flag).width(offsetWidth);
		try {
			$(window.parent.document).find("#"+window.frameElement.id).height(screenHeight);
		}
		catch(err) {
		}
	}
	
	function isBorder(){
		var is_border = $(".datagrid-btable tbody tr").children().eq(1).find("._selectdata").attr("is_border");
		if(is_border=="2"){
			$(".datagrid-header td,.datagrid-body td").css("border","none");
		}
	}
	
	$(".datagrid-btable tbody tr").mouseenter(function(){
		var trObj = getObj($(this));
	    $(trObj).css("background-color","#c3e2fb");
	});
	
	$(".datagrid-btable tbody tr").mouseleave(function(){
		var trObj = getObj($(this));
	    $(trObj).css("background-color","");
	});
	
	function getObj(thisObj){
	    var abbr = thisObj.attr("abbr");
	    return $("tr[abbr='"+abbr+"']");
	}

	
	initAjaxTableHight();
	initTableHight();	
	
	$(".datagrid-btable").on('mouseover','td',function(){
		var title = $(this).find("span").attr("title");
		if(title){
			$(this).attr('title',delTrim(title));
		}
	});
	

	// 浏览器窗口改变
    $(window).resize(function(){
		 initAjaxTableHight();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		 initTableHight();
	});
	

	// 主表单双击查看详情
	$(".dblClick .isParents").on("dblclick","tr",function(){
		var _thisObj = $(this);
		var id = _thisObj.attr("id");
		if(id=="undefined"){
			return;
		}
		if(typeof(dblClickShowDetail)=="function"){
			dblClickShowDetail(_thisObj);
		}
	});
	
	$('body').on('mouseover','.optn button',function(){
		if($(this).width() >= 85){
			$(this).attr('title',$(this).text())
		}
	})

});



/**
 * 表格编号自适应宽度
 * @param formId
 */
var prewNumColWidth = 0;
function setNumColWidth(formId){
	var $tbody = $("#tbody_"+formId);
	if($("#left-tbody_"+formId).length > 0){
		$tbody = $("#left-tbody_"+formId);
	}
	var numLength = $tbody.children("tr:last-child").find("td").eq(0).find("._noedit").text().length;
	var numColWidth = (numLength-2)*6+30;
    $("#datagrid-htable"+formId).find("td").eq(0).css('width',numColWidth);
	_bodyToHeader($tbody.parents('.datagrid-body'),numColWidth,formId,$tbody,(numColWidth-prewNumColWidth));
	prewNumColWidth = numColWidth;
	hideAuthDataCol();
	
}
//把body匹配成成头部的列宽
function _bodyToHeader(tableBody,numColWidth,formId,$tbody,dx){
	var tableHeader=tableBody.prev();
	var matchReg =/.*width\s*:\s*(\d*\.?\d*)px/;
	var widthDisplay =/.*display\s*:\s*(\d+)e/;
	var screenWidth = $(window).width() - 2;
	var firstTr = $('#datagrid-btable-ajax'+formId+'>tbody>tr:first-child');
/*	var headTds=tableHeader.find('tr:first-child').children('td:visible');
	var bodyTds=tableBody.find('tr:first-child').children('td:visible');*/
/*	headTds.each(function(i,v){
		var width=this.style.width;
		if($(this).is(':hidden')){
			return true;
		}
		if(width.indexOf('px')==-1){
			$(bodyTds[i]).css('width','auto');
			return true;
		}
		$(bodyTds[i]).width($(this).outerWidth());
	});
	*/
	$('#datagrid-htable'+formId+' .datagrid-header-row>td').each(function (i,v) {
		var styleTd = $(this).attr("style");
		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&(styleTd.match(widthDisplay)[1])=="non"){
    		return true;
    	}
		if(styleTd && styleTd.indexOf("width")>-1){
            var bodyTd = firstTr.children('td:eq('+i+')');
            bodyTd.width(parseFloat(styleTd.match(matchReg)[1]));
    	}
	});
	updateMCustomScrollbar(formId,dx);
}


function delTrim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function updateMCustomScrollbar(formId,dx){
    var mc=$("#tableDiv"+formId).find('.mCSB_container');
    if(dx<0){
  	  mc.width(mc.children().outerWidth()+(dx));
    }else{
  	  mc.width(mc.children().outerWidth());
    }
    mc.mCustomScrollbar('update');
}

/**
 * 美化滚动条
 * @param id 需要美化滚动条的div的id
 */
function _newScroll(id){  
	var brow = $.browser;
	if(brow.is!="msie"){ //非IE浏览器下美化
		$("#" + id).mCustomScrollbar({
		    axis:"yx",
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:80
	  	});
	}
}

/****
 * 
 *关闭展开的下拉框 
 * by:hxh
 * date:2018-04-24
 ***/

function _closeChosen(){
    $(".chosen-container").each(function(i,item){
  	  if($(item).attr("id") != null && $(item).attr("id") != "" && $(item).attr("id") != undefined){
  		  var item_id = $(item).attr("id").replace("_chosen","");
  			  $("#"+item_id).trigger('chosen:close.chosen');
  	  }
    });
    
}

//获取滚动条宽度
var barWidth;
$(function(){
	barWidth=(function () {  
	     
	    var w1, w2,  
	      div = $("<div style='display:block;position:absolute;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),  
	      innerDiv = div.children()[0];  

	    $("body").append(div);  
	    w1 = innerDiv.offsetWidth;  
	    div.css("overflow", "scroll");  

	    w2 = innerDiv.offsetWidth;  

	    if (w1 === w2) {  
	      w2 = div[0].clientWidth;  
	    }  

	    div.remove();  

	    return w1 - w2;  
	  })();
	//绑定查询列表的滚动条实践
	$('.datagrid-body').css('overflow','auto').scroll(function(){
		var datagridBodyscrollLeft=$(this).scrollLeft();
		
		var inner=$(this).prev().children()[0];
		inner.scrollLeft=datagridBodyscrollLeft;
		if(!window.ActiveXObject){
			ajustP($(inner),$(this));
		}
	})
})
//是否出现垂直滚动条
function hasScrollBar(bodyDiv){
	return bodyDiv.children('table').length>0&&bodyDiv.find('table').outerHeight()>bodyDiv.outerHeight();
}
function addEmptyDiv(bodyDiv){
	if(hasScrollBar(bodyDiv)){
		if(bodyDiv.prev().find('tr:first-child>.emptyDiv').length==0){
			var h=bodyDiv.prev().find('tr:first-child').outerHeight();
			bodyDiv.prev().find('tr:first-child').append('<td class="emptyDiv" style="width:'+barWidth+'px;height:'+h+'px;"><div style="height:'+h+'px;"></div></td>')
		}
		
	}else{
		bodyDiv.prev().find('tr:first-child>.emptyDiv').remove();
	}
}


/**
 * 自定义表格拖拽后分页以及刷新，回设表格宽度
 */
var prewNumColWidthDefTable = 0;
function defTableWidthRewrite(formId){
	var matchReg =/.*width\s*:\s*(\d*\.?\d*)px/;
	var widthDisplay =/.*display\s*:\s*(\d+)e/;
	var screenWidth = $(window).width() - 2;
	var numColWidth = 0;
	var firstTr = $('#datagrid-btable-ajax'+formId+'>tbody>tr:first-child');
	var numLength =  $('#datagrid-btable-ajax'+formId+'>tbody').children("tr:last-child").find("td").eq(0).find("._noedit").text().length;
	if(numLength == 0){
		numLength = $('#datagrid-btable-ajax'+formId+'>tbody').children("tr:last-child").find("td").eq(0).text().length;
	};
	var obj = $("#datagrid-htable"+formId).find("td").eq(1);
	if(obj.find("input[type='checkbox']").length==0||obj.find("input[type='radio']").length==0){//没有复选框单选框和序号
		numColWidth = (numLength-2)*6+35;
		//numColWidth = $("#datagrid-htable"+formId).find("td").eq(0).outerWidth();  
	}else{
		//numColWidth = (numLength-2)*6+35;
		numColWidth = $("#datagrid-htable"+formId).find("td").eq(0).width();
	}
	
	$("#datagrid-htable"+formId).find("td").eq(0).css('width',numColWidth);
	$('#datagrid-htable'+formId+' .datagrid-header-row>td').each(function (i,v) {
		var styleTd = $(this).attr("style");
		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&(styleTd.match(widthDisplay)[1])=="non"){
    		return true;
    	}
		if(styleTd && styleTd.indexOf("width")>-1){
            var bodyTd = firstTr.children('td:eq('+i+')');
            bodyTd.width(parseFloat(styleTd.match(matchReg)[1]));
    	}
	});
	$('#datagrid-btable-ajax'+formId).addClass("isDefTable");
	updateMCustomScrollbar(formId,(numColWidth-prewNumColWidthDefTable))
	prewNumColWidthDefTable = numColWidth;
}

/**
 * 表格未定义宽度的，给一个初始宽度。
 */
function setPlatformTableWidth(formId,widthDisplay,header,body){
	var arrNoWidth = [];
	header.each(function (i,v) {
		var styleTd = $(this).attr("style");
		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&styleTd.match(widthDisplay)=="non"){
    		return true;
    	}
		if(typeof(styleTd) == "undefined" || styleTd.indexOf("width")<0){
			arrNoWidth.push(i);
			$(this).width(350);
		}
	});
	body.each(function (i,v) {
		if(i==arrNoWidth[i]){
			$(this).width(350);
		}
	});
} 

/**
 * 拖拉表头调整列宽
 */
function _addDragTableEvent(formId) {
	var matchReg =/.*width\s*:\s*(\d*\.?\d*)px/;
	var widthDisplay =/.*display\s*:\s*(\d+)e/;
	var screenWidth = $(window).width() - 2;
	var allTdWidth = 60;
	var colNum = 0;
	var tdNoWidthNum = 0;
	var tdNoWidth = false;
	var originalTd = true;
	var header=$('#datagrid-htable'+formId+' .datagrid-header-row>td');
	var body=$('#datagrid-btable-ajax'+formId+'>tbody>tr:first-child');
	setPlatformTableWidth(formId,widthDisplay,header,body);
	
	header.each(function (i,v) {
    	var styleTd = $(this).attr("style");
    	if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&(styleTd.match(widthDisplay)[1])=="non"){
    		return true;
    	}
    	if(i>1){
    		tdNoWidthNum++;
    	}
    	if(styleTd && styleTd.indexOf("width")>-1 && i>1){
    		allTdWidth+=parseFloat(styleTd.match(matchReg)[1]);
    		colNum++;
    	}
    	if(typeof(styleTd) == "undefined" || styleTd.indexOf("width")<0){
    		tdNoWidth = true;
    	}
        var icon = $('<i class="datagrid-header-drag-icon"></i>');
        $(this).append(icon);
        if(!window.ActiveXObject){
        	$(this).css('overflow','hidden');
        }
    });
   
    if(screenWidth>allTdWidth && allTdWidth>60){
    	var remainder = (screenWidth - allTdWidth)%colNum;
    	var cloAddWidth = (screenWidth - allTdWidth+remainder)/colNum;
    	header.each(function (i,v) {
    		var styleTd = $(this).attr("style");
        	if(styleTd &&styleTd.indexOf("width")>-1 && i>1){
        		$(this).width(parseFloat(styleTd.match(matchReg)[1])+cloAddWidth);
        	}
    	});
    	body.each(function (i,v) {
    		 var firstTr = $(this).find('tr:first-child');
    		var styleTd = $(this).attr("style");
        	if(styleTd && styleTd.indexOf("width")>-1 && i>1){
        		$(this).width(parseFloat(styleTd.match(matchReg)[1])+cloAddWidth);
        	}
    	});
    }
    if(tdNoWidth){// 刚生成的表格没有宽度，设置宽度，不然拖拽最后一列会消失
    	header.each(function (i,v) {
    		var styleTd = $(this).attr("style");
    		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&(styleTd.match(widthDisplay)[1])=="non"){
        		return true;
        	}
    		if(i>1){
    			$(this).width(screenWidth/tdNoWidthNum);
    		}
    	});
    	body.each(function (i,v) {
    		var styleTd = $(this).attr("style");
    		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&(styleTd.match(widthDisplay)[1])=="non"){
        		return true;
        	}
    		if(i>1){
    			$(this).width(screenWidth/tdNoWidthNum);
    		}
    	});
    }
    
    $(document).on('mousedown', '#datagrid-htable'+formId+' .datagrid-header-row>td>i.datagrid-header-drag-icon', function (e) {
    	var type = "",text="";
    	if($('#datagrid-btable-ajax'+formId).hasClass("isDefTable")){
    		text = $(this).parent().text();
    		type = $(this).prev().prop("type");
    	}else{
    		text = $(this).prev("span").text();
    		type = $(this).prev("span").children().prop("type");
    	}
    	if(type=="checkbox"||text==""){
    		return;
    	}
    	var that = $(this).addClass('datagrid-header-drag-iconShow');
        var cursorX = parseInt(that.css('right'), 10);
        var td = that.parent().css('overflow', 'visible');
        var startW = td.outerWidth();
        var starX = e.pageX;
        var tableBody=that.parents('.datagrid-header').next();
        var lastTd = that.parent().parent().children(':last').is(':visible')?that.parent().parent().children(':last').prev():that.parent().parent().children(':last').prev().prev();
        var firstTr = tableBody.find('tr:first-child');
        var bodyTd = firstTr.children('td:eq(' + td.index() + ')');
        var bodyLastTd = firstTr.children('td:eq('+lastTd.index()+')');
        that.children().height(that.parents('.datagrid-header').parent().outerHeight());
        td.css({
            cursor: 'col-resize',
            overflow: 'visible'
        });
        $('body').css('cursor', 'col-resize');
        function mousemove(e) {
            window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty();
            var disX = e.pageX - starX;
            that.css('right', cursorX - disX);

        }

        function mouseup(e) {
            var disX = e.pageX - starX;
            var width = startW + disX;
            td.css({
                cursor: 'default'
            });
            if(!window.ActiveXObject){
            	td.css('overflow','hidden');
            }
            that.css('right', 0).removeClass('datagrid-header-drag-iconShow');
            $('body').css('cursor', 'auto');
            $(document).off('mousemove', mousemove).off('mouseup', mouseup);
            if(disX==0)return;
            width = Math.max(width, 20);
            td.width(width);
            bodyTd.width(width);
            if(!window.ActiveXObject){
            	//ajustP(that.parents('.datagrid-header-inner'),tableBody);
            }
            /*if (lastTd.index() == td.index()) {
                return;
            }*/
            var lastWidth=Math.max(lastTd.width() - (width - startW),20);
            if (lastTd.index() != td.index()) {
            	//lastTd.width(lastWidth);
            	
            }
            
           // _bodyToHeader(tableBody);
           // addEmptyDiv(tableBody);
            if(lastTd.outerWidth==0){
            	//lastTd.css('width','auto');
            	//bodyLastTd.css('width','auto');
            }
//            $(window).resize();
            
            var mc=tableBody.find('.mCSB_container');
            if(disX<0){
            	 mc.width(mc.children().outerWidth()+(disX));
            }else{
            	 mc.width(mc.children().outerWidth());
            }
            tableBody.mCustomScrollbar('update');
        }
        $(document).on('mousemove', mousemove).on('mouseup', mouseup);

    });

}
$(function(){
	$("input[name='formId']").each(function (i,v) {
		_addDragTableEvent($(this).val());
	});
})
