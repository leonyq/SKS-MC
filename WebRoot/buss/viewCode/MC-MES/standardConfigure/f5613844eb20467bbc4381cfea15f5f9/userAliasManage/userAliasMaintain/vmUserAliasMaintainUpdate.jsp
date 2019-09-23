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
        				<!--	<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd" style="height:200px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1cff0c64d594438f9a60bba5bbb8a83c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1cff0c64d594438f9a60bba5bbb8a83c" />
	<input type="hidden" name="1cff0c64d594438f9a60bba5bbb8a83c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="pagStatus" value="edit" />
		<s:set name="_$viewId" value="'67f4ce4cba3e4896aace476675a18be0'" />
		<s:set name="_$formId_1" value="'1cff0c64d594438f9a60bba5bbb8a83c'" />
		<s:set name="_$type" value="'edit'"/>
	<!--	<tr>
			<td class="name-three" /><bu:uitn colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui colNo="ACCOUNT_ID" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>
			<td class="name-three" style="width:90px;"/><span class="dot">*</span><bu:uitn colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui style="width:300px;" colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui style="width:300px;" colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" ><bu:ui style="width:300px;height:75px;" colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="1cff0c64d594438f9a60bba5bbb8a83c" formIndex="1" />
									
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