<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
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
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:400px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cc45a8ab4c87407090593be875962853" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cc45a8ab4c87407090593be875962853" />
	<input type="hidden" name="cc45a8ab4c87407090593be875962853" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CPI_ADDRESS" name="paraMap1@0#CPI_ADDRESS" value="program">
		<s:set name="_$viewId" value="'d1326901f7a54d7f867a922b018f330d'" />
		<s:set name="_$formId_1" value="'cc45a8ab4c87407090593be875962853'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_SN}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_NAME}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_PRODUCT_STEP}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_PROCESS_FACE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_GROUP}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_MODEL_CODE}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853"  ><bu:ui colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_MODEL_NAME}" formIndex="1" /></bu:td>

			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853"  colspan="4"><bu:ui colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_MODEL_SPEC}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_VERSION}" formIndex="1" /></bu:td>

		</tr>
		<tr>
		
			<td class="name" /><bu:uitn colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec" colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" ><bu:ui style="width:200px;" colNo="CPI_SYS_NAME" name="upFile"  formId="cc45a8ab4c87407090593be875962853" value="%{CPI_SYS_NAME}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853"  style="height:80px;" colspan="3"><bu:ui colNo="CPI_MEMO" style="width: 93%;height: 100%;" formId="cc45a8ab4c87407090593be875962853" value="%{CPI_MEMO}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="cc45a8ab4c87407090593be875962853" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="d1326901f7a54d7f867a922b018f330d" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
var fileMap = new Map();
$(function(){
    $("#paraMap1_CPI_GROUP").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select");
	$("#paraMap1_CPI_SYS_NAME").live("change", function () {
		getFileName();
	})
})
function getFileName(){
	var fp = $("#paraMap1_CPI_SYS_NAME");
	var lg = fp[0].files.length; // get length
    	var items = fp[0].files;
    	if (lg > 0) {
        for (var i = 0; i < lg; i++) {
            var fileName = items[i].name; // get file name
            $("#paraMap1_CPI_NAME").val(fileName.substring(0,fileName.lastIndexOf(".")));
        }
        }
}
function addCal(){
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
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        
                      
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=7c0f06e902974ab9bb824275fbcf53a3";
                        document.forms.addForm.submit();
                        isQuery = true;
}
</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
