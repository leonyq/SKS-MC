<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title><dict:lang value="修改数据字典值" /></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>

	<body class="ContBody">
		<div style="background-color: white;">
			<div style="height: 263px;">
	<table class="basic-table">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="编码" />(KEY)</td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;"  value="${dictValDto.code}"  readonly="true"/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="编码值" />(value)</td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input"  value="<c:out value='${dictValDto.value}'/>"  style="width: 230px;" readonly="readonly"/>
			</td>
       </tr>
        <tr>
			<td style="width: 170px;text-align: right;"><dict:lang value="下拉列表显示顺序" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input" value="<c:out value='${dictValDto.dispIndx}'/>" readonly="readonly" style="width: 230px;"/>
				<br/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="是否显示" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input" id="isDisp" value="可显示"  style="width: 230px;" readonly="readonly"/>
			</td>
       </tr>
       <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="是否可用" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input class="input"  id="isSelc"  style="width: 230px;" readonly="readonly"/>
			</td>
       </tr>
     </table>
   </div>
	
</div>
	<script type="text/javascript">
		$(function(){
			<s:if test="${dictValDto.isDisp==1}">
				$("#isDisp").val("可显示");
			</s:if>
			<s:else>
				$("#isDisp").val("不可显示");
			</s:else>
			<s:if test="${dictValDto.isSelc==1}">
				$("#isSelc").val("可用");
			</s:if>
			<s:else>
				$("#isSelc").val("禁用");
			</s:else>
		});
	</script>
</body>
</html>
