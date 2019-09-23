<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addBefore(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
<table class="basic-table"><input type="hidden" name="formIds" value="611e907a36804398a4e6714386f8c8ca">
<tbody>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_GROUP" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_GROUP" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_GROUP}" />
</td><td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_START" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_START" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_START}" />
</td></tr>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_END" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_END" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_END}" />
</td><td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_REST_TOTAL" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_REST_TOTAL" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_REST_TOTAL}" />
</td></tr>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_OVER_FALG" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_OVER_FALG" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_OVER_FALG}" />
</td><td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_TIME" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CALW_TIME" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CALW_TIME}" />
</td></tr>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CAL_ID" formId = "611e907a36804398a4e6714386f8c8ca" />
</td>
<td class="dec">
<bu:ui colNo="CAL_ID" formId = "611e907a36804398a4e6714386f8c8ca" value="%{CAL_ID}" />
</td></tbody>
</table>
<div class="js-tab">
<div id="hd">
<ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
<li id="title1" class="current tabList" tab="tab1">
<a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">
休息时间</span>
</a>
</li>
</ul>
</div>
<div class="topTab">
<div class="marginButtom">
<button type="button" onclick="addAssociatedData()"><i class="ico ico-save"></i>新增</button>
<button type="button" onclick="updateAssociatedData()"><i class="ico ico-sc-new-add"></i>修改</button>
<button type="button" onclick="delAssociatedData()"><i class="ico ico-sc-new-add"></i>删除</button>
</div>
<div class="tabDiv tab1">
 <div class="panel datagrid datagrid-div1"  id="6dc19bb506fc4161892b75dac2eeebc6">
 <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
<table  class="datagrid-htable fixedTable datagrid-div6">
<tbody>
<tr class="datagrid-header-row"><td class="datagrid-cell">
工作时间ID</td>
<td class="datagrid-cell">
休息时长（H）</td>
<td class="datagrid-cell">
结束时间</td>
<td class="datagrid-cell">
开始时间</td>
  </tr>
  </tbody>
  </table>
  </div>
  </div>
<div class="datagrid-body datagrid-div3">
<table class="datagrid-btable fixedTable datagrid-div6" >
<tbody class="datagrid-btbody" >
 <tr class="datagrid-row tabTable hideTr">
<td class="datagrid-cell hideTd">
<bu:ui colNo="CALW_ID" formId="6dc19bb506fc4161892b75dac2eeebc6" value="%{CALW_ID}" />
</td>
<td class="datagrid-cell hideTd">
<bu:ui colNo="CALR_REST" formId="6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_REST}" />
</td>
<td class="datagrid-cell hideTd">
<bu:ui colNo="CALR_END" formId="6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_END}" />
</td>
<td class="datagrid-cell hideTd">
<bu:ui colNo="CALR_START" formId="6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_START}" />
</td>
  </tr>
  </tbody>
  </table>
  </div>
  </div>
  </div>
 </div>
