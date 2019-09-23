<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>

    <!-- 产品静态资源 -->
<style type="text/css">
.edit .bd{
    height:calc(100% - 40px);
    width:100%;
    overflow:auto;
    box-sizing:border-box;
}
.mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
    right:6px;
}
</style>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

</head>
<body>
	<div class="edit " style="height:calc(100% - 5px);">
	<form id="editForm" style="height:100%;" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
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
			    </div>

			</div>
			<div class="bd scroll">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0affca5a6d75419ab073cd608cc5e1e2" type="edit" />
		<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0affca5a6d75419ab073cd608cc5e1e2" />
	<input type="hidden" name="0affca5a6d75419ab073cd608cc5e1e2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d8524cf483f443879bcc6bcc253a9536'" />
		<s:set name="_$formId_1" value="'0affca5a6d75419ab073cd608cc5e1e2'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui style="width:200px;" colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui style="width:200px;" colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>

			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_FILE" name="upFile" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:200px;position: relative;"><div style="position: absolute;width:  100%;height:  100%;top:0;left:0;z-index:  1000;"></div><bu:ui style="width:99%;" colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:80px;"><bu:ui style="width:100%;height:100%" colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:80px;"><bu:ui style="width:100%;height:100%" colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" />&nbsp;</td>
		    <td class="dec" />&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" style="width:85px;"/><bu:uitn colNo="CPR_HAPPEN_TIME" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CPR_HAPPEN_TIME" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_TIME" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="临时对策" /></h3>	
        
	</div>
	<table class="basic-table" >
        	
        <tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_TEMPORARY_BASIS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_TEMPORARY_BASIS" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_TEMPORARY_BASIS" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:291px;"/><bu:uitn colNo="CPR_TEMPORARY_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_TEMPORARY_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_TEMPORARY_EMP" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CPR_TEMPORARY_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_TEMPORARY_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_TEMPORARY_DATE" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="原因分析" /></h3>	
        
	</div>
	
	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" style="max-width:100%">
							<div class="datagrid-header-inner head1" id="" >
								<table  class="datagrid-htable fixedTable  " id="causeAnalysis1">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" disabled="disabled"/></td >
						
										<td class="datagrid-cell" style="width:230px;"><dict:lang value="原因类型" /></td >
										<td style="display:none;">
										<dict:selectDict id="causeType" name="causeType" dictCode="CAUSE_TYPE" />
										</td >
										<td class="datagrid-cell"><dict:lang value="原因分析" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scorl1"   style="height:150px;max-width:100%">
							<table class="dlist-table table-line " style="width:100%"  id="causeAnalysis" >
								<tbody id="addCauseAnalysis" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>	
<!---->
        <table class="basic-table" >
		<tr>
			<td class="name" style="width:64px;">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:291px;"/><bu:uitn colNo="CPC_CAUSE_EMP" formId="e38d7d80f30d4eb08b4574fef8198f39" /></td>
			<bu:td cssClass="dec" colNo="CPC_CAUSE_EMP" formId="e38d7d80f30d4eb08b4574fef8198f39" ><bu:ui colNo="CPC_CAUSE_EMP" style="width:200px;" formId="e38d7d80f30d4eb08b4574fef8198f39" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CPC_CAUSE_TIME" formId="e38d7d80f30d4eb08b4574fef8198f39" /></td>
			<bu:td cssClass="dec" colNo="CPC_CAUSE_TIME" formId="e38d7d80f30d4eb08b4574fef8198f39" ><bu:ui colNo="CPC_CAUSE_TIME" style="width:200px;" formId="e38d7d80f30d4eb08b4574fef8198f39" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="改善措施" /></h3>	
	</div>
	<table class="basic-table" >
        	
        <tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_IMPROVE_MEASURE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_IMPROVE_MEASURE" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_IMPROVE_MEASURE" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:291px;"/><bu:uitn colNo="CPR_IMPROVE_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_IMPROVE_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_IMPROVE_EMP" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CPR_IMPROVE_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_IMPROVE_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_IMPROVE_DATE" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="永久改善措施" /></h3>	
	</div>
	<table class="basic-table" >
        	
        <tr>
			<td class="name" style="width:90px;"/><bu:uitn colNo="CPR_PERMANENT_IMPROVE_MEASURE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_PERMANENT_IMPROVE_MEASURE" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_PERMANENT_IMPROVE_MEASURE" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:291px;"/><bu:uitn colNo="CPR_PERMANENT_IMPROVE_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_PERMANENT_IMPROVE_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_PERMANENT_IMPROVE_EMP" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CPR_PERMANENT_IMPROVE_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_PERMANENT_IMPROVE_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui colNo="CPR_PERMANENT_IMPROVE_DATE" style="width:200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="效果确认" /></h3>	
	</div>
	<table class="basic-table" >
        <tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_CONFIRM_RESULT" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CPR_CONFIRM_RESULT" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui colNo="CPR_CONFIRM_RESULT" style="width: 200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		    <td class="name" style="width:72px;"/><bu:uitn colNo="CPR_STANDARDIZE_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_STANDARDIZE_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui colNo="CPR_STANDARDIZE_FILE" name="upFile" style="width: 200px;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		    <td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		</tr>
        <tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_EFFECT_CONFIRM" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_EFFECT_CONFIRM" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_EFFECT_CONFIRM" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_STANDARDIZE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_STANDARDIZE" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_STANDARDIZE" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="小组祝贺" /></h3>	
	</div>
	<table class="basic-table" >
        
		<tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_CONGRATULATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_CONGRATULATE" formId="0affca5a6d75419ab073cd608cc5e1e2" style="height:80px;" colspan="5"><bu:ui colNo="CPR_CONGRATULATE" style="width: 100%;height: 100%;" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
	</table>
