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
			        <button type="button" onclick="addInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="    height: 434px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c5b9c9cc6c8445029a1854920fc91303" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5b9c9cc6c8445029a1854920fc91303" />
	<input type="hidden" name="c5b9c9cc6c8445029a1854920fc91303" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'35f59554d53a4372b31a81ff3eaf212a'" />
		<s:set name="_$formId_1" value="'c5b9c9cc6c8445029a1854920fc91303'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_DEVICE_SN" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_DEVICE_SN}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CD_DEVICE_NAME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CD_DEVICE_NAME}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="T2#VALUE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{T2#VALUE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_STOP_TYPE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_STOP_TYPE}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_START_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_START_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_START_TIME}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_END_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CDD_DEVICE_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_END_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_END_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span>
			<bu:uitn colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_STOP_REASON" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_STOP_REASON}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_TEMPORARY_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_TEMPORARY_METHOD}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_LONGTERM_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_LONGTERM_METHOD}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_MEMO" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" value="%{CDD_MEMO}" formIndex="1" /></bu:td>

		</tr>
		
	</table>
			<bu:jsVal formId="c5b9c9cc6c8445029a1854920fc91303" formIndex="1" />
				
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
		
		function addInfo(){    
		
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
            if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            } 
            if($("#paraMap1_CDD_DEVICE_SN").val() == null || $("#paraMap1_CDD_DEVICE_SN").val() ==""){
               	_alertValMsg($('#paraMap1_CDD_DEVICE_SN_SHOW'), "<dict:lang value="该项不能为空" />");
                 return ;
            }  
            if($("#paraMap1_CDD_STOP_TYPE").val() == null || $("#paraMap1_CDD_STOP_TYPE").val() ==""){
               	_alertValMsg($('#paraMap1_CDD_STOP_TYPE_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            }   
            if($("#paraMap1_CDD_STOP_REASON").val() == null || $("#paraMap1_CDD_STOP_REASON").val() ==""){
               	_alertValMsg($('#paraMap1_CDD_STOP_REASON'), "<dict:lang value="该项不能为空" />");
                 return ;
            }   
				
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5117e9be58be4489b87b464fb5808908";
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
