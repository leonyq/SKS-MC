<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="采购入库" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>	
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<bu:func viewId="55c3a38904ef48009d08a904435cbbcc" />
		<form id="searchForm" name="searchForm" action="/mes/buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="55c3a38904ef48009d08a904435cbbcc" />
		</form>		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post" >
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="55c3a38904ef48009d08a904435cbbcc" formId="240e00fb449541a98541a619412c0a7a" list="dataList" formidFirstId="240e00fb449541a98541a619412c0a7a" relColIds="c462ec8e78bb482a9b8d5817eae2a312" subFormIds="2497a3c406d548f185f6e42e2a29ca29" subRelColIds="278dac00c5a047b9958520c0a23b90da" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="55c3a38904ef48009d08a904435cbbcc" formId="2497a3c406d548f185f6e42e2a29ca29" isSubForm="1" list="dataListSub" formidFirstId="240e00fb449541a98541a619412c0a7a" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/common/paginationAx.jsp?formId=2497a3c406d548f185f6e42e2a29ca29&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
		</div>
	</div>
		<bu:submit viewId="55c3a38904ef48009d08a904435cbbcc" />
		<bu:script viewId="55c3a38904ef48009d08a904435cbbcc" />

	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

	<script type="text/javascript">

	var isQuery = false;
	
	function query(thisObj){
		alert(document.forms.searchForm.action);
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		//util.showTopLoading();
		//isQuery=true;
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

 
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
