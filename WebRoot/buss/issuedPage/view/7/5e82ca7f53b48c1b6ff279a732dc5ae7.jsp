<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="辅料信息" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="e09e1f47e824490d80ba2717d25498d3"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="f1922a00159d49b2aa3b9e624755bbbb" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="f1922a00159d49b2aa3b9e624755bbbb" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='e09e1f47e824490d80ba2717d25498d3'/>
 <div class="panel datagrid datagrid-div1"  id="e09e1f47e824490d80ba2717d25498d3">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="e09e1f47e824490d80ba2717d25498d3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_e09e1f47e824490d80ba2717d25498d3">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLSPEC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLTYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTLEASTCOUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DISCARD_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_OPEN_DISCARD_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLCOUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DURING_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{BARD_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_USE_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" value="%{LEAD_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-14" colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTMODEL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-15" colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-16" colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_CYCLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-17" colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_CLCLE_UNIT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-18" colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_MT_REMIND}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-19" colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BAR_RULE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-20" colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" >
				<bu:ui colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_USE_TIME}" seq="%{#seq}" />
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


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="f1922a00159d49b2aa3b9e624755bbbb" />
		<bu:script viewId="f1922a00159d49b2aa3b9e624755bbbb" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
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
