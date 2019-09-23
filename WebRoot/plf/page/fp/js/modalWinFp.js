var gPopFrameMap = [];
var popupFrameId = "popupFrameFpId";
var popcount = 1;
var parentPop = "parentPopId";
var _flag_ = false;
var _formId_ = null;
var _iframeId_ = null;
var _flagForPrint = false;//条码打印标识


function winControl(blnVal) {
	// //cjd 页面数据正在加装中 禁用esc、空格、回车等 在iframe加装完，iframe中正常使用 begin 2017-12-15
	if (blnVal)
		$(document).unbind("keydown");
	else
		$(document).bind("keydown", function(e) {
			return blnVal;
		})
		// //cjd 页面数据正在加装中 禁用esc、空格、回车等 在iframe加装完，iframe中正常使用 end2017-12-15

}

var controlWinMark = 10;
var popupFrameIdWin = null;
function checkPopupFrameIdWin() {
	if (popupFrameIdWin != null)
		if (!$(popupFrameIdWin).is(":hidden")) {
			popupFrameIdWin = null;
			controlWinMark = 10;
			winControl(true);
		} else {
			controlWinMark = 20;
			winControl(false);
		}
	else {
		controlWinMark = 10;
		winControl(true);
	}

	setTimeout(checkPopupFrameIdWin, 10)
}
$(function() {

	checkPopupFrameIdWin();

});
/**
 * *******************************弹出iframe
 * BEGIN*************************************************
 */
/**
 * 弹出iframe
 * 
 * @argument width - int in pixels
 * @argument height - int in pixels
 * @argument url - url to display
 * @argument returnFunc - function to call when returning true from the window.
 * @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
 * @argument frameId 弹窗ID（建议自己定义，不要用默认的，否则容易冲突）
 * @argument showPosition 显示位置：为空或是0，则在当前页显示，否则在标签页显示
 */
