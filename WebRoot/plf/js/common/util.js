
/*******************************************************************************
 * 
 * JS文件说明：公用JS方法
 * 
 * 
 * 
 * 建立：liudg
 * 
 * 时间：2012-01-09
 * 
 * 
 * 
 * 扩展：可自行扩展该对象下的验证方法，命名规则类同JAVA
 * 
 * 
 * 
 * 使用方法：
 * 
 * util.getBytesLength("www");
 * 
 ******************************************************************************/
var _showLoadingMsg = "";
var _isShowLoading = false;
var _showTopLoadingMsg = "";
var _isShowTopLoading = false;
var _DICT_MAP_GOL = new Object();
var _LANG_MAP_GOL = new Object();

var _isMothMakrControl=true;// 用于标记用户是否超时未操作平台功能， cjd ldg
							// _isMothMakrControl=false To Cjd 2018-01-25
var _isMotParkBackMark =true;// _isMotParkBackMark=true为后台，_isMotParkBackMark=false前端
								// 2018-02-01 cjd

function Util() {
	this.submit_default_info = "\u6570\u636e\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u5019...";
	/* 弹出提示信息，入参：要显示的字符串 */
	this.alert = function (msg,backFun,paramObj) {
		
		//优化layer 可能被跨系统调用的时候 top.layer报错的问题。
		if(layui){
			var topLayer;
			var index = layui.use(['layer'],function(){
				var layer = layui.layer;
				layer.ready(function(){
					try{
						topLayer = top.layer
					}
					catch(err){
						topLayer = layer;
					}
					topLayer.open({
						content: msg,
						title: '摩尔提示',
						skin: 'layui-layer-molv',
						btn: ['确定'],
						yes: function(index){
							// var index = parent.layer.getFrameIndex(window.name);
							if(null!=backFun){
								backFun(paramObj);
							}
							top.layer.close(index);
						}
					});
				})
				
				
			});
			return;
		}
		
		
		var topMaskLayDiv = document.getElementById("_top_mask_lay_alertMsgDiv");
		if(null==topMaskLayDiv){
			var divStr = "<div id=\"_top_mask_lay_alertMsgDiv\" tabindex=\"0\"  style=\"display:none;position: absolute;cursor: wait;filter:alpha(Opacity=20);-moz-opacity:0.2;opacity: 0.2;z-index:9998;background-color:#8298AC;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0\"></div>\n" +
			"<div class=\"popmenu\" id=\"alertMsgDiv\" tabindex=\"0\" >\n" + 
			"  <div style=\"z-index: 99999;height:60px; line-height:10px; margin-top:50px; font-size:14px;\">    <img src=\" "+this.getContextPath()+"/plf/style/css2/images/tb.gif\" /><span id='alertMsg_msg'></span></div>\n" + 
			"    <div>  &nbsp;&nbsp;<input type=\"button\" value=\"&nbsp;"+_GLO_VALIDATE_OK+"&nbsp;\" class=\"botton_img_search\" id=\"_alertMsgbut\"></div>\n" + 
			"    </div><div id=\"bgDiv2\"></div>";
	
			var tmpDiv = document.createElement("div");
			tmpDiv.innerHTML = divStr;
			var body = document.getElementsByTagName("body")[0];
			body.appendChild(tmpDiv);
			topMaskLayDiv = document.getElementById("_top_mask_lay_alertMsgDiv");
		}

		if (null == msg || "" == msg) {
			msg = _popmenu_js_msg;
		}
		document.getElementById("alertMsg_msg").innerHTML = msg;
		var bgObj = document.getElementById("bgDiv2");
		bgObj.style.width = 0 + "px";
		bgObj.style.height = 0 + "px";
		topMaskLayDiv.style.display = "block";
		var msgObj = document.getElementById("alertMsgDiv");
		bgObj.style.display = msgObj.style.display = "block";
		msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
		msgObj.style.display = bgObj.style.display = "block";
		var alertBut = document.getElementById("_alertMsgbut");
		alertBut.focus();// 默认选中确定按钮
		alertBut.onclick = function () {
			bgObj.style.display = msgObj.style.display = "none";
			topMaskLayDiv.style.display = "none";
			if(null!=backFun){
				backFun(paramObj);
			}
		};

        // 响应键盘事件
		$("#_top_mask_lay_alertMsgDiv").keyup(function (event) {
            // 获取键值
			var keyEvent = event || window.event;
			var key = keyEvent.keyCode;
            // 获得当前对象
			var input_blur = $(this);
			switch (key) {
			  case 27:// 按下esc键，取消
				bgObj.style.display = msgObj.style.display = "none";
				topMaskLayDiv.style.display = "none";
				if(null!=backFun){
					backFun(paramObj);
				}
				break;
			}
		});
		$("#alertMsgDiv").keyup(function (event) {
            // 获取键值
			var keyEvent = event || window.event;
			var key = keyEvent.keyCode;
            // 获得当前对象
			var input_blur = $(this);
			switch (key) {
			  case 27:// 按下esc键，取消
				bgObj.style.display = msgObj.style.display = "none";
				topMaskLayDiv.style.display = "none";
				if(null!=backFun){
					backFun(paramObj);
				}
				break;
			}
		});
		alertBut.focus();// 默认选中确定按钮
	};
	/* 弹出确认窗口，入参：(回调函数，要显示的字符串，回调参数) */
	this.confirm = function (callBackFun, msg,paramObj) {
		if (null == msg || "" == msg) {
			msg = "\u786E\u8BA4\u6267\u884C\u64CD\u4F5C";
		}
		_confirm_(callBackFun, msg,paramObj);
	};
	
	this.confirmall = function (callBackFun, msg,paramObj) {
		if (null == msg || "" == msg) {
			msg = "\u786E\u8BA4\u6267\u884C\u64CD\u4F5C";
		}
		_confirm_all(callBackFun, msg,paramObj);;
	};
	
	/* 转字符串 */
	this.toString = function (obj) {
		return (null == obj ? "" : obj.toString());
	};
	/* 去除字符串的左右空格，入参：字符串 */
	this.trim = function (str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	};
	/**
	 * 得到标准时区的时间的函数
	 */
	this.getLocalTime = function (i) {
		  // 参数i为时区值数字，比如北京为东八区则输进8,西5输入-5
        if (typeof i !== 'number') return;
        var d = new Date();
        // 得到1970年一月一日到现在的秒数
        var len = d.getTime();
        // 本地时间与GMT时间的时间偏移差
        var offset = d.getTimezoneOffset() * 60000;
        // 得到现在的格林尼治时间
        var utcTime = len + offset;
        return new Date(utcTime + 3600000 * i);
	};
	/* 去除字符串的所有空格 */
	this.allTrim = function (str) {
		if(str!=""){
			var result = str.replace(/(^\s*)|(\s*$)/g, "");
			return result.replace(/\s/g, "");
		}
		return str;
	};
	
	/* 取得字符串的字节长度，入参：字符串 */
	this.getBytesLength = function (str) {
		/* 在GBK编码里，除了ASCII字符，其它都占两个字符宽 */
		return (str.replace(/[^\x00-\xff]/g, "xx")).length;
	};
	/* 设置TABLE的背景图片，入参：表格ID */
	this.setTableBackImg = function (tableId) {
		if (null == tableId || "" == tableId) {
			return;
		}
		var dataList = document.getElementById(tableId);
		if (null == dataList) {
			return;
		}
		var tableHeardHeight = 28;
		if (dataList.rows.length > 0) {
			tableHeardHeight = dataList.rows[0].offsetHeight + 2;
		}
		if (null == document.getElementById("_bag_pageTcl")) {
			var imgUrl = this.getContextPath() + "/images/LOGO.jpg";
			var divHtml = "<div id=\"_bag_pageTcl\" style=\"position: absolute; z-index: 1; left: 100px; top: 100px; filter: Alpha(opacity =   30); opacity: 0.2;\" >" + "<img id =\"_bag_backImg\" src=\"" + imgUrl + "\" />" + "</div>";
			var body = document.getElementsByTagName("body")[0];
			if (null == body) {
				return;
			}
			var tmpDiv = document.createElement("div");
			tmpDiv.innerHTML = divHtml;
			body.appendChild(tmpDiv);
		}
		var divObj = document.getElementById("_bag_pageTcl");
		if (null != dataList && null != divObj) {
			var backImg = document.getElementById("_bag_backImg");
			var width = dataList.offsetWidth;
			var height = dataList.offsetHeight;
			if ((dataList.offsetHeight - tableHeardHeight) < divObj.offsetHeight) {
				backImg.style.height = (dataList.offsetHeight - tableHeardHeight);
			}
			divObj.style.top = (height - tableHeardHeight - divObj.offsetHeight) / 2 + dataList.offsetTop + tableHeardHeight;
			divObj.style.left = (width - divObj.offsetWidth) / 2 + dataList.offsetLeft;
			window.setTimeout("setTableBackImg_('" + tableId + "')", 50);
		}
	};
	/* 显示loading背景图片，入参：显示提示信息，若为空则显示默认信息 */
	this.showLoading = function (msg) {
		var body = document.getElementsByTagName("body")[0];
		if (null == body) {
			return;
		}
		var fullHeight = getViewportHeight();
		var viewHeight = document.body.scrollHeight;
		var fullWidth = getViewportWidth();
		if (fullHeight < viewHeight) {
			fullHeight = viewHeight;
		} else {
			viewHeight = fullHeight;
		}
		var scLeft, scTop;
		if (null == msg || "" == msg) {
			msg = this.submit_default_info;
		}
		_showLoadingMsg = msg;
		var imgUrl = this.getContextPath() + "/plf/images/loadingGIF.gif";
		if (null == document.getElementById("_loading_div")) {
			var iframeLay = "";// "<iframe frameborder="0" style="cursor:
								// wait;position:absolute; visibility:inherit;
								// top:0px; left:0px; width:100%; height:100%;
								// z-index:997;
								// filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';"></iframe>"
								// ;
			var lay1 = "<div id=\"_loading_lay_div\" style=\"position: absolute;cursor: wait;filter:alpha(Opacity=0);-moz-opacity:0;opacity: 0.1;z-index:99998;background-color:#8298AC;border:none;margin:0;padding:0;width:" + fullWidth + "px;height:" + viewHeight + "px;top:0;left:0\">" + iframeLay + "</div>";
			var divHtml = "<div style=\"z-index:99999;position: absolute;display:none;cursor: wait;padding:20px;border-radius: 5px;background-color:#000;opacity: 0.2;\" align=\"center\"; id=\"_loading_div\">" + "<table><tr><td align=\"center\" nowrap ><img id=\"_loading_img\" src=\"" + imgUrl + "\" /></td></tr><tr ><td align=\"center\" nowrap style=\"color: #E27907;\">" + msg + "</td></tr>" + "</div>";
			var tmpDiv = document.createElement("div");
			tmpDiv.innerHTML = lay1 + divHtml;
			body.appendChild(tmpDiv);
		} else {
			document.getElementById("_loading_div").style.display = "";
			document.getElementById("_loading_img").src = imgUrl;
		}
		var divObj = document.getElementById("_loading_div");
		var divLayObj = document.getElementById("_loading_lay_div");
		divObj.style.display = "";
		divLayObj.style.display = "";
		var iWidth = divObj.offsetWidth; // 弹出窗口的宽度;
		var iHeight = divObj.offsetHeight; // 弹出窗口的高度;
		divObj.style.display = "none";
		divLayObj.style.width = fullWidth + "px";
		divLayObj.style.height = viewHeight + "px";
		if (self.pageYOffset) {
			scLeft = self.pageXOffset;
			scTop = self.pageYOffset;
		} else {
			if (document.documentElement && document.documentElement.scrollTop) {
				scLeft = document.documentElement.scrollLeft;
				scTop = document.documentElement.scrollTop;
			} else {
				if (document.body) {
					scLeft = document.body.scrollLeft;
					scTop = document.body.scrollTop;
				}
			}
		}
		var topMargin = scTop + ((fullHeight - iHeight) / 2);
		if (topMargin < 0) {
			topMargin = 0;
		}
		divObj.style.top = topMargin + "px";
		divObj.style.left = (scLeft + ((fullWidth - iWidth) / 2)) + "px";
		if (gHideSelects) {
			hideSelectBoxes();
		}
		divObj.style.display = "";
		_isShowLoading = true;
		resizeTimer_showLoading = null;
	};
	/* 关闭loading背景图片，入参：空 */
	this.closeLoading = function () {
		_isShowLoading = false;
		if (gHideSelects) {
			displaySelectBoxes();
		}
		var divObj = document.getElementById("_loading_div");
		if (null != divObj) {
			divObj.style.display = "none";
		}
		var _loading_lay_div = document.getElementById("_loading_lay_div");
		if (null != _loading_lay_div) {
			_loading_lay_div.style.display = "none";
		}
		window.setTimeout("util._closeLoadingTimeOut()", 60);
	};
	this._closeLoadingTimeOut = function () {
		_isShowLoading = false;
		if (gHideSelects) {
			displaySelectBoxes();
		}
		var divObj = document.getElementById("_loading_div");
		if (null != divObj) {
			divObj.style.display = "none";
		}
		var _loading_lay_div = document.getElementById("_loading_lay_div");
		if (null != _loading_lay_div) {
			_loading_lay_div.style.display = "none";
		}
	};
	this.resizeShowLoading = function (msg) {
		if (_isShowLoading) {
			this.showLoading(msg);
		}
	};
	/* 跨站点特殊字符替换 */
	this.replaceLikeVal=function(comp){  
        if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1||comp.value.indexOf("/") != -1) {  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"").replace(/\//g,"");
            this.alert("不能输入单引号双引号<>{}()[]/");
        }  
    }  
	/* 判断是否IE */
	this.isIE = function () {
		try{
		return (/(?:microsoft|opera)/i.test(navigator.appName));
		}catch(e){
			return false;
		}
	};
	/* 判断是否Chrome谷哥浏览器 */
	this.isChrome = function () {
		try{
			return window.navigator.userAgent.indexOf("Chrome") !== -1;
		}catch(e){
			return false;
		}
	};
	/* 在顶层窗口显示loading背景图片，入参：显示提示信息，若为空则显示默认信息 */
	this.showTopLoading = function (msg) {
		try {
			if (window.top._topIframe != null) {
			// this.showTopLoading();
			} else {
				this.showLoading();
				return;
			}
		}
		catch (e) {
		}
		var ieop = this.isIE();
		var xDom;
		var xBody;
		try {
			xDom = (window.top.document == document) ? document : (window.top.document.body.tagName != "BODY") ? document : window.top.document;
			xBody = (window.top.document == document) ? document.body : (window.top.document.body.tagName == "BODY") ? window.top.document.body : (ieop) ? document.body : window.top.document.documentElement;
		}
		catch (e) {
			try {
				xDom = (window.parent.document == document) ? document : (window.parent.document.body.tagName != "BODY") ? document : window.parent.document;
				xBody = (window.parent.document == document) ? document.body : (window.parent.document.body.tagName == "BODY") ? window.parent.document.body : (ieop) ? document.body : window.parent.document.documentElement;
				xDom = (window.parent.parent.document == document) ? document : (window.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.document;
				xBody = (window.parent.parent.document == document) ? document.body : (window.parent.parent.document.body.tagName == "BODY") ? window.parent.parent.document.body : (ieop) ? document.body : window.parent.parent.document.documentElement;
				xDom = (window.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.document;
				xBody = (window.parent.parent.parent.document == document) ? document.body : (window.parent.parent.parent.document.body.tagName == "BODY") ? window.parent.parent.parent.document.body : (ieop) ? document.body : window.parent.parent.parent.document.documentElement;
				xDom = (window.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.document;
				xBody = (window.parent.parent.parent.parent.document == document) ? document.body : (window.parent.parent.parent.parent.document.body.tagName == "BODY") ? window.parent.parent.parent.parent.document.body : (ieop) ? document.body : window.parent.parent.parent.parent.document.documentElement;
				xDom = (window.parent.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.parent.document;
				xBody = (window.parent.parent.parent.parent.parent.document == document) ? document.body : (window.parent.parent.parent.parent.parent.document.body.tagName == "BODY") ? window.parent.parent.parent.parent.parent.document.body : (ieop) ? document.body : window.parent.parent.parent.parent.parent.document.documentElement;
			}
			catch (e) {
				if (null == xDom) {
					xDom = (window.document == document) ? document : (window.document.body.tagName != "BODY") ? document : window.document;
					xBody = (window.document == document) ? document.body : (window.document.body.tagName == "BODY") ? window.document.body : (ieop) ? document.body : window.document.documentElement;
				}
			}
		}
		var body = xBody;
		if (null == body) {
			return;
		}
		var fullHeight = body.scrollHeight;
		var fullWidth = getViewportWidth();
		var viewHeight = getViewportHeight();
		if (fullHeight < viewHeight) {
			fullHeight = viewHeight;
		}
		var scLeft, scTop;
		if (null == msg || "" == msg) {
			msg = this.submit_default_info;
		}
		_showTopLoadingMsg = msg;
		var imgUrl = this.getContextPath() + "/plf/images/loading_h1.gif";
		if (null == xDom.getElementById("_top_loading_div")) {
			var xdoc = xDom.createDocumentFragment();
			body.appendChild(xdoc);
			var lay1 = "<div id=\"_top_loading_lay_div\" style=\"position: absolute;cursor: wait;filter:alpha(Opacity=10);-moz-opacity:0.1;opacity: 0.1;z-index:99998;background-color:#8298AC;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0\"></div>";
			var divHtml = "<div style=\"z-index:99999;position: absolute;cursor: wait;background-color:#eaf1fa;\" align=\"center\"; id=\"_top_loading_div\">" + "<table><tr><td align=\"center\" nowrap ><img id=\"_top_loading_img\" src=\"" + imgUrl + "\" /></td></tr><tr ><td align=\"center\" nowrap style=\"color: #E27907;font-size:12px;\">" + msg + "</td></tr>" + "</div>";
			var tmpDiv = xDom.createElement("div");
			tmpDiv.innerHTML = lay1 + divHtml;
			body.appendChild(tmpDiv);
		} else {
			xDom.getElementById("_top_loading_div").style.display = "";
			xDom.getElementById("_top_loading_lay_div").style.display = "";
			xDom.getElementById("_top_loading_img").src = imgUrl;
		}
		var divObj = xDom.getElementById("_top_loading_div");
		var divLayObj = xDom.getElementById("_top_loading_lay_div");
		var iWidth = divObj.offsetWidth; // 弹出窗口的宽度;
		var iHeight = divObj.offsetHeight; // 弹出窗口的高度;
		divObj.style.top = body.scrollTop + body.offsetHeight / 2 - (iHeight / 2) + "px";
		divObj.style.left = body.scrollLeft + body.offsetWidth / 2 - (iWidth / 2) + "px";
		if (gHideSelects) {
			hideSelectBoxes();
		}
		_isShowTopLoading = true;
	};
	/* 关闭top loading背景图片，入参：空 */
	this.closeTopLoading = function () {
		_isShowTopLoading = false;
		var xDom;
		try {
			xDom = (window.top.document == document) ? document : (window.top.document.body.tagName != "BODY") ? document : window.top.document;
			xBody = (window.top.document == document) ? document.body : (window.top.document.body.tagName == "BODY") ? window.top.document.body : (ieop) ? document.body : window.top.document.documentElement;
		}
		catch (e) {
			try {// 如果页面被iframe跨域嵌套时，查找顶层页面时最多向上查找5层
				xDom = (window.parent.document == document) ? document : (window.parent.document.body.tagName != "BODY") ? document : window.parent.document;
				xDom = (window.parent.parent.document == document) ? document : (window.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.document;
				xDom = (window.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.document;
				xDom = (window.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.document;
				xDom = (window.parent.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.parent.document;
			}
			catch (e) {
				if (null == xDom) {
					xDom = (window.document == document) ? document : (window.document.body.tagName != "BODY") ? document : window.document;
				}
			}
		}
		var loadingDiv = xDom.getElementById("_top_loading_div");
		var loadingLayDiv = xDom.getElementById("_top_loading_lay_div");
		if (null != loadingDiv) {
			if (gHideSelects) {
				displaySelectBoxes();
			}
			loadingDiv.style.display = "none";
			loadingLayDiv.style.display = "none";
		}
	};
	this._closeTopLoadingTimeOut = function () {
		_isShowTopLoading = false;
		var xDom;
		try {
			xDom = (window.top.document == document) ? document : (window.top.document.body.tagName != "BODY") ? document : window.top.document;
			xBody = (window.top.document == document) ? document.body : (window.top.document.body.tagName == "BODY") ? window.top.document.body : (ieop) ? document.body : window.top.document.documentElement;
		}
		catch (e) {
			try {// 如果页面被iframe跨域嵌套时，查找顶层页面时最多向上查找5层
				xDom = (window.parent.document == document) ? document : (window.parent.document.body.tagName != "BODY") ? document : window.parent.document;
				xDom = (window.parent.parent.document == document) ? document : (window.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.document;
				xDom = (window.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.document;
				xDom = (window.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.document;
				xDom = (window.parent.parent.parent.parent.parent.document == document) ? document : (window.parent.parent.parent.parent.parent.document.body.tagName != "BODY") ? document : window.parent.parent.parent.parent.parent.document;
			}
			catch (e) {
				if (null == xDom) {
					xDom = (window.document == document) ? document : (window.document.body.tagName != "BODY") ? document : window.document;
				}
			}
		}
		var loadingDiv = xDom.getElementById("_top_loading_div");
		var loadingLayDiv = xDom.getElementById("_top_loading_lay_div");
		if (null != loadingDiv) {
			if (gHideSelects) {
				displaySelectBoxes();
			}
			loadingDiv.style.display = "none";
			loadingLayDiv.style.display = "none";
		}
		window.setTimeout("util._closeTopLoadingTimeOut()", 60);
	};
	/* js 取contextPath，如/mes */
	this.getContextPath = function () {
		var contextPath = document.location.pathname;
		if ("/" == contextPath.substr(0, 1)) {
			index = contextPath.substr(1).indexOf("/");
		} else {
			contextPath = "/" + contextPath;
		}
		var index = contextPath.substr(1).indexOf("/");
		contextPath = contextPath.substr(0, index + 1);
		return contextPath;
	};
	/* 改按钮图片样式 */
	this.btnMouseEvent = function (thisObj, appendStr) {
		$(thisObj).find("td").each(function () {
			var oldClass = $(this).attr("class");
			if (oldClass.indexOf("_Sed") > 0) {
				oldClass = oldClass.substr(0, oldClass.indexOf("_Sed"));
			} else {
				if (oldClass.indexOf("_Hover") > 0) {
					oldClass = oldClass.substr(0, oldClass.indexOf("_Hover"));
				}
			}
			var newClass = oldClass + appendStr;
			$(this).removeClass();
			$(this).addClass(newClass);
		});
	};
	/* json对象转字符串 */
	this.jsonToString = function (o) {
		if (o == undefined) {
			return "";
		}
		var r = [];
		if (typeof o == "string") {
			return "\"" + o.replace(/([\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
		}
		if (typeof o == "object") {
			if (!o.sort) {
				for (var i in o) {
					r.push("\"" + i + "\":" + this.jsonToString(o[i]));
				}
				if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
					r.push("toString:" + o.toString.toString());
				}
				r = "{" + r.join() + "}";
			} else {
				for (var i = 0; i < o.length; i++) {
					r.push(this.jsonToString(o[i]));
				}
				r = "[" + r.join() + "]";
			}
			return r;
		}
		return o.toString().replace(/\"\:/g, "\":\"\"");
	};

	/* json对象转字符串 */
	this.jsonToStr = function (jsonObj){
		return JSON.stringify(jsonObj);
	};
	
	/* 字符串转json对象 */
	this.toJsonObj = function (str){
		return JSON.parse(str);
	};
	/* 数字转换成大写人民币 */
	this.toCnMoney = function (money) {
		var cnNums = new Array("\u96f6", "\u58f9", "\u8d30", "\u53c1", "\u8086", "\u4f0d", "\u9646", "\u67d2", "\u634c", "\u7396"); // 汉字的数字
		var cnIntRadice = new Array("", "\u62fe", "\u4f70", "\u4edf"); // 基本单位
		var cnIntUnits = new Array("", "\u4e07", "\u4ebf", "\u5146"); // 对应整数部分扩展单位
		var cnDecUnits = new Array("\u89d2", "\u5206", "\u6beb", "\u5398"); // 对应小数部分单位
		var cnInteger = "\u6574"; // 整数金额时后面跟的字符
		var cnIntLast = "\u5706"; // 整型完以后的单位(u5143元或u5706圆)
		var maxNum = 1000000000000000; // 最大处理的数字
		var IntegerNum; // 金额整数部分
		var DecimalNum; // 金额小数部分
		var ChineseStr = ""; // 输出的中文金额字符串
		var parts; // 分离金额后用的数组，预定义
		if (money == "") {
			return "";
		}
		money = parseFloat(money);
		if (money >= maxNum) {
			alert("\u8d85\u51fa\u6700\u5927\u5904\u7406\u6570\u5b57");
			return "";
		}
		if (money == 0) {
			ChineseStr = cnNums[0] + cnIntLast + cnInteger;
			return ChineseStr;
		}
		money = money.toString(); // 转换为字符串
		if (money.indexOf(".") == -1) {
			IntegerNum = money;
			DecimalNum = "";
		} else {
			parts = money.split(".");
			IntegerNum = parts[0];
			DecimalNum = parts[1].substr(0, 4);
		}
		if (parseInt(IntegerNum, 10) > 0) { // 获取整型部分转换
			var zeroCount = 0;
			var IntLen = IntegerNum.length;
			for (var i = 0; i < IntLen; i++) {
				var n = IntegerNum.substr(i, 1);
				var p = IntLen - i - 1;
				var q = p / 4;
				var m = p % 4;
				if (n == "0") {
					zeroCount++;
				} else {
					if (zeroCount > 0) {
						ChineseStr += cnNums[0];
					}
					zeroCount = 0; // 归零
					ChineseStr += cnNums[parseInt(n)] + cnIntRadice[m];
				}
				if (m == 0 && zeroCount < 4) {
					ChineseStr += cnIntUnits[q];
				}
			}
			ChineseStr += cnIntLast;// 整型部分处理完毕
		}
		if (DecimalNum != "") { // 小数部分
			var decLen = DecimalNum.length;
			for (var i = 0; i < decLen; i++) {
				var n = DecimalNum.substr(i, 1);
				if (n != "0") {
					ChineseStr += cnNums[Number(n)] + cnDecUnits[i];
				}
			}
		}
		if (ChineseStr == "") {
			ChineseStr += cnNums[0] + cnIntLast + cnInteger;
		} else {
			if (DecimalNum == "") {
				ChineseStr += cnInteger;
			}
		}
		return ChineseStr;
	};
	this.setEditTable = function (editTableId) {
	    // 找到所有的td节点
		var tds = $("#" + editTableId + " td");
	    // 给所有的td添加点击事件
		tds.click(function () {
	    // 获得当前点击的对象
			var td = $(this);
			if ((null != td.attr("class") && td.attr("class").indexOf("_noedit") > -1)||td.hasClass("initComponent")) {
				return;
			}
			var showObj = td.find("._show");// 显示部分
			var editObj = td.find("._edit");// 数据部分
			var formObj = editObj.children();// 数据提交部分
			var formObjNodeName;
			if(formObj[0].nodeName){
				formObjNodeName = formObj[0].nodeName;// 数据提交表单dom名称
			}
			var formObjType = formObj.attr("type");// 数据提交表单类型
			if (showObj.css("display") == "none") {
				return;
			}
	    // 取出当前td的文本内容保存起来
			var oldText = showObj.text();
			// formObj.width("90%");
			showObj.hide();
			editObj.show();
	        // 当文本框得到焦点时触发全选事件
			formObj.trigger("focus");
			if (formObjType != "button") {
				formObj.select();
			}
	        // 当文本框失去焦点时重新变为文本
			formObj.blur(function () {
	            // 保存当前文本框的内容
				editObj.hide();
				if (formObjType != "button") {
					if ("SELECT" == formObjNodeName && "" != formObj.val()) {
						showObj.html(formObj.find("option:selected").text());
					} else {
						if(editTableId == "left_data_table"){
							var nowText = formObj.val();
							if(nowText.length>6){
								showObj.html(nowText.substring(0,6)+".......");
								showObj.attr("title",nowText);
							}else{
								showObj.html(formObj.val());
							}
						}else{
							showObj.html(formObj.val());
						}
					}
				}
				showObj.show();
			});
	        // 响应键盘事件
			formObj.keyup(function (event) {
				if (formObjType == "button") {
					return;
				}
	            // 获取键值
				var keyEvent = event || window.event;
				var key = keyEvent.keyCode;
	            // 获得当前对象
				var input_blur = $(this);
				switch (key) {
				  case 13:// 按下回车键，保存当前文本框的内容
					editObj.hide();
					if ("SELECT" == formObjNodeName && "" != formObj.val()) {
						showObj.html(formObj.find("option:selected").text());
					} else {
						showObj.html(formObj.val());
					}
					showObj.show();
					break;
				  case 27:// 按下esc键，取消修改，把文本框变成文本
					editObj.hide();
					showObj.html(oldText);
					showObj.show();
					break;
				}
			});
		});
	};
	/* 判断是否有重复字符串 */
	this.isRepeat = function (arr) {
		var resObj = new Object;
		var hash = {};
		for (var i in arr) {
			if (hash[arr[i]]) {
				resObj.res = true;
				resObj.val = arr[i];
				resObj.seq = i;
				return resObj;
			}
			hash[arr[i]] = true;
		}
		resObj.res = false;
		return resObj;
	};
	/* 判断是否有滚动条 */
	this.isScroll = function (thisDoc) {
		if (thisDoc.body.style.overflow != "hidden" && thisDoc.body.scroll != "no" && thisDoc.body.scrollHeight > thisDoc.body.offsetHeight) {
			return true;
		} else {
			return false;
		}
	};
	/*------selection operations-------*/
	/** *********************以下为编辑器优化设置**************************** */
	/*
	 * //截获了Tab按键，其他的textarea框不进行此配置 //下面的代码就是为了实现这个功能，原理很简单，采用上一行的缩进就行
	 * //只要在html中插入脚本调用reloadTabKey()函数就可以了
	 * //注1：需要jQuery支持，如果不喜欢jQuery改成javascript也很方便的 //兼容firefox和IE！
	 */
	this.reloadTabKey = function (jqObj) {
		/* set all the tab indent for all the text areas */
		jqObj.each(function () {
			$(this).keydown(function (eve) {
				if (eve.target != this) {
					return;
				}
				if (eve.keyCode == 13) {
					last_blanks = util.getCurrentLineBlanks(this);
				} else {
					if (eve.keyCode == 9) {
						eve.preventDefault();
						util.insertAtCursor(this, "\t");
						this.returnValue = false;
					}
				}
			}).keyup(function (eve) {
				if (eve.target == this && eve.keyCode == 13) {
					util.insertAtCursor(this, last_blanks);
				}
			});
		});
	};
	this.insertAtCursor = function (obj, txt) {
		obj.focus();
	  // IE support
		if (document.selection) {
			sel = document.selection.createRange();
			sel.text = txt;
		} else {
			var startPos = obj.selectionStart;
			var scrollTop = obj.scrollTop;
			var endPos = obj.selectionEnd;
			obj.value = obj.value.substring(0, startPos) + txt + obj.value.substring(endPos, obj.value.length);
			startPos += txt.length;
			obj.setSelectionRange(startPos, startPos);
			obj.scrollTop = scrollTop;
		}
	};
	this.getCaretPos = function (ctrl) {
		var caretPos = 0;
		if (document.selection) {
	                // IE Support
			var range = document.selection.createRange();
	                // We'll use this as a 'dummy'
			var stored_range = range.duplicate();
	                // Select all text
			stored_range.moveToElementText(ctrl);
	                // Now move 'dummy' end point to end point of original range
			stored_range.setEndPoint("EndToEnd", range);
	                // Now we can calculate start and end points
			ctrl.selectionStart = stored_range.text.length - range.text.length;
			ctrl.selectionEnd = ctrl.selectionStart + range.text.length;
			caretPos = ctrl.selectionStart;
		} else {
			if (ctrl.selectionStart || ctrl.selectionStart == "0") {
	            // Firefox support
			}
		}
		caretPos = ctrl.selectionStart;
		return (caretPos);
	};
	this.getCurrentLineBlanks = function (obj) {
		var pos = this.getCaretPos(obj);
		var str = obj.value;
		var i = pos - 1;
		while (i >= 0) {
			if (str.charAt(i) == "\n") {
				break;
			}
			i--;
		}
		i++;
		var blanks = "";
		while (i < str.length) {
			var c = str.charAt(i);
			if (c == " " || c == "\t") {
				blanks += c;
			} else {
				break;
			}
			i++;
		}
		return blanks;
	};
		// <%-- 设置textarea 自适应宽度 --%>
	this.setTextAreaWidth = function (divId, areaId) {
		var tdWh = $("#" + divId).width();
		var docWh = $(document).width();
		var winWh = $(window).width();
		if (docWh > (winWh + 21)) {
			$("#" + areaId).css({width:tdWh - (docWh - winWh + 7)});
		} else {
			$("#" + areaId).css({width:tdWh - 2});
		}
	};
	// <%-- 设置textarea 自适应高度 --%>
	this.setTextAreaHeight = function (areaId, divHeadH) {
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#" + areaId).css({height:winWh - divHeadH - 21});
	};
	/* 数据字典翻译 */
	this.getDictShow = function (code, key) {
		if (null == code) {
			return "";
		}
		if (null == key) {
			return "";
		}
		try{
		return _DICT_MAP_GOL[code][key].value;
		}
		catch(e){return "";}
		/*
		 * var value = ""; jQuery.each(_DICT_MAP_GOL[code], function(i, map) {
		 * if(key == map.code){ value= map.value; return false; } }); return
		 * value;
		 */
	};
	/* 初始化数据字典 */
	this.initDictMap = function (dicts) {
		jQuery.ajax({type:"POST", dataType:"json",async:false , cache:false , url:this.getContextPath() + "/comm/DictAction_getDictMap.ms", data:{"paraMap.dicts":dicts}, success:function (data) {
				// alert(JSON.stringify(data));
				// util.alert(data.ajaxMap.nextselectId);
			if (null == data) {
				return;
			}
			if (null == data.ajaxMap) {
				return;
			}
			for (var key in data.ajaxMap) {
				if (null == _DICT_MAP_GOL[key]) {
					_DICT_MAP_GOL[key] = data.ajaxMap[key];
				}
			}
		}, error:function (msg) {
			util.closeLoading();
			util.alert("error:" + msg);
		}});
	};
	/* 取json对象长度 */
	this.getJsonObjLen = function (jsonObj) {
		if (null == jsonObj) {
			return 0;
		}
		var length = 0;
		for (var item in jsonObj) {
			length++;
		}
		return length;
	};
	
	/*
	 * 随机获取颜色
	 */
	this.getRandomColor = function(){
		var c = "#";
		var cArray = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
		for(var i = 0;i < 6;i++){
			var cIndex = Math.round(Math.random()*15);
			c += cArray[cIndex];
		}
		return c;
	};

    // 新增个获取UUID方法
	this.getUUID = function(){
        return ('xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        }));        	
    };
	/* 初始化多语言 */
	this.initLangMap = function (langs) {  
		langs = _mcBase64JsToJava.getMcDealBase64Encode(langs);  		 
		jQuery.ajax({type:"POST", dataType:"json",async:false , cache:false , 
			url:this.getContextPath() + "/comm/CacheAction_getLangMap.ms", 
			data:{"paraMap.langs":langs}, 
			
			success:function (data) {
				// alert(JSON.stringify(data));
				// util.alert(data.ajaxMap.nextselectId);
			if (null == data) {
				return;
			}
			if (null == data.ajaxMap) {
				return;
			}
			if(data.ajaxMap.RES == false){
				alert(data.ajaxMap.RES_MSG);
				return;
			}
			for (var key in data.ajaxMap) {
				if (null == _LANG_MAP_GOL[key]) {
					_LANG_MAP_GOL[key] = data.ajaxMap[key];
				}
			}
		}, error:function (msg) {
			util.closeLoading();
			util.alert("error:" + msg);
		}});
	};
	/* 多语言翻译 */
	this.getLangShow = function (key) {
		if (null == key) {
			return "";
		}
		var lang = _LANG_MAP_GOL[key]; 
		if(null==lang || ""==lang){
			lang=key;
			
		}
		for(var i=1; i<arguments.length; i++)
		{
		  lang=lang.replace("%s", arguments[i]);
		}
		return lang;
	};
}

// ***************************************util end****************

var util = new Util();
util.closeTopLoading();


// **************************下面为扩展原有对象的方法*********************************************/

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt)   
{ // author: meizz
	var o = {
 "M+" : this.getMonth()+1,                 // 月份
 "d+" : this.getDate(),                    // 日
 "h+" : this.getHours(),                   // 小时
 "m+" : this.getMinutes(),                 // 分
 "s+" : this.getSeconds(),                 // 秒
 "q+" : Math.floor((this.getMonth()+3)/3), // 季度
 "S"  : this.getMilliseconds()             // 毫秒
};   
if(/(y+)/.test(fmt))   
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
 if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}  

Array.prototype.remove = function (dx) {
if(isNaN(dx)||dx>this.length){return false;}
this.splice(dx,1);
}

/**
 * Simple Map
 * 
 * 
 * var m = new Map(); m.put('key','value'); ... var s = "";
 * m.each(function(key,value,index){ s += index+":"+ key+"="+value+"n"; });
 * alert(s);
 * 
 * @author dewitt
 * @date 2008-05-24
 */
function Map() {
	/** 存放键的数组(遍历用到) */
	this.keys = new Array();
	/** 存放数据 */
	this.data = new Object();
	/**
	 * 放入一个键值对
	 * 
	 * @param {String}
	 *            key
	 * @param {Object}
	 *            value
	 */
	this.put = function (key, value) {
		if (this.data[key] == null) {
			this.keys.push(key);
		}
		this.data[key] = value;
	};
	/**
	 * 获取某键对应的值
	 * 
	 * @param {String}
	 *            key
	 * @return {Object} value
	 */
	this.get = function (key) {
		return this.data[key];
	};
	/**
	 * 删除一个键值对
	 * 
	 * @param {String}
	 *            key
	 */
	this.remove = function (key) {
		this.keys.remove(key);
		this.data[key] = null;
	};
	/**
	 * 遍历Map,执行处理函数
	 * 
	 * @param {Function}
	 *            回调函数 function(key,value,index){..}
	 */
	this.each = function (fn) {
		if (typeof fn != "function") {
			return;
		}
		var len = this.keys.length;
		for (var i = 0; i < len; i++) {
			var k = this.keys[i];
			fn(k, this.data[k], i);
		}
	};
	/**
	 * 获取键值数组(类似Java的entrySet())
	 * 
	 * @return 键值对象{key,value}的数组
	 */
	this.entrys = function () {
		var len = this.keys.length;
		var entrys = new Array(len);
		for (var i = 0; i < len; i++) {
			entrys[i] = {key:this.keys[i], value:this.data[i]};
		}
		return entrys;
	};
	/**
	 * 判断Map是否为空
	 */
	this.isEmpty = function () {
		return this.keys.length == 0;
	};
	/**
	 * 获取键值对数量
	 */
	this.size = function () {
		return this.keys.length;
	};
	/**
	 * 重写toString
	 */
	this.toString = function () {
		var s = "{";
		for (var i = 0; i < this.keys.length; i++, s += ",") {
			var k = this.keys[i];
			s += k + "=" + this.data[k];
		}
		s += "}";
		return s;
	};
	
}
/* js map 测试 */
function testMap() {
	var m = new Map();
	m.put("key1", "Comtop");
	m.put("key2", "\u5357\u65b9\u7535\u7f51");
	m.put("key3", "\u666f\u65b0\u82b1\u56ed");
	alert("init:" + m);
	m.put("key1", "\u5eb7\u62d3\u666e");
	alert("set key1:" + m);
	m.remove("key2");
	alert("remove key2: " + m);
	var s = "";
	m.each(function (key, value, index) {
		s += index + ":" + key + "=" + value + "\n";
	});
	alert(s);
}
function closePopWin() {
	hidePopWin(false);
}
var resizeTimer_showLoading = null;
var _isAlertAuthMsg = false;


function _canClose(){
	$(window).unbind('beforeunload');
	window.onbeforeunload = null;
}

// 全局的AJAX访问，处理AJAX清求时SESSION超时及无权限提示(这个有ajax加载的页面才需要用到)
try {
	jQuery.ajaxSetup({contentType:"application/x-www-form-urlencoded;charset=utf-8", complete:function (XMLHttpRequest, textStatus) {
		_mcAjaxBack(XMLHttpRequest);
	} });
}
catch (e) {
}

/**
 * ajax请求时没有权限的处理方法
 * 
 * @param XMLHttpRequest
 * @returns {Boolean}
 */
function _mcAjaxBack(XMLHttpRequest){
    // 通过XMLHttpRequest取得响应头，sessionstatus
	var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
	var isPlatform = XMLHttpRequest.getResponseHeader("isPlatform");
	if (null != sessionstatus ) {
		if(sessionstatus == "timeout"){
			_canClose();
			var _urlType = XMLHttpRequest.getResponseHeader("_urlType");
			var _sessionTimeOutGoToUrl = XMLHttpRequest.getResponseHeader("_sessionTimeOutGoToUrl");
			if("1"==_urlType){
				window.top.location = util.getContextPath() + "/sys/LoginAction_mainFrame.ms?loadMark=10";// 有指定时，跳转到后台登录页
			}else{ 
				window.top.location = _sessionTimeOutGoToUrl;// 跳转之前请求的页面，让过滤器去判断跳转到前台或者是后台
			}
		}else if (sessionstatus == "noAuthority") {
				if (isPlatform=="1"){
					var config = {
							type: 2,
							skin: 'layui-layer-molv',
							title:'权限认证',
							area: ['500px', '350px'],
							min: function(index, layero){
							},
							success: function(){
								
							}
						};
						  var mcIframeName = window.frameElement.name;
						  var type = "1";
						  if(mcIframeName=="leftFrame"){
							  mcIframeName = window.parent.name;
							   type = "2";
							  
						  }else if(window.frameElement.name=="mainFrame"){
							  mcIframeName = window.parent.name;
							  type = "3";
						  }
						  config.content = util.getContextPath()+"/fp/FpAction_forPlatFormLogin.ms?mcIframeName="+mcIframeName+"&type="+type;
						  top.layer.open(config);
						  return false;
				}else{
					if (!_isAlertAuthMsg) {
						alert(_GLO_NO_AUTHORITY_MSG);
					}
					_isAlertAuthMsg = true;
					util.closeLoading();
					isQuery = false;
				}
			}
	   }
	return true;
	
}

function getViewportHeight() {
	if (window.innerHeight != window.undefined) {
		return window.innerHeight;
	}
	if (document.compatMode == "CSS1Compat") {
		return document.documentElement.clientHeight;
	}
	if (document.body) {
		return document.body.clientHeight;
	}
	return window.undefined;
}
function getViewportWidth() {
	if (window.innerWidth != window.undefined) {
		return window.innerWidth;
	}
	if (document.compatMode == "CSS1Compat") {
		return document.documentElement.clientWidth;
	}
	if (document.body) {
		return document.body.clientWidth;
	}
	return window.undefined;
}
var gHideSelects = false;



	// check to see if this is IE version 6 or lower. hide select boxes if so

	// maybe they'll fix this in version 7?
var ieVerIndex = window.navigator.userAgent.indexOf("MSIE");

	// alert(parseInt(window.navigator.userAgent.substr(ieVerIndex+5,3), 10));

	// alert(window.navigator.appVersion);

	// alert(window.navigator.userAgent);

	// alert(getInternetExplorerVersion());
if (ieVerIndex > -1 && getInternetExplorerVersion() < 8) {
	gHideSelects = true;
}

	

	 // Returns the version of Windows Internet Explorer or a -1

	 // (indicating the use of another browser).
function getInternetExplorerVersion() {
	var rv = -1; // Return value assumes failure.
	if (navigator.appName == "Microsoft Internet Explorer") {
		var ua = navigator.userAgent;
		var re = new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");
		if (re.exec(ua) != null) {
			rv = parseFloat(RegExp.$1);
		}
	}
	return rv;
}
/**
 * 
 * Hides all drop down form select boxes on the screen so they do not appear
 * above the mask layer.
 * 
 * IE has a problem with wanted select form tags to always be the topmost
 * z-index or layer
 * 
 * Thanks for the code Scott!
 * 
 */
function hideSelectBoxes() {
	var x = document.getElementsByTagName("SELECT");
	for (i = 0; x && i < x.length; i++) {
		x[i].style.visibility = "hidden";
	}
}
/**
 * 
 * Makes all drop down form select boxes on the screen visible so they do not
 * reappear after the dialog is closed.
 * 
 * IE has a problem with wanted select form tags to always be the topmost
 * z-index or layer
 * 
 */
function displaySelectBoxes() {
	var x = document.getElementsByTagName("SELECT");
	for (i = 0; x && i < x.length; i++) {
		x[i].style.visibility = "visible";
	}
}


// ////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * 
 * @returns {base64InOut}
 */
function base64InOut(){
var base64 = this;
var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";  
var base64DecodeChars = new Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
-1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, 
-1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);  



base64.database = {
base64EncodeChars : base64EncodeChars,
base64DecodeChars : base64DecodeChars,
};

/**
 * base64解码
 * 
 * @param {Object}
 *            str
 */  
base64.base64decode = function (str){  
var c1, c2, c3, c4;  
var i, len, out;  
len = str.length;  
i = 0;  
out = "";  
while (i < len) {  
/* c1 */  
do {  
c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff];  
}  
while (i < len && c1 == -1);  
if (c1 == -1)   
break;  
/* c2 */  
do {  
c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff];  
}  
while (i < len && c2 == -1);  
if (c2 == -1)   
break;  
out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));  
/* c3 */  
do {  
c3 = str.charCodeAt(i++) & 0xff;  
if (c3 == 61)   
return out;  
c3 = base64DecodeChars[c3];  
}  
while (i < len && c3 == -1);  
if (c3 == -1)   
break;  
out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));  
/* c4 */  
do {  
c4 = str.charCodeAt(i++) & 0xff;  
if (c4 == 61)   
return out;  
c4 = base64DecodeChars[c4];  
}  
while (i < len && c4 == -1);  
if (c4 == -1)   
break;  
out += String.fromCharCode(((c3 & 0x03) << 6) | c4);  
}  
return out;  
}  

// 编码
base64.base64encode = function (str){  
var out, i, len;  
var c1, c2, c3;  
len = str.length;  
i = 0;  
out = "";  
while (i < len) {  
c1 = str.charCodeAt(i++) & 0xff;  
if (i == len) {  
out += base64EncodeChars.charAt(c1 >> 2);  
out += base64EncodeChars.charAt((c1 & 0x3) << 4);  
out += "==";  
break;  
}  
c2 = str.charCodeAt(i++);  
if (i == len) {  
out += base64EncodeChars.charAt(c1 >> 2);  
out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));  
out += base64EncodeChars.charAt((c2 & 0xF) << 2);  
out += "=";  
break;  
}  
c3 = str.charCodeAt(i++);  
out += base64EncodeChars.charAt(c1 >> 2);  
out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));  
out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >> 6));  
out += base64EncodeChars.charAt(c3 & 0x3F);  
}  
return out;  
};

