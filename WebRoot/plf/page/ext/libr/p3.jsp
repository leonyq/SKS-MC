<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>

<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<s:property value='dataMap.SHOW_NAME' />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>

	<div class="all">
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
    <table class="add_table" >
			<tr >
				<td align="center" > 
          <video width="800" height="500" controls="controls">
          <%-- 	<source src="${path }buss/bussModel_dlFileComm.ms?paraMap.fid=<s:property value='dataMap.DOWN_NAME' />" type="video/mp4"> --%>	
					<source src="${path }<s:property value='dataMap.SAVE_NAME_PATH' />" type="video/mp4">
					<b><dict:lang value="您的浏览器不支持 video 标签，请升级浏览器版本。" /></b>
					</video>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>

	<script type="text/javascript">
	
	function init(){
		
	}

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
