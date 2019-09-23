<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="对外接口页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	<frameset rows="*" cols="230,*" border="2" bordercolor="#ccc" framespacing="2">
	<c:out value='${param.id}'/>
	    <frame src="${path}plf/page/externalInterface/moduleTree.jsp?typeFlag=<%=CommMethodMc.escapeJs(request.getParameter("typeFlag")) %>&<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=<c:out value='${param.FUNC_CODE}'/>" name="treeFrame" id="treeFrame"  scrolling="auto"  />
	    <frame src="${path}exInterface/externalInterfaceAction_listModule.ms?paraMap.UP_ID=-1&paraMap.typeFlag=<%=CommMethodMc.escapeJs(request.getParameter("typeFlag")) %>" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示 frameset" />
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>