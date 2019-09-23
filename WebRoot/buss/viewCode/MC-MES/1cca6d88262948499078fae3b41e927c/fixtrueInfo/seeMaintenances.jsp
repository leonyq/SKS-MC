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
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e042ca4636e04d6fbb18da331c1179f6'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui  colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" display="none"/>
			<input type="text" name="select" class="input isSubmit" readonly="readonly" value="" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" id="paraMapObj_CFM_FIX_SN"></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" />
			</bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_TIME" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_DESC " formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_DESC " formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_DESC " formId="9e447f80074441dcb0541aa75341e0b5" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
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
