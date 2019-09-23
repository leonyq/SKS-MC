<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title><dict:lang value="业务模型" /></title>
	    <jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
	</head>
	
	<frameset rows="*" cols="230,*" border="1" bordercolor="#D2E0F2" framespacing="1">
    <frame src="${path}sys/BussModelAction_listBussViewModelTree.ms?paraMap.viewId=<c:out value='${paraMap.viewId}' />&paraMap.viewNameId=<c:out value='${paraMap.viewNameId}' />&paraMap.trId=<c:out value='${paraMap.trId}' />&paraMap.viewCode=<c:out value='${paraMap.viewCode}' />&paraMap.funcId=<c:out value='${paraMap.funcId}' />&paraMap.mcIframeName=<c:out value='${mcIframeName}' />" name="leftFrame" id="leftFrame" scrolling="no" style="border: 1px solid #99BBE8;" />
    <frame src="<%=CommMethodMc.getMainFrameUrl(request)%>" name="mainFrame" id="mainFrame" scrolling="auto" style="border: 1px solid #99BBE8;" />
	</frameset>

	<noframes>
		<body><dict:lang value="无法显示" /> frameset</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>