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
	<style>
        .maskdiv{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:310px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="a62aa1e0249f4e2a8a049e7121acc6ce" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="a62aa1e0249f4e2a8a049e7121acc6ce" />
	<input type="hidden" name="a62aa1e0249f4e2a8a049e7121acc6ce" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'663b75cedf974bcea85a4915ccac72a8'" />
		<s:set name="_$formId_1" value="'a62aa1e0249f4e2a8a049e7121acc6ce'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_PICK_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_DOC}" formIndex="1" />
			<div id="maskdiv1"></div>
			</bu:td>
		
		</tr>

		<tr>
			<td class="name" /><bu:uitn colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_ITEM_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_CUST_CODE}" formIndex="1" />
			<div id="maskdiv2"></div>
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_SCHEME_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPC_SCHEME_MEMO" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_SCHEME_MEMO" formId="a62aa1e0249f4e2a8a049e7121acc6ce" style="height:80px;" colspan="3"><bu:ui colNo="WPC_SCHEME_MEMO" style="height:100%;width:100%;" formId="a62aa1e0249f4e2a8a049e7121acc6ce" value="%{WPC_SCHEME_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="a62aa1e0249f4e2a8a049e7121acc6ce" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="663b75cedf974bcea85a4915ccac72a8" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
<script type="text/javascript">
$(function(){
	
	$("#paraMap1_WPC_PICK_TYPE").attr("onchange","changeState();");
	$("#paraMap1_WPC_SCHEME_SN").attr("onchange","getMemo();");
	changeState();
})
function changeState(){
	var ctrlType = $("#paraMap1_WPC_PICK_TYPE").val();
	if(ctrlType==1){
		$("#paraMap1_WPC_DOC_SHOW").removeAttr("disabled");
		$("#maskdiv2").removeClass("maskdiv");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").val("");
		$("#paraMap1_WPC_ITEM_CODE").val("");
		$("#paraMap1_WPC_CUST_CODE_SHOW").val("");
		$("#paraMap1_WPC_CUST_CODE").val("");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").attr("disabled","disabled");
		$("#paraMap1_WPC_CUST_CODE_SHOW").attr("disabled","disabled");
		$("#maskdiv2").addClass("maskdiv");
	    $("#paraMap1_WPC_ITEM_CODE_SHOW").css("background-color","#ebebe4");
	}else if(ctrlType==2){
		$("#paraMap1_WPC_DOC_SHOW").val("");
		$("#paraMap1_WPC_DOC").val("");
		$("#paraMap1_WPC_DOC_SHOW").attr("disabled","disabled");
        $("#maskdiv1").addClass("maskdiv");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").removeAttr("disabled");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").css("background-color","#fff");
		$("#paraMap1_WPC_CUST_CODE_SHOW").attr("disabled","disabled");
        $("#maskdiv2").addClass("maskdiv");
		$("#paraMap1_WPC_CUST_CODE_SHOW").val("");
		$("#paraMap1_WPC_CUST_CODE").val("");
	}else if(ctrlType==3){
		$("#paraMap1_WPC_DOC_SHOW").val("");
		$("#paraMap1_WPC_DOC").val("");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").val("");
		$("#paraMap1_WPC_ITEM_CODE").val("");
		$("#paraMap1_WPC_DOC_SHOW").attr("disabled","disabled");
        $("#maskdiv1").addClass("maskdiv");
		$("#paraMap1_WPC_ITEM_CODE_SHOW").attr("disabled","disabled");
        $("#paraMap1_WPC_ITEM_CODE_SHOW").css("background-color","#ebebe4");
		$("#paraMap1_WPC_CUST_CODE_SHOW").removeAttr("disabled");
		$("#maskdiv2").removeClass("maskdiv");
	}
}
function getMemo(){
	var schemeSn = $("#paraMap1_WPC_SCHEME_SN").val();
	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=d10509d3094c48878b4f87f7213ca381",
			    data:{
			        "schemeSn":schemeSn
			    },
			    success: function(data){
			    			$("#paraMap1_WPC_SCHEME_MEMO").val("");
						if(null == data){return ;}
						if(""!= data.ajaxList){
							var rccList = eval(data.ajaxList);
							$("#paraMap1_WPC_SCHEME_MEMO").val(rccList[0].WPS_MEMO);
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
			var ctrlType = $("#paraMap1_WPC_PICK_TYPE").val();
	if(ctrlType==1){
		if($("#paraMap1_WPC_DOC").val()=="" || $("#paraMap1_WPC_DOC").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="仓库单据不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMap1_WPC_SCHEME_SN").val()=="" || $("#paraMap1_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}else if(ctrlType==2){
		if($("#paraMap1_WPC_ITEM_CODE").val()=="" || $("#paraMap1_WPC_ITEM_CODE").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种/物料不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMap1_WPC_SCHEME_SN").val()=="" || $("#paraMap1_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}else if(ctrlType==3){
	    if($("#paraMap1_WPC_CUST_CODE").val()=="" || $("#paraMap1_WPC_CUST_CODE").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="客户不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMap1_WPC_SCHEME_SN").val()=="" || $("#paraMap1_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}
			$("#saveBtn").prop("disabled","disabled");

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=efc0251750514c028b831ec9333dff6c";
                        document.forms.addForm.submit();
                        isQuery = true;
}
</script>
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
