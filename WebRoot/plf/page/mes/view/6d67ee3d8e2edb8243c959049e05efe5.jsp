<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="工时报备" />
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
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
</head>
<body scroll="no" style="overflow: hidden;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                    
                    <div>
		<bu:func viewId="5b18589df3544fbb8ec538596e8e4fd4" />
                    </div>
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}">
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
							<bu:search viewId="5b18589df3544fbb8ec538596e8e4fd4" />
						</form>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<input type="hidden" id="loginUserId" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value=b3b00ad970894885bd60a59ca296580c>
 <div class="panel datagrid" style="overflow-x: auto;" id="b3b00ad970894885bd60a59ca296580c">
 <div class="datagrid-view-kz" id="datagrid-view-kz" style="overflow:hidden;">
 <div class="datagrid-header" style="background-color: #64ABE1">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="display: block;">
		<bu:table  id="datagrid-htable-kz" cssClass="datagrid-htable fixedTable" style="min-width:1000px; width:100%;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell datagrid-cell1" style="width:30px"><bu:thSeq  formId="b3b00ad970894885bd60a59ca296580c" i18n="1"/></td>
			<td class="datagrid-cell datagrid-cell2" style="width:30px;text-align:center"><bu:thSBox listType="2" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell3"  style="width:110px;"><bu:uitn colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell4"  style="width:110px;"><bu:uitn colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell5"  style="width:80px;"><bu:uitn colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell6"  style="width:90px;"><bu:uitn colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell7"  style="width:70px;"><bu:uitn colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell8"  style="width:70px;"><bu:uitn colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell9"  style="width:80px;"><bu:uitn colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell0"  style="width:80px;"><bu:uitn colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="datagrid-cell datagrid-cell11"><bu:uitn colNo="REMARK" formId="b3b00ad970894885bd60a59ca296580c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-body-kz" id="datagrid-body-kz" style="margin-top: 0px;overflow: auto;" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:980px;">
		<tbody id="tbody_b3b00ad970894885bd60a59ca296580c">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="b3b00ad970894885bd60a59ca296580c" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1"  style="width:110px;" colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2"  style="width:110px;" colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" value="%{PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3"  style="width:80px;" colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" value="%{CUSTOMER_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4 tc" style="width:90px;" colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5 tr"  style="width:70px;" colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_HOURS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6 tr"  style="width:70px;" colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" value="%{WORK_EXTRA_HOURS}" seq="%{#seq}" />
			</bu:td>
		
			<bu:td cssClass="datagrid-cell datagrid-cell-8"  style="width:80px;" colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" value="%{TASK_ARRANGE_PEOPLE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9"  style="width:80px;" colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" value="%{STAFF_NAME}" seq="%{#seq}" />
			</bu:td>
				<bu:td ondblclick="remark(this);" cssClass="datagrid-cell datagrid-cell-7" colNo="REMARK" title='${REMARK}' formId="b3b00ad970894885bd60a59ca296580c" >
				<bu:ui colNo="REMARK" formId="b3b00ad970894885bd60a59ca296580c" value="%{REMARK}" seq="%{#seq}" />
			</bu:td>
			<td style="display: none;" > <input type="hidden" id="id_${ID}" value="${CREATE_USER}"/></td>
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
  <div class="center" >
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="5b18589df3544fbb8ec538596e8e4fd4" />
		<bu:script viewId="5b18589df3544fbb8ec538596e8e4fd4" />
	<script type="text/javascript">
	
	function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}
	$(function(){
         	
      	});
	var isQuery = false;
	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
    		}
    		if($("#isClearOrder").val()==1){
    		$("#_sortCol").val('');
		$("#_sortColOrder").val('');
		}
		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
