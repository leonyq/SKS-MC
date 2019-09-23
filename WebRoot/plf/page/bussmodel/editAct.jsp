<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><s:property value="%{getText('editAct.title')}"/></title>
	<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<form id="up_form" name="upForm" action="${path}sys/UserAction_upUser.ms" method="post">
	<s:hidden name="dataMap.id" />
	<table class="add_table">
			<tr>
				<th colspan="6"><s:property value="%{getText('editAct.info1')}"/><span class="Point">（ <span class="Eng">*</span> <s:property value="%{getText('common.needInfo')}"/>）</span></th>
       </tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.ACT_NAME')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.ACT_NAME" maxlength="15" />
					<span class="Eng">* <br/><span id="dataMap_ACT_NAME_err"><c:out value='${errors["dataMap.ACT_NAME"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.VIEWID')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.VIEWID" maxlength="15" />
					<span class="Eng"> <br/><span id="dataMap_VIEWID_err"><c:out value='${errors["dataMap.VIEWID"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.ACT_TYPE')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.ACT_TYPE" maxlength="15" />
					<span class="Eng"> <br/><span id="dataMap_ACT_TYPE_err"><c:out value='${errors["dataMap.ACT_TYPE"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.IS_SQL')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.IS_SQL" maxlength="15" />
					<span class="Eng"> <br/><span id="dataMap_IS_SQL_err"><c:out value='${errors["dataMap.IS_SQL"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.SQL')}"/></td>
				<td width="65%">
					<s:textarea name="dataMap.SQL" cols="60" rows="8" ></s:textarea>
					<span class="Eng"> <br/><span id="dataMap_SQL_err"><c:out value='${errors["dataMap.SQL"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.IS_CLASS')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.IS_CLASS" maxlength="15" />
					<span class="Eng"> <br/><span id="dataMap_IS_CLASS_err"><c:out value='${errors["dataMap.IS_CLASS"][0]}' /></span></span>
				</td>
			</tr>
			<tr>
				<td width="35%" class="tr1"><s:property value="%{getText('editAct.CLASS_NAME')}"/></td>
				<td width="65%">
					<s:textfield name="dataMap.CLASS_NAME" maxlength="15" cssStyle="width:300px;" />
					<span class="Eng"> <br/><span id="dataMap_CLASS_NAME_err"><c:out value='${errors["dataMap.CLASS_NAME"][0]}' /></span></span>
				</td>
			</tr>
     </table>
	   <br />
	   <br />
	   <br />
	   <div class="ptop_10 txac">
			<input type="button" value="提 交" onclick="edit(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="reset" value="重 置"class="botton_img_search" />
			&nbsp;&nbsp;
			<input type="button" value="关 闭" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
     </form>
   </div>
</div>

<script type="text/javascript">
	

	function edit(thisObj){
		if(!valData()){
			return ;
		}
		document.forms.up_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
        
    function valData(){
    	var userDtoName = document.getElementById("userDto_name");
    	if(val.isBlank(userDtoName)){
    		document.getElementById("userDto_name_err").innerHTML = "用户名称-不能为空";
    		userDtoName.focus();
    		return false;
    	}else{
    		document.getElementById("userDto_name_err").innerHTML = "";
    	}
    	var userDtoLoginName = document.getElementById("userDto_loginName");
    	if(val.isBlank(userDtoLoginName)){
    		document.getElementById("userDto_loginName_err").innerHTML = "登录名称-不能为空";
    		userDtoLoginName.focus();
    		return false;
    	}else{
    		document.getElementById("userDto_loginName_err").innerHTML = "";
    	}
    	var userDtoDeptId = document.getElementById("userDto_deptId");
    	if(val.isBlank(userDtoDeptId)){
    		document.getElementById("userDto_deptId_err").innerHTML = "单位-不能为空";
    		userDtoDeptId.focus();
    		return false;
    	}else{
    		document.getElementById("userDto_deptId_err").innerHTML = "";
    	}
    	
    	return true;
    }

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>