function showPopWinFp(url, width, height, returnFunc, title, frameId,
		showPosition,flag) {
	winControl(false);
	if (controlWinMark == 20)
		return;
	controlWinMark = 20;
	
	//解决回车和空格再次触发按钮点击事件问题
	document.onkeydown = function () {
		if(document.activeElement){
			var focusDom = document.activeElement;
			if(focusDom.nodeName.toLowerCase() == 'button'){
				$(focusDom).blur();
			}
		}
    	};
	
	if (window.frameElement != undefined && window.frameElement != null) {
		parentPop = window.frameElement.id;
	}

	if (null == title || "" == title) {
		title = document.title;
	}
	if (null != frameId && "" != frameId) {
		popupFrameId = frameId;
	}
	// 如果该参数为空或是0，则在当前页显示，否则在标签页显示
	if (showPosition == null || showPosition == "" || showPosition == "0") {
        var ExternalReferences = false;
		var tempPopupFrameId = popupFrameId + "pop";
		var shadowPopupFrameId = popupFrameId + "shadow";
		var temp = top.document;
		if (height > $(temp).height()) {
			height = $(temp).height();
		}
		if (width > $(temp).width()) {
			width = $(temp).width();
		}
		var iTop;
		var zIndexNum;
		try {
			 iTop = (top.getHeight() - height) / 2 - 20;
		} catch (e) {
			if(frameId && !flag){
				iTop = ($(window).height() ) / 2 +20;
				ExternalReferences = true;
			}else{
				iTop = ($(window).height()- height ) / 2 - 20;
			}
			$(".search-box").css("z-index","998");
		}
		//var iTop = (top.getHeight() - height) / 2 - 20;// top.getHeight()在mainFrame中，获取最外层高度
		if(iTop<=0){//判断出现负数的情况
			iTop=5;
		}
		var iLeft = ($(temp).width() - width) / 2;
		// alert("screenWidth"+window.screen.availWidth+"screenHeight"+window.screen.availHeight+"docWidth:"+$(temp).width()+"docHeight:"+$(temp).height()+"iTop"+iTop
		// +"iLeft:"+iLeft+"height:"+height+"width:"+width);
		var divStr = "<div class=\"dialog dialog-s1\" id=\"" + tempPopupFrameId
				+ "\" style=\"z-index:" + (top.zcount + 1)
				+ ";display:block;margin-left:0px;position:absolute;left:"
				+ iLeft + "px;top:" + iTop + "px;width:" + width + "px;height:"
				+ height + "px;\" >" + "   <div class=\"dialog-hd\">"
				+ "		            <h3 class=\"tit\">" + title
				+ "</h3><input type=\"hidden\" id=\"parentPop\" value=\""
				+ parentPop + "\" \\>" + "		        </div>";
		
		if (_flag_) {
			divStr += "	<a class=\"dialog-help\" href=\"javascript:void(0);\"></a><a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopWinFpForSubmit('"
					+ tempPopupFrameId
					+ "','"
					+ _formId_
					+ "','"
					+ _iframeId_
					+ "');\"></a>"
			
		}if(_flagForPrint){
			divStr+="		        <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopWinFpForPrint('"+tempPopupFrameId+"','"+_formId_+"','"+_iframeId_+"');\"></a>"
		}else if(!_flag_&&!_flagForPrint){
			divStr += "	<a class=\"dialog-help\" href=\"javascript:void(0);\"></a><a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopWinFp('"
					+ tempPopupFrameId + "');\"></a>"
		}
		_flag_ = false;
		_flagForPrint=false;
		divStr += "		        <div class=\"dialog-bd\" style=\"width:100%;height:"
				+ height
				+ "px;\">"
				+ "					<iframe src=\""//这里先放空，之后用JS方法设置值，否则URL中某些特殊字符会被转义
				+""
				+ "\" style=\"width:"
				+ width
				+ "px;height:"
				+ height
				+ "px;background-color:transparent;border-bottom-left-radius: 8px;border-bottom-right-radius: 8px;\" scrolling=\"auto\" frameborder=\"0\" allowtransparency=\"true\"  id=\""
				+ popupFrameId
				+ "\" name=\""
				+ parentPop
				+ "\"></iframe>"
				+ "		        </div>" + "		    </div>";// src=\"plf/page/fp/loading.jsp\"
		// +"<div class=\"dialog-mask\" id=\"maskId0\"
		// style=\"display:block;\"></div>";

		// if($(".dialog-mask").length == 0){
		divStr += "<div class=\"dialog-mask\" id=\"" + shadowPopupFrameId
				+ "\" style=\"z-index:" + top.zcount + "\"></div>";
		top.zcount++;
		// }
		var tmpDiv = temp.createElement("div");
		tmpDiv.innerHTML = divStr;
		var body = temp.getElementsByTagName("body")[0];
		body.appendChild(tmpDiv);
		gPopFrameMap[popupFrameId] = temp.getElementById(popupFrameId);
		if(ExternalReferences){
			 top.$("#"+frameId+"pop").css("z-index","1203");
			 top.$("#"+frameId+"shadow").css("z-index","1202");
	    }
		// if(gPopFrameMap[popupFrameId].src!=url)
		gPopFrameMap[popupFrameId].src = url;

		popupFrameIdWin = $(tempPopupFrameId)

		$(popupFrameId).keydown(function(e) {
			return false;
		});
		
		$(gPopFrameMap[popupFrameId]).load(function() {
			// cjd frameId 没有值说明根页面 有值说明子页面有回调 2017-12-18 begin
			// if(frameId!=null)

			// cjd frameId 没有值说明根页面 有值说明子页面有回调 2017-12-18 emd
		});

		top.$("#" + shadowPopupFrameId).show();
		top.$("#" + tempPopupFrameId).draggable({
			containment : "body",
			iframeFix: true,
	        handle: '.dialog-hd',
	        cursor: "move"
		});
		// $(".dialog").draggable();
		// $("#popWinFpId0").resizable();未引jquery-ui.css无法生效

		// $("#popWinFpId0").click(function(){
		// $(".dialog-mask").hide();
		// });
		// alert(popupFrameId+":"+popcount);
		popcount++;
		
	} else {
		top.addTab(url, title, popupFrameId);
	}
}
function showPopWinFpForSubmit(url, width, height, returnFunc, title, frameId,
		showPosition, submitForm, iframeId) {
	_flag_ = true;
	_formId_ = submitForm;
	_iframeId_ = iframeId;
	showPopWinFp(url, width, height, returnFunc, title, frameId, showPosition)
}
function closePopWinFp(tempPopupFrameId) {
	$("#" + tempPopupFrameId).parent().remove();
	// $("#"+shadowPopupFrameId).hide();
}
function closePopWinFpForSubmit(tempPopupFrameId, _formId_, _iframeId_) {
	$("#" + tempPopupFrameId).parent().remove();
	var parentFrame = top.document.getElementById(_iframeId_);
	$("#" + _formId_, parentFrame.contentWindow.document).submit();

}
// 解决IE底下关闭窗口后，页面输入框无法获取焦点的BUG --BY:HXH
function closeTopPopWinFp(tempPopupFrameId) {
	var topIframe = top.$("#" + tempPopupFrameId).find("iframe");
	if (topIframe) {
		topIframe.attr("src", "");
		// topIframe.remove();
	}
	top.$("#" + tempPopupFrameId).parent().remove();
	// $("#"+shadowPopupFrameId).hide();
}

