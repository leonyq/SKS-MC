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
            <div class="hd" >
            	
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
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:458px">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d6969731daf649c0acf934e37c0a4f1f" type="add" />
	<table class="basic-table" >
	
	<input type="hidden" name="formIds" value="d6969731daf649c0acf934e37c0a4f1f" />
	<input type="hidden" name="d6969731daf649c0acf934e37c0a4f1f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'fa0709e066a54732ac526f57a9cda137'" />
		<s:set name="_$formId_1" value="'d6969731daf649c0acf934e37c0a4f1f'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width: 94px;"/><span class="dot">*</span><bu:uitn colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 250px;" colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_ITEM_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 94px;"/><bu:uitn colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_ITEM_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_ITEM_SPEC}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_SUP_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_START_TIME}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_END_TIME}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_VALID_FLAG}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>	
			<td class="name" /><bu:uitn colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_FILE_NAME" name="upFile" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_FILE_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_REASON" style="height:80px;width:584px;" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_APPLY_REASON}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_BASIS" style="height:80px;width:584px;" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_APPLY_BASIS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_REVIEW_OPINION" style="height:80px;width:584px;" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_REVIEW_OPINION}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d6969731daf649c0acf934e37c0a4f1f" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="fa0709e066a54732ac526f57a9cda137" />
	<bu:script viewId="fa0709e066a54732ac526f57a9cda137" />
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    function saveInfo(){
            if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        var startTime=new Date(Date.parse($("#paraMap1_QEI_START_TIME").val().replace(/-/g,"/"))).getTime();
                        var endTime=new Date(Date.parse($("#paraMap1_QEI_END_TIME").val().replace(/-/g,"/"))).getTime();
                        
                        if(startTime>endTime){
                          	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="起始时间不能大于结束时间" />",0,"260","");
                          return;
                        }
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=c82ba7dee19e4ed8a6079df2277b5d55";
       
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
