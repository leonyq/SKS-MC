<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="ztree" >
		<script>
			/*
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","0");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.loadXML("${path}sys/trigMagAction_listModuleTree.ms");
			tree.setOnClickHandler(function (id) {
				if(id=="1") {
					url = "${path}sys/trigMagAction_listModule.ms";
				}else {
					
					url = "${path}sys/trigMagAction_listConfig.ms?paraMap.moduleId=" + id;
				}
				parent.mainFrame.location.href= url;
			});
			*/
			
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
					onAsyncSuccess: zTreeOnAsyncSuccess  // 异步加载正常结束的事件回调函数
				},
				async: {
					enable: true,
					url: "${path}sys/trigMagAction_listModuleTreeByZtree.ms",
					autoParam: ["id"],
					dataFilter: ajaxDataFilter
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				}
			};
		
			function zTreeOnClick(event, treeId, treeNode){
				if(treeNode.id=="0") {
					url = "${path}sys/trigMagAction_listModule.ms";
				}else {
					
					url = "${path}sys/trigMagAction_listConfig.ms?paraMap.moduleId=" + treeNode.id;
				}
				parent.mainFrame.location.href= url;
				
			}
		
			function ajaxDataFilter(treeId, parentNode, responseData) {
			    return responseData.ajaxList;
			};
			
			$(function(){
				$.fn.zTree.init($("#index_tree"), setting);
				
				//var treeObj = $.fn.zTree.getZTreeObj("index_tree");
				//var node = treeObj.getNodeByParam("id", "0", null);
				//if(node!=null){
				//	treeObj.expandNode(node, true, false, true);
				//}
							
			});
			
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
			
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>