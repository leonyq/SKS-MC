<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="模型菜单树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
	</jsp:include>
  </head>

	<body style="background:#fff;">
		<!-- div><a href="javascript:add();"><dict:lang value="新建模型" />+</a></div -->
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
				
					edit: {
						enable: true,
						showRemoveBtn: false,
						showRenameBtn: false
					}
				};
			
			 $(function(){
			    	$.ajax({
						type: "POST",
					    dataType: "json",
					    url: "${path}sys/BussModelAction_listBussModelzTreeForNopm.ms",
					    data:{iconPath:"plf/js/dhtmlxtree/imgs/csh_scbrblue/"},
						success: function(data){
							if(data){
								var zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
								var node = zTreeObj.getNodeByTId("tree_1");
								zTreeObj.expandNode(node, true, false, true);
							}
					    },
						error: function(msg){
								util.alert("error:"+msg.responseText);
						  }
						});
			    });
			
				function zTreeOnClick(event, treeId, treeNode){
					var MID = "";
					if(typeof (treeNode.mid) !='undefined'){
						MID=treeNode.mid;
					}
					if(undefined == treeNode.actionMethod){
						return;
					}
					var url = "${path}"+treeNode.actionMethod+"?paraMap.MID="+MID+"&paraMap.treeID="+treeNode.id+"&paraMap.path="+treeNode.path;
					//var url = "${path}sys/BussModelAction_"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.ID="+id;
					//alert(url);
					if(url!=null && url!='' && url.indexOf('listViewForNopm')!=-1){
						parent.mainFrame.location.href= url;
					}
					
				}

				
				function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
		            //判断选中的是否为子节点  
		            //若为父节点flag = true  
		            if(typeof(treeNodes[0].children) == "undefined"){  
		            	alert("<dict:lang value="模型不能拖拽"/>");
						return false;
		            }  
					/**
		            if(sObject.hasChildren(sId) == 0){
					alert("<dict:lang value="模型不能拖拽"/>");
					return false;
				    }
					**/
					
					var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
					if(r){
						return updateDragData(treeNodes[0].id,targetNode.id);
					}else{
						return false;
					}
				   };
				
				function updateDragData(sId,tId){
					var flag = true;
					var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"modelTree"};
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
			</script>

	<script type="text/javascript">
		function add(){
			var url = "${path}sys/BussModelAction_forAddBussModel.ms";
			parent.mainFrame.location.href= url;
		}

	</script>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>