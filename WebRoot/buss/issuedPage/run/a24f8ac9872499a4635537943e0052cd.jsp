<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name" value=""  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                	
                	
                </div>
			    <div class="optn">
			        <button type="button" onclick="add(this,'<c:out value="${formId}" />');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="3b8a6119acb94c0f84ea084cdcd2e280" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="3b8a6119acb94c0f84ea084cdcd2e280" />
	<input type="hidden" id="prefixInd" name="3b8a6119acb94c0f84ea084cdcd2e280" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cf71c43050124a2286821c8f8e4306ff'" />
		<s:set name="_$formId_1" value="'3b8a6119acb94c0f84ea084cdcd2e280'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="EXE_SQL" formId="3b8a6119acb94c0f84ea084cdcd2e280" /></td>
			<bu:td cssClass="dec-self" colNo="EXE_SQL" formId="3b8a6119acb94c0f84ea084cdcd2e280" ><bu:ui colNo="EXE_SQL" formId="3b8a6119acb94c0f84ea084cdcd2e280" value="%{EXE_SQL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="EXE_ISSUC" formId="3b8a6119acb94c0f84ea084cdcd2e280" /></td>
			<bu:td cssClass="dec-self" colNo="EXE_ISSUC" formId="3b8a6119acb94c0f84ea084cdcd2e280" ><bu:ui colNo="EXE_ISSUC" formId="3b8a6119acb94c0f84ea084cdcd2e280" value="%{EXE_ISSUC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="EXE_REMARK" formId="3b8a6119acb94c0f84ea084cdcd2e280" /></td>
			<bu:td cssClass="dec-self" colNo="EXE_REMARK" formId="3b8a6119acb94c0f84ea084cdcd2e280" ><bu:ui colNo="EXE_REMARK" formId="3b8a6119acb94c0f84ea084cdcd2e280" value="%{EXE_REMARK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" />脚本上传</td>
			<td Class="dec-self" /><input type="file" ></td>
			
		</tr>
	</table>
			<bu:jsVal formId="3b8a6119acb94c0f84ea084cdcd2e280" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
