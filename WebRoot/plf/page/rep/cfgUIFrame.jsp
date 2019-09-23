<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="UI组件配置"/>frameset</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<frameset rows="*" cols="230,*" border="4" bordercolor="#D2E0F2" framespacing="2">
	    <frame src="${path}sys/BussModelAction_uICompTree.ms?paraMap.FORM_COL_ID=<s:property value="paraMap.id" />&paraMap.UI_COMP=<s:property value="paraMap.UI_COMP" />&paraMap.UI_COMP__TYPE=<s:property value="paraMap.UI_COMP__TYPE" />&paraMap.FORM_ID=<s:property value="paraMap.FORM_ID" />" name="leftFrame" id="leftFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	    <frame src="${path}sys/BussModelAction_showCfgUIComp.ms?paraMap.FORM_COL_ID=<s:property value="paraMap.id" />&paraMap.UI_COMP=<s:property value="paraMap.UI_COMP" />&paraMap.UI_COMP__TYPE=<s:property value="paraMap.UI_COMP__TYPE" />&paraMap.FORM_ID=<s:property value="paraMap.FORM_ID" />" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	</frameset>
	<noframes>
		<body>无法显示 frameset
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>