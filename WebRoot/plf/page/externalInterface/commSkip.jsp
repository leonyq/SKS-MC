<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="对外接口跳转页面" />
</title>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
</head>
<body>
	<form id="addForm" name="addForm" method="post" target="submitFrame">
			<input type="hidden" id="interface" value="<s:property value="ajaxMap.interface"/>"> 
			<input type="hidden" id="up_id" value="<s:property value="ajaxMap.up_id"/>"> 
			<input type="hidden" id="interfaceId" value="<s:property value="ajaxMap.interfaceId"/>"> 
	</form>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<script type="text/javascript">
		var type=$("#interface").val();
		var up_id=$("#up_id").val();
		var id=$("#interfaceId").val();
		$(function(){
			switch(type){
				case "0":
					url="${path}webservice/ServerMgrAction_listConfig.ms?config.moduleId="+up_id+"&config.id="+id;
					break;
				case "1":
					url="${path}webservice/ClientMgrAction_listConfig.ms?config.moduleId="+up_id+"&config.id="+id;
					break;
				case "2":
					url="${path}httpService/httpMgrAction_listConfig.ms?config.portParentModuleID="+up_id+"&config.id="+id;
					break;
				case "3":
					url="${path}sys/JClzAction_listCommClass.ms?paraMap.UP_ID="+up_id+"&id="+id;
					break;
				default:
					url='${path}webservice/ServerMgrAction_listConfig.ms?config.moduleId='+id;
					
			}
			parent.mainFrame.location.href= url;
		});
	</script>
<%@ include file="/plf/common/pub_end.jsp"%>