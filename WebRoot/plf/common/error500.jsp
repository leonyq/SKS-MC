<%@page language="java" errorPage="/plf/error.jsp" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.exception.AppException"%>
<%@page import="com.more.fw.core.dbo.model.dto.FuncCode"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="java.io.PrintWriter"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@ page isErrorPage="true" %>
<%
	String PAGE_PRINT_ERROR = ReadProperties.getPorpertie("system.properties","PAGE.PRINT.ERROR");
 %>
<html >
<head>
	<title><dict:lang value="服务器错误导向页面" /></title>
</head>

<body>
	<table>
		<tr>
			<td><dict:lang value="系统出错" />！</td>
		</tr>
	</table>
	
	<br/>
	<div style="z-index: 9999;">
		<a href="javascript:history.go(-1)"><dict:lang value="返回上一页" /></a></div>
		&nbsp;&nbsp;
		<a href="javascript:window.top.location='${path}sys/LoginAction_forLogin.ms'"><dict:lang value="返回登录页" /></a>
	 
	<div id="mc_show_err_div" style="display:none;color: ff0000;">
		<%if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
		%>
		<p>An exception was thrown:<c:out value='${pageContext.exception}' />
		<%}%>
		<br>
		<textarea id="mc_show_err_txta" rows="25" cols="150" readonly="readonly">
		<%
		String errorCode=null;
		String funcCode=FuncCode.MS_OPER;
		try {
			out.println("500异常信息：");
			Exception e = (Exception) request.getAttribute("Exception");
			if(null == e){							
				if(exception instanceof AppException && null !=((AppException)exception).getFuncCode()){
					funcCode = ((AppException)exception).getFuncCode();
				}
				errorCode = CommMethodMc.logError(exception, funcCode);//记录Log4j日志 
				if(null!=exception && "1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
					%>
					<%=CommMethodMc.escapeJs(CommMethodMc.getStackTrace(exception))%>
					<%
				}
			}else{
				if(e instanceof AppException && null !=((AppException)e).getFuncCode()){
					funcCode = ((AppException)e).getFuncCode();
				}
				errorCode = CommMethodMc.logError(e,funcCode);//记录Log4j日志 
				if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
					%>
					<%=CommMethodMc.escapeJs(CommMethodMc.getStackTrace(e))%>
					<%
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			out.println("无法打印500异常信息！");
		}
		%>
		</textarea>
		<br/>
		
		<%
		if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
			%>
			<script type="text/javascript">
				document.getElementById("mc_show_err_div").style.display="";
			</script>
			<%
		}
		%>
				<script type="text/javascript">
					var msg = "(500)<dict:lang value="操作出错，错误编号:" />"+"<%=errorCode + funcCode%>";
					try{
						parent.isSubmit = false;
						
						<%
						if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
							%>
							parent.document.getElementById("mc_pub_show_err_div").style.display="";
							parent.document.getElementById("mc_pub_show_err_txta").value=document.getElementById("mc_show_err_txta").value;
							<%
						}
						%>
						parent.alertInfo(msg);
					}catch(e){
						util.alert(msg);
					}
					util.closeTopLoading();
				</script>
	    	(500)<dict:lang value="操作出错，错误编号:" /><%=errorCode + funcCode%>
	    </div>
</body>
</html>
