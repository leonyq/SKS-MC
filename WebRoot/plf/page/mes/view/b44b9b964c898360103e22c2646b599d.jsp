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
<body>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    <div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="addForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
				                <bu:formet exeid="%{exeid}" />>
				                <input type="hidden" name="exeid" value="${exeid}">
				                <input type="hidden" name="formId" value="e3558d63d4ed4352aaa6efa1c2bebf82">
				                <input type="hidden" name="dataId" value="${dataId}">
				  
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e3558d63d4ed4352aaa6efa1c2bebf82" />
	<input type="hidden" name="e3558d63d4ed4352aaa6efa1c2bebf82" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e6c928591c444dd6b3db2e6054359d2d'" />
		<s:set name="_$formId_1" value="'e3558d63d4ed4352aaa6efa1c2bebf82'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><input type="text" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}"/>" disabled="disabled" class="input"/></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
	</table>
			<bu:jsVal formId="e3558d63d4ed4352aaa6efa1c2bebf82" formIndex="1" />
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
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
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
