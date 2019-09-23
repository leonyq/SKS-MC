<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="h-extend-list" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="101f8dc9b0c345698f8b6dec38c0d03c"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="c902657113cf4ce18b2ca64b4b868540" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="c902657113cf4ce18b2ca64b4b868540" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="101f8dc9b0c345698f8b6dec38c0d03c">
  <input type="hidden" name="formId" value="101f8dc9b0c345698f8b6dec38c0d03c" />
		<bu:table id="table_101f8dc9b0c345698f8b6dec38c0d03c" width="1800px" cssClass="dlist-table table-line" viewId="c902657113cf4ce18b2ca64b4b868540" formId="101f8dc9b0c345698f8b6dec38c0d03c" list="dataList" formidFirstId="101f8dc9b0c345698f8b6dec38c0d03c" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="101f8dc9b0c345698f8b6dec38c0d03c" i18n="1"/></th>
			<th><bu:thSBox formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="NO" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="T_TIME" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="HREF_TEST" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="IS_CHECK" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="TREE_TEST1" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="TREE_TEST2" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
			<th><bu:uitn colNo="AJAX_TREE" formId="101f8dc9b0c345698f8b6dec38c0d03c" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_101f8dc9b0c345698f8b6dec38c0d03c">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="101f8dc9b0c345698f8b6dec38c0d03c" /></td>
			<bu:td colNo="NO" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="NO" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="T_TIME" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="T_TIME" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{T_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="HREF_TEST" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="HREF_TEST" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{HREF_TEST}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="IS_CHECK" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="IS_CHECK" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{IS_CHECK}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="TREE_TEST1" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="TREE_TEST1" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{TREE_TEST1}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="TREE_TEST2" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="TREE_TEST2" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{TREE_TEST2}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="AJAX_TREE" formId="101f8dc9b0c345698f8b6dec38c0d03c" >
				<bu:ui colNo="AJAX_TREE" formId="101f8dc9b0c345698f8b6dec38c0d03c" value="%{AJAX_TREE}" seq="%{#seq}" />
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


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="c902657113cf4ce18b2ca64b4b868540" />
		<bu:script viewId="c902657113cf4ce18b2ca64b4b868540" />
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
 	
 				$('body').mCustomScrollbar({
				          scrollInertia:150,
				          horizontalScroll:true
				        });

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
