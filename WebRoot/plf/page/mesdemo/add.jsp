<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><s:property value="%{getText('add.title')}"/></title>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<form id="add_form" name="addForm" action="${path}sys/UserAction_addUser.ms" method="post">
		<s:token />
		<input type="hidden" name="userDto.pw" value="1" />
	<table class="add_table">
		<input type="hidden" name="userDto.enable" value='<s:property value="@com.more.fw.core.sysmain.model.UserDto@USER_ENABLE_1" />' />
        <tr>
          <td colspan="6">用户信息新增<span class="Point">（带 <span class="Eng">*</span> 为必填项）</span></td>
		</tr>
        <tr>
			<td width="20%" class="tr1">用户名称</td>
			<td width="30%">
				<s:textfield name="userDto.name" id="userDto_name" maxlength="15"/>
				<span class="Eng">* <br/><span id="userDto_name_err"><c:out value='${errors["userDto.name"][0]}' /></span></span>
			</td>
			<td width="20%" class="tr1">登录名称</td>
			<td width="30%">
				<s:textfield name="userDto.loginName" id="userDto_loginName" maxlength="60"/>
				<span class="Eng">* <br/><span id="userDto_loginName_err"><c:out value='${errors["userDto.loginName"][0]}' /></span></span>
			</td>
       </tr>
        <tr>
			<td width="20%" class="tr1">单位名称</td>
			<td width="30%" colspan="3">
				<s:select list="deptLs" headerKey="" headerValue="--请选择--"
					listKey="id" listValue="levleName"  id="userDto_deptId" name="userDto.deptId" 
					cssStyle="width: 96%" />
				<span class="Eng">* <br/><span id="userDto_deptId_err"><c:out value='${errors["userDto.deptId"][0]}' /></span></span>
			</td>
       </tr>
     </table>
     </form>
   </div>
   <br />
   <br />
   <br />
   <div class="ptop_10 txac">
		<input type="button" value="提 交" onclick="add(this);" class="botton_img_add">
		&nbsp;&nbsp;
		<input type="button" value="关 闭" onclick="parent.closePopWin();" class="botton_img_search">
	</div>
</div>

<script type="text/javascript">
	

	function add(thisObj){
		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}
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