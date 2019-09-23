<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.more.fw.core.common.method.EncodingUtil"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>提示信息</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>

<body>
	<p align="center"><b><%=CommMethodMc.escapeJs(EncodingUtil.stringIsoToUtf8(request.getParameter("msg")))%><%=CommMethodMc.escapeJs(request.getAttribute("msg"))%></b></p>
</body>
<script type="text/javascript">
	<%-- 这里要保证传过来的属性是转义过的的 --%>
	<%=CommMethodMc.unescapeJs(CommMethodMc.filterJs(EncodingUtil.stringIsoToUtf8(request.getParameter("script")))%>
	<%=CommMethodMc.unescapeJs((CommMethodMc.filterJs(request.getAttribute("script")))%>
</script>
</html>
