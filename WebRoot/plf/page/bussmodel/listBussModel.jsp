<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模型管理"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/BussModelAction_listBussModel.ms" method="post">
		<input type="hidden" id="paraMap_MID" name="paraMap.treeID" value="<s:property value="paraMap.treeID"/>"/>
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		<s:hidden id="paraMap_path" name="paraMap.path" value="%{paraMap.path}"/>
		<s:hidden id="paraMap_treeTid" name="paraMap.treeTid" value="%{paraMap.treeTid}"/>
	<table class="search_table">
		<tr>
			<td >
			  	<div class="search_table_wrap">
				         <span><dict:lang value="编号" /></span>
				          <div class="layui-input-inline">
							<s:textfield id="shMap_ID" name="paraMap.ID" cssClass="input_sh" maxlength="30" />
				          </div>
				 </div>
		  	<div class="search_table_wrap">
				<span><dict:lang value="模型名称" /></span>
				<div class="layui-input-inline">
			  	<s:textfield id="shMap_PAGE_NAME" name="paraMap.M_NAME" cssClass="input_sh" maxlength="120" />
		 	          </div>
				 </div>
				 <div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
			    <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
			      <input type="button" value="<dict:lang value="新增" />" onclick="add()" class="layui-btn"> 
			          </div>
				        </div>
		  	</td>
	    </tr>
	</table>
		
		
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th style="width: 40px;"><dict:lang value="序号" /></th>
			<th  style="width: 140px;"><dict:lang value="模型ID" /></th>
			<th ><dict:lang value="模型名称" /></th>
			<th  style="width:140px;"><dict:lang value="模型编码" /></th>
			<th style="width: 150px;"><dict:lang value="操作" />
			</th>
		</tr>
		<thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="ID"/>"><s:property value="ID"/></td>
			<td title="<s:property value="M_NAME"/>"><s:property value="M_NAME"/></td>
			<td title="<s:property value="MODEL_CODE"/>"><s:property value="MODEL_CODE"/></td>
			<td class="layui-btn-left">
				<a href="javascript:update('<s:property value="id"/>')" class="layui-btn layui-btn-xs" title="<dict:lang value="修改" />" ><dict:lang value="修改" /></a>
				<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-xs" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><dict:lang value="删除" /></a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
		<input type="hidden" id="MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		parent.leftFrame.location.href= "${path}sys/BussModelAction_listBussModelTree.ms";<%-- 刷新模型树菜单列表 --%>
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}

	function add(){
		var url = "${path}sys/BussModelAction_forAddBussModel.ms?isSelf=1&paraMap.UP_M_ID=<c:out value='${paraMap.treeID}' />&paraMap.path=<c:out value='${paraMap.path}' />&paraMap.treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+window.parent.name;
		showPopWin(url, 700, 300,null,"<dict:lang value="新增"/>");
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_forEditBussModel.ms?paraMap.ID="+id+"&paraMap.treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+window.parent.name;
		showPopWin(url, 700, 300,null,"<dict:lang value="修改"/>");
	}

	function del(id){
		util.confirm(delConfirm,"",id);
		delId = id;
	}
	
	function delConfirm(id){
    document.forms.submitForm.action="${path}sys/BussModelAction_delBussModel.ms?treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+window.parent.name;
		$("#del_id").val(id);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>