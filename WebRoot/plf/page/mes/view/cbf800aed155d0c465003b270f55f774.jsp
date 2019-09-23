<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title>
		<dict:lang value="TAB_SUB" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="e32d6c01ae5246e99ef7d5e8152290bb"/>

</head>
<body>

	<div class="content-in">
		<bu:func viewId="26313b89913c440a865b1595d249f337" />
			<div class="bd">
				<div id="searchDiv" name="searchDiv">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post"></form>
				</div>
				<form id="listForm" name="listForm"
					action="${path}buss/bussModel.ms" method="post">
					<input type="hidden" name="exeid" value="${exeid}" />
					<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="26313b89913c440a865b1595d249f337" formId="e32d6c01ae5246e99ef7d5e8152290bb" list="dataList" formidFirstId="e32d6c01ae5246e99ef7d5e8152290bb" relColIds="" subFormIds="" subRelColIds="" currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


				</form>
			</div>
	</div>
		<bu:submit viewId="26313b89913c440a865b1595d249f337" />
		<bu:script viewId="26313b89913c440a865b1595d249f337" />
	<script type="text/javascript">
	var searchForm;
	var isQuery = false;
	function query(thisObj){
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
		}
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
		/*if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
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
		$("#searchForm").submit();*/
		query();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		$(".botton_img_add").hide();
	}

</script>

	<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
