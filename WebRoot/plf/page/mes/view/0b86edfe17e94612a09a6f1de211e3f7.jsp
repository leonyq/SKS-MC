<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="N级关联1edit" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>
<body>

	<div class="all">
		<bu:func viewId="a8c0dd36c97249389002ab7bf8cbcb77" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="a8c0dd36c97249389002ab7bf8cbcb77" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="a8c0dd36c97249389002ab7bf8cbcb77" formId="f111ae57358b474487aef060059b9b95" list="dataList" formidFirstId="f111ae57358b474487aef060059b9b95" relColIds="d127e9c1327e42fdb5ce3699830be585" subFormIds="9890915588da4aab84def5e1715f1e01" subRelColIds="c438611f6a2b4ec5aa4dd2748d27fcfe" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="a8c0dd36c97249389002ab7bf8cbcb77" formId="9890915588da4aab84def5e1715f1e01" isSubForm="1" list="dataListSub"  formidFirstId="f111ae57358b474487aef060059b9b95" relColIds="9f15b2eba6a84863a825c85812740325" subFormIds="f59b1c643bea4cfdb4341d7373bdda08" subRelColIds="b88bb9a219154cff8d6ff69dfd512ef5" />
  <div class="center">
    <s:include value="/plf/common/paginationAx.jsp?formId=9890915588da4aab84def5e1715f1e01&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="a8c0dd36c97249389002ab7bf8cbcb77" formId="f59b1c643bea4cfdb4341d7373bdda08" isSubForm="1" list="dataListSub"  formidFirstId="f111ae57358b474487aef060059b9b95" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/common/paginationAx.jsp?formId=f59b1c643bea4cfdb4341d7373bdda08&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
		</div>
	</div>
		<bu:submit viewId="a8c0dd36c97249389002ab7bf8cbcb77" />
		<bu:script viewId="a8c0dd36c97249389002ab7bf8cbcb77" />
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
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
