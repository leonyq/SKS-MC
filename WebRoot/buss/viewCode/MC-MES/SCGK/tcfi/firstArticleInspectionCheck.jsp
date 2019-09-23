<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="审核" /></title>
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
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <button type="button" onclick="editCheck(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" id="paraMapObj_CFI_EXAMINE_EMP" name="paraMapObj.CFI_EXAMINE_EMP">
								<input type="hidden" id="paraMapObj_CFI_EXAMINE_TIME" name="paraMapObj.CFI_EXAMINE_TIME">
						   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>

								
			
		<bu:set name="paraMapObj" value="${dataId}" formId="1c6dc1908e8645b5b0104ac2031b5c41" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1c6dc1908e8645b5b0104ac2031b5c41" />
	<input type="hidden" name="1c6dc1908e8645b5b0104ac2031b5c41" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'fed17843a0b0462ea564ee52d4dbe368'" />
		<s:set name="_$formId_1" value="'1c6dc1908e8645b5b0104ac2031b5c41'" />
		<s:set name="_$type" value="'edit'"/>
		
        <tr>
			<td>
		    <div class="mod">		
        	<div class="mod-hd">		
        	<h3 class="tit"><dict:lang value="检测信息"/></h3>	
        	</div>
        	</div>
		    </td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
			<input type="hidden" name="myFaiNum" id="myFaiNum" />
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>	
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41"  colspan="6"><bu:ui colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="width:100%;height:70px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="6"><bu:ui colNo="CFI_CHECK_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="width:100%;height:70px;"/></bu:td>
		</tr>
		<tr>
			<td>
		      <div class="mod">		
        	  <div class="mod-hd">		
        	 <h3 class="tit"><dict:lang value="审核信息"/></h3>	
        	 </div>
        	</div>
		    </td>
		</tr>
	
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_EXAMINE_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_EXAMINE_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" ><bu:ui colNo="CFI_EXAMINE_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr> 
			<td class="name-six" /><bu:uitn colNo="CFI_EXAMINE_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_EXAMINE_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" colspan="6"><bu:ui colNo="CFI_EXAMINE_CONTENT" formId="1c6dc1908e8645b5b0104ac2031b5c41" dataId="${dataId}" formIndex="1" style="width:100%;height:70px;"/></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="1c6dc1908e8645b5b0104ac2031b5c41" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:submit viewId="fed17843a0b0462ea564ee52d4dbe368" />
		<bu:script viewId="fed17843a0b0462ea564ee52d4dbe368" />
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
			
function getFaiNum(projectId){
            				
        
	url="${path}buss/bussModel_exeFunc.ms?funcMId=351bafdc091d468e8113d0c6fe5536fd";
            					
var jsondata = { "projectId": projectId};
jQuery.ajax({
	        	
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=351bafdc091d468e8113d0c6fe5536fd",
 	    	data:jsondata,
 			success: function(data){
 				var pList=data.ajaxList;
 				for(var i=0;i<pList.length;i++){
					$("#paraMapObj_CFI_FAI_NUM").val(pList[i].FAI_NUM);
					$("#myFaiNum").val(pList[i].FAI_NUM);
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
     				if(msg.readyState!=0){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 				}
 		   }
 		});
}
$(function(){
getFaiNum($("#paraMapObj_CFI_PROJECT_ID").val());
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
			$("#paraMapObj_CFI_EXAMINE_RESULT").trigger("chosen:updated");
			//alert($("#paraMapObj_CFI_EXAMINE_RESULT").val());
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
			//$("#paraMapObj_CFI_EXAMINE_EMP").val('${dataMap.curUser}');
			
			$("#paraMapObj_CFI_EXAMINE_EMP").val("<c:out value='${dataMap.curUser}' />");
			
	    	$("#paraMapObj_CFI_MODEL_CODE").addClass("readonly");
			$("#paraMapObj_CFI_MODEL_CODE").attr("disabled","disabled"); 
			$("#paraMapObj_CFI_MODEL_NAME").addClass("readonly");
			$("#paraMapObj_CFI_MODEL_NAME").attr("disabled","disabled");
			$("#paraMapObj_CFI_SPEC").addClass("readonly");
			$("#paraMapObj_CFI_SPEC").attr("disabled","disabled");
			$("#paraMapObj_CFI_PRODUCT_STEP").addClass("readonly");
			$("#paraMapObj_CFI_PRODUCT_STEP").attr("disabled","disabled"); 
			$("#paraMapObj_CFI_FAI_NUM").addClass("readonly");
			$("#paraMapObj_CFI_FAI_NUM").attr("disabled","disabled");
			$("#paraMapObj_CFI_CHECK_RESULT").addClass("readonly");
			$("#paraMapObj_CFI_CHECK_RESULT").attr("disabled","disabled");
			$("#paraMapObj_CFI_CHECK_NUM").addClass("readonly");
			$("#paraMapObj_CFI_CHECK_NUM").attr("disabled","disabled");
			$("#paraMapObj_CFI_CHECK_SN").addClass("readonly");
			$("#paraMapObj_CFI_CHECK_SN").attr("disabled","disabled");
			$("#paraMapObj_CFI_CHECK_CONTENT").addClass("readonly");
			$("#paraMapObj_CFI_CHECK_CONTENT").attr("disabled","disabled");
			
			
			
			
			
			
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);	

		return false;
	}else{
		return true;
	}
	 --%>
function editCheck(tis){
        $("#paraMapObj_CFI_EXAMINE_RESULT").addClass('_VAL_NULL'); 
        var dd=new Date();
        var y=dd.getFullYear();
        var M = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);
        var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();
        var H = dd.getHours()<10?"0"+dd.getHours():dd.getHours();
        var m = dd.getMinutes()<10?"0"+dd.getMinutes():dd.getMinutes();
        var s = dd.getSeconds()<10?"0"+dd.getSeconds():dd.getSeconds();
        var curDate=y+"-"+M+"-"+d+" "+H+":"+m+":"+s;
        $("#paraMapObj_CFI_EXAMINE_TIME").val(curDate);
        var faiNum = $("#paraMapObj_CFI_FAI_NUM").val();
        var checkNum = $("#paraMapObj_CFI_CHECK_NUM").val();
        if(faiNum==""){
        faiNum = 0;
        }
        if(checkNum<faiNum){
    	utilsFp.confirmIcon(3,"","","", "<dict:lang value="实际检测数量应不小于首件检测数量" />",0,"260","");
        return;
        }
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
        
        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5e92b025320a4c16a4b39555819749cf";
        document.forms.editForm.submit();
        
        //edit(tis);
}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
  <jsp:param name="modelName" value="VIEW_TYPE_10" />
  <jsp:param name="location" value="jsLoading" />
</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>