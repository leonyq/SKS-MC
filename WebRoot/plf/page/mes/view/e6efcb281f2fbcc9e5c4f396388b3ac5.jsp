<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="TAB_SUB2_03" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="/mes/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body>

	<div class="all">
	<div id="searchDiv" name="searchDiv">
	<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
	</form>	
	</div>
		<bu:func viewId="3b97606350254b76bdcd14f60a3769da" />
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="3b97606350254b76bdcd14f60a3769da" formId="0c0e6e03e3204524983b03f875effc80" list="dataList" formidFirstId="0c0e6e03e3204524983b03f875effc80" relColIds="" subFormIds="" subRelColIds="" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>
		</div>
	</div>
		<bu:submit viewId="3b97606350254b76bdcd14f60a3769da" />
		<bu:script viewId="3b97606350254b76bdcd14f60a3769da" />
	<script type="text/javascript">
	var searchForm;
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
