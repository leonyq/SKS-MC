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
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
	
	
	<script type="text/javascript">
	function setNull(){
		 $("#paraMapObj_CF_ITEM_CODE").attr("value","");
	         $("#paraMapObj_CF_ITEM_CODE_SHOW").attr("value","");
	         $("#CF_ITEM_NAME").attr("value","");
	         $("#CF_ITEM_DESC").attr("value","");
	         $("#paraMapObj_CF_PROJECT_ITEM").attr("value","");
	         $("#paraMapObj_CF_PROJECT_ITEM_SHOW").attr("value","");
	         $("#paraMapObj_CF_BOM_ITEM").attr("value","");
	         $("#paraMapObj_CF_BOM_ITEM_SHOW").attr("value","");
	}  
	   function initPopDiv(){
	     var selectObj = $("#paraMap1_CF_TYPE").val();
	     var initValue = $("#paraMapObj_CF_ITEM_CODE_SHOW").val();

	     if(selectObj=="0"){
	     document.getElementById("forbidden_code2").style.display = "none";//工单id
	     document.getElementById("forbidden_code3").style.display = "none";//机种id
	     document.getElementById("forbidden_code").style.display = "block";//全局id;控制弹窗对应的input显示	
	     }else if(selectObj=="1"){
	     $("#paraMapObj_CF_PROJECT_ITEM").val(initValue);
	     $("#paraMapObj_CF_PROJECT_ITEM_SHOW").val(initValue);
	     //$("#paraMapObj_CF_PROJECT_ITEM_SHOW").val("1");  
	     document.getElementById("forbidden_code2").style.display = "none";//工单id
	     document.getElementById("forbidden_code3").style.display = "block";//机种id
	     document.getElementById("forbidden_code").style.display = "none";//全局id;控制弹窗对应的input显示	     
	     }else if(selectObj=="2"){

	     $("#paraMapObj_CF_BOM_ITEM").val(initValue);
	     $("#paraMapObj_CF_BOM_ITEM_SHOW").val(initValue);	     
	     //$("#paraMapObj_CF_BOM_ITEM_SHOW").val("1"); 	     
	      document.getElementById("forbidden_code2").style.display = "block";//工单id
	      document.getElementById("forbidden_code3").style.display = "none";//机种id
	      document.getElementById("forbidden_code").style.display = "none";//全局id;控制弹窗对应的input显示		     
	     }

	     
	   }
	   function showPopDiv(){
	     var selectobj = document.getElementById("paraMap1_CF_TYPE");
	      for(var i=0;i<selectobj.length;i++){
	      	 var optionobj = selectobj[i];
	         var optionvalue = selectobj[i].value;
	          if(optionobj.selected==true){
	             if(optionvalue=="0"){
	     document.getElementById("forbidden_code2").style.display = "none";//工单id
	     document.getElementById("forbidden_code3").style.display = "none";//机种id
	     document.getElementById("forbidden_code").style.display = "block";//全局id;控制弹窗对应的input显示
	             }else if(optionvalue=="1"){
	     document.getElementById("forbidden_code2").style.display = "none";//工单id
	     document.getElementById("forbidden_code3").style.display = "block";//机种id
	     document.getElementById("forbidden_code").style.display = "none";//全局id;控制弹窗对应的input显示
	             }else if(optionvalue=="2"){
	      document.getElementById("forbidden_code2").style.display = "block";//工单id
	      document.getElementById("forbidden_code3").style.display = "none";//机种id
	      document.getElementById("forbidden_code").style.display = "none";//全局id;控制弹窗对应的input显示		     
	             }
	          }
	      }
	   }
	   function select(){
	        var selectobj = document.getElementById("paraMap1_CF_TYPE");
	        var inputobj1 = document.getElementById("CF_PROJECT_ID_SHOW");
	        var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	        var hinputobj = document.getElementById("flag");
	       for(var i=0;i<selectobj.length;i++){
	         var optionobj = selectobj[i];
	         var optionvalue = selectobj[i].value;
	         if(optionobj.selected==true){
	           if(optionvalue=="0"){
	           $("#pi").text("");
                   $("#mc").text("");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
	          $("#CF_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	          $("#CF_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CF_ITEM_CODE_SHOW").addClass("_VAL_NULL");
	          $("#paraMapObj_CF_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CF_BOM_ITEM_SHOW").removeClass("_VAL_NULL");	   	          
	         }else if(optionvalue=="1"){
	          $("#pi").text("*");
                  $("#mc").text("");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled = false;
	          inputobj2.disabled = true;
	          $("#CF_PROJECT_ID_SHOW").removeClass("readonly");
	          $("#CF_PROJECT_ID_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('CF_PROJECT_ID_SHOW'),'edit%2C09206fb514ca4b258beb531bc903334b%2Cdb2baea14ec44e80b84f06ac24ab812f','工单','','%7B%22WP_WIDTH%22%3A%221000%22%2C%22WP_HEIGHT%22%3A%22500%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','d97cd830-5df3-46b6-ac6c-dc3c2bf8230f');");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
		  $("#CF_PROJECT_ID_SHOW").addClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CF_ITEM_CODE_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CF_PROJECT_ITEM_SHOW").addClass("_VAL_NULL");
	          $("#paraMapObj_CF_BOM_ITEM_SHOW").removeClass("_VAL_NULL");	  	          
	         }else if(optionvalue=="2"){ 	         
	          $("#pi").text("");
                  $("#mc").text("*");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          inputobj1.disabled = true;
	          inputobj2.disabled = false;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
	          $("#CF_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
		  $("#MODEL_CODE_SHOW").removeClass("readonly");
		  $("#MODEL_CODE_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('MODEL_CODE_SHOW'),'edit%2C09206fb514ca4b258beb531bc903334b%2Ce4e0792751cb4016ae11ef021cfc9018','机种','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22410%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','1e0180b6-d075-4035-bd2c-178dda6fc766');");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false); 
		  $("#CF_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").addClass("_VAL_NULL");		          
	          $("#paraMapObj_CF_ITEM_CODE_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CF_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CF_BOM_ITEM_SHOW").addClass("_VAL_NULL");	  	          
	         } 
	         } 
	         	       }
	     }
	    
	    function validate(thisObj){
	    
	                if($("#paraMap1_CF_TYPE").val()==1){
      $("#CF_PROJECT_ID_SHOW").addClass('_VAL_NULL');
      $("#MODEL_CODE_SHOW").removeClass('_VAL_NULL');
   }else  if($("#paraMap1_CF_TYPE").val()==2){
      $("#MODEL_CODE_SHOW").addClass('_VAL_NULL');
      $("#CF_PROJECT_ID_SHOW").removeClass('_VAL_NULL');
   }
			if(isQuery){util.alert("?数据正在提交，请稍候...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			emptyValToHide('N');
			validate_code();
			isQuery = true;
		}
		
	   function validate_code(){
             var ipt1 = document.getElementById("MODEL_CODE").value;
             var ipt2 = document.getElementById("forbidden_code").value;
              var ipt4 = document.getElementById("CF_PROJECT_ID").value;
             var ipt5 = $("#paraMap1_CF_TYPE option:selected").val();
             if(ipt1 == ipt2){  
             //utilsFp.alert("<dict:lang value="机种与禁用料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种与禁用料不能相同" />",0,"","");
             }else{
              if(ipt5 == "1"){
               if(ipt4 == ""){
               //utilsFp.alert("<dict:lang value="工单不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="工单不能为空" />",0,"","");
               }else{
                 $("#paraMapObj_CF_PROJECT_ITEM").attr("disabled",true);
                 $("#paraMapObj_CF_BOM_ITEM").attr("disabled",true);
                
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "2"){
               if(ipt1 == ""){
               //utilsFp.alert("<dict:lang value="机种不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能为空" />",0,"","");
               }else{
                 $("#paraMapObj_CF_PROJECT_ITEM").attr("disabled",true);
                 $("#paraMapObj_CF_BOM_ITEM").attr("disabled",true);
                
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "0"){
                 $("#paraMapObj_CF_PROJECT_ITEM").attr("disabled",true);
                 $("#paraMapObj_CF_BOM_ITEM").attr("disabled",true);
                
                 document.forms.editForm.submit();
             }
             }
             
             }
	    
	</script>
	
	
	
	
	<style type="text/css">
	.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	
	
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
			    	        <button type="button" onclick="validate(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:430px;">
					
					<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
							<!--	<input type="hidden" name="iframeId" value="${iframeId}"> -->
								<input type="hidden" name="iframeId" value="<s:property value="#request.iframeId" />" />
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name="file_type" value="edit_file">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="09206fb514ca4b258beb531bc903334b" type="edit" />
		
	<table class="basic-table" id="table1" name="table1" >
	<input type="hidden" name="formIds" value="09206fb514ca4b258beb531bc903334b" />
	<input type="hidden" name="09206fb514ca4b258beb531bc903334b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="initCode" id="initCode" />
		<s:set name="_$viewId" value="'1345767213bc4e43aa23db2e5a650fc6'" />
		<s:set name="_$formId_1" value="'09206fb514ca4b258beb531bc903334b'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
		<td class="name"  style="width:128px" /><span class="dot"></span><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" id="CF_TYPE_T"/></td>
		<td class="dec" ><bu:ui colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" onchange="setNull();select();showPopDiv();" id="paraMap1_CF_TYPE" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><span class="dot">*</span><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name " ><span class="dot" id="pi">*</span><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec" ><bu:ui colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="CF_PROJECT_ID"  style="width:300px;"/></td>
                </tr>
                <tr>
                <td class="name " ><span class="dot" id="mc">*</span><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec">				
		<bu:ui colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="MODEL_CODE"  style="width:300px;"/></td>
		</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CF_MODEL_CODE_VER" formId="09206fb514ca4b258beb531bc903334b"/></td>
						<td class="dec"><bu:ui style="width:300px;" colNo="CF_MODEL_CODE_VER" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" readonly="readonly" formIndex="1" id="CF_MODEL_CODE_VER" />
						</td>
					</tr>		
		<tr>
		<td class="name" /><span class="dot">*</span><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec" id="forbidden_code"><bu:ui colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" readonly="readonly" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		<td class="dec" id="forbidden_code2"><bu:ui colNo="CF_BOM_ITEM" formId="09206fb514ca4b258beb531bc903334b"  readonly="readonly"  dataId="${dataId}" formIndex="1"  style="width:300px;"/></td>
		<td class="dec" id="forbidden_code3"><bu:ui colNo="CF_PROJECT_ITEM" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}"  formIndex="1"  style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_NAME" colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b"  readonly="readonly" dataId="${dataId}"  formIndex="1" style="width:300px;"/></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_DESC" colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" readonly="readonly" dataId="${dataId}" formIndex="1" style="width:300px;"/></td>
		</tr>	
		<tr>
		<td class="name"/><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:300px;height:100%;"/></td>
		</tr>	
			
	</table>					

			<bu:jsVal formId="09206fb514ca4b258beb531bc903334b" formIndex="1" />
									</form>
			</div>
		
	</div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isQuery = false;
		
		function edit(thisObj){
			//if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			
			document.forms.editForm.submit();
			isQuery = true;
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
		    data:{'paraMap.FORMID':tableId,
		    'paraMap.formIndex':formIndex,
		    'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,
		    'paraMap.trIndex':curRowSeq,
		    'paraMap.formidFirstId':formidFirstId,
		    'paraMap.subFormId':subFormId,
		    'paraMap.subRelColId':subRelColId,
		    'paraMap.relColVal':relColVal}
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
            
            var initValue = $("#paraMapObj_CF_ITEM_CODE_SHOW").val();
			$("#initCode").val(initValue);
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
	//重置
	var type = $("#paraMap1_CF_TYPE").val();//0 全局 1 机种 2 工单	
	var proId=$("#CF_PROJECT_ID_SHOW").val();
	var model=$("#MODEL_CODE_SHOW").val();
	var realValue = $("#paraMapObj_CF_ITEM_CODE_SHOW").val();
	//var itemCode=$("input[name='paraMapObj_CF_BOM_ITEM']").val();//$("#paraMapObj_CF_BOM_ITEM").val();
	var itemCode=$("#paraMapObj_CF_PROJECT_ITEM").val();
	var itemName=$("#CF_ITEM_NAME").val();
	var itemDesc=$("#CF_ITEM_DESC").val();
	function resetForm(){
		$("#editForm")[0].reset();
		select();
                $("#CF_PROJECT_ID").val(proId);
                $("#CF_PROJECT_ID_SHOW").val(proId);
                $("#MODEL_CODE").val(model);
                $("#MODEL_CODE_SHOW").val(model);
                $("#CF_ITEM_NAME").val(itemName);
                $("#CF_ITEM_DESC").val(itemDesc);		
                if(type=="0"){
                $("#paraMapObj_CF_ITEM_CODE").val(realValue);
                $("#paraMapObj_CF_ITEM_CODE_SHOW").val(realValue);	
                $("#paraMapObj_CF_BOM_ITEM").val(realValue);
                $("#paraMapObj_CF_BOM_ITEM_SHOW").val(realValue);	
                $("#paraMapObj_CF_PROJECT_ITEM").val(realValue);
                $("#paraMapObj_CF_PROJECT_ITEM_SHOW").val(realValue);	                                             
                }else if(type=="1"){
                $("#paraMapObj_CF_ITEM_CODE").val(realValue);
                $("#paraMapObj_CF_ITEM_CODE_SHOW").val(realValue);	
                $("#paraMapObj_CF_BOM_ITEM").val(realValue);
                $("#paraMapObj_CF_BOM_ITEM_SHOW").val(realValue);	
                $("#paraMapObj_CF_PROJECT_ITEM").val("");
                $("#paraMapObj_CF_PROJECT_ITEM_SHOW").val("");	                          
                }else if(type=="2"){
                $("#paraMapObj_CF_ITEM_CODE").val(realValue);
                $("#paraMapObj_CF_ITEM_CODE_SHOW").val(realValue);	
                $("#paraMapObj_CF_BOM_ITEM").val("");
                $("#paraMapObj_CF_BOM_ITEM_SHOW").val("");	
                $("#paraMapObj_CF_PROJECT_ITEM").val(realValue);
                $("#paraMapObj_CF_PROJECT_ITEM_SHOW").val(realValue);	                         
                }     
                      

                      initPopDiv();
                      
                      
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
        select();
        initPopDiv(); 
        
        function cbFus(){
	    var cbf=$("#paraMapObj_CF_PROJECT_ITEM_SHOW").val();
	    if(cbf==""){
	        $("#CF_ITEM_NAME").val("");
	        $("#CF_ITEM_DESC").val("");
	    }
	    
	}
	
	</script> 
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
