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
	<style>
	 input[disabled]{
           pointer-events: none;
         }
	</style>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
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
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:214px;">
	    			

		<bu:set name="paraMapObj" value="${dataId}" formId="be5d3c53cd2b455fa480961d1f3e7b86" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="be5d3c53cd2b455fa480961d1f3e7b86" />
	<input type="hidden" name="be5d3c53cd2b455fa480961d1f3e7b86" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f96e99b4672d438db11dd52180bcbfd0'" />
		<s:set name="_$formId_1" value="'be5d3c53cd2b455fa480961d1f3e7b86'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width: 75px;"/><span class="dot">*</span><bu:uitn colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_TEST_STEP}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><span class="dot">*</span><bu:uitn colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_ITEM_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_SAMPLE_PLAN}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_SAMPLE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_ALQ_VALUE}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_ERROR_GRADE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_TEST_LEVEL}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_TEST_GRADE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width: 75px;text-align: right;">
				<bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_DEFAULT_FLAG}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
				<bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_FULL_FLAG}" formIndex="1" />
			</td>	
			<!--
			<td class="name" /><bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_FULL_FLAG}" formIndex="1" /></bu:td>
		    -->
			<td class="name" /><bu:uitn colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_THRESHOLD}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="be5d3c53cd2b455fa480961d1f3e7b86" formIndex="1" />
				
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
	<bu:submit viewId="f96e99b4672d438db11dd52180bcbfd0" />
	<bu:script viewId="f96e99b4672d438db11dd52180bcbfd0" />


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
	//	$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
		                                         //根据检测阶别获取抽样方案类型并生成下拉框
	        //getPlanId2();
	        changeGradeVal2();
	}//初始化方法
	
	function getPlanId2(){
	        var testStep= "0";
	        $("#paraMap1_QST_SAMPLE_PLAN").empty();
 			$("#paraMap1_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 			$("#paraMap1_QST_SAMPLE_PLAN").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6",
 	    	data: {
 	    	    "testStep" : testStep
 	    	},
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				}
 				$("#paraMap1_QST_SAMPLE_PLAN").empty();
 				$("#paraMap1_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QST_SAMPLE_PLAN").append(tempOption);
 				$("#paraMap1_QST_SAMPLE_PLAN").trigger("chosen:updated");
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
	    $("#paraMap1_QST_TEST_GRADE").empty();
 		$("#paraMap1_QST_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QST_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
	   	tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
	        $("#paraMap1_QST_TEST_GRADE").append(tempOption);
 		$("#paraMap1_QST_TEST_GRADE").trigger("chosen:updated");
	}
</script>		
<script>
	$('input').keydown(function(e){
    		e.preventDefault();
	});
       $("#paraMap1_QST_THRESHOLD").val("0");
      // $("#paraMap1_QST_SAMPLE_PLAN").on("change",function(){
     // 
      // 	   getAqlVal();
     //  });
     //  $("#paraMap1_QST_TEST_STEP").on("change",function(){
           
     //  	   getPlanId();
     //  });
       $("#paraMap1_QST_TEST_LEVEL").on("change",function(){
           
       	   changeGradeVal($(this).val());
       }); 
       $("#paraMap1_QST_FULL_FLAG_1").on("click",function(){
       	   var check=$("#paraMap1_QST_FULL_FLAG_1").attr("checked") ;
       	   if(check=="checked"){
       	        //勾
       	        $("#paraMap1_QST_THRESHOLD").val("0");
       	        $("#paraMap1_QST_THRESHOLD").attr("readonly", "readonly");
       	        //$("#paraMap1_QST_THRESHOLD").attr("disabled", "disabled");
       	   }else{
       	        //未勾
       	        $("#paraMap1_QST_THRESHOLD").val("");
       	        $("#paraMap1_QST_THRESHOLD").removeAttr("readonly");
       	   }
       });      
       //根据抽样方案获取AQL值并生成下拉框
	function getAqlVal(){
	        var planId = $("#paraMap1_QST_SAMPLE_PLAN").val();
	        $("#paraMap1_QST_ALQ_VALUE").empty();
 		$("#paraMap1_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QST_ALQ_VALUE").trigger("chosen:updated");
 		var getUrl="${path}buss/bussModel_exeFunc.ms?funcMId=97268b3d572547148397866d36c23eed";
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "buss/bussModel_exeFunc.ms?funcMId=0376d8f6545d4ee5a34deff178328877",
 	    	data: {
 	    	    "planId" : planId 
 	    	},
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].QSD_AQL_VALUE+"'>"+dataList[i].QSD_AQL_VALUE+"</option>" ;
 				}
 				$("#paraMap1_QST_ALQ_VALUE").empty();
 				$("#paraMap1_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QST_ALQ_VALUE").append(tempOption);
 				$("#paraMap1_QST_ALQ_VALUE").trigger("chosen:updated");
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
	//根据检测阶别获取抽样方案类型并生成下拉框
	function getPlanId(){
	        var testStep= $("#paraMap1_QST_TEST_STEP").val();
	        testStep=parseInt(testStep);
	        $("#paraMap1_QST_SAMPLE_PLAN").empty();
 		$("#paraMap1_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QST_SAMPLE_PLAN").trigger("chosen:updated");
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6",
 	    	data: {
 	    	    "testStep" : testStep
 	    	},    
 			success: function(data){
 				var dataList=data.ajaxList;
 				//console.log(dataList);
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				}
 				$("#paraMap1_QST_SAMPLE_PLAN").empty();
 				$("#paraMap1_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMap1_QST_SAMPLE_PLAN").append(tempOption);
 				$("#paraMap1_QST_SAMPLE_PLAN").trigger("chosen:updated");
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
	    $("#paraMap1_QST_TEST_GRADE").empty();
 		$("#paraMap1_QST_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMap1_QST_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
	        if(levelVal=="1"){
	   	       tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
	        }else{
	           tempOption ="<option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
	        }
	        $("#paraMap1_QST_TEST_GRADE").append(tempOption);
 		$("#paraMap1_QST_TEST_GRADE").trigger("chosen:updated");
	}
	function checkInfo(){
		var flag=true;
			if($("#paraMap1_QST_SAMPLE_PLAN").val()==""||$("#paraMap1_QST_SAMPLE_PLAN").val()==-1){
				flag=false;
                                _alertValMsg($("#paraMap1_QST_SAMPLE_PLAN_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMap1_QST_SAMPLE_TYPE").val()==""||$("#paraMap1_QST_SAMPLE_TYPE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMap1_QST_SAMPLE_TYPE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMap1_QST_ALQ_VALUE").val()==""||$("#paraMap1_QST_ALQ_VALUE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMap1_QST_ALQ_VALUE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        }
                        if($("#paraMap1_QST_ERROR_GRADE").val()==""||$("#paraMap1_QST_ERROR_GRADE").val()==-1){
				flag=false;
                                _alertValMsg($("#paraMap1_QST_ERROR_GRADE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMap1_QST_TEST_LEVEL").val()==""||$("#paraMap1_QST_TEST_LEVEL").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMap1_QST_TEST_LEVEL_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMap1_QST_TEST_GRADE").val()==""||$("#paraMap1_QST_TEST_GRADE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMap1_QST_TEST_GRADE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
		return flag;
	}
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
                        var flag=checkInfo();
                        if(flag==false){
                                return;
                        }else{
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                   
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=cf347799aa244e309682174fdd1c9f0c";
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);}
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
