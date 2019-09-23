<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="我的消息查看" /></title>
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
	<s:hidden name="dataMap.TEXT"  id="text"/>
	<div style="background-color: white;">
		<div style="height: 330px;">
	<table class="basic-table">
        <tr>
			<td style="width: 116px;text-align: right;"><dict:lang value="消息标题" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;"  readonly="true" id="msgtitle"/>
			</td>
		</tr>
        <tr>
			<td style="width: 116px;text-align: right;"><dict:lang value="消息类型" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="text" Class="input" style="width:200px;" id ="msgType" readonly="true" />
			</td>
       </tr>
        <tr>
			<td style="width: 98px;text-align: right;"><dict:lang value="消息内容" /></td>
			<td style="text-align: left;padding-left:5px;">
				<%-- <s:textfield cssClass="input" cssStyle="width: 200px;" value="%{dataMap.TEXT}" name="dataList.TEXT" readonly="true"/> --%>
					
					<textarea name="msgDto.text" disabled="disabled" id="msgDto_text"  rows="12" style="width:624px" class="_VAL_NULL" ></textarea>
			</td>
       </tr>
     </table>
   </div>
</div>
<script type="text/javascript">
	$(function(){
		var type =<c:out value='${dataMap.TYPE}' />;
		switch(type){
		case 1:
		$("#msgType").val("系统公告类通知");
		break;
		case 2:
		$("#msgType").val("流程处理消息");
		break;
		case 3:
		$("#msgType").val("预警消息");
		break;
		default:
		$("#msgType").val(type);
		};
		var title ="<c:out value='${dataMap.TITLE}' />";
		$("#msgtitle").val(decodeHtml(title));
		
		$("#msgDto_text").val(decodeHtml($("#text").val()));
	});
	
	

</script>

	
</body>
<%@ include file="/plf/common/pub_end.jsp" %>