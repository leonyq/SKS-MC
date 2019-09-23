<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<style type="text/css">
.input {
	width:200px !important;
}
</style>
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
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:578px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="46a2000d9dd641acab47c18beb57b9d0" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="异常单信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="46a2000d9dd641acab47c18beb57b9d0" />
	<input type="hidden" name="46a2000d9dd641acab47c18beb57b9d0" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'063a4055d085470c9c63cbc27d8208e0'" />
		<s:set name="_$formId_1" value="'46a2000d9dd641acab47c18beb57b9d0'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width:54px;"/><bu:uitn colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:80px;" /><bu:uitn colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MO_NUMBER" style="width:200px;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name"  style="width:70px;" /><bu:uitn colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui  style="width:200px;" colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>

			<td class="name" /><bu:uitn colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_ERROR_DESC" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" /><bu:uitn colNo="CPF_HANDLE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CPF_HANDLE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CPF_HANDLE_EMP"  formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>-->
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" /><bu:uitn colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="异常分析" /></h3>	
    </div>
        <table class="basic-table" >
        	
        	<tr>
			<td class="name" style="width:54px;"/><bu:uitn colNo="CQI_ERROR_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_ERROR_CAUSE" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_OUTFLOW_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_OUTFLOW_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_OUTFLOW_CAUSE" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
        
        
 </div>
			<bu:jsVal formId="46a2000d9dd641acab47c18beb57b9d0" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="063a4055d085470c9c63cbc27d8208e0" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
	
	$(function(){
		$("#paraMapObj_CQI_ERROR_DESC").attr("class","isSubmit readonly");
		$("#paraMapObj_CQI_CREATE_EMP_SHOW").attr("class","isSubmit input readonly");
		$("#paraMapObj_CQI_CREATE_EMP_SHOW").removeAttr("style");
	})
	
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
			
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=420b502880a44cf7aa0224f78cf0ea20";
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
