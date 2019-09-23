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
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" onclick="saveRevoke();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:585px">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d6969731daf649c0acf934e37c0a4f1f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d6969731daf649c0acf934e37c0a4f1f" />
	<input type="hidden" name="d6969731daf649c0acf934e37c0a4f1f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'614c484c43f941bbb1242203c7f4dee2'" />
		<s:set name="_$formId_1" value="'d6969731daf649c0acf934e37c0a4f1f'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width: 89px;"/><span class="dot">*</span><bu:uitn colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 250px;" colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_CODE" disabled="disabled"  formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><bu:uitn colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_NAME" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_SPEC" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_SUP_CODE" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_START_TIME" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_END_TIME" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_VALID_FLAG" disabled="disabled" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_VALID_FLAG}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>	
			<td class="name" /><bu:uitn colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_FILE_NAME" disabled="disabled" name="upFile" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_REASON" disabled="disabled" style="height:80px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_BASIS" disabled="disabled" style="height:80px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_REVIEW_OPINION" disabled="disabled" style="height:80px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_CANCEL_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_CANCEL_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_CANCEL_REASON"  style="height:80px;width:100%" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d6969731daf649c0acf934e37c0a4f1f" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="614c484c43f941bbb1242203c7f4dee2" />
	<bu:script viewId="614c484c43f941bbb1242203c7f4dee2" />
<script type="text/javascript">
$(function(){
	$("input[name='upFile']:hidden").val("");
	$("#paraMapObj_QEI_ITEM_CODE_SHOW").attr("class","input _VAL_NULL isSubmit input readonly ico-search-input");
	$("#paraMapObj_QEI_SUP_CODE_SHOW").attr("class","input _VAL_NULL isSubmit input readonly ico-search-input");
	$("#paraMapObj_QEI_START_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
	$("#paraMapObj_QEI_END_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
	$("#paraMapObj_QEI_FILE_NAME_a").attr("style","display:none;");
	$("#paraMapObj_QEI_APPLY_REASON").attr("class","isSubmit readonly  _VAL_DATABASE");
	$("#paraMapObj_QEI_APPLY_BASIS").attr("class","isSubmit readonly  _VAL_DATABASE");
	$("#paraMapObj_QEI_REVIEW_OPINION").attr("class","isSubmit readonly  _VAL_DATABASE");
})
function saveRevoke(){

            if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
                        
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=651cc1913adb45ba8bef3bc32444a3d6";
       
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
