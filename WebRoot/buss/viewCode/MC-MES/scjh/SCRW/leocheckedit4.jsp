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
			    	        <button type="button" onclick="check(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<!--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button> -->
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="babee6ce442b4845a836dca6dd0ffdad" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="babee6ce442b4845a836dca6dd0ffdad" />
	<input type="hidden" id="prefixInd" name="babee6ce442b4845a836dca6dd0ffdad" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2b316d00b18c453ab2dbfc85f074dce7'" />
		<s:set name="_$formId_1" value="'babee6ce442b4845a836dca6dd0ffdad'" />
		<s:set name="_$type" value="'edit'"/>
     
		
		<tr>
          	<td class="name-four" /><bu:uitn colNo="PROJECT_ID" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="PROJECT_ID" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
	
            <td class="name-four" /><bu:uitn colNo="T2#LOT_NUMBER" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="T2#LOT_NUMBER" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="T2#LOT_NUMBER" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
          	<td class="name-four" /><bu:uitn colNo="T2#PRODUCT_MATERIAL" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="T2#PRODUCT_MATERIAL" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="T2#PRODUCT_MATERIAL" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name-four" /><bu:uitn colNo="T2#PRODUCT_NAME" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="T2#PRODUCT_NAME" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="T2#PRODUCT_NAME" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
          	<td class="name-four" /><bu:uitn colNo="T2#PRODUCT_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="T2#PRODUCT_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="T2#PRODUCT_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="T2#FINISH_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="T2#FINISH_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="T2#FINISH_COUNT" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
          	<td class="name-four" /><bu:uitn colNo="CHECK_STATUS" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_STATUS" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="CHECK_STATUS" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="CHECK_USER" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_USER" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="CHECK_USER" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr id='checkMonid' style="visibility:hidden">

          	<td class="name-four" /><bu:uitn colNo="BAD_REASONS" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="BAD_REASONS" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="BAD_REASONS" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="QT_MON" formId="babee6ce442b4845a836dca6dd0ffdad" /></td>
			<bu:td cssClass="dec-self" colNo="QT_MON" formId="babee6ce442b4845a836dca6dd0ffdad" ><bu:ui colNo="QT_MON" formId="babee6ce442b4845a836dca6dd0ffdad" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			
	</table>
			<bu:jsVal formId="babee6ce442b4845a836dca6dd0ffdad" formIndex="1" />
									
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
<script>
  $(function(){
    var a = $("#paraMapObj_CHECK_STATUS").val();
    if(a == '0'){
     $("#checkMonid").css("visibility","hidden");
   }else{
     $("#checkMonid").css("visibility","visible");
   }
  });
  
  
  $("#paraMapObj_CHECK_STATUS").bind("change",function(event){
   var a = $("#paraMapObj_CHECK_STATUS").val();
   if(a == '0'){
     $("#checkMonid").css("visibility","hidden");
     $("#paraMapObj_QT_MON").val("");
   }else{
     $("#checkMonid").css("visibility","visible");
     
   }
});
 function check(e){
   var a = $("#paraMapObj_CHECK_STATUS").val();
   var b = $("#paraMapObj_BAD_REASONS").val();
   var c = $("#paraMapObj_QT_MON").val();
   //"请选择".equals($("#paraMapObj_BAD_REASONS_chosen").find("a").find("span").eq(0).text())
   if(a == '1'){
     if( b == ""){
      utilsFp.confirmIcon(3,"","","", "不合格类型不能为空",0,"300","");
      return;
     }
     if(c == ""){
      utilsFp.confirmIcon(3,"","","", "不合格备注不能为空",0,"300","");
      return;
     }
   }
   edit(e);
 }

</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
