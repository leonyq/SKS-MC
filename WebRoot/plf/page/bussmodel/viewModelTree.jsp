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

	<body style="background:#EEEEEE;">
		<!-- div><a href="javascript:add();"><dict:lang value="新建模型" />+</a></div -->
			<ul id="index_tree" class="ztree" ></ul>
			<script>
				function tonclick(id,cid){
					var hasChildren = tree.hasChildren(id);
					if(hasChildren!=0){
						return;
					}
					var MID = "";
					if(typeof (this.getUserData(id,"MID")) !='undefined'){
						MID=this.getUserData(id,"MID");
					}
					if(undefined == tree.getUserData(id,"actionMethod")){
						return;
					}
					var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id;
					//var url = "${path}sys/BussModelAction_"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.ID="+id;
					var viewId = "<c:out value='${paraMap.viewId}' />";
					var viewNameId = "<c:out value='${paraMap.viewNameId}' />";
					var trId = "<c:out value='${paraMap.trId}' />";
					var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id;
					console.log(url);
					if(viewId){
						url+="&paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId;
					}
					parent.mainFrame.location.href= url;
				}

				//var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
				
				//tree.setXMLAutoLoading("${path}sys/BussModelAction_");//该功能树为一次性加载，不需要设置该方法
				//tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_scbrblue/");
				//tree.setOnClickHandler(tonclick);
				//tree.loadXMLString("${treeXml}");
				
				
				//ztree
				var setting = {
					data: {
						simpleData: {
							enable: true,
							pIdKey: "upId"
						}
					},
					callback: {
						onClick: zTreeOnClick
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
					    url: "${path}sys/BussModelAction_listBussViewModelTreeByztree.ms",
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
				/**
					var hasChildren = tree.hasChildren(id);
					if(hasChildren!=0){
						return;
					}
					var MID = "";
					if(typeof (this.getUserData(id,"MID")) !='undefined'){
						MID=this.getUserData(id,"MID");
					}
					if(undefined == tree.getUserData(id,"actionMethod")){
						return;
					}
					var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id;
					//var url = "${path}sys/BussModelAction_"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.ID="+id;
					var viewId = "${paraMap.viewId}";
					var viewNameId = "${paraMap.viewNameId}";
					var trId = "${paraMap.trId}";
					var url = "${path}"+tree.getUserData(id,"actionMethod")+"?paraMap.MID="+MID+"&paraMap.treeID="+id;
					console.log(url);
					if(viewId){
						url+="&paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId;
					}
					parent.mainFrame.location.href= url;
				**/
					var path=treeNode.path;
					var parents=path.split("-");
					var whoPath="";
					var parent1=null;
					for(var i=0;i<parents.length-1;i++){
						if(i==0){
							parent1=treeNode.getParentNode()
							whoPath="-"+parent1.name+whoPath;
						}else if(i!=parents.length-2&&i!=0){
							parent1=parent1.getParentNode();
							whoPath="-"+parent1.name+whoPath;
						}else{
							parent1=parent1.getParentNode();
							whoPath=parent1.name+whoPath;
						}
					}
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
					
					var viewId = "<c:out value='${paraMap.viewId}' />";
					var viewNameId = "<c:out value='${paraMap.viewNameId}' />";
					var trId = "<c:out value='${paraMap.trId}' />";
					var viewCode = "<c:out value='${paraMap.viewCode}' />";
					var funcId = "<c:out value='${paraMap.funcId}' />";
					var mcIframeName = "<c:out value='${paraMap.mcIframeName}' />";
					console.log(url);
					if(viewId){
						url+="&paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId+"&paraMap.whoPath="+whoPath+"&paraMap.viewCode="+viewCode+"&paraMap.funcId="+funcId+"&paraMap.mcIframeName="+mcIframeName;
					}
					parent.mainFrame.location.href= url;
					
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