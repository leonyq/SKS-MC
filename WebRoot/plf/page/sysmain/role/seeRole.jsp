<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="角色查看" /></title>
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
			   
			<div style="height: 160px;">
	<table class="basic-table">
       <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="角色名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" id="roleName" name="roleDto.name" readonly="true" maxlength="30" />
			</td>
       </tr>
       <tr>
        <td style="width: 116px;text-align: right;"><dict:lang value="角色描述" /></td>
       	<td style="text-align: left;padding-left:5px; height: 80px;">
       		<textarea name="roleDto.remark" id="roleDto_remark" style="width: 200px;height: 100%;" readonly="readonly" maxlength="200"><s:property value="roleDto.remark"/></textarea>
       	</td>
       </tr>
     </table>
    
   </div>
</div>



</body>
<%@ include file="/plf/common/pub_end.jsp" %>