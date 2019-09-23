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
			        <button type="button" onclick="doSave();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cc0dce4648de4a599b01d4057a2b2c46" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cc0dce4648de4a599b01d4057a2b2c46" />
	<input type="hidden" id="prefixInd" name="cc0dce4648de4a599b01d4057a2b2c46" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e8595bf9af794f588aec425acbde3d97'" />
		<s:set name="_$formId_1" value="'cc0dce4648de4a599b01d4057a2b2c46'" />
		<s:set name="_$type" value="'add'" />
   
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PROJECT_ID}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{LOT_NUMBER}" formIndex="1" /></bu:td>
      
  </tr>
		<tr>
          <td class="name-six" /><bu:uitn colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PM_CHECK_USER}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PM_CHECK_STUST}" formIndex="1"  /></bu:td>
   
  </tr>
  		<tr id="checkMonid" style="visibility:hidden"   >
  			<td class="name-six" /><bu:uitn colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td colspan="3" cssClass="dec-self" colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{CHECK_MON}" formIndex="1" style="margin: 0px; width: 635px; height: 156px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="cc0dce4648de4a599b01d4057a2b2c46" formIndex="1" />		<div style="padding:1px;"></div>

		

				
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
  
 $(function () {
        initParam();
      
   
    });
  function initParam() {
        $("#paraMap1_PROJECT_ID_SHOW").val('${dataMap.PROJECT_ID}');
        $("#paraMap1_PROJECT_ID").val('${dataMap.PROJECT_ID}');

        $("#paraMap1_LOT_NUMBER").val('${dataMap.LOT_NUMBER}');

        $("#paraMap1_CHECK_USER_SHOW").val('${dataMap.CHECK_USER}');
        $("#paraMap1_CHECK_USER").val('${dataMap.CHECK_USER}');

        $("#paraMap1_PROJECT_SORT").val('${dataMap.PROJECT_SORT}');
    
      
        
    }
 function doSave(){
       var projectId = $("#paraMap1_PROJECT_ID").val();
   	   var lotNumber = $("#paraMap1_LOT_NUMBER").val();
       var checkUser = $("#paraMap1_CHECK_USER").val();
       var checkStauts = $("#paraMap1_PM_CHECK_STUST").val();
       var checkMon = $("#paraMap1_CHECK_MON").val();
   	   console.log("projectId>>>");
       console.log(projectId);
   	   console.log("lotNumber>>>");
       console.log(lotNumber);
   	   console.log("checkUser>>>");
   	   console.log(checkUser);
   	   console.log("checkStauts>>>");
       console.log(checkStauts);
       console.log("checkMon>>>");
       console.log(checkMon);
       document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8070dc8f502448ee8967bcafe1ca2a65" +
            "&projectId=" + projectId + "" +
            "&lotNumber=" + lotNumber + "" +
            "&checkUser=" + checkUser + "" +
            "&checkStauts=" + checkStauts + "" +
            "&checkMon=" + checkMon + "" ;
        document.forms.addForm.submit();
 }
 $("#paraMap1_PM_CHECK_STUST").bind("change",function(event){
   var a = $("#paraMap1_PM_CHECK_STUST").val();
   if(a == '0'){
     $("#checkMonid").css("visibility","hidden");
   }else{
     $("#checkMonid").css("visibility","visible");
   }
})



</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
