<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
		<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<link rel="stylesheet" 
href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
</jsp:include>
</head>
<body>
	<div class="all">
		<form id="editForm" name="editForm"
			action="${path}sys/MClzMgrAction_analyClsCode.ms" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%">
								<tr>
									<td align="left" width="320px">类适配:&nbsp;<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" id="codeType_0" name="paraMap.codeType"
											value="CODE_BASE" onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.codeType"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.codeType"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.codeType"
											value="CODE_MYSQL" onclick="loadClsCode(this.value)" />MYSQL</label>
										<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></td>
									<td width="60px">类全名</td>
									<td><input type="text" id="paraMap_CLASS_NAME"
										name="paraMap.CLASS_NAME"
										value="<s:property value="dataMap.CLASS_NAME"/>"
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
				<input type="hidden" name="paraMap.CLASS_NAME_TEXT_ID"
					value="<s:property value="paraMap.CLASS_NAME_TEXT_ID" />" /> 
				<input type="hidden" name="paraMap.CODE_ID"
					value="<s:property value="paraMap.CODE_ID" />" /> 
				<input type="hidden" name="paraMap.OWNER_TYPE"
					value="<s:property value="paraMap.OWNER_TYPE" />" /> 
				<div id="div_code">
					<textarea id="clsCode__" name="paraMap.clsCode" class="tabIndent" wrap="off"
						style="overflow:scroll;word-wrap:normal; width: 600px;height: 500px;display: none;"></textarea>
							
				</div>
				<div id="div_code_preview"></div>
			</div>
			<s:hidden id="parentiframeId" name="iframeId"/><!-- 父表单的iframe	-->
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isSubmit = false;
		var isNoInit = false;
		var _codeType= "<s:property value="paraMap.codeType" />";
		var name="<s:property value="paraMap.CLASS_NAME_TEXT_ID" />";
		var codeId="<s:property value="paraMap.CODE_ID" />";
		var contextValue=parent.document.getElementById("context").value;
		function init() {
		util.reloadTabKey($("#clsCode__"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#clsCode__").css({height:winWh - divHeadH - 15});
		
		<%-- 设置页面保存的执键 --%>
		setHotKey(83);
		setHotKeyAct(document.getElementById("submitBut"));
		if(_codeType == ""){
			_codeType = "CODE_BASE";
		}
		$("input[type=radio][value="+_codeType+"]").attr("checked",'checked');
		
		if(codeId!=""){
			loadClsCode(_codeType);
		}else if(name!="" && contextValue!=""){
			$("#paraMap_CLASS_NAME").val(name);
			$("#clsCode__").val(contextValue);
		}
		
		$("#clsCode__").show();
		//类名称文本框长度
		if($("#paraMap_CLASS_NAME").width()<100){
			$("#paraMap_CLASS_NAME").css({width:100});
		}
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
			var CODE_TYPE_NAME=$("input[name='paraMap.codeType']:checked").val();
			parent.updateCLASS_NAME_TEXT($("#paraMap_CLASS_NAME").val(),$("#clsCode__").val(),CODE_TYPE_NAME);
			
				}
	function edit(thisObj) {
		var paraMap_CLASS_NAME = document.getElementById("paraMap_CLASS_NAME");
	   	if(val.isBlank(paraMap_CLASS_NAME)){
	   		_alertValMsg(paraMap_CLASS_NAME,"类全名 -- 不能为空");
	   		return false;
		}
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function del(thisObj){
		util.confirm(delConfirm);
	}
	
	function delConfirm(){
    document.forms.editForm.action="${path}sys/BussModelAction_delRelClsCode.ms";
		document.forms.editForm.submit();
	}
	function loadClsCode(type){
		_codeType = type;
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms?",
	    data:{'paraMap.codeType':type,'paraMap.CODE_ID':'<s:property value="paraMap.CODE_ID"/>','paraMap.CODE_TYPE':'<s:property value="paraMap.CODE_TYPE"/>'},
		success: function(data){
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