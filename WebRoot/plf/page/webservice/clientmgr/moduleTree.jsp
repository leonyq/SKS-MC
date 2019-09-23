<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="公用类树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="tree" >
		<script>
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","0");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
			tree.loadXML("${path}webservice/ClientMgrAction_listModuleTree.ms");
			tree.setOnClickHandler(function (id) {
				if(id=="1") {
					url = "${path}webservice/ClientMgrAction_listModule.ms";
				}else {
					url = "${path}webservice/ClientMgrAction_listConfig.ms?config.moduleId=" + id;
				}
				parent.mainFrame.location.href= url;
			});
		</script>
		</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>