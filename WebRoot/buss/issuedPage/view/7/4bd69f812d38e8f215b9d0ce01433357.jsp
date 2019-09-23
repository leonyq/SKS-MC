<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="536730f0f221402c8ddc9bb284b26acc" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="536730f0f221402c8ddc9bb284b26acc" />
	<input type="hidden" name="536730f0f221402c8ddc9bb284b26acc" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c2ae53dbf8ac4b0a9b697c918a1c3bb1'" />
		<s:set name="_$formId_1" value="'536730f0f221402c8ddc9bb284b26acc'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:71px"/><bu:uitn colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:65px"/><bu:uitn colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" style="width:235px" colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SUPPLIER_CODE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		
			<td class="name" /><bu:uitn colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<bu:td cssClass="dec" colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" ><bu:ui colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="536730f0f221402c8ddc9bb284b26acc" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff');
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
