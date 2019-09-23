<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="cs002-zm" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="b698450bc8a243f38edcd1e22f534753"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="3b18f47509ba48f589fbd3fa661aec9c" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="3b18f47509ba48f589fbd3fa661aec9c" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
 <div class="panel datagrid" style="overflow-x: auto" id="b698450bc8a243f38edcd1e22f534753">
 <div class="datagrid-view_kz" id="datagrid-view_kz" style="overflow-x: auto;overflow-y:hidden; ;width:100%;">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="display: block;">
		<bu:table  id="datagrid-htable-kz" style="width:100%" cssClass="datagrid-htable fixedTable" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px" ><bu:thSeq formId="b698450bc8a243f38edcd1e22f534753" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox formId="b698450bc8a243f38edcd1e22f534753" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body" id="datagrid-body-kz" style="margin-top: 0px;height: 196px;overflow-x: hidden;">
		<bu:table style="width:100%" cssClass="datagrid-btable" id="datagrid-btable-kz">
		<tbody id="tbody_b698450bc8a243f38edcd1e22f534753">
		<bu:loop id="ls" value="dataList" status="seq" >
		<tr class="datagrid-row" select_flag="b698450bc8a243f38edcd1e22f534753">
			<td style="width:15px" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="b698450bc8a243f38edcd1e22f534753" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" >
				<bu:ui colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" value="%{CLASS_NAME}" seq="%{#seq}" />
			</bu:td>
		</tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="3b18f47509ba48f589fbd3fa661aec9c" formId="16fa05eac41448b085bcf03fb3c684fe" isSubForm="1" list="dataListSub" formidFirstId="b698450bc8a243f38edcd1e22f534753" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=16fa05eac41448b085bcf03fb3c684fe&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="3b18f47509ba48f589fbd3fa661aec9c" />
		<bu:script viewId="3b18f47509ba48f589fbd3fa661aec9c" />
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
