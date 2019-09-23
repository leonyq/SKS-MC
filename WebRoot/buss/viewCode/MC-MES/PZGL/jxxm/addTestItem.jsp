<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_10" />
		<jsp:param name="location" value="inHead" />
	</jsp:include>
	<!-- head里面 -->
</head>

<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
		<div class="hd">

			<!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			<div style="margin-left:10px;">
				<div class="save-close" <dict:lang value="关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;" />
			<s:if test="${isDataAuth == '1'}">
				<span class="dot">*</span>
				<dict:lang value="组织机构" />
				<s:if test="${fn:length(deptLs)==1}">
					<s:select list="deptLs" listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
				</s:if>
				<s:else>
					<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
				</s:else>
			</s:if>
		</div>
		<div class="optn">
			<button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>

	</div>
	<div class="bd" style="height:400px">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_10" />
			<jsp:param name="location" value="addForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" type="add" />
		<table class="basic-table">
			<input type="hidden" name="formIds" value="737e3d7aac9c49c2ace9d8c0b212a2f5" />
			<input type="hidden" name="737e3d7aac9c49c2ace9d8c0b212a2f5" value="paraMap1@" />
			<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
			<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
			<s:set name="_$viewId" value="'71e7d18700d940f88d70b673753a1e36'" />
			<s:set name="_$formId_1" value="'737e3d7aac9c49c2ace9d8c0b212a2f5'" />
			<s:set name="_$type" value="'add'" />
			<tr>
				<td class="name" style="width: 75px;"/><span class="dot">*</span>
				<bu:uitn colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" style="width: 230px;" colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_TEST_STEP" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_TEST_STEP}" formIndex="1" /></bu:td>
			
				<td class="name" style="width: 80px;"/><span class="dot">*</span>
				<bu:uitn colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" style="width: 230px;" colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_SN" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_SN}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_NAME" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_NAME}" formIndex="1" /></bu:td>
			
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_TYPE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_TYPE}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_CLASS" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_CLASS}" formIndex="1" /></bu:td>
			
				<td class="name" />
				<bu:uitn colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_MAXVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_MAXVALUE}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" />
				<bu:uitn colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_MINVALUE" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_MINVALUE}" formIndex="1" /></bu:td>
			
				<td class="name" />
				<bu:uitn colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_ITEM_UNIT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_ITEM_UNIT}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" />
				<bu:uitn colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_TEST_METHOD" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_TEST_METHOD}" formIndex="1" /></bu:td>
			
				<td class="name" />
				<bu:uitn colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_TEST_SEQ" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_TEST_SEQ}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" />
				<bu:uitn colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5">
					<bu:ui colNo="QTI_DEFAULT_FLAG" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_DEFAULT_FLAG}" formIndex="1" onclick="defClick();"/></bu:td>
				
			</tr>
			<tr>
				<td class="name-three" />
				<bu:uitn colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" />
				</td>
				<bu:td cssClass="dec" colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5"  colspan="3">
					<bu:ui colNo="QTI_TEST_CONTENT" formId="737e3d7aac9c49c2ace9d8c0b212a2f5" value="%{QTI_TEST_CONTENT}" formIndex="1" style="height:80px;width:99.5%;" /></bu:td>
			</tr>
		</table>
		<bu:jsVal formId="737e3d7aac9c49c2ace9d8c0b212a2f5" formIndex="1" />

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
	<bu:submit viewId="71e7d18700d940f88d70b673753a1e36" />
	<bu:script viewId="71e7d18700d940f88d70b673753a1e36" />
