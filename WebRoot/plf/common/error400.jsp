<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ page isErrorPage="true" %>
<%@page import="common.Logger"%>
<%@page import="java.io.PrintWriter"%>

<%
    response.setStatus(HttpServletResponse.SC_OK); // 200 = HttpServletResponse.SC_OK
%>
<%
	String PAGE_PRINT_ERROR = ReadProperties.getPorpertie("system.properties","PAGE.PRINT.ERROR");
 %>

<html>
	<head>
		<title>400错误页面</title>
	</head>

<body bgcolor="#ffffff">

<a href="javascript:history.go(-1)">Back</a>
<a href="<%=request.getContextPath() %>">Home</a>

<h2><font color="#DB1260">JSP Error Page</font></h2>

<hr width="80%">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="100%" align="center" valign="middle"><table width="669" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="258" valign="top" background="/images/info/error.jpg?_mc_res_version=<%=PlfStaticRes.ERROR_JPG%>"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" height="92">&nbsp;</td>
            <td width="90%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
            	错误请求，请稍后重试！ 如果还是出错请与管理人员联系。<br/>
            	Error request,please try again later! If still error,please contact with management staff.
	<br/>
	<div style="z-index: 9999;"><a href="javascript:history.go(-1)">返回上一页</a></div>
	 
	<div style="display:none; ">
		<%if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
		%>
		<p>An exception was thrown:<c:out value='${pageContext.exception}' /><br/>
		<%}%>
		
		<%
					try {
						out.println("错误请求页面：");
						Exception e = (Exception) request.getAttribute("Exception");
						Logger log = Logger.getLogger(this.getClass());
						if(null == e){							
							log.error("错误请求页面：", exception);//记录Log4j日志
							if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
							%>
							<%=CommMethodMc.escapeJs(CommMethodMc.getStackTrace(exception))%>
							<%}
						}else{
							log.error("错误请求页面：", e);//记录Log4j日志
							if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
							%>
							<%=CommMethodMc.escapeJs(CommMethodMc.getStackTrace(e))%>
							<%}
						}
					} catch (Exception e1) {
						out.println("无法打印错误请求页面！");
					}
		%>
	</div>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

<hr width="80%">

</body> 

</html>

