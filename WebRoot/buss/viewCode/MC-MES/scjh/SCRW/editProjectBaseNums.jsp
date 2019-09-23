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
<body style="overflow:auto;">
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
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="e8615feea3564a5db39792538a2cd754" type="edit" />
<div class="mod">
<div class="mod-hd">   
<h3 class="tit"><dict:lang value="基本信息" /></h3>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e8615feea3564a5db39792538a2cd754" />
	<input type="hidden" id="prefixInd" name="e8615feea3564a5db39792538a2cd754" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cb54d59cd9854a158766023642add118'" />
		<s:set name="_$formId_1" value="'e8615feea3564a5db39792538a2cd754'" />
		<s:set name="_$type" value="'edit'"/>
	<!--	
      <tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_STATUS" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_STATUS" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_STATUS" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="IS_REL" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="IS_REL" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="IS_REL" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="LOT_NUMBER" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="LOT_NUMBER" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_FLAG" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_FLAG" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_FLAG" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_MATERIAL_VER" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL_VER" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_MATERIAL_VER" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ERPTYPE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ERPTYPE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_ERPTYPE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_CONFIGURE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_CONFIGURE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_CONFIGURE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CHANGE_TIMES" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHANGE_TIMES" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PM_CHANGE_TIMES" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_START" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_START" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_SN_START" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_PACK_SEQ" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_PACK_SEQ" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_PACK_SEQ" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_PREFIX" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_PREFIX" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_SN_PREFIX" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_END" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_END" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_SN_END" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FAI_NUM" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="FAI_NUM" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="FAI_NUM" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_STEP" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_STEP" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_STEP" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ID" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="ID" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_STANDARD" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_STANDARD" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_STANDARD" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="SCRAPPED_QTY" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="SCRAPPED_QTY" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="SCRAPPED_QTY" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="DESTROY_NO" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="DESTROY_NO" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="DESTROY_NO" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CUST_CODE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="CUST_CODE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="CUST_CODE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="FQC_COUNT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="FQC_COUNT" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="FQC_COUNT" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WORKING_SC" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="WORKING_SC" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="WORKING_SC" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_TYPE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_TYPE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROJECT_TYPE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROLEPSIS_START_DATE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROLEPSIS_START_DATE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROLEPSIS_START_DATE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROLEPSIS_END_DATE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROLEPSIS_END_DATE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PROLEPSIS_END_DATE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="TPPB_PLAN_DELIVERY_DATE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="TPPB_PLAN_DELIVERY_DATE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_MEMO" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PM_MEMO" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PM_MEMO" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_LINE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_LINE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PRODUCT_LINE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ACTUAL_START_DATE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="ACTUAL_START_DATE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="ACTUAL_START_DATE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ACTUAL_END_DATE" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="ACTUAL_END_DATE" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="ACTUAL_END_DATE" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CLOSE_REASON" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CLOSE_REASON" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PM_CLOSE_REASON" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PM_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PM_OFONESELF" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CHECK_STUST" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHECK_STUST" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="PM_CHECK_STUST" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="REL_NUM" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="REL_NUM" formId="e8615feea3564a5db39792538a2cd754" ><bu:ui colNo="REL_NUM" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="PROJECT_SORT" formId="e8615feea3564a5db39792538a2cd754" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_SORT" formId="e8615feea3564a5db39792538a2cd754"  colspan="7"><bu:ui colNo="PROJECT_SORT" formId="e8615feea3564a5db39792538a2cd754" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
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
			<bu:jsVal formId="e8615feea3564a5db39792538a2cd754" formIndex="1" />  <div style="padding:1px;"></div>
  </div>					
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
<Script type="text/javascript">
	function() editProjectStatus;{
      $.ajax({
        type:"post",
        dataType:"",
        type:"",
        data:{
          
        },
        success:function(data){
          
        },
        error:
        function(msg){
          
        }

      });
      		
      
}
</Script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
