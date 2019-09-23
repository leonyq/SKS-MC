<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>提示信息</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
	
	<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/js/subModal/style.css?_mc_res_version=<%=PlfStaticRes.JS_SUBMODAL_STYLE_CSS %>" />
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p align="center"><b><c:out value='${msg}' /></b></p>
	<p align="center">
		<%-- <a href="javascript:history.go(-1)">返回上一页</a> --%>
		&nbsp;&nbsp;
		<a id="gobackUrl" ><dict:lang value="返回" /></a>
	</p>
		<br>
		<br>
		<div style="display: none;">
		<textarea id="_msg_info" rows="10" cols="10"><s:actionerror/></textarea>
		<script type="text/javascript">
			var showMsg=document.getElementById("_msg_info").value;
			if(null!= showMsg && ""!=showMsg){
				if(showMsg.indexOf("token", 0)>-1){
					showMsg = "<dict:lang value="访问已过期，不能重复提交数据" />";
					document.getElementById("gobackUrl").href = "<%=request.getContextPath()%>/<c:out value='${_$login_url_}' />";
				}
			}
		</script>
		</div>
	<p align="center">
		<dict:lang value="提示" />：<script type="text/javascript">document.write(showMsg);</script>
	</p>
</body>
</html>
