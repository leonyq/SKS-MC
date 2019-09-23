<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="下达" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
               <jsp:param name="modelName" value="VIEW_TYPE_11" />
                <jsp:param name="location" value="editForm" />
            </jsp:include> 
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script type = "text/javascript">
	function changePmo(obj){

	var PmoVal = $("#paraMapObj_PM_MO_NUMBER").val();//制令单号
	var ProVal = $("#paraMapObj_PROJECT_ID").val();//工单号
	var tail = PmoVal.split("-");

	var noe=tail.length-1;
	var nos;
	var pmProcessFace= $("#paraMapObj_PM_PROCESS_FACE").val();
	if(pmProcessFace!=""){
            
            if(pmProcessFace=="2"){
             //var step = "-0"+obj.value+"-";
            nos="2";
            
              }else{
               nos="1";
            }
        }else{
            nos="";
        }
       
	var nor = tail[noe];
	var step = "-0"+obj.value+nos+"-";
        tail = step + nor;
        $("#paraMapObj_PM_MO_NUMBER").val(ProVal+tail);
        $("#paraMapObj_PM_MO_NUMBER_SHOW").val(ProVal+tail);
       
        	/*
        var PmoVal = $("#paraMapObj_PM_MO_NUMBER").val();//制令单号
	    var steps;
        var nums;
        var num = PmoVal.split("-");
        var pmProcessFace= $("#paraMapObj_PM_PROCESS_FACE").val();
        if(pmProcessFace!=""){
            
            if(pmProcessFace=="2"){
             //var step = "-0"+obj.value+"-";
            nums="0"+obj.value+"2";
            steps=num[0]+"-"+nums+"-"+num[2];
            //console.log("norrrss:::"+steps);
            
              }else{
              nums="0"+obj.value+"1";
              steps=num[0]+"-"+nums+"-"+num[2];
              
               //console.log("no:::"+steps);
            }
        }else{
            nums="0"+obj.value;
            steps=num[0]+"-"+nums+"-"+num[2];
        }
        
            //tail = step + nor;
            $("#paraMapObj_PM_MO_NUMBER").val(steps);
            $("#paraMapObj_PM_MO_NUMBER_SHOW").val(steps);
          */   
        if(obj.value==""){
            $("#paraMapObj_PM_PROCESS_FACE").val("");
            $("#paraMapObj_PM_PROCESS_FACE").attr("disabled","disabled");
            $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
        }else if(obj.value=="1"){
            $("#paraMapObj_PM_PROCESS_FACE").removeAttr("disabled");
            $("#paraMapObj_PM_PROCESS_FACE").val("0");
            $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
        }else{
            $("#paraMapObj_PM_PROCESS_FACE").removeAttr("disabled");
            $("#paraMapObj_PM_PROCESS_FACE").val("");
            $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
        }
	}
	function changeNum(obj){
	var value = obj.value;
	var arry2 = ${dataList};
	var number = arry2[value-1];
	$("#paraMapObj_PM_TARGET_QTY").val(number);
	$("#maxMonumber").val(number);
	}
	function changePmNum(){
	            var objStep = $("#paraMapObj_PROJECT_STEP").val();
				if(objStep==""){
                    $("#paraMapObj_PM_PROCESS_FACE").val("");
                    $("#paraMapObj_PM_PROCESS_FACE").attr("disabled","disabled");
                    $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
                }else{
                    $("#paraMapObj_PM_PROCESS_FACE").removeAttr("disabled");
                    $("#paraMapObj_PM_PROCESS_FACE").val("");
                    $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
                    console.log("S");
                }
	
	    var projectId=$("#paraMapObj_PROJECT_ID").val();
			    var pmProcessFace=$("#paraMapObj_PM_PROCESS_FACE").val();
			    var projectStep = $("#paraMapObj_PROJECT_STEP").val();
			    var planNum = $("#paraMapObj_PRODUCT_COUNT").val();
			    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=943e70c63c404a089f3a3b6b5f0cb8fc";
			    if(pmProcessFace==""){
			        return;
			    }
			    $.ajax({
			        type:"post",
			        dataType:"json",
			        data:{
			          "projectId":projectId,
			          "pmProcessFace":pmProcessFace,
			          "projectStep":projectStep,
			          "planNum":planNum,
			          "type":"1"
			        },
			        url:loadItemUrl,
			        success:function(data){
			        console.log(data);
			            	comp=data;
			            if(null==data){
			                return;
			            }
			            if(null!=data.ajaxMap){
			                $("#paraMapObj_PM_TARGET_QTY").val(data.ajaxMap.plan_num);
                            	$("#maxMonumber").val(data.ajaxMap.plan_num);
			            }
			            
			        },
			        error:function(msg){
			            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			        }
			        
			    });
	}
	</script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <style type="text/css">
    #hiddenTr{
    display:none;
    }
    </style>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
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
			    	        <button type="button" onclick="addIssued(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:500px;">

								<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
								<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
								<input type="hidden" name="formId" value="<c:out value='${formId}' />">
								<input type="hidden" name="iframeId" value="<c:out value='${iframeId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:150px;border-bottom:0;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d34c8f48bead40d88c24a153c731de82" />
	<input type="hidden" name="d34c8f48bead40d88c24a153c731de82" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a460a8a06b2848369b056bab08639546'" />
		<s:set name="_$formId_1" value="'d34c8f48bead40d88c24a153c731de82'" />
		<s:set name="_$type" value="'edit'" />
		<tr id="hiddenTr">
			<bu:td cssClass="dec" colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="CUST_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>		
		</tr>
		<tr>
		        
			<td class="name" style="width:90px"/><bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROJECT_ID" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>		
		        <td class="name" /><bu:uitn colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="FQC_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="FINISH_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_MATERIAL" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
		        <td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PRODUCT_MATERIAL_VER" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL_VER" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui readonly="readonly" colNo="PRODUCT_MATERIAL_VER"  cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>		
		</tr>
		
		
	
	</table>
	</div>
	
	<DIV id="content1">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="制令单信息" /></h3>	
        </div>
        <div class="mod-hd" style="height:220px;border-bottom:0;">	
	   <table class="basic-table" id="table2" name="table2">
		<tr><input type="hidden" name="maxMonumber" id="maxMonumber" >
			<td class="name"  style="width:90px"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MO_NUMBER}" formIndex="1" /></bu:td>
		        <td class="name"  style="width:90px"/><span class="dot">*</span><bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec"  style="width:230px" colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROJECT_STEP"  cssClass="input isSubmit  isaddSubmit"  formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" onchange="/*changePmo(this);changeNum(this);*/changePmNum();"  /></bu:td>	
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_LINE}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_AREA_SN}" formIndex="1" onchange="getFace()" /></bu:td>
		    
		</tr>
		<tr>
		    <td class="name"  style="width:90px"/><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec"  style="width:230px" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" value="%{PM_TARGET_QTY}" formIndex="1" /></bu:td>			
		    
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_DATE}" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formIndex="1" /></bu:td>
					
		
		</tr>
		<tr>	
            <td class="name" /><bu:uitn colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_EMP}" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formIndex="1" /></bu:td>	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		       				        		    		
		</tr>			
        <tr>
             <td class="name" /><span class="dot">*</span><bu:uitn colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>	

        </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" colspan="3" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MEMO"   style="width:100%;height:80px;"  rows="3" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MEMO}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	</div>
	</div>
	</div>
			<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82" formIndex="1" />		<div style="padding:1px;"></div>

       </form>
   </div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			     $("#paraMapObj_PRODUCT_MATERIAL_SHOW_BUTTON").remove();
			     /*var arry2 = ${dataList};
			     var a = arry2[0];
			     $("#maxMonumber").val(a);
			     $("#paraMapObj_PM_TARGET_QTY").val(a);*/
			     //var arry = ${dataMap.PM_TARGET_QTY_1};
			     
			     //alert(a);
			     $("#paraMapObj_PM_ISSUED_DATE").val('${dataMap.nowDate}');
	             $("#paraMapObj_PM_ISSUED_EMP").val('${dataMap.userId}');
				 //$("#paraMapObj_PM_MO_NUMBER").val('${dataMap.PM_MO_NUMBER}');
				 //$("#paraMapObj_PM_MO_NUMBER_SHOW").val('${dataMap.PM_MO_NUMBER}');
				 
	             var objStep = $("#paraMapObj_PROJECT_STEP").val();
				if(objStep==""){
                    $("#paraMapObj_PM_PROCESS_FACE").val("");
                    $("#paraMapObj_PM_PROCESS_FACE").attr("disabled","disabled");
                    $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
                }else{
                    $("#paraMapObj_PM_PROCESS_FACE").removeAttr("disabled");
                    $("#paraMapObj_PM_PROCESS_FACE").val("");
                    $("#paraMapObj_PM_PROCESS_FACE").trigger("chosen:updated");
                }
                 $("#paraMapObj_PM_TARGET_QTY").attr("disabled","disabled");
                $("#paraMapObj_PM_TARGET_QTY").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
				 
			});
			var comp;
			function getFace(){
			 var pmProcessFace=$("#paraMapObj_PM_PROCESS_FACE").val();
			
			    if(pmProcessFace!=""){
			       $("#paraMapObj_PM_TARGET_QTY").removeAttr("disabled");
                    $("#paraMapObj_PM_TARGET_QTY").attr("class"," input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                }else{
                     $("#paraMapObj_PM_TARGET_QTY").attr("disabled","disabled");
                    $("#paraMapObj_PM_TARGET_QTY").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                }
			    var projectId=$("#paraMapObj_PROJECT_ID").val();
			    var projectStep = $("#paraMapObj_PROJECT_STEP").val();
			    var planNum = $("#paraMapObj_PRODUCT_COUNT").val();
			    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=943e70c63c404a089f3a3b6b5f0cb8fc";
			    if(pmProcessFace==""){
			        return;
			    }
			    $.ajax({
			        type:"post",
			        dataType:"json",
			        data:{
			         "projectId":projectId,
			         "pmProcessFace":pmProcessFace,
			         "projectStep":projectStep,
			         "planNum":planNum,
			         "type":"2"
			        },
			        url:loadItemUrl,
			        success:function(data){
			        console.log(data);
			            	comp=data;
			            if(null==data){
			                return;
			            }
			            
			            if(null!=data.ajaxString){
			            
			                comp=eval(data.ajaxString);
			                if(projectStep=="1"){
			                    if(comp=="1"){
			                    utilsFp.confirmIcon(3,"","","", "面别请选择单面",0,"300","");
			                }else if(comp=="3"){
			                    utilsFp.confirmIcon(3,"","","", "面别请选择正面或反面",0,"300","");
			                }else if(comp=="4"){
			                    utilsFp.confirmIcon(3,"","","", "面别请选择阴阳面",0,"300","");
			                }
			                    
			                }
			                	
			                /*
                            var PmoVal = $("#paraMapObj_PM_MO_NUMBER").val();//制令单号
                        	var ProVal = $("#paraMapObj_PROJECT_ID").val();//工单号
                        	var tail = PmoVal.split("-");

	                        var noe=tail.length-1;
                        	var nos;
                        	var pmProcessFace= $("#paraMapObj_PM_PROCESS_FACE").val();
                        	var steps=$("#paraMapObj_PROJECT_STEP").val();
                        	if(steps=="" ){
                        	    steps="";
                        	}
                        	if(pmProcessFace!=""){
                                    
                                    if(pmProcessFace=="2"){
                                     //var step = "-0"+obj.value+"-";
                                    nos="2";
                                    
                                      }else{
                                       nos="1";
                                    }
                                }else{
                                    nos="";
                                }
                        	var nor = tail[noe];
                        	var step = "-0"+steps+nos+"-";
                                tail = step + nor;
                                $("#paraMapObj_PM_MO_NUMBER").val(ProVal+tail);
                                $("#paraMapObj_PM_MO_NUMBER_SHOW").val(ProVal+tail);
                                */
                            	/*var arry2 = ${dataList};
                            	var number = arry2[pmProcessFace];
                            	$("#paraMapObj_PM_TARGET_QTY").val(number);
                            	$("#maxMonumber").val(number);*/
			            }
			            if(null!=data.ajaxMap){
			                $("#paraMapObj_PM_TARGET_QTY").val(data.ajaxMap.plan_num);
                            	$("#maxMonumber").val(data.ajaxMap.plan_num);
			            }
			            
			        },
			        error:function(msg){
			            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			        }
			        
			    });
			    
			}
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
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题
			
			    emptyValToHide();
			    document.forms.editForm.submit();
			    isQuery = true;
			    
			
			
		}
		
		/*function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}*/
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
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
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
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
	 
	 function addIssued(thisObj){
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
        //var n=$("#paraMapObj_PM_TARGET_QTY").val();
        var maxMonumber=$("#maxMonumber").val();
        if(maxMonumber==0){
          
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="计划剩余数量为0" />",0,"260","");
          return false;
        }
        //if(parseInt(n)>parseInt(maxMonumber)){
          // utilsFp.alert("%{getText("计划数量不能大于")}"+maxMonumber);
           //       return false;
        //}
         var projectStep = $("#paraMapObj_PROJECT_STEP").val();
         var pmProcessFace=$("#paraMapObj_PM_PROCESS_FACE").val();
         if(projectStep=="1"){
             if(comp!="2"){
          
    	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="请重新选择面别" />",0,"260","");
              return false;
        	 }
             
         }else{
                                 if(pmProcessFace!="0"){
                              
                        	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="非贴片工艺面别请选择单面" />",0,"260","");
                                  return false;
                            	 }
                             }
        			checkIndicator();
        			//$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
        			//$DisInput.attr("disabled", false); 
                    //            document.forms.addForm.action ="${path}buss/bussModel_exeFunc.ms?funcMId=057f1832bd5f4cfb8744d65a8051a313"; 
               
        			//document.forms.addForm.submit();
        			//isQuery = true;
        			//$DisInput.attr("disabled", true);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////0529 CSJ
        function checkIndicator(){
            var projectId=$("#paraMapObj_PROJECT_ID").val();
            var proStep=$("#paraMapObj_PROJECT_STEP").val();
    		util.showLoading("处理中..");
    		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=2923e2c644b1472293241038482328f1&formId=%{formId}";
    		$.ajax({
    			type: "POST",
    			dataType: "json",
    			async:false,
    			url: url,
    			data: {
    			  "type":"1",
    			  "projectId":projectId,
    			  "proStep":proStep
    			},
    			success: function(data) {
    				util.closeLoading();
                    var mes=data.ajaxString;
                    if(mes!="OK"){
                        //utilsFp.confirmIcon(3,"","yToRelease","", "<dict:lang value='"+mes+"' />",1,"","","","1");
                        utilsFp.confirmIcon(3,"","yToRelease","",mes ,1,"","","","1");
                    }else{
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            			$DisInput.attr("disabled", false); 
                        document.forms.addForm.action ="${path}buss/bussModel_exeFunc.ms?funcMId=057f1832bd5f4cfb8744d65a8051a313"; 
                   
            			document.forms.addForm.submit();
            			isQuery = true;
            			$DisInput.attr("disabled", true);
                    }
    			},
    			error: function(msg) {
    				util.closeLoading();
    				utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
    			}
    		});
        }
        function yToRelease(){
        	var projectId=$("#paraMapObj_PROJECT_ID").val();
    		util.showLoading("处理中..");
    		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=2923e2c644b1472293241038482328f1&formId=%{formId}";
    		$.ajax({
    			type: "POST",
    			dataType: "json",
    			async:false,
    			url: url,
    			data:{
    			    "type":"2",
    			    "projectId":projectId
    			},
    			success: function(data) {
    				util.closeLoading();
                    var mes=data.ajaxString;
                    if(mes!="OK"){
                       // utilsFp.confirmIcon(3,"","","", "<dict:lang value='"+mes+"' />",1,"","","","1");
                        utilsFp.confirmIcon(3,"","","",mes ,1,"","","","1");
                        return;
                    }else{
                        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            			$DisInput.attr("disabled", false); 
                        document.forms.addForm.action ="${path}buss/bussModel_exeFunc.ms?funcMId=057f1832bd5f4cfb8744d65a8051a313"; 
                   
            			document.forms.addForm.submit();
            			isQuery = true;
            			$DisInput.attr("disabled", true);
                    }
    			},
    			error: function(msg) {
    				util.closeLoading();
    				utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
    			}
    		});
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
</script>
<bu:script viewId="a460a8a06b2848369b056bab08639546" />

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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
