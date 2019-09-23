<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<html>
	<head>
		<title><dict:lang value="公用主页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>

	<body>
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr width="100%" height="100%" align="center" valign="middle">
				<td width="100%" height="500" align="center" valign="middle">
					<%=CommMethodMc.getText(ConstantsMc.MC_SHOW_TITLE) %>
				</td>
			</tr>
		</table>
	</body>
</html>