<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title>配置文件新增页面(该页面最好是开放给管理员角色)</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>

	<body class="ContBody">
		<s:form action="CacheAction_addPropFile.ms" name="add_form" id="add_form" method="post">
			<s:token />
			<s:hidden name="cacheDto.ppsFileName" />
			<table class="add_table">
				<tr>
				  <th colspan="4">新增配置属性<span class="Point">（带 <span class="Eng">*</span> 为必填项）</span></th>
				</tr>
					<tr>
						<td width="35%" class="TitFont">属性名称(key)：</td>
						<td>
							<s:textfield name="propDtoParam.key" cssClass="text_input_150" />
							<span style="color:red">&nbsp;&nbsp;* <span id="add_form_propDtoParam_key_err"><c:out value="${errors['propDtoParam.key'][0]}"/></span></span>
						</td>
					</tr>
					<tr>
						<td class="TitFont">属性值(value)：</td>
						<td>
							<s:textfield name="propDtoParam.value" cssClass="text_input_150" />
							<span style="color:red">&nbsp;&nbsp;* <span id="add_form_propDtoParam_value_err"><c:out value="${errors['propDtoParam.value'][0]}"/></span></span>
						</td>
					</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="6"></td>
				</tr>
			</table>
			<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td colspan="2" align="center" valign="middle">
					   <table class="YellowBtn" onclick="submitForm(this);">
						  <tr>
							<td class="YellowBtnL">&nbsp;</td>
							<td class="YellowBtnM">提  交</td>
							<td class="YellowBtnR">&nbsp;</td>
						  </tr>
						</table>
					   <table class="GreenBtn" onclick="goBack();">
						  <tr>
							<td class="GreenBtnL">&nbsp;</td>
							<td class="GreenBtnM">返  回</td>
							<td class="GreenBtnR">&nbsp;</td>
						  </tr>
						</table>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
	
	<script type="text/javascript">
	
		function submitForm(thisObj){
			if(!valData()){
				return ;
			}
			document.forms.add_form.submit();
			thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
		}
		
        function goBack(){
       		window.parent.closeSub();
			window.parent.reload();
        }
        
        function valData(){
        	var key = document.getElementById("add_form_propDtoParam_key");
        	if(val.isBlank(key)){
        		document.getElementById("add_form_propDtoParam_key_err").innerHTML = "属性名称-不能为空";
        		document.getElementById("add_form_propDtoParam_value_err").innerHTML = "";
        		key.focus();
        		return false;
        	}else{
        		document.getElementById("add_form_propDtoParam_key_err").innerHTML = "";
        	}
        	var value = document.getElementById("add_form_propDtoParam_value");
        	if(val.isBlank(value)){
        		document.getElementById("add_form_propDtoParam_value_err").innerHTML = "属性值-不能为空";
        		value.focus();
        		return false;
        	}else{
        		document.getElementById("add_form_propDtoParam_value_err").innerHTML = "";
        	}
        	
        	return true;
        }
	</script>

</html>
