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

<body style="background-color: white;"> 
	<div class="edit">
		<div class="bd" style="border: none">
			<form id="detailForm" name="detailForm" action="#" method="post" />
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_18" />
				<jsp:param name="location" value="detailForm" />
			</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="3196b9fb2750494a8e7ff527a46d32c1" type="edit" />
			<table class="basic-table">
				<input type="hidden" name="formIds" value="3196b9fb2750494a8e7ff527a46d32c1" />
				<input type="hidden" name="3196b9fb2750494a8e7ff527a46d32c1" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'0210cb5a9c5243e39526553dde1e23d3'" />
				<s:set name="_$formId_1" value="'3196b9fb2750494a8e7ff527a46d32c1'" />
				<s:set name="_$type" value="'detail'" />
				<tr>
					<td class="name" style="width: 70px;" />
					<bu:uitn colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" style="width: 230px;" colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width: 90px;" />
					<bu:uitn colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" style="width: 230px;" colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" />
					<bu:uitn colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
					
					<td class="name" />
					<bu:uitn colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" />
					<bu:uitn colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				
				<tr>
					<td class="name" />
					<bu:uitn colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>

					
				</tr>
				<tr>
					<td style="width: 70px;text-align: right;">
						<bu:uitn colNo="QMS_DEFAULT_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<td>&nbsp;
						<bu:ui colNo="QMS_DEFAULT_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" />
						&#x3000;
						<bu:uitn colNo="QMS_FULL_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" />
						<bu:ui colNo="QMS_FULL_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" />
					</td>	
						
					<td class="name" />
					<bu:uitn colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					</td>
					<bu:td cssClass="dec" colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1">
						<bu:ui colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
			</table>
			<bu:jsVal formId="3196b9fb2750494a8e7ff527a46d32c1" formIndex="1" />
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