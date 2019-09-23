<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
		<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="ztree" >
		<script>
			/*
			function tonclick(id,cid,row){
				if("${paraMap.source}"){
					$("#paraMap_UI_DATA_VALUE_1",window.parent.document).val(id);
					$("#paraMap_UI_DATA_TEXT_1",window.parent.document).val(row.label);
					window.parent.closePopWin();
				}else{
					var url = "${path}sys/UserCustomAction_listCommPage.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&shMap.UP_ID="+id;
					parent.mainFrame.location.href= url;
				}
			}
			
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.setOnClickHandler(tonclick);
			tree.enableDragAndDrop(true);
			tree.attachEvent("onDrag", function(sId,tId,id,sObject,tObject){
				var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
				if(r){
					return updateDragData(sId,tId);
				}else{
					return false;
				}
			});
			tree.loadXML("${path}sys/UserCustomAction_listCommPageTree.ms");
			tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommPageTree.ms");
			*/
			
			function updateDragData(sId,tId){
				var flag = true;
				var data = {"paraMap.sId":sId,"paraMap.tId":tId,"paraMap.treeDataType":"pageTree"};
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
					onAsyncSuccess: zTreeOnAsyncSuccess
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				}
			};
		
			 $(function(){
				 getTree("");
			  });
				 function getTree(treeId){
				 $.ajax({
						type: "POST",
					    dataType: "json",
					    url: "${path}sys/UserCustomAction_listCommPageTreeByZtree.ms",
						success: function(data){
							if(data){
								var zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
								var node;
								if(treeId==""){
									 node = zTreeObj.getNodeByTId("tree_1");
								}else{
									 node = zTreeObj.getNodeByTId(treeId);
									 zTreeObj.selectNode(node);
								}
								zTreeObj.expandNode(node, true, false, true);
							}
					    },
						error: function(msg){
								//util.alert("error:"+msg.responseText);
						  }
						});
				 
			   }
				 
		   function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
				var r = confirm("<dict:lang value="确定移动该目录吗？"/>");
				if(r){
					return updateDragData(treeNodes[0].id,targetNode.id);
				}else{
					return false;
				}
           }
            var tree_Id;
			function zTreeOnClick(event, treeId, treeNode){
				tree_Id  = treeNode.tId;
				if("<c:out value='${paraMap.source}' />"){
					var mcIframeName="${mcIframeName}";
					var obj={"mcIframeName":mcIframeName,"type":"window"};	
					var par_win=getSrcByIframeName(obj).frames['mainFrame'];
				
					$("#paraMap_UI_DATA_VALUE_1",par_win.document).val(treeNode.id);
					$("#paraMap_UI_DATA_TEXT_1",par_win.document).val(treeNode.name);
					//window.parent.closePopWin();
					closePopWin();
					
				}else{
					var url = "${path}sys/UserCustomAction_listCommPage.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&shMap.UP_ID="+treeNode.id+"&paraMap.treeTid="+tree_Id;
					parent.mainFrame.location.href= url;
				}
				
			}
		
			function ajaxDataFilter(treeId, parentNode, responseData) {
			    return responseData.ajaxList;
            }
            function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		        var treeObj = $.fn.zTree.getZTreeObj("index_tree");
		        var node = treeObj.getNodeByParam("id", "0", null);
		        if(node!=null){
		          treeObj.expandNode(node, true, false, true);
		        }

    }
            function actionIs(treeTid){
				 getTree(treeTid);
			 }	
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>