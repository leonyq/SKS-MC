<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="工单信息-新列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="d34c8f48bead40d88c24a153c731de82"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="1ebc333e93ab4da8bf64fcda7f476341" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="1ebc333e93ab4da8bf64fcda7f476341" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='d34c8f48bead40d88c24a153c731de82'/>
 <div class="panel datagrid datagrid-div1"  id="d34c8f48bead40d88c24a153c731de82">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="d34c8f48bead40d88c24a153c731de82" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_d34c8f48bead40d88c24a153c731de82">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" value="%{DESTROY_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" value="%{CUST_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_MATERIAL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_STANDARD}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_STATUS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{ACTUAL_END_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{ACTUAL_START_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_LINE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" value="%{PM_MEMO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{TPPB_PLAN_DELIVERY_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-14" colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROLEPSIS_END_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-15" colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROLEPSIS_START_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-16" colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-17" colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82" value="%{WORKING_SC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-18" colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{FINISH_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-19" colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{FQC_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-20" colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" value="%{SCRAPPED_QTY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-21" colNo="ID" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="ID" formId="d34c8f48bead40d88c24a153c731de82" value="%{ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-22" colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PM_CLOSE_REASON" formId="d34c8f48bead40d88c24a153c731de82" value="%{PM_CLOSE_REASON}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-23" colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_STEP}" seq="%{#seq}" />
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

		<bu:form viewId="1ebc333e93ab4da8bf64fcda7f476341" formId="fbe85506ea9d4a32b0cf78996898c620" isSubForm="1" list="dataListSub" formidFirstId="d34c8f48bead40d88c24a153c731de82" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=fbe85506ea9d4a32b0cf78996898c620&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="1ebc333e93ab4da8bf64fcda7f476341" />
		<bu:script viewId="1ebc333e93ab4da8bf64fcda7f476341" />
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
