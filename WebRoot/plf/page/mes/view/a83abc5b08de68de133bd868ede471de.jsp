<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查看详情" /></title>
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
</head>
<body style="min-width:100px;">
	<div class="edit">
            		
			<div class="bd">
			<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
				<bu:formet exeid="%{exeid}" />>
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="formId" value="${formId}">
				<input type="hidden" name="dataId" value="${dataId}">
				
	<table class="basic-table">
	<input type="hidden" name="formIds" value="eb80ecea7f894fadab4d944dd970b7ad" />
	<input type="hidden" name="eb80ecea7f894fadab4d944dd970b7ad" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6cd47a42975649508d9db895baf78be6'" />
		<s:set name="_$formId_1" value="'eb80ecea7f894fadab4d944dd970b7ad'" />
		<s:set name="_$type" value="'edit'" />
		
		<tr>
			<td class="name " style="width:82px;"><bu:uitn colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:20%;"/></td>
			<td style="padding-left:5px;"><bu:ui colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly" style="width:300px;height:100%;"/></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="DETAIL" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td height="80px" style="padding-left:5px;"><bu:ui colNo="DETAIL" formId="eb80ecea7f894fadab4d944dd970b7ad" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"  style="width:300px;height:100%;"/></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="REASON" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td height="80px" style="padding-left:5px;"><bu:ui colNo="REASON" formId="eb80ecea7f894fadab4d944dd970b7ad" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"  style="width:300px;height:100%;"/></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="COUNTERMOVE" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td height="80px" style="padding-left:5px;"><bu:ui colNo="COUNTERMOVE" formId="eb80ecea7f894fadab4d944dd970b7ad" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"  style="width:300px;height:100%;"/></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="EXAMINE_DETAILS" formId="eb80ecea7f894fadab4d944dd970b7ad"/></td>
			<td height="80px" style="padding-left:5px;"><bu:ui colNo="EXAMINE_DETAILS" formId="eb80ecea7f894fadab4d944dd970b7ad" dataId="${dataId}" formIndex="1" cssClass="readonly" readonly="readonly"  style="width:300px;height:100%;"/></td>
		</tr>
	</table>
			<bu:jsVal formId="eb80ecea7f894fadab4d944dd970b7ad" formIndex="1" />
			</form>

		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
		
		function reloadPg(msg){
			isQuery = false;
			parent.reloadPg(msg);;
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
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
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
$(function(){
	$(".bd").css("height",$(document).height()-25);
});
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
