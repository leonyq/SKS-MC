<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="功能菜单树型列表" /></title>
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
						},
						key: {
							url: "xUrl"
						}
					},
					callback: {
						onClick: zTreeOnClick
					}
				};
			
			function zTreeOnClick(event, treeId, treeNode) {
			    if("<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_TYPE_1"/>" == treeNode.type){
					var url = "${path}sys/FuncAction_showDevUserFunc.ms?funcDtoSh.id="+treeNode.id+"&MENU_FC="+treeNode.funcCode;
					if("<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_ROOT_ID"/>" != treeNode.id){
						var opener = "_tree_urlOpener";
						var openType= treeNode.openType;
						if(openType == null || openType== "0" || openType==""){ //原来的数据OpenType为null也系统标签，现在0为
							$(window.parent.document).contents().find("#mainFrame")[0].contentWindow.window.addTab(url,treeNode.name,treeNode.id);
						}else if(openType=="1") {
							window.open(url);
						}
					}
				}
			};
		    $(function(){
		    var urlVal="plf/js/dhtmlxtree/imgs/csh_bluebooks/";
		    var langs = _mcBase64JsToJava.getMcDealBase64Encode(urlVal);
		    	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_listUserPlfFuncByZtree.ms",
				    data:{iconPath:langs},
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
	</body>
<%@ include file="/plf/common/pub_end.jsp" %>