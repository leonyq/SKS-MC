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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                
                <div style="margin-left:10px;">
                <s:if test="${isDataAuth == '1'}">
                		<dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
                
			    	<div class="optn">
			    	        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 514px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
						   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec9ecb539af6461e98b5ccd5ec9b17ad" />
	<input type="hidden" name="ec9ecb539af6461e98b5ccd5ec9b17ad" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0a3d5122446f479c8d2d892298a51d84'" />
		<s:set name="_$formId_1" value="'ec9ecb539af6461e98b5ccd5ec9b17ad'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MO_NUMBER" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		

			<td class="name-six" /><bu:uitn colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_AREA_SN" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			<!--<td class="name-six" />品名</td>
			<bu:td cssClass="dec-self" colNo="" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><input type="text" id="" name="" class=" input isSubmit " disabled="disabled"></bu:td>-->
		</tr>
		<tr>
			
		<td class="name-six" /><bu:uitn colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_CODE" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>


			<td class="name-six" /><bu:uitn colNo="QWL_MODEL_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_NAME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_NAME" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>			
			<!--<td class="name-six" />规格</td>
			<bu:td cssClass="dec-self" colNo="" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><input type="text" id="" name="" class=" input isSubmit " disabled="disabled"></bu:td>-->
		</tr>
		<tr>
			
					<td class="name-six" /><bu:uitn colNo="QWL_MODEL_SPEC" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_SPEC" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_SPEC" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_TIME" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colspan="4" colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CONTENT" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;width:556px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSER" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSE_TIME" disabled="disabled" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colspan="4" colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;width:556px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colspan="4" colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;width:556px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colspan="4" colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" dataId="${dataId}" formIndex="1" style="height:80px;width:556px;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="ec9ecb539af6461e98b5ccd5ec9b17ad" formIndex="1" />
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
        <bu:submit viewId="0a3d5122446f479c8d2d892298a51d84" />
	<bu:script viewId="0a3d5122446f479c8d2d892298a51d84" />
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		
		
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
			$("#paraMapObj_QWL_CLOSER").val('${dataMap.curUser}');
		        $("#paraMapObj_QWL_CLOSE_TIME").val('${dataMap.nowDate}');
			
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
function saveInfo(){
        //alert();
        $("#paraMapObj_QWL_CLOSER").attr("disabled",false);
        $("#paraMapObj_QWL_CLOSE_TIME").attr("disabled",false);
        $DisInput = $(":input[disabled='disabled'][class*='iseditSubmit']");
	$DisInput.attr("disabled", false); 
        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
	     $("#addForm").append($("#isCloseWin").clone());
	     $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
	}
	$("#saveBtn").prop("disabled","disabled");
                   
        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=28b9960c76334b51a3f666fc5eceeda6";
       
        document.forms.editForm.submit();
	isQuery = true;
	$DisInput.attr("disabled", true);
}
</script>

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