<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title>用户信息修改</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<form id="up_form" name="upForm" action="${path}sys/UserAction_upUser.ms" method="post">
	<s:hidden name="userDto.id" />
	<table class="add_table">
       <tr>
          <th colspan="6">用户信息修改<span class="Point">（带 <span class="Eng">*</span> 为必填项）</span></th>
       </tr>
        <tr>
			<td width="10%" class="tr1">用户名称</td>
			<td width="28%">
				<s:textfield name="userDto.name" maxlength="15" />
				<span class="Eng">* <br/><span id="userDto_name_err"><c:out value='${errors["userDto.name"][0]}' /></span></span>
			</td>
			<td width="10%" class="tr1">登录名称</td>
			<td width="28%">
				<s:textfield name="userDto.loginName" maxlength="60" />
				<span class="Eng">* <br/><span id="userDto_loginName_err"><c:out value='${errors["userDto.loginName"][0]}' /></span></span>
			</td>
			<td width="8%" class="tr1">状态</td>
			<td width="16%">
				<dict:radioDict name="userDto.enable" dictCode="user_enable" dictValue="%{userDto.enable}" style="cursor: pointer;" />
			</td>
       </tr>
        <tr>
			<td class="tr1">单位名称</td>
			<td colspan="5">
				<s:select list="deptLs" headerKey="" headerValue="--请选择--"
					listKey="id" listValue="levleName"  id="userDto_deptId" name="userDto.deptId" 
					cssStyle="width: 96%;" />
				<span class="Eng">* <br/><span id="userDto_deptId_err"><c:out value='${errors["userDto.deptId"][0]}' /></span></span>
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