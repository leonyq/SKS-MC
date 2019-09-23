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
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd"  style="height: 310px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="fe2f562eab2645eea5c2c4131957c06c" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="fe2f562eab2645eea5c2c4131957c06c" />
	<input type="hidden" name="fe2f562eab2645eea5c2c4131957c06c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e65332ea50cf4d539f18194097c827d0'" />
		<s:set name="_$formId_1" value="'fe2f562eab2645eea5c2c4131957c06c'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width: 100px;" /><span class="dot">*</span><bu:uitn colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_TEST_STEP}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 110px;"/><span class="dot">*</span><bu:uitn colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_SAMPLE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_PRICESS_MODE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_CREATE_MODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DIVIDE_MODE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_VALUE"  formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DIVIDE_VALUE}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_JUDGE_MODE}" formIndex="1" /></bu:td>
		
			<!--<td class="name" /><bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_AUTO_EXAMINE}" formIndex="1" /></bu:td>
			-->
			
			<td style="width: 90px;text-align: right;">
				<bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DEFAULT_FLAG}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" />
				<bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_AUTO_EXAMINE}" formIndex="1" />
			</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_CTRL_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_STRICT_NORMAL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_NORMAL_RELAX}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_RELAX_NORMAL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_STRICT_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_STRICT_TOTAL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_CREATE_RULE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="fe2f562eab2645eea5c2c4131957c06c" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="e65332ea50cf4d539f18194097c827d0" />
	<bu:script viewId="e65332ea50cf4d539f18194097c827d0" />
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>
       $("#paraMap1_QSC_STRICT_NORMAL").val("0");
       $("#paraMap1_QSC_STRICT_NORMAL").attr("readonly", "readonly");
       $("#paraMap1_QSC_NORMAL_RELAX").val("0");
       $("#paraMap1_QSC_NORMAL_RELAX").attr("readonly", "readonly");
       $("#paraMap1_QSC_RELAX_NORMAL").val("0");
       $("#paraMap1_QSC_RELAX_NORMAL").attr("readonly", "readonly");
       $("#paraMap1_QSC_STRICT_NUM").val("0");
       $("#paraMap1_QSC_STRICT_NUM").attr("readonly", "readonly");
       $("#paraMap1_QSC_STRICT_TOTAL").val("0");
       $("#paraMap1_QSC_STRICT_TOTAL").attr("readonly", "readonly");
       $("#paraMap1_QSC_CTRL_FLAG_1").on("click",function(){
       	   var check=$("#paraMap1_QSC_CTRL_FLAG_1").attr("checked") ;
       	   if(check=="checked"){
       	        //勾
       	        $("#paraMap1_QSC_STRICT_NORMAL").val("");
       	        $("#paraMap1_QSC_STRICT_NORMAL").removeAttr("readonly");
       	        $("#paraMap1_QSC_NORMAL_RELAX").val("");
       	        $("#paraMap1_QSC_NORMAL_RELAX").removeAttr("readonly");
       	        $("#paraMap1_QSC_RELAX_NORMAL").val("");
       	        $("#paraMap1_QSC_RELAX_NORMAL").removeAttr("readonly");
       	        $("#paraMap1_QSC_STRICT_NUM").val("");
       	        $("#paraMap1_QSC_STRICT_NUM").removeAttr("readonly");
       	        $("#paraMap1_QSC_STRICT_TOTAL").val("");
       	        $("#paraMap1_QSC_STRICT_TOTAL").removeAttr("readonly");
       	   }else{
       	        //未勾
       	        $("#paraMap1_QSC_STRICT_NORMAL").val("0");
       	        $("#paraMap1_QSC_STRICT_NORMAL").attr("readonly", "readonly");
       	        $("#paraMap1_QSC_NORMAL_RELAX").val("0");
       	        $("#paraMap1_QSC_NORMAL_RELAX").attr("readonly", "readonly");
       	        $("#paraMap1_QSC_RELAX_NORMAL").val("0");
       	        $("#paraMap1_QSC_RELAX_NORMAL").attr("readonly", "readonly");
       	        $("#paraMap1_QSC_STRICT_NUM").val("0");
       	        $("#paraMap1_QSC_STRICT_NUM").attr("readonly", "readonly");
       	        $("#paraMap1_QSC_STRICT_TOTAL").val("0");
       	        $("#paraMap1_QSC_STRICT_TOTAL").attr("readonly", "readonly");
       	   }
       });
       
       $('#paraMap1_QSC_DIVIDE_MODE').on("change",function(){
       		$('#paraMap1_QSC_DIVIDE_VALUE').val("");
       });
       
       $('#paraMap1_QSC_DIVIDE_VALUE').change(function() {
			
			var divideModeVal = $.trim($("#paraMap1_QSC_DIVIDE_MODE").val());
			if(divideModeVal=="2"){
			      if(!/^-?\d*\.?\d*$/.test(this.value)) {
				this.value='';
				_alertValMsg($('#paraMap1_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数或小数" />");
			      }
			}else{
			      if(!/^-?\d*$/.test(this.value)) {
				this.value='';
				_alertValMsg($('#paraMap1_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数" />");
			      }
			}
			
		});
       
       function checkInfo(){
                       if($("#paraMap1_QSC_CTRL_FLAG_1").attr("checked")=="checked"){
                                  var sn=$("#paraMap1_QSC_STRICT_NORMAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(sn)&& !/^$/.test(sn) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_NORMAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(sn) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_NORMAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var nr=$("#paraMap1_QSC_NORMAL_RELAX").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(nr)&& !/^$/.test(nr) ){
                                         _alertValMsg($("#paraMap1_QSC_NORMAL_RELAX"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(nr) ){
                                         _alertValMsg($("#paraMap1_QSC_NORMAL_RELAX"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var rn=$("#paraMap1_QSC_RELAX_NORMAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(rn)&& !/^$/.test(rn) ){
                                         _alertValMsg($("#paraMap1_QSC_RELAX_NORMAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(rn) ){
                                         _alertValMsg($("#paraMap1_QSC_RELAX_NORMAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var snum=$("#paraMap1_QSC_STRICT_NUM").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(snum)&& !/^$/.test(snum) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_NUM"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(snum) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_NUM"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  var stotal=$("#paraMap1_QSC_STRICT_TOTAL").val();
                                  if( !/^\+?[1-9][0-9]*$/.test(stotal)&& !/^$/.test(stotal) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_TOTAL"),"<dict:lang value="该项只能输入正整数" />");
                                         return false;
                                  }
                                  if( /^$/.test(stotal) ){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_TOTAL"),"<dict:lang value="该项不能为空" />");
                                         return false;
                                  }
                                  if(stotal<snum){
                                         _alertValMsg($("#paraMap1_QSC_STRICT_NUM"),"<dict:lang value="加严不合格批次不能大于加严计算批次" />");
                                         return false;                                          
                                  }
                        } 
                           
       }
       function saveInfo(){
            if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
			
			if(!val.valDataBaseSetData()){
        		return ;
        	}
        	
			
			var divideModeVal = $.trim($("#paraMap1_QSC_DIVIDE_MODE").val());
			if(divideModeVal=="2"){
			      if(!/^-?\d*\.?\d*$/.test($('#paraMap1_QSC_DIVIDE_VALUE').val())) {
				$('#paraMap1_QSC_DIVIDE_VALUE').val("");
				_alertValMsg($('#paraMap1_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数或小数" />");
			      }
			}else{
			      if(!/^-?\d*$/.test($('#paraMap1_QSC_DIVIDE_VALUE').val())) {
				$('#paraMap1_QSC_DIVIDE_VALUE').val("");
				_alertValMsg($('#paraMap1_QSC_DIVIDE_VALUE'), "<dict:lang value="该项只能为正整数" />");
			      }
			}
			
		
                        var flag=checkInfo();
                        if(flag!=false){
                          $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			  $DisInput.attr("disabled", false); 
                          if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				  $("#addForm").append($("#isCloseWin").clone());
				  $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			  }
			  $("#saveBtn").prop("disabled","disabled");
                   
                          document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=778a8faedd574db48248ad833cb1f51d";
       
			  document.forms.addForm.submit();
			  isQuery = true;
			  $DisInput.attr("disabled", true);       
                        }
}
</script>	
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
