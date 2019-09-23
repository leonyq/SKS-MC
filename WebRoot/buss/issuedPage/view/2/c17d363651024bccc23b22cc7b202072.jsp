<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_3" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<title>
		<dict:lang value="工单信息测试-扩展列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="16cd7af313984d629604a0d5174d6c0a"/>

	<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_3" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="f78f5e9b8afa40f88342e4f4eb3b0749" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
						  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                                <jsp:param name="modelName" value="VIEW_TYPE_3" />
                                <jsp:param name="formName" value="searchForm" />
                          </jsp:include>
		<bu:search viewId="f78f5e9b8afa40f88342e4f4eb3b0749" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
			 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                 <jsp:param name="modelName" value="VIEW_TYPE_3" />
                 <jsp:param name="formName" value="listForm" />
             </jsp:include>
<input type="hidden" name="formId" value='16cd7af313984d629604a0d5174d6c0a'/>
 <div class="panel datagrid datagrid-div1"  id="16cd7af313984d629604a0d5174d6c0a">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row datagrid-title-kz" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="16cd7af313984d629604a0d5174d6c0a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WNOTE" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WNO" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WNAME" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WDATE" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EXT_WN_S" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="IMG" formId="16cd7af313984d629604a0d5174d6c0a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable datagrid-btable-kz" id="datagrid-btable-kz">
		<tbody id="tbody_16cd7af313984d629604a0d5174d6c0a">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="16cd7af313984d629604a0d5174d6c0a" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="WNOTE" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="WNOTE" formId="16cd7af313984d629604a0d5174d6c0a" value="%{WNOTE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="WNO" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="WNO" formId="16cd7af313984d629604a0d5174d6c0a" value="%{WNO}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="WNAME" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="WNAME" formId="16cd7af313984d629604a0d5174d6c0a" value="%{WNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="WDATE" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="WDATE" formId="16cd7af313984d629604a0d5174d6c0a" value="%{WDATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="EXT_WN_S" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="EXT_WN_S" formId="16cd7af313984d629604a0d5174d6c0a" value="%{EXT_WN_S}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="IMG" formId="16cd7af313984d629604a0d5174d6c0a" >
				<bu:ui colNo="IMG" formId="16cd7af313984d629604a0d5174d6c0a" value="%{IMG}" seq="%{#seq}" />
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
		<bu:submit viewId="f78f5e9b8afa40f88342e4f4eb3b0749" />
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_3" />
        <jsp:param name="location" value="beforeJsLoad" />
  	</jsp:include>
		<bu:script viewId="f78f5e9b8afa40f88342e4f4eb3b0749" />
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_3" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_3" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
