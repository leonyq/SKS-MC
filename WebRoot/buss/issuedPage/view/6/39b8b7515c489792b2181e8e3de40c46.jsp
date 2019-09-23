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
		<dict:lang value="测试表单属性" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="eb160d7842a04a208fe8919ec7f58faa"/>

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
		<bu:func viewId="4d135a9ea2ee4f2081b4b4912840f7aa" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
						  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                                <jsp:param name="modelName" value="VIEW_TYPE_3" />
                                <jsp:param name="formName" value="searchForm" />
                          </jsp:include>
		<bu:search viewId="4d135a9ea2ee4f2081b4b4912840f7aa" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
			 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                 <jsp:param name="modelName" value="VIEW_TYPE_3" />
                 <jsp:param name="formName" value="listForm" />
             </jsp:include>
<input type="hidden" name="formId" value='eb160d7842a04a208fe8919ec7f58faa'/>
 <div class="panel datagrid datagrid-div1"  id="eb160d7842a04a208fe8919ec7f58faa">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row datagrid-title-kz" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="eb160d7842a04a208fe8919ec7f58faa" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="eb160d7842a04a208fe8919ec7f58faa" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable datagrid-btable-kz" id="datagrid-btable-kz">
		<tbody id="tbody_eb160d7842a04a208fe8919ec7f58faa">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="eb160d7842a04a208fe8919ec7f58faa" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="TEST4" formId="eb160d7842a04a208fe8919ec7f58faa" >
				<bu:ui colNo="TEST4" formId="eb160d7842a04a208fe8919ec7f58faa" value="%{TEST4}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="TEST1" formId="eb160d7842a04a208fe8919ec7f58faa" >
				<bu:ui colNo="TEST1" formId="eb160d7842a04a208fe8919ec7f58faa" value="%{TEST1}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="TEST2" formId="eb160d7842a04a208fe8919ec7f58faa" >
				<bu:ui colNo="TEST2" formId="eb160d7842a04a208fe8919ec7f58faa" value="%{TEST2}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="TEST3" formId="eb160d7842a04a208fe8919ec7f58faa" >
				<bu:ui colNo="TEST3" formId="eb160d7842a04a208fe8919ec7f58faa" value="%{TEST3}" seq="%{#seq}" />
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
		<bu:submit viewId="4d135a9ea2ee4f2081b4b4912840f7aa" />
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_3" />
        <jsp:param name="location" value="beforeJsLoad" />
  	</jsp:include>
		<bu:script viewId="4d135a9ea2ee4f2081b4b4912840f7aa" />
	
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
