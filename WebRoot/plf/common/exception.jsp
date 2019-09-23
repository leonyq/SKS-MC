<%@page import="com.more.fw.core.common.exception.BussException"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"  isErrorPage="true"	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.dbo.model.dto.FuncCode"%>
<%@page import="com.more.fw.core.common.exception.AppException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ taglib prefix="c" uri="/plf/tld/c.tld"%>
<%@ taglib prefix="fmt" uri="/plf/tld/fmt.tld"%>
<%@ taglib prefix="fn" uri="/plf/tld/fn.tld"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ page isELIgnored="false"%>
<%@ page import="org.apache.log4j.Logger" %>
<%
	String PAGE_PRINT_ERROR = ReadProperties.getPorpertie("system.properties","PAGE.PRINT.ERROR");
 %>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<jsp:include page="/plf/common/pub_head.jsp" />
		<%@ include file="/plf/common/i18n_js.jsp"%>
		<title><dict:lang value="全局错误导向页面" /></title>
		<script type="text/javascript"
		
		 src="<%=request.getContextPath()%>/plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.UTIL_JS %>"></script>
		
	<style type="text/css">
	*{margin:0;padding:0;font-size: 12px;}
	</style>
		</head>
	<body>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="30">	    
			&nbsp;<a href="javascript:history.go(-1)"><dict:lang value="返回上一页" /></a> 
			<%-- 由于目前无法知道是前台还是后台转转过来的，所以无法判断是跳转到前台还是后台，把这个链接去掉(request.getHeader("referer"))
			&nbsp;&nbsp;
			<a href="javascript:window.top.location='<%=request.getContextPath() %>/sys/LoginAction_mainFrame.ms'"><dict:lang value="返回首页" /></a>
			&nbsp;&nbsp;
			<a href="javascript:window.top.location='${path}<%=CommMethodMc.getCurrFpLoginUrl()%>'"><dict:lang value="返回登录页" /></a>
			 --%>
	    </td>
	  </tr>
	  <tr>
	    <td style="color: ff0000" align="center" valign="middle">
		<div id="mc_show_err_div" style="display: none;">
		<p>An exception was thrown:
		<br>
		<textarea id="_show_err_txta" rows="25" style="width:100%" readonly="readonly">
		<%
		String errorCode=null;
		String funcCode=FuncCode.MS_OPER;
		String isBuss=null;// 标记业务层面错误提示
		String bussMsgInfo=null;//业务层面错误提示信息
		try {
			out.println("错误导向页面错异常信息：");
			Exception e = (Exception) request.getAttribute("Exception");
			if(null == e){
				if(exception instanceof AppException && null !=((AppException)exception).getFuncCode()){
					funcCode = ((AppException)exception).getFuncCode();
				}
				if(exception instanceof BussException ){
				  isBuss = "1";
				  bussMsgInfo = ((BussException)exception).getErrorMessage();
				}else{
				  isBuss = "0";
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
				if(e instanceof BussException ){
				  isBuss = "1";
				  bussMsgInfo = ((BussException)e).getErrorMessage();
				}else{
				  isBuss = "0";
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
			out.println("无法打印错误导向页面错异常信息！");
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
	</div>
	    	<dict:lang value="操作出错，错误编号:" /><%=errorCode + funcCode%></td>
	  </tr>
	</table>
	</body>

	<script type="text/javascript">
		<%
		 if("1".equals(isBuss)){
		%>
		try{
		parent.alertInfo("<%=bussMsgInfo%>");
		}catch(e){
		alert("<%=bussMsgInfo%>");
		}
		<% }else{%>
		var msg = "<dict:lang value="操作出错，错误编号:" />"+"<%=errorCode + funcCode%>";
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
			alert(msg);
		}
		util.closeTopLoading();
		<% }%>
	</script>
</html>
