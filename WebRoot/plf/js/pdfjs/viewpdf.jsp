<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:property value="#parameters.fname"/></title>

<script src="/mes/plf/js/pdfjs/generic/build/pdf.js?_mc_res_version=<%=PlfStaticRes.PDF_JS %>"></script>

	</head>
	<body>
	<%-- 纯JS实现 --%>
		<iframe id="pdfIframe" name="pdfIframe" src="/mes/plf/js/pdfjs/generic/web/viewer.html?file=<s:property value="#parameters.pdfPath"/>&page=<s:property value="#parameters.PAGE_NO"/>" width="100%" height="600"></iframe>


	<script type="text/javascript">

      window.setTimeout("gotosPage()","500");
      
      function gotosPage(){
    		//alert(document.pdfIframe.PDFViewerApplication.page);//获取子iframe中的js变量
    		if(<s:property value="#parameters.PAGE_NO"/> !=document.pdfIframe.PDFViewerApplication.page){
    			window.setTimeout("gotosPage()","500");
    		}else{
    			document.pdfIframe.setPageSNumber(<s:property value="#parameters.PAGE_NO"/>);
    		}
    		document.pdfIframe.PDFViewerApplication.page = <s:property value="#parameters.PAGE_NO"/>
      }
      
	</script>

   	</body>   
</html>