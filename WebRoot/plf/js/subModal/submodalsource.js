/**
 * DIV 弹出层
 *modify by Liudg 2011-09-26
 */

// Popup code
var gPopupMask = null;
var gPopupContainer = null;
var gPopFrame = null;
var gReturnFunc;


var gPopupMaskMap = [];
var gPopupContainerMap = [];
var gPopFrameMap = [];
var gReturnFuncMap = [];

var gPopupIsShown = false;
var gHideSelects = false;
var gLoading = "";
//var gLoading = "js/subModal/loading.jsp";
var gTitle = "";
var isInit=false;
var popupFrameId="popupFrameId";

var gTabIndexes = new Array();
// Pre-defined list of tags we want to disable/enable tabbing into
var gTabbableTags = new Array("A","BUTTON","TEXTAREA","INPUT","IFRAME");	

// If using Mozilla or Firefox, use Tab-key trap.
if (!document.all) {
	document.onkeypress = keyDownHandler;
}

/**
 * Override the loading page from loading.html to something else
 */
function setPopUpLoadingPage(loading) {
	gLoading = loading;
}

/**
 * Initializes popup code on load.	
 */
function initPopUp() {
	if(isInit){
		//现不作控制，因有可能需要多个弹出窗口
		//sdocument.getElementById("popupTitle_"+popupFrameId).innerHTML = "";
		//return false;
	}
	isInit = true;
	// Add the HTML to the body
	var title="";
	if(null != gTitle){
		title = gTitle;
	}
	var body = document.getElementsByTagName('body')[0];
	var popmask = document.createElement('div');
	popmask.id = 'popupMask_'+popupFrameId;
	popmask.className = "popupMask_";
	var popcont = document.createElement('div');
	popcont.id = 'popupContainer_'+popupFrameId;
	popcont.className = "popupContainer_";
	popcont.innerHTML = '' +
		'<div id="popupInner_'+popupFrameId+'" class="popupInner_">' +
			'<div id="popupTitleBar_'+popupFrameId+'" class="popupTitleBar_">' +
				'<div id="popupTitle_'+popupFrameId+'" class="popupTitle_" >'+title+'</div>' +
				'<div id="popupControls_"'+popupFrameId+' class="popupControls_" >' +
					'<a onclick="hidePopWin(true,\''+popupFrameId+'\');" title="关闭"><span>Close</span></a>' +
				'</div>' +
			'</div>' +
			'<iframe src="'+ gLoading +'" style="width:100%;height:100%;background-color:transparent;" scrolling="auto" frameborder="0" allowtransparency="true" id="'+popupFrameId+'" name="'+popupFrameId+'" width="100%" height="100%"></iframe>' +
		'</div>';
	body.appendChild(popmask);
	body.appendChild(popcont);
	
	gPopupMask = document.getElementById('popupMask_'+popupFrameId);
	gPopupMaskMap['popupMask_'+popupFrameId]=gPopupMask;
	gPopupContainer = document.getElementById('popupContainer_'+popupFrameId);
	gPopupContainerMap['popupContainer_'+popupFrameId]=gPopupContainer;
	gPopFrame = document.getElementById(popupFrameId);
	gPopFrameMap[popupFrameId]=gPopFrame;
	gPopFrame.className= "popupFrame_";
	
	// check to see if this is IE version 6 or lower. hide select boxes if so
	// maybe they'll fix this in version 7?
	var brsVersion = parseInt(window.navigator.appVersion.charAt(0), 10);
	if (brsVersion <= 6 && window.navigator.userAgent.indexOf("MSIE") > -1) {
		gHideSelects = true;
	}
	
	// Add onclick handlers to 'a' elements of class submodal or submodal-width-height
	var elms = document.getElementsByTagName('a');
	for (i = 0; i < elms.length; i++) {
		if (elms[i].className.indexOf("submodal") >= 0) { 
			elms[i].onclick = function(){
				// default width and height
				var width = 400;
				var height = 200;
				// Parse out optional width and height from className
				var startIndex = this.className.indexOf("submodal");
				var endIndex = this.className.indexOf(" ", startIndex);
				if (endIndex < 0) {
					endIndex = this.className.length;
				}
				var clazz = this.className.substring(startIndex, endIndex);
				params = clazz.split('-');
				if (params.length == 3) {
					width = parseInt(params[1]);
					height = parseInt(params[2]);
				}
				showPopWin(this.href,width,height,null); return false;
			}
		}
	}
}
//addEvent(window, "load", initPopUp);

 /**
	* @argument width - int in pixels
	* @argument height - int in pixels
	* @argument url - url to display
	* @argument returnFunc - function to call when returning true from the window.
	* @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
	*/

