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
	<style type="text/css">
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			z-index: 1001;
			opacity:0.5;
			filter:alpha(opacity=88);	
		}
		.white_content{
			display: none;
			position: absolute;
			
			top: -1px;
    			left: 0;
			width: 97%;
			height: 84%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		.white_contents{
			display: none;
			position: absolute;
			top: 15%;
			left: 2%;
			width: 94%;
			height: 65%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		.extend-btn button .ico-kl-new-add{
		 width: 15px;
		 height: 15px;
		 margin-right: 5px;
		 margin-bottom: 3px; 
		 background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat; 
		}
		.extend-btn button:hover .ico-kl-new-add{
		 width: 15px;
		 height: 15px;
		 margin-right: 5px;
		 margin-bottom: 3px; 
		 background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat; 
		}
		.extend-btn button .ico-sc-new-add{
		 width: 15px;
		 height: 15px;
		 margin-right: 5px;
		 margin-bottom: 3px; 
		 background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat; 
		}
		.extend-btn button:hover .ico-sc-new-add{
		 width: 15px;
		 height: 15px;
		 margin-right: 5px;
		 margin-bottom: 3px; 
		 background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat; 
		}
	</style>
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
			<div class="bd"><%--
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										--%>
										<div id="formDiv">
										<input type="hidden"  name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:set name="_$type" value="'add'" />
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>

										</div>
									<%--</form>
			--%></div>
		
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
		//$(".hideTr").addClass("tabTable");
	}//初始化方法
	
	var form = {
			// 序列化表单成json对象 
			serialize : function (frm) {
				var json = {};
				frm = frm || $('body');
				if(!frm) {
					return json;
				}
				var groups = frm.find('div[fieldset]'), jsonGroup = this
					._serializeGroups(groups), inputs = frm
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
			 * 查找符合条件的输入标签。
			 *
			 * @method _findInputs
			 * @param {Array} inputs jQueery输入标签数组
			 * @param {String} key 查询关键字
			 * @return {Array} inputs jQuery对象数组
			 */
			_findInputs : function (inputs, key) {
				return $(inputs.filter("input[name='" + key + "'],input[id='" + key
					+ "'],textarea[name='" + key + "'],textarea[id='" + key+ "'],select[name='" + key + "'],select[id='" + key + "']"));
			},
			/**
			 * 获取合法的输入标签。
			 *
			 * @method _filterInputs
			 * @param {Object} container jQuery对象，标签容器
			 * @return {Array} inputs jQuery对象数组
			 */
			_filterInputs : function (container) {
				return $(container
					.find('input[type!=button][type!=reset][type!=submit][type!=image][type!=file],select,textarea'));
			},
			/**
			 * 填充表单内容：将json数据形式数据填充到表单内，最多解析两层json结构。
			 *
			 * @method deserialize
			 * @param {Object} frm jQuery表单对象（或其它容器标签对象，如：div）
			 * @param {Object} json 序列化好的json数据对象，最多只包含两层嵌套
			 */
			deserialize : function(frm,json,uuid){
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
	
	function addBefore(thisObj){
		$(".datagrid-btbody").find("tr:first-child").find("td").children().removeClass("_VAL_NULL _VAL_NaN _VAL_OjbsData");
		if($("#addForm").length==0){
			$("#formDiv").wrap("<form id='addForm' action='${path}buss/bussModel_addComm.ms' method='post' <bu:formet exeid='%{exeid}'/> target='submitFrame' ></form>");
		};
		add(thisObj);
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
		var tab = $(".current").attr("tab");
		var formData = form.serialize($("#current"+tab.replace(/[^0-9]/ig,"")));
		if(cont.clickSource=='add'){
			var _this = $("."+tab);
			_this.find(".datagrid-btbody").append(_this.find(".hideTr").clone());
			var lastTr = _this.find(".datagrid-btbody").find("tr:last-child");
			lastTr.removeClass("hideTr").removeClass("tabTable").children().removeClass("hideTd");
			lastTr.attr("uuid",uuid);
			lastTr.wrap("<form id="+uuid+" action=''></form>");
			form.deserialize($("#"+uuid),formData,uuid);
			lastTr.unwrap();
			setChosenWidth(lastTr);
			idDistinct(lastTr);
			replaceSelect(lastTr);
		}else{
			var selectedTr = $(".currentContent .datagrid-btbody").find(".datagrid-selected");
			var uuid = selectedTr.attr("uuid");
			selectedTr.wrap("<form id="+uuid+" action=''></form>");
			form.deserialize($("#"+uuid),formData);
			selectedTr.unwrap();
		}
		hideAssociatedForm(obj);
	};
	
	// 批量添加时候防止控件id重复
	function idDistinct(lastTr){
		var TrSize = lastTr.parent().children().length-1;
		lastTr.find("td").children().each(function(seq){
			var id = $(this).attr("id");//paraMap0_TASK_NAME
			var name = $(this).attr("name");//paraMap0@0#TASK_NAME
			var editName = $(this).attr("editName");//paraMap0@0#TASK_NAME
			if(id){
				$(this).attr("id",id.replace("paraMap0","paraMap"+TrSize));
			}
			if(name){
				$(this).attr("name",name.replace("0@0#","0@"+TrSize+"#"));
			};
			if(editName){
				$(this).attr("editName",editName.replace("0@0#","0@"+TrSize+"#"));
			};
		});
	}
	
	// 隐藏关联表单
	function hideAssociatedForm(thisObj){
		var tab = $(".current").attr("tab");
		$("#current"+tab.replace(/[^0-9]/ig,"")+" :input").not(":button,:submit,:reset,:hidden").val("").removeAttr("checked").remove("selected");
		$(".currentContent").next().find(".addFCWT,.back").css("display","none");
		
	}
	
	// 新增按钮
	function addAssociatedData(){
		if($(".associated").length>0){// 存在关联表单并且为弹出新增
			$(".currentContent").next().children(".addFCWT,.back").css("display","block");
			$(".white_content").find(".chosen-container").css("width","230px");
			cont.clickSource='add';
		}else{// 存在关联表单并且为行新增
			var tab = $(".current").attr("tab");
			var _this = $("."+tab);
			_this.find(".datagrid-btbody").append(_this.find(".hideTr").clone());
			var lastTr = _this.find(".datagrid-btbody").find("tr:last-child");
			lastTr.attr("uuid",guid());
			lastTr.removeClass("hideTr").removeClass("tabTable").children().removeClass("hideTd");
			setChosenWidth(lastTr);
			idDistinct(lastTr);
			replaceSelect(lastTr);
		};
	};
	
	function replaceSelect(lastTr){
		lastTr.find(".dept_select").each(function(seq){
			var disabled = $(this).attr("disabled");
			if(!disabled){
				var thisName = $(this).attr("name");
				var thisId = $(this).attr("id");
				var $_par = $(this).parent();
				var arr = [];
				arr.push("<select class='dept_select' autocomplete='off' id="+thisId+" name="+thisName+"");
				arr.push("<option>--请选择--</option>");
				$(this).find("option").each(function(seq){
					var val = $(this).attr("value");
					var text = $(this).text();
					arr.push("<option value="+val+">"+text+"</option>")
				});
				arr.push("</select>");
				$_par.children().remove();
				$_par.append(arr.join(""));
				$_par.find(".dept_select").chosen();
			};
		});
		//setChosen();//设置下拉框样式
		lastTr.find(".chosen-container").css("width","100%");
		setWidth(lastTr);
	}
	
	 function setWidth(lastTr) {
		 lastTr.find(".datagrid-cell-1").children().each(function(seq){
			 	var icoData = $(this).hasClass("ico-date-h");
			 	var icoSearch = $(this).hasClass("ico-search-input");
			 	if(icoData||icoSearch){
			 		$(this).css({"left":"90%","top":"6px"});
			 	}else{
			 		$(this).css("width","100%");
			 	};
		});
	}
	 
	function setChosenWidth(lastTr){
		var choosen = lastTr.find(".chosen-container");
		if(choosen.length>0 && choosen.width()==0){
			choosen.width(150);
		};
	};
	
	// 修改关联表单数据
	function updateAssociatedData(){
		var currentTr = $(".currentContent").find(" .datagrid-btbody tr");
	    var currentSelectedTr = $(".currentContent .datagrid-btbody").find(".datagrid-selected");
		var selected = currentTr.hasClass('datagrid-selected');
		if(!selected){
			utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
			return;
		};
		var tab = $(".current").attr("tab");
		var uuid = currentSelectedTr.attr("uuid");
		currentSelectedTr.wrap("<form id="+uuid+" action=''></form>");
		var formData = form.serialize($("#"+uuid));
		setKey(formData,$("#current"+tab.replace(/[^0-9]/ig,"")));
		form.deserialize($("#current"+tab.replace(/[^0-9]/ig,"")),formData);
		$(".currentContent").next().children(".addFCWT,.back").css("display","block");
		currentSelectedTr.unwrap();
		cont.clickSource='update';
	}
	
	function setKey(formData,thisFrom){
		for(var key in formData){
			if(key){
				var num = key.substring(9,10);
				thisFrom.find(".dec").children().each(function(seq){
					var id = $(this).attr("id");//paraMap0_TASK_NAME
					var name = $(this).attr("name");//paraMap0@0#TASK_NAME
					var editName = $(this).attr("editName");//paraMap0@0#TASK_NAME
					if(id){
						$(this).attr("id",id.replace("paraMap0","paraMap"+num));
					}
					if(name){
						$(this).attr("name",name.replace("0@0#","0@"+num+"#"));
					};
					if(editName){
						$(this).attr("editName",editName.replace("0@0#","0@"+num+"#"));
					};
				});
				break;
			};
		};
	}
	
	// 删除关联表单新增的数据
	function delAssociatedData(thisObj){
		var currentTr = $(".currentContent").find(" .datagrid-btbody tr");
		var selected = currentTr.hasClass('datagrid-selected');
		if(!selected){
			utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
			return;
		};
		 $(".currentContent .datagrid-btbody").find(".datagrid-selected").remove();
	}

	$(".tabList").click(function(){
		$(this).siblings().removeClass("current");
		$(this).addClass("current");
		var tab = $(this).attr("tab");
		$(".tabDiv").hide().removeClass("currentContent");
		$("."+tab).addClass("currentContent").show();
		
	});
	
	$(".datagrid-btbody tr").live("click",function(){
	    var _this = $(this);
	    if(_this.hasClass('datagrid-selected')){
	      // _this.removeClass('datagrid-selected');
	     // _this.find("td").children().removeClass('datagrid-selected');
	    }else{
	      $(".currentContent .datagrid-btbody").find("tr").removeClass('datagrid-selected').find("td").children().removeClass('datagrid-selected');
	      _this.addClass('datagrid-selected');
	      _this.find("td").children().addClass('datagrid-selected');
	    };
	});
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
