<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="视图模型"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/FuncAction_dataAuthConfigList.ms" method="post">
		<table class="search_table">
			<tr>
				<td>
					<span><dict:lang value="表名" /></span>
					<s:textfield id="paraMap_SERACH_TABLE_NAME" name="paraMap.SERACH_TABLE_NAME" value="${SERACH_TABLE_NAME}" cssClass="input_sh" maxlength="300" />	
				</td>
				<td>
					<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
				</td>
			</tr>
		</table>
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	</form>
	<div class="table_div">
			<table id="listTable" class="table_list" >
			    <thead>
					<tr class="tdcolor">
						<th width="40px"><dict:lang value="序号" /></th>
						<th style="width:300px"><dict:lang value="表名" /></th>
						<th style="width:130px"><dict:lang value="数据权限状态" /></th>
						<th style="width:40px"><dict:lang value="操作" /></th>
					</tr>
					<thead>
					<tbody>
					<c:forEach items="${listData}" var="dataAuthConfig" varStatus="status">
					    <tr>
						<td><c:out value='${status.count}'/></td>
						<td><c:out value='${dataAuthConfig.TABLE_NAME }'/></td>
						<td>
						<c:choose> 
							   <c:when test="${empty dataAuthConfig.ID}">
			                       	关闭
			 				    </c:when> 
							   <c:otherwise>
							               开启
							   </c:otherwise> 
							</c:choose> 
						</td>
						<td>
						<c:choose> 
							   <c:when test="${empty dataAuthConfig.ID}">
							      <a href="javascript:update('<c:out value="${dataAuthConfig.ID }"/>','<c:out value="${dataAuthConfig.TABLE_NAME }"/>','1')" title="<dict:lang value="" />" ><button class="layui-btn layui-btn-xs">开启</button></a>
							    </c:when> 
							   <c:otherwise>
							   	  <a href="javascript:update('<c:out value="${dataAuthConfig.ID }"/>','<c:out value="${dataAuthConfig.TABLE_NAME }"/>','2')" title="<dict:lang value="" />" ><button class="layui-btn layui-btn-xs layui-btn-danger">关闭</button></a>
							   </c:otherwise> 
							</c:choose> 
						</td>
					</tr>
					</c:forEach>
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
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function alertMsg(msg){
		alert(msg);
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function update(id,tableName,state){
		var SERACH_TABLE_NAME = $("#paraMap_SERACH_TABLE_NAME").val();
		window.location.href = "${path}sys/FuncAction_updateDataAuthState.ms?paraMap.ID="+id+"&paraMap.TABLE_NAME="+tableName+"&paraMap.STATE="+state+"&paraMap.SERACH_TABLE_NAME="+SERACH_TABLE_NAME;
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}

	
	$(function(){
		
		
	})
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>