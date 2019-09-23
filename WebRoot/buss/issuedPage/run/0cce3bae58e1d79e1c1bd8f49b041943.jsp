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
		<bu:set name="paraMapObj" value="${dataId}" formId="1aad990f8a774aeaa80d6b02a13a12ef" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1aad990f8a774aeaa80d6b02a13a12ef" />
	<input type="hidden" id="prefixInd" name="1aad990f8a774aeaa80d6b02a13a12ef" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cf3acba40f6347ee8c3ea1fe41db3425'" />
		<s:set name="_$formId_1" value="'1aad990f8a774aeaa80d6b02a13a12ef'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WSD_ITEM_SN" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_ITEM_SN" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_ITEM_SN" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="T2#WSD_DOC_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WSD_DOC_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WSD_DOC_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WSD_ITEM_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_ITEM_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_ITEM_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WSD_SCARP_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_SCARP_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_SCARP_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WSD_ITEM_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_ITEM_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_ITEM_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WSD_ITEM_SPEC" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WSD_ITEM_SPEC" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WSD_ITEM_SPEC" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_CREATE_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_CREATE_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_CREATE_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="T2#WSD_DUTY_EMP" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WSD_DUTY_EMP" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WSD_DUTY_EMP" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WSD_DUTY_DEPT" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WSD_DUTY_DEPT" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WSD_DUTY_DEPT" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WAD_MEMO" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="WAD_MEMO" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="WAD_MEMO" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="T2#WAD_SCARP_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WAD_SCARP_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WAD_SCARP_TIME" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T2#WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T2#WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T2#WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="T3#NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T3#NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" ><bu:ui colNo="T3#NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="T4#WA_AREA_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" /></td>
			<bu:td cssClass="dec-self" colNo="T4#WA_AREA_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef"  colspan="7"><bu:ui colNo="T4#WA_AREA_NAME" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="1aad990f8a774aeaa80d6b02a13a12ef" formIndex="1" />
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