// utf16转utf8
base64.utf16to8 = function(str){  
var out, i, len, c;  
out = "";  
len = str.length;  
for (i = 0; i < len; i++) {  
c = str.charCodeAt(i);  
if ((c >= 0x0001) && (c <= 0x007F)) {  
out += str.charAt(i);  
}  
else   
if (c > 0x07FF) {  
out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));  
out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));  
out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));  
}  
else {  
out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));  
out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));  
}  
}  
return out;  
};
// utf-8转utf-16
base64.utf8to16 = function(str){  
var out, i, len, c;  
var char2, char3;  
out = "";  
len = str.length;  
i = 0;  
while (i < len) {  
c = str.charCodeAt(i++);  
switch (c >> 4) {  
case 0:  
case 1:  
case 2:  
case 3:  
case 4:  
case 5:  
case 6:  
case 7:  
// 0xxxxxxx
out += str.charAt(i - 1);  
break;  
case 12:  
case 13:  
// 110x xxxx 10xx xxxx
char2 = str.charCodeAt(i++);  
out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));  
break;  
case 14:  
// 1110 xxxx10xx xxxx10xx xxxx
char2 = str.charCodeAt(i++);  
char3 = str.charCodeAt(i++);  
out += String.fromCharCode(((c & 0x0F) << 12) | ((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0));  
break;  
}  
}  
return out;  
};
};

