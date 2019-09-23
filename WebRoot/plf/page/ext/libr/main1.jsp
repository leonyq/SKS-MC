<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.common.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="搜索页" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>

		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post"  >
			<input type="hidden" name="exeid" value="${exeid}" />
			
			<table class="table_list">
					<tr>
						<td colspan="4" align="center" valign="middle" style="text-align: center;">
							<div style="text-align: center;">
							<b><dict:lang value="搜索关键字" />：</b>
							<s:textfield id="paraMap_scode" name="paraMap.scode" maxlength="90" cssStyle="width:350px;height:35px;padding-top: 6px;" />
							<input type="button" value="<dict:lang value='搜索' />" onclick="search(this);" style="width:80px;height:35px;;line-height: 35px;background: #ff9966;text-align: center;" />
							</div>
						</td>
					</tr>
					<tr>
						<th><dict:lang value="序号" /></th>
						<th><dict:lang value="类型" /></th>
						<th><dict:lang value="标题" /></th>
						<th><dict:lang value="内容" /></th>
					</tr>
					<s:iterator value="page.dataList" status="seq">
					<tr>
						<td width="5%"><s:property value="#seq.count" /></td>
						<td width="8%"><s:property value="RES_TYPE_NAME" /></td>
						<td width="27%"><a href="javascript:void(0);" onclick="showRes('<s:property value="RES_TYPE" />','<s:property value="OPEN_URL" />');"  title="<dict:lang value='查看' />" ><s:property value="TITLE" /></a></td>
						<td width="60%"><s:property value="CONTENT_TEXT" /></td>
					</tr>
					</s:iterator>
			</table>
	
			<div class="center">
				<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
			</div>
		   <br />
		</form>
		</div>
	</div>
		<bu:submit viewId="d4532be96ef8482c87fbdddf34c55881" />

	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function showRes(RES_TYPE,OPEN_URL){
			window.open(OPEN_URL);
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function search(thisObj){
		if(val.isBlank($("#paraMap_scode").val())){
			util.alert("<dict:lang value="搜索关键字" />"+"<dict:lang value="不能为空" />");
			$("#paraMap_scode").focus();
			return;
		}
		query(thisObj);
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
