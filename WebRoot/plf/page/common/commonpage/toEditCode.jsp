<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ace" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
	
</jsp:include>
<style>
html,body{
	height:99%;
}
.all{
	height:92%;
	margin-bottom:68px;
}
.add_table_div{
	height:100%;
}
#editForm{
	height:100%;
}
#div_code{
	height:100%;
}
</style>
</head>
<body>
	<div class="all">
	<div class="add_table_div">	
		
		<form id="editForm" class="layui-form" name="editForm"
			 method="post"
			target="submitFrame">
			
			<input type="hidden" name="mcIframeName" value="${mcIframeName}">
			<input type="hidden" id="codeId" name="codeId">

			<div id="div_head">
				<table class="add_table view-code">

					<tr>
						<td class="widget" style="width:450px;">
							<span class="view-code-name"> <dict:lang value="类适配" /> </span>
					
							 <label
		                    for="codeType_0" class="cursor_hand"><input
		                      type="radio" id="codeType_0" name="paraMap.CODE_TYPE"
		                      value="CODE_BASE" onclick="loadClsCode(this.value)" title="BASE"/></label>
		                      
		                    &nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
		                      type="radio" id="codeType_1" name="paraMap.CODE_TYPE"
		                      value="CODE_ORACLE" onclick="loadClsCode(this.value)" title="ORACLE"/></label>
		                      
		                    &nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
		                      type="radio" id="codeType_2" name="paraMap.CODE_TYPE"
		                      value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" title="SQLSERVER"/></label>
		                      
		                    &nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
		                      type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
		                      value="CODE_MYSQL" onclick="loadClsCode(this.value)" title="MYSQL"/></label>
		                      
		                      <label for="codeType_4" class="cursor_hand"><input
		                      type="radio" id="codeType_4" name="paraMap.CODE_TYPE"
		                      value="CODE_PG" onclick="loadClsCode(this.value)" title="PG"/></label>
		                    <%-- 如果新增了支持的数据库类型，则这里需要新增 --%>
                      
						</td>

					
						<td class="widget" style="padding-bottom:8px;"> 
							<span class="view-code-name"> <dict:lang value="类全名" /> </span>
							 <input type="text" id="className2" name="paraMap.CLASS_NAME" value="<s:property value='dataMap.CLASS_NAME'/>" style="width:507px;" />
                      
						</td>
						

					</tr> 
					
				</table>
			</div>

			<div style="height:91%;">			
				<div id="div_code">
					<pre id="ace_code" class="ace_editor" style=""></pre>
					<!-- <textarea id="serviceCode" name="paraMap.serviceCode" class="tabIndent" wrap="off" style="word-wrap: normal; width: 600px;height: 500px;"></textarea> -->
				</div>
				<div id="div_code_preview"></div>
			</div>
			<div>
				<input
					type="hidden" name="paraMap.MC_ID_MYSQL"
					value="<s:property value="dataMap.MC_ID_MYSQL" />" /><input
					type="hidden" name="paraMap.MC_ID_SQLSERVER"
					value="<s:property value="dataMap.MC_ID_SQLSERVER" />" /><input
					type="hidden" name="paraMap.MC_ID_ORACLE"
					value="<s:property value="dataMap.MC_ID_ORACLE" />" /><input
					type="hidden" name="paraMap.MC_ID_BASE"
					value="<s:property value="dataMap.MC_ID_BASE" />" /><input
					type="hidden" id="DATABASETYPE" name="paraMap.DATABASETYPE" /><input
					type="hidden" name="paraMap.MC_ID_PG"
					value="<s:property value="dataMap.MC_ID_PG" />" />
				</div>
			<s:hidden id="type" name="paraMap.type"></s:hidden>
			
			<div class="ptop_10 txac">			
					<!--  
					<button  style="margin:2px 2px 2px 2px;" class="layui-btn layui-btn-danger" onclick="closePopWin();">取消</button>
					<input style="margin:2px 2px 2px 2px;" type="button" id="submitBut" value="<dict:lang value='保存' />" onclick="edit(this);" class="layui-btn">
								
					-->
					<!--<input type="button" id="submitBut" value="<dict:lang value='保存' />" onclick="edit(this);" class="layui-btn" />-->
					 <button class="layui-btn" lay-filter="filterSubmit" id="submitBut" lay-submit="formSubmit">保存</button>
					
					<input type="button" value="<dict:lang value="取消" />"  onclick="closePopWin();" class="layui-btn layui-btn-danger">

					<input type="button" id="debugButton" class="layui-btn" style="display: none" onclick="validateIsCurrentsDebug()" value="调试">

				</div>
				
		</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>
	<script>
		//初始化ace对象
		editor = ace.edit("ace_code");
		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
		theme = "idle_fingers"//clouds
		language = "java"
		editor.setTheme("ace/theme/" + theme);
		editor.session.setMode("ace/mode/" + language);
		//字体大小
		editor.setFontSize(14);
		//设置只读（true时只读，用于展示代码）
		editor.setReadOnly(false);
		//自动换行,设置为off关闭
		editor.setOption("wrap", "off")
		//启用提示菜单
		ace.require("ace/ext/language_tools");
		editor.setOptions({
			enableBasicAutocompletion : true,
			enableSnippets : true,
			enableLiveAutocompletion : true
		});
	</script>
	<script type="text/javascript">
	var otherClassType = $("#type").val();
	function edit(thisObj) {
		var className = document.getElementById("className2");
	   	if(val.isBlank(className)){
	   		_alertValMsg(className,"类全名 -- 不能为空");
	   		return false;
		}
	   	var checkRadioVal = $("input:checked").val();
	   	var classCode = editor.getValue();
	   	if(val.isBlank(classCode)){
	   		util.alert("类的内容 -- 不能为空");
	   		return false;
	   	}
	   	
		if(toFlag == "interface"){ //N2接口保存
			if(otherClassType=="lis" || otherClassType=="trig"){
	   		pIframe.updateCodeData(checkRadioVal, className.value, classCode,otherClassType);//单个页面有多个类源码
			}else{
				pIframe.updateCodeData(checkRadioVal, className.value, classCode);//单个页面只有一个类源码
			}
			closePopWin();
		}else{
			var obj={"isFramesetMethod":false,"type":"window"};
			var par_dom=getSrcDom(obj);
			
			if(otherClassType=="lis" || otherClassType=="trig"){
				par_dom.updateCodeData(checkRadioVal, className.value, classCode,otherClassType);//单个页面有多个类源码
			}else{
				par_dom.updateCodeData(checkRadioVal, className.value, classCode);//单个页面只有一个类源码
			}
			
			closePopWin();//关闭当前窗口
			
			//以下根据不同的调用场景关键窗口  主要是要关闭的窗口的iframename正确
			if(otherClassType!='lis' && otherClassType!='trig'){
				 //其他 比如公用类 包路径...
				var mcIframeName2="${mcIframeName2}";
				if(typeof(mcIframeName2) != undefined && mcIframeName2!=null && mcIframeName2!=''){
					var obj={"mcIframeName":mcIframeName2,"type":"window"};
					getSrcByIframeName(obj).closePopWin();
				
				}else{
					var mcIframeName="${mcIframeName}";
					if(mcIframeName!=null && mcIframeName!=''){
						var obj={"mcIframeName":mcIframeName,"type":"window"};
						getSrcByIframeName(obj).closePopWin();
					
					}
				
				}
			
			}else{
				//lis触发器 新增 自定义监听器
				//trig触发器 新增 执行频率触发器
				
			}
			
			return false;
		}
	   	
	}

	function init() {
		/*var mcIframeName="${mcIframeName}";
		var obj={"mcIframeName":mcIframeName,"type":"window"};
		var parent_obj=getSrcByIframeName(obj);*/
		
		util.reloadTabKey($("#ace_code"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#ace_code").css({height:winWh - divHeadH - 75});
		//类名称文本框长度
		if($("#className2").width()<100){
			$("#className2").css({width:100});
		}
		//------处理一个页面多个类源码的情况。 通过type不同获取不同的类源码。如果一个页面只有一个类源码则在父页面存类源码用classCode
		
		//var obj={"isFramesetMethod":false,"type":"document"};
		//var par_dom=getSrcDom(obj);
		var autoWrite='';

		if(otherClassType=="lis"){
			autoWrite = parent_obj.document.getElementById("lisClsCode").value;
		}else if(otherClassType=="trig"){
			autoWrite=parent_obj.document.getElementById("trigClsCode").value;
		}else{
			if(parent_obj.document.getElementById("classCode")!=null){
				autoWrite = parent_obj.document.getElementById("classCode").value;
			}
		}
		
		if(autoWrite==""){
			loadClsCode(null);
		}else{
			editor.setValue(autoWrite);		
		}

		initDebug();
	}

	function initDebug() {
		var codeId=null;
		if(otherClassType=="lis"){
			var workLis=parent_obj.document.getElementById("workLis").value;
			codeId=workLis;
		}else if(otherClassType=="trig"){
			var trigCodeId=parent_obj.document.getElementById("trigCodeId").value;
			codeId=trigCodeId;
		}else{
			if(parent_obj.document.getElementById("classCode")!=null){
				codeId = '<s:property value="paraMap.CODE_ID"/>';
			}
		}
		if(codeId) {
			$("#codeId").val(codeId);
			$("#debugButton").show();
		}
	}
	
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
		util.setTextAreaWidth("div_code","serviceCode");
		util.setTextAreaHeight("serviceCode",$("#div_head").height());
		$(window).resize(function () {
			util.setTextAreaWidth("div_code","serviceCode");
			util.setTextAreaHeight("serviceCode",$("#div_head").height());
		});
	} else {
		var textAreaHei = $(window).height()-210+'px';
		console.log(textAreaHei);
		$("#serviceCode").css({width:"100%"});
		$("#ace_code").css({height:textAreaHei});
	}
	var piframeName = '<s:property value="paraMap.piframeName"/>';
	var pIframe = top.window.frames[piframeName];
	var toFlag = '<s:property value="paraMap.toFlag"/>';
	
	var mcIframeName="${mcIframeName}";
	var obj={"mcIframeName":mcIframeName,"type":"window"};
	var parent_obj=getSrcByIframeName(obj);

	if(toFlag == "interface"){  //N2接口
			parent_obj = pIframe;
	}
	$(function() {
		
		var className=null;
		var clsCode = null;
		var trigCodeType = null;
		if(toFlag == "interface"){
			if(otherClassType=="lis"){
			
				className=pIframe.document.getElementById("lisCodeName").value;
				clsCode=pIframe.document.getElementById("lisClsCode").value;
				lisCodeType=pIframe.document.getElementById("lisCodeType").value;
				
				$("#clsCode").val(clsCode);
				if(lisCodeType==""){
					codeType = "CODE_BASE";
					$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				}else{
					$("input[type=radio][value="+lisCodeType+"]").attr("checked",'checked');
				}
			}else if(otherClassType=="trig"){
				className=pIframe.document.getElementById("trigName").value;
				clsCode=pIframe.document.getElementById("trigClsCode").value;
				trigCodeType=pIframe.document.getElementById("trigCodeType").value;
				$("#clsCode").val(clsCode);
				if(trigCodeType==""){
					codeType = "CODE_BASE";
					$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				}else{
					$("input[type=radio][value="+trigCodeType+"]").attr("checked",'checked');
				}
			}else{
				var codeType = pIframe.document.getElementById("codeType").value//
				if(codeType == ""){
					codeType = "CODE_BASE";
				}
				$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				var classCode = pIframe.document.getElementById("classCode").value;
				className = pIframe.document.getElementById("className1").value;
				$("#serviceCode").text(classCode);
			}
			$("#className2").val(className);
		}else{
			if(otherClassType=="lis"){
				
				className=parent_obj.document.getElementById("lisCodeName").value;
				clsCode=parent_obj.document.getElementById("lisClsCode").value;
				lisCodeType=parent_obj.document.getElementById("lisCodeType").value;
				
				$("#clsCode").val(clsCode);
				if(lisCodeType==""){
					codeType = "CODE_BASE";
					$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				}else{
					$("input[type=radio][value="+lisCodeType+"]").attr("checked",'checked');
				}
			}else if(otherClassType=="trig"){
				className=parent_obj.document.getElementById("trigName").value;
				clsCode=parent_obj.document.getElementById("trigClsCode").value;
				trigCodeType=parent_obj.document.getElementById("trigCodeType").value;
				$("#clsCode").val(clsCode);
				if(trigCodeType==""){
					codeType = "CODE_BASE";
					$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				}else{
					$("input[type=radio][value="+trigCodeType+"]").attr("checked",'checked');
				}
			}else{
				//var obj={"isFramesetMethod":false,"type":"document"};
				//var par_dom=getSrcDom(obj);
				
				var codeType = "";
				if (typeof(parent_obj.document.getElementById("codeType")) != "undefined" && parent_obj.document.getElementById("codeType")!=null) { 
					codeType = parent_obj.document.getElementById("codeType").value;
				}
				if(codeType == ""){
					codeType = "CODE_BASE";
				}
				$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
				
				var classCode = "";
				if(parent_obj.document.getElementById("classCode")!=null){
					classCode = parent_obj.document.getElementById("classCode").value;
				}
				
				if(parent_obj.document.getElementById("className2")!=null){
					className = parent_obj.document.getElementById("className2").value;
				}
				
				$("#serviceCode").text(classCode);
			}
			$("#className2").val(className);
		}
	});
	var isNoInit = false;
	function loadClsCode(type){
		/*var mcIframeName="${mcIframeName}";
		var obj={"mcIframeName":mcIframeName,"type":"window"};
		var parent_obj=getSrcByIframeName(obj);*/
		
		_codeType = type;
		var codeId=null;
		var dataJson =null;
		if(otherClassType=="lis"){
			var workLis=parent_obj.document.getElementById("workLis").value;
			codeId=workLis;
			dataJson = {"paraMap.codeType":type,"paraMap.CODE_ID":codeId,"paraMap.tpl":"autoListener","paraMap.tableName":"MS_TRIGGER_MODEL","paraMap.relCol":"WORK_LIS"};
		}else if(otherClassType=="trig"){
			var trigCodeId=parent_obj.document.getElementById("trigCodeId").value;
			codeId=trigCodeId;
			dataJson = {"paraMap.codeType":type,"paraMap.CODE_ID":codeId,"paraMap.tpl":"autoTrigger","paraMap.tableName":"MS_TRIGGER_MODEL","paraMap.relCol":"EXPRESSION"};
		}else{
			dataJson = {
	    		"paraMap.codeType":type,
	    		"paraMap.CODE_ID":'<s:property value="paraMap.CODE_ID"/>',
	    		"paraMap.tpl":'<s:property value="paraMap.tpl"/>',
	    		"paraMap.tableName":'<s:property value="paraMap.tableName"/>',
	    		"paraMap.relCol":'<s:property value="paraMap.colName"/>',
	    		"paraMap.xmlForPackge" : '<s:property value="paraMap.xmlForPackge"/>',
				"paraMap.xmlForClassName" : '<s:property value="paraMap.xmlForClassName"/>'
	    	}
		}
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms?",
	    data:dataJson,
		success: function(data){
				editor.setValue(data);
				isNoInit = true;
			if(isNoInit){
				util.closeLoading();
			}
			},
			error: function(msg){
				isNoInit = true;
			if(isNoInit){
				util.closeLoading();
			}
				util.alert("error:无权限访问");
				//thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
			       var flag=edit(data.elem);
			       if(!flag){
			       		return false;
			       }else{
			       		return true;
			       }
			  }) 
           
	    });
	    
	    
	    
	})

	//打开新窗口
	function validateIsCurrentsDebug(){
		var classNameValue = $("#className2").val();
		var codeId = $("#codeId").val();
		var codeType = $("input[name='paraMap.CODE_TYPE']:checked").val();
		if(codeId) {
			debugPageDetail(classNameValue,codeId,codeType);
		}
	}
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>