base64InOut.prototype={
base64Encodes : function(data){
var me = this;
var s = me.base64encode(me.utf16to8(data));
return s;
},
base64Decodes : function(data){
var me = this;
var s = me.utf8to16(me.base64decode(data));
return s;
},
}

// //////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * 特殊字符反转义
 */  
function decodeHtml(str){

	if (str==null || str==undefined) 
	{ 
	return str;
	}
	    var result = str.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&#91;/g, "\[").replace(
	      /&#93;/g, "\]").replace(/&#40;/g, "\(").replace(/&#41;/g, "\)").replace(/&#43;/g,
	      "\\+").replace(/&#39;/g, "'").replace(/&quot;/g, "\"");

	    return result;
	}

/**
 * 特殊字符转义
 */  
function encodeHtml(str){

	if (str==null || str==undefined) 
	{ 
	return str;
	}
	    var result = str.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\[/g, "&#91;").replace(/\]/g, "&#93;").replace(/\(/g, "&#40;").replace(/\)/g, "&#41;").replace(/\+/g,"&#43;").replace(/'/g, "&#39;").replace(/"/g, "&quot;");

	    return result;
	}


/**
 * 弹窗 显示多文本内容
 * 
 * @argument width - int in pixels
 * @argument height - int in pixels
 * @argument title - 弹出层的标题(如果为空，则取引入页面<title></title>标签内的值)
 * @argument msgStr 内容
 * 
 * 注意：调用完ShowMoreRow();在后面加上setPopScroll('#showMoreRow');
 * 
 */

