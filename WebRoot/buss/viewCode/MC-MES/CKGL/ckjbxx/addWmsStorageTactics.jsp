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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 300px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="e517a4b8c2a44f9695a6415348789dac" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e517a4b8c2a44f9695a6415348789dac" />
	<input type="hidden" name="e517a4b8c2a44f9695a6415348789dac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c086474e546a4df1a4178cbca5b75a04'" />
		<s:set name="_$formId_1" value="'e517a4b8c2a44f9695a6415348789dac'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" style="width:262px;" colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WAREHOUSE" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_WAREHOUSE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WARE_AREA" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_WARE_AREA}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_WARE_SITE" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_WARE_SITE}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_CONTRAL_TYPE}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td id="itemTypeCtrl" cssClass="dec" colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_CONTRAL_VALUE}" formIndex="1" /></bu:td>
			<bu:td id="itemCodeCtrl" cssClass="dec" colNo="WST_ITEMCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_ITEMCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_ITEMCODE_CTRL}" formIndex="1" /></bu:td>
			<bu:td id="supCodeCtrl" cssClass="dec" colNo="WST_SUPCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_SUPCODE_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_SUPCODE_CTRL}" formIndex="1" /></bu:td>
			<bu:td id="custCtrl" cssClass="dec" colNo="WST_CUST_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_CUST_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_CUST_CTRL}" formIndex="1" /></bu:td>
			<bu:td id="lotCtrl" cssClass="dec" colNo="WST_LOT_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_LOT_CTRL" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_LOT_CTRL}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" >
			<bu:ui colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_VALID_FLAG}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WST_EFFECTIVE_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" />
			<bu:ui colNo="WST_EFFECTIVE_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_EFFECTIVE_FLAG}" formIndex="1" />
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_BEGIN_TIME}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" ><bu:ui colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_END_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WST_MEMO" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<bu:td cssClass="dec" colNo="WST_MEMO" formId="e517a4b8c2a44f9695a6415348789dac" style="height:80px;" colspan="3" ><bu:ui colNo="WST_MEMO" style="height:100%;width:98%;" formId="e517a4b8c2a44f9695a6415348789dac" value="%{WST_MEMO}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="e517a4b8c2a44f9695a6415348789dac" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="c086474e546a4df1a4178cbca5b75a04" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
	$(function(){
		$("#itemCodeCtrl").attr("style","display:none");
		$("#supCodeCtrl").attr("style","display:none");
		$("#custCtrl").attr("style","display:none");
		$("#lotCtrl").attr("style","display:none");
		$("#paraMap1_WST_CONTRAL_TYPE").attr("onchange","changeControl();");
		$("#paraMap1_WST_EFFECTIVE_FLAG_1").attr("onchange","changeCheckState();");
		
		$("#paraMap1_WST_WAREHOUSE").attr("onchange","_selectCascadNew(this.value,'paraMap1_WST_WAREHOUSE','8fcab7b60db24910b914196779fdede2','WST_WAREHOUSE','WST_WARE_AREA');getStorageCode();");
	    $("#paraMap1_WST_WARE_AREA").attr("onchange","getStorageCode();");
	})
	
	//根据仓库或者库区获取库位
