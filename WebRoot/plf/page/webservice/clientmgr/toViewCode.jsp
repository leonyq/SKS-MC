<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
	<jsp:param name="layui" value="1" />
</jsp:include>

<style>
	html,body {
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	.editFromWrap {
		width: 100%;
		height: 100%;
	}
	.editFromWrap #editForm, #div_code {
		width: 100%;
		height: 100%;
	}
	.editFromWrap #stubCode {
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<div class="editFromWrap">
		<form id="editForm" name="editForm"
			action="${path}webservice/ClientMgrAction_editCode.ms" method="post" target="submitFrame">

				<div id="div_code">
					<textarea id="stubCode"  wrap="off" style="word-wrap: normal; margin: 0px;" readonly="readonly"></textarea>
				</div>
				<div id="div_code_preview"></div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	var piframeName = '<s:property value="paraMap.piframeName"/>';
	var pIframe = top.window.frames[piframeName];
	$(function(){
		var stubCode = pIframe.document.getElementById("stubCode").value;
		$("#stubCode").text(stubCode);
	});
	
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
		util.setTextAreaWidth("div_code","stubCode");
		util.setTextAreaHeight("stubCode",$("#div_head").height());
		$(window).resize(function () {
			util.setTextAreaWidth("div_code","stubCode");
			util.setTextAreaHeight("stubCode",$("#div_head").height());
		});
	} else {
		$("#stubCode").css({width:"100%",height:"100%"});
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>