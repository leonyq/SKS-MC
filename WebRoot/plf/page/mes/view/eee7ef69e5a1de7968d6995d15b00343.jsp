<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="视图列表一" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="ad1a45ea161e4a82bd659ba29ae87bc9"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="86f9bb7a391e46a1bd5067b8ad9d6c45" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="86f9bb7a391e46a1bd5067b8ad9d6c45" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='ad1a45ea161e4a82bd659ba29ae87bc9'/>
 <div class="panel datagrid datagrid-div1"  id="ad1a45ea161e4a82bd659ba29ae87bc9">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row datagrid-title-kz" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="ad1a45ea161e4a82bd659ba29ae87bc9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROVIENCE" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CITY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="COUNTY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TOWNSHIP" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="STREET" formId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable datagrid-btable-kz" id="datagrid-btable-kz">
		<tbody id="tbody_ad1a45ea161e4a82bd659ba29ae87bc9">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="ad1a45ea161e4a82bd659ba29ae87bc9" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="PROVIENCE" formId="ad1a45ea161e4a82bd659ba29ae87bc9" >
				<bu:ui colNo="PROVIENCE" formId="ad1a45ea161e4a82bd659ba29ae87bc9" value="%{PROVIENCE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="CITY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" >
				<bu:ui colNo="CITY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" value="%{CITY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="COUNTY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" >
				<bu:ui colNo="COUNTY" formId="ad1a45ea161e4a82bd659ba29ae87bc9" value="%{COUNTY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="TOWNSHIP" formId="ad1a45ea161e4a82bd659ba29ae87bc9" >
				<bu:ui colNo="TOWNSHIP" formId="ad1a45ea161e4a82bd659ba29ae87bc9" value="%{TOWNSHIP}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="STREET" formId="ad1a45ea161e4a82bd659ba29ae87bc9" >
				<bu:ui colNo="STREET" formId="ad1a45ea161e4a82bd659ba29ae87bc9" value="%{STREET}" seq="%{#seq}" />
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
		<bu:submit viewId="86f9bb7a391e46a1bd5067b8ad9d6c45" />
		<bu:script viewId="86f9bb7a391e46a1bd5067b8ad9d6c45" />
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
