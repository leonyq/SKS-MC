<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_18" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>

	<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>

	<!-- head里面 -->
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_18" />
		<jsp:param name="location" value="inHead" />
	</jsp:include>
</head>

<body style="background-color:white;"> 
	<div class="edit">
		<div class="bd" style="border: none">
			<form id="detailForm" name="detailForm" action="#" method="post" />
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_18" />
				<jsp:param name="location" value="detailForm" />
			</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" type="edit" />
			<table class="basic-table">
				<input type="hidden" name="formIds" value="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				<input type="hidden" name="737e3d7aac9c49c2ace9d8c0b212a2f5" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'fcc2e13644bc44e19573e404b852aaa6'" />
				<s:set name="_$formId_1" value="'737e3d7aac9c49c2ace9d8c0b212a2f5'" />
				<s:set name="_$type" value="'detail'" />
				<tr>
					<td class="name" style="width: 70px;"/>
					<bu:uitn colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" style="width: 230px;" colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" style="width: 80px;"/>
					<bu:uitn colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" style="width: 230px;" colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
						<bu:ui colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" /></bu:td>
					
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
					</td>
					<bu:td cssClass="dec" colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" colspan="3">
						<bu:ui colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" dataId="${dataId}" formIndex="1" style="height:80px;width: 99.3%;"/></bu:td>
				</tr>
				
			</table>
			<bu:jsVal formId="737e3d7aac9c49c2ace9d8c0b212a2f5" formIndex="1" />
			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_18" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_18" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>