<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title>功能菜单树型结构</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
	</jsp:include>

  </head>

	<body>
	
		<ul id="index_tree" class="ztree"></ul>
		<script>
		
		var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick,
					beforeDrop: zTreeBeforeDrop
				},
				async: {
					enable: true,
					url: "${path}sys/FuncAction_listFunczTree.ms",
					autoParam: ["id"],
					otherParam: ["iconPath", "plf/js/dhtmlxtree/imgs/csh_scbrblue/"],
					dataFilter: ajaxDataFilter
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				}
			};
		
		   function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
			   var typeStatus = getFunTypeById(treeNodes[0].id);
				if(!typeStatus){
					alert("<dict:lang value="操作按钮或CS客户端菜单不能拖拽"/>");
					return false;
				}
				var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
				if(r){
					return updateDragData(treeNodes[0].id,targetNode.id);
				}else{
					return false;
				}
		   };
		     var tree_Id;
			function zTreeOnClick(event, treeId, treeNode){
		    	 tree_Id  = treeNode.tId;
				var clientType=treeNode.client_type;
				var type=treeNode.type;
				var id=treeNode.id;
				var url = "${path}sys/FuncAction_listFunc.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F45"
						+"&funcDtoSh.upId="+id+"&paraMap.clientType="+clientType+"&paraMap.type="+type+"&paraMap.path="+treeNode.path;
				parent.mainFrame.location.href= url;
			}
		
			function ajaxDataFilter(treeId, parentNode, responseData) {
			    return responseData.ajaxList;
			};
			
			function getFunTypeById(sId){
				var flag = true;
				var data = {"paraMap.sId":sId};
				$.ajax({
				    type: "POST",
					dataType: "json",
					async:false,
			        url: "${path}sys/BussModelAction_getFunTypeById.ms",
			        data:data,
				    success: function(data){
					    var type = data.ajaxMap.type;
					    if(type == "2"){
					    	flag = false;
					    }
					    var clientType = data.ajaxMap.client_type;
					    if(clientType == "2"){
					    	flag = false;
					    }
					},
					error: function(XMLHttpRequest,textStatus,errorThrown){
						flag = false;
					}
			    });
				return flag;
			}
			
			function updateDragData(sId,tId){
				var flag = true;
				var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"funcTree"};
				$.ajax({
				    type: "POST",
					dataType: "json",
			        url: "${path}sys/BussModelAction_updateTreeDragDataAx.ms",
			        data:data,
				    success: function(data){
					    var status = data.ajaxString;
					    if(status == "0"){
					    	flag = false;
					    }
					},
					error: function(XMLHttpRequest,textStatus,errorThrown){
						flag = false;
					}
			    });
				return flag;
			}
			
			
			
			 $(function(){
				$.fn.zTree.init($("#index_tree"), setting);
				
			});
			 function actionIs(type,json){
				 var obj = JSON.parse(json);
				 var newNode = {
						name:obj.name,
						id:obj.id,
						icon:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png",
						type:obj.type,
						is_auth:obj.isAuth,
						is_front:obj.isFront,
						is_show:obj.isShow,
						order_by:obj.orderBy,
						class_name:obj.className,
						client_type:obj.clientType,
						func_code:obj.funcCode,
						path:obj.path,
						iconClose:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-close.png",
						iconOpen:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-open.png",
						drag:true
			        };
					if(type=="1"){//新增
						var treeObj = $.fn.zTree.getZTreeObj("index_tree");
						var node = treeObj.getNodeByTId(tree_Id);
						treeObj.addNodes(node, newNode);
					}else if(type=="2"){ //修改
						var treeObj = $.fn.zTree.getZTreeObj("index_tree");
						var node = treeObj.getNodeByParam("id", newNode.id, treeObj.getNodeByTId(tree_Id));
						node.name = newNode.name;
						treeObj.updateNode(node);
					}else if(type=="3"){ //删除
						var treeObj = $.fn.zTree.getZTreeObj("index_tree");
						var node = treeObj.getNodeByParam("id", newNode.id, treeObj.getNodeByTId(tree_Id));
						treeObj.removeNode(node);
					}
				}
		</script>

	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>