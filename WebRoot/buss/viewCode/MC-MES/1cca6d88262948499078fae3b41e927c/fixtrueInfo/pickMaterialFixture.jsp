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
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
                <div style="margin-left:10px;">
                <div class="save-close" style="display:none;" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			        <button type="button" onclick="userSave();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2f4fc822bb494537ab1499c9b579f579" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2f4fc822bb494537ab1499c9b579f579" />
	<input type="hidden" name="2f4fc822bb494537ab1499c9b579f579" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="_cfi_id" id="_cfi_id" value="<c:out value='${dataMap.id}'/>"/>
		<input type="hidden" name="loginName" id="loginName" value=""/>
		<input type="hidden" name="opeator" id="opeator" value=""/>
	<input type="hidden" name="_ass_type" id="_ass_type" value="<c:out value='${dataMap.assistanttooltype}'/>"/>
		<s:set name="_$viewId" value="'8f3a4a810afb4cdbbb329a3344830130'" />
		<s:set name="_$formId_1" value="'2f4fc822bb494537ab1499c9b579f579'" />
		<s:set name="_$type" value="'add'" />
		
		<tr> 
			<td class="name" style="width:86px;"/><bu:uitn colNo="CFO_FIX_SN" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_FIX_SN" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_FIX_SN" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_FIX_SN}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><bu:uitn colNo="CFO_ITEM_CODE" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_CODE" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_ITEM_CODE" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_ITEM_CODE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><bu:uitn colNo="CFO_ITEM_NAME" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_NAME" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_ITEM_NAME" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_ITEM_NAME}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><bu:uitn colNo="CFO_ITEM_SPEC" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_SPEC" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_ITEM_SPEC" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_ITEM_SPEC}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><bu:uitn colNo="CFO_ITEM_CURUSER" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_CURUSER" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_ITEM_CURUSER" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_ITEM_CURUSER}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFO_OPEATOR" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFO_OPEATOR" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_OPEATOR" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_OPEATOR}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
		 
			<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec" colNo="CFI_MEMO" formId="2f4fc822bb494537ab1499c9b579f579"  colspan="4" ><bu:ui colNo="CFI_MEMO" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFI_MEMO}" formIndex="1" style="width:300px;height:80px;"/></bu:td>
		</tr>
		
		
		
		<!--<tr>
			
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFO_ITEM_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_ITEM_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_ITEM_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_ITEM_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFO_OPERATE_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_OPERATE_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_OPERATE_TYPE" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_OPERATE_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFO_OPERATE_TIME" formId="2f4fc822bb494537ab1499c9b579f579" /></td>
			<bu:td cssClass="dec-self" colNo="CFO_OPERATE_TIME" formId="2f4fc822bb494537ab1499c9b579f579" ><bu:ui colNo="CFO_OPERATE_TIME" formId="2f4fc822bb494537ab1499c9b579f579" value="%{CFO_OPERATE_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
		<td>&nbsp;</td>
			
		</tr>
		<tr>
			
			
		</tr>
		<tr>
			
		</tr>-->
	</table>
			<bu:jsVal formId="2f4fc822bb494537ab1499c9b579f579" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
  
        <bu:submit viewId="8f3a4a810afb4cdbbb329a3344830130" />
	<bu:script viewId="8f3a4a810afb4cdbbb329a3344830130" />
	
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		$("#paraMap1_CFO_ITEM_NAME").attr("disabled",false);
		$("#paraMap1_CFO_ITEM_SPEC").attr("disabled",false);
		$("#paraMap1_CFO_ITEM_CURUSER").attr("disabled",false);
		
		
		$("#paraMap1_CFO_FIX_SN").attr("readonly","readonly");
		$("#paraMap1_CFO_FIX_SN").addClass("readonly");
		
		$("#paraMap1_CFO_ITEM_CODE").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CODE").addClass("readonly");
		
		$("#paraMap1_CFO_ITEM_NAME").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_NAME").addClass("readonly");
		
		$("#paraMap1_CFO_ITEM_SPEC").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_SPEC").addClass("readonly");
		
		
		$("#paraMap1_CFO_ITEM_CURUSER").attr("readonly","readonly");
		$("#paraMap1_CFO_ITEM_CURUSER").addClass("readonly");
		
		
		
		$("#paraMap1_CFO_FIX_SN").val('<c:out value="${dataMap.cfi_fix_sn}" />');
		$("#paraMap1_CFO_ITEM_CODE").val('<c:out value="${dataMap.cfi_item_code}" />');
		$("#paraMap1_CFO_ITEM_NAME").val('<c:out value="${dataMap.assistanttoolname}" />');
		$("#paraMap1_CFO_ITEM_SPEC").val('<c:out value="${dataMap.assistanttoolspec}" />');
		$("#paraMap1_CFO_ITEM_CURUSER").val('<c:out value="${dataMap.curUser}" />');
		$("#loginName").val('<c:out value="${dataMap.loginName}" />');
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	
	function userSave(){
           // if($("#paraMap1_CFO_OPEATOR").val()==""){
            // _alertValMsg($("#paraMap1_CFO_OPEATOR_SHOW"),"%{getText('请选择领用人')}");
           // return;
          //  }
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
              var opa= $("#paraMap1_CFO_OPEATOR_SHOW").val(); 
              $("#opeator").val(opa);
              document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=763cb52d3a26432fb53ce6fc7f10ae76"; 
                       document.forms.addForm.submit();
}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
