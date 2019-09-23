<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="工艺信息" />
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
		<bu:header formId ="9ce89b8198274a25b7219ad226eda21e"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="44f947fba9364e67bd2dce61cc2e9b8d" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="44f947fba9364e67bd2dce61cc2e9b8d" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='9ce89b8198274a25b7219ad226eda21e'/>
 <div class="panel datagrid" style="overflow-x: auto" id="9ce89b8198274a25b7219ad226eda21e">
 <div class="datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="display: block;">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable"  >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9ce89b8198274a25b7219ad226eda21e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CREATE_USER" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body" id="datagrid-body-kz" style="margin-top: 0px;overflow-y: auto;overflow-x: hidden;" onscroll="tableScroll()">
		<bu:table  cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  >
		<tbody id="tbody_9ce89b8198274a25b7219ad226eda21e">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" style="width:110px;" colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width:110px;" colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width:90px;" colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_PRODUCT_STEP}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width:90px;" colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_PROCESS_FACE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width:110px;" colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_ROUTE_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width:110px;" colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_PREPOSE_TECH}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width:70px;text-align:center;" colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_PROCESS_PRIOR}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" style="width:70px;text-align:center;" colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_DEFAULT_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" style="width:70px;text-align:center;" colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CT_VALID_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" style="width:90px;" colNo="CREATE_USER" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CREATE_USER" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CREATE_USER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11"  style="text-align:center;" colNo="CREATE_TIME" formId="9ce89b8198274a25b7219ad226eda21e" >
				<bu:ui colNo="CREATE_TIME" formId="9ce89b8198274a25b7219ad226eda21e" value="%{CREATE_TIME}" seq="%{#seq}" />
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
		<bu:submit viewId="44f947fba9364e67bd2dce61cc2e9b8d" />
		<bu:script viewId="44f947fba9364e67bd2dce61cc2e9b8d" />
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
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
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
