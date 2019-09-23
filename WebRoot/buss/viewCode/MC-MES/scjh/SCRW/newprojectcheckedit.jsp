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
		<bu:set name="paraMapObj" value="${dataId}" formId="541d3515e85544be83e239b158f30ab4" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="541d3515e85544be83e239b158f30ab4" />
	<input type="hidden" id="prefixInd" name="541d3515e85544be83e239b158f30ab4" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d8deaf8cee1249bf804122eedb0ae72d'" />
		<s:set name="_$formId_1" value="'541d3515e85544be83e239b158f30ab4'" />
		<s:set name="_$type" value="'edit'"/>
		 <tr>
			<td   class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td  colspan="3" cssClass="dec-self" colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" value="%{PROJECT_ID}" formIndex="1" /></bu:td>
		 </tr>
         <tr>
           	<td class="name-six" /><bu:uitn colNo="T2#PROJECT_STATUS" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td  cssClass="dec-self" colNo="T2#PROJECT_STATUS" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#PROJECT_STATUS" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#PROJECT_STATUS}" formIndex="1" /></bu:td>
		
  			<td class="name-six" /><bu:uitn colNo="T2#LOT_NUMBER" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="T2#LOT_NUMBER" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#LOT_NUMBER" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#LOT_NUMBER}" formIndex="1" /></bu:td>
        </tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="T2#PRODUCT_MATERIAL" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td cssClass="dec-self" colNo="T2#PRODUCT_MATERIAL" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#PRODUCT_MATERIAL" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#PRODUCT_MATERIAL}" formIndex="1" /></bu:td>
	        <td class="name-six" /><bu:uitn colNo="T2#PRODUCT_NAME" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="T2#PRODUCT_NAME" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#PRODUCT_NAME" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#PRODUCT_NAME}" formIndex="1" /></bu:td>
        </tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="T2#PRODUCT_COUNT" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td cssClass="dec-self" colNo="T2#PRODUCT_COUNT" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#PRODUCT_COUNT" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#PRODUCT_COUNT}" formIndex="1" /></bu:td>
	        <td class="name-six" /><bu:uitn colNo="T2#FINISH_COUNT" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="T2#FINISH_COUNT" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="T2#FINISH_COUNT" formId="541d3515e85544be83e239b158f30ab4" value="%{T2#FINISH_COUNT}" formIndex="1" /></bu:td>
       </tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CHECK_STATUS" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_STATUS" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="CHECK_STATUS" formId="541d3515e85544be83e239b158f30ab4" value="%{CHECK_STATUS}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" value="%{CHECK_USER}" formIndex="1" /></bu:td>
  		</tr>
         <tr   >
			<td class="name-six" /><bu:uitn colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="3" cssClass="dec-self" colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" value="%{QT_MON}" formIndex="1" style="margin: 0px; width: 500px; height: 156px;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="541d3515e85544be83e239b158f30ab4" formIndex="1" />
									
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
<script type="text/javascript">
  
 $(function () {
        initParam();
      
   
    });
  function initParam() {
       
       $("#paraMapObj_PROJECT_ID_SHOW").val('${dataMap.PROJECT_ID}');
        $("#paraMapObj_PROJECT_ID").val('${dataMap.PROJECT_ID}');

        $("#paraMapObj_T2#LOT_NUMBER").val('${dataMap.LOT_NUMBER}');
        $("#paraMapObj_T2#PRODUCT_NAME").val('${dataMap.PRODUCT_NAME}');
        $("#paraMapObj_T2#PRODUCT_MATERIAL").val('${dataMap.PRODUCT_MATERIAL}');

        $("#paraMapObj_CHECK_USER_SHOW").val('${dataMap.CHECK_USER}');
        $("#paraMapObj_CHECK_USER").val('${dataMap.CHECK_USER}');

        $("#paraMapObj_T2#PRODUCT_COUNT").val('${dataMap.PRODUCT_COUNT}');
        $("#paraMapObj_T2#FINISH_COUNT").val('${dataMap.FINISH_COUNT}');
    	$("#paraMapObj_T2#PROJECT_STATUS").val('${dataMap.PROJECT_STATUS}');
    
        
    }


</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
