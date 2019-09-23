<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>  
	<title>
		<dict:lang value="任务中心_任务日志_任务描述" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>
<body>

	<div class="all">
	
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
                 <textarea rows="20" cols="60" style="width:100%;hight:98%;resize: none;box-sizing: border-box;" cssClass="readonly" readonly="readonly">${dataMap.TASK_DESC}</textarea>


		</form>
		</div>
	</div>
		<bu:submit viewId="3557d3de9c5442dc9bd11b2b3d9c1068" />
		<bu:script viewId="3557d3de9c5442dc9bd11b2b3d9c1068" />
	<script type="text/javascript">
	
	
</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
