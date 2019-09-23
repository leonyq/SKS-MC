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
			<div class="bd" style="border: none;height:176px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1cff0c64d594438f9a60bba5bbb8a83c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1cff0c64d594438f9a60bba5bbb8a83c" />
	<input type="hidden" name="1cff0c64d594438f9a60bba5bbb8a83c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'76434061b5da4cdcaafc429140c49038'" />
		<s:set name="_$formId_1" value="'1cff0c64d594438f9a60bba5bbb8a83c'" />
		<s:set name="_$type" value="'detail'"/>
	<!--	<tr>
			<td class="name-three" /><bu:uitn colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>
			<td class="name-three" style="width:65px;"  /><span class="dot">*</span><bu:uitn colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui  colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui  colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td> 
			<bu:td cssClass="dec-self" colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui style="width:230px;height:75px;"  colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="1cff0c64d594438f9a60bba5bbb8a83c" formIndex="1" />
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
