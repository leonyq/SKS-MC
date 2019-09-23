<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.mes.common.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="订单管理22" />
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
		<bu:func viewId="e8b09563969e4289b3ecc3bab47e28ad" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="e8b09563969e4289b3ecc3bab47e28ad" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="e8b09563969e4289b3ecc3bab47e28ad" formId="5878e0ec349a40f5805711444035fff6" list="dataList" formidFirstId="5878e0ec349a40f5805711444035fff6" relColIds="5f91cc16b96a48b593d09c4de18d8bc3,5f91cc16b96a48b593d09c4de18d8bc3" subFormIds="ebdc1d04fc9b4685950f89bd348e7689,240e00fb449541a98541a619412c0a7a" subRelColIds="034c2cb15bb9441b848b9e05c7378c28,012e3b5614cf4af6969d88afc74ae640" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="e8b09563969e4289b3ecc3bab47e28ad" formId="ebdc1d04fc9b4685950f89bd348e7689" isSubForm="1" list="dataListSub" formidFirstId="5878e0ec349a40f5805711444035fff6" relColIds="cce670c4c1774801af258b7d0c0b6b7d" subFormIds="800b729ce4684d54ab5e1fadca80d042" subRelColIds="7b7f8ffad1054e5592744c6f05ceed32" />
  <div class="center">
    <s:include value="/common/paginationAx.jsp?formId=ebdc1d04fc9b4685950f89bd348e7689&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="e8b09563969e4289b3ecc3bab47e28ad" formId="800b729ce4684d54ab5e1fadca80d042" isSubForm="1" list="dataListSub" formidFirstId="5878e0ec349a40f5805711444035fff6" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/common/paginationAx.jsp?formId=800b729ce4684d54ab5e1fadca80d042&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="e8b09563969e4289b3ecc3bab47e28ad" formId="240e00fb449541a98541a619412c0a7a" isSubForm="1" list="dataListSub" formidFirstId="5878e0ec349a40f5805711444035fff6" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/common/paginationAx.jsp?formId=240e00fb449541a98541a619412c0a7a&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
		</div>
	</div>
		<bu:submit viewId="e8b09563969e4289b3ecc3bab47e28ad" />
		<bu:script viewId="e8b09563969e4289b3ecc3bab47e28ad" />
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
