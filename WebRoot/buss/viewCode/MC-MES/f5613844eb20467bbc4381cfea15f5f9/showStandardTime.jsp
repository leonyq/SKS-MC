<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<style type="text/css">
.input {
	width:200px !important;
}
</style>	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;    height: 196px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b6074af91db439aa8e73c486b484970" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b6074af91db439aa8e73c486b484970" />
	<input type="hidden" name="9b6074af91db439aa8e73c486b484970" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'9d7ebdc247824e76afba5c5646593cc6'" />
		<s:set name="_$formId_1" value="'9b6074af91db439aa8e73c486b484970'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-three" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STEP_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_NAME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_AREA_SN" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_SPEC" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_MODEL_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STANDARD_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_PROCESS_FACE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:150px;"/><span class="dot">*</span><bu:uitn colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CHANGE_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><!--<span class="dot">*</span>--><bu:uitn colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CT_ID" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_SCHEDULE_FLAG"  formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9b6074af91db439aa8e73c486b484970" formIndex="1" />
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
