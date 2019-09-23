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
<body style="background-color: white;">
	<div class="edit">
			<div class="bd" style="border: none;height:250px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="be5d3c53cd2b455fa480961d1f3e7b86" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="be5d3c53cd2b455fa480961d1f3e7b86" />
	<input type="hidden" name="be5d3c53cd2b455fa480961d1f3e7b86" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4de42b8face74c4aaca89ce06b3e96f7'" />
		<s:set name="_$formId_1" value="'be5d3c53cd2b455fa480961d1f3e7b86'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><bu:uitn colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width: 70px;text-align: right;">
				<bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
				<bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" />
			</td>	
			<!--
			<td class="name" /><bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_FULL_FLAG}" formIndex="1" /></bu:td>
		    -->
			<td class="name" /><bu:uitn colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="be5d3c53cd2b455fa480961d1f3e7b86" formIndex="1" />
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
    	<script>
    	    $('.dialog-bd',parent.document).css('background-color','#fff');
    	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
