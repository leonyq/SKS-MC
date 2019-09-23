<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="数据库复制" />
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
		
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post" target="submitForm">
			<input type="hidden" name="exeid" value="${exeid}" />
    <table class="table_list" >
			<tr>
				<td width="40%" align=left>
					<s:select name="paraMap.dataSourceS" list="page.dataList" listKey="ID" listValue="ACC_NAME" cssStyle="width:146px;" />
					<span class="required_sign">${errors["paraMap.accNo"][0]}</span>
				</td>
				<td width="10%" align=left>
					<dict:lang value="复制到" />=>
				</td>
				<td width="40%" align=left>
					<s:select name="paraMap.dataSourceD" list="page.dataList" listKey="ID" listValue="ACC_NAME" cssStyle="width:146px;" />
					<span class="required_sign">${errors["paraMap.accNo"][0]}</span>
				</td>
				<td width="10%" align=left>
					<bu:funcsi viewId="4a0cd37546924ef1a6ee818933e02ad4" funcId="07d355c4eb8e427a9a9eada1f6591c8b" />
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>
	
	<iframe id="submitForm" name="submitForm" width="0" height="0"></iframe>

<bu:script viewId="4a0cd37546924ef1a6ee818933e02ad4"/>

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
	
	function init(){
		
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
