<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="多语言配置查看" /></title>
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
<body>
	<div style="background-color: white;">
			<div style="height: 145px;overflow:auto;" class="scroll">
	<table class="basic-table">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="属性名称" />(KEY)</td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="messageKey" name="paraMap.messageKey" maxlength="125" readonly="true"/>
			</td>
			
       </tr>
        <tr>
       	<td style="width: 150px;text-align: right;"><span class="dot"></span><dict:lang value="模块名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="moduleName" name="paraMap.moduleName" maxlength="125" readonly="true"/>
			</td>
		</tr>
		<s:iterator id="key" value="keyList" status="index">
		<tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="${key}" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" name="paraMap.col${index.count}" id="col${index.count}" maxlength="125" cssStyle="width: 230px;" readonly="true"></s:textfield>
			</td>
			 </tr>
		</s:iterator>
     </table>
   </div>
</div>

<script>
$(window).on('load',function(){
	setPopScroll('.scroll')
})
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>