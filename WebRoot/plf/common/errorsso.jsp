<%@page import="com.more.fw.core.common.exception.BussException"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"  isErrorPage="true" contentType="text/html;charset=UTF-8"%>
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
<html >
  <head>
  <%
    String errmsg=request.getAttribute("errmsg")==null?"外系统单点登录异常...":request.getAttribute("errmsg")+"";
    
%>

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
      

      </td>
    </tr>
    <tr>
      <td style="color: ff0000" align="center" valign="middle">
    <div id="_show_err_div" >
    <p>An exception was thrown:
    <br>
    <textarea id="_show_err_txta" rows="25" style="width:100%" readonly="readonly">
    <c:out value="${errmsg}"/>
    </textarea>
    <br/>
    
  </div>
    </tr>
  </table>
  </body>

  <script type="text/javascript">

  </script>
</html>
