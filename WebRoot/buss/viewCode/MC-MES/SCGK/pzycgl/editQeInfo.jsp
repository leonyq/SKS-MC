<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
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
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm1();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:520px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="46a2000d9dd641acab47c18beb57b9d0" type="edit" />
	<table class="basic-table" id="myHid">
	<input type="hidden" name="formIds" value="46a2000d9dd641acab47c18beb57b9d0" />
	<input type="hidden" name="46a2000d9dd641acab47c18beb57b9d0" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'90fc7c9842594801ae16550b9300a7a6'" />
		<s:set name="_$formId_1" value="'46a2000d9dd641acab47c18beb57b9d0'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-four" style="width:75px;"/><bu:uitn colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" style="width:260px;" colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" style="width:80px;" /><span class="dot">*</span><bu:uitn colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four"/><bu:uitn colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CQI_FILE_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_FILE_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" colspan="3"><bu:ui colNo="CQI_FILE_NAME" name="upFile" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
	        </tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec-self" colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="3"><bu:ui colNo="CQI_ERROR_DESC" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="46a2000d9dd641acab47c18beb57b9d0" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="90fc7c9842594801ae16550b9300a7a6" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">

$(function(){
	$("input[name='paraMapObj.CQI_FILE_NAME@SHOW']:hidden").val("");
	$("input[name='upFile']:hidden").val("");
})

	function setHid(){
		$("#myHid").append("<input name='modelCode' type='hidden' value='"+$("#paraMapObj_CQI_MODEL_CODE").val()+"'>");
		$("#myHid").append("<input name='areaSn' type='hidden' value='"+$("#paraMapObj_CQI_AREA_SN").val()+"'>");
	     	$("#myHid").append("<input name='CQI_SUBMIT_NUM' type='hidden' value='"+$("#paraMapObj_CQI_SUBMIT_NUM").val()+"'>");
	     	$("#myHid").append("<input name='CQI_INSPECT_NUM' type='hidden' value='"+$("#paraMapObj_CQI_INSPECT_NUM").val()+"'>");
	     	$("#myHid").append("<input name='CQI_ERROR_NUM' type='hidden' value='"+$("#paraMapObj_CQI_ERROR_NUM").val()+"'>");
	}
	
	//重置    
        function resetForm1(){
                $("#editForm")[0].reset();
                $("#paraMapObj_CQI_AREA_SN").trigger("chosen:updated");
                $("#paraMapObj_CQI_ERROR_TYPE").trigger("chosen:updated");

        }
        
        function editCal(){
  
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
  setHid();
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=73050f9c6aed40d7a5d95dbb524d1976";
  document.forms.editForm.submit();
}

</script>
	<!-- js初始化方法 -->
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
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
