<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
	  <title><dict:lang value="UI组件树型列表"/></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
	</jsp:include>

  </head>

	<body>
		<div id="index_tree" class="tree" />
		<script>
			var preSelectId = "<c:out value='${UI_MODEL_ID_DEFA}'/>'";
			function toclick(id,cid){
				if(id.indexOf("<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@UI_TYPE_ID_PRE}" />")>-1){tree.selectItem(preSelectId);return ;}
				preSelectId = id;
				var url = "${path}sys/BussModelAction_showCfgUIComp.ms?paraMap.FORM_COL_ID=<s:property value="paraMap.FORM_COL_ID"/>&paraMap.UI_COMP=<s:property value="paraMap.UI_COMP"/>&paraMap.UI_COMP__TYPE=<s:property value="paraMap.UI_COMP__TYPE"/>&paraMap.FORM_ID=<s:property value="paraMap.FORM_ID"/>&paraMap.UI_MODEL_ID="+id;
				//alert(url);
				parent.mainFrame.location.href= url;
			}
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			<%-- 需要把 /mes/WebRoot/plf/page/bussmodel/formui/img目录下新增的ui图片考贝过来 --%>
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/");
			tree.setOnClickHandler(toclick);
			tree.loadXMLString("<c:out value='${uiCompTreeXml}'/>");
			<c:if test="${null != UI_MODEL_ID_DEFA}" >
			tree.selectItem("<c:out value='${UI_MODEL_ID_DEFA}'/>");
			</c:if>
		</script>

	</body>
	
<%@ include file="/plf/common/pub_end.jsp" %>