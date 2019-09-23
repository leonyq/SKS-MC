<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
	<script type = "text/javascript">
	 function clearTech(){
	 $("#paraMapObj_PM_TECH_SN").val("");
	 $("#paraMapObj_PM_TECH_SN_SHOW").val("");
	 $("#paraMapObj_PM_START_GROUP").val("");
	 $("#paraMapObj_PM_END_GROUP").val("");
	 }	
	</script>
   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>   
</head>
<body>
	<div class="edit">
						<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>

			    	<div class="optn">
			    	        <button type="button" onclick="edit11(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 450px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					                  </jsp:include>

										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b18994844b049f2ad90204b77793334" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b18994844b049f2ad90204b77793334" />
	<input type="hidden" name="9b18994844b049f2ad90204b77793334" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'69fe2024e89444a8a67ed6e64203e245'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
			<td class="name" style="width:84px"/><bu:uitn colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_AREA_SN" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}"  style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" onchange="clearTech();"  cssClass="input isSubmit isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PCB_CODE"  formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
		    	<td class="name" /><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MODEL_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		    
			<td class="name" /><bu:uitn colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	                <td class="name" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TRANSFER_RULE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		
		</tr>

		<tr>
		   <td class="name"><bu:uitn colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" /></td>
		<td class="dec" colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334"><bu:ui colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}"  formIndex="1"/></td>	
			<td class="name" /><bu:uitn colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>		

             <td class="name" /><bu:uitn colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>	
		</tr>
		<tr>
		       
		        <td class="name" /><bu:uitn colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CUST_CODE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>				
	      
	
		</tr>
		
		
		<tr>
		
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" colspan="5"><bu:ui colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:100%;height:80px;"  formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="9b18994844b049f2ad90204b77793334" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 var kes=$("#paraMapObj_PM_TECH_SN").val();
				 queryRoute(kes);
			});
		var isQuery = false;
		function edit11(thisObj){
		//	if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			$DisInput = $(":input[disabled='disabled'][class*='isSubmit']");
			$DisInput.attr("disabled", false);
			
			var PM_PRODUCT_STEP=$("#paraMapObj_PM_PRODUCT_STEP").val();
			
			document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=adad011c719044abab4f07b7217c3ec2&type=edit&PM_PRODUCT_STEP="+PM_PRODUCT_STEP;
			document.forms.editForm.submit();
			isQuery = true;
		//	$DisInput.attr("disabled", true);
		}
	
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$(".dept_select").trigger("chosen:updated");
		}
		
	function fqcChange(obj){
	  if(obj.checked==false){
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input input isSubmit  readonly isaddSubmit");
	     $("#paraMapObj_PM_FQC_NUM").attr("disabled","disabled");
	     $("#paraMapObj_PM_FQC_NUM").val(0);
	  }
	  else{
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input");
	     $("#paraMapObj_PM_FQC_NUM").removeAttr("disabled");
	  }
	}
				
		var blockIcon;
        var blackConn;
        var paraMapModel = "view";		
		var routeUrl="buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=9b18994844b049f2ad90204b77793334";
		function queryRoute(key){
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl,
 	    	data:{
 	    	    "ctId":key
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;
 				$("#paraMapObj.PM_START_GROUP").val('');
 				$("#paraMapObj_PM_END_GROUP").val('');
 			//	$("#paraMapObj_PM_TECH_SN").val('');
 				if(pList!=null&&pList.length>0){
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
 				  	$("#paraMapObj_PM_TECH_SN_SHOW").val(pList[0].CT_NAME);
 				  	console.log(pList[0].CT_NAME);
 				  blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
        		  blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  //initJsPlumb();
 				} 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 		   }
 		});
	}
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
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

</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>