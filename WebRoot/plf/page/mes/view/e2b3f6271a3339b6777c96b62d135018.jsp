<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="部门管理" />
	</title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<bu:func viewId="8ddc5cde34894affb57d10f265f1cf7c" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
		<bu:search viewId="8ddc5cde34894affb57d10f265f1cf7c" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
		<bu:form viewId="8ddc5cde34894affb57d10f265f1cf7c" formId="e7f5bbc2329c46be837ce886e0536227" list="dataList" formidFirstId="e7f5bbc2329c46be837ce886e0536227" relColIds="34a7ef60e425439f8f1042216f8e6b16" subFormIds="51a173c6ab7b4879867e089991def501" subRelColIds="971763c18e81427bbaa89d797120e78a" />
  <% if("1".equals(request.getAttribute("isPage"))){%>  <div class="center">
    <s:include value="/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="8ddc5cde34894affb57d10f265f1cf7c" formId="51a173c6ab7b4879867e089991def501" isSubForm="1" list="dataListSub" formidFirstId="e7f5bbc2329c46be837ce886e0536227" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/common/paginationAx.jsp?formId=51a173c6ab7b4879867e089991def501&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
		</div>
	</div>
		<bu:submit viewId="8ddc5cde34894affb57d10f265f1cf7c" />
		<bu:script viewId="8ddc5cde34894affb57d10f265f1cf7c" />

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
			_toClickColorMap(tableTrJs,$(this).attr("id"));<%-- 设置table点击行颜色 --%>
			_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
		});
	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
