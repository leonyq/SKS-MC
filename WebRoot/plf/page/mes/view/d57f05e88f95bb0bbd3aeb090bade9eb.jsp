<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="制令单" />
	</title>
	<style>
		td{
			box-sizing:border-box;
		}
	</style>
	
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="9b18994844b049f2ad90204b77793334"/>

</head>
<body scroll="auto" style="overflow: hidden;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="6f7db57ddfe34ce3b809065dd26037f4" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="6f7db57ddfe34ce3b809065dd26037f4" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
                      <table cellpadding="0" cellspacing="1"></table>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='9b18994844b049f2ad90204b77793334'/>
 <div class="panel datagrid datagrid-div1"  id="9b18994844b049f2ad90204b77793334">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"  style="min-width:1650px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center" ><bu:thSeq  formId="9b18994844b049f2ad90204b77793334" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center" ><bu:thSBox listType="2" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 130px;"><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="PM_STATUS" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 110px;"><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 200px;"><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="PM_FINISH_COUNT" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="PM_SCRAP_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" /></td>

			<td class="datagrid-cell"><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width:1630px;">
		<tbody id="tbody_9b18994844b049f2ad90204b77793334">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="9b18994844b049f2ad90204b77793334" /></td>

            <bu:td cssClass="datagrid-cell datagrid-cell-1" style="width: 140px;" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MO_NUMBER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width: 130px;" colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" value="%{PM_PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width: 70px;text-align:center;" colNo="PM_STATUS" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_STATUS" formId="9b18994844b049f2ad90204b77793334" value="%{PM_STATUS}" seq="%{#seq}" />
				<input type="hidden" id="PM_STATUS_${ID }"  value="${PM_STATUS }"/>
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width: 110px;" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" value="%{PM_AREA_SN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width: 150px;" colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MODEL_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width: 200px;" colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" value="%{PRODUCT_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width: 150px;" colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" value="%{PRODUCT_STANDARD}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" style="width: 70px;text-align:right;" align="right" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" value="%{PM_TARGET_QTY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" style="width: 70px;text-align:right;" align="right" colNo="PM_FINISH_COUNT" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_FINISH_COUNT" formId="9b18994844b049f2ad90204b77793334" value="%{PM_FINISH_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" style="width: 70px;text-align:right;" align="right" colNo="PM_SCRAP_QTY" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_SCRAP_QTY" formId="9b18994844b049f2ad90204b77793334" value="%{PM_SCRAP_QTY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" style="width: 140px;text-align:center;" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_SCHEDULE_DATE}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-12" style="width:90px;" colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_EMP}" seq="%{#seq}" />
			</bu:td>
			
			
			<bu:td cssClass="datagrid-cell datagrid-cell-13" style="text-align:center;" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_DATE}" seq="%{#seq}" />
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
		<bu:submit viewId="6f7db57ddfe34ce3b809065dd26037f4" />
		<bu:script viewId="6f7db57ddfe34ce3b809065dd26037f4" />
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
