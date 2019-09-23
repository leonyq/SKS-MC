<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="已配置用户"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">
	<form id="search_form" name="searchForm" action="${path}sys/RoleAction_showConfUser.ms" method="post">
		<s:hidden id="roleDto_Id" name="roleDto.Id" />
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<input type="hidden" id="userDto_roleId" name="userDto.roleId" value="<s:property value="roleDto.Id"/>" />
	<table class="add_table">
        <tr>
          <td align="center"><b style="color: blue;">【<s:property value="roleDto.name" />】<dict:lang value=" 已配置用户列表"/></b></td>
       </tr>
     </table>
    <div style="padding-top: 5px;"></div>
	<table class="search_table">
		<tr>
			<td width="2%">
		  		<img src="${path}plf/style/css2/images/ss.gif" width="29" height="28" class="sp b_5"/>
		  	</td>
			<td width="26%">
			  	<dict:lang value="用户名称"/>：
			  	<s:textfield id="name" name="userDtoSh.name" cssClass="input_sh" maxlength="30" />
		  	</td>
			<td width="26%">
			  	<dict:lang value="登录名称"/>：
			  	<s:textfield id="url" name="userDtoSh.loginName" cssClass="input_sh" maxlength="120" />
		  	</td>
			<td width="26%">
			  	<dict:lang value="单位名称"/>：
			  	<s:textfield id="url" name="userDtoSh.deptName" cssClass="input_sh" maxlength="120" />
		  	</td>
			<td width="20%" align="right">
			    <input type="button" value="<dict:lang value="查询"/>" onclick="query(this);" class="botton_img_search"> 
			    &nbsp;&nbsp;<input type="button" value="<dict:lang value="配置"/>" onclick="add();" class="botton_img_add">
		  	</td>
	    </tr>
	</table>
	</form>
	
	<div>
    <table id="listTable" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="10%"><dict:lang value="编号"/></th>
			<th width="20%"><dict:lang value="用户名称"/></th>
			<th width="20%"><dict:lang value="登录名称"/></th>
			<th width="40%"><dict:lang value="单位名称"/></th>
			<th width="10%"><dict:lang value="操作"/></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="userLs" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="name"/></td>
			<td><s:property value="loginName"/></td>
			<td><s:property value="deptName"/><s:property value="upName"/></td>
			<td>
				<a href="javascript:del('<s:property value="rolePk"/>','<s:property value="id"/>');" title="<dict:lang value="删除角色用户"/>" >
				<img src="${IMG_PATH}/ContImg10.gif" /></a>
			</td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="roleUserDtoSh_id" name="roleUserDtoSh.id" />
		<input type="hidden" id="roleUserDtoSh_userId" name="roleUserDtoSh.userId" />
	</form>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.search_form.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var url = "${path}sys/RoleAction_showAddRoleUser.ms?roleDto.id=<s:property value="roleDto.Id"/>&userDtoSh.roleId=<s:property value="roleDto.Id"/>";
      	showPopWin(url, 700, 500,null,"<dict:lang value="新增"/>【<s:property value="roleDto.name" />】<dict:lang value="用户"/>");
	}
	
	var delId = "";
	var userId = "";
	function del(id,uid){
		util.confirm(delConfirm);
		delId = id;
		userId = uid;
	}
	
	function delConfirm(){
     	document.forms.submit_form.action="${path}sys/FuncAction_delRoleUser.ms";
		$("#roleUserDtoSh_id").val(delId);
		$("#roleUserDtoSh_userId").val(userId);
		document.forms.submit_form.submit();
	}
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>