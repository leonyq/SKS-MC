<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="工种查看" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;">
			    
			<div style="height: 180px;">

	<table class="basic-table">
        <tr>

			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="工种名称" /></td>
			<td style="text-align: left;padding-left:5px;">

				<s:textfield cssClass="input" cssStyle="width: 230px;" name="jobDto.jobName"  id="jobName" readonly="true" />
			</td>
       </tr>
       <tr>

			<td style="width: 116px;text-align: right;"><dict:lang value="工种等级" /></td>
			<td style="text-align: left;padding-left:5px;">

				<s:textfield cssClass="input" cssStyle="width: 230px;" name="jobDto.jobLevel" id="jobLevel" readonly="true" />
			</td>
       </tr>
       <tr>

			<td style="width: 116px;text-align: right;"><dict:lang value="工种描述" /></td>
       		<td colspan="3" style="text-align: left;padding-left:5px;height: 80px;">
       		<textarea name="jobDto.remark" id="jobDto_remark" style="width: 230px;height: 100%;" maxlength="200" readonly="readonly" ><s:property value="jobDto.remark"/></textarea>
       		</td>
       </tr>
     </table>
	</div>
</div>



</body>
<%@ include file="/plf/common/pub_end.jsp" %>