function showPopWin(url, width, height, returnFunc,title,frameId) {
	// {width:"", height:"", title:"", fullpage:true/false, maxmin: ture/false, resize: true/false}
	
	var obj = {
			title: title,
			width: width,
			height: height,
			success: returnFunc
	}
	mcShowPopWinFp(url, obj);
	return;
	
	
	if(!val.isInt(width) && width.indexOf("%")>0){
		width =   parseInt(getViewportWidth() *Number(width.replace('%', '')) / 100);
	}
	if(!val.isInt(height) && height.indexOf("%")>0){
		height =   parseInt(getViewportWidth() *Number(height.replace('%', '')) / 100);
	}
	if(height > getViewportHeight()){//如果弹出层设置的高度大于可显示高度时，设置为可显示高度
		height = getViewportHeight()-38;
	}
	if(width > getViewportWidth()){
		width = getViewportWidth()-4;
	}

	gTitle = title;
	if(null != frameId && "" != frameId){
		popupFrameId = frameId;
	}

	initPopUp();
	if(null == gTitle){
		window.setTimeout("setPopTitleAndRewriteTargets();", 30);
	}else{
		document.getElementById("popupTitle_"+popupFrameId).innerHTML = gTitle;
	}
	gPopupIsShown = true;
	disableTabIndexes();
	gPopupMaskMap['popupMask_'+popupFrameId].style.display = "block";
	gPopupContainerMap['popupContainer_'+popupFrameId].style.display = "block";
	
	centerPopWin(width, height);
	var titleBarHeight = parseInt(document.getElementById("popupTitleBar_"+popupFrameId).offsetHeight, 10);
	gPopupContainerMap['popupContainer_'+popupFrameId].style.width = width + "px";
	gPopupContainerMap['popupContainer_'+popupFrameId].style.height = (parseInt(height)+parseInt(titleBarHeight)) + "px";
	gPopFrameMap[popupFrameId].style.width = parseInt(document.getElementById("popupTitleBar_"+popupFrameId).offsetWidth, 10) + "px";
	gPopFrameMap[popupFrameId].style.height = (height) + "px";
	gPopFrameMap[popupFrameId].src = url;
	gReturnFunc = returnFunc;
	gReturnFuncMap["gReturnFunc_"+popupFrameId]=gReturnFunc;
	// for IE
	if (gHideSelects == true) {
		hideSelectBoxes();
	}

	//window.setTimeout("setPopTitleAndRewriteTargets();", 300);
}

//
var gi = 0;
function centerPopWin(width, height) {
	if (gPopupIsShown == true) {
		if (width == null || isNaN(width)) {
			width = gPopupContainerMap['popupContainer_'+popupFrameId].offsetWidth;
		}
		if (height == null) {
			height = gPopupContainerMap['popupContainer_'+popupFrameId].offsetHeight;
		}
		var fullHeight = getViewportHeight();
		var fullWidth = getViewportWidth();
		// scLeft and scTop changes by Thomas Risberg
		var scLeft,scTop;
		if (self.pageYOffset) {
			scLeft = self.pageXOffset;
			scTop = self.pageYOffset;
		} else if (document.documentElement && document.documentElement.scrollTop) {
			scLeft = document.documentElement.scrollLeft;
			scTop = document.documentElement.scrollTop;
		} else if (document.body) {
			scLeft = document.body.scrollLeft;
			scTop = document.body.scrollTop;
		} 
		gPopupMaskMap['popupMask_'+popupFrameId].style.height = fullHeight + "px";
		gPopupMaskMap['popupMask_'+popupFrameId].style.width = fullWidth + "px";
		gPopupMaskMap['popupMask_'+popupFrameId].style.top = scTop + "px";
		gPopupMaskMap['popupMask_'+popupFrameId].style.left = scLeft + "px";
		//window.status = gPopupMaskMap['popupMask_'+popupFrameId].style.top + " " + gPopupMaskMap['popupMask_'+popupFrameId].style.left + " " + gi++;
		var titleBarHeight = parseInt(document.getElementById("popupTitleBar_"+popupFrameId).offsetHeight, 10);
		var topMargin = scTop + ((fullHeight - (height+titleBarHeight)) / 2);
		if (topMargin < 0) { topMargin = 0; }
		gPopupContainerMap['popupContainer_'+popupFrameId].style.top = topMargin + "px";
		gPopupContainerMap['popupContainer_'+popupFrameId].style.left =  (scLeft + ((fullWidth - width) / 2)) + "px";
	}
}
addEvent(window, "resize", centerPopWin);
//addEvent(window, "scroll", centerPopWin);
window.onscroll = centerPopWin;

