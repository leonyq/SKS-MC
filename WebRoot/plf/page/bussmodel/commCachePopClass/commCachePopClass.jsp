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
</jsp:include>
</head>
<body>
	<div class="all">
		<form id="editForm" name="editForm"
			action="#" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%">
								<tr>
									<td align="left" width="420px">类适配:&nbsp;<label for="codeType_0" class="cursor_hand">
									<input type="radio" id="codeType_0" name="paraMap.codeType"  checked="checked" value="CODE_BASE" onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1"   name="paraMap.codeType"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.codeType"
											value="CODE_SQLSERVER"   onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.codeType"
											value="CODE_MYSQL"  onclick="loadClsCode(this.value)" />MYSQL</label>
										<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></td>
									<td width="60px">类全名</td>
									<td><input type="text" id="paraMap_CLASS_NAME"
										name="paraMap.CLASS_NAME"
										value="<c:out value='${paraMap.CLASS_NAME}' />"
										style="width:99%;" /></td>
									<td width="220px"><input type="reset"
										value="<dict:lang value='取消' />"
										onclick="parent.closePopWin();" class="botton_img_search" />
										<input type="button" id="submitBut"
										value="<dict:lang value='提交' />" onclick="edit(this);"
										class="botton_img_add"> <s:if
											test="@com.more.fw.core.common.method.StringUtilsMc@isNotBlank(paraMap.CODE_ID)">
											<input type="button" value="<dict:lang value='删除' />"
												onclick="del(this);" class="botton_img_search" />
										</s:if></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>

			<div>
				<input type="hidden" name="paraMap.CODE_ID"
					value="<c:out value='${paraMap.CODE_ID}' />" /> 
				<input type="hidden" name="paraMap.noSave"
					value="" /> 
				<input type="hidden" name="exeid"
					value="<s:property value="paraMap.ID" />" />
				<div id="div_code">
				<pre id="ace_code" class="ace_editor" style="min-height:400px"></pre>
				<input type="hidden" id="clsCode__" name="paraMap.clsCode"  />
					
				</div>
				<div id="div_code_preview"></div>
			</div>
		</form>
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
	function dynamicsClsCode(successCallBackFun,errorCallBackFun){
        $.ajax({
		    type: "POST",
	        dataType: "json",
	        url: "${path}/<c:out value='${paraMap.analyClsCodeUrl}' />",
	        data:$("#editForm").serialize(),
		    success:successCallBackFun,
		    error:errorCallBackFun
		});
	}
	
	function successCallBackFun(data){
		if(data.success==true){
			    var codeType = $("input[name='paraMap.codeType']:checked").val();
			    var className = $("#paraMap_CLASS_NAME").val();
				$("#"+"<c:out value='${paraMap.javaClassElementId}' />",window.parent.document).val(className);
				$("#"+"<c:out value='${paraMap.clsCodeIdElementId}' />",window.parent.document).val(data.info);
				$("#"+"<c:out value='${paraMap.codeTypeElementId}' />",window.parent.document).val(codeType);
				$("#"+"<c:out value='${paraMap.javaClassTextElementId}' />",window.parent.document).text("编辑");
				window.parent.closePopWin();
			}else{
				util.alert(data.info);
			}
	}
	
	function errorCallBackFun(msg){
		util.alert("msg"+msg);
	}
	
	
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
			isSubmit = false;
			util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(msg){
			//修改父页面值
			parent.updateCLASS_NAME_TEXT("<s:property value="paraMap.CLASS_NAME_TEXT_ID" />",$("#paraMap_CLASS_NAME").val());
			document.forms.editForm.action = "${path}sys/BussModelAction_cfgClsCode.ms";
			document.forms.editForm.submit();
			//window.location.href = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CLASS_NAME_TEXT_ID=<s:property value="paraMap.CLASS_NAME_TEXT_ID" />&paraMap.CODE_ID=<s:property value="paraMap.CODE_ID" />&paraMap.OWNER_ID=<s:property value="paraMap.OWNER_ID" />&paraMap.OWNER_TYPE=<s:property value="paraMap.OWNER_TYPE" />&paraMap.codeType="+_codeType+"";
	}
	
	var isSubmit = false;
	
	function edit(thisObj) {
		var paraMap_CLASS_NAME = document.getElementById("paraMap_CLASS_NAME");
	   	if(val.isBlank(paraMap_CLASS_NAME)){
	   		_alertValMsg(paraMap_CLASS_NAME,"类全名 -- 不能为空");
	   		return false;
		}
	   	$("#clsCode__").val(editor.getValue());
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//document.forms.editForm.submit();
		dynamicsClsCode(successCallBackFun,errorCallBackFun);
		isSubmit = true;
	}
	
	function del(thisObj){
		util.confirm(delConfirm);
	}
	
	function delConfirm(){
    document.forms.editForm.action="${path}sys/BussModelAction_delRelClsCode.ms";
		document.forms.editForm.submit();
	}

	
	var isNoInit = false;
	function loadClsCode(){
		$("#clsCode__").val("");
		if(isNoInit){
			util.showLoading("处理中...");
		}
	    $.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}/<c:out value='${paraMap.loadClsCodeUrl}' />",
	    data:{'paraMap.codeType':'<c:out value="${paraMap.codeType}" />','paraMap.CODE_ID':'<c:out value="${paraMap.CODE_ID}" />'},
		success: function(data){
			editor.setValue(data);
				$("#clsCode__").val(data);
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
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	
	function init() {
		util.reloadTabKey($("#ace_code"));
		//util.reloadTabKey($("#ace_code"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#ace_code").css({height:winWh - divHeadH - 15});
		
		<%-- 设置页面保存的执键 --%>
		setHotKey(83);
		setHotKeyAct(document.getElementById("submitBut"));
		loadClsCode();
		//var clsCode = $("#"+"<c:out value='${paraMap.clsCodeElementId}' />",window.parent.document).val();
		//$("#clsCode__").val(clsCode);
		//类名称文本框长度
		if($("#paraMap_CLASS_NAME").width()<100){
			$("#paraMap_CLASS_NAME").css({width:100});
		}
	}
	
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
		util.setTextAreaWidth("div_code","clsCode__");
		util.setTextAreaHeight("clsCode__",$("#div_head").height());
		$(window).resize(function () {
			util.setTextAreaWidth("div_code","clsCode__");
			util.setTextAreaHeight("clsCode__",$("#div_head").height());
		});
	} else {
		$("#clsCode__").css({width:"100%"});
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>