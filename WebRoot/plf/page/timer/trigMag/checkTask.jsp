<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="定时发送EMail" /> <dict:lang value="新增" />
</title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
</head>
<style>
#menu {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
    border-bottom: 1px solid #ccc;
    padding:0 5px;
    height: 30px;
    margin-top: 5px;
}

#menu li {
	text-decoration: none;
	list-style: none;
	display: inline-block;
	border: 1px solid #CCC;
	border-bottom:none;
	padding:4px 10px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	background-color: #95c4e6;
	float:left;
	margin: 0 1px;
	margin-top: 2px;
}

#menu li.current{
	background-color: #FCFCFC;
}


#menu li:hover {
	background-color: #FCFCFC;
}
</style>
<frameset rows="*" cols="270,*" border="4" bordercolor="#D2E0F2" framespacing="2">
	    <frame src="${path}plf/page/timer/workMag/moduleTree.jsp?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=<c:out value='${param.FUNC_CODE}'/>" name="treeFrame" id="treeFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	    <frame src="${path}sys/workMagAction_listModule.ms?paraMap.UP_ID=0&queryType='checkTask'" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	</frameset>
<body>
	

	<script type="text/javascript">
		var type=$("#type").val();
		var checkId=$("#checkId").val();
		var workDec=$("#workDec").val();
		function checkTask(url, obj, type) {
			$("#data").show();
			$("#type").val(type);
			$(obj).parent().addClass("current").siblings().removeClass(
					"current");
			$("#data").prop("src", url);
			
		}
		var isSubmit = false;
		function reloadPg(msg) {
			isSubmit = false;
			window.parent.reloadPg(msg);
		}

		function alertInfo(msg) {
			isSubmit = false;
			util.alert(msg);
		}
		function save(thisObj) {
			parent.updateCheckData($("#type").val(), $("#checkId").val(), $("#workDec").val());
			parent.closePopWin();
		}
		function checkData(checkId, workDec) {
			$("#checkId").val(checkId);
			$("#workDec").val(workDec);
		}
		$("#data").load(function() {
			var mainheight = $(this).contents().find("body").height() + 30;
			$(this).height(mainheight);
		});

	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>