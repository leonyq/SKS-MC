<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="角色用户新增" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
		<style type="text/css">
			.table_list_sel {
				background-color:#ecf8d2;
			}
		</style>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
<div class="all">
	<form id="search_form" name="searchForm" action="${path}sys/RoleAction_showAddRoleUser.ms" method="post">
	<s:hidden id="roleDto_Id_sh" name="roleDto.Id" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
	<input type="hidden" id="userDtoSh_roleId_sh" name="userDtoSh.roleId" value="<s:property value="roleDto.Id"/>" />
	<table class="search_table">
		<tr>
			<td width="2%">
		  		<img src="${path}plf/style/css2/images/ss.gif?_mc_res_version=<%=PlfStaticRes.SS_GIF%>" width="29" height="28" class="sp b_5"/>
		  	</td>
			<td width="30%">
			  	<dict:lang value="用户名称：" />
			  	<s:textfield id="name" name="userDtoSh.name" cssClass="input_sh" cssStyle="width:100px;" maxlength="30" />
		  	</td>
			<td width="30%">
			  	<dict:lang value="登录名称：" />
			  	<s:textfield id="url" name="userDtoSh.loginName" cssClass="input_sh" cssStyle="width:100px;" maxlength="120" />
		  	</td>
			<td width="30%">
			  	<dict:lang value="单位名称：" />
			  	<s:textfield id="url" name="userDtoSh.deptName" cssClass="input_sh" cssStyle="width:100px;" maxlength="120" />
		  	</td>
			<td width="8%" align="right">
			    <input type="button" value="<dict:lang value="查 询" />" onclick="query(this);" class="botton_img_search">
		  	</td>
	    </tr>
	</table>
	</form>
	
	<form id="add_form" name="addForm" action="${path}sys/RoleAction_addRoleUser.ms" method="post">
		<s:hidden id="roleDto_Id" name="roleDto.Id" />
		<input type="hidden" id="userDto_roleId" name="userDto.roleId" value="<s:property value="roleDto.Id"/>" />
		<s:token />
	  <table id="listTable" class="table_list">
		<thead>
			<tr class="tdcolor">
				<th width="10%"><dict:lang value="编号" /></th>
				<th width="20%"><dict:lang value="用户名称" /></th>
				<th width="20%"><dict:lang value="登录名称" /></th>
				<th width="35%"><dict:lang value="单位名称" /></th>
				<th width="15%"><dict:lang value="操作" /><input type="checkbox" id="cbox_all" onclick="selectAll(this);" title="全选" style="cursor: pointer;width: 20px;" /></th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="userLs" status="index">
			<tr id="tr_<s:property value="#index.count"/>" onclick='selectTr(this,"ckBox_<s:property value="#index.count"/>");' style="cursor: pointer;" >
				<td><s:property value="#index.count"/></td>
				<td><s:property value="name"/></td>
				<td><s:property value="loginName"/></td>
				<td><s:property value="deptName"/><s:property value="upName"/></td>
				<td>
					<input type="checkbox" id="ckBox_<s:property value="#index.count"/>" name="appId" value="<c:out value='${ls.APP_ID }' />" />
				</td>
			</tr>
			<div style="display: none;" id="div_roleUser_<s:property value="#index.count"/>">
				<input type="hidden" name="roleUserLs[<s:property value="#index.index"/>].roleId" value="<s:property value="roleDto.Id"/>" />
				<input type="hidden" name="roleUserLs[<s:property value="#index.index"/>].userId" value="<s:property value="id"/>" />
			</div>
		</s:iterator>
		</tbody>
		</table>
	</form>
	
	<s:if test="null ==userLs || userLs.size<1">
		<div class="center height"><dict:lang value="无未配置用户" /></div>
	</s:if>
	<div class="center height">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
   <div class="ptop_10 txac">
		<input type="button" value="<dict:lang value="提 交" />" onclick="add(this);" class="botton_img_add">
		&nbsp;&nbsp;
		<input type="button" value="<dict:lang value="关 闭" />" onclick="closeWindow();" class="botton_img_search">
	</div>
</div>

<script type="text/javascript">
	var tableListSelClass = "table_list_sel";//选中行的背景颜色class	
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}

	function add(thisObj){
		if(!valData()){
			return ;
		}
		if(!checkSelect()){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			return ;
		}
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");}
		delNoSelect();
		document.forms.add_form.submit();
	}
        
    function valData(){
    	
    	return true;
    }
    
    function selectAll(obj){
		var checked = "";
		if($(obj).attr("checked")){
			checked = "true";
		}
		for(var i=1,j=<s:property value="userLs.size"/>+1;i<j;i++){
			if(checked == "true"){
				$("#ckBox_"+i).attr("checked","true");
				$("#tr_"+i).addClass(tableListSelClass);
			}else{
				$("#ckBox_"+i).attr("checked","");
				$("#tr_"+i).removeClass(tableListSelClass);
			}
		}
    }
	
	function selectTr(obj,id){
		$(obj).toggleClass(tableListSelClass);
		
		if($(obj).attr("class").indexOf(tableListSelClass)> -1){
			$("#"+id).attr("checked","true");
		}else{
			$("#"+id).attr("checked","");
		}
	}
	
	function checkSelect(){
		for(var i=1,j=<s:property value="userLs.size"/>+1;i<j;i++){
			if($("#ckBox_"+i).attr("checked")){
				return true;
			}
		}
		return false;
	}
	
	function delNoSelect(){
		for(var i=1,j=<s:property value="userLs.size"/>+1;i<j;i++){
			if(!$("#ckBox_"+i).attr("checked")){
				$("#div_roleUser_"+i).remove();
			}
		}
	}
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
	}   
	
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>