/**
 * ************************************弹出iframe
 * END****************************************************
 */

/**
 * ************************************弹出最外层DIV
 * BEGIN****************************************************
 */
/**
 * 弹出DIV，最外层
 * 
 * @argument width - int in pixels
 * @argument height - int in pixels
 * @argument returnFunc - function to call when returning true from the window.
 * @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
 * @argument divId 弹出层ID
 * @argument contentHtml 内容
 */
var popupDivId = "popupDivFpId";
var parentPopDiv = "parentPopDivId";
function showPopDivFp(width, height, returnFunc, title, divId, contentHtml) {

	if (null == title || "" == title) {
		title = document.title;
	}
	if (null != divId && "" != divId) {
		popupDivId = divId;
	}
	var tempPopupDivId = popupDivId + "pop";
	var shadowPopupDivId = popupDivId + "shadow";
	var temp = top.document;
	if (height > $(temp).height()) {
		height = $(temp).height();
	}
	if (width > $(temp).width()) {
		width = $(temp).width();
	}
	var iTop = ($(document).height() - height) / 2;
	var iLeft = ($(temp).width() - width) / 2;
	// alert("screenWidth"+window.screen.availWidth+"screenHeight"+window.screen.availHeight+"docWidth:"+$(temp).width()+"docHeight:"+$(temp).height()+"iTop"+iTop
	// +"iLeft:"+iLeft+"height:"+height+"width:"+width);
	var divStr = "<div class=\"dialog dialog-s1\" id=\""
			+ tempPopupDivId
			+ "\" style=\"z-index:"
			+ (top.zcount + 1)
			+ ";display:block;margin-left:0px;left:"
			+ iLeft
			+ "px;top:"
			+ iTop
			+ "px;width:"
			+ width
			+ "px;height:"
			+ height
			+ "px;\" >"
			+ "   <div class=\"dialog-hd\">"
			+ "		            <h3 class=\"tit\">"
			+ title
			+ "</h3><input type=\"hidden\" id=\"parentPop\" value=\""
			+ parentPopDiv
			+ "\" \>"
			+ "		        </div>"
			+ "		        <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopDivFp('"
			+ tempPopupDivId + "');\"></a>"
			+ "		        <div class=\"dialog-bd\" style=\"width:100%;height:"
			+ height + "px;\">" + contentHtml + "		        </div>"
			+ "		    </div>";
	// +"<div class=\"dialog-mask\" id=\"maskId0\"
	// style=\"display:block;\"></div>";
	// if($(".dialog-mask").length == 0){
	divStr += "<div class=\"dialog-mask\" id=\"" + shadowPopupDivId
			+ "\" style=\"z-index:" + top.zcount + "\"></div>";
	top.zcount++;
	// }
	var tmpDiv = temp.createElement("div");
	tmpDiv.innerHTML = divStr;

	var body = temp.getElementsByTagName("body")[0];
	body.appendChild(tmpDiv);
	top.$("#" + shadowPopupDivId).show();
	top.$("#" + tempPopupDivId).draggable();

}
// 提交数据
function submitDatas(iframeId, methodName, args) {
	$(window.parent.document).contents().find("#" + iframeId)[0].contentWindow.window[methodName]
			(args);
}

function closePopDivFp(tempPopupDivId) {
	$("#" + tempPopupDivId).parent().remove();
	top.$("#" + tempPopupDivId).parent().remove();
	// $("#"+shadowPopupDivId).remove();
}
/**
 * *************************************弹出最外层DIV
 * END**************************************************
 */

