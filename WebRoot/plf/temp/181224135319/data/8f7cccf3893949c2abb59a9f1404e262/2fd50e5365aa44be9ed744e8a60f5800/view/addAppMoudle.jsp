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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:250px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1ffd63f684da4934aec487d50c796c67" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1ffd63f684da4934aec487d50c796c67" />
	<input type="hidden" id="prefixInd" name="1ffd63f684da4934aec487d50c796c67" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2fd50e5365aa44be9ed744e8a60f5800'" />
		<s:set name="_$formId_1" value="'1ffd63f684da4934aec487d50c796c67'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" style="width:90px;"/><span class="dot">*</span><bu:uitn colNo="TAM_MENU_ID" formId="1ffd63f684da4934aec487d50c796c67" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_ID" formId="1ffd63f684da4934aec487d50c796c67" ><bu:ui colNo="TAM_MENU_ID" formId="1ffd63f684da4934aec487d50c796c67" value="%{TAM_MENU_ID}" formIndex="1" /></bu:td>
		    
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="TAM_MOUDLE_NAME" formId="1ffd63f684da4934aec487d50c796c67" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MOUDLE_NAME" formId="1ffd63f684da4934aec487d50c796c67" ><bu:ui colNo="TAM_MOUDLE_NAME" formId="1ffd63f684da4934aec487d50c796c67" value="%{TAM_MOUDLE_NAME}" formIndex="1" /></bu:td>
			
        </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="TAM_SEQ" formId="1ffd63f684da4934aec487d50c796c67" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_SEQ" formId="1ffd63f684da4934aec487d50c796c67" ><bu:ui colNo="TAM_SEQ" formId="1ffd63f684da4934aec487d50c796c67" value="%{TAM_SEQ}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="1ffd63f684da4934aec487d50c796c67" formIndex="1" />
				
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
	
	<script>
	
	var isQuery = false;
	
	function add(){
	   // var l=$("#paraMap1_CPF_DESCRIBE").val();
	        
	    
		    if(isQuery){
    	        utilsFp.confirmIcon(1,"","","", "<dict:lang value="数据正在提交，请稍候..."/>",0,"300","");
    	        return ;
    	    }else{
		
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
    			
    			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
    			$DisInput.attr("disabled", false); 
    			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
    			 
    				$("#addForm").append($("#isCloseWin").clone());
    				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
    			}
    			$("#saveBtn").prop("disabled",true);
    	                    document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e7211d219d4c4aa9bf0cf429477a7d6f";
                            document.forms.addForm.submit();
                            isQuery = true;
    			$DisInput.attr("disabled", true);
			}
		}
	
	</script>
	


</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
