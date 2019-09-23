<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<base href="${rootPath}" />
	<title><dict:lang value="展示用户" /> </title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
			<jsp:param name="zTree" value="1" />
			<jsp:param name="chosen" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<%-- 
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="zTree" value="1" />
			<jsp:param name="chosen" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
		--%>
		<style>
			.right{
				float:right;
			}
			body {
				margin-left: 1px;
				margin-top: 0px;
				margin-right: 1px;
				margin-bottom: 0px;
				font-size: 12px;
				font-family: "arial";
			}
			td{
			overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
		</style>
		
</head>
<body>
<form id="addForm" name="addForm" action="${path}comm/MsgAction_getUserList.ms" method="post" >
		<s:hidden name="nodesID" value="${nodesID }" />
		<s:hidden name="MSGTYPE" value="${MSGTYPE }" />
		<s:hidden name="SENDTYPE" value="${SENDTYPE }" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
	<div class="table_div" style="height:67%;overflow-x:hidden;overflow-y:auto"><%--height:90%;overflow-x:hidden;overflow-y:auto --%>
	<table id="listTable" class="table_list" >
										<thead>
											<tr class="tdcolor" >
												<th width="40px;"  ><input  type="checkbox" id="SelectAll" onclick="selectAll();"></th>
												<th style="text-align:center" class="titleName"></th>
											</tr>
										</thead>
										<tbody id = "send_table">
											<s:iterator value="page.dataList" status="index">
												<tr>
													<td style="text-align:center;"><input type='checkbox'  name='userDtoId' value='<s:property value="id" />' style="margin:0;width:20px;"/> </td>
													<td><s:property value="name" /></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
	</div>
	</form>
		<%-- <div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=addForm" />
		</div>--%>
		<div id="currentPageDiv" class="table_div"></div>
		<s:include value="/plf/common/layui_pagination.jsp" />


		<script type="text/javascript">
	
	 function query(thisObj,type){
		 
	 var node ;
	 var nodesID;
	 var MSGTYPE;
	 if(type==undefined) type=$("#SENDTYPE").val();
	 	if(type!='4'){
	 		//节点数据
	  		//node = document.getElementById('useriframe').contentWindow.document;
		    //nodesID=$("#nodesID",node).val();
		    //MSGTYPE=$("#MSGTYPE",node).val();
		    nodesID=$("#nodesID").val();
		    MSGTYPE=$("#MSGTYPE").val();
		}	
		   
		   var titleName=$("#name").val();
		   var searchUser = $("#name2").val();
		   
		    //  alert(nodesID+"---"+MSGTYPE);
	 	switch (type) {
		case '2':
			
			var url = "${path}comm/MsgAction_getUserList.ms?nodesID="+nodesID+"&MSGTYPE=1&searchName="+titleName;
				
			 document.getElementById('useriframe').src=url;
			break;
		case '3':
		 	$("#nodes").val(nodesID);
			document.forms.addForm.submit();
			break;
		case '4':
			//_pageCurrentPageObj.value="1";
			document.forms.addForm.submit();
			break;
		default:
		//异常情况
			break;
		}
		
		
	} 
	
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
		util.closeLoading();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
		util.closeLoading();
	}
	
	
	function add(thisObj){
	//获得所有选择的复选框。
	var idList = new Array;
	var valList = new Array;
	
	//获得选中的类型
	var selectVal = $("#msgDto_recObjType").val();
	//已选的值
	var idFormer;
	var nameFormer;
	switch (selectVal) {
		case "2":
		//父页面参数赋值
		/* idFormer=parent.DepList;
		nameFormer=parent.showDep; */
		idFormer=parent.UserList;
		nameFormer=parent.showUser;
			break;
		case "3":
		/* idFormer=parent.RoleList;
		nameFormer=parent.showRole; */
		idFormer=parent.UserList;
		nameFormer=parent.showUser;
			break;
		case "4":
		idFormer=parent.UserList;
		nameFormer=parent.showUser;
			break;
		default:
		//异常情况
			break;
		}
	
	if(selectVal !="4"){//部门通过树节点获取
		/* var treeObj = $.fn.zTree.getZTreeObj("index_tree");             
		var nodes = treeObj.getCheckedNodes(true);                  
		  for (var i = 0; i < nodes.length; i++) { 
		  	if(nodes[i].id=="FA174AFF136D496A87B65443D22357E3"){continue;}//跳过父级
		  	if(idFormer.length>0){
				if(idFormer.indexOf(nodes[i].id)>-1){continue;}//跳过重复
			};
		     idList.push(nodes[i].id );
		     valList.push(nodes[i].name);
		   } */
		   
		   var node = document.getElementById('useriframe').contentWindow.document;
		   $("input[name='userDtoId']:checked",node).each(function(index){
		   	if(idFormer.length>0){
				if(idFormer.indexOf($(this).val())>-1){return true;}//跳过重复
			};
		  	 	idList.push($(this).val() );
		     	valList.push($(this).parent().next("td").text());
		   });
	}else{
	
		$("input[name='userDtoId']:checked").each(function(index){
			if(idFormer.length>0){
				if(idFormer.indexOf($(this).val())>-1){return true;}//跳过重复
			};
			idList.push($(this).val());
			valList.push($(this).parent().next("td").text());
		});
	}
	//父页面元素赋值
	// $("#a",parent.document).val(dataSelect);
	
	
	/* idList = idList.substring(1,idList.length);
	valList = valList.substring(1,valList.length); */
	if(idList.length>0){
	 switch (selectVal) {
		case "2":
		//父页面参数赋值
		/* parent.DepList=idList.concat(idFormer);
		parent.showDep=valList.concat(nameFormer); */
		parent.UserList=idList.concat(idFormer);
		parent.showUser=valList.concat(nameFormer);
			break;
		case "3":
	/* 	parent.RoleList=idList.concat(idFormer);
		parent.showRole=valList.concat(nameFormer); */
		parent.UserList=idList.concat(idFormer);
		parent.showUser=valList.concat(nameFormer);
			break;
		case "4":
		parent.UserList=idList.concat(idFormer);
		parent.showUser=valList.concat(nameFormer);
			break;
		default:
		//异常情况
			break;
		}
	}	
	parent.showSelected();
	//关闭
	parent.closePopWin();
	};
	
	function showSelRecObjTxt(){
		//清空查询条件
		try{
			$("#name").val("");
			$("#name2").val("");
		}catch(err){
		
		}
		document.forms.addForm.submit();
	};  

	/////////ztree
	var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick
				}
			};

			var nodeId = "-1";
			function zTreeOnClick(event, treeId, treeNode) {
				nodeId = treeNode.id;
				var url = "${path}comm/MsgAction_getUserList.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&nodesID="+nodeId+"&MSGTYPE=1";
				
			 	document.getElementById('useriframe').src=url;
				
			};
			
			function getUserFormRole(ID){
				 var url = "${path}comm/MsgAction_getUserList.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&nodesID="+ID+"&MSGTYPE=2";
				
			 	document.getElementById('useriframe').src=url; 
			}
			
			  $(function(){
			  var type = "<c:out value='${paraMap.isMsgType}' />";
			  if(type=="2"){
			  
		    	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${rootPath}sys/FuncAction_listDeptTreeByZtree.ms",
					success: function(data){
						if(data){
							$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
							
							var treeObj = $.fn.zTree.getZTreeObj("index_tree");
							var node = treeObj.getNodeByParam("id", "FA174AFF136D496A87B65443D22357E3", null);
							if(node!=null){
								treeObj.expandNode(node, true, false, true);
							}
							
						}
				    },
					error: function(msg){
							util.alert("error:"+msg.responseText);
					  }
					});
					$(".titleName").text("用户姓名");
				}
				else if(type=="3"){
					$(".titleName").text("角色名称");
					var searchUser ='<s:property value="paraMap.searchUser" />';
					var nodes = '<s:property value="paraMap.nodes" />';
					if(searchUser){
						var url = "${path}comm/MsgAction_getUserList.ms?nodesID="+nodes+"&MSGTYPE=2&searchName="+searchUser;
						 document.getElementById('useriframe').src=url;
					}
					
				}else{
				
					$(".titleName").text("用户姓名");
				}
					
					selectAll();
					
		    });
		    	 //选中所有，复选框。 
			function selectAll(){
				if ($("#SelectAll").attr("checked")){
					$(":checkbox").attr("checked",true);
					//$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
				}else{
					$(":checkbox").attr("checked",false);
					//$("#listTable :checkbox").parents("tr").css("background-color","");
				}
			} 
			

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>