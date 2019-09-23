<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		.dialog-bd{
			background-color: #fff;
		}
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
</head>
<body style="background-color: #fff;">
	<div class="edit">
           
			<div class="bd" style="border-bottom: none;border-top: none;">
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b18994844b049f2ad90204b77793334" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b18994844b049f2ad90204b77793334" />
	<input type="hidden" name="9b18994844b049f2ad90204b77793334" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ec823fed1ac84f8f9578bbba6c7d40a1'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'detail'"/>
		<s:set name="_$viewId" value="'69fe2024e89444a8a67ed6e64203e245'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'detail'" />
		
		<tr>
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
			<td class="name" style="width:96px"/><bu:uitn colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROJECT_ID" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
			<td class="name" style="width:84px"/><bu:uitn colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PRODUCT_STEP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_AREA_SN" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}"  style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PCB_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PCB_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
		    	<td class="name" /><bu:uitn colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MODEL_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TECH_SN" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		    
			<td class="name" /><bu:uitn colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_START_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_END_GROUP" formId="9b18994844b049f2ad90204b77793334" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" disabled="disabled" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_UNIT_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	                <td class="name" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_JIGSAW_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
	
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SN_RULE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SUB_RULE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		        <td class="name" /><bu:uitn colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_REPAIR_MAX" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;"  formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" />   </td>
			<bu:td cssClass="dec" colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" >
				<bu:ui colNo="PM_ERROR_SCRAP" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" formIndex="1" />
				&#x3000;&#x3000;&#x3000;&#x3000;
				<bu:uitn colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" />
				<bu:ui colNo="PM_AUTO_FQC" formId="9b18994844b049f2ad90204b77793334" onclick="fqcChange(this)" dataId="${dataId}" formIndex="1" />
				
			</bu:td>
			
			
		    <td class="name" /><bu:uitn colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_FQC_NUM" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_CONTROL_TYPE" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:200px;" formIndex="1" /></bu:td>

		</tr>
		
		
		<tr>
		
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" colspan="5"><bu:ui colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" dataId="${dataId}" style="width:100%;height:80px;"  formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9b18994844b049f2ad90204b77793334" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff')
			});
		
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
