<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="扩展列表2" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="/mes/plf/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body>

	<div class="all">
		<bu:func viewId="d4e6bc447bb247ad86f9340f72e5ea0e" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="d4e6bc447bb247ad86f9340f72e5ea0e" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="f3ccf2b66c9c4a9f927ed0cd2a8c5089">
  <input type="hidden" name="formId" value="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
		<bu:table id="table_f3ccf2b66c9c4a9f927ed0cd2a8c5089" cssClass="table_list" viewId="d4e6bc447bb247ad86f9340f72e5ea0e" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" list="dataList" formidFirstId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th><bu:thSBox formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089"></bu:thSBox></th>
			<th><bu:thSeq formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" i18n="1"></bu:thSeq></th>
			<th>test2</th>
			<th><bu:uitn colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
			<th><bu:uitn colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_f3ccf2b66c9c4a9f927ed0cd2a8c5089">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr onclick= "alert(12);">
			<td><bu:tdSBox formidFirstId="f3ccf2b66c9c4a9f927ed0cd2a8c5089"></bu:tdSBox></td>
			<td><bu:tdSeq seq="%{#seq.count}"></bu:tdSeq></td>
			<td>ssss</td>
			<td>
				<bu:ui colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{MU_TEXT}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{AGE}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{S_CHECK}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{M_CHECK}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_S}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_M}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TIMES}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{USER_POP}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{BUTTON}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{STATE}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UNAME}" seq="%{#seq}" onclick="alert('%{UNAME}-%{STATE}--%{U_ID2}');" />
			</td>
			<td>
				<bu:ui colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{U_ID2}" seq="%{#seq}" />
			</td>
			<td>
				<bu:ui colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TT}" seq="%{#seq}" />
			</td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
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
		<bu:submit viewId="d4e6bc447bb247ad86f9340f72e5ea0e" />
		<bu:script viewId="d4e6bc447bb247ad86f9340f72e5ea0e" />
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
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
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
