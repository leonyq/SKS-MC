<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
  </head>
	<body>
		<div class="all" style="margin-left: -60px;">
			<form id="addForm" class="layui-form" name="addForm" action="" method="post" target="submitFrame">
						<table  style="margin-left: 60px;">
							<tr>
								<td style="height:10px">
									<span class="Eng"><span id="error_msg"></span></span>
								<td>
							</tr>
							<tr>
								<td>
								<dict:selectDict name="paraMap.flag" dictCode="WSC_TIMER" dictValue="%{${fn:escapeXml(paraMap.flag)}}" onchange="exchange()" id="typeFlag" />
							    </td>
							</tr>
							<tr>
								<td>
									<div id="index_tree" class="ztree">
									</div>
								<td>
							</tr>
						</table>
						<s:hidden id="menuId" name="menuId"/>
						
				</form>
		   </div>
		   <div class="ptop_10 txac">
					
					<input type="button" value="<dict:lang value="保存" />" onclick="add(this);" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="cancel();" class="layui-btn layui-btn-danger">
			</div>
		<script>
		layui.use('form', function(){
		  	  var form = layui.form;
		  	  form.on('select(exchange)',function(data){   
			  		document.getElementById('index_tree').innerHTML="";
					getDateOnchange();
				});
		  		form.render("select");
			});
		var flag = false;
		var zTreeObj = null
		var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId",
						icon: "plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png"
					}
				},
				check: {
		            enable: true,
		            chkStyle: "radio",  //单选框
		            radioType: "all"   //对所有节点设置单选
		        },
				callback: {
					onCheck: tonclick,
					onClick: function (e, treeId, treeNode, clickFlag) {
						zTreeObj.checkNode(treeNode, !treeNode.checked, true);
						flag = true;
			        }
				}
			};
		$(function() {
			$("#typeFlag").attr("lay-filter","exchange");
			var menuId = $("#menuId").val();
			var typeFlag=$("#typeFlag").val();
			$.ajax({
						type : "POST",
						dataType : "json",
						url : "${path}sys/websJobMagAction_listWebsTree.ms",
						data:{
							"paraMap.typeFlag":typeFlag
						},
						success : function(data) {
							zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
							var node = zTreeObj.getNodeByParam("id",menuId);
							zTreeObj.checkNode(node, true, true);
							 var parent = node.getParentNode();  
					         /*  if(!parent.open){  
					        	  zTreeObj.expandNode(parent,true,true);  
					          }  */ 
						},
						error : function(msg) {
							util.closeLoading();
							util.alert("error:" + msg);
						}
					});
		})
		function tonclick(event, treeId, treeNode) {
			var type = null;
			var nodes = zTreeObj.getCheckedNodes(true);
	         for(var i=0;i<nodes.length;i++){  
					$("#menuIdSelected").val(nodes[i].id);
					type=nodes[i].type;
	         }  
			if (type ==0||type==undefined) {
				document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择具体接口" />";
				window.setTimeout("closeValMsg('error_msg')", 2000);
				flag = false;
				return false;
			}
			flag = true;
		};
		


 
			
			
			function closeValMsg(objthis) {
				document.getElementById(objthis).innerText = "";
			}
			function exchange(){
				document.getElementById('index_tree').innerHTML="";
				getDateOnchange();
			}
			function getDateOnchange(){
				var menuId = $("#menuId").val();
				var typeFlag=$("#typeFlag").val();
				$.ajax({
							type : "POST",
							dataType : "json",
							url : "${path}sys/websJobMagAction_listWebsTree.ms",
							data:{
								"paraMap.typeFlag":typeFlag
							},
							success : function(data) {
								zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
								var node = zTreeObj.getNodeByParam("id",menuId);
								zTreeObj.checkNode(node, true, true);
								 var parent = node.getParentNode();  
						          if(!parent.open){  
						        	  zTreeObj.expandNode(parent,true,true);  
						          }  
							},
							error : function(msg) {
								util.closeLoading();
								util.alert("error:" + msg);
							}
						});
			}
			
			function add(thisObj) {
				var piframeName = '<s:property value="paraMap.piframeName"/>';
				var pIframe = top.window.frames[piframeName];
				
				var id;
				var name;
				if (!flag) {
					document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择具体接口" />";
					window.setTimeout("closeValMsg('error_msg')", 2000);
					flag = false;
					return false;
				}
				var nodes = zTreeObj.getCheckedNodes(true);
		         for(var i=0;i<nodes.length;i++){  
						$("#menuIdSelected").val(nodes[i].id);
						 id=nodes[i].id;
						 name = nodes[i].name;
		         }  
				if (id == null || id == undefined) {
					document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择具体接口" />";
					window.setTimeout("closeValMsg('error_msg')", 2000);
					flag = false;
					return false;
				}
				pIframe.document.getElementById("websName").value = name;
				pIframe.document.getElementById("wscId").value = id;
				closePage();
			}

			function cancel(thisObj) {
				closePage();
			}
			
			
		</script>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>