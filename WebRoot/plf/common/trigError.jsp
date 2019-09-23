<%@page language="java" errorPage="/plf/error.jsp" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>

<html>
	<head>
		<title><dict:lang value="无权限页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<body bgcolor="#ffffff">

			<br>
			<br>

		<hr width="80%">
		<h3 style="text-align: center;">
			<br>
			<br>
			<dict:lang value="当前该节点无法访问定时器功能" />
			<br>
			<br>
		</h3>
		<hr width="80%">
		<br>
		<s:actionerror />

	</body>
	
	<script type="text/javascript">
	</script>
</html>