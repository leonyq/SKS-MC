<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.mes.common.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="地址级联选择页面" /></title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<div>
			<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
				<input type="hidden" name="exeid" value="${exeid}" />
				<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div style="width: 94px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" class="search_text">
									<dict:lang value="省份" />
								</div>
								<div class="search_value">
									<select id="paraMap_PROVINCE" name="paraMap.PROVINCE" onchange="selectChild(this,'paraMap_CITY');">
										<option value="">
											<dict:lang value="--全部--" />
										</option>
										<s:iterator value="dataList">
											<option value="<s:property value='ID'/>">
												<s:property value="NAME" />
											</option>
										</s:iterator>
									</select>
								</div>
							</div>
							<div class="search_div">
								<div style="width: 94px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" class="search_text">
									<dict:lang value="地市" />
								</div>
								<div class="search_value">
									<select id="paraMap_CITY" name="paraMap.CITY">
										<option value="">
											<dict:lang value="--全部--" />
										</option>
										<s:iterator value="dataList">
											<option value="<s:property value='ID'/>">
												<s:property value="NAME" />
											</option>
										</s:iterator>
									</select>
								</div>
							</div>
							<bu:funcsi viewId="d788bf8dce02410cae9d5fcb2e08e9bc" funcId="e8cd4662baaf4cff8e8258a5652e69da"/>
							<bu:funcsi viewId="d788bf8dce02410cae9d5fcb2e08e9bc" funcId="d11dfb1a245b4df9b10d2fddc1e0e870" isHidden="1" />
						</td>
					</tr>
				</table>


				<bu:form viewId="d788bf8dce02410cae9d5fcb2e08e9bc" formId="0f3cd3065b7b48e8b10f6f69fad073a0" list="dataList"
					formidFirstId="0f3cd3065b7b48e8b10f6f69fad073a0" relColIds="" subFormIds="" subRelColIds="" />
				<%
					if (null != request.getAttribute("page")) {
						PaginationImpl _pageTop = (PaginationImpl) request.getAttribute("page");
						if (_pageTop.isPage()) {
				%>
				<div class="center">
					<s:include value="/common/pagination.jsp?formId=searchForm" />
				</div>
				<%
					}
					}
				%>
			
		</div>


		</form>
	</div>
	</div>
	<bu:submit viewId="d788bf8dce02410cae9d5fcb2e08e9bc" />
	<bu:script viewId="d788bf8dce02410cae9d5fcb2e08e9bc" />

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
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
