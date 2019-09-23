<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增注册控件" />
	</title>
		
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<style type="text/css">
	
	</style>
</head>
<body>
	<div class="all">
		<table>
		</br>
		
		 <s:iterator value="ajaxList" status="index">
		 	<tr>
		 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 	<a href="javascript:void();" onclick="downLoad('${filepath}')"><s:property value="filename"/></a>
		 	</td>
		 	</tr>
		 	
		 	<tr></tr>
		 	
		 </s:iterator>
		 
		 <c:if test="${ajaxList.size()==0}">
		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 	无资源文件...
		 </c:if>
		 
		 </table>
		 
	</div>


	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function seefile(id){
		var url = "${path}sys/cusControlAction_toseefile.ms?paraMap.id="+id;
		showPopWin(url, 500, 300,null,"<dict:lang value="查看资源文件" />");
	
	}
	
	function downLoad(filepath){
		var url = "${path}"+filepath;
		window.open(url);
	}
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>