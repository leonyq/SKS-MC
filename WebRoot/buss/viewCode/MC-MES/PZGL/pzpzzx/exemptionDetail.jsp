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
		<bu:set name="paraMapObj" value="${dataId}" formId="d6969731daf649c0acf934e37c0a4f1f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d6969731daf649c0acf934e37c0a4f1f" />
	<input type="hidden" name="d6969731daf649c0acf934e37c0a4f1f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3aebcb46bd3a43f29a33656228605a20'" />
		<s:set name="_$formId_1" value="'d6969731daf649c0acf934e37c0a4f1f'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width: 89px;"/><bu:uitn colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 250px;" colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><bu:uitn colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_VALID_FLAG}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>	
			<td class="name" /><bu:uitn colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_FILE_NAME" name="upFile" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_REASON" style="height:80px;width:100%" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_BASIS" style="height:80px;width:100%" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_REVIEW_OPINION" style="height:80px;width:100%" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_CANCEL_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_CANCEL_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_CANCEL_REASON"  style="height:80px;width:100%" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d6969731daf649c0acf934e37c0a4f1f" formIndex="1" />
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
