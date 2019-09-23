<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
	    <title>选择上级功能菜单树型结构</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
		<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
	<script type="text/javascript">
	
	var piframeName = '<s:property value="paraMap.piframeName"/>';
	var pIframe = top.window.frames[piframeName];
	
	function add(){
		var _key = tree.getSelectedItemId();
		var _value = tree.getSelectedItemText();
		/* $("#funcDto_upId",pIframe).val(_key);
		$("#funcDto_upName",pIframe).val(_value); */
		pIframe.upFunc(_key,_value);
		closePopWin();
	}

	
	</script>
  </head>

	<body>
	<div style="position:fixed;top:0;left:38%;margin-bottom:10px;margin-top:5px;">
		<input type="button" value="<dict:lang value='确定' />" onclick="add();" class="layui-btn">
		<input type="button" value="<dict:lang value='关闭' />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
	</div>
	<hr style="position:fixed;top:40px;width:100%;margin-top:5px;"/>
	<div style="position:fixed;top:50px;left:0;overflow:auto;height:83%;width:100%;">	
		<div id="index_tree" class="tree" />
		<script>
			function tonclick(id,cid){
				//var url = "${path}sys/FuncAction_listFunc.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F45&funcDtoSh.upId="+id;
				//parent.mainFrame.location.href= url;
			}
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_scbrblue/");
			tree.setOnClickHandler(tonclick);
			tree.loadXML("${path}sys/FuncAction_listBsFuncTree.ms?open=1");
			tree.setXMLAutoLoading("${path}sys/FuncAction_listBsFuncTree.ms");
			tree.setOnDblClickHandler(function(){add()});
		</script>
	</div>
	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>