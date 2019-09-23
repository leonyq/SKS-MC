<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;    height: 430px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="6209be18186f43ba92fa495365a68c02" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6209be18186f43ba92fa495365a68c02" />
	<input type="hidden" name="6209be18186f43ba92fa495365a68c02" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f5d5583d457644998bdbb0534303fc03'" />
		<s:set name="_$formId_1" value="'6209be18186f43ba92fa495365a68c02'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_AREA_SN"   formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>

		    <td class="name-six" /><bu:uitn colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1"  /></bu:td>
		
		</tr>
		<tr>		
            <td class="name-six" /><bu:uitn colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
					
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_BEGIN_TIME" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime()"/></bu:td>
	
		</tr>
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_END_TIME" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" onchange="getBegTime()"/></bu:td>
	
	        <td class="name-six" /><bu:uitn colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_STOP_TYPE" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_STOP_TYPE" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
	        <td class="name-six" /><bu:uitn colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_MAINTENANCE" style="height:80px;" colspan="3" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE" disabled="disabled" style="width:96%;height:100%;" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CSI_MAINTENANCE_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_MAINTENANCE_EMP" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE_EMP" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
	        <td class="name-six" /><bu:uitn colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CSI_EXAMINE_RESULT" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_EXAMINE_RESULT" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_EXAMINE_RESULT"  disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
	        <td class="name-six" /><bu:uitn colNo="CSI_EXAMINE_REASON" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_EXAMINE_REASON" style="height:80px;" colspan="3" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui disabled="disabled" colNo="CSI_EXAMINE_REASON" style="width:96%;height:100%;" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name-six" /><bu:uitn colNo="CSI_EXAMINE_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_EXAMINE_EMP" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_EXAMINE_EMP" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
	        <td class="name-six" /><bu:uitn colNo="CSI_EXAMINE_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<bu:td cssClass="dec-self" colNo="CSI_EXAMINE_TIME" formId="6209be18186f43ba92fa495365a68c02" ><bu:ui colNo="CSI_EXAMINE_TIME" disabled="disabled" formId="6209be18186f43ba92fa495365a68c02" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
	</table>
			<bu:jsVal formId="6209be18186f43ba92fa495365a68c02" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    <script type="text/javascript">
        	$(function(){
    
  // $("#paraMapObj_CSI_AREA_SN").attr("disabled","disabled");
  //  $("#paraMapObj_CSI_AREA_SN").attr("class"," isSubmit input readonly _VAL_DATABASE");
    //$("#paraMapObj_CSI_AREA_SN").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_MO_NUMBER").attr("disabled","disabled");
    $("#paraMapObj_CSI_MO_NUMBER").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_PROJECT_ID").attr("disabled","disabled");
    $("#paraMapObj_CSI_PROJECT_ID").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_STOP_TYPE").attr("disabled","disabled");
    $("#paraMapObj_CSI_STOP_TYPE").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_MAINTENANCE").attr("disabled","disabled");
    $("#paraMapObj_CSI_MAINTENANCE").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_MAINTENANCE_EMP").attr("disabled","disabled");
    $("#paraMapObj_CSI_MAINTENANCE_EMP").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_EXAMINE_REASON").attr("disabled","disabled");
    $("#paraMapObj_CSI_EXAMINE_REASON").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_EXAMINE_EMP_SHOW").attr("disabled","disabled");
    $("#paraMapObj_CSI_EXAMINE_EMP_SHOW").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CSI_MAINTENANCE_EMP_SHOW").attr("style","");
    $("#paraMapObj_CSI_EXAMINE_EMP_SHOW").attr("style","");
    
    
    
})
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
