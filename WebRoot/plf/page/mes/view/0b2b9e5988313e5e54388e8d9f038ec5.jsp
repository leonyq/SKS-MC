<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head style="min-width:100px;">
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
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
		function fact_end(){
		var speed = $("#paraMap1_TASK_SPEED").val();
		if(speed==100){
		 $("#fact_end_time").removeClass("fact_end");
		}else{
		$("#fact_end_time").addClass("fact_end");
		}
		
		}
	</script>
	<style type="text/css">
	.fact_end{
	display:none;
	}
	</style>
</head>
<body>
	<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="saveNew(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="definedMsg" value="${definedMsg}">
				<!--<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />-->
				<s:token />
				
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="121d75526df14c93911ca0559faa8d52" />
	<input type="hidden" name="121d75526df14c93911ca0559faa8d52" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_TASK_ID" name="paraMap1@0#TASK_ID" value="${dataId}">
		<s:set name="_$viewId" value="'ae43b0bcc508410db1e9d4cc4512975b'" />
		<s:set name="_$formId_1" value="'121d75526df14c93911ca0559faa8d52'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:147px;"><span class="dot"></span><bu:uitn colNo="FEEDBACK_TIME" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td class="dec"><bu:ui colNo="FEEDBACK_TIME" formId="121d75526df14c93911ca0559faa8d52" value="%{FEEDBACK_TIME}" style="width:300px;" formIndex="1"/></td>
		</tr>
		<tr>
			<td class="name"><span class="dot"></span><bu:uitn colNo="FEEDBACK_PERSON" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td class="dec"><bu:ui colNo="FEEDBACK_PERSON" formId="121d75526df14c93911ca0559faa8d52" value="%{FEEDBACK_PERSON}" style="width:300px;" formIndex="1"/></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="TASK_SPEED" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td class="dec" ><bu:ui colNo="TASK_SPEED" formId="121d75526df14c93911ca0559faa8d52" value="%{TASK_SPEED}" onblur="fact_end();" style="width:300px;" formIndex="1"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot"></span><bu:uitn colNo="NEED_TIME" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td class="dec"><bu:ui colNo="NEED_TIME" formId="121d75526df14c93911ca0559faa8d52" value="%{NEED_TIME}" style="width:300px;" formIndex="1"/></td>
		</tr>
		<tr>
			<td class="name"><bu:uitn colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec" ><bu:ui colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{FACT_BEG_TIME}" cssClass="_VAL_NULL input isSubmit _VAL_OjbsData" style="width:300px;" formIndex="2" /></td>
		</tr>
		<tr id="fact_end_time" class="fact_end">
			<td class="name"><bu:uitn colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec" ><bu:ui colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" value="%{FACT_END_TIME}" style="width:300px;" formIndex="2" /></td>
		</tr>
		<tr>
		<td class="name"><span>已使用工时<span></span></span></td>
		<td class="dec" ><input class=" input isSubmit  _VAL_OjbsData" style="width:300px;" id="oldrealtime" disabled="disabled">
		</tr>
		<tr>
		<td class="name"><span>当前分值<span></span></span></td>
		<td class="dec" ><input class=" input isSubmit  _VAL_OjbsData" style="width:300px;" id="oldscore" disabled="disabled">
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="IMPLEMENT_STATUS" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td  class="dec"  style="height:80px;" ><bu:ui colNo="IMPLEMENT_STATUS" formId="121d75526df14c93911ca0559faa8d52" value="%{IMPLEMENT_STATUS}" style="width:300px;height:100%;" formIndex="1"/></td>
			
		</tr>
		<tr>
			
			<td class="name " ><bu:uitn colNo="NEED_ASSISTANCE" formId="121d75526df14c93911ca0559faa8d52" /></td>
			<td  class="dec" style="height:80px;"><bu:ui colNo="NEED_ASSISTANCE" formId="121d75526df14c93911ca0559faa8d52" value="%{NEED_ASSISTANCE}" style="width:300px;height:100%;" formIndex="1" /></td>
		</tr>
		<tr>
			
			<td colspan="2" style="padding-left: 5px;">注：1、新建的尚未反馈过的任务不存在实际工时，当前分值亦为0 <br />
			2、每次反馈后进行一次计算，当进度不为100时，完成时间自动取当前时间，此时已用工时远比实际工时值小<br />
			3、当前分值计算公式=任务分值*预估工时/实际工时or已用工时(实际工时越比预估工时小，当前分数越大) 
					</td><span style="color:red">ps:时间控件崩掉的请清下浏览器缓存</span>
		</tr>
		
	</table>
			<bu:jsVal formId="121d75526df14c93911ca0559faa8d52" formIndex="1" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
	}//初始化方法
	$("#paraMap1_FEEDBACK_TIME").val('${dataMap.nowDate}');
	$("#paraMap1_FEEDBACK_PERSON").val('${dataMap.userId}');
	$("#paraMap2_FACT_BEG_TIME").val('${dataMap.factBegTime}');
	$("#paraMap2_FACT_END_TIME").val('${dataMap.factEndTime}');
	$("#oldrealtime").val('${dataMap.reaHours}');
	$("#oldscore").val('${dataMap.completionScore}');
	
</script>
<bu:script viewId="ae43b0bcc508410db1e9d4cc4512975b" />
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
