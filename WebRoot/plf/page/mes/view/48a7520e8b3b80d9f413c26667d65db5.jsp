<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
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
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i>重置</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" target="submitFrame"
				                <bu:formet exeid="%{exeid}" />>
				                <input type="hidden" name="exeid" value="${exeid}">
				                <input type="hidden" name="formId" value="e3558d63d4ed4352aaa6efa1c2bebf82">
				                <input type="hidden" name="dataId" value="${dataId}">
				  
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="e3558d63d4ed4352aaa6efa1c2bebf82" />
	<input type="hidden" name="e3558d63d4ed4352aaa6efa1c2bebf82" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#STAFF_NAME" id="paraMap1_STAFF_NAME" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />">
		<s:set name="_$viewId" value="'8a4b1f87073e47b5adaef0077ae59272'" />
		<s:set name="_$formId_1" value="'e3558d63d4ed4352aaa6efa1c2bebf82'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_TYPE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="PROJECT_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{PROJECT_ID}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="CUSTOMER_ID" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{CUSTOMER_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_TIME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_HOURS}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="WORK_EXTRA_HOURS" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{WORK_EXTRA_HOURS}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="STAFF_NAME" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><input type="text" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />" disabled="disabled" class="input" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-four" /><bu:uitn colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="TASK_ARRANGE_PROPLE" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{TASK_ARRANGE_PROPLE}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-four" /><bu:uitn colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" ><bu:ui colNo="REMARK" formId="e3558d63d4ed4352aaa6efa1c2bebf82" value="%{REMARK}" formIndex="1" /></bu:td>
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
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
