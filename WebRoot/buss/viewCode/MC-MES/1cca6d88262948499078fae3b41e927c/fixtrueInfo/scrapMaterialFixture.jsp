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
			        <button type="button" onclick="addScarp()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="f40408a50af34aafb9f5ccc3194cfbf7" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f40408a50af34aafb9f5ccc3194cfbf7" />
	<input type="hidden" name="f40408a50af34aafb9f5ccc3194cfbf7" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="scarp_id" id="scarp_id"/>
	<input type="hidden" name="cfs_item_type" id="cfs_item_type"/>
	
		<s:set name="_$viewId" value="'43d2da4a1b90409f8bd5f08b81cdec30'" />
		<s:set name="_$formId_1" value="'f40408a50af34aafb9f5ccc3194cfbf7'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name" style="width:98px"/><bu:uitn colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CTFS_TIN_SN}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_ITEM_CODE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_ASSISTANTTOOLNAME}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_ASSISTANTTOOLSPEC}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7"  colspan="4"><bu:ui colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_SUPPLIER}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_SCARP_TYPE}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec" colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_SCARP_REASON}" formIndex="1" style="width:300px;height:80px;"/></bu:td>
		</tr>
		
		
		 
	</table>
			<bu:jsVal formId="f40408a50af34aafb9f5ccc3194cfbf7" formIndex="1" />
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
                <bu:submit viewId="43d2da4a1b90409f8bd5f08b81cdec30" />
		<bu:script viewId="43d2da4a1b90409f8bd5f08b81cdec30" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").removeAttr("disabled");
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").removeAttr("disabled");
		$("#paraMap1_CFI_SUPPLIER").removeAttr("disabled");
		
		$("#").attr("readonly","readonly");
		$("#").addClass("readonly"); 
		
		$("#paraMap1_CTFS_TIN_SN").attr("readonly","readonly");
		$("#paraMap1_CTFS_TIN_SN").addClass("readonly");
		
		$("#paraMap1_CFS_ITEM_CODE").attr("readonly","readonly");
		
		$("#paraMap1_CFS_ITEM_CODE").addClass("readonly"); 
		
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly");
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").addClass("readonly"); 
		
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly");
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").addClass("readonly"); 
		
		$("#paraMap1_CFI_SUPPLIER").attr("readonly","readonly");
		$("#paraMap1_CFI_SUPPLIER").addClass("readonly"); 
		
		
		$("#paraMap1_CTFS_TIN_SN").val('<c:out value="${dataMap.ctfsTinSn}" />');
		$("#paraMap1_CFS_ITEM_CODE").val('<c:out value="${dataMap.cfsItemCode}" />');
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").val('<c:out value="${dataMap.cfiAssistanttoolName}" />');
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").val('<c:out value="${dataMap.cfiAssistanttoolSpec}" />');
		$("#paraMap1_CFI_SUPPLIER").val('<c:out value="${dataMap.cfiSupplier}" />');
		
		$("#scarp_id").val('<c:out value="${dataMap.scarpId}" />');
		$("#cfs_item_type").val('<c:out value="${dataMap.cfsItemType}" />');
		
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	function addScarp(){
            $('#paraMap1_CFS_SCARP_TYPE').addClass('_VAL_NULL'); 
            if(!val.valNullData()){ 
            				return ;
            			}
            if(!val.valDataBaseSetData()){
		        return ;
	       	}			
              if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
            	$("#addForm").append($("#isCloseWin").clone());
            	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
              }
             document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=89680bdb7b314cd68b15b4f1e2f2964f"; 
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
 

