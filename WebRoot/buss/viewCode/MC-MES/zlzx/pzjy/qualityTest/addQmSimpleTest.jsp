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
<body style="overflow:auto;">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="50c012f45e304e2993fb61b37d32e6be" type="add" />
	<table class="basic-table">
	<input type="hidden" name="formIds" value="50c012f45e304e2993fb61b37d32e6be" />
	<input type="hidden" id="prefixInd" name="50c012f45e304e2993fb61b37d32e6be" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c967f17e3e1b41f7b4e8c2cf525b836a'" />
		<s:set name="_$formId_1" value="'50c012f45e304e2993fb61b37d32e6be'" />
		<s:set name="_$type" value="'add'" />


		<%--1.工单+机种料号--%>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_PROJECT_ID}" formIndex="1" /></bu:td>

			<td class="name-six" /><bu:uitn colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_MODEL_CODE}" formIndex="1" /></bu:td>
		</tr>

		<%--2.规格+机种名称--%>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_SPEC}" formIndex="1" />
			</bu:td>

			<td class="name-six" /><bu:uitn colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_MODEL_NAME}" formIndex="1" />
			</bu:td>
		</tr>

		<%--3.检测员+判定结果--%>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_EMP}" formIndex="1" />
			</bu:td>

			<td class="name-six" /><bu:uitn colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_RESULT}" formIndex="1" />
			</bu:td>
		</tr>

		<%--4.检测时间+检测数量--%>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_TIME}" formIndex="1" />
			</bu:td>

			<td class="name-six" /><bu:uitn colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" >
				<bu:ui colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_NUM}" formIndex="1" />
			</bu:td>
		</tr>

		<%--5.检测内容--%>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" >
				<%--<bu:ui colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_CONTENT}" formIndex="1" />--%>
				<textarea id="paraMap1_QT_CHECK_CONTENT" name="paraMap1@0#QT_CHECK_CONTENT" value="" maxlength="1000" class=" input_textarea isSubmit  _VAL_OjbsData _VAL_DATABASE" save_mark="0" style="margin: 0px; width: 614px; height: 156px;"></textarea>
			</bu:td>
		</tr>

<%--

		<td class="name-six" /><bu:uitn colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
		<bu:td cssClass="dec-self" colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_CONTENT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>

		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_EMP}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_RESULT}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_CHECK_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_EXAMINE_CONTENT}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_EXAMINE_EMP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_EXAMINE_RESULT}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_EXAMINE_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_MODEL_CODE}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_PROJECT_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_MODEL_NAME}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><bu:uitn colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
			<bu:td cssClass="dec-self" colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" value="%{QT_SPEC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
--%>

	</table>
			<bu:jsVal formId="50c012f45e304e2993fb61b37d32e6be" formIndex="1" />
				
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
<script type="text/javascript">
    $(function(){
        console.log("this is init function: >>> ");
        $("#paraMap1_QT_CHECK_CONTENT").css("margin","margin: 0px","width",": 85%","height","140px");
    });
</script>