</div>
			<bu:jsVal formId="0affca5a6d75419ab073cd608cc5e1e2" formIndex="1" />		<div style="padding:1px;"></div>

		


									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
<script type="text/javascript">
$(function(){
    $("#paraMapObj_CPR_HAPPEN_EMP_SHOW").attr("style","width:200px;");
    $("#paraMapObj_CPR_NAME").attr("disabled","disabled");
    $("#paraMapObj_CPR_NAME").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_HAPPEN_ADDRESS").attr("disabled","disabled");
    $("#paraMapObj_CPR_HAPPEN_ADDRESS").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_HAPPEN_FILE").attr("disabled","disabled");
    $("#ID_CPR_HAPPEN_PROBLEM").attr("disabled","disabled");
    $("#paraMapObj_CPR_HAPPEN_INFLUENCE").attr("disabled","disabled");
    $("#paraMapObj_CPR_HAPPEN_INFLUENCE").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_GROUP_EMP").attr("disabled","disabled");
    $("#paraMapObj_CPR_GROUP_EMP").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_TEMPORARY_BASIS").attr("disabled","disabled");
    $("#paraMapObj_CPR_TEMPORARY_BASIS").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_TEMPORARY_EMP_SHOW").attr("disabled","disabled");
    $("#paraMapObj_CPR_TEMPORARY_EMP_SHOW").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_TEMPORARY_EMP_SHOW").attr("style","width:200px;");
    $("#paraMapObj_CPC_CAUSE_EMP_SHOW").attr("style","width:200px;");
    $("#paraMapObj_CPR_IMPROVE_MEASURE").attr("disabled","disabled");
    $("#paraMapObj_CPR_IMPROVE_MEASURE").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_PERMANENT_IMPROVE_MEASURE").attr("disabled","disabled");
    $("#paraMapObj_CPR_PERMANENT_IMPROVE_MEASURE").attr("class"," isSubmit input readonly _VAL_DATABASE");
     $("#paraMapObj_CPR_STANDARDIZE_FILE").attr("disabled","disabled");
     $("#paraMapObj_CPR_CONFIRM_RESULT").attr("disabled","disabled");
     $("#paraMapObj_CPR_EFFECT_CONFIRM").attr("disabled","disabled");
    $("#paraMapObj_CPR_EFFECT_CONFIRM").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_STANDARDIZE").attr("disabled","disabled");
    $("#paraMapObj_CPR_STANDARDIZE").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CPR_IMPROVE_EMP_SHOW").attr("style","width:200px;");
    $("input[name='upFile']:hidden").val("");
    getImproveInfo();
})
//回填原因分析信息
function getImproveInfo(){
    util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=6de37cd6dad1474e818042cfa01e5d23",
			    data:
			    {
			       "docNum":$("#paraMapObj_CPR_SN").val() 
			    },
				success: function(data){
				        $("#addCauseAnalysis").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
						    var rcList = data.ajaxList;
						    $("#paraMapObj_CPC_CAUSE_EMP_SHOW").val(rcList[0].NAME);
						    $("#paraMapObj_CPC_CAUSE_TIME").val(rcList[0].CPC_CAUSE_TIME);
						    for(var i=0;i<rcList.length;i++){
						        var causeTypeOpt = $("#causeType").html();
                            	var causeTypeOption = causeTypeOpt.substring(causeTypeOpt.indexOf('<option'));
                            	var causeTypeSel = "<select id='causeTypeSel_"+(i+1)+"' name='causeTypeSelect' class='_VAL_NULL input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ causeTypeOption +"</select>";
                            	
                            	$("#causeAnalysis  tbody:last").append("<tr id='"+(i+1)+"'></tr>");
                            	$("#causeAnalysis  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align:center;'>"+(i+1)+"</td>");
                            	$("#causeAnalysis  tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align:center;'><input type='checkbox' disabled='disabled'/></td>");
                            	$("#causeAnalysis  tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:230px;padding:0;'>"+causeTypeSel+"</td>");
                            	$("#causeAnalysis  tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='padding:0;'>"+rcList[i].CPC_CAUSE_ANALYSIS+"</td>");
                            	setChosen();//设置下拉框样式
                            	$("#causeTypeSel_"+(i+1)).val(rcList[i].CPC_CAUSE_TYPE);
                            	$("#causeTypeSel_"+(i+1)).trigger("chosen:updated");
                            	$("#causeTypeSel_"+(i+1)+"_chosen").attr("style","width:230px;");
						    }
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				    }
				});
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
        	
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=44768e67e5a949a69b4fc917f9ac6717";
  document.forms.editForm.submit();
}
</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll');
    setPopScroll('.scorl1','.head1');
  })
})(jQuery)</script>
</body>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

