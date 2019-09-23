<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_1" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<title>
		<dict:lang value="测试表单属性2" />
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
     <jsp:param name="modelName" value="VIEW_TYPE_1" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body scroll="auto" >

          <div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  
		<bu:func viewId="6bd93dfd3e804d80906468ea6da1c154" />
                    
                  </div>
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							 <!-- Form里面 -->
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                                <jsp:param name="modelName" value="VIEW_TYPE_1" />
                                <jsp:param name="formName" value="searchForm" />
                              </jsp:include>
		<bu:search viewId="6bd93dfd3e804d80906468ea6da1c154" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
                      
                      
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
			 <!-- Form里面 -->
			 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                 <jsp:param name="modelName" value="VIEW_TYPE_1" />
                 <jsp:param name="formName" value="listForm" />
             </jsp:include>
		<bu:form viewId="6bd93dfd3e804d80906468ea6da1c154" formId="eb160d7842a04a208fe8919ec7f58faa" list="dataList" formidFirstId="eb160d7842a04a208fe8919ec7f58faa" relColIds="" subFormIds="" subRelColIds="" currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" />
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
		<bu:submit viewId="6bd93dfd3e804d80906468ea6da1c154" />
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_1" />
        <jsp:param name="location" value="beforeJsLoad" />
  	</jsp:include>
		<bu:script viewId="6bd93dfd3e804d80906468ea6da1c154" />
	 <!-- 脚本执行前 -->
	 
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_1" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_1" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
