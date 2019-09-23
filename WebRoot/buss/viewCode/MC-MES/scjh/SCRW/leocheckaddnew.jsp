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
		<bu:set name="paraMapObj" value="${dataId}" formId="541d3515e85544be83e239b158f30ab4" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="541d3515e85544be83e239b158f30ab4" />
	<input type="hidden" id="prefixInd" name="541d3515e85544be83e239b158f30ab4" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'98c283092eeb44f796153fbd53b0416a'" />
		<s:set name="_$formId_1" value="'541d3515e85544be83e239b158f30ab4'" />
		<s:set name="_$type" value="'add'" />
         <tr>
			<td   class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td    cssClass="dec-self" colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui style="background-color:rgb(235, 235, 228);" colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" value="%{PROJECT_ID}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td colspan="2" cssClass="dec-self" colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" value="%{CHECK_USER}" formIndex="1" /></bu:td>
  		
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
	      	
        </tr>
         <tr id="checkMonid" style="visibility:hidden"   >
            <td class="name-six"  /><bu:uitn  colNo="BAD_REASONS" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<bu:td   cssClass="dec-self" colNo="BAD_REASONS" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="BAD_REASONS" formId="541d3515e85544be83e239b158f30ab4" value="%{BAD_REASONS}" formIndex="1" /></bu:td>
  			
			<td class="name-six"  /><bu:uitn colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<!--<bu:td colspan="2" cssClass="dec-self" colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" value="%{QT_MON}" formIndex="1" style="margin: 0px; width: 500px; height: 156px;"/></bu:td>-->
<bu:td colspan="2" cssClass="dec-self" colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" ><bu:ui colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" value="%{QT_MON}" formIndex="1" style="margin: 0px; width: 249px; height: 86px;"/></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="541d3515e85544be83e239b158f30ab4" formIndex="1" />
				
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
        $("#paraMap1_PROJECT_ID").css("background-color", "rgb(235, 235, 228)");

        $("#paraMap1_T2#LOT_NUMBER").val('${dataMap.LOT_NUMBER}');
        $("#paraMap1_T2#PRODUCT_NAME").val('${dataMap.PRODUCT_NAME}');
        $("#paraMap1_T2#PRODUCT_MATERIAL").val('${dataMap.PRODUCT_MATERIAL}');

        $("#paraMap1_CHECK_USER_SHOW").val('${dataMap.CHECK_USER}');
        $("#paraMap1_CHECK_USER").val('${dataMap.CHECK_USER}');

        $("#paraMap1_T2#PRODUCT_COUNT").val('${dataMap.PRODUCT_COUNT}');
        $("#paraMap1_T2#FINISH_COUNT").val('${dataMap.FINISH_COUNT}');
        if(${dataMap.PROJECT_STATUS}=='4';){
           $("#paraMap1_T2#PROJECT_STATUS").val('投料');
        }else if(${dataMap.PROJECT_STATUS}=='5';){
          $("#paraMap1_T2#PROJECT_STATUS").val('包装');
        }
    	
      
    
        
    }
 function doSave(){
       var projectId = $("#paraMap1_PROJECT_ID").val();
   	   var lotNumber = $("#paraMap1_T2#LOT_NUMBER").val();
   	   var productName = $("#paraMap1_T2#PRODUCT_NAME").val();
       var productMaterial = $("#paraMap1_T2#PRODUCT_MATERIAL").val();
       var checkUser = $("#paraMap1_CHECK_USER").val();
       var productCount =  $("#paraMap1_T2#PRODUCT_COUNT").val();
       var finishCount =  $("#paraMap1_T2#FINISH_COUNT").val();
       var projectStauts = $("#paraMap1_T2#PROJECT_STATUS").val();
       var checkMon = $("#paraMap1_QT_MON").val();
       var checkStatus= $("#paraMap1_CHECK_STATUS").val();
       var badReason =  $("#paraMap1_BAD_REASONS").val();
       if(checkStatus =="1"){
           if(checkMon == ""){
           utilsFp.confirmIcon(3,"","","", "不合格备注不能为空",0,"300","");
           return;
       }
           if(badReason == ""){
           utilsFp.confirmIcon(3,"","","", "不合格类型不能为空",0,"300","");
           return;
       }
       }
      
   	   console.log("projectId>>>");
       console.log(projectId);
   	   console.log("lotNumber>>>");
       console.log(lotNumber);
   	   console.log("checkUser>>>");
   	   console.log(checkUser);
   	   console.log("productMaterial>>>");
       console.log(productMaterial);
       console.log("checkMon>>>");
       console.log(checkMon);
       console.log("projectStauts>>>");
       console.log(projectStauts);
       console.log("finishCount>>>");
       console.log(finishCount);
       console.log("productCount>>>");
       console.log(productCount);
      console.log("checkStatus>>>");
       console.log(checkStatus);
    console.log("badReason>>>");
       console.log(badReason);
       document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=7e4b76544df14a499de2836a476c545b" +
            "&projectId=" + projectId + "" +
            "&lotNumber=" + lotNumber + "" +
            "&checkUser=" + checkUser + "" +
            "&checkStatus=" + checkStatus + "" +
            "&productMaterial=" + productMaterial + "" +
   			"&productCount=" + productCount + "" +
            "&finishCount=" + finishCount + "" +
   			"&projectStauts=" + projectStauts + "" +
             "&productName=" + productName + "" +
            "&badReason=" + badReason + "" +
            "&checkMon=" + checkMon + "" ;
        document.forms.addForm.submit();
 }
 $("#paraMap1_CHECK_STATUS").bind("change",function(event){
   var a = $("#paraMap1_CHECK_STATUS").val();
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
