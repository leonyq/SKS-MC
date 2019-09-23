<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 350px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7e97b82277324898b85d8a12875adab9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="7e97b82277324898b85d8a12875adab9" />
	<input type="hidden" name="7e97b82277324898b85d8a12875adab9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'831ebaf8a0e14a9cbfc590e3e2320040'" />
		<s:set name="_$formId_1" value="'7e97b82277324898b85d8a12875adab9'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:220px;" colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SUPERIOR_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STAROGE_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_RELATE_ORDERSET}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_IP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_CAPACITY}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_FLAG}" formIndex="1" /></bu:td>
		    	
            
			
	    </tr>
	    <!--
	    <tr>
			<td class="name" /><bu:uitn colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_VOLUME}" formIndex="1" /></bu:td>
		
			
		</tr>
		-->
		<tr>
		<td class="name" /><bu:uitn colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" /></td>
		<bu:td cssClass="dec" colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_VOLUME}" formIndex="1" /></bu:td>
		
		<td class="name" /><bu:uitn colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_BAD_FLAG}" formIndex="1" /></bu:td>
	        
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" style="height:80px;" colspan="3" ><bu:ui colNo="WA_MEMO" style="height:100%;width:100%;" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_MEMO}" formIndex="1" /></bu:td>
		
		    
		</tr>
			
	</table>
			<bu:jsVal formId="7e97b82277324898b85d8a12875adab9" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="831ebaf8a0e14a9cbfc590e3e2320040" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	$("#paraMap1_WA_AREA_TYPE").val("1");
	$("#paraMap1_WA_AREA_TYPE").trigger("chosen:updated");
	$("#paraMap1_WA_SUPERIOR_SN").val("");
	$("#paraMap1_WA_STAROGE_TYPE").val("");
	$("#paraMap1_WA_STAROGE_TYPE").attr("disabled","disabled");
	$("#paraMap1_WA_STAROGE_TYPE").trigger("chosen:updated");
	$("#paraMap1_WA_STAROGE_TYPE").attr("class"," input isSubmit _VAL_OjbsData dept_select");
	$("#paraMap1_WA_SHELF_SN").attr("disabled","disabled");
	$("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit  readonly isaddSubmit");
})

function addCal(){
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
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6438cc22b7b843369320ee9dbb1d4c3d";
                        document.forms.addForm.submit();
                        isQuery = true;
}
</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
