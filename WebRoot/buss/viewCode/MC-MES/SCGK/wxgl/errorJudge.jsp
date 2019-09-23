<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type="text/javascript">
		var addTableTrMap;
	</script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" 
										target="submitFrame">
            <div class="hd">
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
			        <button type="button" id="saveBtn" onclick="saveObj();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">

					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6587fb2a1c54437cb98b5146ebf8cfbc" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
<div class="mod-hd" style="height:180px;border:none;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6587fb2a1c54437cb98b5146ebf8cfbc" />
	<input type="hidden" name="6587fb2a1c54437cb98b5146ebf8cfbc" value="paraMap1@" />
	<input type="hidden" name="paraMap1@0#WE_ID" value="${dataMap.ID}" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b3999aad54704d29a43bf3e15493cd25'" />
		<s:set name="_$formId_1" value="'6587fb2a1c54437cb98b5146ebf8cfbc'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:52px;"/><bu:uitn colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_SN}" formIndex="1" disabled="disabled"/></bu:td>
		
		    	<td class="name"  style="width:52px;"/><bu:uitn colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_MO_NUMBER}" formIndex="1" disabled="disabled"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_MODEL_CODE}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_PROCESS_FACE}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
		   	<td class="name" /><bu:uitn colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" >
			<input type="text" id="paraMap1_WE_ERROR_CODE" name="paraMap1@0#WE_ERROR_CODE" value="" class=" input isSubmit "  save_mark="0">
			</bu:td>
		
			<td class="name" /><bu:uitn colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_ERROR_DESC}" formIndex="1" disabled="disabled" /></bu:td>
		
		</tr>
		<tr>
		    	<td class="name" /><bu:uitn colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_POINT}" formIndex="1" disabled="disabled" /></bu:td>
		    	<td class="name" /><bu:uitn colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_TEST_GROUP}" formIndex="1" disabled="disabled" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_TEST_EMP}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<bu:td cssClass="dec" colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" ><bu:ui colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" value="%{WE_TEST_TIME}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="6587fb2a1c54437cb98b5146ebf8cfbc" formIndex="1" />
</div>

<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="误判说明信息" /></h3>	
  </div>
<div class="mod-hd" style="height:125px;border:none;">
 <table class="basic-table" id="table2" name="table2">
		<tr>
			<td class="name"  style="width:52px;"/><bu:uitn colNo="SMI_MISJUDGE_TYPE" formId="9d2d60290a8942d6bd381694f15d0e7a" /></td>
			<bu:td cssClass="dec" colNo="SMI_MISJUDGE_TYPE" formId="9d2d60290a8942d6bd381694f15d0e7a" ><bu:ui colNo="SMI_MISJUDGE_TYPE"  formId="9d2d60290a8942d6bd381694f15d0e7a" value="%{SMI_MISJUDGE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="SMI_MISJUDGE_REASON" formId="9d2d60290a8942d6bd381694f15d0e7a" /></td>
			<bu:td cssClass="dec" colNo="SMI_MISJUDGE_REASON" formId="9d2d60290a8942d6bd381694f15d0e7a" ><bu:ui colNo="SMI_MISJUDGE_REASON" formId="9d2d60290a8942d6bd381694f15d0e7a" style="width:100%;" value="%{SMI_MISJUDGE_REASON}" rows="3" formIndex="1" /></bu:td>
		</tr>
		
		
	</table>
</div>
</div>
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
	function init(){
		$("#paraMap1_WE_SN").val('${dataMap.WE_SN}');
		$("#paraMap1_WE_MO_NUMBER").val('${dataMap.WE_MO_NUMBER}');
		$("#paraMap1_WE_MODEL_CODE").val('${dataMap.WE_MODEL_CODE}');
		$("#paraMap1_WE_PROCESS_FACE").val('${dataMap.WE_PROCESS_FACE}');
		//$("#paraMap1_WE_ERROR_CODE").val('${dataMap.WE_ERROR_CODE}');
		//console.log('${dataMap.WE_ERROR_CODE}');
		//console.log($("#paraMap1_WE_ERROR_CODE").val());
		$("#paraMap1_WE_ERROR_DESC").val('${dataMap.CEC_DESC}');
		$("#paraMap1_WE_POINT").val('${dataMap.WE_POINT}');
		$("#paraMap1_WE_TEST_GROUP").val('${dataMap.WE_TEST_GROUP}');
		$("#paraMap1_WE_TEST_EMP").val('${dataMap.NAME}');
		$("#paraMap1_WE_TEST_TIME").val('${dataMap.WE_TEST_TIME}');
		//$("#paraMap1_WE_ERROR_CODE").trigger("chosen:updated");
	
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		setDataAuthVal();
	//	console.log('${dataMap}');
	}//初始化方法
	$(function(){
	     $("#paraMap1_WE_ERROR_CODE option").each(function(){ //遍历全部option
        var txt = $(this).text(); //获取option的内容
             console.log(txt);			
     });
	   
	    $("#paraMap1_WE_ERROR_CODE").val('${dataMap.WE_ERROR_CODE}');
	//	$("#paraMap1_WE_ERROR_CODE").trigger("chosen:updated");
		$("#paraMap1_WE_ERROR_CODE").attr("disabled","disabled");
		//$("#paraMap1_WE_ERROR_CODE_chosen").find("span").text('${dataMap.WE_ERROR_CODE}');
		console.log("111111111111111111111");
		console.log('${dataMap.WE_ERROR_CODE}');
		console.log($("#paraMap1_WE_ERROR_CODE").val());
	})
		function setDataAuthVal(){
	var dataAuth = '${paraMap.dataAuth}';
	
	$("#deptLs_data_auth option").each(function(){
	 if($(this).val()==dataAuth){
	 $(this).attr("selected","selected");
	 }
	});
	}
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	function addParentData(msg,title,width,height,time){
	  msgPop(msg,'',title,width,height,time);
	  var piframeId='${param.piframeId}';
	  
	  var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
	  var weSn='${param.weSn}';

	  parentWindows.queryErrorList(weSn);
	  closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	function saveObj(){
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isSubmit']");
			$DisInput.attr("disabled", false); 
                         
			$("#saveBtn").prop("disabled","disabled");
                   
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=b5318a0875a4455a9cb3fd0703ecc5dc";
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
</script>
<bu:script viewId="b3999aad54704d29a43bf3e15493cd25" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>