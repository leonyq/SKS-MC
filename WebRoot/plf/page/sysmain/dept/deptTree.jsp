<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title><dict:lang value="单位信息树型列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="tree" />
		<script>
			function tonclick(id,cid){
				var url = "${path}sys/DeptAction_listDept.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F30&deptDtoSh.upId="+id;
				parent.mainFrame.location.href= url;
			}
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.setOnClickHandler(tonclick);
			tree.loadXML("${path}sys/DeptAction_listDeptTree.ms");
			tree.setXMLAutoLoading("${path}sys/DeptAction_listDeptTree.ms");
		</script>

	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>