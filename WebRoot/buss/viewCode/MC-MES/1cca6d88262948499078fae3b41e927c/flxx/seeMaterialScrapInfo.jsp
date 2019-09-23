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
<body style="background-color:#fff;overflow:hidden;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="536730f0f221402c8ddc9bb284b26acc" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="536730f0f221402c8ddc9bb284b26acc" />
	<input type="hidden" name="536730f0f221402c8ddc9bb284b26acc" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c2ae53dbf8ac4b0a9b697c918a1c3bb1'" />
		<s:set name="_$formId_1" value="'536730f0f221402c8ddc9bb284b26acc'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:71px"/><bu:uitn colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:65px"/><bu:uitn colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" style="width:235px" colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		
			<td class="name" /><bu:uitn colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="536730f0f221402c8ddc9bb284b26acc" formIndex="1" />
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
