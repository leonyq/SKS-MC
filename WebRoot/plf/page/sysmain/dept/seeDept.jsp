<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="部门信息查看" /></title>
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
		<div style="height: 235px;">
	<table class="basic-table">
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="部门名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="deptDto.name" readonly="true"/>
			</td>
		</tr>
        <tr>
			<td style="width: 116px;text-align: right;"><dict:lang value="默认角色" /></td>
			<td style="text-align: left;padding-left:5px;">
				
				<s:textfield cssClass="input" cssStyle="width: 200px;" id="roleName" name="deptDto.roleName" readonly="true"/>
				
			</td>
       </tr>
        <tr>
			<td style="width: 98px;text-align: right;"><dict:lang value="默认工种" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" id="jobName" name="deptDto.jobName" readonly="true"/>
			</td>
       </tr>
        <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="是否权限控制" /></td>
			<td style="text-align:left;padding-left: 5px;" id="isAuth">
				<dict:viewDict dictCode="SY_DEPT_IS_AUTH" dictValue="${fn:escapeXml(deptDto.isAuth)}"/>
		    </td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="ERP代码" /></td>
			<td style="text-align:left;padding-left: 5px;">

				<s:textfield cssClass="input" cssStyle="width: 200px;" name="deptDto.erpCode" readonly="true"/>
			</td>
       </tr>
     </table>
   </div>
</div>
<script type="text/javascript">
	$(function(){
		<s:if test="${deptDto.roleName==null }">
		$("#roleName").val("<dict:lang value="未选择"/>");
		</s:if>
		<s:if test="${deptDto.jobName==null }">
		$("#jobName").val("<dict:lang value="未选择"/>");
		</s:if>
		<s:if test="${deptDto.isAuth==null }">
		$("#isAuth").text("<dict:lang value="未选择"/>");
		</s:if>
	});
	
	

</script>

	
</body>
<%@ include file="/plf/common/pub_end.jsp" %>