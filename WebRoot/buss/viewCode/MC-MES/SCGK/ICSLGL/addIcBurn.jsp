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
			<div class="bd" style="height:410px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c1036359818b474286d53dc1952f10c2" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c1036359818b474286d53dc1952f10c2" />
	<input type="hidden" name="c1036359818b474286d53dc1952f10c2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'143ecdfb843047c88464a9db33cbe25f'" />
		<s:set name="_$formId_1" value="'c1036359818b474286d53dc1952f10c2'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:75px"/><span class="dot">*</span><bu:uitn colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_ITEM_SN}" formIndex="1" /></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_WORKSTATION_SN}" formIndex="1" /></td>
			
			<td class="name" style="width:70px"/><span class="dot">*</span><bu:uitn colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec"><bu:ui colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_MO_NUMBER}" formIndex="1" /></td>
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" ><bu:ui colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_NUM}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<bu:td cssClass="dec" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" colspan="5" style="height:200px;"><bu:ui style="width:100%;" colNo="IB_FILE" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_FILE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="dec" colspan="5" ><bu:ui colNo="IB_REMARK" formId="c1036359818b474286d53dc1952f10c2" value="%{IB_REMARK}" formIndex="1" style="width:100%;height:80px;"/></td>
			
		</tr>
	</table>
			<bu:jsVal formId="c1036359818b474286d53dc1952f10c2" formIndex="1" />
				
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
            if($("#paraMap1_IB_ITEM_SN").val() == null || $("#paraMap1_IB_ITEM_SN").val() ==""){
               	_alertValMsg($('#paraMap1_IB_ITEM_SN'), "<dict:lang value="该项不能为空" />");
                 return ;
            }  
            if($("#paraMap1_IB_WORKSTATION_SN").val() == null || $("#paraMap1_IB_WORKSTATION_SN").val() ==""){
               	_alertValMsg($('#paraMap1_IB_WORKSTATION_SN_SHOW'), "<dict:lang value="该项不能为空" />");
                 return ;
            } 	
            if($("#paraMap1_IB_MO_NUMBER").val() == null || $("#paraMap1_IB_MO_NUMBER").val() ==""){
               	_alertValMsg($('#paraMap1_IB_MO_NUMBER_SHOW'), "<dict:lang value="该项不能为空" />");
                 return ;
            }   			
            if($("#paraMap1_IB_NUM").val() == null || $("#paraMap1_IB_NUM").val() ==""){
               	_alertValMsg($('#paraMap1_IB_NUM'), "<dict:lang value="该项不能为空" />");
                 return ;
            }  
            if(!(/^(\+|-)?\d+$/.test($("#paraMap1_IB_NUM").val())) && $("#paraMap1_IB_NUM").val()!=""){
                _alertValMsg($('#paraMap1_IB_NUM'), "<dict:lang value="该项只能为正整数" />");
                 return ;
            }
            if(parseInt($("#paraMap1_IB_NUM").val())==0 && $("#paraMap1_IB_NUM").val()!=""){
                _alertValMsg($('#paraMap1_IB_NUM'), "<dict:lang value="该项只能为正整数" />");
                 return ;
            }
				
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");

            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=ff1f7166be1a4396ad01ca83a24306d1";
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
