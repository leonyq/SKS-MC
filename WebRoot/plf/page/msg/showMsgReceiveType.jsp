<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<base href="${rootPath}" />
	<title><dict:lang value="展示对象新增" /> </title>
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
			/*
			overflow: hidden;
			*/
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
		</style>
		
</head>
<body>

	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}comm/MsgAction_showMsgReceiveType.ms" method="post" >
		
			<s:hidden name="paraMap.nodes" id="nodes" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
			<table class="search_table" >
		<tr>
			<!--  
			<td >
			 <label class="titleName" id="titleName" style="font-size: 14px;"></label>:
			  <s:textfield id="name" name="paraMap.searchName" cssClass="input_sh" maxlength="30" />
		  	</td>
		  	<td >
		  	<c:if test="${paraMap.isMsgType == '3'}">
		  	 <label class="searchUser" id="searchUser" style="font-size: 14px;">用户姓名</label>:
			  <s:textfield id="name2" name="paraMap.searchUser" cssClass="input_sh" maxlength="30" />
			  </c:if>
		  	</td>
			<td >
			    <input type="button" value="<dict:lang value="查询" />" onclick="query(this,'<s:property value="paraMap.isMsgType" />');" class="layui-btn"> 
		  	</td>
		  	-->
		  	
		  	<td>
		  		<div class="search_table_wrap">
		  			<span>
		  				<label class="titleName" id="titleName" style="font-size: 14px;"></label>
		  			</span>
		  			<div class="layui-input-inline">
		  				<s:textfield id="name" name="paraMap.searchName" cssClass="input_sh" maxlength="30" />
		  			</div>
		  		</div>
		  		<c:if test="${paraMap.isMsgType == '3'}">
		  		<div class="search_table_wrap">
		  			<span>
		  				<label class="searchUser" id="searchUser" style="font-size: 14px;">用户姓名</label>
		  			</span>
		  			<div class="layui-input-inline">
		  				<s:textfield id="name2" name="paraMap.searchUser" cssClass="input_sh" maxlength="30" />
		  			</div>
		  		</div>
		  		</c:if>
		  		<div class="search_table_wrap">
		  			<input type="button" value="<dict:lang value="查询" />" onclick="query(this,'<s:property value="paraMap.isMsgType" />');" class="layui-btn">
		  		</div>
		  	</td>
		  	
	    </tr>
	</table>
				<%--<table class="add_table">
					
				</table> --%>
				<table class="add_table" >
					<tr>
						<td style="width: 35px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="发送类别" />
						</td>
						<td colspan="4">
						<dict:selectDict id="msgDto_recObjType"  name="paraMap.isMsgType" dictValue="%{paraMap.isMsgType}" dictCode="REC_OBJ_TYPE" cssClass="_VAL_NULL" 
								onchange="showSelRecObjTxt()"/>
						</td>
					 </tr> 
					
					<tr>
						<td  style="width: 100px; vertical-align: top" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="发送对象选择" />
						</td>
						<td colspan="4" style="height:280px;">
						
						<!-- tree start -->
						<c:if test="${paraMap.isMsgType == '2'}">
							
									<div style="height:99%; width: 30%;float: left;overflow-x:hidden;overflow-y:auto">
										<div id="index_tree" class="ztree"></div>
									</div>

									<div style="height:99%; width: 70%;float: left;overflow-x:hidden;overflow-y:auto">
										<iframe id="useriframe" name="useriframe" frameBorder="0"
											src="${path}comm/MsgAction_getUserList.ms?<s:property value="@com.more.fw.core.common.method.Constants@FUNC_CODE"/>=F30"
											name="mainFrame" scrolling="auto" style="border-right: 1px;width: 100%;height:100%;"> </iframe>
										<input type="hidden" id="deptDtoUp_iframeid" name="deptDtoUp.iframeid" />
									</div>

							</c:if>
						 <!-- tree end -->
						 
						 <!-- 角色列表start -->
						<c:if test="${paraMap.isMsgType == '3'}">
								<div style="height:99%; width: 30%;float: left;overflow-x:hidden;overflow-y:auto">
									<table id="listTable" class="table_list" width="100%">
										<thead>
											<tr class="tdcolor" >
												<th style="width:30px;text-align:center"><dict:lang value="序号" /></th>
												<th width="150px;" style="text-align:center" class="titleName"></th>
											</tr>
										</thead>
										<tbody id = "send_table">
											<s:iterator value="page.dataList" status="index">
												<tr onclick="getUserFormRole('<s:property value="id" />')">
													<td style="text-align:center;">${index.count} </td>
													<td><s:property value="name" /></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
								<div style="height:99%; width: 70%;float: left;">
							<iframe id="useriframe" name="useriframe" frameBorder="0" src="${path}comm/MsgAction_getUserList.ms" style="border-right: 1px;width: 100%;height:100%;"> </iframe>
								
								</div>
						</c:if>
						<!-- 角色 end-->
						
						<!-- 用户列表start -->
						<c:if test="${paraMap.isMsgType == '4'}">
								<div style="height:100%; overflow:auto;">
									<form id="searchForm" name="searchForm" action="${path}comm/MsgAction_listMsg.ms" method="post">
										<s:hidden name="pareMap.type" />
									</form>
									<div class="">
									<table id="listTable" class="table_list" width="100%">
										<thead>
											<tr class="tdcolor" >
												<th width="40px;" style="text-align:center" ><input  type="checkbox" lay-ignore id="SelectAll" onclick="selectAll();" ></th>
												<th style="text-align:center" class="titleName"></th>
											</tr>
										</thead>
										<tbody id = "send_table">
											<s:iterator value="page.dataList" status="index">
												<tr>
													<td style="text-align:center;"><input type='checkbox'  name='userDtoId' lay-ignore value='<s:property value="id" />' /> </td>
													<td><s:property value="name" /></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
									</div>
								</div>
						</c:if>
						<!-- 用户 end-->
						</td>
					</tr> 
				</table>
			</form>
		</div>
		<c:if test="${paraMap.isMsgType == '4'}">
		<%--<div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=addForm" />
		</div> --%>
		<div id="currentPageDiv" class="table_div"></div>
		<s:include value="/plf/common/layui_pagination.jsp" />
	</c:if>
	</div>
	
	
	<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="layui-btn">
			
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	$(function(){
		var piframeName = '<s:property value="paraMap.piframeName"/>';
		if(piframeName=="") piframeName='${mcIframeName}';
		$("#mcIframeName").val(piframeName);
		$("#msgDto_recObjType").attr("lay-filter","showSelRecObjTxt");
	});
	
	layui.use('form', function(){
	  	var form = layui.form;
	  form.on('select(showSelRecObjTxt)', function(data){
  		var val = data.value;
  		$("#name").val("");
		$("#name2").val("");
		document.forms.addForm.submit();
  	  });
	  	form.render("select");
	  	form.render("checkbox");
	});
	
	 function query(thisObj,type){
	
	 var node ;
	 var nodesID;
	 var MSGTYPE;
	 if(type==undefined) type='<s:property value="paraMap.isMsgType" />';
	 	if(type!='4'){
	 		//节点数据
	 		//node = top.window.frames['useriframe'].document;
	  		node = document.getElementById('useriframe').contentWindow.document;
		    nodesID=$("#nodesID",node).val();
		    MSGTYPE=$("#MSGTYPE",node).val();
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
		var piframeName = $("#mcIframeName").val();
		//console.log(piframeName);
		var pIframe = top.window.frames[piframeName];
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
		//idFormer=parent.UserList;
		//nameFormer=parent.showUser;
		idFormer=pIframe.UserList;
		nameFormer=pIframe.showUser;
			break;
		case "3":
		/* idFormer=parent.RoleList;
		nameFormer=parent.showRole; */
		idFormer=pIframe.UserList;
		nameFormer=pIframe.showUser;
			break;
		case "4":
		idFormer=pIframe.UserList;
		nameFormer=pIframe.showUser;
			break;
		default:
		//异常情况处理
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
		pIframe.UserList=idList.concat(idFormer);
		pIframe.showUser=valList.concat(nameFormer);
			break;
		case "3":
	/* 	parent.RoleList=idList.concat(idFormer);
		parent.showRole=valList.concat(nameFormer); */
		pIframe.UserList=idList.concat(idFormer);
		pIframe.showUser=valList.concat(nameFormer);
			break;
		case "4":
			pIframe.UserList=idList.concat(idFormer);
			pIframe.showUser=valList.concat(nameFormer);
			break;
		default:
		//异常情况
			break;
		}
	}	
	pIframe.showSelected();
	//关闭
	closePopWin();
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
				var url = "${path}comm/MsgAction_getUserList.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&nodesID="+nodeId+"&MSGTYPE=1&SENDTYPE=3";

				
			 	document.getElementById('useriframe').src=url;
				
			};
			
			function getUserFormRole(ID){
				 var url = "${path}comm/MsgAction_getUserList.ms?<s:property value="@com.more.fw.core.common.method.Constants@FUNC_CODE"/>=F30&nodesID="+ID+"&MSGTYPE=2&SENDTYPE=3";
				
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