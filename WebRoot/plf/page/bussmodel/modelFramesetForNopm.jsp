<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title><dict:lang value="业务模型" /></title>
	</head>
	<frameset rows="*" cols="230,*" border="2" bordercolor="#ccc">
    <frame src="${path}sys/BussModelAction_listBussModelTreeForNopm.ms" name="leftFrame" id="leftFrame" scrolling="no"/>
    <frame src="<%=CommMethodMc.getMainFrameUrl(request)%>" name="mainFrame" id="mainFrame" scrolling="auto" />
	</frameset>

	<noframes>
		<body><dict:lang value="无法显示" /> frameset</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>