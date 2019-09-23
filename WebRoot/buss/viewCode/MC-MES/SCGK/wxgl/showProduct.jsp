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
		<bu:set name="paraMapObj" value="${dataId}" formId="6587fb2a1c54437cb98b5146ebf8cfbc" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6587fb2a1c54437cb98b5146ebf8cfbc" />
	<input type="hidden" id="prefixInd" name="6587fb2a1c54437cb98b5146ebf8cfbc" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'852b0edec40648c193b1d233a8612bdb'" />
		<s:set name="_$formId_1" value="'6587fb2a1c54437cb98b5146ebf8cfbc'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_AREA_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_AREA_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_AREA_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_REPAIR_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_REPAIR_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_REPAIR_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_MODEL_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_MODEL_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MODEL_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_MODEL_STANDARD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_MODEL_STANDARD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MODEL_STANDARD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_RECORD_TYPE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_RECORD_TYPE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_RECORD_TYPE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_REPEAT_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_REPEAT_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_REPEAT_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="T2#CEC_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T2#CEC_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T2#CEC_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_POINT_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_POINT_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_POINT_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_NUM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_NUM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_NUM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_MISJUDGE_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_MISJUDGE_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MISJUDGE_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_SCARP_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_SCARP_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_SCARP_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_PERIOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_PERIOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_PERIOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_WORK_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_WORK_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_WORK_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_ITEM_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ITEM_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ITEM_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ITEM_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ITEM_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ITEM_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ITEM_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ITEM_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ITEM_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_WORK_STATION" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_WORK_STATION" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_WORK_STATION" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_SHOW" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_SHOW" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_SHOW" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_PRENITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_PRENITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_PRENITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_PERCENT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_PERCENT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_PERCENT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_FAULT_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_FAULT_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_FAULT_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="T3#WR_MEMO" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T3#WR_MEMO" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T3#WR_MEMO" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WD_ID" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WD_ID" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WD_ID" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="T3#WR_REASON_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T3#WR_REASON_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T3#WR_REASON_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="T3#WR_REPAIR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T3#WR_REPAIR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T3#WR_REPAIR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="T3#WR_REPAIR_METHOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T3#WR_REPAIR_METHOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T3#WR_REPAIR_METHOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="T3#WR_ERROR_ITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="T3#WR_ERROR_ITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="T3#WR_ERROR_ITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WE_ERROR_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="WE_ERROR_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec-self" colNo="WE_ERROR_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc"  colspan="7"><bu:ui colNo="WE_ERROR_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="6587fb2a1c54437cb98b5146ebf8cfbc" formIndex="1" />
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
