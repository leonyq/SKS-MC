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
		<dict:lang value="view1127" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="2ca1871ab2a34d818217ee3952b408f9"/>

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
                  
		<bu:func viewId="c66138310f4b4ff29ff4d88c5b03f504" />
                    
                  </div>
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							 <!-- Form里面 -->
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                                <jsp:param name="modelName" value="VIEW_TYPE_1" />
                                <jsp:param name="formName" value="searchForm" />
                              </jsp:include>
		<bu:search viewId="c66138310f4b4ff29ff4d88c5b03f504" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
                      
                      
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
			 <!-- Form里面 -->
			 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                 <jsp:param name="modelName" value="VIEW_TYPE_1" />
                 <jsp:param name="formName" value="listForm" />
             </jsp:include>
		<bu:form viewId="c66138310f4b4ff29ff4d88c5b03f504" formId="2ca1871ab2a34d818217ee3952b408f9" list="dataList" formidFirstId="2ca1871ab2a34d818217ee3952b408f9" relColIds="" subFormIds="" subRelColIds="" currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" />
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
		<bu:submit viewId="c66138310f4b4ff29ff4d88c5b03f504" />
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_1" />
        <jsp:param name="location" value="beforeJsLoad" />
  	</jsp:include>
		<bu:script viewId="c66138310f4b4ff29ff4d88c5b03f504" />
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
