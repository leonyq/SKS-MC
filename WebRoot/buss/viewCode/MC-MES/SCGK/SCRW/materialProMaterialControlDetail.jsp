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
</head>
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="99c3f63c8b62498589698545e9de3b18" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99c3f63c8b62498589698545e9de3b18" />
	<input type="hidden" name="99c3f63c8b62498589698545e9de3b18" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'219ea5a833944f29a688faf20943c425'" />
		<s:set name="_$formId_1" value="'99c3f63c8b62498589698545e9de3b18'" />
		<s:set name="_$type" value="'detail'"/>
		
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:70px;"/><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_MODEL_NAME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  colNo="CTI_MODEL_NAME" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_NAME"  readonly="readonly" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			
		
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_MODEL_SPET" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<!--<td class="dec"><input type="text" class=" input isSubmit " id="MODEL_GUIGE" name="MODEL_GUIGE" readonly="readonly"/></td>-->
			<bu:td cssClass="dec"  colNo="CTI_MODEL_SPET" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_SPET"  readonly="readonly" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			</tr>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" id="paraMapObj_CTI_ITEM_CODE" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		
			<td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_NAME" name="ITEM_NAME" readonly="readonly"/></td>
			<td class="name" ><dict:lang value="物料规格" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_GUIGE" name="ITEM_GUIGE" readonly="readonly"/></td>
			
			<td class="dec" style="display:none;"><bu:ui colNo="CTI_ITEM_NAME" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></td>
			
			<td class="dec" style="display:none;"><bu:ui colNo="CTI_ITEM_SPEC" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></td>
			
		</tr>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18"  colspan="3"><bu:ui colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" style="height:80px;width:100%;" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr style="display: none">
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="99c3f63c8b62498589698545e9de3b18" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
        $("#ITEM_NAME").val($("#paraMapObj_CTI_ITEM_NAME").val());
	    $("#ITEM_GUIGE").val($("#paraMapObj_CTI_ITEM_SPEC").val());
       function getGroup(){
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?funcMId=05d38fe1985b41108e4953c4d112a647",
     		    data:{
     		       'routeStep':$("#paraMapObj_CTI_PRODUCT_STEP").val(),
     		       'flag':'getGroup'
     		    },
     			success: function(data){
     					$("#paraMapObj_CTI_GROUP").empty();
     					if(data.ajaxList != null && data.ajaxList != ""){
     						for ( var i = 0; i < data.ajaxList.length; i++) {
     							$("#paraMapObj_CTI_GROUP").append("<option value='"+data.ajaxList[i].GROUP_CODE+"' >"+data.ajaxList[i].GROUP_NAME+"</option>");			
     					}
     					$("#paraMapObj_CTI_GROUP").trigger("chosen:updated");
						}
     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					utilsFp.alert("error:"+msg);
     				}
     			  }
     			});		
        }
        
      function editHuixian(){
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?funcMId=7242147fdce040e8b6722b66e1f0c6ca",
     		    data:{
     		       'ctiItemCode':$("#paraMapObj_CTI_ITEM_CODE").val(),
     		       'ctiModelCode':$("#paraMapObj_CTI_MODEL_CODE").val(),
     		       'flag':'editHuixian',
     		       'assisItem':$("#paraMapObj_CTI_ITEM_TYPE").val()
     		    },
     			success: function(data){
     					if(data.ajaxList != null && data.ajaxList != ""){//data.ajaxList
     						$("#paraMapObj_MODEL_NAME").val(data.ajaxList[0].CI_ITEM_NAME);
     						$("#MODEL_GUIGE").val(data.ajaxList[0].CI_ITEM_SPEC);
						}
     					if(data.dataList != null && data.dataList != ""){
     						$("#ITEM_NAME").val(data.dataList[0].CI_ITEM_NAME);
     						$("#ITEM_GUIGE").val(data.dataList[0].CI_ITEM_SPEC);
						}

     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					utilsFp.alert("error:"+msg);
     				}
     			  }
     			});		
        }
	
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff');
				
			});
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
	
	var str = "";
window.onload = function(){
      
	//str = "<dict:lang value="请输入管控物料" /> | ";
	//document.getElementById("ctiAssisCode").style.display = "none";
	//getGroup();
	//editHuixian();
	//$("#paraMapObj_CTI_ASSY_MESSAGE").val(str);
	//alert($("#paraMapObj_CTI_ITEM_CODE").val()+"---"+$("#paraMapObj.CTI_MODEL_CODE").val()+"---"+$("#paraMapObj.CTI_ITEM_TYPE").val() + "11111111111");
};

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>