function ShowMoreRow(width, height, title, msgStr) {
	
	top.zcount=11000;
	if (null == title || "" == title) {
		title = document.title;
	}

	var tempPopupDivId =  "MoreRowFpIdpop";
	var shadowPopupDivId = "MoreRowFpIdshadow";
	if (height > $(window).height()) {
		height = $(window).height();
	}
	if (width > $(window).width()) {
		width = $(window).width();
	}
	var iTop = ($(window).height() - height) / 2;
	var iLeft = ($(window).width() - width) / 2;
	var iHeight = height+8;
	
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
			+ "		       <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closeMoreRowFpIdFp('"
			+ tempPopupDivId + "');\"></a>"
			+ "	 <div style=\"background-color:rgb(246,245,247);height:"+iHeight+"px;\" class=\"dialog-bd\"><div id=\"showMoreRow\" style=\"width:100%;background-color:#fff;height:"
			+ height + "px;\"><div style=\"margin:15px;\"> " + msgStr + "</div></div>"
			+ "		    </div></div>";

	divStr += "<div class=\"dialog-mask\" id=\"" + shadowPopupDivId
			+ "\" style=\"z-index:" + (top.zcount-1) + "\"></div>";
	top.zcount++;


	var tmpDiv = document.createElement("div");
	tmpDiv.innerHTML = divStr;

	var body = document.getElementsByTagName("body")[0];
	body.appendChild(tmpDiv);


	$("#" + shadowPopupDivId).show();
	$("#" + tempPopupDivId).draggable();
	
}
// 关闭窗口
function closeMoreRowFpIdFp(tempPopupDivId) {
	$("#" + tempPopupDivId).parent().remove();
}

