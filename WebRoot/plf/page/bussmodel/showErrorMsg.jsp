<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
    <jsp:param name="layui" value="1" />
</jsp:include>
<script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
</head>
<body>
	<div  id="errorMsg">
	</div>
	<s:hidden id="parentiframeId" name="paraMap.parentId"/><!-- 父表单的iframe	-->
	<s:hidden id="errorId" name="paraMap.id"/><!-- 父表单的iframe	-->
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		
	</jsp:include>

	<script>
	$(function(){
		var mcIframeName = $("#parentiframeId").val();
	    var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
		var parentiframeId = $("#parentiframeId").val();
		var errorId = $("#errorId").val();
		//var topIframe = top.document.getElementById("_topIframe");//获取到父iframe对象
		//var mainFrame = topIframe.contentWindow.document.getElementById("mainFrame");//获取到父iframe对象
		//var parentiframe = mainFrame.contentWindow.document.getElementById(parentiframeId);
		//var parentError = parentiframe.contentWindow.document.getElementById(errorId);
		$("#errorMsg").text($("#"+errorId,mcWindow.document).val());
	})
		
	</script>
<a></a>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>