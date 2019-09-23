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
		<bu:set name="paraMapObj" value="${dataId}" formId="e09e1f47e824490d80ba2717d25498d3" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e09e1f47e824490d80ba2717d25498d3" />
	<input type="hidden" name="e09e1f47e824490d80ba2717d25498d3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f2f202547d1a4de6a7e808c9f4a0c5e8'" />
		<s:set name="_$formId_1" value="'e09e1f47e824490d80ba2717d25498d3'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNO}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLTYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTLEASTCOUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_MAX_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_MAX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_MIX_MAX_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTTOOLCOUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_OPEN_DISCARD_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DISCARD_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BACK_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_DURING_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{BARD_COUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_USE_COUNT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" value="%{LEAD_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" value="%{ASSISTANTMODEL}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_CYCLE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_CLCLE_UNIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_PERIOD" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_PERIOD}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_USE_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_BAR_RULE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="TIN_MIX_TIME" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_MIX_TIME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_REMIND_CYCLE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" ><bu:ui colNo="FIX_REMIND_DAY" formId="e09e1f47e824490d80ba2717d25498d3" value="%{FIX_REMIND_DAY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3"  ><bu:ui colNo="MAX_PERIOD_LIMIT" formId="e09e1f47e824490d80ba2717d25498d3" value="%{MAX_PERIOD_LIMIT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-three" /><bu:uitn colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<bu:td cssClass="dec-self" colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3"  colspan="4"><bu:ui colNo="TIN_THAWING_DECAY" formId="e09e1f47e824490d80ba2717d25498d3" value="%{TIN_THAWING_DECAY}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="e09e1f47e824490d80ba2717d25498d3" formIndex="1" />
				
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
