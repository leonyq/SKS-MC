<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="角色列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div >
	<form id="search_form" name="searchForm" action="${path}sys/RoleAction_listRolePublish.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
				<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	<table class="search_table">
		<tr>
			<td >
			  	<span><dict:lang value="角色名称" /></span>
			  	<s:textfield id="roleDtoSh_name" name="roleDtoSh.name" cssClass="input_sh" maxlength="30" />
		  	</td>
			<td>
			    <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn" style="margin-left:14px;">
			    <input type="button" value="<dict:lang value="确定" />" onclick="submitChk();" class="layui-btn">
				<input type="button" value="<dict:lang value="关闭" />" onclick="_closeWin();" class="layui-btn layui-btn-danger">
		  	</td>
	    </tr>
	</table>
	
	</form>
	
	<div class="table_div">
    <table id="listTable" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><input type="checkbox" id="SelectAll" onclick="selectAll();"></th>
			<th style="width: 40px;"><dict:lang value="序号" /></th>
			<th style="width: 240px;"><dict:lang value="角色名称" /></th>
			<th ><dict:lang value="角色描述" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="roleLs" status="index">
		<tr>
			<td><input type="checkbox" name="userDtoId" id="subcheck" value="<c:out value='${id}' />"></td>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="name"/>"><s:property value="name"/></td>
			<td title="<s:property value="remark"/>"><s:property value="remark"/></td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="roleDtoSh_id" name="roleDtoSh.id" />
	</form>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	var curIframeName = "<c:out value='${curIframeName}' />";
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
		}else{
			$(":checkbox").attr("checked",false);
		}
	}
	
	function query(thisObj){
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function _closeWin(){
		closePopWin();
	}
	
	function submitChk(){
		var _names = "";
		var _ids = "";
		$("#listTable").find("tbody tr").each(function(seq) {
			//$(this).find(":checkbox").prop("checked",$(thisObj).prop("checked"));
			if($(this).find(":checkbox").prop("checked")){
				//console.log($(this).find(":checkbox").val());
				_ids += $(this).find(":checkbox").val()+",";
				_names += $(this).find("td")[2].innerText+",";
			}
		});
		if(_ids != "" && _ids != null){
			_ids = _ids.substring(0,_ids.length-1);
			_names = _names.substring(0,_names.length-1);
		}
		 var doc = getSrcDom({type:"document"});
		 doc.getElementById("funcdto_roleid").value=_ids;
		 doc.getElementById("role_name").value=_names;
		_closeWin();
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