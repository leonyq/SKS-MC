<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="339caba30f6c4d78957a3815da1d1fdf" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="339caba30f6c4d78957a3815da1d1fdf" />
	<input type="hidden" name="339caba30f6c4d78957a3815da1d1fdf" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cfb93c7e96a94df9b5511d998c17468b'" />
		<s:set name="_$formId_1" value="'339caba30f6c4d78957a3815da1d1fdf'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_TEST_STEP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_TEST_STEP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_TEST_STEP" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_TEST_STEP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_INSPECT_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_SAMPLE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_LIST_FLAG}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_INSEPCT_RESULT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ITEM_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ITEM_SPEC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_CUST_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_SEND_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_TARGET_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ACTUAL_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ERROR_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_CONNECT_DOC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_SEND_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_ATMOSPHERIC_PRESSURE" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_ATMOSPHERIC_PRESSURE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_TEMPERATURE" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_TEMPERATURE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_HUMIDITY" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_HUMIDITY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_INSEPCT_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_INSEPCT_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSEPCT_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_INSEPCT_EMP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_INSEPCT_BASIS" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_INSEPCT_BASIS" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSEPCT_BASIS" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_INSEPCT_BASIS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_MEMO" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_MEMO" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_MEMO" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_MEMO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_DEP" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_SEND_DEP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_SEND_EMP}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="QII_INSEPCT_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_INSEPCT_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" ><bu:ui colNo="QII_INSEPCT_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_INSEPCT_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="QII_REVIEW_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_REVIEW_TIME" formId="339caba30f6c4d78957a3815da1d1fdf"  ><bu:ui colNo="QII_REVIEW_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_REVIEW_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-three" /><bu:uitn colNo="QII_REVIEW_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<bu:td cssClass="dec-self" colNo="QII_REVIEW_EMP" formId="339caba30f6c4d78957a3815da1d1fdf"  colspan="4"><bu:ui colNo="QII_REVIEW_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" value="%{QII_REVIEW_EMP}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="339caba30f6c4d78957a3815da1d1fdf" formIndex="1" />
				
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