/**
 * ************************************弹出普通DIV
 * BEGIN****************************************************
 */
/**
 * 弹出DIV，非最外层
 * 
 * @argument width - int in pixels
 * @argument height - int in pixels
 * @argument returnFunc - function to call when returning true from the window.
 * @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
 * @argument divId 弹出层ID
 * @argument contentHtml 内容
 */
var divFpId = "divFpId";
function showDivFp(width, height, returnFunc, title, divId) {
	var copy_div=$("#" + divId).html();
	copy_div=copy_div.replace('printset_tab','printset_tab_new')//打印设置
	
	top.zcount=11000;
	if (null == title || "" == title) {
		title = document.title;
	}
	if (null != divId && "" != divId) {
		divFpId = divId;
	}
	var tempPopupDivId = divFpId + "pop";
	var shadowPopupDivId = divFpId + "shadow";
	if (height > $(window).height()) {
		height = $(window).height();
	}
	if (width > $(window).width()) {
		width = $(window).width();
	}
	var iTop = ($(window).height() - height) / 2;
	var iLeft = ($(window).width() - width) / 2;
	// alert("screenWidth"+window.screen.availWidth+"screenHeight"+window.screen.availHeight+"docWidth:"+$(temp).width()+"docHeight:"+$(temp).height()+"iTop"+iTop
	// +"iLeft:"+iLeft+"height:"+height+"width:"+width);
	var divStr = "<div class=\"dialog dialog-s1\" id=\""
			+ tempPopupDivId
			+ "\" style=\"z-index:"
			+ (top.zcount + 1)
			+ ";display:block;margin-left:0px;left:"
			+ iLeft
			+ "px;top:"
			+ iTop
			+ "px;width:"
			+ width
			+ "px;height:"
			+ height
			+ "px;\" >"
			+ "   <div class=\"dialog-hd\">"
			+ "		            <h3 class=\"tit\">"
			+ title
			+ "</h3>"
			+ "		        </div>"
			+ "		        <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closeDivFp('"
			+ tempPopupDivId + "');\"></a>"
			+ "		        <div class=\"dialog-bd\" id=\"showdivfpid\" style=\"width:100%;background-color:#fff;height:"
			+ height + "px;\">" + copy_div + "		        </div>"
			+ "		    </div>";
	// +"<div class=\"dialog-mask\" id=\"maskId0\"
	// style=\"display:block;\"></div>";
	// if($(".dialog-mask").length == 0){
	divStr += "<div class=\"dialog-mask\" id=\"" + shadowPopupDivId
			+ "\" style=\"z-index:" + (top.zcount-1) + "\"></div>";
	top.zcount++;
	// }

	var tmpDiv = document.createElement("div");
	tmpDiv.innerHTML = divStr;

	var body = document.getElementsByTagName("body")[0];
	body.appendChild(tmpDiv);

	// $("#"+divId).show();
	$("#" + shadowPopupDivId).show();
	$("#" + tempPopupDivId).draggable();

}

function closeDivFp(tempPopupDivId) {
	$("#" + tempPopupDivId).parent().remove();
}

/**
 * *************************************弹出普通DIV
 * END**************************************************
 */


//0418 CSJ 条码 
function showPopWinFpForPrint(url, width, height, returnFunc,title,frameId,showPosition){
	
	_flagForPrint=true;
	var tempIframeId=frameId;
	_iframeId_=tempIframeId;
	showPopWinFp(url, width, height, returnFunc,title,frameId,showPosition)
}

//0418 CSJ 条码 
var closePopWinFpForPrintFrameId;
function closePopWinFpForPrint(tempPopupFrameId,_formId_,_iframeId_){
	closePopWinFpForPrintFrameId=tempPopupFrameId;
	if(localStorage.printStatus==1||localStorage.printStatus==0||localStorage.printStatus==""){
		$("#"+tempPopupFrameId).parent().remove();
	}else{//
		utilsFp.confirmIcon(3,"","isCloseWin","", _GLO_LABEL_PRINT_TIP,1,"","","","1");
	}
}

//0418 CSJ 条码 
function isCloseWin(){
	$("#"+closePopWinFpForPrintFrameId).parent().remove();
}