/**
 * @argument callReturnFunc - bool - determines if we call the return function specified
 * @argument returnVal - anything - return value 
 */
function hidePopWin(callReturnFunc,popupFrameId_) {
	//tangws
	var layerIndex = parent.layer.getFrameIndex(window.name);
	parent.layer.close(layerIndex);
		
	return;
	
	
	if(null == popupFrameId_ || "" ==popupFrameId_){popupFrameId_=popupFrameId;}
	if (callReturnFunc == true && gReturnFuncMap["gReturnFunc_"+popupFrameId_] != null) {
		/*************如果设置了返回函数，则应在回调函里控制窗口是否关闭(加上:return true;)**************/
		if( !gReturnFuncMap["gReturnFunc_"+popupFrameId_](window.frames[popupFrameId_].returnVal)){return false;}
	}
	gPopupIsShown = false;
	restoreTabIndexes();
	if (gPopupMaskMap['popupMask_'+popupFrameId_] == null) {
		return;
	}
	gPopupMaskMap['popupMask_'+popupFrameId_].style.display = "none";
	gPopupContainerMap['popupContainer_'+popupFrameId_].style.display = "none";
	gPopFrameMap[popupFrameId_].src = gLoading;
	// display all select boxes
	if (gHideSelects == true) {
		displaySelectBoxes();
	}
}

function closePopWin(){hidePopWin(false);}

/**
 * Sets the popup title based on the title of the html document it contains.
 * Also adds a base attribute so links and forms will jump out out of the iframe
 * unless a base or target is already explicitly set.
 * Uses a timeout to keep checking until the title is valid.
 */
function setPopTitleAndRewriteTargets() {
	//alert("k"+window.frames[popupFrameId].document.title+"k");
	//alert(document.getElementById(popupFrameId).contentWindow.document.title);
	var includeDoc = document.getElementById(popupFrameId).contentWindow.document;//取iframe内页面元素
	
	if (includeDoc.title == null || includeDoc.title=="") {
		window.setTimeout("setPopTitleAndRewriteTargets();", 300);
	} else {
		//alert(includeDoc.title);		
		document.getElementById("popupTitle_"+popupFrameId).innerHTML = includeDoc.title;		
		if (includeDoc.getElementsByTagName('base').length < 1) {
			var aList  = includeDoc.getElementsByTagName('a');
			for (var i = 0; i < aList.length; i++) {
				//if (aList.target == null || aList.target == "") aList[i].target='_parent';//为什么要在父级打开？
				if (aList.target == null || aList.target == "") aList[i].target='_self';
			}
			var fList  = includeDoc.getElementsByTagName('form');
			for (i = 0; i < fList.length; i++) {
				//if (fList[i].target == null || fList[i].target == "") fList[i].target='_parent';//为什么要在父级打开？
				if (fList[i].target == null || fList[i].target == "") fList[i].target='_self';
			}
		}
	}
}

// Tab key trap. iff popup is shown and key was [TAB], suppress it.
// @argument e - event - keyboard event that caused this function to be called.
function keyDownHandler(e) {
    if (gPopupIsShown && e.keyCode == 9)  return false;
}

