<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5a94bc73341487cb6fc5f9c0ee93e9d" />
	<input type="hidden" name="c5a94bc73341487cb6fc5f9c0ee93e9d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c59a8ed0c9284d78a45ce2b30b37ad76'" />
		<s:set name="_$formId_1" value="'c5a94bc73341487cb6fc5f9c0ee93e9d'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:128px;" /><span class="dot">*</span><bu:uitn colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="width:300px;"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d"><bu:ui colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="width:300px;height:80px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="c5a94bc73341487cb6fc5f9c0ee93e9d" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_CEC_TYPE").trigger("chosen:updated");
			$("#paraMapObj_CEC_LEVEL").trigger("chosen:updated");
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
