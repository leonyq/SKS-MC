<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.mes.common.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="采购订单管理" />
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
		<bu:func viewId="e674ae66697d494e931b8d2073b182a8" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="e674ae66697d494e931b8d2073b182a8" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="e674ae66697d494e931b8d2073b182a8" formId="47feb9b3c0d24db1a4f29b005b2aa7cb" list="dataList" formidFirstId="47feb9b3c0d24db1a4f29b005b2aa7cb" relColIds="" subFormIds="" subRelColIds="" />
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
		<bu:submit viewId="e674ae66697d494e931b8d2073b182a8" />
		<bu:script viewId="e674ae66697d494e931b8d2073b182a8" />
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
		
		<%-- 为什么这个判断不行?
		<s:if test="null != #parameters._initList && #parameters._initList == \"1\"">alert("reload"); </s:if> --%>
		<%-- <c:if test='${param._initList == "1"}'></c:if>这个可以 --%>
		<s:if test='null != #parameters[@com.more.mes.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.mes.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if><%-- 这个只有放入request setAttribute才有效 --%>

	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
