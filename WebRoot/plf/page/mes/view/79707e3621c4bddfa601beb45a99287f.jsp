<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="TEST0000" />
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
		<bu:func viewId="6a65018fd93a4143818779b4a9eae3a6" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="6a65018fd93a4143818779b4a9eae3a6" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		    <table id="listTable" class="table_list" >
    		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="20%"><dict:lang value="用户名" /></th>
			<th width="20%"><dict:lang value="年龄" /></th>
			<th width="10%"><dict:lang value="操作" />
				<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif" /></a>
			</th>
		</tr>
		<thead>
		<tbody>
		<s:iterator value="dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="UNAME"/></td>
			<td><s:property value="AGE"/></td>
			<td>
				<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif" /></a>
			</td>
		</tr>
		</s:iterator>
		</tbody>
		</table>
	
		</form>
		</div>
	</div>
		<bu:submit viewId="6a65018fd93a4143818779b4a9eae3a6" />
		<bu:script viewId="6a65018fd93a4143818779b4a9eae3a6" />

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
			_toClickColorMap(tableTrJs,$(this).attr("id"));<%-- 设置table点击行颜色 --%>
			_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
		});
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
