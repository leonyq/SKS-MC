<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="任务管理树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="zTree" value="1" />
	</jsp:include>

  </head>
	<body>
	<div id="index_tree" class="ztree" >
		<script>
			var url;
			var tree;
				
<%--			 function tonclick(id,cid,row){--%>
<%--					url = "${path}sys/workMagAction_listModule.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.UP_ID="+id--%>
<%--					parent.mainFrame.location.href= url;--%>
<%--			} --%>
<%--			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");--%>
<%--			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");--%>
<%--			tree.setOnClickHandler(tonclick);--%>
<%--			dragAndDrop();--%>
<%--			tree.loadXML("${path}sys/workMagAction_listModuleTree.ms");--%>
<%--			tree.setXMLAutoLoading("${path}sys/workMagAction_listModuleTree.ms");--%>
			
			
			function dragAndDrop(){
				tree.enableDragAndDrop(true);
				tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){
					var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
					if(r){
						return updateDragData(sId,tId);
					}else{
						return false;
					}
				});
			}
			
			function updateDragData(sId,tId){
				var flag = true;
				var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"interfaceTree"};
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
			
			//ztree
			var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick,
					beforeDrop: zTreeBeforeDrop,
					onAsyncSuccess: zTreeOnAsyncSuccess  // 异步加载正常结束的事件回调函数
				},
				async: {
					enable: true,
					url: "${path}sys/workMagAction_listModuleTree.ms",
					autoParam: ["id"],
					dataFilter: ajaxDataFilter
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				}
			};
			//用于捕获异步加载正常结束的事件回调函数
			function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
				var treeObj = $.fn.zTree.getZTreeObj(treeId);
				var nodes = treeObj.getNodes();
				if (nodes.length>0) {
					for(var i=0;i<nodes.length;i++){
					treeObj.expandNode(nodes[i], true, false, false);//默认展开第一级节点
					}
				}
			}
	
			 function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
					var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
					if(r){
						return updateDragData(treeNodes[0].id,targetNode.id);
					}else{
						return false;
					}
					
			   };
			
				function zTreeOnClick(event, treeId, treeNode){
						url = "${path}sys/workMagAction_listModule.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&paraMap.UP_ID="+treeNode.id
						parent.mainFrame.location.href= url;
					
				}
			
				function ajaxDataFilter(treeId, parentNode, responseData) {
				    return responseData.ajaxList;
				};
				
				$(function(){
					tree=$.fn.zTree.init($("#index_tree"), setting);
				});
			
			
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>