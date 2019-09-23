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
<body style="    background-color: #fff;">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="b3b00ad970894885bd60a59ca296580c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b3b00ad970894885bd60a59ca296580c" />
	<input type="hidden" name="b3b00ad970894885bd60a59ca296580c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f5f9ff9ac7c849b782001bc779d8bf0d'" />
		<s:set name="_$formId_1" value="'b3b00ad970894885bd60a59ca296580c'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td style="width: 70px;text-align: right;"><bu:uitn colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="STAFF_NAME" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec" style="width: 230px;"><bu:ui colNo="WORK_TYPE" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;"><bu:uitn colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER_ID" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="PROJECT_ID" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;"><bu:uitn colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="TASK_ARRANGE_PEOPLE" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="WORK_TIME" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;"><span class="dot"></span><bu:uitn colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="WORK_HOURS" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
			<td style="text-align: right;"><bu:uitn colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td class="dec"><bu:ui colNo="WORK_EXTRA_HOURS" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td style="text-align: right;vertical-align: top;padding-top: 8px;"><bu:uitn colNo="REMARK" formId="b3b00ad970894885bd60a59ca296580c" /></td>
			<td colspan="3" height="80px" class="dec"><bu:ui colNo="REMARK" formId="b3b00ad970894885bd60a59ca296580c" dataId="${dataId}" style="width:100%;" formIndex="1" /></td>
		</tr>
		<tr>
			<td align="right"></td>
			<td colspan="3" style="padding-left: 5px;">注：1、工作时长为扣除中午休息的实际工作时长 <br />
					&#x3000;&#x3000;2、一天工作时长超过7.5小时即为加班时长 <br />
					&#x3000;&#x3000;3、工作时长和加班时长允许保留一位小数</td>
		</tr>
	</table>
			<bu:jsVal formId="b3b00ad970894885bd60a59ca296580c" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('padding','0')
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
