<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="展示对象新增" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>
<style>
		.right {
			float: right;
		}
		td{
			overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
</style>

</head>
<body>

	<s:hidden id="showDep" name="dataMap.showDep" />
	<s:hidden id="showRole" name="dataMap.showRole" />
	<s:hidden id="showUser" name="dataMap.showUser" />
	<s:hidden id="DepList" name="dataMap.DepList" />
	<s:hidden id="RoleList" name="dataMap.RoleList" />
	<s:hidden id="UserList" name="dataMap.UserList" /> 

	<div class="all">
		<div>
			<form id="addForm" name="addForm"
				action="${path}comm/MsgAction_listMsg.ms" method="post">
				<s:hidden name="pareMap.type" />
			</form>
			
			<div>
			<table id="listTable" class="table_list" style="table-layout: fixed;">
				<thead>
					<tr class="tdcolor">
						<th width="40px;" style="text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"> </th>
						<th width="40px;"><dict:lang value="序号" /></th>
						<th width="100px;"><dict:lang value="发送类别" /></th>
						<th ><dict:lang value="名称" /></th>
						<th width="100px;"><dict:lang value="操作" /></th>
					</tr>
				</thead>
				<tbody id="select_table">

				</tbody>
			</table>
			<div class="ptop_10 txac">
			    <input type="button" value="<dict:lang value="提交" />" onclick="sub();" class="layui-btn">
				<input type="button" value="<dict:lang value="批量移除" />" onclick="isAllDelete();" class="layui-btn layui-btn-danger">
			</div>
			</div>
		</div>
	</div>
	</div>
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=addForm" />
	</div> --%>
	<form id="submitForm" name="submitForm" action="" target="submitFrame"
		method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">

	
	 var showDep;
	 var showRole;
	 var showUser;
	 var DepList;
	 var RoleList;
	 var UserList;
	 
	$(function(){
			valS();
			showtable();
			selectAll();
		});
		
		//展示table
		function showtable() {
			//序列
			var noStr=0;
			
			
			if(showDep&&showDep!="undefined"&&showDep.length>0){//部门
				 var dmap=Object.keys(depMap);
	  			for(var i = 0; i < dmap.length; i++){
	     		noStr++;	
	     		$("#select_table").append("<tr class='td1' id='"+dmap[i]+"'></tr>");
				$("#select_table tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+dmap[i]+":2'/></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + noStr+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><dict:lang value="部门" /></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + depMap[dmap[i]]+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><a href=\"javascript:void(0);\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"del('"+dmap[i]+"','"+depMap[dmap[i]]+"','2');\" ><dict:lang value="移除" /></a></td>");
	  			}
			}
			
			
			if(showRole&&showRole!="undefined"&&showRole.length>0){//角色
				var rmap=Object.keys(roleMap);
				 for(var i = 0; i < rmap.length; i++){
	     		noStr++;	
	     		$("#select_table").append("<tr class='td1'  id='"+rmap[i]+"'></tr>");
				$("#select_table tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+rmap[i]+":3'/></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + noStr+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><dict:lang value="角色" /></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + roleMap[rmap[i]]+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><a href=\"javascript:void(0);\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"del('"+rmap[i]+"','"+roleMap[rmap[i]]+"','3');\" ><dict:lang value="移除" /></a></td>");
	  			 }
			}
			
			
			if(showUser&&showUser!="undefined"&&showUser.length>0){//人员
			var umap=Object.keys(userMap);
				 for(var i = 0; i < umap.length; i++){
	     		noStr++;	
	     		$("#select_table").append("<tr class='td1'  id='"+umap[i]+"'></tr>");
				$("#select_table tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+umap[i]+":4'/></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + noStr+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><dict:lang value="用户" /></td>");
				$("#select_table tr:last").append("<td style='text-align:center;'>" + userMap[umap[i]]+ "</td>");
				$("#select_table tr:last").append("<td style='text-align:center;'><a href=\"javascript:void(0);\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"del('"+umap[i]+"','"+userMap[umap[i]]+"','4');\" ><dict:lang value="移除" /></a></td>");
	  			 }
			}
		};
		
	 //选中所有，复选框。 
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			//$("#listTable :checkbox").pIframes("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			//$("#listTable :checkbox").pIframes("tr").css("background-color","");
		}
	} 
	
	
	function del(id,show,type){
		var paraMObj = new Object();
		paraMObj.id = id;
		paraMObj.show = show;
		paraMObj.type = type;
		util.confirm(delCf,"确定删除当前对象",paraMObj);
	};
	
	//删除(需要根据不同的类型删除)(删除行)
	function delCf(paraMObj){
	var id = paraMObj.id;
	var show = 	paraMObj.show;
	var type = paraMObj.type ;
		
		switch(type){
		
		case "2"://部门
			delete depMap[id];
		break;
		case "3"://角色
			delete roleMap[id];
		break;
		case "4"://用户
			delete userMap[id];
		break;
		default:
		
		break;
		}
		//删除当前记录行
		//$("#"+id).remove();
		$("#select_table").empty();
		showtable();
	};
	
	var depMap;
	var roleMap;
	var userMap;
	
	var piframeName = '<s:property value="paraMap.piframeName"/>';
	var pIframe = top.window.frames[piframeName];
		function valS() {
			
			showDep = pIframe.showDep;
			showRole = pIframe.showRole;
			showUser = pIframe.showUser;
			DepList = pIframe.DepList;
			RoleList = pIframe.RoleList;
			UserList = pIframe.UserList;
		
		
			if (showDep &&showDep !="undefined") {//部门
				depMap = {};
				/* var showDepArray = showDep.split(",");
				var oneDepArray = DepList.split(","); */
				for (var i = 0; i < showDep.length; i++) {
					var showStr=encodeHtml(showDep[i]);
					var  idStr= DepList[i];
						depMap[idStr] = showStr;
				}
			}
			 if (showRole &&showRole.length>0&&showRole !="undefined") {//角色
				roleMap = {};
				/* var showRoleArray = showRole.split(",");
				var oneRoleArray = RoleList.split(","); */
				for ( var i = 0; i < showRole.length; i++) {
						var showStr=encodeHtml(showRole[i]);
						var  idStr= RoleList[i];
						roleMap[idStr] = showStr;
				}
			}
			if (showUser &&showUser.length>0&&showUser !="undefined") {//用户
				userMap = {};
				/* var showUserArray = showUser.split(",");
				var oneUserArray = UserList.split(","); */
				for ( var i = 0; i < showUser.length; i++) {
						var showStr=encodeHtml(showUser[i]);
						var  idStr= UserList[i];
						userMap[idStr] = showStr;
				}
			} 

		};
		function isAllDelete(id,show,type){
 			var td1Count=0;
 			var td1Checkbox=0;
 			$('#select_table .td1').each(function(i){
				td1Count++;
			})
			$('#select_table input').each(function(i){
				if($(this).is(':checked')){
					td1Checkbox++;
				}
			})
 
			if(td1Count==0){
				util.confirm(allDelete,"当前无可删除的对象");
			}else if(td1Checkbox==0){
				util.confirm(allDelete,"请至少选中一个对象删除");
			}else{
				util.confirm(allDelete,"确定删除当前选中对象");
			}
		};
	
	
		function allDelete(){
		$("input[name='userDtoId']:checked").each(function(index) {
				var valStr = $(this).val();
				var valArray = valStr.split(":");
				switch (valArray[1]) {
				case "2"://部门
					delete depMap[valArray[0]];
					break;
				case "3"://角色
					delete roleMap[valArray[0]];
					break;
				case "4"://用户
					delete userMap[valArray[0]];
					break;
				default:
					//异常情况
					break;
				}
			});
			$("#select_table").empty();
			showtable();
		};
		
		function sub(){
		
		
			if(showDep&&showDep!="undefined"&&showDep.length>0){//部门
				var dmap=Object.keys(depMap);
					var idList = new Array;
					var valList = new Array;
	  			for(var i = 0; i < dmap.length; i++){
			  			idList.push(dmap[i]);
			  			valList.push(depMap[dmap[i]]);
	     		}
	     		pIframe.showDep=valList;
	     		pIframe.DepList=idList;
	     		pIframe.flag=1;
			}
			if(showRole&&showRole!="undefined"&&showRole.length>0){//角色
				var rmap=Object.keys(roleMap);
					var idList = new Array;
					var valList = new Array;
	  			for(var i = 0; i < rmap.length; i++){
			  			idList.push(rmap[i]);
			  			valList.push(roleMap[rmap[i]]);
	     		}
	     		pIframe.showRole=valList;
	     		pIframe.RoleList=idList;
	     		pIframe.flag=1;
			}
	  		if(showUser&&showUser!="undefined"&&showUser.length>0){//人员
				var umap=Object.keys(userMap);
					var idList = new Array;
					var valList = new Array;
	  			for(var i = 0; i < umap.length; i++){
			  			idList.push(umap[i]);
			  			valList.push(userMap[umap[i]]);
	     		}
	     		pIframe.showUser=valList;
	     		pIframe.UserList=idList;
	     		pIframe.flag=1;
			}	 
			pIframe.showSelected();
			closePopWin();
			
			
		
		}
	</script>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>