// For IE.  Go through predefined tags and disable tabbing into them.
function disableTabIndexes() {
	if (document.all) {
		var i = 0;
		for (var j = 0; j < gTabbableTags.length; j++) {
			var tagElements = document.getElementsByTagName(gTabbableTags[j]);
			for (var k = 0 ; k < tagElements.length; k++) {
				gTabIndexes[i] = tagElements[k].tabIndex;
				tagElements[k].tabIndex="-1";
				i++;
			}
		}
	}
}

// For IE. Restore tab-indexes.
function restoreTabIndexes() {
	if (document.all) {
		var i = 0;
		for (var j = 0; j < gTabbableTags.length; j++) {
			var tagElements = document.getElementsByTagName(gTabbableTags[j]);
			for (var k = 0 ; k < tagElements.length; k++) {
				tagElements[k].tabIndex = gTabIndexes[i];
				tagElements[k].tabEnabled = true;
				i++;
			}
		}
	}
}

/**
* Hides all drop down form select boxes on the screen so they do not appear above the mask layer.
* IE has a problem with wanted select form tags to always be the topmost z-index or layer
* Thanks for the code Scott!
*/
function hideSelectBoxes() {
  var x = document.getElementsByTagName("SELECT");

  for (i=0;x && i < x.length; i++) {
    x[i].style.visibility = "hidden";
  }
}

/**
* Makes all drop down form select boxes on the screen visible so they do not reappear after the dialog is closed.
* IE has a problem with wanted select form tags to always be the topmost z-index or layer
*/
function displaySelectBoxes() {
  var x = document.getElementsByTagName("SELECT");

  for (i=0;x && i < x.length; i++){
    x[i].style.visibility = "visible";
  }
}

/**
 * X-browser event handler attachment and detachment
 * @argument obj - the object to attach event to
 * @argument evType - name of the event - DONT ADD "on", pass only "mouseover", etc
 * @argument fn - function to call
 */
function addEvent(obj, evType, fn){
 if (obj.addEventListener){
    obj.addEventListener(evType, fn, false);
    return true;
 } else if (obj.attachEvent){
    var r = obj.attachEvent("on"+evType, fn);
    return r;
 } else {
    return false;
 }
}

/**
 * Code below taken from - http://www.evolt.org/article/document_body_doctype_switching_and_more/17/30655/ *
 * Modified 4/22/04 to work with Opera/Moz (by webmaster at subimage dot com)
 * Gets the full width/height because it's different for most browsers.
 */
function getViewportHeight() {
	if (window.innerHeight!=window.undefined) return window.innerHeight;
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	if (document.body) return document.body.clientHeight; 
	return window.undefined; 
}

function getViewportWidth() {
	if (window.innerWidth!=window.undefined) return window.innerWidth; 
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth; 
	if (document.body) return document.body.clientWidth; 
	return window.undefined; 
}

/**
 * 弹窗引入layer 在最外层弹窗
 * @argument url - url to display
 * @argument width - 宽度 例如：100 或者 100px　建议不用px
 * @argument height - 高度 例如： 100 或者 100px 建议不用px
 * @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
 * @argument fullpage 是否进入最大化显示，true 最大化，false正常(默认值)
 * @argument maxmin 是否有最大化最小化功能， true 有(默认值)，false 没有
 * @argument resize 弹窗是否允许拉伸， true 支持(默认值)，false 不支持。
 * @argument success 回调函数 
 * @argument cancel 回调函数 
 * {width:"", height:"", title:"", fullpage:true/false, maxmin: ture/false, resize: true/false, success:fn, cancel:fn}
 */
