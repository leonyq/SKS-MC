<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ProductType"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<html>
	<head>
		<title>管理系统</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<script type="text/javascript">
		window.location.href = "${path}<%=CommMethodMc.getCurrFpLoginUrl()%>";
	</script>

	<body class="ContBody">
<%-- 
		<br>
		<a href="${path}comm/DictAction_listDict.ms">dict</a><br><br><br>
		<a href="${path}/plf/page/common/tags/dict/index.jsp">数据字典使用(demo)</a><br><br>
		
		<a href="${path}plf/page/sysmain/main/mainFrame.jsp">main</a><br><br>
		<a href="${path}sys/UserAction_listUser.ms">user</a><br><br>
		<a href="${path}sys/UserAction_listUserAx.ms">user-ajax</a><br><br>
		<a href="${path}plf/page/sysmain/func/funcFrame.jsp">func</a><br><br>
		<a href="${path}sys/RoleAction_listRole.ms">roel</a><br><br>
		<a href="${path}plf/page/sysmain/dept/deptFrame.jsp">dept</a><br><br>

		<a href="${path}/comm/CacheAction_reloadCache.ms">缓存管理</a><br><br>
		<br>
		<a href="${path}plf/page/sysmain/main/login.jsp">login</a><br><br>

		<br>
		--%>
	</body>
</html>
