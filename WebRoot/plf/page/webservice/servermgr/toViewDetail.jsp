<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="类源码" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
</jsp:include>
</head>
<body>
<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}webservice/ServerMgrAction_editConfig.ms" method="post" target="submitFrame">
				<table class="add_table">
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="接口名称" />
						</td>
						<td width="35%">
							<s:textfield  name="config.name" cssClass="_VAL_NULL" cssStyle="width:90%;" readonly="true"></s:textfield>
						</td>
						<td width="15%" class="tr1">
							<dict:lang value="接口说明" />
						</td>
						<td width="35%">
							<s:textfield  name="config.memo" cssClass="_VAL_NULL" cssStyle="width:90%;"></s:textfield>
						</td>
					</tr> 
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="接口地址" />
						</td>
						<td width="85%" colspan="3">
							<s:textfield  name="config.serverAddress" cssClass="_VAL_NULL" cssStyle="width:90%;"></s:textfield>
						</td>
					</tr> 
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="接口描述文件地址" />
						</td>
						<td width="85%" colspan="3">
							<s:textfield  name="config.descFileAddress" cssClass="_VAL_NULL" cssStyle="width:90%;"></s:textfield>
						</td>
					</tr> 
				</table>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>