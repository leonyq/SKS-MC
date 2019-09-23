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
	<div class="edit" style="height:calc(100% - 5px);">
	<form id="editForm"  style="height:100%;" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
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
			    </div>

			</div>
			<div class="bd"  style="height:100%;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0affca5a6d75419ab073cd608cc5e1e2" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0affca5a6d75419ab073cd608cc5e1e2" />
	<input type="hidden" name="0affca5a6d75419ab073cd608cc5e1e2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'7a4f29173bab44259bb609f3f0d59c89'" />
		<s:set name="_$formId_1" value="'0affca5a6d75419ab073cd608cc5e1e2'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:65px;"/><bu:uitn colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui style="width:200px;" colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" ><bu:ui style="width:200px;" colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		    
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_FILE" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="3"><bu:ui style="width:200px;" colNo="CPR_HAPPEN_FILE" name="upFile" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:200px;"><bu:ui style="width:99%;" colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:80px;"><bu:ui style="width:100%;height:100%" colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<bu:td cssClass="dec" colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" colspan="5" style="height:80px;"><bu:ui style="width:100%;height:100%" colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="0affca5a6d75419ab073cd608cc5e1e2" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
$("#paraMapObj_CPR_HAPPEN_EMP_SHOW").attr("style","width:200px;");
$("input[name='upFile']:hidden").val("");
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

                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6629469c81ff415db458acbfe9ff0ef5";
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
