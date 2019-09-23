<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="公用页面列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>
<style type="text/css">
input {
	width: 100%;
	border-color: #ccc;
	font-size: 12px;
	width: 150px;
	box-sizing: border-box;
	border: 1px solid #dbdbdb;
	height: 20px;
	line-height: 25px;
	padding-left: 5px;
}
</style>
</head>
<body>
	<table class="search_table">
		<tr>
			<td width="100%" style="text-align: center;" >
				所有者<input id="BEGIN_TIME" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" class="input " >
				<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
				<input type="button" id="searchButtonId" style="margin-left: 20px;" value="<dict:lang value="终止会话" />" onclick="query(this)"  class="botton_img_add" />
				</td>
		</tr>
	</table>


	<%-- <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include> --%>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>