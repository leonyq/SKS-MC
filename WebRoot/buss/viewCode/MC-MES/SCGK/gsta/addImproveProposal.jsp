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
			<div class="bd" style="    height: 434px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ff8f5a5bddcf4021aa945e5a217e6552" type="add" />
	<table class="basic-table" >
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="ff8f5a5bddcf4021aa945e5a217e6552" />
	<input type="hidden" name="ff8f5a5bddcf4021aa945e5a217e6552" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4bae73b862fb41da8230226ec5002f79'" />
		<s:set name="_$formId_1" value="'ff8f5a5bddcf4021aa945e5a217e6552'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_SN" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_SN}" formIndex="1" /></bu:td>
	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_NAME" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_NAME}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CIP_DEPT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_DEPT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_EMP}" formIndex="1" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_BAD_TYPE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_BAD_TYPE}" formIndex="1" /></bu:td>
		</tr>	
        <tr>
			<td class="name" /><bu:uitn colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_CURRENT_METHODS" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" value="%{CIP_CURRENT_METHODS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" value="%{CIP_BAD_REASON}" formIndex="1" /></bu:td>
		</tr>
	    <tr>
			<td class="name" /><bu:uitn colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" value="%{CIP_IMPROVE_METHODS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" value="%{CIP_EXCEPT_RESULT}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="ff8f5a5bddcf4021aa945e5a217e6552" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
    $("#paraMap1_CIP_EMP").val($("#curUser").val());
})
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
                        
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=1f921bc1fdba4b509629a8bd7a104418";
                        document.forms.addForm.submit();
                        
}
</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
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