// 弹窗根据当前选中的iframe调用里面定义好的方法
/**
 * @argument isFramesetMethod - 是否是frameset中的方法,如果true
 *           必须填入frameName，为false的时候frameName可以为空
 * @argument methodName - 调用方法的名字
 * @argument methodParames - 调用方法的参数值
 * @argument frameName 如果isFramesetMethod为true的时候iframe的name为必填项
 *           {isFramesetMethod: true/false, methodName:'xxx',
 *           methodParames:'xxx', frameName:'xxx'}
 */

function runMethod(obj){
	
	// 获取当前tab选中的iframe
	var curTab= top.$("#LAY_app_body").find(".layui-show")[0];
	var curIframe = $(curTab).children("iframe")[0];
	
	if(obj.isFramesetMethod){
		// 调用iframe中有frameset的frame中的方法
		if(obj.frameName && obj.frameName.length > 0){
			if(obj.methodParames){
				curIframe.contentWindow.frames[obj.frameName][obj.methodName](obj.methodParames);
				return;
			}
			curIframe.contentWindow.frames[obj.frameName][obj.methodName]();
			return;
		}
		layui.use('layer',function(){
			var layer = layui.layer;
			layer.msg("请填入需要调取方法的frame的name值!");
		});
	}
	else {
		// 调用iframe中的方法
		if(obj.methodParames){
			curIframe.contentWindow[obj.methodName](obj.methodParames);
			return;
		}
		curIframe.contentWindow[obj.methodName]();
		return;
	}
}

