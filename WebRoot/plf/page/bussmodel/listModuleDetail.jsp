<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模型菜单树型列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div class="table_div" style="margin-top: 15px;">
	<form id="search_form" name="searchForm" action="" method="post">
		<input type="hidden" id="MID" name="MID" value="<c:out value='${paraMap.MID }' />"/>
		<input type="hidden" id="moduleType" name="moduleType" value="<c:out value='${moduleExportType }' />"/>
		<input type="hidden" id="moduleName" name="moduleName" value="<c:out value='${paraMap.moduleName }' />"/>
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width: 40px;"><input type="checkbox" onclick='selectAll(this)'></th>
			<th style="width: 40px;"><dict:lang value="序号" /></th>
			<th style="width: 300px;">ID</th>
			<th ><dict:lang value="名称" /></th>
			<th style="width: 100px;"><dict:lang value="类型" /></th>
		</tr>
		</thead>
	<tbody >
		<c:forEach items="${moduleDetailList }" var="moduleDetail" varStatus="status">
			<tr>
				<%--type： 1持久模型 2表单模型 3视图模型 4类管理 5公用类 6公用视图--%>
				<td ><input name='id' type="checkbox" value="<c:out value='${moduleDetail.ID }' />"  onchange="selectChange(this)"></td>
				<td ><c:out value='${status.count }' /></td>
				<td title="<c:out value='${moduleDetail.ID  }' />" ><c:out value='${moduleDetail.ID  }' /></td>
				<td id="<c:out value='${moduleDetail.ID }' />_name" title="<c:out value='${moduleDetail.NAME }' />" ><c:out value='${moduleDetail.NAME }' /></td>
				<td >
				<input type="hidden" id = "<c:out value='${moduleDetail.ID }' />_type" name="type" value="<c:out value='${moduleDetail.TYPE }' />">
				<input type="hidden" id = "<c:out value='${moduleDetail.ID }' />_type_2" name="type2" value="<c:out value='${moduleDetail.TYPE2}' />">
				<input type="hidden" id = "<c:out value='${moduleDetail.ID }' />_type_2" name="type2" value="<c:out value='${moduleDetail.TYPE2}' />">
				<c:if test="${moduleDetail.TYPE == '1'}"><dict:lang value="持久模型" /></c:if> 
				<c:if test="${moduleDetail.TYPE == '2'}"><dict:lang value="表单模型" /></c:if>
				<c:if test="${moduleDetail.TYPE == '3'}"><dict:lang value="视图模型" /></c:if>
				<c:if test="${moduleDetail.TYPE == '4'}"><dict:lang value="类管理" /></c:if>
				<c:if test="${moduleDetail.TYPE == '5'}">
						<c:if test="${moduleDetail.TYPE2 == '0' }">
							<dict:lang value="普通类" />
						</c:if>
						<c:if test="${moduleDetail.TYPE2 == '1' }">
							<dict:lang value="公用类" />
						</c:if>
					</c:if>
				<c:if test="${moduleDetail.TYPE == '6'}">
					<c:if test="${moduleDetail.TYPE2 =='1'}"><dict:lang value="弹出" /></c:if>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>

	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
</div>

	<%--<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.id" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	--%>
