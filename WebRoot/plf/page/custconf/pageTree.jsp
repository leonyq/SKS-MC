<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="前台主页定制" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
		<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="ztree" >
		<script>
			var setting = {
			data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				}
			},
			callback: {
				onAsyncSuccess: zTreeOnAsyncSuccess,
				onClick: zTreeOnClick
			},
			async: {
				enable: true,
				url: "${path}custconf/custconfAction_listPageByZtree.ms",
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
			var checked_node=treeNode.name;
		 	if(checked_node=='/buss/reso'){
		 		 return false;
		 	}
		 	
		 	var firstmcIframeName='${firstmcIframeName}';
		 	var mcIframeName="${mcIframeName}";
		 	
		 	/* alert('firstmcIframeName-'+firstmcIframeName);
		 	alert('mcIframeName-'+mcIframeName); */
			if(firstmcIframeName && mcIframeName){
				//console.log(firstmcIframeName,mcIframeName);
				//console.log( top.window.frames[firstmcIframeName]);
				var waiceng = top.window.frames[firstmcIframeName];
				waiceng.frames[mcIframeName].set_def_url(checked_node);
				
			}
			
			closePopWin();
				
		}
	
		function ajaxDataFilter(treeId, parentNode, responseData) {
		    return responseData.ajaxList;
		};
		
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
	         var treeObj = $.fn.zTree.getZTreeObj("index_tree");
	         treeObj.expandAll(true);
	         
	         var def_url="${def_url}";
			 var node = treeObj.getNodeByTId(def_url);
			 if(node!=null){
			 	 treeObj.checkNode(node, true, true);
			 	 
			 }
	         
	    };
	    
	 $(function(){
	    $.fn.zTree.init($("#index_tree"), setting);
		    
	})

		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>