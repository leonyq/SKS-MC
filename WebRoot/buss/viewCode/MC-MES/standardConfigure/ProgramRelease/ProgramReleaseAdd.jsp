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
  
 
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame" enctype="multipart/form-data" >
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
								listKey="id" listValue="name" value=""  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                	
                	
                </div>
			    <div class="optn">
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:250px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2a9942a26d914db48edc771637fd9721" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2a9942a26d914db48edc771637fd9721" />
	<input type="hidden" id="prefixInd" name="2a9942a26d914db48edc771637fd9721" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a382c5a2fc35445b90f1458d15dd1bbf'" />
		<s:set name="_$formId_1" value="'2a9942a26d914db48edc771637fd9721'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CAU_SYS_NAME" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<bu:td cssClass="dec-self"  colNo="CAU_SYS_NAME" formId="2a9942a26d914db48edc771637fd9721" ><bu:ui colNo="CAU_SYS_NAME" style="width:340px;"  name="upFile" formId="2a9942a26d914db48edc771637fd9721" value="%{CAU_SYS_NAME}" formIndex="1" /></bu:td>
		</tr>
	
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CAU_TYPE" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<bu:td cssClass="dec-self" colNo="CAU_TYPE" formId="2a9942a26d914db48edc771637fd9721" ><bu:ui colNo="CAU_TYPE" style="width:340px;" formId="2a9942a26d914db48edc771637fd9721" value="%{CAU_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CAU_VERSION" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<bu:td cssClass="dec-self" colNo="CAU_VERSION" formId="2a9942a26d914db48edc771637fd9721" ><bu:ui colNo="CAU_VERSION" style="width:340px;" formId="2a9942a26d914db48edc771637fd9721" value="%{CAU_VERSION}" formIndex="1" /></bu:td>
		</tr>
		
	

		<tr>
			<td class="name-three" /><bu:uitn colNo="CAU_MEMO" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<bu:td cssClass="dec-self" colNo="CAU_MEMO" formId="2a9942a26d914db48edc771637fd9721"  colspan="4"><bu:ui colNo="CAU_MEMO" style="width:340px;height:80px;" formId="2a9942a26d914db48edc771637fd9721" value="%{CAU_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="2a9942a26d914db48edc771637fd9721" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


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
                 if($("#paraMap1_CAU_SYS_NAME").val()==""){
				_alertValMsg($("#paraMap1_CAU_SYS_NAME"), "<dict:lang value="该项不能为空" />");
				return;
			}
			     if($("#paraMap1_CAU_TYPE").val()==""){
				_alertValMsg($("#paraMap1_CAU_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
				return;
			}
			    if($("#paraMap1_CAU_VERSION").val()==""){
				_alertValMsg($("#paraMap1_CAU_VERSION"), "<dict:lang value="该项不能为空" />");
				return;
			}
                    if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
        				$("#addForm").append($("#isCloseWin").clone());
        				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
        			}
			        $("#saveBtn").prop("disabled","disabled");
                        
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=406fe5ff796440c18b5e4de9fdc06095";
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
