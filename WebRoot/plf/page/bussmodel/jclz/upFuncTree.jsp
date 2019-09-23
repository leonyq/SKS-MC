<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title>选择上级功能菜单树型结构</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>
	<script type="text/javascript">
	function add(){
		var _key = tree.getSelectedItemId();
		var _value = tree.getSelectedItemText();
		$("#funcDto_upId",window.parent.document).val(_key);
		$("#funcDto_upName",window.parent.document).val(_value);
		$("#paraMapUpId",window.parent.document).val(_key);
		parent.closePopWin();
		
	}

	function _closeWin(){
		parent.closePopWin();
	}
	</script>
  </head>

	<body>
	<div style="position:fixed;top:0;left:30%;margin-bottom:10px;margin-top:5px;">
		<input type="button" value="<dict:lang value="确定" />" onclick="add();" class="botton_img_add">
		<input type="button" value="<dict:lang value="关闭" />" onclick="_closeWin();" class="botton_img_search">
	</div>
	<hr style="position:fixed;top:30px;width:100%;margin-top:5px;"/>
	<div style="position:fixed;top:50px;left:0;overflow:auto;height:83%;width:100%;">	
		<div id="index_tree" class="tree" />
		<script>
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.loadXML("${path}sys/JClzAction_listCommClassTree.ms");
			tree.setXMLAutoLoading("${path}sys/JClzAction_listCommClassTree.ms"); 
			tree.setOnDblClickHandler(function(){add()});
		</script>
	</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>