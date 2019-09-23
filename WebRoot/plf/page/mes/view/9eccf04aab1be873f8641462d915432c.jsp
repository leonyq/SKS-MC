<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.mes.common.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="用户管理" />
	</title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<bu:func viewId="4ece25b83c6f42d897ba1835ce88c982" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4ece25b83c6f42d897ba1835ce88c982" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="4ece25b83c6f42d897ba1835ce88c982" formId="669ba3796b5d4a08b400d734c819fd7c" list="dataList" formidFirstId="669ba3796b5d4a08b400d734c819fd7c" relColIds="" subFormIds="" subRelColIds="" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>
		</div>
	</div>
		<bu:submit viewId="4ece25b83c6f42d897ba1835ce88c982" />
		<bu:script viewId="4ece25b83c6f42d897ba1835ce88c982" />

	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
