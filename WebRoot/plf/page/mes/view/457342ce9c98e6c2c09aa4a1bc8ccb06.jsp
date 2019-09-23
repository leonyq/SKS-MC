<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="CSJ工时报备" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="e3558d63d4ed4352aaa6efa1c2bebf82"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="6b119f888c87438998dc418eef28e722" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="6b119f888c87438998dc418eef28e722" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
		 	<input type="hidden" id="loginUserId" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />" /> 
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='e3558d63d4ed4352aaa6efa1c2bebf82'/>
 <div class="panel datagrid datagrid-div1"  id="e3558d63d4ed4352aaa6efa1c2bebf82">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" style="min-width:1340px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row datagrid-title-kz" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="e3558d63d4ed4352aaa6efa1c2bebf82" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:250px;"><bu:uitn colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<td class="datagrid-cell" style="width:300px;"><bu:uitn colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable datagrid-btable-kz" id="datagrid-btable-kz" style="min-width:1340px;">
		<tbody id="tbody_e3558d63d4ed4352aaa6efa1c2bebf82">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:150px;">
				<bu:ui colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_TYPE}" seq="%{#seq}" />
				<input type="hidden" name="" id="id_${ID}" value="${CREATE_USER}"/>
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:200px;">
				<bu:ui colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:150px;">
				<bu:ui colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{CUSTOMER_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:250px;">
				<bu:ui colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:80px;">
				<bu:ui colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_HOURS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:80px;">
				<bu:ui colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_EXTRA_HOURS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:100px;">
				<bu:ui colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{STAFF_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:100px;">
				<bu:ui colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{TASK_ARRANGE_PROPLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" style="width:300px;">
				<bu:ui colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{REMARK}" seq="%{#seq}" />
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
		<bu:submit viewId="6b119f888c87438998dc418eef28e722" />
		<bu:script viewId="6b119f888c87438998dc418eef28e722" />
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
