
/*************************************

JS文件说明：JS 验证方法

建立：liudg

时间：2012-01-09
扩展：可自行扩展该对象下的验证方法，命名规则类同JAVA

使用方法：
val.isBlank("aaaa");



**************************************/
function Validate() {
	var util = new Util();
	/* 对象是否存在，入参：表单对象 */
	this.isObj = function (obj) {
		if ("undefined" == typeof obj || obj == null || typeof (obj) == "string" || typeof (obj) == "number") {
			return false;
		}
		return true;
	};
	/* 判断是否为空串或空格串,入参：有value属性值的DOM对象或字符串 */
	this.isNull = function (obj) {
		if (!this.isObj(obj)) {
			if (typeof (obj) == "string" && obj.length > 0) {
				return false;
			}
			return true;
		}
		str = obj.value;
		if (str.length > 0) {
			return false;
		}
		return true;
	};
	this.isString = function (obj) {
		if (typeof (obj) == "string") {
			return true;
		} else {
			return false;
		}
	};
	this.isNumber = function (obj) {
		if (typeof (obj) == "number") {
			return true;
		} else {
			return false;
		}
	};
	/* 判断是否为空串,入参：有value属性值的DOM对象或字符串 */
	this.isBlank = function (obj) {		
		if(obj.type=='file' && obj.value==''){
			var file_val=$("input[name='"+obj.name+"']").attr("file_value");  
			if(file_val!=null && file_val!=''){
				return false;
			}else{
				return true;
			}
			
		}
		
		var str;
		if (Object.prototype.toString.call(obj) === "[object String]") {//字符串
			str = (obj);
		}else if(typeof obj == "number"){
			str = obj+"";
		}
		else {
			if (this.isObj(obj)) {
				str = (obj.value);
			} else {
				return true;
			}
		}
		if (util.trim(str).length > 0) {
			return false;
		}
		return true;
	};
	
	/* 整数或者为空 */
	this.isNumOrNull = function (str) {
		return this.isNull(str) || this.isInt(str);
	};
	
	/* 整数或者为空 */
	this.isIntOrNull = function (str) {
		if (!this.isObj(str)) {//判断对象是否存在
			return false;
		}
		return this.isNull(str) || this.isInt(str);
	};
	/* 必需是整数 */
	this.isInt = function (obj) {
		var str;
		if (this.isObj(obj)) {//对象
			str = (obj.value);
		} else {
			str = obj;
		}
		/*
		if(this.isString(str)){
			return false;
		}
		*/
		var reg = /^(-|\+)?\d+$/;
		return reg.test(str);
	};
	/* 小数或者为空 */
	this.isFloatOrNull = function (str) {
		if (!this.isObj(str)) {//判 断对象是否存在
			return false;
		}
		if (this.isInt(str)) {
			return true;
		}
		return this.isNull(str) || this.isFloat(str);
	};
	
	this.isNumOrEmpty = function(str){
		return this.isNull(str) || this.isInt(str);
	};
	/* 必须是数字字符串加逗号==1,2,3 */
	this.isNumComma = function(str){
		var reg = /^(\d+[,])*(\d+)$/;
		if(str==""){
			return false;
		}
		if(!reg.exec(str)){
			return false;
		}
		return true;
	};
	/* 必须是数字字符串加逗号或者为空==1,2,3 */
	this.isNumCommaOrNull = function(str){
		var reg = /^(\d+[,])*(\d+)$/;
		if(str==""){
			return true;
		}
		if(!reg.exec(str)){
			return false;
		}
		return true;
	};
	
	/* 必需是百分数 */
	this.isPercent = function(str){
		var reg = /^([1-9]{1}[0-9]{0,1}|0|100)(.\d{1,2}){0,1}%$/;
		if(!reg.test(str)){
			return false;
		}
		return true;
	};
	
	/* 必需是百分数或者绝对值 */
	this.isPercentOrNum = function(str){
		var isPercent = /^([1-9]{1}[0-9]{0,1}|0|100)(.\d{1,2}){0,1}%$/;
		var num = /^(-|\+)?\d+$/;
		if(isPercent.test(str)||num.test(str)){
			return true;
		}
		return false;
	};
	
	/* 必需是小数 */
	this.isFloat = function (str) {
		if (this.isInt(str)) {
			return true;
		}
		var reg = /^(-|\+)?\d+\.\d*$/;
		return reg.test(str);
	};
	/* 判断字符全部由a-Z或者是A-Z的字字母组成  */
	this.isLetter = function (str) {
		if (!this.isObj(str)) {
			return false;
		}
		str = util.trim(str);
		var reg = /^[a-zA-Z]+$/g;
		return reg.test(str);
	};
	/* 判断字符由字母和数字组成 */
	this.isLetterOrNum = function (str) {
		if (!this.isObj(str)) {
			return false;
		}
		str = util.trim(str);
		var reg = /^[0-9a-zA-Z]+$/g;
		return reg.test(str);
	};
	/* email的判断 */
	this.isMail = function (mail) {
		return (new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
	};
	/* 电话号码的验证 */
	this.isPhone = function (str) {
		var reg = /(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
		return (reg.test(str));
	};
	/* 验证IPV4地址 */
	this.isIp = function (ip) {
		var check = function (v) {
			try {
				return (v <= 255 && v >= 0);
			}
			catch (x) {
				return false;
			}
		};
		var re = ip.split(".");
		return (re.length == 4) ? (check(re[0]) && check(re[1]) && check(re[2]) && check(re[3])) : false;
	};
	/* 手机号码的验证-(只做简单的11位数字验证) */
	this.isMobilePhone = function (num) {
		if (isNaN(num)) {
			return false;
		}
		var len = num.length;
		if (len != 11) {
			return false;
		}
		return true;
	};
	/* 身份证的验证  */
	this.isIdCardNo = function (num) {
		var len = num.length;
		if (len == 15) {
			if (isNaN(num)) {
				return false;
			}
			re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
		} else {
			if (len == 18) {//如12342119080909198X 12342119080909198a
				if (isNaN(num.substring(0, 17))) {
					return false;
				}
				re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})((\d{4})|\d{3}[a-zA-Z])$/);
			} else {
				util.alert("\u8f93\u5165\u7684\u6570\u5b57\u4f4d\u6570\u4e0d\u5bf9\uff01");
				return false;
			}
		}
		var a = num.match(re);
		if (a != null) {
			if (len == 15) {
				var D = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
				var B = D.getYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
			} else {
				var D = new Date(a[3] + "/" + a[4] + "/" + a[5]);
				var B = D.getFullYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
			}
			if (!B) {
				util.alert("\u8f93\u5165\u7684\u8eab\u4efd\u8bc1\u53f7 " + a[0] + " \u91cc\u51fa\u751f\u65e5\u671f\u4e0d\u5bf9\uff01");
				return false;
			}
		}
		return true;
	};
	/**
	 * 检查输入的URL地址是否正确
	 * 输入:str  字符串
	 *  返回:true 或 flase; true表示格式正确
	 */
	this.isURL = function (str) {
		if (str.match(/(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i) == null) {
			return false;
		} else {
			return true;
		}
	};
	/* 判断入参是否为空(提示文字的ID必需跟在对象ID后加_title)
	 * <div class="title" style="display: none;" id="keeper_title">
	 *    <dict:lang value="密码" />
	 * </div> 
	   <input type="password" id="keeper" name="keeper" maxlength="32"
	    class="borderGray" value="1"   placeholder="密码">
	 * 
	 *  */
	this.valNull = function () {
		var n = arguments.length;
		for (var i = 0; i < arguments.length; i++) {
			if (this.isBlank(arguments[i])) {
				util.alert(document.getElementById(arguments[i].id + "_title").innerHTML + " " + _GLO_VALIDATE_NULL_MSG,val.setObjFocuse,arguments[i]);
				return false;
			}
		}
		return true;
	};
	
	this.setObjFocuse = function (obj){
		if(null == obj){return;}
		obj.focus();
	};
	/* 判断入参是否为空 */
	/* 使用方法
		var objs = new Array();
		var msgs = new Array();
		objs.push(document.login_form.userDto_loginName);
		objs.push(document.login_form.userDto_pw);
		objs.push(document.login_form.validate_code);
		msgs.push("登录名称");
		msgs.push("登录密码");
		msgs.push("验证码");
		if(!val.valOjbsNull(objs,msgs)){
			return false;
		}
*/
	this.valOjbsNull = function (objs, msgs) {
		if (null == objs) {
			return false;
		}
		for (var i = 0; i < objs.length; i++) {
			if (this.isBlank(objs[i])) {
				util.alert(msgs[i] + " " + _GLO_VALIDATE_NULL_MSG);
				objs[i].focus();
				return false;
			}
		}
		return true;
	};
	/*-- 单行文本框失去焦点非空验证  */
	this.valNullDataOnblur = function (obj) {
		if($(obj).hasClass("_VAL_NULL")){
			if (!obj.disabled && val.isBlank(obj)) {
				//$(obj).parent().parent().click();
				_alertValMsgOnblur(obj, _GLO_VALIDATE_NULL_MSG2);
			}
		}
	};
	/*-- 单行文本框失去焦点正则验证  */
	this.valOjbsDataOnblur = function(obj) {
		if($(obj).hasClass("_VAL_OjbsData")){
			if (!obj.disabled && !validateObject(obj))
			{
				//$(this).parent().parent().click();
				_alertValMsgOnblur(obj, obj.validateJson.UI_RULE_TIP);
			}
		}
	}
	function _alertValMsgOnblur(obj,msg){
		var _alertValMsgCount = 0;
		var isShow = $("#_alertValMsgDiv").css("display");
		var offset = $(obj).offset(); //  计算文本框的偏移量
		var location = _getScrollOnblur();//新加的代码，计算滚动条的位置
		$("#_alertValMsgDiv").css("left", "0px");
		$("#_alertValMsgDiv").css("top", "0px");
		$("#_alertValMsgDiv").css("z-index", "1330");
		if(_alertValMsgCount == 0){
			$("#_alertValMsgDiv").offset({
				top : offset.top + location.top + $(obj).height() + 5,
				left : offset.left + location.left
			});
		}else{
			$("#_alertValMsgDiv").offset({
				top : offset.top +  $(obj).height() + 5,
				left : offset.left
			});
		}
		//重新设置弹出框的偏移量，根据文本框的位置和滚动条的位置
		$("#_alertValMsgDiv").html(msg);
		$("#_alertValMsgDiv").show();//显示弹出框
		setTimeout(function(){
			_alertValMsgCount--;
			if (_alertValMsgCount < 1) {
				$("#_alertValMsgDiv").hide();
			}
		},3000);
		//obj.focus();
		_alertValMsgCount++;
	};
	function _getScrollOnblur() { //计算滚动条的位置
		var t, l;
		if (document.documentElement && document.documentElement.scrollTop) {
			t = document.documentElement.scrollTop;
			l = document.documentElement.scrollLeft;
		} else if (document.body) {
			t = document.body.scrollTop;
			l = document.body.scrollLeft;
		} else {
			t = 0;
			l = 0;
		}
		return {
			top : t,
			left : l
		};
	}
	/*-- 公用空值验证方法 */
	this.valNullData = function () {
		var pass = true;
		if(arguments.length > 0) {//当有传参数时，验证指定的参数，参数为jquery选择符
			var arr = Array.prototype.slice.apply(arguments);
			$(arr.join(",")).each(function (seq) {
				if (!this.disabled && val.isBlank(this)) {
					$(this).parent().parent().click();
					_alertValMsg(this, _GLO_VALIDATE_NULL_MSG2);
					pass = false;
					return false;
				}
			});
		}else {
			$("._VAL_NULL").each(function (seq) {
				if("hidden"==this.type){return;}//hidden字段不参与验证
				if (!this.disabled && val.isBlank(this)) {
					$(this).parent().parent().click();
					_alertValMsg(this, _GLO_VALIDATE_NULL_MSG2);
					pass = false;
					return false;
				}
			});
		}
		
		return pass;
	};
	/*-- 公用数据库字符集长度验证方法 */
	this.valDataBaseSetData = function () {
		var pass = true;
			$("._VAL_DATABASE").each(function (seq) {
				var maxlength=$(this).attr("maxlength");
				if(maxlength==undefined||maxlength==null){return}
				if("hidden"==this.type){return;}//hidden字段不参与验证
				if (!this.disabled && ! _check_length(this,maxlength)) {
					$(this).parent().parent().click();
					_alertValMsg(this, _GLO_DATABASE_SET_MSG);
					pass = false;
					return false;
				}
			});
		return pass;
	};
	/*根据数据库字符集长度全局变量_GLO_DATABASE_SET 来判断是否符合maxlength使用条件 */
	function _check_length(keyObj,maxlength){//
		var length=0;
		for (var i=0;i<keyObj.value.length;i++){
			var key=keyObj.value.charCodeAt(i);
			if(32<key&&key<127){
				length++
			}else{
				length+=parseInt(_GLO_DATABASE_SET);
			}
			if(length>maxlength){
				return false;
			}
		}
		return true;
	}
	/*-- 公用数值验证方法 */
	this.valNaNData = function () {
		var pass = true;
		$("._VAL_NaN").each(function (seq) {
			if (!this.disabled && isNaN(this.value)) {
				$(this).parent().parent().click();
				_alertValMsg(this, _GLO_VALIDATE_NAN_MSG);
				pass = false;
				return false;
			}
		});
		return pass;
	};
	this.valOjbsData = function() {
		var pass = true;
		$("._VAL_OjbsData").each(function (seq){
			if(typeof this.validateJson != "undefined")
			{
				if (!this.disabled && !validateObject(this))
				{
					$(this).parent().parent().click();
					_alertValMsg(this, this.validateJson.UI_RULE_TIP);
					pass = false;
					return false;
				}
			}
		});
		return pass;
	}
}
var val = new Validate();

function validateObject(targetObject)
{
	if(typeof targetObject.validateJson != "undefined")
	{
		var rule = null;
		var left = null;
		var right = null;
		var regex = null;
		var tip = null;
		for(var key in targetObject.validateJson)
		{
			if(key == "UI_RULE")
			{
				rule = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_LEFT")
			{
				left = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_RIGHT")
			{
				right = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_REGEX")
			{
				regex = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_TIP")
			{
				tip = targetObject.validateJson[key];
			}			
		}	
		if(rule == 'letters')
		{
			return true;
		}
		else if(rule == 'capital')
		{
			return true;
		}
		else if(rule == 'lower_case')
		{
			return true;
		}
		else if(rule == 'number')
		{
			if(left != null)
			{
				if(parseFloat(left) > parseFloat(targetObject.value))
				{
					return false;
				}
			}
			return true;
		}
		else if(rule == 'regex')
		{     // 正则不可以加斜杠
			if(!targetObject.value.match(regex))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		else 
		{
			return true;
		}
	}
}