<script type="text/javascript">
        $("#paraMap1_QTI_DEFAULT_FLAG_1").val("N");
	function defClick(){
		var defVal=$("#paraMap1_QTI_DEFAULT_FLAG_1").val();
		
		if(defVal=="N"){
		        //alert($("#paraMap1_QTI_DEFAULT_FLAG_1").val());
			$("#paraMap1_QTI_DEFAULT_FLAG_1").val("Y");
		}else{
		        //alert($("#paraMap1_QTI_DEFAULT_FLAG_1").val());
			$("#paraMap1_QTI_DEFAULT_FLAG_1").val("N");
		}
	}
	$("#paraMap1_QTI_ITEM_MAXVALUE").val("");
	$("#paraMap1_QTI_ITEM_MINVALUE").val("");
	$("#paraMap1_QTI_TEST_SEQ").val("0");
	$("#paraMap1_QTI_ITEM_CLASS").change(function(){
	        var add_type=$(this).val();
		if(add_type==2){
			
			$("#paraMap1_QTI_ITEM_MAXVALUE").attr("disabled","true");
			$("#paraMap1_QTI_ITEM_MINVALUE").attr("disabled","true");
			$("#paraMap1_QTI_ITEM_MAXVALUE").val("");
			$("#paraMap1_QTI_ITEM_MINVALUE").val("");
			
		}else if(add_type==1){
			$("#paraMap1_QTI_ITEM_MAXVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MINVALUE").attr("disabled","true");
			$("#paraMap1_QTI_ITEM_MAXVALUE").val("0");
			$("#paraMap1_QTI_ITEM_MINVALUE").val("");
		}else if(add_type==0){
		
		if($.trim(add_type)==""){
		
			$("#paraMap1_QTI_ITEM_MAXVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MINVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MAXVALUE").val("");
			$("#paraMap1_QTI_ITEM_MINVALUE").val("");
		}else{
			$("#paraMap1_QTI_ITEM_MAXVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MINVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MAXVALUE").val("0");
			$("#paraMap1_QTI_ITEM_MINVALUE").val("0");}
		}else if($.trim(add_type)==""){
		
			$("#paraMap1_QTI_ITEM_MAXVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MINVALUE").attr("disabled",false);
			$("#paraMap1_QTI_ITEM_MAXVALUE").val("");
			$("#paraMap1_QTI_ITEM_MINVALUE").val("");
		}
	});
	$('#paraMap1_QTI_ITEM_MAXVALUE').bind('keyup', function () {
	 var calwStart=$("#paraMap1_QTI_ITEM_MAXVALUE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_QTI_ITEM_MAXVALUE'),"<dict:lang value="该项只能为数字" />");
             }
         });
         $('#paraMap1_QTI_ITEM_MINVALUE').bind('keyup', function () {
	 var calwStart=$("#paraMap1_QTI_ITEM_MINVALUE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
                //$('#_alertValMsgDiv2').css('display','block');
             	_alertValMsg($('#paraMap1_QTI_ITEM_MINVALUE'),"<dict:lang value="该项只能为数字" />");
             }
         });
         function saveInfo(){
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
                        
                        var classVal=$("#paraMap1_QTI_ITEM_CLASS").val();

                        var maxVal=parseFloat($("#paraMap1_QTI_ITEM_MAXVALUE").val());
                        var minVal=parseFloat($("#paraMap1_QTI_ITEM_MINVALUE").val());

                        if(classVal==1){
                             if($.trim($("#paraMap1_QTI_ITEM_MAXVALUE").val())==""){
                                $("#paraMap1_QTI_ITEM_MAXVALUE").val("0");
                             }
                        }else if(classVal==0){
                             if($.trim(classVal)==""){
                                $("#paraMap1_QTI_ITEM_MAXVALUE").val("");
                                $("#paraMap1_QTI_ITEM_MINVALUE").val("");
                             }else{
                             if($.trim($("#paraMap1_QTI_ITEM_MAXVALUE").val())==""){
                                $("#paraMap1_QTI_ITEM_MAXVALUE").val("0");
                             }
                             if($.trim($("#paraMap1_QTI_ITEM_MINVALUE").val())==""){
                                $("#paraMap1_QTI_ITEM_MINVALUE").val("0");
                             }
                             maxVal=parseFloat($("#paraMap1_QTI_ITEM_MAXVALUE").val());
                             minVal=parseFloat($("#paraMap1_QTI_ITEM_MINVALUE").val());
                             if(maxVal<minVal){
                              
                                _alertValMsg($('#paraMap1_QTI_ITEM_MAXVALUE'),"<dict:lang value="上限值不能小于下限值" />");
                                return;
                             }  }
                        }
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                   
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=34fcec7b17474719acb184d065113dd6";
       
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