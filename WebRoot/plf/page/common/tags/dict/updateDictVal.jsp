<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title><dict:lang value="修改数据字典值" /></title>
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
			<div style="height: 263px;">
	<form id="up_form" name="upForm" action="${path}comm/DictValAction_updateDictValAx.ms?" method="post" target="submitFrame">
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
		<input type="hidden" id="dictValId" name="paraMap.dictValId" value="<c:out value='${list[0].DICTVALID}'/>"/>
		<input type="hidden" id="dictCode" name="paraMap.dictCode" value="<c:out value='${list[0].DICTCODE}'/>"/>
	<table class="basic-table">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="明细项编码" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="code" name="paraMap.code" value="${fn:escapeXml(list[0].CODE)}" onkeyup="javascript:utilsFp.replaceLikeVal(this)" maxlength="30" readonly="true"/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="明细项编码值" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input"  id="value" value="<c:out value='${list[0].VALUE}'/>" maxlength="30" style="width: 230px;" onchange="codeJSFun(this)" <s:if test="${fn:escapeXml(list[0].IS_EDIT)}==1">readonly="true"</s:if> />
				<input type="hidden" name="paraMap.value" id="code_value" />
			</td>
       </tr>
        <tr>
			<td style="width: 170px;text-align: right;"><dict:lang value="下拉列表显示顺序" /></td>
			<td style="text-align: left;padding-left:5px;" title="备注：从小到大的顺序排列（不填默认为0）">
				<input class="input" name="paraMap.dispIndx" id="dispIndx" value="<c:out value='${list[0].DISPINDX}'/>" maxlength="30" style="width: 230px;"/>
				<br/>
				<!--  
				<dict:lang value="备注：从小到大的顺序排列（不填默认为0）" />
				-->
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="是否显示" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="checkbox" id="isDisp" name="paraMap.isDisp" value="1" maxlength="2" >
				<input type="hidden" id="isDisp_s" value="<c:out value='${list[0].ISDISP}'/>" />
				<span style="margin-left: 60px;"><dict:lang value="是否可用" /></span>
				<input type="checkbox" id="isSelc" name="paraMap.isSelc" value="1" maxlength="2" >
				<input type="hidden" id="isSelc_s" value="<c:out value='${list[0].ISSELC}'/>"/>
			</td>
       </tr>
        <%-- <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="是否可用" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="checkbox" id="isDisp" name="paraMap.isDisp" value="1" maxlength="2" checked="checked">
				<input type="hidden" id="isSelc_s" value="${list[0].DISPINDX}"/>
			</td>
       </tr> --%>
     </table>
     </form>
   </div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</div>

</body>
	
	<script type="text/javascript">
	
	function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
  	function init(){
  		var valStr = _mcBase64JsToJava.getMcDealBase64Encode($("#value").val());
	   $("#code_value").val(valStr);
  	}
  	
	$(function(){
		if (1==$("#isDisp_s").val()) {
			$("#isDisp").attr("checked",true);
		}else{
			$("#isDisp").attr("checked",false);
		}
		if (1==$("#isSelc_s").val()) {
			$("#isSelc").attr("checked",true);
		}else{
			$("#isSelc").attr("checked",false);
		}
		init();
	});
	
		function submitForm(thisObj){
	 		$("#iframeId").val(window.name);
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
	 function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            utilsFp.alert("不能输入单引号双引号<>{}()[]");
	  }   }
	</script>

</html>
