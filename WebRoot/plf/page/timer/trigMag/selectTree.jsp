<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="任务管理树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="zTree" value="1" />
	</jsp:include>
	<style>
		.containerTableStyle{
			overflow-x: auto;
			
		}
	</style>
  </head>
	<body>
		<div id="index_tree" class="ztree">

		<script>
			var selectId="<%=CommMethodMc.escapeJs(request.getParameter("selectId")) %>";
			var mcIframeName="<%=request.getParameter("mcIframeName")%>";
			var userDataAuth="<%=request.getParameter("userDataAuth")%>";
			var url;
			
<%--			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");--%>
<%--			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");--%>
<%--			tree.setOnClickHandler(tonclick);--%>
<%--			tree.setXMLAutoLoading("${path}sys/workMagAction_trigListModuleTree.ms?paraMap.selectId="+selectId);--%>
<%--			tree.loadXML("${path}sys/workMagAction_trigListModuleTree.ms?paraMap.selectId="+selectId);--%>
<%--			--%>
			
			
			var zTreeObj=null;
			var setting = {
					data: {
						simpleData: {
							enable: true,
							pIdKey: "upId"
						}
					},
					callback: {
						onClick: tonclick
					}
					
				};
			
			$(function() {
				
				$.ajax({
							type : "POST",
							dataType : "json",
							url : "${path}sys/workMagAction_trigListModuleTree.ms",
							data:{
								"paraMap.selectId":selectId
							},
							success : function(data) {
								zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
								if(selectId!='null'){
									var node = zTreeObj.getNodeByParam("id",selectId);
									zTreeObj.checkNode(node, true, true);
									 var parent = node.getParentNode();
									 if(parent!=null){
									          if(!parent.open){  
									        	  zTreeObj.expandNode(parent,true,true);  
									          }  
								          }
									 }
							},
							error : function(msg) {
								util.closeLoading();
								util.alert("error:" + msg);
							}
						});
			})
			
			 function tonclick(event, treeId, treeNode){
					id=treeNode.id;
					url = "${path}sys/workMagAction_selectListModule.ms?paraMap.UP_ID="+id+"&paraMap.checkId="+selectId+'&mcIframeName='+mcIframeName+'&userDataAuth='+userDataAuth+"&paraMap.queryType=checkTask"
					parent.frames.selectListFrame.location.href= url;
			} 
			
			
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>