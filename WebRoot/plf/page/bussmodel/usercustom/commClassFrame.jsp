<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="公用类页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<frameset rows="*" cols="275,*" border="2" bordercolor="#ccc" >
	    <frame src="${path}plf/page/bussmodel/usercustom/commClassTree.jsp?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F34" name="leftFrame" id="leftFrame"  />
	    <frame src="${path}sys/UserCustomAction_listCommClass.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.UP_ID=<s:property value="@com.more.fw.core.common.method.ConstantsMc@COMM_CLASS_ROOT_ID"/>" name="mainFrame" id="mainFrame"  scrolling="auto"  />
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示 frameset" />
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>