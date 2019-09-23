<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="替代物料" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="79e822d8d663404fa06531adbb740722"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="2093f32019404ba38845c0b98dbfea7e" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="2093f32019404ba38845c0b98dbfea7e" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='79e822d8d663404fa06531adbb740722'/>
 <div class="panel datagrid datagrid-div1"  id="79e822d8d663404fa06531adbb740722">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner"  >
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz "  >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row datagrid-title-kz" id="datagrid-title-kz"  >
			<td class="datagrid-cell" style="width:25px; text-align:center;" ><bu:thSeq  formId="79e822d8d663404fa06531adbb740722" i18n="1"/></td>
			<td class="datagrid-cell" style="width:25px; text-align:center"><bu:thSBox listType="2" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_TYPE" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_MODEL_CODE" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_ITEM_MIAN" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_MAIN_NAME" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_MAIN_TYPE" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_ITEM_REPLACE" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_ITEM_NAME" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_ITEM_DESC" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_STATUS" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_MEMO" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_PROJECT_ITEM" formId="79e822d8d663404fa06531adbb740722" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CR_BOM_ITEM" formId="79e822d8d663404fa06531adbb740722" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()"  style="overflow-x:hidden;" >
		<bu:table cssClass="datagrid-btable fixedTable datagrid-btable-kz  query-list" id="datagrid-btable-kz" >
		<tbody id="tbody_79e822d8d663404fa06531adbb740722">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:25px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:25px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="79e822d8d663404fa06531adbb740722" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CR_TYPE" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_TYPE" formId="79e822d8d663404fa06531adbb740722" value="%{CR_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="CR_MODEL_CODE" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_MODEL_CODE" formId="79e822d8d663404fa06531adbb740722" value="%{CR_MODEL_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CR_ITEM_MIAN" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_ITEM_MIAN" formId="79e822d8d663404fa06531adbb740722" value="%{CR_ITEM_MIAN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="CR_MAIN_NAME" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_MAIN_NAME" formId="79e822d8d663404fa06531adbb740722" value="%{CR_MAIN_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CR_MAIN_TYPE" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_MAIN_TYPE" formId="79e822d8d663404fa06531adbb740722" value="%{CR_MAIN_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CR_ITEM_REPLACE" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_ITEM_REPLACE" formId="79e822d8d663404fa06531adbb740722" value="%{CR_ITEM_REPLACE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CR_ITEM_NAME" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_ITEM_NAME" formId="79e822d8d663404fa06531adbb740722" value="%{CR_ITEM_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CR_ITEM_DESC" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_ITEM_DESC" formId="79e822d8d663404fa06531adbb740722" value="%{CR_ITEM_DESC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CR_STATUS" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_STATUS" formId="79e822d8d663404fa06531adbb740722" value="%{CR_STATUS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="CR_MEMO" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_MEMO" formId="79e822d8d663404fa06531adbb740722" value="%{CR_MEMO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CR_PROJECT_ITEM" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_PROJECT_ITEM" formId="79e822d8d663404fa06531adbb740722" value="%{CR_PROJECT_ITEM}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="CR_BOM_ITEM" formId="79e822d8d663404fa06531adbb740722" >
				<bu:ui colNo="CR_BOM_ITEM" formId="79e822d8d663404fa06531adbb740722" value="%{CR_BOM_ITEM}" seq="%{#seq}" />
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
		<bu:submit viewId="2093f32019404ba38845c0b98dbfea7e" />
		<bu:script viewId="2093f32019404ba38845c0b98dbfea7e" />
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
