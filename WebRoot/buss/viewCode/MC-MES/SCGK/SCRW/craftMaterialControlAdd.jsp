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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:450px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="99c3f63c8b62498589698545e9de3b18" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99c3f63c8b62498589698545e9de3b18" />
	<input type="hidden" name="99c3f63c8b62498589698545e9de3b18" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CTI_ITEM_CODE" name="paraMap1@0#CTI_ITEM_CODE">
	<input type="hidden" id="bomId" value="">
		<s:set name="_$viewId" value="'38e8be0740bc452ca07f7b6b63c74002'" />
		<s:set name="_$formId_1" value="'99c3f63c8b62498589698545e9de3b18'" />
		<s:set name="_$type" value="'add'" />
		<input type="hidden" name="paraMap2.type" value="add" />
			<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_MODEL_CODE}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_TYPE}" formIndex="1" onchange="itemOrAssis();"/></bu:td>
			</tr>
		<tr>
			<td class="name" style="width:70px;"><dict:lang value="机种名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="MODEL_NAME" name="MODEL_NAME" disabled="disabled"/></td>
		
			<td class="name" style="width:70px;"><dict:lang value="机种规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="MODEL_GUIGE" name="MODEL_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td id="ctiItemCode" cssClass="dec" colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_CTRL}" formIndex="2" /></bu:td>
			<bu:td id="ctiAssisCode" cssClass="dec" colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ></div><bu:ui colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSIS_CTRL}" formIndex="2" /></bu:td>
			
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_CONTROL_MODE}" formIndex="1" /></bu:td>
			</tr>
		<tr>
			<td class="name" style="width:70px;"><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_NAME" name="ITEM_NAME" disabled="disabled" /></td>
		
			<td class="name" style="width:70px;"><dict:lang value="物料规格" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_GUIGE" name="ITEM_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_PRODUCT_STEP}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_GROUP}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSY_SEQ}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSB_QTY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_PROCESS_FACE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"><bu:uitn colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18"><bu:ui colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_SN_RULE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_SOURCE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18"><bu:ui colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSY_MESSAGE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:70px;"><bu:uitn colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" colspan="3"><bu:ui colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_MEMO}" style="width:100%;height:80px;" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="99c3f63c8b62498589698545e9de3b18" formIndex="1" />
				
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script type="text/javascript">

	function itemOrAssis(){
		if ($("#paraMap1_CTI_ITEM_TYPE").val()=="0") {
			$("#paraMap1_CTI_ITEM_CODE").val("");
			$("#paraMap2_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMap2_CTI_ASSIS_CTRL_SHOW").val("");
			//$("#ctiItemCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiItemCode").style.display = "block";
			document.getElementById("ctiAssisCode").style.display = "none";
		}else if ($("#paraMap1_CTI_ITEM_TYPE").val()=="1") {
			$("#paraMap1_CTI_ITEM_CODE").val("");
			
			$("#paraMap2_CTI_ASSIS_CTRL_SHOW").val("");
			$("#paraMap2_CTI_ITEM_CTRL_SHOW").val("");
			//$("#ctiAssisCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiAssisCode").style.display = "block";
			document.getElementById("ctiItemCode").style.display = "none";
		}
     	$("#paraMap1_CTI_ITEM_TYPE").trigger("chosen:updated");
	}
var str = "";
window.onload = function(){
	str = "<dict:lang value="请输入管控物料" /> | ";
	document.getElementById("ctiAssisCode").style.display = "none";
	//document.getElementById("paraMap2_CTI_ITEM_CTRL_SHOW").disabled = true;
	$("#paraMap1_CTI_PRODUCT_STEP").find("option[value='']").remove();
    $("#paraMap1_CTI_PRODUCT_STEP").trigger("chosen:updated");
	getGroup();
	$("#paraMap1_CTI_ASSY_MESSAGE").val(str);
};

       function getGroup(){
        	//var url = routeService();
        	if($("#paraMap1_CTI_PRODUCT_STEP").val() != ""){
        	    $("#paraMap1_CTI_GROUP").attr("disabled",false);
     			$("#paraMap1_CTI_GROUP").trigger("chosen:updated");
        	}
        	var top = 5;
        	util.showTopLoading();
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?funcMId=7242147fdce040e8b6722b66e1f0c6ca",
     		    data:{
     		      'routeStep':$("#paraMap1_CTI_PRODUCT_STEP").val(),
     		      'flag':'getGroup'
     		    },
     			success: function(data){
     					util.closeLoading();
     					$("#paraMap1_CTI_GROUP").empty();
     					var html = "";
     					var getGroupLs = data.groupList;
     					if(getGroupLs != null && getGroupLs != ""){
     						for ( var i = 0; i < getGroupLs.length; i++) {
     						    html = html + "<option value='"+getGroupLs[i].GROUP_CODE+"' >"+getGroupLs[i].GROUP_NAME+"</option>";
     							//$("#paraMap1_CTI_GROUP").append("<option value='"+data.ajaxList[i].GROUP_CODE+"' >"+data.ajaxList[i].GROUP_NAME+"</option>");			
     					}
     					$("#paraMap1_CTI_GROUP").append(html);
     					$("#paraMap1_CTI_GROUP").trigger("chosen:updated");
						}
     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					util.closeLoading();
     					//utilsFp.alert("error:"+msg);
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     				}
     			  }
     			});		
     					$("#paraMap1_CTI_GROUP").trigger("chosen:updated");
        }

		function alertInfo(msg){
			isQuery = false;
               	 	utilsFp.confirmIcon(1,"","","", msg,"","340","145");
		}
		$(function(){
		    //$('#paraMap2_CTI_ITEM_CTRL_SHOW').addClass('_VAL_NULL input  input isSubmit  _VAL_OjbsData clearField _VAL_DATABASE ico-search-input'); 
		    $('#MODEL_NAME').addClass(' input readonly isSubmit '); 
          $('#MODEL_GUIGE').addClass('input readonly isSubmit'); 
           $('#ITEM_NAME').addClass('input readonly isSubmit'); 
            $('#ITEM_GUIGE').addClass('input readonly isSubmit'); 
		})
	    function add(thisObj){
		 
			//isQuery = false;
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
			document.forms.addForm.submit();
			//isQuery = true;
			$DisInput.attr("disabled", true);
		}

		
</script>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