// layer弹窗与弹窗之间设值
/**
 * @argument tarId - 需要插入对应目标区域的id
 * @argument tarVal - 需要插入对应目标区域的值
 * @argument closeSelf - 插入完成以后是否自动关闭 {tarId:'xxx', tarVal:'xxx', closeSelf:
 *           true/false}
 */

function inValToSrcIframe(obj){
	var preLayerId =  $("input[name='preLayerId']").val();
	// 从顶层通过iframe id获取对应iframe
	var contentScope = top.window.frames[preLayerId];
	if(contentScope){
		contentScope.$("body").find("#"+obj.tarId).html(obj.tarVal);
		if(obj.closeSelf){
			var index = parent.layer.getFrameIndex(window.name);
			top.layer.close(index);
		}
		return;
	}
	layui.use('layer',function(){
		var layer = layui.layer;
		layer.msg("未获取到相应的iframe目标对象!");
	});
}

// 获取弹出源的dom对象
/*
 * @argument isFramesetMethod:true/false(默认值) 当前触发源的结构是否是frameset frame 结构。
 * @argument frameName:'xxx' 当isFramesetMethod为true时,要填入当前frame的name值。 @argument
 * type:document/window 如果调用的是对象，方法，属性 type:window; 如果调用的是DOM type:document
 * {isFramesetMethod: true/false, frameName:'xxx',type: document/window}
 */
