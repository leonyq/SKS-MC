<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script src="<%=basePath%>js/echarts/echarts.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_JS %>"></script>
  </head>
<body>
	<c:out value='${pageContent}' />
</body>
</HTML>
