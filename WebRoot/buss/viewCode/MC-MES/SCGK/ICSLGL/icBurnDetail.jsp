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
			<div class="bd" style="height:460px;border: none" >
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c1036359818b474286d53dc1952f10c2" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c1036359818b474286d53dc1952f10c2" />
	<input type="hidden" name="c1036359818b474286d53dc1952f10c2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c448ff7f7bbf4db8b7b7cc92dfcf69cc'" />
		<s:set name="_$formId_1" value="'c1036359818b474286d53dc1952f10c2'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width:63px"/><span class="dot">*</span><bu:uitn colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2"  dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1"  /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<bu:td cssClass="dec" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" colspan="5" style="height:200px;"><div style="position: absolute;width:  100%;height:  100%;top:0;left:0;z-index:  1000;"></div><bu:ui style="width:100%;" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" colspan="5" ><bu:ui colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;" /></td>
			
		</tr>
	</table>
			<bu:jsVal formId="c1036359818b474286d53dc1952f10c2" formIndex="1" />
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
	<script type="text/javascript" >
	$(function(){
	    $("#paraMapObj_IB_NUM").attr("disabled","disabled");
        $("#paraMapObj_IB_NUM").attr("class","_VAL_NULL isSubmit input readonly _VAL_DATABASE");
       // $("#paraMapObj_IB_REMARK").attr("readonly","readonly");
        //$("#paraMapObj_IB_REMARK").attr("class"," isSubmit input readonly _VAL_DATABASE");
	    
	})
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
