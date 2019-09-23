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
 <style type="text/css">
.fdiv {
    height:488px !important;
}
</style>
</head>
<body>
	<div class="edit">
			<div class="bd fdiv"   style="border: none;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec9ecb539af6461e98b5ccd5ec9b17ad" />
	<input type="hidden" name="ec9ecb539af6461e98b5ccd5ec9b17ad" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5d9917e892ba435781baa66e2b5e00f9'" />
		<s:set name="_$formId_1" value="'ec9ecb539af6461e98b5ccd5ec9b17ad'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_EVENT"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_STATUS"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_TYPE"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_TIME"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_AREA_SN"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MO_NUMBER"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		
			<td class="name-six" /><bu:uitn colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_CODE"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name-six" /><bu:uitn colNo="QWL_MODEL_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_NAME"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_MODEL_SPEC" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_SPEC" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_SPEC"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<!--<td class="name-six" />半品料号</td>
			<bu:td cssClass="dec-self" colNo="" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><input type="text" id="" name="" readonly="readonly" class=" input isSubmit " ></bu:td>
			
			<td class="name-six" />品名</td>
			<bu:td cssClass="dec-self" colNo="" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><input type="text" id="" name="" readonly="readonly" class=" input isSubmit " ></bu:td>
			
			<td class="name-six" />规格</td>
			<bu:td cssClass="dec-self" colNo="" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><input type="text" id="" name="" readonly="readonly" class=" input isSubmit " ></bu:td>-->
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSER"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSE_TIME"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			
			
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CONTENT" colspan="6" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CONTENT"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>		
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_REASON" colspan="6" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REASON"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>
		</tr>
		<tr>	
			<td class="name-six" /><bu:uitn colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_SOLUTION" colspan="6" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_SOLUTION"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>	
		</tr>
		<tr>	
			<td class="name-six" /><bu:uitn colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_REMARK" colspan="6" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REMARK"  formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>					
		</tr>


	</table>
			<bu:jsVal formId="ec9ecb539af6461e98b5ccd5ec9b17ad" formIndex="1" />
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