function getSrcDom(obj){
	var preLayerId =  $("input[name='preLayerId']").val();
	var framesetParentLayerName = $("input[name='framesetParentLayerName']").val();
	
	// 触发源是layer弹窗
	if(preLayerId != "undefined"){
		preLayerId = "layui-layer-iframe"+preLayerId;
		// iframe中有frameset中有frame
		if(obj.isFramesetMethod){
			var l = top.window.frames[preLayerId].contentWindow;
			if(obj.type == 'window'){
				return l.frames[obj.frameName].contentWindow;
			}
			return l.frames[obj.frameName].document;
		}
		if(obj.type == 'window'){
			return top.window.frames[preLayerId];
			// return top.$("body").find("#"+preLayerId)[0].contentWindow;
			// //写法上的差异
		}
		return top.window.frames[preLayerId].document;
		// return top.$("body").find("#"+preLayerId)[0].contentDocument;
	}
	// 触发源不是layer弹窗
	else {
		if(framesetParentLayerName){
			// layer里面有frameset frame中触发
			var d = top.$("body").find("#"+framesetParentLayerName)[0].contentWindow.frames[obj.frameName];
			/*
			 * if(obj.type == 'window'){ return d; } return d.document;
			 */
			return d;
		}
		else {
			// 不是layer弹窗，只是iframe的情况下触发
			var curTab;
			var curIframe;
			try{
				curTab= top.$("#LAY_app_body").find(".layui-show")[0];
				curIframe = $(curTab).children("iframe")[0];
			}
			catch(err){
				try{
					// window.open()页面场景
					curIframe = top.$("#content").children("div").not(".hidecontent").find("iframe")[0];
				}
				catch(e){
					console.log(e);
				}
			}
			// iframe中有frameset中有frame
			if(obj.isFramesetMethod){
				var c =  curIframe.contentWindow.frames[obj.frameName];
				return c;
				/*
				 * if(obj.type == 'window'){ return c.contentWindow; } return
				 * c.document;
				 */
			}
			else {
				if(obj.type == 'window'){
					return curIframe.contentWindow;
				}
				return curIframe.contentDocument;
			}
			
		}
		
		
		
	} 
}

