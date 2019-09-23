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
	<jsp:param name="layui" value="1" />
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

	<div class="all" >
		<div>

			<form id="searchForm" name="searchForm"
				action="${path}sys/moduleMagAction_queryListConfig.ms" method="post">
				<s:hidden
					name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<s:hidden id="moduleId" name="paraMap.moduleId" />
				<s:hidden id="moduleName" name="paraMap.moduleName" />
				
				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
				<table class="search_table">
					<tr>
						<td>
						<!--  
						<td width="100%">
							<div class="search_div">
								<div
									style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
									class="search_text">
									<dict:lang value="触发器名称" />
								</div>
								<div class="search_value">
									<s:textfield id="triggerName" name="trigsh.triggerName"
										cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div
									style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
									class="search_text">
									<dict:lang value="描述信息" />
								</div>
								<div class="search_value">
									<s:textfield id="dec" name="trigsh.dec" cssClass="input_sh"
										maxlength="300" cssStyle="width:132px;" />
								</div>
							</div> <input type="button" id="searchButtonId"
							value="<dict:lang value="查询" />" onclick="query(this)"
							class="botton_img_add" /></td>
							-->
							
					  	<div class="search_table_wrap">
				         <span><dict:lang value="触发器名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="triggerName" name="trigsh.triggerName" cssClass="input_sh"
							 maxlength="33"  />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="描述信息" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="dec" name="trigsh.dec"
							cssClass="input_sh" maxlength="300"  />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				             <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
				          </div>
				        </div>
					  	
					  	</td>
					</tr>
				</table>
			</form>
			
			<div class="table_div">
			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<thead>
					<tr class="tdcolor">
						<th width="40px"><input type="checkbox" lay-skin="primary" 
							onclick='selectAll(this)' style="width:40px;height:18px;vertical-align: middle;">
						</th>
						
						<th width="40px"><dict:lang value="序号" />
						</th>
						
						<th><dict:lang value="触发器名称" />
						</th>
						<th><dict:lang value="描述信息" />
						</th>
					</tr>
				</thead>
				<tbody>

					<s:iterator value="trigList" id="trigger" status="index">
						<tr id="<s:property value="#trigger.id"/>">
							<td width="5%"><input name='id' lay-skin="primary" type="checkbox" style="width:40px;height:18px;vertical-align: middle;"
								value="<c:out value='${trigger.id}'/>"
								onchange="selectChange(this,'<c:out value='${trigger.workType}'/>','<c:out value='${trigger.websClientId}'/>','<c:out value='${trigger.moduleName}'/>')">
							</td>
							
							<td><s:property value="#index.count" />
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
		</div>
<%--
		<div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div>
--%>

<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
</div>

	</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame"
		method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
function selectChange(obj,type,wsId,moduleName) {
		var moduleId = $("#moduleId").val();
		var mname = $("#moduleName").val();
		if(mname==moduleName){
		}
		if(obj.checked==true){
			if(moduleName!=undefined&&moduleName!=""&&moduleName!=mname){
				util.alert("选择此模块会导致与"+moduleName+"模块冲突,本模块将无法与"+moduleName+"模块共同安装")
			}
		}
		var id = obj.value;
		if(type=='4'){
			util.alert("请勿选择事务类型为发送邮件的触发器！");
			obj.checked=false;
			return;
		}
		var jsonObj = window.parent.exportModule;
		if(jsonObj==null||jsonObj==undefined){
			jsonObj=[];
		}
		if(!jsonObj.websId) {
			jsonObj.websId = [];
		}
		if(type=='2'){
			if(obj.checked) {
				jsonObj.websId.push({
					"id": wsId,
				});
			}else{
				var index = indexOf(jsonObj.websId, wsId);
				if(index != -1) {
					jsonObj.websId.splice(index, 1);
				}
				if(jsonObj.websId.length == 0) {
					delete jsonObj.websId;
				}
			}
		}
		
		if(!jsonObj[moduleId]) {
			jsonObj[moduleId] = [];
		}
		if(obj.checked) {
			jsonObj[moduleId].push({
				"id": obj.value,
				"moduleName": moduleName,
				"modType": "trig"
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
		//_pageCurrentPageObj.value="1";
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