function mcShowPopWinFp(url, obj) {
	var curIndex; //获取当前窗口的索引(如果当前窗口是非layer弹出框，则curIndex为获取到undefined)
	var framesetParentLayerName;  //layer弹窗中有frameset的情况下的layer的name
	var curFrameName; //当前iframe 或者 frame的name
	
	//解决回车和空格再次触发按钮点击事件问题
	document.onkeydown = function () {
		if(document.activeElement){
			var focusDom = document.activeElement;
			if(focusDom.nodeName.toLowerCase() == 'button'){
				$(focusDom).blur();
			}
		}
    };
    
	
	try{
		curFrameName = window.frameElement.name; //获取当前iframe 或者 frame的name
		curIndex = parent.layer.getFrameIndex(window.name); 
	}
	catch(err){
		//layer弹窗里面是frameset的情况，要记录layer的name
		try{
			framesetParentLayerName = window.parent.name;
			if( framesetParentLayerName.indexOf("layui") < 0 ){
				framesetParentLayerName = undefined;
			}
		}
		catch(e){
			//console.log(e);
		}
		//console.log(err);
	}
	
	
	
	if (undefined == obj.title || 0 == $.trim(obj.title).length || null == obj.title) {
		obj.title = document.title;
	}
	// 宽度
	if(undefined == obj.width || 0 == $.trim(obj.width).length || null == obj.width){
		obj.width = 800; //宽度默认值
	}
	
	// 高度
	if(undefined == obj.height || 0 == $.trim(obj.height).length || null == obj.height){
		obj.height = 400; //高度默认值
	}
	
	//非百分比的情况 宽度
	
	if(!judgePercent(obj.width)){
		
		obj.width = cancelPxToNumber(obj.width);
		
		var t_width = window.$(top).width();
		if (obj.width > t_width) {
			obj.width = t_width;
		}
		obj.width+='px';
	}
	
	
	//非百分比的情况 高度
	
	if(!judgePercent(obj.height)){
		obj.height = cancelPxToNumber(obj.height);
		
		var t_height = window.$(top).height();
		if (obj.height > t_height) {
			obj.height = t_height;
		}
		obj.height+='px';
	}
	
	
	//拉伸
	if(!obj.hasOwnProperty("resize")){
		obj.resize = false;
	}
	//最大最小化
	if(!obj.hasOwnProperty("maxmin")){
		obj.maxmin = false;
	}
	
	layui.use(['layer'], function(){
		var layer = layui.layer;
	  　　var index = top.layer.open({
			type: 2,
			skin: 'layui-layer-molv',
			title: obj.title,
			maxmin: obj.maxmin,
			shadeClose: false, //点击遮罩关闭层
			area : [obj.width , obj.height],
			content: url,
			resize: obj.resize,
			min: function(index, layero){
			},
			success: function(layero,index){
				//将源弹出层的id记录到现在弹出差里面。
				var contentWindow = layero.find('iframe')[0].contentWindow;
				
				//父框架名字存到隐藏域
				if(contentWindow && (typeof contentWindow) == 'object'){
					try {
						contentWindow.$("body").find("form").append("<input type='hidden' value='"+curFrameName+"' name='parentFrameName'/>"); 
						contentWindow.$("body").append("<input type='hidden' value='"+curIndex+"' name='preLayerId'/>");
					}catch(err){
						//console.log(err);
					}
						
				}
				
				if(framesetParentLayerName && (typeof framesetParentLayerName == 'string')){
					contentWindow.$("body").append("<input type='hidden' value='"+framesetParentLayerName+"' name='framesetParentLayerName'/>");
					//隐藏域，提交的时候一并给后台，后台返回js执行的时候，需要通过它layer中iframe的name找到frameset中的frame
					//contentWindow.$("body").find("form").append("<input type='hidden' value='"+framesetParentLayerName+"' name='framesetParentLayerNameHid'/>");
				}
				
				if(obj.success){
					var success = obj.success;
					success();
				}
			},
			cancel: function(index, layero){ 
				if(obj.cancel){
					obj.cancel();
				}
			} 
		});
		if(obj.fullpage){
			parent.layer.full(index);
		}
	  
	});
	
}
/**
 * 去除px
 * by tangws 20181120 
 */
function cancelPxToNumber(num){
	
	if(typeof(num)=="string" && num.indexOf("px")){
		return parseInt(num.replace(/px/g,""));
	}
	return num;
}

/**
 * 判断是否含有百分号 %
 */
function judgePercent(num){
	var numStr = num.toString();
	if(numStr.indexOf("%") > 0){
		return true;
	}
	return false;
}

