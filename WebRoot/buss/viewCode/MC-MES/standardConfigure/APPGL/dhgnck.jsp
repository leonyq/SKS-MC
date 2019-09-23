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
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="175c4afd1c0149a092c2d0bacf445401" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="175c4afd1c0149a092c2d0bacf445401" />
	<input type="hidden" id="prefixInd" name="175c4afd1c0149a092c2d0bacf445401" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f6887344231646d0854d4391d5e32e23'" />
		<s:set name="_$formId_1" value="'175c4afd1c0149a092c2d0bacf445401'" />
		<s:set name="_$type" value="'detail'"/>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_ID" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_ID" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_ID" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_SEQ" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_SEQ" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_SEQ" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_PHOTO_PATH" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_PHOTO_PATH" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_PHOTO_PATH" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_PHOTO_PATH2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_PHOTO_PATH2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_PHOTO_PATH2" formId="175c4afd1c0149a092c2d0bacf445401" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		-->
	</table>
			<bu:jsVal formId="175c4afd1c0149a092c2d0bacf445401" formIndex="1" />
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
