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
  <%--  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>--%>
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
    <style type="text/css">
	    
	    .pokja{
	        width:30px!important;
	    }
    	
    </style>

</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
                <div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			    	        <button type="button" onclick="editMtInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button> <!-- edit(this); -->
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:534px;">
					
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
		   				<jsp:param name="location" value="editForm" />
		            </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" type="edit" />
     <div class="mod">	
     <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="保养信息"/></h3>	
     </div>
     </div>

	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9fe40c6681484bbdaeeee44cc7fe3c2a" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="9fe40c6681484bbdaeeee44cc7fe3c2a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b6d6096437a640f8aa8f00827d21e11a'" />
		<s:set name="_$formId_1" value="'9fe40c6681484bbdaeeee44cc7fe3c2a'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
		    	<td class="name" style="width:84px;"/><span class="dot">*</span><bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		    
	 
		    	<td class="name" style="width:62px;"/><span class="dot">*</span><bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		
		    	<td class="name" /><bu:uitn colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" colspan="5" ><bu:ui colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" dataId="${dataId}" formIndex="1" style="height:80px;width:100%"/></bu:td>
		</tr>
		
	</table>
	
	<div style="width:100%;">
	 <div class="mod">	
	 <div class="mod-hd" style="margin-bottom: 5px;">		
     <h3 class="tit"><dict:lang value="FEEDER信息"/></h3>	
        <div class="extend-btn" style="float:right;display:none;		margin:5px 0;">
			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','zjalert')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   	    </div>
     </div>
    </div>
	 	
	</div>
	<div class="mod-hd" style="height:290px;border-bottom: none;clear:both;overflow: auto;"> 
					<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
								<tr class=" thcolor">
								<td class="datagrid-cell pokja" style="width:30px; text-align:center;"></td>
								<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll2" onclick="select_All()" style="cursor: pointer;" title="全选"></span></td>
								<td class="datagrid-cell" style="width:223px;">
									<dict:lang value="FEEDER SN" /> 
								</td>
								<td class="datagrid-cell" style="width:180px;"> 
									<dict:lang value="FEEDER规格" />
								</td>
								<td class="datagrid-cell" style="width:160px;">
									<dict:lang value="FEEDER类型" />
								</td>
								<td class="datagrid-cell" style="width:180px;">
									<dict:lang value="最后保养时间" />
								</td>
										
								</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addtbody1" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
	   </div>
	   
	   
			<bu:jsVal formId="9fe40c6681484bbdaeeee44cc7fe3c2a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
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
		
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_TCFM_TYPE").trigger("chosen:updated");
			$("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
			$("#CFM_DESC").val($("#CFM_DESC").val());
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			var date='${dataList[0].TCF_MT_LASTTIME}';
			var tct_type="";
			if(${dataList[0].TCT_TYPE}=="1"){
 				              tct_type="单通道";
 				            }else if(${dataList[0].TCT_TYPE}=="2"){
 				              tct_type="双通道";
 				            }else if(${dataList[0].TCT_TYPE}=="3"){
 				              tct_type="三通道";
 				            }
                        var time_date=date.substring(0,date.length-2);
			$("#addtbody1 ").append("<tr class='datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234' id='' name=''></tr>");
	        $("#addtbody1 tr:last").append("<td class='datagrid-cell pokja' style='width:30px; text-align:center;'>1</td>");
		    $("#addtbody1 tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='checkbox' style='cursor: pointer;'></td>");
	 	    $("#addtbody1 tr:last").append("<td class='datagrid-cell' style='width:223px; text-align:center;'>${dataList[0].TCF_FEEDER_SN} </td>");//
	 	    $("#addtbody1 tr:last").append("<td class='datagrid-cell' style='width:180px; text-align:center;'>"+tct_type+" </td>");
	        $("#addtbody1 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:center;'>${dataList[0].TCS_SPEC} </td>");
	 	    $("#addtbody1 tr:last").append("<td class='datagrid-cell' style='width:180px; text-align:center;'>"+time_date+" </td>");
			
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			var type='${dataMap.TCFM_TYPE}';
	                //alert(type);
			
			if(type==0){
	             //保养
	             $('#paraMapObj_TCF_EC_CODE').val("");
                     $('#paraMapObj_TCF_EC_DES').val(""); 
	                 $('#paraMapObj_TCF_EC_CODE').attr("disabled","disabled"); 
                     $('#paraMapObj_TCF_EC_DES').attr("readonly","readonly"); 
                     $('#paraMapObj_TCF_EC_DES').addClass("readonly");
                     $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }else if(type==1){
	              $('#paraMapObj_TCF_EC_CODE').removeAttr("disabled");
	              $('#paraMapObj_TCF_EC_DES').attr("disabled",false); 
	              //$('#paraMapObj_TCF_EC_DES').removeAttr("readonly");
	              //$('#paraMapObj_TCF_EC_DES').removeClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }
			            
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		$("#paraMapObj_TCFM_TYPE").change(function(){
	           var type=$(this).val();
	           //alert(type);
	           if(type==0){
	             //保养
	             $('#paraMapObj_TCF_EC_CODE').val("");
                     $('#paraMapObj_TCF_EC_DES').val(""); 
	             $('#paraMapObj_TCF_EC_CODE').attr("disabled","disabled"); 
               
	              $('#paraMapObj_TCF_EC_DES').attr("readonly","readonly"); 
	              $('#paraMapObj_TCF_EC_DES').addClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
              
	           }else if(type==1){
	             $('#paraMapObj_TCF_EC_CODE').removeAttr("disabled");
	             $('#paraMapObj_TCF_EC_DES').removeAttr("disabled"); 
	              $('#paraMapObj_TCF_EC_DES').removeAttr("readonly");
	              $('#paraMapObj_TCF_EC_DES').removeClass("readonly");
	              $("#paraMapObj_TCF_EC_CODE").trigger("chosen:updated");
              
	           }
	        });
	        

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>



       $("#paraMapObj_TCF_EC_CODE").change(function(){
	 		
	 		var ecCode=$("#paraMapObj_TCF_EC_CODE").val(); 		
	 		//alert(cfm_type);
	 		if(ecCode==""){
			  $("#paraMapObj_TCF_EC_DES").val("");
			}else{
	 	         var jsondata="";
	 	 	jsondata ={"ecCode":ecCode};
	  
	 	         var listUrl=getEditEcDescUrl();
	 	 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 			        //alert(data);
	 				var cd=data.ajaxList;
	 				$("#paraMapObj_TCF_EC_DES").val(cd[0].CEC_DESC);
	 				//alert(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	          });}
	 	
	         }); 
	         
	 function getEditEcDescUrl(){
        var url="${path}buss/bussModel_exeFunc.ms?funcMId=675575997e0d42e6851ca593cd2dd9a5"; //VM-FEEDER保养与维修信息修改 操作功能 获得不良描述
        //alert(url);
        return url;
        }
        
        function editMtInfo(){
            $("#paraMap1_TCFM_MT_MAN_SHOW").addClass('_VAL_NULL');
            $("#paraMap1_TCFM_MT_MAN").addClass('_VAL_NULL');
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
                                    //alert();
            if($("#paraMapObj_TCFM_TYPE").val()=="1"&&$("#paraMapObj_TCF_EC_CODE").val()==""){
             _alertValMsg($("#paraMapObj_TCF_EC_CODE_chosen"),"%{getText('请选择不良代码')}");
            return;
            } 
                                    $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            			$DisInput.attr("disabled", false); 
                                    document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=95cdf6f20fb34f61a660bab71f60a7e0"; 
                   
            			document.forms.editForm.submit();
            			isQuery = true;
            			$DisInput.attr("disabled", true);
            }
</script>
   
<bu:submit viewId="b6d6096437a640f8aa8f00827d21e11a" />
<bu:script viewId="b6d6096437a640f8aa8f00827d21e11a" />
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
