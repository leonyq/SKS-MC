<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><s:property value="#parameters.fname"/></title>
		
	<script src="/mes/plf/js/pdfobject/pdfobject.js"></script>
	<%-- <script src="/mes/plf/js/pdfjs/generic/build/pdf.js"></script> --%>
	</head>
	<body>
		<iframe src="/mes/plf/js/pdfjs/generic/web/viewer.html?file=<s:property value="#parameters.pdfPath"/>&page=3" width="100%" height="600"></iframe>
	
	
	<script type="text/javascript"> 

		<%-- 方式2
      window.onload = function (){
        //var myPDF = new PDFObject({ url: "sample.pdf" }).embed();
      };
 			
 			//PDFObject.embed("test.pdf", "#pdf1");
     // alert(PDFJS.version);
      

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
	 --%>
//PDFObject.embed("/pdf/sample-3pp.pdf", "#pdf1");

</script>
      
   	</body>   
</html>