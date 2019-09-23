<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
               
			    <div style="margin-left:10px;">
                <div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			        <button type="button" onclick="saveScrapInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="802134fcde97488a9c3dea5e9081c3fd" type="add" />
	<table class="basic-table" style="max-width:750px;">
	<input type="hidden" name="formIds" value="802134fcde97488a9c3dea5e9081c3fd" />
	<input type="hidden" name="802134fcde97488a9c3dea5e9081c3fd" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="ID" name="ID"/>	
	<input type="hidden" id="FS_SCR_CONFIRM" name="FS_SCR_CONFIRM"/>
	<input type="hidden" id="FS_SCR_CHECK" name="FS_SCR_CHECK"/>
	<input type="hidden" id="FS_SCR_REASON" name="FS_SCR_REASON"/>
		<s:set name="_$viewId" value="'6514cd76618f4bf2bcdd08d1cd4d3a6d'" />
		<s:set name="_$formId_1" value="'802134fcde97488a9c3dea5e9081c3fd'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:94px;"/><bu:uitn colNo="FS_FEEDER_SN" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" style="width:305px;"  colNo="FS_FEEDER_SN" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_SN"  formId="802134fcde97488a9c3dea5e9081c3fd" value="${dataMap.TCF_FEEDER_SN}" formIndex="1" style="width:300px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_FEEDER_TYPE" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" colNo="FS_FEEDER_TYPE" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_TYPE"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_FEEDER_TYPE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_FEEDER_SPEC" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" colNo="FS_FEEDER_SPEC" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_SPEC"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_FEEDER_SPEC}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_SCR_APPLAYER" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" colNo="FS_SCR_APPLAYER" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_APPLAYER"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_APPLAYER}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_CONFIRM}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot" >*</span><bu:uitn colNo="FS_SCR_CHECK" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" colNo="FS_SCR_CHECK" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_CHECK"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_CHECK}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot" >*</span><bu:uitn colNo="FS_SCR_REASON" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			
			<bu:td cssClass="dec" colNo="FS_SCR_REASON" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_REASON"   formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_REASON}" formIndex="1" style="width:300px;height:80px;"/></bu:td>
		
			
		</tr>
		
		<tr>
			
		
			<td class="name" style="display:none;" /><bu:uitn colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" style="display:none;" colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_DATE}" formIndex="1"  /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="802134fcde97488a9c3dea5e9081c3fd" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
 	<jsp:param name="location" value="jsLoading" />
</jsp:include>

<script type="text/javascript">
	
	function closeWinFun(){
		$("#isCloseWin").attr
		if($("#isCloseWin").attr("checked")) {
			$("#isCloseWinVal").val("1");
			//alert($("#isCloseWinVal").val());
		} else {
			$("#isCloseWinVal").val("0");
			//alert($("#isCloseWinVal").val());
		}
	}
	
	
	
	var state;
	$(function(){
	    state='${dataMap.status}'
	   $("#paraMap1_FS_FEEDER_SN").val('${dataMap.TCF_FEEDER_SN}');
	$("#paraMap1_FS_FEEDER_TYPE").val('${dataMap.typeName}');
	//alert("typeName:"+${dataMap.typeName});
	$("#paraMap1_FS_FEEDER_SPEC").val('${dataMap.TCS_SPEC}');
//	alert("TCS_SPEC:"+${dataMap.TCS_SPEC});
	$("#paraMap1_FS_SCR_APPLAYER").val('${dataMap.curUser}');
	$("#ID").val('${dataMap.ID}');
	
	
	
	$("#paraMap1_FS_SCR_CONFIRM_SHOW").val('${dataMap.FS_SCR_CONFIRM}');//
	$("#paraMap1_FS_SCR_CHECK_SHOW").val('${dataMap.FS_SCR_CHECK}');
	$("#paraMap1_FS_SCR_CONFIRM").val('${dataMap.FS_SCR_CONFIRM}');//
	$("#paraMap1_FS_SCR_CHECK").val('${dataMap.FS_SCR_CHECK}');
	
	
	$("#paraMap1_FS_SCR_REASON").val('${dataMap.FS_SCR_REASON}');
	
	$("#paraMap1_FS_FEEDER_SN").attr("readonly","readonly");
	$("#paraMap1_FS_FEEDER_TYPE").attr("disabled",true);
	$("#paraMap1_FS_FEEDER_SPEC").attr("disabled",true);
	$("#paraMap1_FS_SCR_APPLAYER").attr("readonly","readonly");
	    
	    if(state=="1"){
	    $("#paraMap1_FS_SCR_REASON").val("");
	    $("#paraMap1_FS_SCR_CHECK").val("");
	    $("#paraMap1_FS_SCR_CHECK_SHOW").val("");
	    }
	})
	
	function saveScrapInfo(){
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
        
        	   
        	

   $("#paraMap1_FS_FEEDER_TYPE").attr('disabled',false);
   $("#paraMap1_FS_FEEDER_SPEC").attr('disabled',false);		
			
	$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
	$DisInput.attr("disabled", false); 
        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
	     $("#addForm").append($("#isCloseWin").clone());
	     $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
	}
	$("#saveBtn").prop("disabled","disabled");
                   
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=fe7a038b277e49e7b007db91cdb95661"; 
        document.forms.addForm.submit();
	isQuery = true;
	$DisInput.attr("disabled", true);

}
</script>
<bu:submit viewId="6514cd76618f4bf2bcdd08d1cd4d3a6d" />
<bu:script viewId="6514cd76618f4bf2bcdd08d1cd4d3a6d" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>