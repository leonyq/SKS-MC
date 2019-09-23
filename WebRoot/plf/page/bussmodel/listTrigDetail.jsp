<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="公用页面列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
<style type="text/css">
table#listTable tr td input {
	border: none;
}

table#listTable tr td:nth-child(2) {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

table#listTable tr td:nth-child(5) {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>

	<div class="all">
		<div class="table_div">
			<form id="searchForm" name="searchForm"
				action="${path}sys/BussModelAction_queryListConfig.ms" method="post">
				<s:hidden
					name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<s:hidden id="moduleId" name="paraMap.moduleId" />
				<s:hidden id="moduleName" name="paraMap.moduleName" />
				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
				<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
				<table class="search_table" style="margin: 15px;">
					<tr>
						<td >
						  	<span><dict:lang value="触发器名称" /></span>
						  	<s:textfield id="triggerName" name="trigsh.triggerName"
										cssClass="input_sh" maxlength="33"  />
					  	</td>
						<td >
							<span><dict:lang value="描述信息" /></span>
						  	<s:textfield id="dec" name="trigsh.dec" cssClass="input_sh" maxlength="120" />
					  	</td>
						<td>
						    <input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
					  	</td>
				    </tr>
			</table>
				
			</form>
			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<thead>
					<tr class="tdcolor">
						<th style="width: 40px;"><dict:lang value="序号" />
						</th>
						<th style="width: 40px;"><input type="checkbox"
							onclick='selectAll(this)'>
						</th>
						<th style="width: 300px;"><dict:lang value="触发器名称" />
						</th>
						<th><dict:lang value="描述信息" />
						</th>
					</tr>
				</thead>
				<tbody>

					<s:iterator value="trigList" id="trigger" status="index">
						<tr id="<s:property value="#trigger.id"/>">
							<td><s:property value="#index.count" />
							</td>
							<td ><input name='id' type="checkbox"
								value="<c:out value='${trigger.id}'/>"
								onchange="selectChange(this,'<c:out value='${trigger.workType}'/>','<c:out value='${trigger.triggerName}'/>')">
							</td>
							<td title="<c:out value='${trigger.triggerName}'/>" />
							<c:out value='${trigger.triggerName}' />
							</td>
							<td title="<s:property value="#trigger.dec"/>"><s:property
									value="#trigger.dec" />
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>

		<div id="currentPageDiv" class="table_div"></div>
			<s:include value="/plf/common/layui_pagination.jsp" />
		</div>

	</div>

	<div style="display: none;">
	</div>

	<script type="text/javascript">
function selectChange(obj,type,name) {
		var moduleId = $("#moduleId").val();
		var id = obj.value;
		var jsonObj = window.parent.exportModule;
		if(jsonObj==null||jsonObj==undefined){
			jsonObj=[];
		}
		if(type=='4'){
			util.alert("请勿选择事务类型为发送邮件的触发器！");
			obj.checked=false;
			return;
		}
		if(!jsonObj[moduleId]) {
			jsonObj[moduleId] = [];
		}
		if(obj.checked) {
			jsonObj[moduleId].push({
				"id": obj.value,
				"name": name,
				"type": "trig"
			});
		} else {
			var index = indexOf(jsonObj[moduleId], obj.value);
			if(index != -1) {
				jsonObj[moduleId].splice(index, 1);
			}

		}
		if(jsonObj[moduleId].length == 0) {
			delete jsonObj[moduleId];
		}

		console.log(jsonObj)
	}

	function selectAll(obj) {
		
		
		if(obj.checked) {
			var dom = $("input[type='checkbox'][name='id']:not(:checked)");
			dom.prop("checked",obj.checked);
			dom.trigger("change");
		}else {
			var dom = $("input[type='checkbox'][name='id']:checked");
			dom.prop("checked",obj.checked);
			dom.trigger("change");
		}
	}
	
	
	
	function indexOf(arr, id) {
		for(var i = 0; i < arr.length; i++) {
			if(arr[i].id == id) {
						return i;
			}

		}

		return -1;
	}
	
	
	
	//包含业务模型子集
	function containDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		return false;
	}
	
	
	//从已选择的项目中勾选
	$(function() {
		var moduleType = $("#moduleType").val();
		var exportModule = window.parent.exportModule;
			for(key in exportModule) {
				if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
					if(key == document.getElementById("moduleId").value) {
						var moduleDetailArr = exportModule[key];
						$("input[type='checkbox'][name='id']").each(function(i,e) {
							if(containDetail(moduleDetailArr, e.value)) {
								e.checked = true;
							}
						});
					}
				}
			}
	});
	

</script>
	<script type="text/javascript">
	function query(thisObj){
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);<%-- 设置table点击行颜色 --%>
		_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
	}
	
	init();

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>