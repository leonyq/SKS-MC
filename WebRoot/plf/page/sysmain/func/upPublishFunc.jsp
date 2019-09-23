<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单修改" /></title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>
	<div class="all">
		<div>
			<form id="up_form" name="upForm" action="${path}sys/FuncAction_upFunc.ms" method="post">
				<s:token />
				<s:hidden name="funcDto.id" />
				<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
				<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
				<table class="add_table">
					<tr>
						<td colspan="6">
							<dict:lang value="功能菜单修改" />
							<span class="Point"><span class="Eng">*</span> <dict:lang value="为必填项" /></span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							功能名称
						</td>
						<td width="30%">
							<s:textfield name="funcDto.name" maxlength="30" cssStyle="width:90%;" />
							<span class="Eng">* <span id="funcDto_name_err"><c:out value='${errors["funcDto.name"][0]}'/></span>
							</span>
						</td>
						<td width="20%" class="tr1">
							菜单类型
						</td>
						<td width="30%">
							<dict:radioDict dictCode="CLIENT_TYPE" dictValue="%{funcDto.clientType}" id="funcDto_clientType" name="funcDto.clientType"
								style="cursor: pointer;width:20px;" />
							<span class="Eng">* <span id="funcDto_clientType_err"><c:out value='${errors["funcDto.clientType"][0]}'/></span>
							</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							功能URL
						</td>
						<td width="80%" colspan="3">
							<s:textfield name="funcDto.url" maxlength="4000" cssStyle="width:100%;" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							功能图标
						</td>
						<td width="30%">
							<s:textfield name="funcDto.img" maxlength="30" />
						</td>
						<td width="20%" class="tr1">
							功能类型
						</td>
						<td width="30%">
							<dict:radioDict dictCode="FUNC_TYPE" dictValue="%{funcDto.type}" id="funcDto_type" name="funcDto.type"
								style="cursor: pointer;width:20px;" />
							<span class="Eng">* <span id="funcDto_type_err"><c:out value='${errors["funcDto.type"][0]}'/></span>
							</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							编码
						</td>
						<td width="30%">
							<s:textfield name="funcDto.funcCode" maxlength="33" />
							<span class="Eng">* <span id="funcDto_funcCode_err"><c:out value='${errors["funcDto.funcCode"][0]}'/></span>
							</span>
						</td>
						<td width="20%" class="tr1">
							菜单类名称
						</td>
						<td width="30%">
							<s:textfield name="funcDto.className" maxlength="60" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							视图ID
						</td>
						<td width="30%">
							<s:textfield name="funcDto.viewId" maxlength="33" />
						</td>
						<td width="20%" class="tr1">
							功能模型ID
						</td>
						<td width="30%">
							<s:textfield name="funcDto.funcMId" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							顺序
						</td>
						<td width="30%">
							<s:textfield name="funcDto.orderBy" maxlength="3" />
							<span class="Eng"> <span id="funcDto_orderBy_err"><c:out value='${errors["funcDto.orderBy"][0]}'/></span>
						</td>
						<td width="20%" class="tr1">
							是否权限控制
						</td>
						<td width="30%">
							<dict:radioDict id="funcDto_isAuth" name="funcDto.isAuth" dictCode="YESNO" dictValue="%{funcDto.isAuth}" style="width:20px;"/>
							<span class="Eng">* <span id="funcDto_isAuth_err"><c:out value='${errors["funcDto.isAuth"][0]}'/></span>
							</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							上级功能名称
						</td>
						<td width="80%" colspan="3">
							<script>document.write(parent.getUpName());</script>
						</td>
					</tr>
				</table>
				<br />
				<br />
				<br />
				<div class="ptop_10 txac">
					<input type="button" value="提 交" onclick="edit(this);" class="botton_img_add">
					&nbsp;&nbsp;
					<input type="reset" value="重 置" class="botton_img_search" />
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
    	var funcDtoName = document.getElementById("funcDto_name");
    	if(val.isBlank(funcDtoName)){
    		document.getElementById("funcDto_name_err").innerHTML = "<br/>功能名称-不能为空";
    		funcDtoName.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_name_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.type']:checked").val()){
    		document.getElementById("funcDto_type_err").innerHTML = "<br/>功能类型-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_type_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.isAuth']:checked").val()){
    		document.getElementById("funcDto_isAuth_err").innerHTML = "<br/>是否权限控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_isAuth_err").innerHTML = "";
    	}
    	
    	var funcDtoFuncCode = document.getElementById("funcDto_funcCode");
    	if(val.isBlank(funcDtoFuncCode)){
    		document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码-不能为空";
    		funcDtoFuncCode.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_funcCode_err").innerHTML = "";
    	}
    	var funcDto_orderBy = document.getElementById("funcDto_orderBy");
	   	if(isNaN(funcDto_orderBy.value)){
    		document.getElementById("funcDto_orderBy_err").innerHTML = "<br/>顺序-只能为数字";
    		funcDto_orderBy.focus();
    		return false;
	   	}
    	
    	return true;
    }

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>