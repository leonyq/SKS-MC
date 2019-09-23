<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script src="${path}js/jchose/chosen.jquery.min.js"></script>
	<link rel="stylesheet" href="${path}js/jchose/chosen.css"/>	
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<bu:funcsi viewId="0ec3d0f459414f7e9201ce01708af122" funcId="7c6875ceef214772a54725b3d97233a7"/>
							<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
							<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
						</td>
					</tr>
				</table>
				<bu:addcp exeid="%{exeid}" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:script viewId="0ec3d0f459414f7e9201ce01708af122" />

<script type="text/javascript">

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
<script type="text/javascript">
	function init(){

		$(".<s:property value="%{@com.more.mes.common.tags.mes.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();	}//初始化方法
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
