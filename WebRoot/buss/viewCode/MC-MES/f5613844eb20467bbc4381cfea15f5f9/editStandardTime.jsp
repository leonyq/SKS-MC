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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd"  style="height:250px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b6074af91db439aa8e73c486b484970" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b6074af91db439aa8e73c486b484970" />
	<input type="hidden" name="9b6074af91db439aa8e73c486b484970" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ec8047888d1f4305a31c3c609e1c00ee'" />
		<s:set name="_$formId_1" value="'9b6074af91db439aa8e73c486b484970'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-three" style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STEP_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_NAME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_NAME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_AREA_SN" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_ITEM_SPEC" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_ITEM_SPEC" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:105px;"/><span class="dot">*</span><bu:uitn colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_MODEL_CODE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_STANDARD_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_PROCESS_FACE" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" style="width:150px;"/><span class="dot">*</span><bu:uitn colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CHANGE_TIME" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CHANGE_TIME" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><!--<span class="dot">*</span>--><bu:uitn colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_CT_ID" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_CT_ID" style="width:200px;" formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-three" style="width:120px;"/><bu:uitn colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_SCHEDULE_FLAG" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_SCHEDULE_FLAG"  formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="CST_TRACK" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<bu:td cssClass="dec-self" colNo="CST_TRACK" formId="9b6074af91db439aa8e73c486b484970" ><bu:ui colNo="CST_TRACK" style="width:200px;"  formId="9b6074af91db439aa8e73c486b484970" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9b6074af91db439aa8e73c486b484970" formIndex="1" />
									
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
    <script  type="text/javascript">
    
    $('#paraMapObj_CST_STANDARD_TIME').bind('keyup', function () {
	            var calwStart=$("#paraMapObj_CST_STANDARD_TIME");
             if(!/^[0-9]+([.]{1}[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMapObj_CST_STANDARD_TIME'),"<dict:lang value="请输入正数或小数不超过两位" />");
             }
         });
    
    
                    var isQuery = false;
                    function edit(thisObj){
                        if(isQuery){util.alert("?数据正在提交，请稍候...");}
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!val.valDataBaseSetData()){
                            return ;
                        }
                        if(!valData()){
                            return ;
                        }
                        if(!val.valOjbsData()){
                            return ;
                        }
                        if($("#paraMapObj_CST_STANDARD_TIME").val()==0){
                            $("#paraMapObj_CST_STANDARD_TIME").val("");
                            _alertValMsg($('#paraMapObj_CST_STANDARD_TIME'),"<dict:lang value="请输入正数或小数不超过两位" />");
                            return ;
                        }
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
                        var id="${dataId}";
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=7256481f955949d6830c62eb7d6b6814&id="+id;
                        document.forms.editForm.submit();
                        isQuery = true;
                    }
                    
                   
         
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