<div>
<div class="optn associated">
<button type="button" onclick="addAssociatedForm(this);"><i class="ico ico-save"></i>保存</button><button type="button" onclick="hideAssociatedForm(this);"><i class="ico ico-cancel"></i>取消</button></div><form action="" id="current1">
<div  class="black_overlay tabTable back"></div><div class="tabTable white_content addFCWT">
<table class="basic-table">
<input type="hidden" name="formIds" value="6dc19bb506fc4161892b75dac2eeebc6">
<tbody>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALW_ID" formId = "6dc19bb506fc4161892b75dac2eeebc6" />
</td>
<td class="dec">
<bu:ui colNo="CALW_ID" formId = "6dc19bb506fc4161892b75dac2eeebc6" value="%{CALW_ID}" />
</td><td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALR_REST" formId = "6dc19bb506fc4161892b75dac2eeebc6" />
</td>
<td class="dec">
<bu:ui colNo="CALR_REST" formId = "6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_REST}" />
</td></tr>
<tr>
<td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALR_END" formId = "6dc19bb506fc4161892b75dac2eeebc6" />
</td>
<td class="dec">
<bu:ui colNo="CALR_END" formId = "6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_END}" />
</td><td class="name">
<span class="dot">
*</span>
<bu:uitn colNo="CALR_START" formId = "6dc19bb506fc4161892b75dac2eeebc6" />
</td>
<td class="dec">
<bu:ui colNo="CALR_START" formId = "6dc19bb506fc4161892b75dac2eeebc6" value="%{CALR_START}" />
</td></tr>
</tbody>
</table>
</div>
</form></div>

									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	var form = {
			// 序列化表单成json对象 
			serialize : function (form) {
				var json = {};
				form = form || $('body');
				if(!form) {
					return json;
				}
				var groups = form.find('div[fieldset]'), jsonGroup = this
					._serializeGroups(groups), inputs = form
					.find('input[type!=button][type!=reset][type!=submit][type!=image],select,textarea'), json = this
					._serializeInputs(inputs);
		
				for (var key in jsonGroup) {
					json[key] = jsonGroup[key];
				}
				return json;
			},
			/**
			 * 在分组中查找 fieldset (如：fieldset="user")开头的数据域。
			 *
			 * @method _serializeGroups
			 * @param {Array} groups 输入框分组容器集合
			 * @return {Object} json 对象 {key:value,...}
			 */
			_serializeGroups : function (groups) {
				var json = {};
				if(!groups) {
					return json;
				}
				for (var i = groups.length - 1; i >= 0; i--) {
					var group = $(groups[i]), key = group.attr('fieldset');
					if(!key) {
						continue;
					}
					var inputs = group
						.find('input[type!=button][type!=reset][type!=submit],select,textarea');
					json[key] = this._serializeInputs(inputs);
					// 添加序列化标记
					inputs.addClass('_isSerialized');
				}
				return json;
			},
			/**
			 * 将输入控件集合序列化成对象， 名称或编号作为键，value属性作为值。
			 *
			 * @method _serializeInputs
			 * @param {Array} inputs input/select/textarea的对象集合
			 * @return {Object} json 对象 {key:value,...}
			 */
			_serializeInputs : function (inputs) {
				var json = {};
				if(!inputs) {
					return json;
				}
				for (var i = inputs.length - 1; i >= 0; i--) {
					var input = $(inputs[i]), type = input.attr('type');
					if(type) {
						type = type.toLowerCase();
					}
					var tagName = input.get(0).tagName, id = input.attr('id'), name = input
						.attr('name'), value = null;

					// 判断输入框是否已经序列化过
					if(input.hasClass('_isSerialized') || (typeof id == 'undefined' && typeof name == 'undefined')) {
						continue;
					}

					// input输入标签
					if(tagName == 'INPUT' && type) {
						switch (type) {
							case 'checkbox':
							{
								value = input.is(':checked');
							}
								break;
							case 'radio':
							{
								if(input.is(':checked')) {
									value = input.attr('value');
								} else {
									continue;
								}
							}
								break;
							default:
							{
								value = input.val();
							}
						}
					} else {
						// 非input输入标签，如：select,textarea
						value = input.val();
					}

					json[name || id] = value;
					// 清除序列化标记
					input.removeClass('_isSerialized');
				}
				return json;
			},
			/**
			 * 填充表单内容：将json数据形式数据填充到表单内，最多解析两层json结构。
			 *
			 * @method deserialize
			 * @param {Object} frm jQuery表单对象（或其它容器标签对象，如：div）
			 * @param {Object} json 序列化好的json数据对象，最多只包含两层嵌套
			 */
			deserialize : function(form,json){
				frm = frm || $('body');
				if(!frm || !json) {
					return this;
				}

				// objects缓存json第一层数据对象;
				// groups缓存json嵌套层数据（第二层），将首先被赋值，以避免覆盖
				var objects = {}, groups = {};

				// 数据分组
				for (var key in json) {
					var value = json[key];
					if($.isPlainObject(value)) {
						groups[key] = value;
					} else {
						objects[key] = value;
					}
				}

				var _deserializeInputs = this._deserializeInputs, _filterInputs = this._filterInputs, _findInputs = this._findInputs;

				// 填充嵌套层数据
				for (var key in groups) {
					var json = groups[key], div = frm.find('div[fieldset="' + key
						+ '"]');
					if(!div.length) {
						continue;
					}
					var inputs = _filterInputs(div);
					if(!inputs.length) {
						continue;
					}
					for (var k in json) {
						var val = json[k], input = _findInputs(inputs, k);
						_deserializeInputs(input, val);
					}
				}

				// 填充第一层数据
				var inputs = _filterInputs(frm);
				for (var key in objects) {
					var value = objects[key], input = _findInputs(inputs, key);
					_deserializeInputs(input, value);
				}

				inputs.filter('._isSerialized').removeClass('_isSerialized');
				return this;
			},
			/**
			 * 将值填充到输入标签里面。
			 *
			 * @method _deserializeInputs
			 * @param {Array} inputs 输入标签集合
			 * @param {String/Number} value 值
			 * @return {Object} iTsai.form
			 */
			_deserializeInputs : function (inputs, value) {
				if(!inputs && value == null) {
					return this;
				}

				for (var i = inputs.length - 1; i >= 0; i--) {
					var input = $(inputs[i]);
					// 判断输入框是否已经序列化过
					if(input.hasClass('_isSerialized')) {
						continue;
					}
					var type = input.attr('type');
					if(type) {
						type = type.toLowerCase();
					}
					if(type) {
						switch (type) {
							case 'checkbox':
							{
								input.attr('checked', value);
							}
								break;

							case 'radio':
							{
								input.each(function (i) {
									var thiz = $(this);
									if(thiz.attr('value') == value) {
										thiz.attr('checked', true);
									}
								});
							}
								break;
							default:
							{
								input.val(value);
							}
						}
					} else {
						input.val(value);
					}
					input.addClass('_isSerialized');
				}
				return this;
			},
	};
	
	// 获取不重复随机数
	function guid(){
		return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c){
			var r = Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
			return v.toString(16);
		});
	}
	
	var cont = {
			clickSource:'add'
	};
	
	// 弹出新增赋值 
	function addAssociatedForm(thisObj){
		var uuid = guid();
		//var obj = $(thisObj).parent().nextUntil(".addFCWT");
		var tab = $(".current").attr("tab");
		var formData = form.serialize($("#current"+tab.replace(/[^0-9]/ig,"")));
		if(cont.clickSource=='add'){
			var _this = $("."+tab);
			_this.children(".datagrid-btbody").append(_this.children(".hideTr").clone());
			var lastTr = _this.children(".datagrid-btbody").children("tr:last-child");
			lastTr.removeClass("hideTr");
			lastTr.attr("uuid",uuid);
			lastTr.wrap("<form id="+uuid+" action=''></form>");
			form.deserialize($("#"+uuid),formData);
			$("#"+uuid).children("td").children().attr("disabled","disabled");
		}else{
			var uuid = $(".datagrid-selected").attr("uuid");
			form.deserialize($("#"+uuid),formData);
		}
		hideAssociatedForm(obj);
	};
	
	// 隐藏关联表单
	function hideAssociatedForm(thisObj){
		$(".currentContent").next().children(".addFCWT,.back").css("display","none");
		
	}
	
	// 新增按钮
	function addAssociatedData(){
		if($(".associated").length>0){// 存在关联表单并且为弹出新增
			$(".currentContent").next().children(".addFCWT,.back").css("display","block");
			$('.chosen-container').css("width","157px");
			cont.clickSource='add';
		}else{// 存在关联表单并且为行新增
			var tab = $(".current").attr("tab");
			var _this = $(".tab"+tab);
			_this.children(".datagrid-btbody").append(_this.children(".hideTr").clone());
			_this.children(".datagrid-btbody").children("tr:last-child").attr("uuid",guid());
		}
	};
	
	// 修改关联表单数据
	function updateAssociatedData(){
		var selected = $(".currentContent").next().children(" table tr").hasClass('datagrid-selected');
		if(!selected){
			utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
			return;
		};
		var tab = $(".current").attr("tab");
		var uuid = $(".datagrid-selected").attr("uuid");
		var formData = form.serialize($("#"+uuid));
		form.deserialize($("#current"+tab),formData);
		$(".currentContent").next().children(".addFCWT,.back").css("display","block");
		cont.clickSource='update';
	}
	
	// 删除关联表单新增的数据
	function delAssociatedData(){
		var selected = $(".currentContent").next().children(" table tr").hasClass('datagrid-selected');
		if(!selected){
			utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
			return;
		};
		var tab = $(".current").attr("tab");
		var uuid = $(".datagrid-selected").attr("uuid");
		$("#uuid").remove();
	}
	
	
	
   isBlank = function (obj) {
		var str;
		if (Object.prototype.toString.call(obj) === "[object String]") {//字符串
			str = (obj);
		} else {
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
	
	$(".tabList").click(function(){
		$(this).siblings().removeClass("current");
		$(this).addClass("current");
		var tab = $(this).attr("tab");
		$(".tabDiv").hide().removeClass("currentContent");
		$("."+tab).addClass("currentContent").show();
		
	});
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
