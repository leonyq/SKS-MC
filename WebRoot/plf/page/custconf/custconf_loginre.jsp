<%@page language="java" errorPage="/plf/error.jsp" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<html>
	<head>
		<title><dict:lang value="开发中" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	<body bgcolor="#ffffff">

			<br>
			<br>
		<h2 style="text-align: center;">
			<br>
			<img src='${path}/plf/images/deping.png'>
			<br>
			<br>
		</h2>

		<hr width="100%">
		<h3 style="text-align: center;">
			<br>
			<br>
			<dict:lang value="功能待发布，敬请期待..." />
			<br>
			<br>
		</h3>
		<hr width="100%">
		<br>
		<s:actionerror />

	</body>
	
	<script type="text/javascript">

	</script>
</html>