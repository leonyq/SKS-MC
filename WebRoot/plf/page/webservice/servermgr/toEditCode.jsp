<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
</jsp:include>
</head>
<body>
	<div class="all">
		<form id="editForm" name="editForm"
			action="${path}webservice/ServerMgrAction_editCode.ms" method="post"
			target="submitFrame">
			<div id="div_head">
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<table width="100%">
								<tr>
									<td align="left" width="320px">类适配:&nbsp;<label
										for="codeType_0" class="cursor_hand"><input
											type="radio" id="codeType_0" name="paraMap.CODE_TYPE"
											value="CODE_BASE" onclick="loadClsCode(this.value)" />BASE</label>
										&nbsp;&nbsp;<label for="codeType_1" class="cursor_hand"><input
											type="radio" id="codeType_1" name="paraMap.CODE_TYPE"
											value="CODE_ORACLE" onclick="loadClsCode(this.value)" />ORACLE</label>
										&nbsp;&nbsp;<label for="codeType_2" class="cursor_hand"><input
											type="radio" id="codeType_2" name="paraMap.CODE_TYPE"
											value="CODE_SQLSERVER" onclick="loadClsCode(this.value)" />SQLSERVER</label>
										&nbsp;&nbsp;<label for="codeType_3" class="cursor_hand"><input
											type="radio" id="codeType_3" name="paraMap.CODE_TYPE"
											value="CODE_MYSQL" onclick="loadClsCode(this.value)" />MYSQL</label>
										<%-- 如果新增了支持的数据库类型，则这里需要新增 --%></td>
									<td width="60px">类全名</td>
									<td>
										<input type="text" id="className" name="paraMap.CLASS_NAME" value="<s:property value="dataMap.CLASS_NAME"/>"style="width:99%;" />
									</td>
									<td width="220px">
										<input type="reset" value="<dict:lang value='取消' />" onclick="parent.closePopWin();" class="botton_img_search" />
										<input type="button" id="submitBut" value="<dict:lang value='保存' />" onclick="edit(this);" class="botton_img_add" /> 
<%--										<s:if test="@com.more.fw.core.common.method.StringUtilsMc@isNotBlank(paraMap.CODE_ID)">--%>
<%--											<input type="button" value="<dict:lang value='删除' />" onclick="del(this);" class="botton_img_search" />--%>
<%--										</s:if>--%>
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>

			<div>
<%--				<input type="hidden" name="paraMap.CODE_ID" value="<s:property value="paraMap.CODE_ID" />" /> --%>
				
				<div id="div_code">
					<textarea id="serviceCode" name="paraMap.serviceCode" class="tabIndent" wrap="off" style="word-wrap: normal; width: 600px;height: 500px;"></textarea>
				</div>
				<div id="div_code_preview"></div>
			</div>
<%--			<input type="hidden" name="paraMap.IFRAME_ID" value="submitFrame" /> --%>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	function edit(thisObj) {
		var className = document.getElementById("className");
	   	if(val.isBlank(className)){
	   		_alertValMsg(className,"类全名 -- 不能为空");
	   		return false;
		}
	   	
	   	var checkRadioVal = $("input:checked").val();
	   	var classCode = $("#serviceCode").val();
	   	parent.updateCodeData(checkRadioVal, className.value, classCode)
	   	parent.closePopWin();
	}

	function init() {
		util.reloadTabKey($("#serviceCode"));
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#serviceCode").css({height:winWh - divHeadH - 15});
		
		//类名称文本框长度
		if($("#className").width()<100){
			$("#className").css({width:100});
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
		$("#serviceCode").css({width:"100%"});
	}

	
	$(function() {
		var codeType = parent.document.getElementById("codeType").value;
		if(codeType == ""){
			codeType = "CODE_BASE";
		}
		$("input[type=radio][value="+codeType+"]").attr("checked",'checked');
		var classCode = parent.document.getElementById("classCode").value;
		var className = parent.document.getElementById("className").value;
		$("#className").val(className);
		$("#serviceCode").text(classCode);
	});
	var isNoInit = false;
	function loadClsCode(type){
		var id = parent.document.getElementById("classId").value;
		_codeType = type;
		if(isNoInit){
			util.showLoading("处理中...");
		}
	  jQuery.ajax({
		type: "POST",
	    dataType: "text",
	    url: "${path}sys/BussModelAction_loadClsCode.ms?",
	    data:{"paraMap.codeType":type,"paraMap.CODE_ID":id,"paraMap.tableName":"MS_WS_SERVER","paraMap.relCol":"CLASS_ID"},
		success: function(data){
				$("#serviceCode").val(data);
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
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>