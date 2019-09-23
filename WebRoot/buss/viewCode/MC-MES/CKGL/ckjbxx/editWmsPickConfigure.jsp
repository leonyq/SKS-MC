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
        					<button type="button" onclick="resetForm1();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:310px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="a62aa1e0249f4e2a8a049e7121acc6ce" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="PICK_VALUE" name="PICK_VALUE" value="" />
	<input type="hidden" name="formIds" value="a62aa1e0249f4e2a8a049e7121acc6ce" />
	<input type="hidden" name="a62aa1e0249f4e2a8a049e7121acc6ce" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'24ab3a048930449a8214888479944feb'" />
		<s:set name="_$formId_1" value="'a62aa1e0249f4e2a8a049e7121acc6ce'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_DOC" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" />
			<div class="maskdiv"></div>
			</bu:td>
		
		</tr>

		<tr>
			<td class="name" /><bu:uitn colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_ITEM_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_CUST_CODE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" />
			<div class="maskdiv"></div>
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" ><bu:ui colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPC_SCHEME_MEMO" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_SCHEME_MEMO" formId="a62aa1e0249f4e2a8a049e7121acc6ce" style="height:80px;" colspan="3"><bu:ui colNo="WPC_SCHEME_MEMO" style="height:100%;width:100%;" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none">
			<td class="name" /><bu:uitn colNo="WPC_PICK_VALUE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<bu:td cssClass="dec" colNo="WPC_PICK_VALUE" formId="a62aa1e0249f4e2a8a049e7121acc6ce"><bu:ui colNo="WPC_PICK_VALUE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="a62aa1e0249f4e2a8a049e7121acc6ce" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="24ab3a048930449a8214888479944feb" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	
	$("#paraMapObj_WPC_DOC_SHOW").attr("disabled","disabled");
	$("#paraMapObj_WPC_ITEM_CODE_SHOW").attr("disabled","disabled");
	$("#paraMapObj_WPC_CUST_CODE_SHOW").attr("disabled","disabled");
	$("#paraMapObj_WPC_ITEM_CODE_SHOW").css("background-color","#ebebe4");
	var ctrlType = $("#paraMapObj_WPC_PICK_TYPE").val();
	var ctrlValue = $("#paraMapObj_WPC_PICK_VALUE").val();
	$("#PICK_VALUE").val(ctrlValue);
	if(ctrlType==1){
		//$("#paraMapObj_WPC_DOC_SHOW").val(ctrlValue);
		$("#paraMapObj_WPC_ITEM_CODE_SHOW").val("");
		$("#paraMapObj_WPC_CUST_CODE_SHOW").val("");
	}else if(ctrlType==2){
		//$("#paraMapObj_WPC_ITEM_CODE_SHOW").val(ctrlValue);
		$("#paraMapObj_WPC_DOC_SHOW").val("");
		$("#paraMapObj_WPC_CUST_CODE_SHOW").val("");
	}else if(ctrlType==3){
		//$("#paraMapObj_WPC_CUST_CODE_SHOW").val(ctrlValue);
		$("#paraMapObj_WPC_DOC_SHOW").val("");
			$("#paraMapObj_WPC_ITEM_CODE_SHOW").val("");
	}
	$("#paraMapObj_WPC_SCHEME_SN").attr("onchange","getMemo();");
})
function getMemo(){
	var schemeSn = $("#paraMapObj_WPC_SCHEME_SN").val();
	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d10509d3094c48878b4f87f7213ca381",//VM-仓库捡货方案配置-新增 操作功能 根据发货方案获取方案描述
			    data: {
			        "schemeSn":schemeSn
			    },
			    success: function(data){
			    			$("#paraMapObj_WPC_SCHEME_MEMO").val("");
						if(null == data){return ;}
						if(""!= data.ajaxList){
							var rccList = eval(data.ajaxList);
							$("#paraMapObj_WPC_SCHEME_MEMO").val(rccList[0].WPS_MEMO);
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

                    function resetForm1(){
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                        
                        if($("#paraMapObj_WPC_PICK_TYPE").val()=="1"){
                            $("#paraMapObj_WPC_CUST_CODE_SHOW").val("");
                            $("#paraMapObj_WPC_ITEM_CODE_SHOW").val("");
                        }else if($("#paraMapObj_WPC_PICK_TYPE").val()=="2"){
                            $("#paraMapObj_WPC_DOC_SHOW").val("");
                            $("#paraMapObj_WPC_CUST_CODE_SHOW").val("");
                        }else if($("#paraMapObj_WPC_PICK_TYPE").val()=="3"){
                            $("#paraMapObj_WPC_DOC_SHOW").val("");
                            $("#paraMapObj_WPC_ITEM_CODE_SHOW").val("");
                        }
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
    var ctrlType = $("#paraMapObj_WPC_PICK_TYPE").val();
	if(ctrlType==1){
		if($("#paraMapObj_WPC_DOC").val()=="" || $("#paraMapObj_WPC_DOC").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="仓库单据不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMapObj_WPC_SCHEME_SN").val()=="" || $("#paraMapObj_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}else if(ctrlType==2){
		if($("#paraMapObj_WPC_ITEM_CODE_SHOW").val()=="" || $("#paraMapObj_WPC_ITEM_CODE_SHOW").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种/物料不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMapObj_WPC_SCHEME_SN").val()=="" || $("#paraMapObj_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}else if(ctrlType==3){
	    if($("#paraMapObj_WPC_CUST_CODE").val()=="" || $("#paraMapObj_WPC_CUST_CODE").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="客户不能为空" />",0,"260","");
	        return ;
	    }
	    if($("#paraMapObj_WPC_SCHEME_SN").val()=="" || $("#paraMapObj_WPC_SCHEME_SN").val()==null){
	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="捡货方案不能为空" />",0,"260","");
	        return ;
	    }
	}
                        
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5a3c747c28cc41eaa321296286b81bd9";
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
