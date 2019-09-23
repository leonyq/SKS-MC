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
	<form id="editForm" name="editForm"  method="post" target="submitFrame"
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
		<bu:set name="paraMapObj" value="${dataId}" formId="606ab631c74a4689ac10de3e9f0843c3" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="606ab631c74a4689ac10de3e9f0843c3" />
	<input type="hidden" id="prefixInd" name="606ab631c74a4689ac10de3e9f0843c3" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cb84792bf5aa4abf8ca88ba024ecdb69'" />
		<s:set name="_$formId_1" value="'606ab631c74a4689ac10de3e9f0843c3'" />
		<s:set name="_$type" value="'edit'"/>
        <tr>
      	   <td class="name-six" /><bu:uitn colNo="PM_CHECK_STUST" formId="606ab631c74a4689ac10de3e9f0843c3" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHECK_STUST" formId="606ab631c74a4689ac10de3e9f0843c3" ><bu:ui colNo="PM_CHECK_STUST" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
		
        </tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="606ab631c74a4689ac10de3e9f0843c3" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="606ab631c74a4689ac10de3e9f0843c3" ><bu:ui colNo="PROJECT_ID" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><bu:uitn colNo="PROJECT_STATUS" formId="606ab631c74a4689ac10de3e9f0843c3" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_STATUS" formId="606ab631c74a4689ac10de3e9f0843c3" ><bu:ui colNo="PROJECT_STATUS" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="IS_REL" formId="606ab631c74a4689ac10de3e9f0843c3" /></td>
			<bu:td cssClass="dec-self" colNo="IS_REL" formId="606ab631c74a4689ac10de3e9f0843c3" ><bu:ui colNo="IS_REL" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name-six" /><bu:uitn colNo="LOT_NUMBER" formId="606ab631c74a4689ac10de3e9f0843c3" /></td>
			<bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="606ab631c74a4689ac10de3e9f0843c3" ><bu:ui colNo="LOT_NUMBER" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PM_MEMO" formId="606ab631c74a4689ac10de3e9f0843c3"  /></td>
			<bu:td cssClass="dec-self" colNo="PM_MEMO" formId="606ab631c74a4689ac10de3e9f0843c3"  ><bu:ui colNo="PM_MEMO" formId="606ab631c74a4689ac10de3e9f0843c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
		
	</table>
			<bu:jsVal formId="606ab631c74a4689ac10de3e9f0843c3" formIndex="1" />
									
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
<script>
	 <%--保存处理--%>
  function edit(thisObj){
    var projectId = $("#paraMapObj_PROJECT_ID").val();
    var pmCheckStust = $("#paraMapObj_PM_CHECK_STUST").val();
    var pmMemo = $("#paraMapObj_PM_MEMO").val();
    console.log("projectId: >>> ");
    console.log(projectId);
    console.log("pmCheckStust: >>> ");
    console.log(pmCheckStust);
    console.log("pmMemo: >>> ");
    console.log(pmMemo);
    if(pmCheckStust ==""){
       utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择检测结果" />", 0, "260", "");
    }
    console.log("11111");
    $("#paraMap1_PROJECT_FLAG_1").attr("disabled", "disabled");
        if (flag == true) {
            $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            $DisInput.attr("disabled", false);
            if ($("#isCloseWin") && $("#editForm").find("#isCloseWin").length == 0) {
                $("#editForm").append($("#isCloseWin").clone());
                $("#editForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
            }
          console.log("11111");
            $("#saveBtn").prop("disabled", "disabled");
            var ckval = $("#PROJECT_OFONESELF").val();
            var flag = $("#paraMap1_PROJECT_FLAG_1").val();
            consolse("ckval>>>>"+ckval);
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=fc5b36d415474ad0b10a0ef7e3f1ecc0&projectId=" + projectId + "&pmCheckStust=" + pmCheckStust + "&pmMemo=" + pmMemo ;
            

            isQuery = true;
            $DisInput.attr("disabled", true);
            parentWindow.query("");
            $("#paraMap1_PROJECT_FLAG_1").removeAttr("disabled");
         
          if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
 
        }
}  
</script>