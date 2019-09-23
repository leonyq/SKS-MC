<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title>信息管理系统主框架</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<script type="text/javascript">
	$(function(){
		var mainPageUrl = $("#mainPageUrl" , parent.document).val();
		if(mainPageUrl!=""){
			$("#mainFrame").attr("src",mainPageUrl);
		}else{
			$("#mainFrame").attr("src","${path}plf/page/sysmain/main/mainShow.jsp");
		}
		
	});
	
</script>
	</head>
 	<frameset id="mainFrameset" rows="50,*" cols="*" border="0" bordercolor="#D2E0F2" framespacing="1">
		<frame src="${path}plf/page/sysmain/main/top.jsp" name="topFrame" id="topFrame" noresize="noresize"  frameborder="no" border="0" framespacing="0" scrolling="no" />
		<frameset rows="*" id="bottomFrame" cols="230,*" border="1" bordercolor="#D2E0F2" framespacing="1">
		    <frame src="${path}sys/FuncAction_listUserPlfFunc.ms" name="leftFrame" id="leftFrame" scrolling="no" style="border: 1px solid #99BBE8;" />
		    <frame src="" name="mainFrame" id="mainFrame" scrolling="no" />
		    <!-- <frame src="<%=CommMethodMc.getMainFrameUrl(request)%>" name="mainFrame" id="mainFrame" scrolling="auto" style="border: 1px solid #99BBE8;" />-->
		</frameset>
	</frameset>
	<noframes>
		<body>无法显示 frameset</body>
	</noframes>
	
<%@ include file="/plf/common/pub_end.jsp" %>