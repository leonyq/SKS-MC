<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title><dict:lang value="修改数据字典" /></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>

	<body class="ContBody">
		<div style="background-color: white;margin-top: 37px;">
			    <div class="optn">
			        <button type="button" onclick="submitForm(this);"><i class="ico ico-save"></i><dict:lang value='保存' /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value='取消' /></button>
			    </div>
			<div style="height: 170px;">
	<form id="up_form" name="upForm" action="${path}comm/DictAction_updateDictAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5002" method="post" target="submitFrame">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
		<input type="hidden" id="dictId" name="paraMap.dictId" value="<c:out value='${list[0].DICTID}'/>"/>
	<table class="basic-table">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="类型编码" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="code" name="paraMap.code" value="${fn:escapeXml(list[0].CODE)}"  maxlength="30" readonly="true"/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="类型编码名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input"  id="value" value="<c:out value='${list[0].VALUE}'/>" maxlength="30" style="width: 230px;" onchange="codeJSFun(this)" />
				<input type="hidden" name="paraMap.value" id="code_value" />
			</td>
       </tr>
       <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="备注" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input"  id="remark" value="<c:out value='${list[0].REMARK}'/>" maxlength="100" style="width: 230px;" onchange="codeJSFun(this)" />
				<input type="hidden" name="paraMap.remark" id="code_remark"/>
			</td>
       </tr>
     </table>
     </form>
   </div>
</div>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</body>
	
	<script type="text/javascript">
		function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
  		
		function submitForm(thisObj){
	 		$("#iframeId").val(window.name);
	 		var code = $("#code").val();
			var codes = document.getElementById("code");
	 		var fdStart = code.indexOf("?");
			if(fdStart == 0){
   				_alertValMsg(codes,"<dict:lang value="类型编码不能有?号" />");
   				return ;
			}
			document.forms.up_form.submit();
		//	thisObj.onclick = function(){util.alert("<dict:lang value="数据正在提交，请稍候" />...");};<%-- 防止重复提交 --%>
		}
        function goBack(){
       		var formObj= document.forms.up_form;
       		formObj.action = "${path}/comm/DictAction_listDict.ms?FUNC_CODE=F4";
       		formObj.submit();
        }
		
		<%-- 显示提示信息 --%>
		if("<c:out value='${actionMessages[0]}' />" !=""){
			util.alert("<c:out value='${actionMessages[0]}' />");
		}
	function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
	  function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            utilsFp.alert("不能输入单引号双引号<>{}()[]");
	  }   }
	  
	  function init(){
	  //编码值
	  var valStr = _mcBase64JsToJava.getMcDealBase64Encode($("#value").val());
	  $("#code_value").val(valStr);
	  //备注
	  var remarkStr = _mcBase64JsToJava.getMcDealBase64Encode($("#remark").val());
	   $("#code_remark").val(remarkStr);
	  }
	  $(function(){
	  init();
	  });
	</script>

</html>
