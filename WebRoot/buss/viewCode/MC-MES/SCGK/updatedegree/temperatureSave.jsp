<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	 <style>
    .basic-table input{
        width:180px !important;
    }
    
    
    </style>
</head>
<body>
	<div class="edit">
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
			        <button type="button"  onclick="addPonumber();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:470px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ec819630ac4041b1ace478a3c5163782" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec819630ac4041b1ace478a3c5163782" />
	<input type="hidden" name="ec819630ac4041b1ace478a3c5163782" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden"  id="flag1" />
	
		<s:set name="_$viewId" value="'b5c904997c464645a3c2d1170ce07bcc'" />
		<s:set name="_$formId_1" value="'ec819630ac4041b1ace478a3c5163782'" />
		<s:set name="_$type" value="'add'" />
		<!--	<td class="name-six" /><bu:uitn colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" value="%{P#PM_AREA_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" value="%{P#PM_MODEL_CODE}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" value="%{P#PM_PROJECT_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" value="%{CURVE_TYPE}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" value="%{WORK_STATION}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" value="%{FILE_NAME}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" value="%{BEGIN_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" value="%{END_TIME}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" value="%{MO_NUMBER}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  colspan="4"><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" value="%{REMARK}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>
			<td class="name-six" style="width:180px;" /><span class="dot">*</span><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" value="%{WORK_STATION}" formIndex="1" style="width:180px;"/></bu:td>

			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" value="%{MO_NUMBER}" formIndex="1"  style="width:180px;" /></bu:td>
	&nbsp;&nbsp;&nbsp;&nbsp;
		<td class="name-six" text-align="left" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" value="%{CURVE_TYPE}" formIndex="1" style="width:180px;"/></bu:td>

	</tr>
		<tr>
			
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" value="%{BEGIN_TIME}" formIndex="1" style="width:180px;" /></bu:td>
	
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" value="%{END_TIME}" formIndex="1" style="width:180px;"/></bu:td>
		&nbsp;&nbsp;&nbsp;&nbsp;
			<td class="name-six" text-align="left" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" value="%{FILE_NAME}" formIndex="1" style="width:180px;" /></bu:td>
	
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" colspan="5" style="height:250px;"><bu:ui  style="width:800px;height:250px" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" value="%{REMARK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
	</tr>
	</table>
			<bu:jsVal formId="ec819630ac4041b1ace478a3c5163782" formIndex="1" />
				
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
	
	
	<script>
/*	$(function(){
	
	if($("#paraMap1_WORK_STATION_SHOW").val()==""||$("#paraMap1_MO_NUMBER_SHOW").val()==""){
	      continuousNew();
	    
	}
	  
	   setTimeout(getStationSnR(),500);
	    
	    
	     
	    
	})*/
	function addPonumber(){
	

	 
	     getStationSnR();
	
   setTimeout(
	function addInfo() {
	
        
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
           
           
            var flag=$("#flag1").val();
            
             if(flag!=1){
             
                 utilsFp.confirmIcon(3,"","","", "制令单与线别不符","","360","145");
                 return;
             }
			
			var date1=$("#paraMap1_BEGIN_TIME").val();
			var date2=$("#paraMap1_END_TIME").val();
			if(date1>date2){
			utilsFp.confirmIcon(1,"","","", "开始时间不能大于结束时间","","300","");
			  /*  utilsFp.confirmIcon(1,"","","", "开始时间不能大于结束时间","","360","145");*/
			    return;

			}
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
			
			
		},500);
		
}
	
	function  getStationSn(){
	    
	    
            var url="${path}buss/bussModel_exeFunc.ms?funcMId=f2857f97d9fa4edca7c9ee5eed2c0a44"; 
            
            //alert(url);
            return url;
            
	}
	
	function getStationSnR() {
	
	
        		
	    var url = getStationSn();
	    $.ajax({
	       type: "POST",
	       dataType: 'json',
	       url: url,
	       data: {
	           workStation: $("#paraMap1_WORK_STATION_SHOW").val(),
	           moNumber:$("#paraMap1_MO_NUMBER_SHOW").val()
	       },
	       success: function(data) {
	       
	     
	       
	          var ajaxStr = data.ajaxString;
	          $("#flag1").val(ajaxStr);
	         
	       },
	       error: function(data) {
	           console.log('error');
	           console.log(data);
	       }
	        
	    });
	   
	}
	
	function continuousNew(){
	    var url="${path}buss/bussModel_exeFunc.ms?funcMId=72aacd8933b246f6826f374f1f35982a";
	     $.ajax({
	       type: "POST",
	       dataType: 'json',
	       url: url,
	     /* data: {
	           workStation: $("#paraMap1_WORK_STATION_SHOW").val(),
	           moNumber:$("#paraMap1_MO_NUMBER_SHOW").val()
	       },*/
	       success: function(data) {
	       console.log(data.ajaxList);
	       
	         /* var ajaxStr = data.ajaxString;
	          $("#flag1").val(ajaxStr);*/
	          
	          if(data!=null){
	              $("#paraMap1_WORK_STATION_SHOW").val(data.ajaxList[0].WORK_STATION);
	              
	              $("#paraMap1_MO_NUMBER_SHOW").val(data.ajaxList[0].MO_NUMBER);
	              
	              $("#paraMap1_WORK_STATION").val(data.ajaxList[0].WORK_STATION);
	              
	              $("#paraMap1_MO_NUMBER").val(data.ajaxList[0].MO_NUMBER);
	              
	          };
	         
	       },
	       error: function(data) {
	           console.log('error');
	           console.log(data);
	       }
	        
	    });
	    
	    
	}
	
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
