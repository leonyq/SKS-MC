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
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="addForm" />
		</jsp:include>
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
			        <button type="button" onclick="addMaintain()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:450px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="add" />
	<table class="basic-table" style="height:350px;">
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="_cfi_item_type" id="_cfi_item_type"/>
	<input type="hidden" name="types" id="types"/>
	<input type="hidden" name="cfmFixSn" id="cfmFixSn"/>
		<s:set name="_$viewId" value="'30f10575d35f48c5bb2d59f8143b2482'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" style="width:84px;"/><span class="dot">*</span><bu:uitn colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FIX_SN" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_FIX_SN}" formIndex="1" style="width:200px;"/></bu:td>

			<td class="name"  /><bu:uitn colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_CODE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_ITEM_CODE}" formIndex="1"  style="width:200px;"/></bu:td>
	 	
			<td class="name" /><bu:uitn colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_ITEM_NAME}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<tr>
			<!--<td class="name" /><bu:uitn colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ASSISTANTTOOLSPEC" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_ASSISTANTTOOLSPEC}" formIndex="1"  style="width:200px;"/></bu:td>
	   -->
	        <!--	<td class="name" /><bu:uitn colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_ITEM_NAME" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_ITEM_NAME}" formIndex="1"  style="width:200px;"/></bu:td>-->
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_TYPE}" formIndex="1"  style="width:200px;"/></bu:td>
	    
			<td class="name" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" disabled="disabled" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_EC_CODE}" formIndex="1"  style="width:200px;"/></bu:td>
		    	<td class="name" />不良描述</td>
			<bu:td cssClass="dec" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" readonly="readonly" name="CFM_DESC" class=" input isSubmit "  style="width:200px;"></bu:td>
		</tr>
		<tr>
			<!--	<td class="name" />不良描述</td>
			<bu:td cssClass="dec" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" readonly="readonly" name="CFM_DESC" class=" input isSubmit "  style="width:200px;"></bu:td>
            			-->
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_MT_MAN}" formIndex="1"  style="width:200px;"/></bu:td>
	    
	        <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_AUDIT}" formIndex="1"  style="width:200px;"/></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_REPORTER}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<tr>
		    	<!--<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_REPORTER}" formIndex="1"  style="width:200px;"/></bu:td>-->
	        	
			<td class="name" /><bu:uitn colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_LEFT_TOP}" formIndex="1"  style="width:200px;"/></bu:td>
	    	
			<td class="name" /><bu:uitn colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_TOP" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_RIGHT_TOP}" formIndex="1"  style="width:200px;"/></bu:td>
			<td class="name" /><bu:uitn colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_LEFT_LOWER}" formIndex="1"  style="width:200px;"/></bu:td>
		
		</tr>
		<tr>
		<!--	<td class="name" /><bu:uitn colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_LEFT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_LEFT_LOWER}" formIndex="1"  style="width:200px;"/></bu:td>
	 		-->
			<td class="name" /><bu:uitn colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_RIGHT_LOWER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_RIGHT_LOWER}" formIndex="1"  style="width:200px;"/></bu:td>
	     
			<td class="name" /><bu:uitn colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MIDDLE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_MIDDLE}" formIndex="1"  style="width:200px;"/></bu:td>
	         <td class="name" /><bu:uitn colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" readonly="readonly" value="%{CFM_STRAIN_DIS}" formIndex="1"  style="width:200px;"/></bu:td>
	
		</tr>
		<tr>
		  		<!--  <td class="name" /><bu:uitn colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_STRAIN_DIS" formId="9e447f80074441dcb0541aa75341e0b5" readonly="readonly" value="%{CFM_STRAIN_DIS}" formIndex="1"  style="width:200px;"/></bu:td>
	    	-->
			<td class="name" /><bu:uitn colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TINCKNESS" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_TINCKNESS}" formIndex="1"  style="width:200px;"/></bu:td>
	    	
			<td class="name" /><bu:uitn colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec" colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_FLATNESS" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_FLATNESS}" formIndex="1"  style="width:200px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" />保养/维修内容</td>
			<td colno="CFM_DEFECT_REMARK" class="dec" colspan="7">			
                <textarea  id="paraMap1_CFM_DEFECT_REMARK" name="paraMap1@0#CFM_DEFECT_REMARK" value="" maxlength="50" class="  isSubmit  _VAL_DATABASE" style="height:80px;width:100%;"></textarea>
            </td>
			
		</tr>
	</table>
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
				
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
    <script type="text/javascript">
        
        $(function(){
            $("#paraMap1_CFM_ITEM_CODE").attr("readonly","readonly"); 
            $("#paraMap1_CFM_ITEM_CODE").addClass("readonly");
            
             $("#paraMap1_CFM_ITEM_NAME").attr("readonly","readonly"); 
            $("#paraMap1_CFM_ITEM_NAME").addClass("readonly");
            
        })
        
    	function scraper(){	
            $("#paraMap1_CFM_TINCKNESS").val(0);
            $("#paraMap1_CFM_FLATNESS").val(0);
		 	$("#paraMap1_CFM_LEFT_TOP").attr("readonly","readonly"); $("#paraMap1_CFM_LEFT_TOP").val(0);
            $("#paraMap1_CFM_LEFT_LOWER").attr("readonly","readonly");  $("#paraMap1_CFM_LEFT_LOWER").val(0);
            $("#paraMap1_CFM_RIGHT_TOP").attr("readonly","readonly");  $("#paraMap1_CFM_RIGHT_TOP").val(0);
            $("#paraMap1_CFM_RIGHT_LOWER").attr("readonly","readonly"); $("#paraMap1_CFM_RIGHT_LOWER").val(0);
            $("#paraMap1_CFM_MIDDLE").attr("readonly","readonly"); $("#paraMap1_CFM_MIDDLE").val(0);
            $("#paraMap1_CFM_STRAIN_DIS").val(0);
            
		 }
		 
		 function steelMesh(){
		    $("#paraMap1_CFM_FLATNESS").val(0);
            $("#paraMap1_CFM_STRAIN_DIS").val(0);
		 	$("#paraMap1_CFM_MIDDLE").removeAttr("readonly");  $("#paraMap1_CFM_MIDDLE").val(0);
            $("#paraMap1_CFM_RIGHT_LOWER").removeAttr("readonly");$("#paraMap1_CFM_RIGHT_LOWER").val(0)
            $("#paraMap1_CFM_RIGHT_TOP").removeAttr("readonly"); $("#paraMap1_CFM_RIGHT_TOP").val(0);
            $("#paraMap1_CFM_LEFT_LOWER").removeAttr("readonly");$("#paraMap1_CFM_LEFT_LOWER").val(0);
            $("#paraMap1_CFM_LEFT_TOP").removeAttr("readonly"); $("#paraMap1_CFM_LEFT_TOP").val(0);
            $("#paraMap1_CFM_TINCKNESS").val(0);
           
           
		 }
		 $("#paraMap1_CFM_TYPE").change(function(){
	 	 	 
            if($(this).val()==0){//保养 
 
              $('#paraMap1_CFM_EC_CODE').attr("disabled","disabled"); 
               
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
              $('#CFM_DESC').val("");
              $("#paraMap1_CFM_EC_CODE option[value='']").attr("selected",true); 
       		  $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated"); 
              
            }else{//维修
              
              $('#paraMap1_CFM_EC_CODE').removeAttr("disabled");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
             }
    });
    $("#paraMap1_CFM_EC_CODE").change(function(){
	 		var SearchDescUrl ="${path}buss/bussModel_exeFunc.ms?funcMId=7edad0a39e8c411ea7346403d9249a99";
	 		var cfm_type=$("#paraMap1_CFM_EC_CODE").val(); 	
	 		//var data_auth=$("#paraMap1_DATA_AUTH").val(); 
	 		if(cfm_type==""){
	 			$("#CFM_DESC").val("");
	 		}else{
	 		$.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:SearchDescUrl,
	 			data:"cfm_type="+cfm_type,
	 			   	 //"data_auth="+data_auth,
	 			success:function(data){			 
	 		        	//var cd=data.ajaxMap.cecDesc;
	 		        	var cd=data.ajaxList;
	 				    $("#CFM_DESC").val(cd[0].CEC_DESC);
	 				
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	});
	 		 			
	 		}

	});
	$('#paraMap1_CFM_LEFT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFM_LEFT_TOP");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_LEFT_TOP'),"<dict:lang value="该项只能正整数" />");
             }
         });
         $('#paraMap1_CFM_LEFT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFM_LEFT_LOWER");
             if( !  /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_LEFT_LOWER'),"<dict:lang value="该项只能正整数" />");
             }
         });
         $('#paraMap1_CFM_RIGHT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFM_RIGHT_LOWER");
             if( !  /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_RIGHT_LOWER'),"<dict:lang value="该项只能正整数" />");
             }
         });
         $('#paraMap1_CFM_RIGHT_TOP').bind('keyup', function () {
	        var calwStart=$("#paraMap1_CFM_RIGHT_TOP");
             if( !  /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_RIGHT_TOP'),"<dict:lang value="该项只能正整数" />");
             }
         });
         $('#paraMap1_CFM_MIDDLE').bind('keyup', function () {
	        var calwStart=$("#paraMap1_CFM_MIDDLE");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_MIDDLE'),"<dict:lang value="该项只能正整数" />");
             }
         });
			$('#paraMap1_CFM_TINCKNESS').bind('keyup', function () {
	        var calwStart=$("#paraMap1_CFM_TINCKNESS");
             if( !/^[0-9]+(.[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_TINCKNESS'),"<dict:lang value="该项只能输入有两位小数的正实数" />");
             }
         });
         $('#paraMap1_CFM_FLATNESS').bind('keyup', function () {
	        var calwStart=$("#paraMap1_CFM_FLATNESS");
             if( !/^[0-9]+(.[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFM_FLATNESS'),"<dict:lang value="该项只能输入有两位小数的正实数" />");
             }
         });
         
         function addMaintain(){
                if($("#paraMap1_CFM_FIX_SN_SHOW").val()==""){
                 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加制具信息" />",0,"","");
                return;
                }
                
                if($("#paraMap1_CFM_TYPE").val()=="1"&&$("#paraMap1_CFM_EC_CODE").val()==""){
                 _alertValMsg($("#paraMap1_CFM_EC_CODE_chosen"),"请选择不良代码");
                return;
                } 
                
                if($("#paraMap1_CFM_TYPE").val()=="0"){
                $('#paraMap1_CFM_EC_CODE_chosen').removeClass('_VAL_NULL');
                }
                
                //if($("#paraMap1_CFM_REPORTER").val()==""){
                // _alertValMsg($("#paraMap1_CFM_REPORTER_SHOW"),"%{getText('请选择报修人')}");
                //return;
                //}
                //if($("#paraMap1_CFM_MT_MAN").val()==""){
                 //_alertValMsg($("#paraMap1_CFM_MT_MAN_SHOW"),"%{getText('请选择保养/维修人')}");
                //return;
                //}
                //if($("#paraMap1_CFM_AUDIT").val()==""){
                 //_alertValMsg($("#paraMap1_CFM_AUDIT_SHOW"),"%{getText('请选择确认人')}");
                //return;
                //}
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

   document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=180a973ddb1d472d881b6542189ad688";
   document.forms.addForm.submit();
}
         
    </script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
    <bu:submit viewId="30f10575d35f48c5bb2d59f8143b2482" />
    <bu:script viewId="30f10575d35f48c5bb2d59f8143b2482" />
    
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
