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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:500px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4b8431cdb7f64a48bfc4cd96790b9cab" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4b8431cdb7f64a48bfc4cd96790b9cab" />
	<input type="hidden" id="prefixInd" name="4b8431cdb7f64a48bfc4cd96790b9cab" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'37603acfd6c0466f9d5ad341240e1c44'" />
		<s:set name="_$formId_1" value="'4b8431cdb7f64a48bfc4cd96790b9cab'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:100px;" /><bu:uitn colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec-self" colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" style="width:100px;" /><span class="dot">*</span><bu:uitn colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" style="height:220px;" colspan="3"  colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_CONTENT" style="height:100%;width:100%;" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_FILE" colspan="3" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_FILE" style="width:200px;" name="upFile" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="4b8431cdb7f64a48bfc4cd96790b9cab" formIndex="1" />
									
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
    <script >
    var fileMap = new Map();
    
    </script>
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

                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=23ced0c83ada4cef8c524ec7ecd5372b";
                        document.forms.editForm.submit();
                        
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
