<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="导入员工结果" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>关闭</button>
			    </div>
			</div>
	<div align="center">
	<c:if test="${ajaxList[0]==ajaxList[1]}">
		<div id="template">
		 <br />
		 <br />
	<p><span class="Eng" style="font-size:36px"><dict:lang value="共有" />${fn:escapeXml(ajaxList[0])}<dict:lang value="条数据，成功插入" />${fn:escapeXml(ajaxList[1])}<dict:lang value="条数据" /></span>
		 <br />
		 <br />
		 <br />
		 </div>
		 </c:if>
	<c:if test="${ajaxList[0]==-1}">
		<div id="template">
		 <br />
		 <br />
	<p><span class="Eng" style="font-size:36px"><dict:lang value="共有" />${fn:escapeXml(ajaxList[0])+1}<dict:lang value="条数据，成功插入" />${fn:escapeXml(ajaxList[1])+1}<dict:lang value="条数据" /></span>
		 <br />
		 <br />
		 <br />
		 </div>
		 </c:if>
	<c:if test="${ajaxList[0]!=ajaxList[1] && ajaxList[0]!=-1}">
	<div align="center" style="font-size:18px">
		<br/>
		<p><span class="Eng" style="font-size:28px"><dict:lang value="共有" />${fn:escapeXml(ajaxList[0])}<dict:lang value="条数据，" />${fn:escapeXml(ajaxList[0])-fn:escapeXml(ajaxList[1])}<dict:lang value="条数据插入失败" /></span>
			<div align="center">
			<br/>
			<span><dict:lang value="失败原因如下：" /></span>
			</div>
			<div align="center">
			<textarea style="width: 500px;height: 160px;"><c:out value='${ajaxList[2]}' /></textarea>
			</div>
	</div>
	</c:if>	 
	</div>
	</div>
<script type="text/javascript">

	function shut(){
		parent.closePopWin();
		window.parent.location.reload();
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>