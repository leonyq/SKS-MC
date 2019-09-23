<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="公用类页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<frameset rows="*" cols="270,*" border="4" bordercolor="#D2E0F2" framespacing="2">
	    <frame src="${path}plf/page/webservice/clientmgr/moduleTree.jsp?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=<c:out value='${param.FUNC_CODE}'/>" name="treeFrame" id="treeFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	    <frame src="${path}webservice/ClientMgrAction_listModule.ms" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示 frameset" />
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>