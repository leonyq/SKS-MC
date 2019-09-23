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
			<dict:lang value="无法访问该功能,该记录关联模块已过期" />
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