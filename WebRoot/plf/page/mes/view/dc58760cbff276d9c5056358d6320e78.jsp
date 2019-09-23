<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>  
	<title>
		<dict:lang value="hxh-h1测试" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="0c0e6e03e3204524983b03f875effc80"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="16adf03fd10845f09a1d81a8d6a3d972" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="16adf03fd10845f09a1d81a8d6a3d972" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='0c0e6e03e3204524983b03f875effc80'/>
 <div class="panel datagrid" style="overflow-x: auto" id="0c0e6e03e3204524983b03f875effc80">
 <div class="datagrid-view-kz" id="datagrid-view-kz" style="overflow-x: auto;overflow-y:hidden; ;width:100%;">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="display: block;">
		<bu:table  id="datagrid-htable-kz" style="width:100%" cssClass="datagrid-htable fixedTable" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="0c0e6e03e3204524983b03f875effc80" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CITY" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AREA" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TOWN" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST_FILED1" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TREE_TEST1" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TREE_TEST2" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEXT_AREA" formId="0c0e6e03e3204524983b03f875effc80" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BUTTON_TEST" formId="0c0e6e03e3204524983b03f875effc80" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body" id="datagrid-body-kz" style="margin-top: 0px;overflow-y: auto;overflow-x: hidden;" onscroll="tableScroll()">
		<bu:table style="width:100%" cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_0c0e6e03e3204524983b03f875effc80">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="0c0e6e03e3204524983b03f875effc80" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="PROVINCE" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="PROVINCE" formId="0c0e6e03e3204524983b03f875effc80" value="%{PROVINCE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="CITY" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="CITY" formId="0c0e6e03e3204524983b03f875effc80" value="%{CITY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="AREA" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="AREA" formId="0c0e6e03e3204524983b03f875effc80" value="%{AREA}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="TOWN" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="TOWN" formId="0c0e6e03e3204524983b03f875effc80" value="%{TOWN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="TEST_FILED1" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="TEST_FILED1" formId="0c0e6e03e3204524983b03f875effc80" value="%{TEST_FILED1}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="TREE_TEST1" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="TREE_TEST1" formId="0c0e6e03e3204524983b03f875effc80" value="%{TREE_TEST1}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="TREE_TEST2" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="TREE_TEST2" formId="0c0e6e03e3204524983b03f875effc80" value="%{TREE_TEST2}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="TEXT_AREA" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="TEXT_AREA" formId="0c0e6e03e3204524983b03f875effc80" value="%{TEXT_AREA}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="BUTTON_TEST" formId="0c0e6e03e3204524983b03f875effc80" >
				<bu:ui colNo="BUTTON_TEST" formId="0c0e6e03e3204524983b03f875effc80" value="%{BUTTON_TEST}" seq="%{#seq}" />
			</bu:td>
		</bu:tr>
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

		<bu:form viewId="16adf03fd10845f09a1d81a8d6a3d972" formId="db443a5daffd43559462ddc5bdcd26f5" isSubForm="1" list="dataListSub" formidFirstId="0c0e6e03e3204524983b03f875effc80" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=db443a5daffd43559462ddc5bdcd26f5&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="16adf03fd10845f09a1d81a8d6a3d972" />
		<bu:script viewId="16adf03fd10845f09a1d81a8d6a3d972" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		if($("#isClearOrder").val()==1){
    		clearSelectOrder();
    	}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
