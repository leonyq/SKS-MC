<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
 
<%@page import="java.util.Locale"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%-- 加入标签，但不能使用struts2标签，因为如果是在过滤器中跳转到此页面时还没到Struts层 --%>
<%@ include file="/plf/common/pub_tag.jsp" %>

	<%
		Object strutsI18n=session.getAttribute(ConstantsMc.STRUTS2_I18N_KEY);
		Locale locale = request.getLocale();
		if(null != strutsI18n){
			locale = (Locale)strutsI18n;
		}
        String title="error page";
        String back="back";
        String home="home";
        String info1="error page";
	%>
             
<html>
	<head>
		<title><%=title %></title>
	</head>

<body bgcolor="#ffffff">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="100%" align="center" valign="middle"><table width="669" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="258" valign="top" background="<%=request.getContextPath() %>/images/info/error.jpg?_mc_res_version=<%=PlfStaticRes.ERROR_JPG%>"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" height="92">&nbsp;</td>
            <td width="90%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="style3"><%=info1 %>：<br><br>
            	<%=request.getAttribute(ConstantsMc.COMMON_PAGE_MESSAGES) %><br><br>
            	
				<a href="javascript:history.go(-1)"><%=back %></a>
				<a href="<%=request.getContextPath() %>"><%=home %></a>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

