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
		<bu:set name="paraMapObj" value="${dataId}" formId="734fa2159c4344848a3c1b5584c17b2b" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="734fa2159c4344848a3c1b5584c17b2b" />
	<input type="hidden" id="prefixInd" name="734fa2159c4344848a3c1b5584c17b2b" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'7e964d51824b45a6b4f692079641b227'" />
		<s:set name="_$formId_1" value="'734fa2159c4344848a3c1b5584c17b2b'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_FLAG" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_FLAG" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_FLAG" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_MATERIAL_VER" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL_VER" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_MATERIAL_VER" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ERPTYPE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ERPTYPE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_ERPTYPE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_CONFIGURE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_CONFIGURE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_CONFIGURE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CHANGE_TIMES" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHANGE_TIMES" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PM_CHANGE_TIMES" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_START" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_START" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_SN_START" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_PACK_SEQ" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_PACK_SEQ" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_PACK_SEQ" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_PREFIX" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_PREFIX" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_SN_PREFIX" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_SN_END" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_SN_END" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_SN_END" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="FAI_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="FAI_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="FAI_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_STEP" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_STEP" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_STEP" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="ID" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="ID" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_STANDARD" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_STANDARD" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_STANDARD" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="SCRAPPED_QTY" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="SCRAPPED_QTY" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="SCRAPPED_QTY" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="DESTROY_NO" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="DESTROY_NO" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="DESTROY_NO" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CUST_CODE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="CUST_CODE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="CUST_CODE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FQC_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="FQC_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="FQC_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WORKING_SC" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="WORKING_SC" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="WORKING_SC" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_STATUS" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_STATUS" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_STATUS" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_TYPE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_TYPE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_TYPE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROLEPSIS_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROLEPSIS_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROLEPSIS_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROLEPSIS_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROLEPSIS_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROLEPSIS_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="TPPB_PLAN_DELIVERY_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="TPPB_PLAN_DELIVERY_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_MEMO" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PM_MEMO" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PM_MEMO" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PRODUCT_LINE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PRODUCT_LINE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PRODUCT_LINE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="ACTUAL_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="ACTUAL_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="ACTUAL_START_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="ACTUAL_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="ACTUAL_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="ACTUAL_END_DATE" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CLOSE_REASON" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CLOSE_REASON" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PM_CLOSE_REASON" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PM_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PM_OFONESELF" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_CHECK_STUST" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHECK_STUST" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PM_CHECK_STUST" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="IS_REL" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="IS_REL" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="IS_REL" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="REL_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="REL_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="REL_NUM" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_SORT" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_SORT" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="PROJECT_SORT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CHECK_MON" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_MON" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="CHECK_MON" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CHECK_USER" formId="734fa2159c4344848a3c1b5584c17b2b" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_USER" formId="734fa2159c4344848a3c1b5584c17b2b" ><bu:ui colNo="CHECK_USER" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="734fa2159c4344848a3c1b5584c17b2b" formIndex="1" />		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="LEO-包装物料单" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('5a4ae0bc729d430dac8d2d784e4687c5','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('5a4ae0bc729d430dac8d2d784e4687c5','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner5a4ae0bc729d430dac8d2d784e4687c5">
								<bu:addSub formid="734fa2159c4344848a3c1b5584c17b2b" formIndex="2"  selfformid="5a4ae0bc729d430dac8d2d784e4687c5" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'5a4ae0bc729d430dac8d2d784e4687c5')" >
							<table class="glxb-table" style="width:100%" id="addTable_5a4ae0bc729d430dac8d2d784e4687c5" >
								<tbody id="tbody_5a4ae0bc729d430dac8d2d784e4687c5" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
<script>
function initEditDataLs(){
getEditRows("5a4ae0bc729d430dac8d2d784e4687c5","2","734fa2159c4344848a3c1b5584c17b2b","","0510a29df5354c2c96aa45c07d3a0773","");
$('table').find('tbody tr:eq(0)').click();
}
</script>

									
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