// 获取uuid
function getUuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the
														// clock_seq_hi_and_reserved
														// to 01
    s[8] = s[13] = s[18] = s[23] = "-";
 
    var uuid = s.join("");
    return uuid;
}

// 根据frameName 来执行框架里面的方法
/*
 * @argument mcIframeName 需要执行frame的name @argument methodName 需要执行方法的名字
 * @argument methodParames 需要执行方法的参数 @argument isFrameSet
 * 需要执行frame的父亲是frameset的父亲layer的iframe的name @argument isReloadTree true/false
 * 是否需要刷新tree @argument reloadFrameName tree所在frame的name @argument
 * reloadFrameMethodName tree所在frame需要执行的方法名字 @argument reloadFrameMethodParames
 * tree所在frame需要执行的方法的参数
 */
function runFrameMethod(jsonObject){
	var contentWindow;
	if(obj.frameName != undefined || obj.frameName != null || obj.frameName !=""){
		
		
		
		// layer弹窗中iframe包含frameset的情况下走这边
		if(obj.frameSetParentLayerName != undefined || obj.frameSetParentLayerName != null || obj.frameSetParentLayerName !=""){
			contentWindow = top.window.frames[obj.frameSetParentLayerName].contentWindow.frames[preLayerId];
			if(obj.methodParames != undefined || obj.methodParames != null || obj.methodParames !="" ){
				contentWindow[obj.methodName](obj.methodParames);
			}
			else {
				contentWindow[obj.methodName]();
			}
		}
		
		else {
			
			contentWindow = top.window.frames[obj.frameName];
			if(obj.methodParames != undefined || obj.methodParames != null || obj.methodParames !="" ){
				obj.methodParames = obj.methodParames.join(",");
				contentWindow[obj.methodName](obj.methodParames);
			}
			else {
				contentWindow[obj.methodName]();
			}
		}
	}
}

// 根据iframe name返回对应document / window
/*
 * @argument mcIframeName:'xxx'。 @argument type:document/window 如果调用的是对象，方法，属性
 * type:window; 如果调用的是DOM type:document {mcIframeName:'xxx', type:
 * document/window}
 */
function getSrcByIframeName(jsonObject){
	if(jsonObject.type == 'document'){
		return top.window.frames[jsonObject.mcIframeName].document;
	}
	return top.window.frames[jsonObject.mcIframeName];
}

// 关闭当前页面
function closePage(){
	try{
		var index = parent.layer.getFrameIndex(window.name);
		top.layer.close(index);
	}
	catch(err){
		console.log(err);
	}
}

// 刷新页面
function reloadPage(){
	
}

// 取当前窗口iframe的名字
function getCurIframeName(){
	return window.frameElement.name;
}

// frameset情况下关闭父级iframe
function closePopWin_ui() {
	var obj={"mcIframeName":window.parent.name,"type":"window"};
	var window_ =getSrcByIframeName(obj);
	window_.closePage();
}


// 给td中的input增加class
function inputFocus(){
	$(".mc-list-input-edit").each(function(index,ele){
		$(this).on("focus",function(){
			$(this).addClass("input-outline");
			$(this).parents("td").addClass("td-input");
		});
		$(this).on("blur",function(){
			$(this).removeClass("input-outline");
			$(this).parents("td").removeClass("td-input");
		});
	})
}

	//lay 弹出
	function alterWindows(msg,index,animType){
		if(!animType){
			animType = 6;
		}
		layer.msg(msg, {icon: index,anim: animType}); 
	}

	
	/**
	    * 调试按钮处理
	    * create by hzp 2019.4.9
	    * param:className(类全名称)
	    * param:codeId(类Id)
	    * param:tableName(关联表id)
	    * param:tableName(关联表id)
	    */
	function debugPageDetail(classNameValue,codeId,codeType){
		if(codeId==""||codeId==null||codeId=="null"){
			util.alert("该类未提交，不能调试");
			return false;
		}
		
		localStorage.codeType=codeType;
		var classNameclassLength=classNameValue.lastIndexOf(".");//获取类全名长度
		var packageName=classNameValue.substring(0,classNameclassLength);//包名称
		var className=classNameValue.substring(classNameclassLength+1,classNameValue.length);//类名
		localStorage.packageName=packageName;//包名存储本地
		localStorage.className=className;//类名存储本地
		localStorage.currentClassName=classNameValue;//类全面存储
		localStorage.beforeCurrentClassName=classNameValue;//通配符未改之前
		localStorage.codeId=codeId;//获取codeId
		$.ajax({
		    		type : "POST",
		    		dataType : "text",
		    		async:false, 
		    		url : "sys/pageDebugAction_checkOpen.ms",
		    		data:{
		    			"paraMap.codeType":codeType,
		    			"paraMap.callClassName":classNameValue
		    		},
		    		success : function(data) {
		    			if(data==""){
		    				return ;
		    			}
		    			var resultJson=ajaxJSONSold(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					var jsonText="['"+resultJson.msg+"']";
		           	 		util.initLangMap(jsonText);
		           	 		util.alert(util.getLangShow(resultJson.msg));
	    					return false;
	    				}else if(resultJson.isJson==false){
	    					window.location.href = "${path}sys/LoginAction_forLogin.ms";
	    				}
		    			data=JSON.parse(data);
		    			if(data.ajaxMap!=null&&data.ajaxMap.result=="true"){
		    				localStorage.currentClassName=data.ajaxMap.className;//类全面存储
		    				window.open("sys/pageDebugAction_pageDebug.ms");
		    			}else{
		    				if(data.ajaxMap.message=="otherOpen"){
		    					util.initLangMap('["其他用户调试中"]');
		    					util.alert(util.getLangShow("其他用户调试中"));
		    				}else{
		    					localStorage.currentClassName=data.ajaxMap.className;//类全面存储
		    					util.initLangMap('["断点界面已打开，请切换断点界面"]');
		    					util.alert(util.getLangShow("断点界面已打开，请切换断点界面"));
		    				}
		    			}
		    				
		    				
		    		},
		    		error : function(msg) {
		    			alert();
		    		}
		    	});
	}
	/**
	    * ajax 异常数据处理
	    * create by hzp 2019.4.9
	    * param:str(传入字符串)
	    */
	  
	function ajaxJSONSold(str) {
	var returnJson={result:true,msg:"",isJson:true};
    if (typeof str == 'string') {
        try {
            var obj=JSON.parse(str);
            if(typeof obj == 'object' && obj ){
           	 	if(obj.ajaxMap!=undefined&&obj.ajaxMap.status=="false"){
           	 		returnJson={result:false,msg:obj.ajaxMap.msg};
           	 	}
               return returnJson;
            }else{
               return returnJson;
            }

        } catch(e) {
        	returnJson.isJson=false;
            return returnJson;
        }
    }
    return returnJson;
}
	

/**
 * ***********************END************************
 * **************************************************
 */


