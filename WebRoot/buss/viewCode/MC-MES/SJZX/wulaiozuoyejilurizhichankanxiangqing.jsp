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
	<style>
		.dec input{
			width:200px;
		}
	</style>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="cd67e8187c6f40b19d71df62d3b872c8" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cd67e8187c6f40b19d71df62d3b872c8" />
	<input type="hidden" name="cd67e8187c6f40b19d71df62d3b872c8" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0547610439864f91b9715875a876f2c5'" />
		<s:set name="_$formId_1" value="'cd67e8187c6f40b19d71df62d3b872c8'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="WSI_MO_NUMBER" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="WSI_MO_NUMBER" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_MO_NUMBER" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:98px;"/><bu:uitn colNo="WSI_ACTIONTYPE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="WSI_ACTIONTYPE" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ACTIONTYPE" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:65px;"/><bu:uitn colNo="WSI_MODEL_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="WSI_MODEL_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_MODEL_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_PROCESS_FACE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_PROCESS_FACE" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_PROCESS_FACE" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_AREA_ID" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_AREA_ID" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_AREA_ID" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_WORKSTATION_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_WORKSTATION_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_WORKSTATION_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_ONLINE_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ONLINE_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ONLINE_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ITEM_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ITEM_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_LOT_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOT_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_LOT_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_COUNT" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_COUNT" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ITEM_COUNT" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_POINT" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_POINT" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_POINT" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_POINT_NUM" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_POINT_NUM" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_POINT_NUM" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_SUPPLIERS" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_SUPPLIERS" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_SUPPLIERS" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_SN_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ITEM_SN_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_CODE_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_ITEM_CODE_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WSI_LOT_NO_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOT_NO_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_LOT_NO_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_COUNT_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_COUNT_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_COUNT_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_DEVICE_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_DEVICE_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_DEVICE_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_DEVICE_SEQ" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_DEVICE_SEQ" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_DEVICE_SEQ" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_TRUCK_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_TRUCK_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_TRUCK_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_TABLE_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_TABLE_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_TABLE_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_LOADPOINT_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOADPOINT_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_LOADPOINT_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_FEEDER_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_FEEDER_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_FEEDER_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_CHANEL_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_CHANEL_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_CHANEL_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_TRAY_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_TRAY_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_TRAY_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_REPEAT_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_REPEAT_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_REPEAT_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_LOADTIME" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOADTIME" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_LOADTIME" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WSI_EMP_NAME" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="WSI_EMP_NAME" formId="cd67e8187c6f40b19d71df62d3b872c8" ><bu:ui colNo="WSI_EMP_NAME" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
		<tr>
			<td class="name" /><bu:uitn colNo="EDIT_USER" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="EDIT_USER" formId="cd67e8187c6f40b19d71df62d3b872c8"  ><bu:ui colNo="EDIT_USER" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="EDIT_TIME" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<bu:td cssClass="dec" colNo="EDIT_TIME" formId="cd67e8187c6f40b19d71df62d3b872c8"  colspan="4"><bu:ui colNo="EDIT_TIME" formId="cd67e8187c6f40b19d71df62d3b872c8" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="cd67e8187c6f40b19d71df62d3b872c8" formIndex="1" />
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
