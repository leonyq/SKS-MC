<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=b9782e3489a741b5bd656493cebb0f09&type=reworkfill" method="post" target="submitFrame"
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
			<div class="bd" style="height: 300px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d23be1e0a97e488c922c8d1144b774e9" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d23be1e0a97e488c922c8d1144b774e9" />
	<input type="hidden" name="d23be1e0a97e488c922c8d1144b774e9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="crd_doc_number" value="<c:out value='${paraMapObj.CRI_DOC_NUMBER}'/>" >
	
		<s:set name="_$viewId" value="'0a275814ddf34e64b12a3280aa1b8bd1'" />
		<s:set name="_$formId_1" value="'d23be1e0a97e488c922c8d1144b774e9'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CRI_DOC_NUMBER" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_DOC_NUMBER" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_DOC_NUMBER" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		<td class="name" /><bu:uitn colNo="CRI_REWORK_MO" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_REWORK_MO" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_REWORK_MO" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CRI_REWORK_MODEL" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_REWORK_MODEL" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_REWORK_MODEL" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>

			<td class="name" /><bu:uitn colNo="CRI_INSPECT_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_INSPECT_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_INSPECT_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CRI_ERROR_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_ERROR_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_ERROR_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CRI_HAD_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_HAD_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_HAD_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" dataId="${dataId}" formIndex="1"  disabled="disabled"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CRI_PROCESS_TIME" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colNo="CRI_PROCESS_TIME" formId="d23be1e0a97e488c922c8d1144b774e9" >
            <input type="text"  value="<c:out value='${dataMap.CRI_PROCESS_TIME}'/>" class="isSubmit input" disabled="disabled">
			 <input type="hidden" id="paraMapObj_CRI_PROCESS_TIME" name="paraMapObj.CRI_PROCESS_TIME" value="<c:out value='${dataMap.CRI_PROCESS_TIME}'/>" >
			
			</bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="CRI_AUDIT_MEMO" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="CRI_AUDIT_MEMO" formId="d23be1e0a97e488c922c8d1144b774e9" ><bu:ui colNo="CRI_AUDIT_MEMO" formId="d23be1e0a97e488c922c8d1144b774e9" rows="3" style="height:80px;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="d23be1e0a97e488c922c8d1144b774e9" formIndex="1" />		<div style="padding:1px;"></div>

	


									
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
