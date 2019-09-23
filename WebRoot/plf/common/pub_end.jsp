<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%
	out.print("<script> window.history.forward(1); ");//禁止回退键
	out.println(" try{init();/*调用默认的初始化方法*/}catch(e){} </script>");

	if ("1".equals(ReadProperties.getPorpertie("system.properties", "PAGE.PRINT.ERROR"))) {//如果允许页面输出错误信息
%>
	<div id="mc_pub_show_err_div" style="display: none;">
		<p>
			An exception was thrown:<c:out value='${pageContext.exception}' />
			<br>
			<textarea id="mc_pub_show_err_txta" rows="25" cols="150" readonly="readonly">
			</textarea>
	</div>
<%
	}

	if (!"1".equals(request.getAttribute("pagination"))) {
		out.print("</html>");
	}
%>
<script type="text/javascript" src="${path}plf/page/js_files/comm/chk.ms.save.mark.utils.js?_mc_res_version=<%=com.more.fw.core.staticresource.PlfStaticRes.ChkMsSaveMarkUtils %>"></script>
 
 <script>
// var dsMcWebSaveFormDataTime=<%=com.more.fw.core.common.method.ReadProperties.getPorpertie("cluster.properties","WEB_FORM_SAVE_TIME")%>;
// var dsMcWebSaveFormDataTimePrev=dsMcWebSaveFormDataTime;
$(function() { 

	chkMsSaveMarkUtils.loadConfig();
	//有产品组 开发者调用chkMsSaveMarkUtils.saveConfig()在指定地方调用
	//setInterval("chkMsSaveMarkUtils.saveConfig()", dsMcWebSaveFormDataTime );
}); 
 
 </script>
 
 