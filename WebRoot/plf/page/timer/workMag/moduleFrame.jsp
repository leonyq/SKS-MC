<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="任务管理页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	<frameset rows="*" cols="230,*" border="2" bordercolor="#ccc" framespacing="2">
	    <frame src="${path}plf/page/timer/workMag/moduleTree.jsp?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=<c:out value='${param.FUNC_CODE}'/>" name="treeFrame" id="treeFrame"  scrolling="auto"  />
	    <frame src="${path}sys/workMagAction_listModule.ms?paraMap.UP_ID=0" name="mainFrame" id="mainFrame"  scrolling="auto"  />
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示 frameset" />
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>