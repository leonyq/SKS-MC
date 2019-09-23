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
<style type="text/css">
.edit .bd{
    height:calc(100% - 0px);
    width:100%;
    overflow:auto;
    box-sizing:border-box;
}
.mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
    right:6px;
}
</style>
</head>
<body style="overflow:auto;background-color:#fff;">
	<div class="edit" style="height:calc(100% - 5px);">
	<form id="editForm" style="height:100%;" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            
			<div class="bd scroll">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ff8f5a5bddcf4021aa945e5a217e6552" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="提案信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ff8f5a5bddcf4021aa945e5a217e6552" />
	<input type="hidden" name="ff8f5a5bddcf4021aa945e5a217e6552" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1a01c40e715142e18330b55c5533e991'" />
		<s:set name="_$formId_1" value="'ff8f5a5bddcf4021aa945e5a217e6552'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_SN" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_NAME" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CIP_DEPT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_BAD_TYPE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		    
		<td class="name" /><bu:uitn colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		
            <td class="name" /><bu:uitn colNo="CIP_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_DATE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>	
        <tr>
			<td class="name" /><bu:uitn colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_CURRENT_METHODS" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	    <tr>
			<td class="name" /><bu:uitn colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="实施确认" /></h3>	
        
	</div>
	<table class="basic-table" >
        	
        <tr>
			<td class="name" style="width:58px;"/><bu:uitn colNo="CIP_IMPLEMENT_CONFIRM" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_IMPLEMENT_CONFIRM" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_IMPLEMENT_CONFIRM" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:284px;"/><bu:uitn colNo="CIP_CONFIRM_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_CONFIRM_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_CONFIRM_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CIP_CONFIRM_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_CONFIRM_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_CONFIRM_DATE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="审核" /></h3>	
        
	</div>
	<table class="basic-table" >
        <tr>
			<td class="name" style="width:58px;"/><bu:uitn colNo="CIP_REVIEW_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_REVIEW_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552"><bu:ui colNo="CIP_REVIEW_RESULT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
        <tr>
			<td class="name" style="width:58px;"/><bu:uitn colNo="CIP_REVIEW_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_REVIEW_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_REVIEW_REASON" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec" style="width:200px;">&nbsp;</td>
		
			<td class="name" style="width:90px;"/><bu:uitn colNo="CIP_REVIEW_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_REVIEW_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_REVIEW_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CIP_REVIEW_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_REVIEW_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_REVIEW_DATE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="效益分析" /></h3>	
        
	</div>
	<table class="basic-table" >
        
        <tr>
			<td class="name" style="width:58px;"/><bu:uitn colNo="CIP_BENEFIT_ANALYSIS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BENEFIT_ANALYSIS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_BENEFIT_ANALYSIS" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec" style="width:200px;">&nbsp;</td>
		
			<td class="name" style="width:90px;"/><bu:uitn colNo="CIP_ANALYSIS_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_ANALYSIS_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_ANALYSIS_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CIP_ANALYSIS_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_ANALYSIS_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_ANALYSIS_DATE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	
</div>
			<bu:jsVal formId="ff8f5a5bddcf4021aa945e5a217e6552" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
    $("#paraMapObj_CIP_EMP_SHOW").attr("style","width:200px;");//isSubmit input readonly _VAL_DATABASE
    $("#paraMapObj_CIP_NAME").attr("disabled","disabled");
    $("#paraMapObj_CIP_NAME").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_DEPT").attr("disabled","disabled");
    $("#paraMapObj_CIP_DEPT").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_CURRENT_METHODS").attr("disabled","disabled");
    $("#paraMapObj_CIP_CURRENT_METHODS").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_BAD_REASON").attr("disabled","disabled");
    $("#paraMapObj_CIP_BAD_REASON").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_IMPROVE_METHODS").attr("disabled","disabled");
    $("#paraMapObj_CIP_IMPROVE_METHODS").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_EXCEPT_RESULT").attr("disabled","disabled");
    $("#paraMapObj_CIP_EXCEPT_RESULT").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_IMPLEMENT_CONFIRM").attr("disabled","disabled");
    $("#paraMapObj_CIP_IMPLEMENT_CONFIRM").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_REVIEW_REASON").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_CONFIRM_EMP_SHOW").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_CONFIRM_EMP_SHOW").attr("style","width:200px;");
    $("#paraMapObj_CIP_REVIEW_EMP_SHOW").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CIP_REVIEW_EMP_SHOW").attr("style","width:200px;");
    $("#paraMapObj_CIP_ANALYSIS_EMP_SHOW").attr("style","width:200px;");
    
    $("#paraMapObj_CIP_BENEFIT_ANALYSIS").attr("class"," isSubmit input readonly _VAL_DATABASE");
})

</script>
	<!-- js初始化方法 -->


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

