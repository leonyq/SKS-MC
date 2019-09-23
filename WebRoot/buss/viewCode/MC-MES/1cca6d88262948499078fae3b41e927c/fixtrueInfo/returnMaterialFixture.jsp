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
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
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
			        <button type="button" onclick="fixBack()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="33982c650c8d435aacffbd806ed0103d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="33982c650c8d435aacffbd806ed0103d" />
	<input type="hidden" name="33982c650c8d435aacffbd806ed0103d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="cfo_id" id="cfo_id" value="" />
	<input type="hidden" name="assis_type" id="assis_type" value="" />
	<input type="hidden" name="loginName" id="loginName" value="" />
		<s:set name="_$viewId" value="'0678bf33e5264f339ba0eb3be93ca40f'" />
		<s:set name="_$formId_1" value="'33982c650c8d435aacffbd806ed0103d'" />
		<s:set name="_$type" value="'add'" />
		<!--1-->
		<tr> 
			<td class="name" style="width:70px;"/><bu:uitn colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_FIX_SN" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_FIX_SN}" formIndex="1" /></bu:td>
		 
			<td class="name" style="width:70px;"/><bu:uitn colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" style="width:235px;" colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_CODE" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_NAME" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_NAME}" formIndex="1" /></bu:td>
		  
			<td class="name" /><bu:uitn colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_ITEM_SPEC" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_LEFT_TOP" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_LEFT_TOP}" formIndex="1" /></bu:td>
            <td class="name" /><bu:uitn colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_RIGHT_TOP" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_RIGHT_TOP}" formIndex="1" /></bu:td>
		</tr>
		
		<!--4-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_LEFT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_LEFT_LOWER}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_RIGHT_LOWER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_RIGHT_LOWER}" formIndex="1" /></bu:td>
		</tr>
		
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_MIDDLE" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_MIDDLE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CFO_STRAIN_DIS" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_STRAIN_DIS" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_STRAIN_DIS" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_STRAIN_DIS}" formIndex="1" /></bu:td>
			
		</tr>
		<!--6-->
	    	<tr>
			<td class="name" /><bu:uitn colNo="CFO_TINCKNESS" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_TINCKNESS" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_TINCKNESS" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_TINCKNESS}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CFO_FLATNESS" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_FLATNESS" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_FLATNESS" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_FLATNESS}" formIndex="1" /></bu:td>
			
		</tr>
		<!--7-->
		
		
		<tr>
		    <td class="name" /><bu:uitn colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d"  ><bu:ui colNo="CFO_ITEM_CURUSER" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_ITEM_CURUSER}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFO_OPEATOR" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFO_OPEATOR}" formIndex="1" /></bu:td>
		</tr>
		
		
		<!--8-->
		<tr>
	    		<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" ><bu:ui colNo="CFI_MEMO" formId="33982c650c8d435aacffbd806ed0103d" value="%{CFI_MEMO}" formIndex="1" style="height:80px;width:100%;"/></bu:td>
		</tr>
		
	 
	</table>
			<bu:jsVal formId="33982c650c8d435aacffbd806ed0103d" formIndex="1" />
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
                <bu:submit viewId="0678bf33e5264f339ba0eb3be93ca40f" />
		<bu:script viewId="0678bf33e5264f339ba0eb3be93ca40f" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		$("#paraMap1_CFO_ITEM_NAME").attr("disabled",false);
		$("#paraMap1_CFO_ITEM_SPEC").attr("disabled",false);
		$("#paraMap1_CFO_LEFT_TOP").attr("disabled",false);
		$("#paraMap1_CFO_RIGHT_TOP").attr("disabled",false);
		$("#paraMap1_CFO_LEFT_LOWER").attr("disabled",false);
		$("#paraMap1_CFO_RIGHT_LOWER").attr("disabled",false);
		$("#paraMap1_CFO_MIDDLE").attr("disabled",false);
		$("#paraMap1_CFO_TINCKNESS").attr("disabled",false);
		$("#paraMap1_CFO_FLATNESS").attr("disabled",false);
		
		$("#paraMap1_CFO_FIX_SN").attr("readonly","readonly");
		$("#paraMap1_CFO_FIX_SN").addClass("readonly");
		$("#paraMap1_CFO_ITEM_CODE").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CODE").addClass("readonly");  
		$("#paraMap1_CFO_ITEM_NAME").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_NAME").addClass("readonly");  
		$("#paraMap1_CFO_ITEM_SPEC").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_SPEC").addClass("readonly"); 
		$("#paraMap1_CFO_ITEM_CURUSER").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CURUSER").addClass("readonly"); 
        $("#paraMap1_CFO_STRAIN_DIS").attr("readonly","readonly");
	    $("#paraMap1_CFO_STRAIN_DIS").addClass("readonly");
        
        
        
        $("#paraMap1_CFO_FIX_SN").val('${dataMap.cfi_fix_sn}'); 
        $("#paraMap1_CFO_ITEM_CODE").val('${dataMap.cfi_item_code}');
        $("#paraMap1_CFO_ITEM_NAME").val('${dataMap.assistanttoolname}');
        $("#paraMap1_CFO_ITEM_SPEC").val('${dataMap.assistanttoolspec}');
        $("#paraMap1_CFO_LEFT_TOP").val('${dataMap.cfi_left_top}');
        $("#paraMap1_CFO_RIGHT_TOP").val('${dataMap.cfi_right_top}');
        $("#paraMap1_CFO_LEFT_LOWER").val('${dataMap.cfi_left_lower}');
        $("#paraMap1_CFO_RIGHT_LOWER").val('${dataMap.cfi_right_lower}');
        $("#paraMap1_CFO_MIDDLE").val('${dataMap.cfi_middle}');
        $("#paraMap1_CFO_ITEM_CURUSER").val('${dataMap.cfo_item_curuser}');
        $("#loginName").val('${dataMap.loginName}');
        $("#paraMap1_CFO_STRAIN_DIS").val('${dataMap.cfi_strain_dis}');
        $("#paraMap1_CFO_TINCKNESS").val('${dataMap.cfi_tinckness}');
        $("#paraMap1_CFO_FLATNESS").val('${dataMap.cfi_flatness}');
        
        $("#cfo_id").val('${dataMap.id}');
        $("#assis_type").val('${dataMap.assistanttooltype}');
        
        
        
        if($("#assis_type").val()!='2'){//为刮到不能修改这几个属性值
 
             	$("#paraMap1_CFO_LEFT_TOP").attr("readonly","readonly");
	         	$("#paraMap1_CFO_LEFT_TOP").addClass("readonly");
	         	
	         	$("#paraMap1_CFO_RIGHT_TOP").attr("readonly","readonly");
	         	$("#paraMap1_CFO_RIGHT_TOP").addClass("readonly");
	         	
	         	
	         	$("#paraMap1_CFO_LEFT_LOWER").attr("readonly","readonly");
	         	$("#paraMap1_CFO_LEFT_LOWER").addClass("readonly");
	         	
	         	
	         	$("#paraMap1_CFO_RIGHT_LOWER").attr("readonly","readonly");
	         	$("#paraMap1_CFO_RIGHT_LOWER").addClass("readonly");
	         	
	         	$("#paraMap1_CFO_MIDDLE").attr("readonly","readonly");
	         	$("#paraMap1_CFO_MIDDLE").addClass("readonly");
	         	
	         	
        }
        
        
        
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	$('#paraMap1_CFO_LEFT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_LEFT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_LEFT_TOP'),"<dict:lang value="该项只能为正整数" />");
             }
         });
		
		$('#paraMap1_CFO_RIGHT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_RIGHT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_RIGHT_TOP'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFO_MIDDLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_MIDDLE");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_MIDDLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFO_LEFT_LOWER').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CFO_LEFT_LOWER");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_LEFT_LOWER'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFO_RIGHT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_RIGHT_LOWER");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_RIGHT_LOWER'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         $('#paraMap1_CFO_TINCKNESS').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_TINCKNESS");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_TINCKNESS'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         $('#paraMap1_CFO_FLATNESS').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFO_FLATNESS");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFO_FLATNESS'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         function fixBack(){
            $('#paraMap1_CFO_OPEATOR_SHOW').addClass('_VAL_NULL');
           if(!val.valNullData()){ 
            	return ;
            }
            if(!val.valDataBaseSetData()){
		        return ;
	        }
              if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
            	$("#addForm").append($("#isCloseWin").clone());
            	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
              }
                document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=f293ccd8564e4a6ab3f36cedd7775d9c"; 
                document.forms.addForm.submit();
            
            }
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="pageOver" />
  	</jsp:include>