<script type="text/javascript">
	
	
<%--
{
"模块ID":[{"type":"orm","id":"持久化模型ID1"},{"type":"form","id":"表单ID1"},{"type":"form","id":"表单ID2"},{"type":"view","id":"视图ID1"},{"type":"view","id":"视图ID2"},{"type":"class","id":"模块类ID"}],
"cls":[{"id":"公用类ID"}],
"page":[{"id":"公用页面ID"}],
"file":"/test.jsp,/plf/showname.js",
"jar":"***.jar,***.jar"
}	
--%>
	
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
	
	
	function selectChange(obj) {
		var mid = $("#MID").val();
		var id = obj.value;
		var moduleType = $("#moduleType").val();
		//if(!moduleType) {
		//type=$("input[name='type']")[0].value;
		//} 
		var moduleName = $("#moduleName").val();
		var type2 = $("#" + id + "_type2").val();
		var jsonObj = window.parent.exportModule;
		if(moduleType == 1) {
			if(!jsonObj[mid]) {
				jsonObj[mid] = [];
			}
			/*$("input[type='checkbox'][name='id']:checked").each(function(i, e) {
				var type_ = $("#" + e.value + "_type").val();
				var name = $("#" + e.value + "_name").text();
				jsonObj[mid].push({
					"type": getType(type_),
					"id": e.value,
					"moduleName": moduleName,
					"name": name,
					"sort": type_
				});
			});*/

			var type_ = $("#" + obj.value + "_type").val();
			var name = $("#" + obj.value + "_name").text();
			
			if(obj.checked) {
				jsonObj[mid].push({
					"type": getType(type_),
					"id": obj.value,
					"moduleName": moduleName,
					"name": name,
					"sort": type_
				});
			} else {
				var index = indexOf(jsonObj[mid], obj.value, getType(type_));
				if(index != -1) {
					jsonObj[mid].splice(index, 1);
				}

			}

			if(jsonObj[mid].length == 0) {
				delete jsonObj[mid];
			}

		} else if(moduleType == 2) {
			//jsonObj.cls = [];

			if(!jsonObj.cls) {
				jsonObj.cls = [];
			}


			var type_ = $("#" + obj.value + "_type").val();
			var name = $("#" + obj.value + "_name").text();
			var type = $("#" + obj.value + "_type_2").val();
			if(obj.checked) {
				jsonObj.cls.push({
					"id": obj.value,
					"type": type,
					"name": name
				});
			} else {
				var index = indexOf(jsonObj.cls, obj.value, null);
				if(index != -1) {
					jsonObj.cls.splice(index, 1);
				}

			}

			if(jsonObj.cls.length == 0) {
				delete jsonObj.cls;
			}

		} else if(moduleType == 3) {
			//jsonObj.page = [];
			if(!jsonObj.page) {
				jsonObj.page = [];
			}

			var type = $("#" + obj.value + "_type_2").val();
			var name = $("#" + obj.value + "_name").text();
			var type = $("#" + obj.value + "_type_2").val();

			if(obj.checked) {
				jsonObj.page.push({
					"id": obj.value,
					"type": type,
					"name": name
				});
			} else {
				var index = indexOf(jsonObj.page, obj.value, null);
				if(index != -1) {
					jsonObj.cls.splice(index, 1);
				}
			}

			if(jsonObj.page.length == 0) {
				delete jsonObj.page;
			}

		}
	}

	function indexOf(arr, id, type) {
		for(var i = 0; i < arr.length; i++) {
			if(arr[i].id == id) {
				if(type != null) {
					if(arr[i].type == type) {
						return i;
					}
				}

				return i;

			}
		}

		return -1;
	}
	
	
	//视图模型
	function getType(type,type2) {
		if(type == 1) {
			return "orm";
		}else if(type == 2) {
			return "form";
		}else if(type == 3) {
			return "view";
		}else if(type == 4) {
			return "class";
		}
	}
	
	//包含业务模型子集
	function containBussDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		
		return false;
	}
	
	function containClassDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		return false;
	}
	
	function containViewDetail(arr,obj) {
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
		
		if(moduleType==1) { //业务模型
			for(key in exportModule) {
				if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
					if(key == document.getElementById("MID").value) {
						var moduleDetailArr = exportModule[key];
						$("input[type='checkbox'][name='id']").each(function(i,e) {
							if(containBussDetail(moduleDetailArr, e.value)) {
								e.checked = true;
							}
						});
					}
				}
			}
		}else if(moduleType == 2) { //公用类 
			if(exportModule.cls != undefined) {
				var clsArr = exportModule.cls;
				$("input[type='checkbox'][name='id']").each(function(i,e) {
					if(containBussDetail(clsArr, e.value)) {
						e.checked = true;
					}
				});
			}
		}else if(moduleType == 3) { //公用视图
			if(exportModule.page != undefined) {
				var pageArr = exportModule.page;
				$("input[type='checkbox'][name='id']").each(function(i,e) {
					if(containViewDetail(pageArr, e.value)) {
						e.checked = true;
					}
				});
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
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(){
		var url = "${path}sys/BussModelAction_addOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>";
		showPopWin(url, 800, 400,null,"新增");
	}
	
	function view(id){
		var url = "${path}sys/BussModelAction_viewOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ORMID="+id;
		showPopWin(url, 800, 400,null,"修改");
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_forEditOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ORMID="+id;
		showPopWin(url, 800, 400,null,"修改");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delOrm.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
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
<%@ include file="/plf/common/pub_end.jsp" %>