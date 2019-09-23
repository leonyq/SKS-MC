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
		<bu:set name="paraMapObj" value="${dataId}" formId="9d9f8050a76c44d5967fa121c9b132f9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9d9f8050a76c44d5967fa121c9b132f9" />
	<input type="hidden" name="9d9f8050a76c44d5967fa121c9b132f9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'177c3d5de00e4b07ac9776a132879390'" />
		<s:set name="_$formId_1" value="'9d9f8050a76c44d5967fa121c9b132f9'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" />cjdsssssssss<br>
			
			<bu:uitn colNo="PERSON_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" ><select class="dept_select">
			<option>11111</option>
			<option>22222</option>
			<option>33333</option>
			</select></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SELECT4" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SELECT4" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SELECT4" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SELECT4}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SELECT3" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SELECT3" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SELECT3" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SELECT3}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SELECT2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SELECT2" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SELECT2" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SELECT2}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SELECT1" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SELECT1" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SELECT1" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SELECT1}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SEX" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SEX" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SEX" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SEX}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_NAME" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_NAME" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_NAME" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_ID" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_ID" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_ID" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_ID}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="MUT_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="MUT_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="MUT_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{MUT_CHECK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2TRT45999" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2TRT45999" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2TRT45999" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2TRT45999}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2TRT45" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2TRT45" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2TRT45" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2TRT45}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2TRT4" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2TRT4" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2TRT4" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2TRT4}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2TRT" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2TRT" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2TRT" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2TRT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2DF" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2DF" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2DF" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2DF}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW25" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW25" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW25" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW25}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2S" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2S" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2S" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2S}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="REPERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="REPERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="REPERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{REPERSON_SW2}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2E" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2E" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2E" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2E}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2E5" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2E5" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2E5" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2E5}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW232" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW232" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW232" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW232}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="PERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" ><bu:ui colNo="PERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{PERSON_SW2}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-three" /><bu:uitn colNo="DATA_AUTH" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<bu:td cssClass="dec-self" colNo="DATA_AUTH" formId="9d9f8050a76c44d5967fa121c9b132f9"  colspan="7"><bu:ui colNo="DATA_AUTH" formId="9d9f8050a76c44d5967fa121c9b132f9" value="%{DATA_AUTH}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9d9f8050a76c44d5967fa121c9b132f9" formIndex="1" />
				
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
