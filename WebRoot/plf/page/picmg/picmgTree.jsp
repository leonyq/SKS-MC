<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="统一图片管理树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="zTree" value="1" />
	</jsp:include>

  </head>

	<body>
	
		<!--  
		<div style='margin-left:27px;margin-top:10px;'>
			<input type="button" value="<dict:lang value="新增" />" onclick="add_tree()"  class="botton_img_add" />
			<input type="button" value="<dict:lang value="修改" />" onclick="edit_tree()"  class="botton_img_add" />
			<input type="button" value="<dict:lang value="删除" />" onclick="del_tree()"  class="botton_img_add" />
			
		</div>
		-->
		
		<div id="index_tree" class="ztree" style='margin-top:10px;'>
		<script>		
			function alertInfo(msg){
				util.alert(msg);
			}
			
			function reloadPg(msg){
				util.alert(msg,reloadPgCf);
			}
			
			function reloadPgCf(){
				$.fn.zTree.init($("#index_tree"), setting);
				hidePopWin(false);
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
					onAsyncSuccess: zTreeOnAsyncSuccess
				},
				async: {
					enable: true,
					url: "${path}picmg/picmgAction_listPicmgByZtree.ms",
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
				var url = "${path}picmg/picmgAction_picmglist.ms?paramMap.NODE_ID="+treeNode.id;
				parent.mainFrame.location.href= url;
				
			}
		
			function ajaxDataFilter(treeId, parentNode, responseData) {
			    return responseData.ajaxList;
			};
			
			function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		        var treeObj = $.fn.zTree.getZTreeObj("index_tree");
		        var node = treeObj.getNodeByParam("id", "0", null);
		        if(node!=null){
		          treeObj.expandNode(node, true, false, true);
		        }
		              
		    };
      
			$(function(){
				$.fn.zTree.init($("#index_tree"), setting);
			});
			
			function get_selectednode(){
				var selectednode=null;
				
				var treeObj = $.fn.zTree.getZTreeObj("index_tree");
				var node = treeObj.getSelectedNodes();
				if(node!=null){
					selectednode=node[0];
				}
				
				return selectednode;
				
			}
			
			function add_tree(){
				var selectednode=get_selectednode();
				if(selectednode==null){
					util.alert("请先选中要新增的父节点");
	   				return false;
				}
				
				var url='${path}picmg/picmgAction_showaddtreenode.ms?paramMap.UP_ID='+selectednode.id;
    			showPopWin(url, 360, 300,null,"<dict:lang value="统一图片管理"/>");
				
			}
			
			function edit_tree(){
				var selectednode=get_selectednode();
				if(selectednode==null){
					util.alert("请先选中要修改的节点");
	   				return false;
				}
				
				if(selectednode.id=='0'){
					util.alert("根节点不能修改");
	   				return false;
				}
				
				var url='${path}picmg/picmgAction_showedittreenode.ms?paramMap.ID='+selectednode.id;
    			showPopWin(url, 360, 300,null,"<dict:lang value="统一图片管理"/>");
				
			}
			
			function del_tree(){
				var selectednode=get_selectednode();
				if(selectednode==null){
					util.alert("请先选中要删除的节点");
	   				return false;
				}
				
				if(selectednode.id=='0'){
					util.alert("根节点不能删除");
	   				return false;
				}
				
				if (confirm("确定删除该节点吗,如果删除则该节点下所有图片配置数据也删除？")){
					$.ajax({
				           url:'${path}picmg/picmgAction_deletetreenode.ms',
				           type:'GET',
				           dataType:'json',
				           data: {
				           	"paramMap.ID":selectednode.id
				           },
				           success:function (res) {
				               if(res.ajaxMap.result=='0'){
				               		util.alert("删除成功");
				               		
				               		$.fn.zTree.init($("#index_tree"), setting);
									hidePopWin(false);
					
				               }else{
				               		util.alert("删除失败");
				               }
				               
				           }
				     });
			     
				}
				
			}
			
			function reload_ztree(){
				$.fn.zTree.init($("#index_tree"), setting);
			}
			   
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>