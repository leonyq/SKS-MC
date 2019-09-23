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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForms();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 300px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="e517a4b8c2a44f9695a6415348789dac" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="WST_WAREHOUSE" name="WST_WAREHOUSE" value="" />
	<input type="hidden" id="WST_WARE_AREA" name="WST_WARE_AREA" value="" />
	<input type="hidden" id="WST_WARE_SITE" name="WST_WARE_SITE" value="" />
	<input type="hidden" name="formIds" value="e517a4b8c2a44f9695a6415348789dac" />
	<input type="hidden" name="e517a4b8c2a44f9695a6415348789dac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'72a4c52ec4e9403f9fc608ed4b859846'" />
		<s:set name="_$formId_1" value="'e517a4b8c2a44f9695a6415348789dac'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" style="width:262px;" colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td id="itemTypeCtrl" cssClass="dec" colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			<bu:td id="itemCodeCtrl" cssClass="dec" colNo="WST_ITEMCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_ITEMCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			<bu:td id="supCodeCtrl" cssClass="dec" colNo="WST_SUPCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_SUPCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			<bu:td id="custCtrl" cssClass="dec" colNo="WST_CUST_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CUST_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			<bu:td id="lotCtrl" cssClass="dec" colNo="WST_LOT_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_LOT_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" >
			<bu:ui colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WST_EFFECTIVE_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" />
			<bu:ui colNo="WST_EFFECTIVE_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" />
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_MEMO" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_MEMO" formId="e517a4b8c2a44f9695a6415348789dac" style="height:80px;" colspan="3" ><bu:ui colNo="WST_MEMO" style="height:100%;width:98%;" formId="e517a4b8c2a44f9695a6415348789dac" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="e517a4b8c2a44f9695a6415348789dac" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="72a4c52ec4e9403f9fc608ed4b859846" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
	$(function(){
		getNew();
	});
	function getNew(){
	    $("#paraMapObj_WST_CONTRAL_TYPE").attr("onchange","changeControl();");
		$("#paraMapObj_WST_EFFECTIVE_FLAG_1").attr("onchange","changeCheckState();");
		var ctrlType = $("#paraMapObj_WST_CONTRAL_TYPE").val();
		var ctrlValue = $("#paraMapObj_WST_CONTRAL_VALUE").val();
		if(ctrlType==1){  //物料类型
			$("#itemTypeCtrl").attr("style","display:block");
			$("#itemCodeCtrl").attr("style","display:none");
			$("#supCodeCtrl").attr("style","display:none");
			$("#custCtrl").attr("style","display:none");
			$("#lotCtrl").attr("style","display:none");
		}else if(ctrlType==2){ //物料代码
			$("#paraMapObj_WST_ITEMCODE_CTRL").val('${dataMap.ctrlValue}');
			//$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").val('${dataMap.ctrlValue}');
			$("#itemTypeCtrl").attr("style","display:none");
			$("#itemCodeCtrl").attr("style","display:block");
			$("#supCodeCtrl").attr("style","display:none");
			$("#custCtrl").attr("style","display:none");
			$("#lotCtrl").attr("style","display:none");
		}else if(ctrlType==3){ //供应商
			$("#paraMapObj_WST_SUPCODE_CTRL").val('${dataMap.ctrlValue}');
			//$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").val('${dataMap.ctrlValue}');
			$("#itemTypeCtrl").attr("style","display:none");
			$("#itemCodeCtrl").attr("style","display:none");
			$("#supCodeCtrl").attr("style","display:block");
			$("#custCtrl").attr("style","display:none");
			$("#lotCtrl").attr("style","display:none");
		}else if(ctrlType==4){ //客户
			$("#paraMapObj_WST_CUST_CTRL").val('${dataMap.ctrlValue}');
			//$("#paraMapObj_WST_CUST_CTRL_SHOW").val('${dataMap.ctrlValue}');
			$("#itemTypeCtrl").attr("style","display:none");
			$("#itemCodeCtrl").attr("style","display:none");
			$("#supCodeCtrl").attr("style","display:none");
			$("#custCtrl").attr("style","display:block");
			$("#lotCtrl").attr("style","display:none");
		}else if(ctrlType==5){ //批次
			$("#itemTypeCtrl").attr("style","display:none");
			$("#itemCodeCtrl").attr("style","display:none");
			$("#supCodeCtrl").attr("style","display:none");
			$("#custCtrl").attr("style","display:none");
			$("#lotCtrl").attr("style","display:block");
			$("#paraMapObj_WST_LOT_CTRL").val("只允许存在相同批次物料");
		}
		changeCheckState();
		setWmsInfo();
		changeControl();
	}
	
	function resetForms(){
	                			
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                        changeControl();
                    }
	function changeControl(){
		if($("#paraMapObj_WST_CONTRAL_TYPE").val()==1){ //物料类型
			$("#itemTypeCtrl").attr("style","display:block");
			$("#paraMapObj_WST_CONTRAL_VALUE").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData dept_select");
			$("#paraMapObj_WST_CONTRAL_VALUE_chosen").attr("style","width:230px;");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_ITEMCODE_CTRL").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_SUPCODE_CTRL").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CUST_CTRL").val("");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").val("");
			$("#paraMapObj_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMapObj_WST_CONTRAL_TYPE").val()==2){ //物料代码
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CONTRAL_VALUE").val("");
			$("#paraMapObj_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMapObj_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:block");
			$("#paraMapObj_WST_ITEMCODE_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_SUPCODE_CTRL").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CUST_CTRL").val("");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").val("");
			$("#paraMapObj_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMapObj_WST_CONTRAL_TYPE").val()==3){ //供应商
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CONTRAL_VALUE").val("");
			$("#paraMapObj_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMapObj_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_ITEMCODE_CTRL").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:block");
			$("#paraMapObj_WST_SUPCODE_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CUST_CTRL").val("");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").val("");
			$("#paraMapObj_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMapObj_WST_CONTRAL_TYPE").val()==4){ //客户
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CONTRAL_VALUE").val("");
			$("#paraMapObj_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMapObj_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_ITEMCODE_CTRL").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_SUPCODE_CTRL").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:block");
			$("#paraMapObj_WST_CUST_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMapObj_WST_CONTRAL_TYPE").val()==5){ //批次
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CONTRAL_VALUE").val("");
			$("#paraMapObj_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMapObj_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_ITEMCODE_CTRL").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMapObj_WST_SUPCODE_CTRL").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMapObj_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMapObj_WST_CUST_CTRL").val("");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").val("");
			$("#paraMapObj_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMapObj_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:block");
			$("#paraMapObj_WST_LOT_CTRL").val("只允许存在相同批次物料");
		}
	}
	function changeCheckState(){// input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly
		if($("#paraMapObj_WST_EFFECTIVE_FLAG_1").attr("checked") == "checked"){
        		$("#paraMapObj_WST_BEGIN_TIME").removeAttr("disabled");
        		$("#paraMapObj_WST_END_TIME").removeAttr("disabled");
        		
        		$("#paraMapObj_WST_BEGIN_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
        		$("#paraMapObj_WST_END_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
        		
    		}else{
    			$("#paraMapObj_WST_BEGIN_TIME").val("");
    		
    			$("#paraMapObj_WST_END_TIME").val("");
    		
        		$("#paraMapObj_WST_BEGIN_TIME").attr("disabled","disabled");
        		$("#paraMapObj_WST_END_TIME").attr("disabled","disabled");
        		
        		$("#paraMapObj_WST_BEGIN_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
        		$("#paraMapObj_WST_END_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
        		
    		}
	}
	
	//回填仓库相关信息
	function setWmsInfo(){
		var WST_WAREHOUSE_NAME = '${dataMap.WST_WAREHOUSE_NAME}';
		var areaType = '${dataMap.areaType}';
		var WST_WARE_AREA_NAME = '${dataMap.WST_WARE_AREA_NAME}';
		var WST_WARE_SITE_NAME = '${dataMap.WST_WARE_SITE_NAME}';
		$("#WST_WAREHOUSE").val('${dataMap.WST_WAREHOUSE}');
		$("#WST_WARE_AREA").val('${dataMap.WST_WARE_AREA}');
		$("#WST_WARE_SITE").val('${dataMap.WST_WARE_SITE}');
		$("#paraMapObj_WST_WAREHOUSE").empty();
 		$("#paraMapObj_WST_WAREHOUSE").append("<option value='${dataMap.WST_WAREHOUSE}'>"+WST_WAREHOUSE_NAME+"</option>");
 		$("#paraMapObj_WST_WAREHOUSE").attr("disabled","disabled");
 		$("#paraMapObj_WST_WAREHOUSE").trigger("chosen:updated");
 		//库区
 		$("#paraMapObj_WST_WARE_AREA").empty();
 		if(WST_WARE_AREA_NAME=="")  WST_WARE_AREA_NAME = "--请选择--";
 		$("#paraMapObj_WST_WARE_AREA").append("<option value='${dataMap.WST_WARE_AREA}'>"+WST_WARE_AREA_NAME+"</option>");
 		$("#paraMapObj_WST_WARE_AREA").attr("disabled","disabled");
 		$("#paraMapObj_WST_WARE_AREA").trigger("chosen:updated");
 		//库位
 		$("#paraMapObj_WST_WARE_SITE").empty();
 		if(WST_WARE_SITE_NAME=="")  WST_WARE_SITE_NAME = "--请选择--";
 		$("#paraMapObj_WST_WARE_SITE").append("<option value='${dataMap.WST_WARE_SITE}'>"+WST_WARE_SITE_NAME+"</option>");
 		$("#paraMapObj_WST_WARE_SITE").attr("disabled","disabled");
 		$("#paraMapObj_WST_WARE_SITE").trigger("chosen:updated");
 		/*if(WST_WARE_AREA_NAME!=""&&areaType=="2"){
 			$("#paraMapObj_WST_WARE_AREA").empty();
 			$("#paraMapObj_WST_WARE_AREA").append("<option value='${dataMap.WST_WARE_AREA}'>"+WST_WARE_AREA_NAME+"</option>");
 			$("#paraMapObj_WST_WARE_AREA").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_AREA").trigger("chosen:updated");
 		}else{
 			$("#paraMapObj_WST_WARE_AREA").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_AREA").trigger("chosen:updated");
 		}
 		if(WST_WARE_AREA_NAME!=""&&areaType=="3"){
 			$("#paraMapObj_WST_WARE_SITE").empty();
 			$("#paraMapObj_WST_WARE_SITE").append("<option value='${dataMap.WST_WARE_AREA}'>"+WST_WARE_AREA_NAME+"</option>");
 			$("#paraMapObj_WST_WARE_SITE").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_SITE").trigger("chosen:updated");
 		}else{
 			$("#paraMapObj_WST_WARE_SITE").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_SITE").trigger("chosen:updated");
 		}
 		if(WST_WARE_SITE_NAME!=""){
 			$("#paraMapObj_WST_WARE_SITE").empty();
 			$("#paraMapObj_WST_WARE_SITE").append("<option value='${dataMap.WST_WARE_SITE}'>"+WST_WARE_SITE_NAME+"</option>");
 			$("#paraMapObj_WST_WARE_SITE").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_SITE").trigger("chosen:updated");
 		}else{
 			$("#paraMapObj_WST_WARE_SITE").attr("disabled","disabled");
 			$("#paraMapObj_WST_WARE_SITE").trigger("chosen:updated");
 		}*/
	}
	
	function editCal(){
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
                        var startTime=new Date(Date.parse($("#paraMapObj_WST_BEGIN_TIME").val().replace(/-/g,"/"))).getTime();
                        var endTime=new Date(Date.parse($("#paraMapObj_WST_END_TIME").val().replace(/-/g,"/"))).getTime();
                        
                        if(startTime>endTime){
                          	 utilsFp.confirmIcon(1,"","","", "<dict:lang value="开始时间不能大于结束时间" />",0,"260","");
                          return;
                        }
                        
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e646d5ed511047e6a154b0d2d2689fe0";
  document.forms.editForm.submit();
}
</script>
	<!-- js初始化方法 -->
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
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
