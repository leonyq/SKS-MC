<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="功能菜单树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="zTree" value="1" />
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<script type="text/javascript">

	function _closeWin(){
		closePopWin();
	}
	</script>
  </head>
	<style>
	html,body{
		width:99%;
	}
	</style>
	<body>
	<%--<div style="position:fixed;top:0;left:30%;margin-bottom:10px;margin-top:5px;">
		<input type="button" value="<dict:lang value="确定" />" onclick="add();" class="layui-btn">
		<input type="button" value="<dict:lang value="关闭" />" onclick="_closeWin();" class="layui-btn layui-btn-danger">
	</div>
	--%>
	<!--  
	<hr style="position:fixed;top:30px;width:100%;margin-top:5px;"/>-->
	<div style="position:fixed;top:15px;left:0;width:100%">
			<ul id="index_tree" class="ztree" style="overflow-y:auto; width: 100%; height: 370px;padding: 0;margin: 0;"></ul>
			<script>
			
			var setting = {
					data: {
						simpleData: {
							enable: true,
							pIdKey: "upId"
						},
						key: {
							url: "xUrl"
						}
					},
					view: {  
				        showLine: false//不显示连接线，默认值true  
				        },  
					callback: {
						onClick: zTreeOnClick
					}
				};
			
				function zTreeOnClick(event, treeId, treeNode){
					var _key = treeNode.id;
					var _value = treeNode.name;
					var _path = treeNode.path;
					<%--var curWindow=getSrcByIframeName({mcIframeName:'<c:out value='${curIframeName}' />',type:'window'});
					$("#funcdto_upid",curWindow.document).val(_key);
					$("#up_name",curWindow.document).val(_value);
					$("#colPath",curWindow.document).val(_path);
					--%>
					//var obj1={};
					//obj1.type="document";
					var doc = getSrcDom({type:"document"});
					doc.getElementById("funcdto_upid").value=_key;
					doc.getElementById("up_name").value=_value;
					doc.getElementById("colPath").value=_path;
					closePopWin();
				}
				
				 $(function(){
		    	  $.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_listFpFuncTreeData.ms",
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
				
			</script>
	</div>
			<div class="ptop_10 txac">
		<input type="button" value="<dict:lang value="关闭" />" onclick="_closeWin();" class="layui-btn layui-btn-danger">
		</div>
	
	</body>
<%@ include file="/plf/common/pub_end.jsp" %>