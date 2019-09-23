<%@ page language="java" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true"%>
<%@page import="com.more.fw.core.dbo.model.dto.FuncCode"%>
<%@page import="com.more.fw.core.common.exception.AppException"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="java.io.PrintWriter"%>
<% response.setStatus(200); %>
<%
	String PAGE_PRINT_ERROR = ReadProperties.getPorpertie("system.properties","PAGE.PRINT.ERROR");
 %>
<html>
	<head>
		<title>全局出错页面</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>

	<body class="ContBody">
		<table class="ComTab ErrorPage500"  style="display: none;">
			<tr>
				<td class="Img01">
					&nbsp;
				</td>
				<td class="Img02">
					&nbsp;
				</td>
				<td class="Img03">
					&nbsp;
				</td>
				<td class="Img04">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="Img05">
					&nbsp;
				</td>
				<td class="Img06">
					&nbsp;
				</td>
				<td class="Img07">
					&nbsp;
				</td>
				<td class="Img08">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="Img09">
					&nbsp;
				</td>
				<td class="Img10">
					&nbsp;
				</td>
				<td class="Img11">
					&nbsp;
				</td>
				<td class="Img12">
					&nbsp;
				</td>
			</tr>
		</table>
		
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="30">
			&nbsp;<a href="javascript:history.go(-1)">Go Back</a>
			&nbsp;&nbsp;
			<a href="javascript:window.top.location='<%=request.getContextPath() %>/sys/LoginAction_mainFrame.ms'">Go Home</a>
	    </td>
	  </tr>
	  <tr>
	    <td style="color: ff0000" align="center" valign="middle">
		<div id="mc_show_err_div" style="display: none;">
		<p>An exception was thrown:
		<br>
		<textarea id="_show_err_txta" rows="25" style="width:100%;" readonly="readonly" >
		<%
		String errorCode=null;
		String funcCode=FuncCode.MS_OPER;
		try {
			out.println("错误导向页面错异常信息：");
			Exception e = (Exception) request.getAttribute("Exception");
			if(null == e){
				if(exception instanceof AppException && null !=((AppException)exception).getFuncCode()){
					funcCode = ((AppException)exception).getFuncCode();
				}
				errorCode = CommMethodMc.logError(exception, funcCode);//记录Log4j日志 
				if(null != exception.getMessage() && !"".equals(exception.getMessage())){
				}
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
			out.println("无法打印错误导向页面错异常信息！"+e1);
		}
		%>
		</textarea>
		<%
		if("1".equals(PAGE_PRINT_ERROR)){//如果允许页面输出错误信息
			%>
			<script type="text/javascript">
				document.getElementById("mc_show_err_div").style.display="";
			</script>
			<%
		}
		%>
	</div>

				<script type="text/javascript">
					var msg = "error code:<%=errorCode + funcCode%>";
					try{
						parent.alertInfo(msg);
						parent.document.getElementById("mc_pub_show_err_div").style.display="";
						parent.document.getElementById("mc_pub_show_err_txta").value=document.getElementById("mc_show_err_txta").value;
						parent.isSubmit = false;
					}catch(e){
						//alert(msg);
					}
					util.closeTopLoading();
				</script>
	    	<br><div style="color: ff0000;font-size: 14px;">error code:<%=errorCode + funcCode%></div>
	</body>
</html>