function getStorageCode(){
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd&whCode="+$("#paraMap1_WST_WAREHOUSE").val()+"&DISTRICT_CODE="+$("#paraMap1_WST_WARE_AREA").val(),
			    data: "",
				success: function(data){	
                        util.closeLoading();
                        $("#paraMap1_WST_WARE_SITE").empty();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
							
             				$("#paraMap1_WST_WARE_SITE").append("<option value=''>--请选择--</option>");
             				$("#paraMap1_WST_WARE_SITE").append(tempOption);
             				$("#paraMap1_WST_WARE_SITE").trigger("chosen:updated");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
	
	function changeControl(){
		if($("#paraMap1_WST_CONTRAL_TYPE").val()==1){ //物料类型
			$("#itemTypeCtrl").attr("style","display:block");
			$("#paraMap1_WST_CONTRAL_VALUE").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_ITEMCODE_CTRL").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_SUPCODE_CTRL").val("");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMap1_WST_CUST_CTRL").val("");
			$("#paraMap1_WST_CUST_CTRL_SHOW").val("");
			$("#paraMap1_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMap1_WST_CONTRAL_TYPE").val()==2){ //物料代码
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMap1_WST_CONTRAL_VALUE").val("");
			$("#paraMap1_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMap1_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:block");
			$("#paraMap1_WST_ITEMCODE_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_SUPCODE_CTRL").val("");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMap1_WST_CUST_CTRL").val("");
			$("#paraMap1_WST_CUST_CTRL_SHOW").val("");
			$("#paraMap1_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMap1_WST_CONTRAL_TYPE").val()==3){ //供应商
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMap1_WST_CONTRAL_VALUE").val("");
			$("#paraMap1_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMap1_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_ITEMCODE_CTRL").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:block");
			$("#paraMap1_WST_SUPCODE_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMap1_WST_CUST_CTRL").val("");
			$("#paraMap1_WST_CUST_CTRL_SHOW").val("");
			$("#paraMap1_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMap1_WST_CONTRAL_TYPE").val()==4){ //客户
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMap1_WST_CONTRAL_VALUE").val("");
			$("#paraMap1_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMap1_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_ITEMCODE_CTRL").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_SUPCODE_CTRL").val("");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:block");
			$("#paraMap1_WST_CUST_CTRL").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_CUST_CTRL_SHOW").attr("class","_VAL_NULL input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:none");
		}else if($("#paraMap1_WST_CONTRAL_TYPE").val()==5){ //批次
			$("#itemTypeCtrl").attr("style","display:none");
			$("#paraMap1_WST_CONTRAL_VALUE").val("");
			$("#paraMap1_WST_CONTRAL_VALUE").trigger("chosen:updated");
			$("#paraMap1_WST_CONTRAL_VALUE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
			
			$("#itemCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_ITEMCODE_CTRL").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_ITEMCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_ITEMCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#supCodeCtrl").attr("style","display:none");
			$("#paraMap1_WST_SUPCODE_CTRL").val("");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").val("");
			$("#paraMap1_WST_SUPCODE_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_SUPCODE_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#custCtrl").attr("style","display:none");
			$("#paraMap1_WST_CUST_CTRL").val("");
			$("#paraMap1_WST_CUST_CTRL_SHOW").val("");
			$("#paraMap1_WST_CUST_CTRL").attr("class"," input isSubmit  _VAL_OjbsData");
			$("#paraMap1_WST_CUST_CTRL_SHOW").attr("class"," input  input isSubmit  _VAL_OjbsData ");
			
			$("#lotCtrl").attr("style","display:block");
			$("#paraMap1_WST_LOT_CTRL").val("只允许存在相同批次物料");
		}
	}
	
	function changeCheckState(){// input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly
		if($("#paraMap1_WST_EFFECTIVE_FLAG_1").attr("checked") == "checked"){
        		$("#paraMap1_WST_BEGIN_TIME").removeAttr("disabled");
        		$("#paraMap1_WST_END_TIME").removeAttr("disabled");
        		
        		$("#paraMap1_WST_BEGIN_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
        		$("#paraMap1_WST_END_TIME").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData isaddSubmit WdateNomorl");
        		
    		}else{
    			$("#paraMap1_WST_BEGIN_TIME").val("");
    		
    			$("#paraMap1_WST_END_TIME").val("");
    		
        		$("#paraMap1_WST_BEGIN_TIME").attr("disabled","disabled");
        		$("#paraMap1_WST_END_TIME").attr("disabled","disabled");
        		
        		$("#paraMap1_WST_BEGIN_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
        		$("#paraMap1_WST_END_TIME").attr("class","input isSubmit  _VAL_OjbsData readonly isaddSubmit WdateReadonly");
        		
    		}
	}
	
	function addCal(){
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
			$("#saveBtn").prop("disabled","disabled");
			            var startTime=new Date(Date.parse($("#paraMap1_WST_BEGIN_TIME").val().replace(/-/g,"/"))).getTime();
                        var endTime=new Date(Date.parse($("#paraMap1_WST_END_TIME").val().replace(/-/g,"/"))).getTime();
                        
                        if(startTime>endTime){
                          	 utilsFp.confirmIcon(1,"","","", "<dict:lang value="开始时间不能大于结束时间" />",0,"260","");
                          return;
                        }

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=886ea954052b48cfb724ed26ad660260";
                        document.forms.addForm.submit();
                        
    }
</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
