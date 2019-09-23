<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新任务" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
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
            		<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="save(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="resetForm();resetInit();"><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			   </div>
			</div>
			<div class="bd">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name=iframeId value="${iframeId}">
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="846ed3470b134d86aa1c860acc4e442c" />
	<input type="hidden" name="846ed3470b134d86aa1c860acc4e442c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'40dd3bebb86548a4a358040a36a824aa'" />
		<s:set name="_$formId_1" value="'846ed3470b134d86aa1c860acc4e442c'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name " style="width: 80px;"><bu:uitn colNo="PID" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			
		</tr>
		<tr>
			<td class="name "><span class="dot"></span><bu:uitn colNo="TASK_NAME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_NAME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_NAME}" formIndex="1" /></td>
			<td class="name " style="width: 90px;"><span class="dot"></span><bu:uitn colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"  style="width: 230px;"><bu:ui colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PROJECT_ID}" formIndex="1" /></td>
			
		</tr>
		<tr>
		     	<td class="name "><span class="dot"></span><bu:uitn colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_STATE}" formIndex="1" /></td>
	
			<td class="name "><span class="dot"></span><bu:uitn colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PRIORITY}" formIndex="1" /></td>
		</tr>
		<tr>
		    <td class="name "><bu:uitn colNo="TASK_DIFFICULTY" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_DIFFICULTY" formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_DIFFICULTY}" formIndex="1" /></td>
		    <td class="name "><span class="dot">*</span><bu:uitn colNo="TASK_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_SCORE}" formIndex="1" /></td>   
		</tr>
		
		<tr>
			<td class="name "><bu:uitn colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PUBLISHER}" formIndex="1" /></td>
		    <td class="name "><bu:uitn colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" value="%{EXECUTOR}" formIndex="1" /></td>
			
		</tr>
		
		<tr>
		     <td class="name "><bu:uitn colNo="CREATE_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="CREATE_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{CREATE_TIME}" formIndex="1" /></td>
	
			<td class="name "><bu:uitn colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{PLAN_OVER_TIME}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{FACT_BEG_TIME}" formIndex="1" /></td>
			<td class="name "><bu:uitn colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><input id="sfactendtime" type="text" value="${FACT_END_TIME}" disabled="disabled" class=" input isSubmit  _VAL_OjbsData">
			<bu:ui colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" type="hidden" value="%{FACT_END_TIME}" formIndex="1" /><!-- id="paraMap1_FACT_END_TIME" name="paraMap1@0#FACT_END_TIME" -->
			</td>
		</tr>
		<tr>
		     <td class="name "><span class="dot">*</span><bu:uitn colNo="OVER_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="OVER_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{OVER_HOURS}" formIndex="1" /></td>
	
			<td class="name "><span class="dot">*</span><bu:uitn colNo="LEA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="LEA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{LEA_HOURS}" formIndex="1" /></td>
		</tr>
		
		<tr>
		    <td class="name "><bu:uitn colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{SPEED_PROGRESS}" formIndex="1" /></td>
			
		        <td class="name "><bu:uitn colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec">
			<input id="sprehours" type="text" value="${PRE_HOURS}" disabled="disabled" class=" input isSubmit  _VAL_OjbsData">
			<bu:ui colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" type="hidden" value="%{PRE_HOURS}"  formIndex="1" />
			</td>
		</tr>
		<tr>
		     <td class="name "><bu:uitn colNo="REA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec">
			<input id="srealhours" type="text" value="${REA_HOURS}" disabled="disabled" class=" input isSubmit  _VAL_OjbsData">
			<bu:ui colNo="REA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" value="%{REA_HOURS}" type="hidden" formIndex="1" />
			</td>
	
			<td class="name "><bu:uitn colNo="COMPLETION_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec">
			<input id="scompletionscore" type="text" value="${COMPLETION_SCORE}" disabled="disabled" class=" input isSubmit  _VAL_OjbsData">
			<bu:ui colNo="COMPLETION_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" type="hidden" value="%{COMPLETION_SCORE}" formIndex="1" />
			</td>
		</tr>
		<tr>
			<td class="name " ><bu:uitn colNo="TASK_DESC" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="TASK_DESC"  formId="846ed3470b134d86aa1c860acc4e442c" value="%{TASK_DESC}" style="width:100%;height:100%;" formIndex="1" /></td>
		</tr>
		<tr>
			<td align="left" style="text-align: right;"></td>
			<td colspan="3" style="padding-left: 5px;">注：1、实际工时=实际完成时间-实际开始时间+加班工时-请假工时(扣除双休) <br />
					&#x3000;&#x3000;2、完成分值计算公式=任务分值(常规为100)*预估工时/实际工时 <br />
					&#x3000;&#x3000;3、预估工时计算公式=计划完成时间-创建时间+加班时间-请假工时(扣除双休)</td>
		</tr>
	</table>
			<bu:jsVal formId="846ed3470b134d86aa1c860acc4e442c" formIndex="1" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
                <bu:submit viewId="40dd3bebb86548a4a358040a36a824aa" />
                <bu:script viewId="40dd3bebb86548a4a358040a36a824aa" />
<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	resetInit();
	function resetInit(){
	$("#paraMap1_CREATE_TIME").val('${dataMap.nowDate}');
	$("#paraMap1_PUBLISHER").val('${dataMap.userId}');
	$("#paraMap1_SPEED_PROGRESS").val(0);
	$("#scompletionscore").val(0);
	$("#paraMap1_COMPLETION_SCORE").val(0);
	$("#srealhours").val(0);
	$("#paraMap1_REA_HOURS").val(0);
	$("#paraMap1_LEA_HOURS").val(0);
	$("#paraMap1_OVER_HOURS").val(0);
	}		
		
	function resetForm(){
		$("#addForm")[0].reset();
	}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
