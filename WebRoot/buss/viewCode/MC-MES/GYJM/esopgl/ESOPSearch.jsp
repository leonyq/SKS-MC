<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="ESOP查询" />
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
		<bu:header formId ="62e5f8f76eab45ddbcf24c091ee691ce"/>

</head>
<body>

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="870ac7591775477b85984a9431ae5617" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="870ac7591775477b85984a9431ae5617" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='62e5f8f76eab45ddbcf24c091ee691ce'/>
 <div class="panel datagrid datagrid-div1"  id="62e5f8f76eab45ddbcf24c091ee691ce">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"  style="min-width:1240px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="62e5f8f76eab45ddbcf24c091ee691ce" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CREATE_USER" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<td class="datagrid-cell"  style="display:none"><bu:uitn colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width:1220px;">
		<tbody id="tbody_62e5f8f76eab45ddbcf24c091ee691ce">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" style="width:130px;" colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_SN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width:120px;" colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width:130px;" colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_MODEL_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width:100px;" colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_PRODUCT_STEP}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width:100px;" colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_PROCESS_FACE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width:100px;" colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_GROUP}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width:90px;" colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_VERSION}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" style="width:70px;text-align:center;" colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_DEFAULT_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" style="width:70px;text-align:center;" colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_VALID_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" style="width:90px;" colNo="CREATE_USER" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CREATE_USER" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CREATE_USER}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-11" style="text-align:center;" colNo="CREATE_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<bu:ui colNo="CREATE_TIME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CREATE_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" style="display:none" colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" >
				<span id="span${ID}"><bu:ui colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" value="%{CSI_SYS_NAME}" seq="%{#seq}" /></span>
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
		<bu:submit viewId="870ac7591775477b85984a9431ae5617" />
		<bu:script viewId="870ac7591775477b85984a9431ae5617" />
	<script type="text/javascript">
    $(function(){
     var cons = $("#searchParaShowState").val();
     console.log(cons);
    })
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
