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
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0901df423f9c4e0e98f61edd6f2f1c4f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0901df423f9c4e0e98f61edd6f2f1c4f" />
	<input type="hidden" name="0901df423f9c4e0e98f61edd6f2f1c4f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b487f7a5d6ed47a48bd570edfc0dcfad'" />
		<s:set name="_$formId_1" value="'0901df423f9c4e0e98f61edd6f2f1c4f'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="WSI_MO_NUMBER" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSI_MO_NUMBER" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_MO_NUMBER" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" style="width:105px;"/><bu:uitn colNo="WSI_ACTIONTYPE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSI_ACTIONTYPE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ACTIONTYPE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" style="width:105px;"/><bu:uitn colNo="WSI_MODEL_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSI_MODEL_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_MODEL_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_PROCESS_FACE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_PROCESS_FACE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_PROCESS_FACE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_AREA_ID" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_AREA_ID" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_AREA_ID" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
			<!--
			<td class="name" /><bu:uitn colNo="WSI_WORKSTATION_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" />
		<bu:td cssClass="dec" colNo="WSI_WORKSTATION_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_WORKSTATION_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
			<input type="text" id="paraMapObj_WSI_WORKSTATION_SN" name="paraMapObj.WSI_WORKSTATION_SN" value="" maxlength="2" class="isSubmit input readonly _VAL_DATABASE" style=" width:200px;" null="" disabled="disabled">
			</td>
		-->	
		<td class="name" /><bu:uitn colNo="WSI_WORKSTATION_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<td colno="WSI_WORKSTATION_SN" class="dec" style="width:200px;">			
			<input type="text" id="paraMapObj_WSI_WORKSTATION_SN" name="paraMapObj.WSI_WORKSTATION_SN" value="0" maxlength="2" class="isSubmit input readonly _VAL_DATABASE" style=" width:200px;" null="" disabled="disabled">
        </td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_ONLINE_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ONLINE_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ONLINE_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1"  /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ITEM_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ITEM_CODE" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_LOT_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOT_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_LOT_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_COUNT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_COUNT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ITEM_COUNT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_POINT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_POINT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_POINT" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_POINT_NUM" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_POINT_NUM" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_POINT_NUM" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1"  style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_SUPPLIERS" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_SUPPLIERS" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_SUPPLIERS" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_SN_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ITEM_SN_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_ITEM_CODE_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_ITEM_CODE_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_LOT_NO_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOT_NO_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_LOT_NO_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_COUNT_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_COUNT_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_COUNT_OLD" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_DEVICE_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_DEVICE_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_DEVICE_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_DEVICE_SEQ" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_DEVICE_SEQ" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_DEVICE_SEQ" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_SKIP_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_SKIP_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_SKIP_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_TABLE_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_TABLE_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_TABLE_NO" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_LOADPOINT_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOADPOINT_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" >
			<bu:ui colNo="WSI_LOADPOINT_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" />
			
			</bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_FEEDER_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_FEEDER_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_FEEDER_SN" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_CHANEL" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_CHANEL" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_CHANEL" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_TRAY_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_TRAY_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_TRAY_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1"  /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_REPEAT_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_REPEAT_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" ><bu:ui colNo="WSI_REPEAT_FLAG" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSI_LOADTIME" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_LOADTIME" formId="0901df423f9c4e0e98f61edd6f2f1c4f"  ><bu:ui colNo="WSI_LOADTIME" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WSI_EMP_NAME" formId="0901df423f9c4e0e98f61edd6f2f1c4f" /></td>
			<bu:td cssClass="dec" colNo="WSI_EMP_NAME" formId="0901df423f9c4e0e98f61edd6f2f1c4f"  colspan="4"><bu:ui colNo="WSI_EMP_NAME" formId="0901df423f9c4e0e98f61edd6f2f1c4f" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="0901df423f9c4e0e98f61edd6f2f1c4f" formIndex="1" />
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
    getInfo();
})
function getInfo(){
    var id="${dataId}";
    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=babe900987bd4fdbaa4aded7250f146a";
    	
    $.ajax({
        type:"post",
        dataType:"json",
        data: {
            "id" : id,
            "type" : "2"
        },
        url:loadItemUrl,
        success:function(data){
            if(null==data){
                return;
            }
           if(null != data.ajaxPage.dataList){
               
                 var rccList = eval(data.ajaxPage.dataList);
                 console.log(rccList);
                 $("#paraMapObj_WSI_MO_NUMBER_SHOW").val(rccList[0].WSI_MO_NUMBER);
                 $("#paraMapObj_WSI_ACTIONTYPE").val(rccList[0].ACTIONTYPE);
                 $("#paraMapObj_WSI_MODEL_CODE").val(rccList[0].WSI_MODEL_CODE);
                 $("#paraMapObj_WSI_PROCESS_FACE").val(rccList[0].VALUE);
                  $("#paraMapObj_WSI_AREA_ID").val(rccList[0].WSI_AREA_ID);
                 $("#paraMapObj_WSI_WORKSTATION_SN").val(rccList[0].AREA_NAME1);
                 
                 //	$("#paraMapObj_WSI_WORKSTATION_SN").trigger("chosen:updated");
                 		$("#paraMapObj_WSI_AREA_ID").trigger("chosen:updated");
                 
                 $("#paraMapObj_WSI_ONLINE_FLAG_1").val(rccList[0].WSI_ONLINE_FLAG);
                 $("#paraMapObj_WSI_ITEM_SN").val(rccList[0].WSI_ITEM_SN);
                 $("#paraMapObj_WSI_ITEM_CODE_SHOW").val(rccList[0].WSI_ITEM_CODE);
                 $("#paraMapObj_WSI_LOT_NO").val(rccList[0].WSI_LOT_NO);
                  $("#paraMapObj_WSI_ITEM_COUNT").val(rccList[0].WSI_ITEM_COUNT);
                 $("#paraMapObj_WSI_POINT").val(rccList[0].WSI_POINT);
                 
                 $("#paraMapObj_WSI_POINT_NUM").val(rccList[0].WSI_POINT_NUM);
                 $("#paraMapObj_WSI_SUPPLIERS").val(rccList[0].SUPPLIER_NAME);
                 $("#paraMapObj_WSI_ITEM_SN_OLD").val(rccList[0].WSI_ITEM_SN_OLD);
                 $("#paraMapObj_WSI_ITEM_CODE_OLD").val(rccList[0].WSI_ITEM_CODE_OLD);
                  $("#paraMapObj_WSI_LOT_NO_OLD").val(rccList[0].WSI_LOT_NO_OLD);
                 $("#paraMapObj_WSI_COUNT_OLD").val(rccList[0].WSI_COUNT_OLD);
                 
                  $("#paraMapObj_WSI_DEVICE_SN").val(rccList[0].WSI_DEVICE_SN);
                 $("#paraMapObj_WSI_DEVICE_SEQ").val(rccList[0].WSI_DEVICE_SEQ);
                 $("#paraMapObj_WSI_TRUCK_NO").val(rccList[0].WSI_TRUCK_NO);
                 $("#paraMapObj_WSI_TABLE_NO").val(rccList[0].WSI_TABLE_NO);
                  $("#paraMapObj_WSI_LOADPOINT_SN").val(rccList[0].WSI_LOADPOINT_SN);
                 $("#paraMapObj_WSI_FEEDER_SN").val(rccList[0].WSI_FEEDER_SN);
                 
                 $("#paraMapObj_WSI_CHANEL_NO").val(rccList[0].WSI_CHANEL_NO);
                 $("#paraMapObj_WSI_TRAY_FLAG_1").val(rccList[0].WSI_TRAY_FLAG);
                 $("#paraMapObj_WSI_REPEAT_FLAG_1").val(rccList[0].WSI_REPEAT_FLAG);
                 $("#paraMapObj_WSI_EMP_NAME").val(rccList[0].NAME);
                  $("#paraMapObj_WSI_LOADTIME").val(rccList[0].LOADTIME);
                 
                 
           }
        },
        error:function(msg){
            util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
    })
    
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
