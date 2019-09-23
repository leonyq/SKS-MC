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
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 214px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="be5d3c53cd2b455fa480961d1f3e7b86" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="be5d3c53cd2b455fa480961d1f3e7b86" />
	<input type="hidden" name="be5d3c53cd2b455fa480961d1f3e7b86" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d02186d934ae4d74a37ae24fd7293951'" />
		<s:set name="_$formId_1" value="'be5d3c53cd2b455fa480961d1f3e7b86'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width: 75px;"/><span class="dot">*</span><bu:uitn colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><span class="dot">*</span><bu:uitn colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width: 75px;text-align: right;">
				<bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" />
				<bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" />
			</td>	
			<!--
			<td class="name" /><bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" value="%{QST_FULL_FLAG}" formIndex="1" /></bu:td>
		    -->
			<td class="name" /><bu:uitn colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<bu:td cssClass="dec" colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" ><bu:ui colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="be5d3c53cd2b455fa480961d1f3e7b86" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

        <bu:submit viewId="d02186d934ae4d74a37ae24fd7293951" />
	<bu:script viewId="d02186d934ae4d74a37ae24fd7293951" />
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
		
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			//utilsFp.alert(msg);
			utilsFp.confirmIcon(3,"","","", msg,0,"","");
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_QST_TEST_STEP").trigger("chosen:updated");
			$("#paraMapObj_QST_TEST_GRADE").trigger("chosen:updated");
			getPlanId2();
			$("#paraMapObj_QST_SAMPLE_PLAN").trigger("chosen:updated");
       	                getAqlVal();
			$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
			$("#paraMapObj_QST_ERROR_GRADE").trigger("chosen:updated");
			$("#paraMapObj_QST_TEST_LEVEL").trigger("chosen:updated");
			changeGradeVal2();
			$("#paraMapObj_QST_ITEM_TYPE").trigger("chosen:updated");
			$("#paraMapObj_QST_SAMPLE_TYPE").trigger("chosen:updated");
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			//getPlanId2();
			getAqlVal();  
			changeGradeVal2();
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
	function getAqlVal(){
	        var aqlVal="${dataList[0].QST_ALQ_VALUE}";
	        var planId = "${dataList[0].QST_SAMPLE_PLAN}";
	        $("#paraMapObj_QST_ALQ_VALUE").empty();
	 		$("#paraMapObj_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
	 		$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "buss/bussModel_exeFunc.ms?funcMId=0376d8f6545d4ee5a34deff178328877",
 	    	data: {
 	    	    "planId" : planId
 	    	},
 			success: function(data){
 				var dataList=data.ajaxList;
 				//console.log(dataList);
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    if(dataList[i].QSD_AQL_VALUE==aqlVal){
 				    	tempOption = tempOption + "<option value='"+dataList[i].QSD_AQL_VALUE+"' selected='selected'>"+dataList[i].QSD_AQL_VALUE+"</option>" ;
 				    }else{
 				    	tempOption = tempOption + "<option value='"+dataList[i].QSD_AQL_VALUE+"'>"+dataList[i].QSD_AQL_VALUE+"</option>" ;
 				    }
 				}
 				$("#paraMapObj_QST_ALQ_VALUE").empty();
 				$("#paraMapObj_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 				if(dataList.length!=0){
 					$("#paraMapObj_QST_ALQ_VALUE").append(tempOption);
 				}
 				$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
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
	function getPlanId2(){
	        var samplePlan= "${dataList[0].QST_SAMPLE_PLAN}";
	        var testStep= $("#paraMapObj_QST_TEST_STEP").val();
	        
	        testStep=parseInt(testStep);
	        $("#paraMapObj_QST_SAMPLE_PLAN").empty();
 		$("#paraMapObj_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 		$("#paraMapObj_QST_SAMPLE_PLAN").trigger("chosen:updated");
 		
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6",
 	    	data: {
 	    	    "testStep" : testStep
 	    	},
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    if(dataList[i].ID==samplePlan){
 				    	tempOption = tempOption + "<option value='"+dataList[i].ID+"' selected='selected'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				    }else{
 				    	tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				    }
 				    
 				}
 				$("#paraMapObj_QST_SAMPLE_PLAN").empty();
 				$("#paraMapObj_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMapObj_QST_SAMPLE_PLAN").append(tempOption);
 				$("#paraMapObj_QST_SAMPLE_PLAN").trigger("chosen:updated");
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
	        var testLevel= "${dataList[0].QST_TEST_LEVEL}";
	        var testgrade= "${dataList[0].QST_TEST_GRADE}";
	        
	        $("#paraMapObj_QST_TEST_GRADE").empty();
 		$("#paraMapObj_QST_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMapObj_QST_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
 		if(testLevel=="1"){
 		   if(testgrade=="1"){
 		        tempOption ="<option value='1' selected='selected'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
 		   }else if(testgrade=="2"){
 		        tempOption ="<option value='1'>Ⅰ</option><option value='2' selected='selected'>Ⅱ</option><option value='3'>Ⅲ</option>";
 		   }else if(testgrade=="3"){
 		        tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3' selected='selected'>Ⅲ</option>";
 		   }
	        }else{
	           if(testgrade=="4"){
 		        tempOption ="<option value='4' selected='selected'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
 		   }else if(testgrade=="5"){
 		        tempOption ="<option value='4'>S-1</option><option value='5' selected='selected'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
 		   }else if(testgrade=="6"){
 		        tempOption ="<option value='4'>S-1</option><option value='5'>S-2</option><option value='6'selected='selected' >S-3</option><option value='7'>S-4</option>";
 		   }else if(testgrade=="7"){
 		        tempOption ="<option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7' selected='selected'>S-4</option>";
 		   }
	        }
	        $("#paraMapObj_QST_TEST_GRADE").append(tempOption);
 		$("#paraMapObj_QST_TEST_GRADE").trigger("chosen:updated");
	}
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
        
</script>	

<script type="text/javascript">
	$(document).ready(function () {
	//	$("#paraMapObj_QST_SAMPLE_PLAN").on("change",function(){
       	             // getAqlVal2();
     //   	});
         //       $("#paraMapObj_QST_TEST_STEP").on("change",function(){
         //  
       	 //             getPlanId();
         //       });
                $("#paraMapObj_QST_TEST_LEVEL").on("change",function(){
           
       	              changeGradeVal($(this).val());
                }); 
                $("#paraMapObj_QST_FULL_FLAG_1").on("click",function(){
       	        var check=$("#paraMapObj_QST_FULL_FLAG_1").attr("checked") ;
       	        if(check=="checked"){
       	             //勾
       	             $("#paraMapObj_QST_THRESHOLD").val("0");
       	             $("#paraMapObj_QST_THRESHOLD").attr("readonly", "readonly");
       	        }else{
       	             //未勾
       	             $("#paraMapObj_QST_THRESHOLD").val("");
       	             $("#paraMapObj_QST_THRESHOLD").removeAttr("readonly");
       	        }
                }); 
                if($("#paraMapObj_QST_FULL_FLAG_1").attr("checked")=="checked"){
       	             //勾
       	             $("#paraMapObj_QST_THRESHOLD").attr("readonly", "readonly");
       	        }
	});
       //根据抽样方案获取AQL值并生成下拉框
	function getAqlVal2(){
	        var planId = $("#paraMapObj_QST_SAMPLE_PLAN").val();
	        $("#paraMapObj_QST_ALQ_VALUE").empty();
	 		$("#paraMapObj_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
	 		$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
 		
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
 				$("#paraMapObj_QST_ALQ_VALUE").empty();
 				$("#paraMapObj_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 				$("#paraMapObj_QST_ALQ_VALUE").append(tempOption);
 				$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
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
	        var testStep= $("#paraMapObj_QST_TEST_STEP").val();
	        testStep=parseInt(testStep);
	        $("#paraMapObj_QST_SAMPLE_PLAN").empty();
 		$("#paraMapObj_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 		$("#paraMapObj_QST_SAMPLE_PLAN").trigger("chosen:updated");
 		$("#paraMapObj_QST_ALQ_VALUE").empty();
 		$("#paraMapObj_QST_ALQ_VALUE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMapObj_QST_ALQ_VALUE").trigger("chosen:updated");
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "buss/bussModel_exeFunc.ms?funcMId=ade5beba1ba447d98d92df787fdac1b6",
 	    	data: {
 	    	    "testStep" : testStep
 	    	},   
 			success: function(data){
 				var dataList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<dataList.length;i++){
 				    tempOption = tempOption + "<option value='"+dataList[i].ID+"'>"+dataList[i].QSP_PLAN_NAME+"</option>" ;
 				}
 				$("#paraMapObj_QST_SAMPLE_PLAN").empty();
 				$("#paraMapObj_QST_SAMPLE_PLAN").append("<option value='-1'>--请选择--</option>");
 				$("#paraMapObj_QST_SAMPLE_PLAN").append(tempOption);
 				$("#paraMapObj_QST_SAMPLE_PLAN").trigger("chosen:updated");
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
	    $("#paraMapObj_QST_TEST_GRADE").empty();
 		$("#paraMapObj_QST_TEST_GRADE").append("<option value='-1'>--请选择--</option>");
 		$("#paraMapObj_QST_TEST_GRADE").trigger("chosen:updated");
 		var tempOption = "";
	        if(levelVal=="1"){
	   	       tempOption ="<option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
	        }else{
	           tempOption ="<option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
	        }
	        $("#paraMapObj_QST_TEST_GRADE").append(tempOption);
 		$("#paraMapObj_QST_TEST_GRADE").trigger("chosen:updated");
	}
	function checkInfo(){
		var flag=true;
			if($("#paraMapObj_QST_SAMPLE_PLAN").val()==""||$("#paraMapObj_QST_SAMPLE_PLAN").val()==-1){
				flag=false;
                                _alertValMsg($("#paraMapObj_QST_SAMPLE_PLAN_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMapObj_QST_SAMPLE_TYPE").val()==""||$("#paraMapObj_QST_SAMPLE_TYPE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMapObj_QST_SAMPLE_TYPE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMapObj_QST_ALQ_VALUE").val()==""||$("#paraMapObj_QST_ALQ_VALUE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMapObj_QST_ALQ_VALUE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        }
                        if($("#paraMapObj_QST_ERROR_GRADE").val()==""||$("#paraMapObj_QST_ERROR_GRADE").val()==-1){
				flag=false;
                                _alertValMsg($("#paraMapObj_QST_ERROR_GRADE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMapObj_QST_TEST_LEVEL").val()==""||$("#paraMapObj_QST_TEST_LEVEL").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMapObj_QST_TEST_LEVEL_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
                        if($("#paraMapObj_QST_TEST_GRADE").val()==""||$("#paraMapObj_QST_TEST_GRADE").val()==-1){
                        	flag=false;
                                _alertValMsg($("#paraMapObj_QST_TEST_GRADE_chosen"),"<dict:lang value="该项不能为空" />");
                                return flag;
                        } 
		return flag;
	}
	function editInfo(){

            if(!val.valNullData()){
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
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e31b4723200b4e76ae901a7ef5989e1e";
       
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);}
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
