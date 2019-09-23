<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
  <style type="text/css">
.input {
	width:200px !important;
}
</style>
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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:533px;">
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
		<s:set name="_$viewId" value="'c353238da5ec40dca3b6a865b6885c6a'" />
		<s:set name="_$formId_1" value="'00bc67ca8c8a456785891b90e2f470c3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:100px"/><bu:uitn colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec"  colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1"  /></bu:td>
			<td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<tr>
			<td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			<td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" style="width:205px;"/></bu:td>
		    <td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" style="width:205px;"/></bu:td>
		</tr>
		<tr>
			<td class="name"style="width:100px" /><span class="dot">*</span><bu:uitn colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;"><bu:ui  colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name"style="width:100px" /><span class="dot">*</span><bu:uitn colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:30px;" colspan="6"><bu:ui colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:25px;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<tr>
			<td class="name" /><bu:uitn colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:60px;" colspan="6"><bu:ui colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name"style="width:100px" /><span class="dot">*</span><bu:uitn colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:200px;" colspan="6" ><bu:ui colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
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
  	<script type="text/javascript">
	$(function(){
	     $("#paraMapObj_CPF_PROBLEM_PROJECT").attr("disabled","disabled");
        $("#paraMapObj_CPF_PROBLEM_PROJECT").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
	})

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
