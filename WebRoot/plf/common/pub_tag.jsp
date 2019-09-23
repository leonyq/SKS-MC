<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ taglib prefix="c" uri="/plf/tld/c.tld"%>
<%@ taglib prefix="fmt" uri="/plf/tld/fmt.tld"%>
<%@ taglib prefix="fn" uri="/plf/tld/fn.tld"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ taglib prefix="bu" uri="/plf/tld/buss-tags.tld"%>
<%@ taglib prefix="ui" uri="/plf/tld/ml-ui-tags.tld"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath() + "/";
	String rootPath = new StringBuilder().append(request.getScheme()).append("://").append(request.getServerName())
			.append(":").append(request.getServerPort()).append(path).toString();
	final String IMG_PATH = path + ConstantsMc.CSS_IMG_PATH;
	final String UI_IMG_PATH = path + ConstantsMc.FORM_UI_IMG_PATH;
	request.setAttribute("path", path);
	request.setAttribute("rootPath", rootPath);
	request.setAttribute("IMG_PATH", IMG_PATH);
	request.setAttribute("UI_IMG_PATH", UI_IMG_PATH);
	if (!"1".equals(request.getAttribute("pagination"))) {
		if ("1".equals(request.getAttribute("isTree"))) {
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		} else {
			out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
		}
		out.print("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
	}
%>
<%@ include file="/plf/common/i18n_js.jsp"%>

<script src="${path }/plf/js/common/package.js?_mc_res_version=<%=PlfStaticRes.PACKAGEJS %>"></script>
<script src="${path }/plf/js/common/mc_base64_js_to_java.js?_mc_res_version=<%=PlfStaticRes.PACKAGEJS %>"></script>