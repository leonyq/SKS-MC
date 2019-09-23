<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="已选模块" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>
<div  class="all" >	
	
	<form id="search_form" name="searchForm" action="" method="post">
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
		<input type="hidden" id="moduleType" name="moduleType" value="<c:out value='${moduleExportType }' />" />
	</form>
	<div class="table_div" >
    <table id="listTable" style="margin-bottom: 20px;" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width: 40px;"><input type="checkbox" onclick='selectAll(this)'></th>
			<th style="width: 40px;"><dict:lang value="序号" /></th>
			<th style="width: 100px;"><dict:lang value="模型类型" /></th>
			<th ><dict:lang value="模块名称" /></th>
			<th style="width: 100px;"><dict:lang value="唯一ID" /></th>
			<th style="width: 100px;"><dict:lang value="名称" /></th>
			<th style="width: 100px;"><dict:lang value="类型" /></th>
		</tr>
		</thead>
	<tbody id="selectModule">
		
	</tbody>
	</table>
	</div>

	<%--<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>

--%></div>

	<%--<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.id" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	--%>
<script type="text/javascript">
	$(function() {
		initData();
	});
	function alertInfo(msg){
		util.alert(msg);
	}
	function initData() {
		$("html").css("height","100%"); //html 100% 防止table 没有滚动条
		var exportModule = window.parent.exportModule;
		var html = [];
		var index = 0;
		for(key in exportModule) {
			if(key != "cls" && key != "page" && key != "file" && key != "jar") {
				var arr = exportModule[key]; //模块
				arr.sort(function(obj1,obj2) { //排序
					return obj1.sort - obj2.sort;
				});
				for(var i=0 ; i<arr.length; i++) {
					html.push("<tr>");
					html.push("<td><input type='checkbox' name='id' value='"+ (arr[i].id+"_"+arr[i].type+"_"+key) +"'></td>"); //checkbox
					html.push("<td>"+ (++index) +"</td>"); // order number
					if(arr[i].type == "orm"||arr[i].type == "form"||arr[i].type == "view"||arr[i].type == "class"){
						html.push("<td>"+"<dict:lang value="业务模型" />"+"</td>"); //module type
						html.push("<td>"+ arr[i].moduleName +"</td>"); //module name
						html.push("<td>"+ arr[i].id +"</td>"); //id
						html.push("<td>"+ arr[i].name +"</td>"); //name
						html.push("<td>"+ (arr[i].type == "orm" ? "<dict:lang value="持久模型" />" : (arr[i].type == "form" ? "<dict:lang value="表单模型" />" : (arr[i].type == "view" ? "<dict:lang value="视图模型" />" : (arr[i].type == "class" ? "<dict:lang value="类管理" />" : "") ) )) +"</td>"); //name
					}else if(arr[i].type == "trig"){
						html.push("<td>"+"<dict:lang value="定时器" />"+"</td>"); //module type
						html.push("<td>"+ arr[i].name +"</td>"); //module name
						html.push("<td>"+ arr[i].id +"</td>"); //id
						html.push("<td></td>"); //name
						html.push("<td></td>"); //name
					}else if(arr[i].type == "inter"){
						html.push("<td>"+"<dict:lang value="对外接口" />"+"</td>"); //module type
						html.push("<td>"+ arr[i].moduleName +"</td>"); //module name
						html.push("<td>"+ arr[i].id +"</td>"); //id
						html.push("<td>"+ arr[i].name +"</td>"); //module name
						html.push("<td></td>"); //name
					}else if(arr[i].type == "language"){
						html.push("<td>"+"<dict:lang value="多语言" />"+"</td>"); //module type
						if(arr[i].moduleName==null||arr[i].moduleName=="null"){
							html.push("<td>"+ "无模块归属 "+"</td>"); //module name
						}else{
							html.push("<td>"+ arr[i].moduleName +"</td>"); //module name
						}
						html.push("<td>"+ arr[i].id +"</td>"); //id
						html.push("<td></td>"); //name
						html.push("<td></td>"); //name
					}else if(arr[i].type == "dict"){
						html.push("<td>"+"<dict:lang value="数据字典" />"+"</td>"); //module type
						if(arr[i].moduleName==null||arr[i].moduleName==""){
							html.push("<td>"+ "无模块归属 "+"</td>"); //module name
						}else{
							html.push("<td>"+ arr[i].moduleName +"</td>"); //module name
						}
						html.push("<td>"+ arr[i].id +"</td>"); //id
						html.push("<td>"+ arr[i].code +"</td>"); //id
						html.push("<td></td>"); //name
					}
					
					html.push("</tr>");
				}
			}
		}
		
		if(exportModule.cls) { //公用类
			var clsArr = exportModule.cls;
			for(var i=0; i<clsArr.length; i++) {
				html.push("<tr>");
				html.push("<td><input type='checkbox' name='id' value='"+ (clsArr[i].id+"_cls") +"'></td>"); //checkbox
				html.push("<td>"+ (++index) +"</td>"); // order number
				html.push("<td>"+"<dict:lang value="公用类" />"+"</td>"); //module type
				html.push("<td>"+ clsArr[i].name.split("(")[0] +"</td>"); //module name
				html.push("<td>"+ clsArr[i].id +"</td>"); //id
				html.push("<td>"+ clsArr[i].name +"</td>"); //name
				html.push("<td>"+ (clsArr[i].type == "0" ? "<dict:lang value="普通类" />" : (clsArr[i].type == "1" ? "<dict:lang value="公用类" />" : "")) +"</td>"); //name
				html.push("</tr>");
			}
		}
		
		if(exportModule.page) { //公用视图
			var pageArr = exportModule.page;
			for(var i=0; i<pageArr.length; i++) {
				html.push("<tr>");
				html.push("<td><input type='checkbox' name='id' value='"+ (pageArr[i].id+"_page") +"'></td>"); //checkbox
				html.push("<td>"+ (++index) +"</td>"); // order number
				html.push("<td>"+"<dict:lang value="公用视图" />"+"</td>"); //module type
				html.push("<td>"+ pageArr[i].name +"</td>"); //module name
				html.push("<td>"+ pageArr[i].id +"</td>"); //id
				html.push("<td>"+ pageArr[i].name +"</td>"); //name
				html.push("<td>"+ (pageArr[i].type == "1" ? "<dict:lang value="弹出" />" : "" )+"</td>"); //name
				html.push("</tr>");
			}
		}
		$("#selectModule").html(html.join(""));
	}
	
	// 全选
	function selectAll(obj) {
		$("input[name='id'][type='checkbox']").attr("checked",obj.checked);
	}
	
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>