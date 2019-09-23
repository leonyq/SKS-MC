<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="文档主页" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
    <table class="table_list" >
			<s:iterator value="page.dataList" status="index">
			<tr>
				<td width="60%" align="left" style="text-align: left;padding-left: 5px;">
					<div><a href="${path}doc/viewpdf.jsp?pdfPath=${path}up_load/comm/<s:property value="FILE_PATH"/>/<s:property value="DOC_VIEW"/>&fname=<s:property value="DOC_NAME"/>&PAGE_NO=1" target="_blank" ><b><s:property value="DOC_NAME"/></b></a></div>
					<div>
						<dict:lang value="浏览" />:<s:property value="VIEW_NUM"/>&nbsp;&nbsp;
						<dict:lang value="点评" />:<s:property value="COMMENT_NUM"/>&nbsp;&nbsp;
						<dict:lang value="热度" />:<s:property value="HOT_NUM"/>
					</div>
				</td>
				<td width="20%"><dict:lang value="上传人" />:<s:property value="ADD_USER"/></td>
				<td width="20%"><dict:lang value="上传时间" />:<s:property value="CREATE_TIME"/></td>
			</tr>
			</s:iterator>
		</table>
		</form>
		</div>
	</div>
	
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=listForm&resetSearchVal=resetSearchVal" />
	</div>
	
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function showBorder(thisObj){
		$(thisObj).css("border"," 1px solid blue");
	}
	function showBorderOut(thisObj){
		$(thisObj).css("border"," 1px solid white");
	}
	function showVidoChild(thisObj,id){
		var url = "${path}buss/bussModel.ms?exeid=b27ddd6b3c8944caa6fe247498d5258c&paraMap.ID="+id;
		window.open(url);
	}
	
	
	function init(){
		
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
