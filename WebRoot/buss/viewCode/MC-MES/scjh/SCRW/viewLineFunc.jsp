<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="509546604440458faf9f54d4b907ad31" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="509546604440458faf9f54d4b907ad31" />
	<input type="hidden" id="prefixInd" name="509546604440458faf9f54d4b907ad31" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1e57bf1ddcae44068337aae0afe33f5a'" />
		<s:set name="_$formId_1" value="'509546604440458faf9f54d4b907ad31'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="T2#DESTROY_NO" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="T2#DESTROY_NO" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="T2#DESTROY_NO" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_PRIORITY_LV" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PRIORITY_LV" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PRIORITY_LV" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ID" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="ID" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_INPUT_COUNT" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_INPUT_COUNT" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_INPUT_COUNT" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_FINISH_COUNT" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_FINISH_COUNT" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_FINISH_COUNT" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_SCRAP_QTY" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_SCRAP_QTY" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SCRAP_QTY" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_ISSUED_EMP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_ISSUED_EMP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_ISSUED_EMP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_FQC_NUM" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_FQC_NUM" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_FQC_NUM" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_GROUP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_GROUP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_GROUP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_PER_TASK" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PER_TASK" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PER_TASK" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_PLAN_ID" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PLAN_ID" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PLAN_ID" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_TRACK" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_TRACK" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TRACK" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_ISSUED_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_ISSUED_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_ISSUED_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PROCESS_FACE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PROCESS_FACE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_START_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_START_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_START_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_ALTER_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_ALTER_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_ALTER_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_MEMO" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_MEMO" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_MEMO" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_NAME" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_NAME" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_STANDARD" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_STANDARD" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_STANDARD" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CLOSE_REASON" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CLOSE_REASON" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_CLOSE_REASON" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_CLOSE_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CLOSE_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_CLOSE_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_STATUS" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_STATUS" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_STATUS" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_PRODUCT_STEP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PRODUCT_STEP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PRODUCT_STEP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SEQ" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SEQ" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_SEQ" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_PCB_CODE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PCB_CODE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PCB_CODE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_MODEL_CODE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_MODEL_CODE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_MODEL_CODE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_AUTO_FQC" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_AUTO_FQC" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_AUTO_FQC" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_PROJECT_ID" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_PROJECT_ID" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PROJECT_ID" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_TECH_SN" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_TECH_SN" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TECH_SN" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="PM_AREA_SN" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_AREA_SN" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_AREA_SN" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_COUNT" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_COUNT" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="PRODUCT_OPENTIME" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_OPENTIME" formId="509546604440458faf9f54d4b907ad31"  ><bu:ui colNo="PRODUCT_OPENTIME" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-three" /><bu:uitn colNo="PM_CUST_CODE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CUST_CODE" formId="509546604440458faf9f54d4b907ad31"  colspan="4"><bu:ui colNo="PM_CUST_CODE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="509546604440458faf9f54d4b907ad31" formIndex="1" />
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
