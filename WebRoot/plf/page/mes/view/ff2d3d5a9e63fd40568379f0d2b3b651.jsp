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
<body >
	<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i>重置</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>
			</div>
			<div class="bd">
			<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
				<bu:formet exeid="%{exeid}" />>
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="formId" value="fe095434a96d487688e6bcb3ff6dc09b">
				<input type="hidden" name="dataId" value="${dataId}">
				
	<table class="basic-table">
	<input type="hidden" name="formIds" value="fe095434a96d487688e6bcb3ff6dc09b" />
	<input type="hidden" name="fe095434a96d487688e6bcb3ff6dc09b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6cd47a42975649508d9db895baf78be6'" />
		<s:set name="_$formId_1" value="'fe095434a96d487688e6bcb3ff6dc09b'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="CREATE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="CREATE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" disabled="disabled" /></td>
			<td class="name "><bu:uitn colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" style="width:230px;"><bu:ui colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="CREATE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="CREATE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" style="width:100%" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1" style="width:100%;height:100%;" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1"  style="width:100%;height:100%;" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" dataId="${dataId}" formIndex="1"  style="width:100%;height:100%;" /></td>
		</tr>
	</table>
			<bu:jsVal formId="fe095434a96d487688e6bcb3ff6dc09b" formIndex="1" />
			</form>

		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
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
			utilsFp.alert(msg);
		}
		

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			utilsFp.showLoading();
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
					utilsFp.closeLoading();
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
					utilsFp.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			
			
			var dataList = $("#dataList").text();
			console.log(dataList);
			if(dataList!="null"){
			    var dataJson = JSON.parse(dataList);
			    alert(dataJson.KEY);
			}
		}
		$(function(){
		  init();
		})
		
	//重置	
	function resetForm(){
		$("#editForm")[0].reset();
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
