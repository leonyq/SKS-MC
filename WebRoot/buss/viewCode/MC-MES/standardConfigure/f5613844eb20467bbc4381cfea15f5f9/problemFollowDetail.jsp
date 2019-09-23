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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->
  <style type="text/css">
.input {
	width:200px !important;
}
</style>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            
			<div class="bd" style="height: 480px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="00bc67ca8c8a456785891b90e2f470c3" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="00bc67ca8c8a456785891b90e2f470c3" />
	<input type="hidden" name="00bc67ca8c8a456785891b90e2f470c3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d47102190729413082add50a664191b4'" />
		<s:set name="_$formId_1" value="'00bc67ca8c8a456785891b90e2f470c3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:60px"/><bu:uitn colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec"  colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1"  /></bu:td>
			<td class="name" style="width:60px"/><bu:uitn colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
			<td class="name" style="width:60px"/><bu:uitn colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:80px;" colspan="6"><bu:ui colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:240px;" colspan="6" ><bu:ui colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="00bc67ca8c8a456785891b90e2f470c3" formIndex="1" />		


									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
