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
	<div class="bd">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_10" />
			<jsp:param name="location" value="addForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="3196b9fb2750494a8e7ff527a46d32c1" type="add" />
		<table class="basic-table">
			<input type="hidden" name="formIds" value="3196b9fb2750494a8e7ff527a46d32c1" />
			<input type="hidden" name="3196b9fb2750494a8e7ff527a46d32c1" value="paraMap1@" />
			<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
			<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
			<s:set name="_$viewId" value="'91caaada5fd045f49f6bb3ac67cc60bb'" />
			<s:set name="_$formId_1" value="'3196b9fb2750494a8e7ff527a46d32c1'" />
			<s:set name="_$type" value="'add'" />
			<tr>
				<td class="name" style="width: 75px;"/><span class="dot">*</span>
				<bu:uitn colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" style="width: 230px;" colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_TEST_STEP" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_TEST_STEP}" formIndex="1" /></bu:td>
			
				<td class="name" style="width: 90px;"/><span class="dot">*</span>
				<bu:uitn colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" style="width: 230px;" colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_MODEL_CODE" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_MODEL_CODE}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" />
				<bu:uitn colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_MODEL_NAME" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_MODEL_NAME}" formIndex="1" /></bu:td>
			
				<td class="name" />
				<bu:uitn colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_MODEL_SPEC" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_MODEL_SPEC}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_SAMPLE_TYPE" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_SAMPLE_TYPE}" formIndex="1" /></bu:td>
				
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_ERROR_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_ERROR_GRADE}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_SAMPLE_PLAN" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_SAMPLE_PLAN}" formIndex="1" /></bu:td>
			
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_ALQ_VALUE" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_ALQ_VALUE}" formIndex="1" /></bu:td>
			</tr>
			<tr>
				
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_TEST_LEVEL" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_TEST_LEVEL}" formIndex="1" /></bu:td>
					
				<td class="name" /><span class="dot">*</span>
				<bu:uitn colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_TEST_GRADE" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_TEST_GRADE}" formIndex="1" /></bu:td>
			
			</tr>
			<tr>
			        <td style="width: 75px;text-align: right;">
					<bu:uitn colNo="QMS_DEFAULT_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" />
			        </td>
				<td>&nbsp;
					<bu:ui colNo="QMS_DEFAULT_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_DEFAULT_FLAG}" formIndex="1" />
					&#x3000;
					<bu:uitn colNo="QMS_FULL_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" />
					<bu:ui colNo="QMS_FULL_FLAG" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_FULL_FLAG}" formIndex="1" />
				</td>	
				
					
				<td class="name" />
				<bu:uitn colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1" />
				</td>
				<bu:td cssClass="dec" colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1">
					<bu:ui colNo="QMS_THRESHOLD" formId="3196b9fb2750494a8e7ff527a46d32c1" value="%{QMS_THRESHOLD}" formIndex="1" /></bu:td>
			</tr>
				
		</table>
		<bu:jsVal formId="3196b9fb2750494a8e7ff527a46d32c1" formIndex="1" />

	</div>
	</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<bu:submit viewId="91caaada5fd045f49f6bb3ac67cc60bb" />
	<bu:script viewId="91caaada5fd045f49f6bb3ac67cc60bb" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	        <jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
	function init(){
	        getPlanId2();
	        changeGradeVal2();
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
		                                         //根据检测阶别获取抽样方案类型并生成下拉框
	        
	}//初始化方法
	
	function getPlanId2(){
	var getPlanUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6&formId=%{formId}";

	        var testStep= "0";
	        $("#paraMap1_QMS_SAMPLE_PLAN").empty();
 		$("#paraMap1_QMS_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_SAMPLE_PLAN").trigger("chosen:updated");
 		$("#paraMap1_QMS_ALQ_VALUE").empty();
 		$("#paraMap1_QMS_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_ALQ_VALUE").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getPlanUrl+"&testStep="+testStep,
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				}
 				$("#paraMap1_QMS_SAMPLE_PLAN").empty();
 				$("#paraMap1_QMS_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QMS_SAMPLE_PLAN").append(tempOption);
 				$("#paraMap1_QMS_SAMPLE_PLAN").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
	}
	function changeGradeVal2(){
	    $("#paraMap1_QMS_TEST_GRADE").empty();
 		$("#paraMap1_QMS_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
	   	tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
	        $("#paraMap1_QMS_TEST_GRADE").append(tempOption);
 		$("#paraMap1_QMS_TEST_GRADE").trigger("chosen:updated");
	}
</script>	
<script>
       
       $("#paraMap1_QMS_SAMPLE_PLAN").on("change",function(){
      
       	   getAqlVal();
       });
       $("#paraMap1_QMS_TEST_STEP").on("change",function(){
           
       	   getPlanId();
       });
       $("#paraMap1_QMS_TEST_LEVEL").on("change",function(){
           
       	   changeGradeVal($(this).val());
       });
       $("#paraMap1_QMS_FULL_FLAG_1").on("click",function(){
       	   var check=$("#paraMap1_QMS_FULL_FLAG_1").attr("checked") ;
       	   if(check=="checked"){
       	        //勾
       	        $("#paraMap1_QMS_THRESHOLD").val("0");
       	        $("#paraMap1_QMS_THRESHOLD").attr("readonly", "readonly");
       	   }else{
       	        //未勾
       	        $("#paraMap1_QMS_THRESHOLD").val("");
       	        $("#paraMap1_QMS_THRESHOLD").removeAttr("readonly");
       	   }
       });
       //根据抽样方案获取AQL值并生成下拉框
	function getAqlVal(){
	var getUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0376d8f6545d4ee5a34deff178328877&formId=%{formId}";

	        var planId = $("#paraMap1_QMS_SAMPLE_PLAN").val();
	        $("#paraMap1_QMS_ALQ_VALUE").empty();
 		$("#paraMap1_QMS_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_ALQ_VALUE").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getUrl+"&planId="+planId,
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    //console.log(dataList[i].QSD_AQL_VALUE);
 				    tempOption = tempOption + "<option value='"+dataList[i].QSD_AQL_VALUE+"'>"+dataList[i].QSD_AQL_VALUE+"</option>" ;
 				}
 				
 				$("#paraMap1_QMS_ALQ_VALUE").empty();
 				$("#paraMap1_QMS_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QMS_ALQ_VALUE").append(tempOption);
 				$("#paraMap1_QMS_ALQ_VALUE").trigger("chosen:updated");
 				//console.log(tempOption);
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					//utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		        }
 		});
	}
	//根据检测阶别获取抽样方案类型并生成下拉框
	function getPlanId(){
	var getPlanUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6&formId=%{formId}";

	        var testStep= $("#paraMap1_QMS_TEST_STEP").val();
	        //testStep=parseInt(testStep)+1;
	        testStep=parseInt(testStep);
	        $("#paraMap1_QMS_SAMPLE_PLAN").empty();
 		$("#paraMap1_QMS_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_SAMPLE_PLAN").trigger("chosen:updated");
 		$("#paraMap1_QMS_ALQ_VALUE").empty();
 		$("#paraMap1_QMS_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_ALQ_VALUE").trigger("chosen:updated");
 		//console.log(getPlanUrl);
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getPlanUrl+"&testStep="+testStep,
 	    	        
 			success: function(data){
 				var dataList=data.ajaxList;
 				//console.log(dataList);
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				}
 				$("#paraMap1_QMS_SAMPLE_PLAN").empty();
 				$("#paraMap1_QMS_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QMS_SAMPLE_PLAN").append(tempOption);
 				$("#paraMap1_QMS_SAMPLE_PLAN").trigger("chosen:updated");
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					//utilsFp.alert("error:"+errorThrown);
 					utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"","");
 				}
 		   }
 		});
	}
	function changeGradeVal(levelVal){
	    $("#paraMap1_QMS_TEST_GRADE").empty();
 		$("#paraMap1_QMS_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QMS_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
	        if(levelVal=="1"){
	   	       tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
	        }else{
	           tempOption ="<option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
	        }
	        $("#paraMap1_QMS_TEST_GRADE").append(tempOption);
 		$("#paraMap1_QMS_TEST_GRADE").trigger("chosen:updated");
	}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>