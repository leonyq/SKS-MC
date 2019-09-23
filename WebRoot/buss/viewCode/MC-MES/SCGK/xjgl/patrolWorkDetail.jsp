<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <style>
.state {
    display: inline-block;
    width: 45px;
    height: 20px;
    line-height: 20px;
    color: #fff;
    text-align: center;
    font-size: 12px;
    border-radius: 2px;
}
  </style>
</head>
<body style="background-color:white;">
	<div class="edit">
			<div class="bd" style="border: none">
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="35085c72eb4f4a4fba44694353ef0251" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="35085c72eb4f4a4fba44694353ef0251" />
	<input type="hidden" name="35085c72eb4f4a4fba44694353ef0251" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a1badb47829c4c6ba31831d31bd190e1'" />
		<s:set name="_$formId_1" value="'35085c72eb4f4a4fba44694353ef0251'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_EVENT" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_EVENT" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_EVENT" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_ITEM_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_ITEM_SN" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_ITEM_SN" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_ITEM_CODE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_ITEM_CODE" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_ITEM_CODE" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_MO_NUMBER" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_MO_NUMBER" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_MO_NUMBER" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_MODEL_CODE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_MODEL_CODE" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_MODEL_CODE" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_PROCESS_FACE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_PROCESS_FACE" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_PROCESS_FACE" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_AREA_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_AREA_SN" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_AREA_SN" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_WORK_STATIONID" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_WORK_STATIONID" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_WORK_STATIONID" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_DEVICE_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_DEVICE_SN" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_DEVICE_SN" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_FEEDER_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_FEEDER_SN" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_FEEDER_SN" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_EMP_NAME" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_EMP_NAME" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_EMP_NAME" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_ORERATE_TIME" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_ORERATE_TIME" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_ORERATE_TIME" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_MODEL_NAME" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_MODEL_NAME" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_MODEL_NAME" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_MODEL_SPEC" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_MODEL_SPEC" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_MODEL_SPEC" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_DEVICE_SEQ" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_DEVICE_SEQ" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_DEVICE_SEQ" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QOL_TABLE_NO" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_TABLE_NO" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_TABLE_NO" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_LOADPOINT_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_LOADPOINT_SN" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_LOADPOINT_SN" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251" ><bu:ui colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name-three" /><bu:uitn colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<bu:td cssClass="dec-self" colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251"  colspan="7"><bu:ui colNo="QOL_CHANEL_NO" formId="35085c72eb4f4a4fba44694353ef0251" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			<bu:jsVal formId="35085c72eb4f4a4fba44694353ef0251" formIndex="1" />
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
    	    	$(function(){
    	    	    $('.dialog-bd',parent.document).css('background-color','#fff');
    	    	})
    	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>