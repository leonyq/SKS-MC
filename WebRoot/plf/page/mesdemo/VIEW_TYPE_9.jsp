<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_9" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
<title>
	#{view.title}#
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
#{view.head}#
		<!-- head里面 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_9" />
    <jsp:param name="location" value="inHead" />
</jsp:include>
<!-- 产品静态资源 -->
	#{view.dist.static.resources}#
</head>
<body>

	<div class="content-in">
				#{view.function}#
			<div class="bd">
				<div id="searchDiv" name="searchDiv">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post">
				    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				    <jsp:param name="modelName" value="VIEW_TYPE_9" />
    				    <jsp:param name="location" value="searchForm" />
				    </jsp:include>
				</form>
				</div>
				<form id="listForm" name="listForm"
					action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				    <jsp:param name="modelName" value="VIEW_TYPE_9" />
    				    <jsp:param name="location" value="listForm" />
				    </jsp:include>
					<input type="hidden" name="exeid" value="<c:out value='${exeid}' />"  />
					#{view.form}#
				</form>
			</div>
	</div>
	#{view.submit}#
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_9" />
        <jsp:param name="location" value="beforeJsLoad" />
  	</jsp:include>
	#{view.script}#
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_9" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
	

	<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_9" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>