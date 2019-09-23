<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title>选择上级功能菜单树型结构</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	<script type="text/javascript">
	function add(){
		var _key = tree.getSelectedItemId();
		var _value = tree.getSelectedItemText();
		
		var obj={"isFramesetMethod":false,"type":"document"};
		var par_dom=getSrcDom(obj);
		
		$("#funcDto_upId",par_dom).val(_key);
		$("#funcDto_upName",par_dom).val(_value);
		$("#paraMapUpId",par_dom).val(_key);
		closePopWin();
		
	}

	function _closeWin(){
		closePopWin();
	}
	</script>
  </head>

	<body>
	
	<div class="ptop_10 txac">
		<button class="layui-btn" onclick="add();">提交</button>
		
		&nbsp;&nbsp;
		<input type="button" value="<dict:lang value="关闭" />" onclick="_closeWin();" class="layui-btn layui-btn-danger">
	</div>
	
	<div style="position:fixed;top:20px;left:10;overflow:auto;height:80%;width:100%;">	
		<div id="index_tree" class="tree" />
		<script>
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.loadXML("${path}sys/UserCustomAction_listCommClassTree.ms");
			tree.setXMLAutoLoading("${path}sys/UserCustomAction_listCommClassTree.ms"); 
			tree.setOnDblClickHandler(function(){add()});
		</script>
	</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>