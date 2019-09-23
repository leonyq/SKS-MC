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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:500px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4b8431cdb7f64a48bfc4cd96790b9cab" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4b8431cdb7f64a48bfc4cd96790b9cab" />
	<input type="hidden" id="prefixInd" name="4b8431cdb7f64a48bfc4cd96790b9cab" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'7ef9f1e9cd0f404eb7bdb1e33308d433'" />
		<s:set name="_$formId_1" value="'4b8431cdb7f64a48bfc4cd96790b9cab'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:100px;" /><bu:uitn colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_SN}" formIndex="1" /></bu:td>
			<td class="name" style="width:100px;" /><span class="dot">*</span><bu:uitn colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_MODEL}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_NAME}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_RANK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name"  /><bu:uitn colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" style="height:220px;" colspan="3" colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_CONTENT" style="height:100%;width:100%;" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_CONTENT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui style="width:200px;" colNo="CUL_FILE" name="upFile" formId="4b8431cdb7f64a48bfc4cd96790b9cab" value="%{CUL_FILE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="4b8431cdb7f64a48bfc4cd96790b9cab" formIndex="1" />
				
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
<script type="text/javascript">

function addCal(){      
                        
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
                        
                    if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
        				$("#addForm").append($("#isCloseWin").clone());
        				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
        			}
			        $("#saveBtn").prop("disabled","disabled");
                        
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=31e61617757d4e379cd58e1beea474f2";
                        document.forms.addForm.submit();
                        
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
