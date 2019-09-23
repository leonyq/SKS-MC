 <%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="工单信息-新列表" />
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
		<bu:header formId ="d34c8f48bead40d88c24a153c731de82"/>

</head>
<body scroll="auto" style="overflow: hidden;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="b3bce87b2e794da195d3e2c840340603" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="b3bce87b2e794da195d3e2c840340603" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='d34c8f48bead40d88c24a153c731de82'/>
 <div class="panel datagrid datagrid-div1"  id="d34c8f48bead40d88c24a153c731de82">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"  style="min-width:1800px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d34c8f48bead40d88c24a153c731de82" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:150px;" ><bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			
		
			
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			
			<td class="datagrid-cell" style="width:90px;" ><bu:uitn colNo="CREATE_USER" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_TIME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width:1780px;">
		<tbody id="tbody_d34c8f48bead40d88c24a153c731de82">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" style="width: 130px;" colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
				<bu:td cssClass="datagrid-cell datagrid-cell-11" style="width: 70px;text-align:center;" colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_STATUS}" seq="%{#seq}" />
							<input type="hidden" id="PROJECT_STATUS_${ID }"  value="${PROJECT_STATUS }"/>

			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width:130px;" colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" value="%{DESTROY_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width:200px;" colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" value="%{CUST_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width:150px;" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_MATERIAL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width:150px;" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width:140px;" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_STANDARD}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width:70px;text-align:right;" align="right" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" style="width:70px;text-align:right;" align="right" colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{FQC_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" style="width:70px;text-align:right;" align="right" colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{FINISH_COUNT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" style="width:70px;text-align:right;" colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="SCRAPPED_QTY" formId="d34c8f48bead40d88c24a153c731de82" value="%{SCRAPPED_QTY}" seq="%{#seq}" />
			</bu:td>
			
			
		
			
			
			<bu:td cssClass="datagrid-cell datagrid-cell-12" style="width: 90px;" colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_STEP}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" style="width:90px;" colNo="CREATE_USER" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="CREATE_USER" formId="d34c8f48bead40d88c24a153c731de82" value="%{CREATE_USER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-14" style="width:140px;text-align:center;" colNo="CREATE_TIME" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="CREATE_TIME" formId="d34c8f48bead40d88c24a153c731de82" value="%{CREATE_TIME}" seq="%{#seq}" />
			</bu:td>
			
			
			<bu:td cssClass="datagrid-cell datagrid-cell-15" style="text-align:center;" colNo="EDIT_TIME" formId="d34c8f48bead40d88c24a153c731de82" >
				<bu:ui colNo="EDIT_TIME" formId="d34c8f48bead40d88c24a153c731de82" value="%{EDIT_TIME}" seq="%{#seq}" />
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

	
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="b3bce87b2e794da195d3e2c840340603" />
		<bu:script viewId="b3bce87b2e794da195d3e2c840340603" />
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
