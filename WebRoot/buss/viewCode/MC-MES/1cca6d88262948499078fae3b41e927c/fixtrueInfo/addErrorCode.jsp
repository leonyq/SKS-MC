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
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
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
			<div class="bd" style="height:350px;">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5a94bc73341487cb6fc5f9c0ee93e9d" />
	<input type="hidden" name="c5a94bc73341487cb6fc5f9c0ee93e9d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0b475f6f75b940ed928901db9e8b021c'" />
		<s:set name="_$formId_1" value="'c5a94bc73341487cb6fc5f9c0ee93e9d'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d"><bu:ui colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" value="%{CEC_CODE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" value="%{CEC_NAME}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" value="%{CEC_TYPE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" value="%{CEC_LEVEL}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d"><bu:ui colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" value="%{CEC_DESC}" formIndex="1" style="width:300px;height:80px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="c5a94bc73341487cb6fc5f9c0ee93e9d" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
