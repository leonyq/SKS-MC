<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="测试入库单主单1" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="be2d5ac52d404bfe84e643fa732001ff"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="7fa7604214f04acf8c2526184d30145b" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="7fa7604214f04acf8c2526184d30145b" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="be2d5ac52d404bfe84e643fa732001ff">
  <input type="hidden" name="formId" value="be2d5ac52d404bfe84e643fa732001ff" />
		<bu:table id="table_be2d5ac52d404bfe84e643fa732001ff" width="100%" cssClass="dlist-table table-line" viewId="7fa7604214f04acf8c2526184d30145b" formId="be2d5ac52d404bfe84e643fa732001ff" list="dataList" formidFirstId="be2d5ac52d404bfe84e643fa732001ff" relColIds="0a5019fd7112417e868a362a0a65c893" subFormIds="0be6a165f7874fde9156ff9fa407b5d0" subRelColIds="84812ce1c8f843bb9591952b782d1aec">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="be2d5ac52d404bfe84e643fa732001ff" i18n="1"/></th>
			<th><bu:thSBox formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="RECEIPT_DATE" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="RECEIPT" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="SINGLER" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="REJECTS" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="RECEIPT_NO" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="DOCUMENTS_STATE" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="ORGANIZATION" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
			<th><bu:uitn colNo="SUPPLIER" formId="be2d5ac52d404bfe84e643fa732001ff" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_be2d5ac52d404bfe84e643fa732001ff">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="be2d5ac52d404bfe84e643fa732001ff" /></td>
			<bu:td colNo="RECEIPT_DATE" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="RECEIPT_DATE" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{RECEIPT_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="RECEIPT" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="RECEIPT" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{RECEIPT}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="SINGLER" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="SINGLER" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{SINGLER}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="REJECTS" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="REJECTS" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{REJECTS}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="RECEIPT_NO" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="RECEIPT_NO" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{RECEIPT_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="DOCUMENTS_STATE" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="DOCUMENTS_STATE" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{DOCUMENTS_STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="ORGANIZATION" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="ORGANIZATION" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{ORGANIZATION}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="SUPPLIER" formId="be2d5ac52d404bfe84e643fa732001ff" >
				<bu:ui colNo="SUPPLIER" formId="be2d5ac52d404bfe84e643fa732001ff" value="%{SUPPLIER}" seq="%{#seq}" />
			</bu:td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="7fa7604214f04acf8c2526184d30145b" formId="0be6a165f7874fde9156ff9fa407b5d0" isSubForm="1" list="dataListSub" formidFirstId="be2d5ac52d404bfe84e643fa732001ff" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=0be6a165f7874fde9156ff9fa407b5d0&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="7fa7604214f04acf8c2526184d30145b" />
		<bu:script viewId="7fa7604214f04acf8c2526184d30145b" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg){
		utilsFp.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
