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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 434px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ff8f5a5bddcf4021aa945e5a217e6552" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ff8f5a5bddcf4021aa945e5a217e6552" />
	<input type="hidden" name="ff8f5a5bddcf4021aa945e5a217e6552" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'58600bf8f9d54e9e99119fd1d4e45633'" />
		<s:set name="_$formId_1" value="'ff8f5a5bddcf4021aa945e5a217e6552'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_SN" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_NAME" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CIP_DEPT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_DEPT" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_EMP" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" ><bu:ui colNo="CIP_BAD_TYPE" style="width:200px;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>	
        <tr>
			<td class="name" /><bu:uitn colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_CURRENT_METHODS" style="width: 100%;height: 100%;" formId="ff8f5a5bddcf4021aa945e5a217e6552" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	    <tr>
			<td class="name" /><bu:uitn colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<bu:td cssClass="dec" colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="height:80px;" colspan="5"><bu:ui colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="ff8f5a5bddcf4021aa945e5a217e6552" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
    $("#paraMapObj_CIP_EMP_SHOW").attr("style","width:200px;");
})
function editCal(){
  if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
        	}
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e17c2d7fb8674c33940a24a3e5e02847";
  document.forms.editForm.submit();
}
</script>
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