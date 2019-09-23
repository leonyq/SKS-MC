<%@ page language="java" pageEncoding="gbk"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>正在处理数据Loading...</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/js/subModal/style.css?_mc_res_version=<%=PlfStaticRes.JS_SUBMODAL_STYLE_CSS %>" />
</head>
<body>
	<table width="80%" height="80%" align="center">
		<tr align="center">
 			<td  width="80%" height="80%"  align="center"><img src="<%=path%>/js/subModal/loading.gif" width="100%" height="100%" /></td>
 		</tr>
 	</table>
</body>
</html>
