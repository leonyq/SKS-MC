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
			        <button type="button" onclick="adds();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:250px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b6074af91db439aa8e73c486b484970" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b6074af91db439aa8e73c486b484970" />
	<input type="hidden" name="9b6074af91db439aa8e73c486b484970" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c98cbde05cf746e886f9c0839fe62391'" />
		<s:set name="_$formId_1" value="'9b6074af91db439aa8e73c486b484970'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STEP_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_STEP_CODE}" formIndex="1" /></bu:td>
	
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_NAME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_ITEM_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_AREA_SN" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_AREA_SN}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_SPEC" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:105px;"/><span class="dot">*</span><bu:uitn colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_MODEL_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_MODEL_CODE}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STANDARD_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_STANDARD_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_PROCESS_FACE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_PROCESS_FACE}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:150px;"/><span class="dot">*</span><bu:uitn colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CHANGE_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_CHANGE_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><!--<span class="dot">*</span>--><bu:uitn colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CT_ID" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_CT_ID}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_SCHEDULE_FLAG"  formId="9b6074af91db439aa8e73c486b484970" value="%{CST_SCHEDULE_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="CST_TRACK" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_TRACK" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_TRACK" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" value="%{CST_TRACK}" formIndex="1" /></bu:td>
	
		</tr>
	</table>
			<bu:jsVal formId="9b6074af91db439aa8e73c486b484970" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
document.getElementById("paraMap1_CST_SCHEDULE_FLAG_1").checked=true;
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$('#paraMap1_CST_STANDARD_TIME').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CST_STANDARD_TIME");
             if(!/^[0-9]+([.]{1}[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               ///^[0-9]+([.]{1}[0-9]{0,2})?$/
               //^[0-9]+([.]{1}[0-9]+){0,1}$
             	_alertValMsg($('#paraMap1_CST_STANDARD_TIME'),"<dict:lang value="请输入正数或小数不超过两位" />");
             }
         });
         function adds(){
		 
			isQuery = false;
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
           
            if($("#paraMap1_CST_STANDARD_TIME").val()==0){
                $("#paraMap1_CST_STANDARD_TIME").val("");
                _alertValMsg($('#paraMap1_CST_STANDARD_TIME'),"<dict:lang value="请输入正数或小数不超过两位" />");
                return ;
            }
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=9d1f22ba844d4f58b170fe755394ec3f";
            document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
		}
			
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
