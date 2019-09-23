<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="${dataMap.VIEW_NAME}" /> <dict:lang value="帮助文档" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="uEditor" value="1" />
	</jsp:include>
	<style>
		
		
		.helpContent {
			width: 1200px;
			margin: 0 auto;
		}
		.heloBread li{
			float: left;
			padding: 0 5px;
		}
		.heloBread {
			overflow: hidden;
			padding: 15px 0;
			border-bottom: 1px solid #e3e3e3;
		}
		.helpContentWrap {
			padding-top: 20px;
		}
	</style>
</head>
<style>

</style>
<body>
	<div class="helpContent">
		<div class="heloBread">
			<ul>
				<li>${dataMap.FULLPATH}</li>
			</ul>
		</div>
		<div class="helpContentWrap">
			${dataMap.help_info}
		</div>
		
	</div>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
