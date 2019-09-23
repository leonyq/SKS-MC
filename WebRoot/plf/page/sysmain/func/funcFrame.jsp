<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title>功能菜单列表</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<frameset rows="*" cols="230,*" border="2" bordercolor="#ccc" >
	    <frame src="${path}plf/page/sysmain/func/funcTree.jsp?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F46" name="leftFrame" id="leftFrame"  scrolling="auto" />
	    <frame src="${path}sys/FuncAction_listFunc.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F45&funcDtoSh.upId=<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_ROOT_ID"/>" name="mainFrame" id="mainFrame"  scrolling="auto" />
	</frameset>
	<noframes>
		<body>无法显示 frameset
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>