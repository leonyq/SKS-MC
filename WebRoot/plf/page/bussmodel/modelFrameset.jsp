<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>

	<head>
	    <title><dict:lang value="业务模型" /></title>
	    <jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	<frameset rows="*" cols="230,*" border="2" bordercolor="#ccc">
    	<frame src="${path}sys/BussModelAction_listBussModelTree.ms" name="leftFrame" id="leftFrame" scrolling="yes" />
    	<frame src="<%=CommMethodMc.getMainFrameUrl(request)%>" name="mainFrame" id="mainFrame" scrolling="auto"/>
	</frameset>

	<noframes>
		<body><dict:lang value="无法显示" /> frameset</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>