<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:property value="#parameters.fname"/></title>
		
	<script src="${path}plf/js/pdfobject/pdfobject.js?_mc_res_version=<%=PlfStaticRes.PDFOBJECT_JS %>"></script>
	</head>
	<body>

	<script type="text/javascript">
	
	var options = {
		page: <s:property value="#parameters.PAGE_NO"/>,
		pdfOpenParams: {
			navpanes: 1,
			view: "FitH",
			pagemode: "thumbs",
			toolbar:"1",
			statusbar:"1",
			scrollbars:"1"
		}
	};

	PDFObject.embed("<s:property value="#parameters.pdfPath"/>", document.body, options);

	</script>
      
   	</body>   
</html>