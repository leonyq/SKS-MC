<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
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
	<style type="text/css">
	.idDisplay{
	display:none;
	}
	</style>
</head>
<body >
	<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="editTask(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>
			</div>
			<div class="bd">
			<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
				<bu:formet exeid="%{exeid}" />>
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="formId" value="${formId}">
				<input type="hidden" name="dataId" value="${dataId}">
				
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="846ed3470b134d86aa1c860acc4e442c" />
	<input type="hidden" name="846ed3470b134d86aa1c860acc4e442c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'86d6965b2b4545cf9ee783ee26fcf179'" />
		<s:set name="_$formId_1" value="'846ed3470b134d86aa1c860acc4e442c'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name " style="width:80px;"><bu:uitn colNo="PID" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec" ><bu:ui colNo="PID" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
			<td class="idDisplay"><bu:ui colNo="ID" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot"></span><bu:uitn colNo="TASK_NAME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_NAME" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
			<td class="name " style="width:90px;"><span class="dot"></span><bu:uitn colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec" style="width:230px"><bu:ui colNo="PROJECT_ID" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
			
		</tr>
		<tr>
		        <td class="name "><span class="dot"></span><bu:uitn colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_STATE" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
	
			<td class="name "><span class="dot"></span><bu:uitn colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PRIORITY" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
		</tr>
		<tr>
		    <td class="name "><bu:uitn colNo="TASK_DIFFICULTY" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_DIFFICULTY" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
		    <td class="name "><span class="dot">*</span><bu:uitn colNo="TASK_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="TASK_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>   
		</tr>
		
		
		<tr>
			<td class="name "><bu:uitn colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PUBLISHER" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
		        <td class="name "><bu:uitn colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="EXECUTOR" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
			
		</tr>
		<tr>
		        <td class="name "><bu:uitn colNo="CREATE_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="CREATE_TIME" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
	
			<td class="name "><bu:uitn colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PLAN_OVER_TIME" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="FACT_BEG_TIME" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
			<td class="name "><bu:uitn colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="FACT_END_TIME" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  formIndex="1" /></td>
		</tr>
		<tr>
		     <td class="name "><span class="dot">*</span><bu:uitn colNo="OVER_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui  colNo="OVER_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
	
			<td class="name "><span class="dot">*</span><bu:uitn colNo="LEA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui  colNo="LEA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		        <td class="name "><bu:uitn colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="SPEED_PROGRESS" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
		        <td class="name "><bu:uitn colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec"><bu:ui colNo="PRE_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		     <td class="name "><bu:uitn colNo="REA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec">
			<!-- <input id="srealhours" type="text" value="${REA_HOURS}" disabled="disabled" class=" input isSubmit  _VAL_OjbsData"> -->
			<bu:ui colNo="REA_HOURS" formId="846ed3470b134d86aa1c860acc4e442c" readonly="readonly" dataId="${dataId}"  formIndex="1" />
			</td>
	
			<td class="name "><bu:uitn colNo="COMPLETION_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td class="dec">
			
			<bu:ui colNo="COMPLETION_SCORE" formId="846ed3470b134d86aa1c860acc4e442c" disabled="disabled" dataId="${dataId}" formIndex="1" />
			</td>
		</tr>	
		<tr>
			<td class="name " ><bu:uitn colNo="TASK_DESC" formId="846ed3470b134d86aa1c860acc4e442c" /></td>
			<td colspan="3" class="dec" style="height:80px;"><bu:ui colNo="TASK_DESC" formId="846ed3470b134d86aa1c860acc4e442c" dataId="${dataId}"  style="width:100%;height:100%" formIndex="1" /></td>
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
         
         <bu:submit viewId="86d6965b2b4545cf9ee783ee26fcf179" />
                <bu:script viewId="86d6965b2b4545cf9ee783ee26fcf179" /> 
	<script type="text/javascript">
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			util.alert(msg);
		}

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
		       
		        addClass();
			//initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		function addClass(){
		       
		        $("#paraMapObj_OVER_HOURS").addClass("_VAL_OjbsData");
			$("#paraMapObj_LEA_HOURS").addClass("_VAL_OjbsData");
			$("#paraMapObj_SPEED_PROGRESS").addClass("_VAL_OjbsData");
			$("#paraMapObj_FACT_END_TIME").addClass("_VAL_OjbsData readonly");
			$("#paraMapObj_PRE_HOURS").addClass("_VAL_OjbsData readonly");
			$("#paraMapObj_REA_HOURS").addClass("_VAL_OjbsData readonly");			
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
		
	//重置	
	function resetForm(){
		$("#editForm")[0].reset();
	}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
