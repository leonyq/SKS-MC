<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<html>
	<head>
		<title>管理系统-关闭页</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<script type="text/javascript">
	window.opener = null;
	window.open('','_self');
	window.close();
	</script>

	<body class="ContBody">
		<dict:lang value="本页面已退出，请手动关闭该页面" />
	</body>
</html>
