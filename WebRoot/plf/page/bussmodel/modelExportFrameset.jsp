<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethod"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title><dict:lang value="模块导出框架" /></title>
	</head>
	
	
	<frameset id="" rows="25,*" border="1" bordercolor="#D2E0F2" framespacing="1" >
	<frame src="${path }plf/page/bussmodel/modelExportHead.jsp" name="headFrame" id="headFrame" scrolling="no" style="border: 1px solid #99BBE8;" />
	<frameset id="frameSet1" rows="*" cols="230,*" border="1" bordercolor="#D2E0F2" framespacing="1">
    <frame src="${path}sys/BussModelAction_listModule.ms" name="leftFrame2" id="leftFrame2" scrolling="no" style="border: 1px solid #99BBE8;" />
    <frame src="<%=CommMethod.getMainFrameUrl(request)%>" name="mainFrame" id="mainFrame" scrolling="auto" style="border: 1px solid #99BBE8;" />
	</frameset>
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示" /> frameset</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>