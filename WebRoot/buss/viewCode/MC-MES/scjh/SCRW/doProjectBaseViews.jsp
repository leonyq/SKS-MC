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
<body style="overflow:auto;">
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
								listKey="id" listValue="name" value=""  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                	
                	
                </div>
			    <div class="optn">
			        <button type="button" onclick="add(this,'<c:out value="${formId}" />');">
                    <i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel">
                    </i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
          <input type="hidden" name="exeid" value="${exeid}">
		  <input type="hidden" name="definedMsg" value="${definedMsg}">
          <input type="hidden" name=iframeId value="${iframeId}">
          <input type="hidden" name="formId" value="${formId}">
          <input type="hidden" name="dataId" value="${dataId}">
		<bu:set name="paraMapObj" value="${dataId}" formId="e8615feea3564a5db39792538a2cd754" type="add" />
<div class="mod">
<div class="mod-hd">   
    <h3 class="tit"><dict:lang value="基本信息" /></h3>	
	<table class="basic-table" >
    <s:hidden id ="curId" name="curId" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}'/>
	<s:hidden id ="curUser" name="curUser" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="e8615feea3564a5db39792538a2cd754" />
	<input type="hidden" id="prefixInd" name="e8615feea3564a5db39792538a2cd754" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
    
		<s:set name="_$viewId" value="'0edffb0875924620a47e0cd739bdcad3'" />
		<s:set name="_$formId_1" value="'e8615feea3564a5db39792538a2cd754'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
          <!--
			<td class="name-six" /><span class="dot">*</span>
          	<bu:uitn colNo="ID" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="ID" formId="e8615feea3564a5db39792538a2cd754" value="%{ID}" formIndex="1" dataId="${dataId}" /></bu:td>-->
            <td class="name-six" style="width:83px;"/>
            <bu:uitn colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="PROJECT_ID" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>			
			
            <td class="name-six" style="width:83px;"/>
            <bu:uitn colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="PRODUCT_MATERIAL" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
  			<td class="name-six" style="width:83px;"/>
            <bu:uitn colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="PRODUCT_NAME" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
		</tr>
		<tr>       			
      		<td class="name-six" style="width:83px;" />
            <bu:uitn colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="FINISH_COUNT" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" value="%{FINISH_COUNT}" dataId="${dataId}" formIndex="1"  /></bu:td>
  			
         	<td class="name-six" style="width:83px;"/>
            <bu:uitn colNo="SCRAPPED_QTY" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="SCRAPPED_QTY" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="SCRAPPED_QTY" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
					
			<td class="name-six" style="width:83px;"/>
            <bu:uitn colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754" >
            <bu:ui colNo="PRODUCT_COUNT" style="width:200px;" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
						
			</tr>
		
		
	</table>

			<bu:jsVal formId="e8615feea3564a5db39792538a2cd754" formIndex="1" />
				
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
  function setHid(){
$("#datagrid-btable-ajaxe8615feea3564a5db39792538a2cd754 tbody:last").append("<input name='PROJECT_ID' type='hidden' value='"+$("#paraMapObj_PROJECT_ID").val()+"'>");
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
