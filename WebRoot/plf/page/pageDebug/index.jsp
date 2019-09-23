<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="多语言配置文件修改页面" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
	
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		
		<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	</head>
	<body>
<div class="all">
	
<s:form id="add_form" name="addForm" action="${path}sys/pageDebugAction_index.ms" method="post">
	行数:<s:textfield name="paraMap.colNum"></s:textfield></br>
	字符数:<s:textfield name="paraMap.charNum"></s:textfield></br>
	包名:<s:textfield name="paraMap.packageName"></s:textfield></br>
	类名:<s:textfield name="paraMap.javaName"></s:textfield></br>
 	设置断点:<button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="add_form" name="addForm" action="${path}sys/pageDebugAction_index.ms" method="post">
	包名:<s:textfield name="paraMap.packageName"></s:textfield></br>
	类名:<s:textfield name="paraMap.javaName"></s:textfield></br>

 	设置断点:<button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="con_form" name="con_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	类名:<s:textfield name="paraMap.condition"></s:textfield></br>
 	设置条件断点:<button type="button" onclick="addCon(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="var_form" name="var_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	类名:<s:textfield name="paraMap.variable"></s:textfield></br>
 	设置变量断点:<button type="button" onclick="addVar(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="add_express_form" name="add_express_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	表达式:<s:textfield name="paraMap.expression"></s:textfield></br>
	threadId:<s:textfield name="paraMap.threadId"></s:textfield></br>
 	增加表达式断点:<button type="button" onclick="addExpress(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="extend_express_form" name="extend_express_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	表达式:<s:textfield name="paraMap.expression"></s:textfield></br>
	线程ID:<s:textfield name="paraMap.threadId"></s:textfield></br>
 	展开堆栈断点:<button type="button" onclick="extendExpress(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="exception_form" name="exception_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	异常全类名:<s:textfield name="paraMap.exception"></s:textfield></br>
	异常断点类型:<s:textfield name="paraMap.type"></s:textfield></br>
	异常操作标志:<s:textfield name="paraMap.flag"></s:textfield></br>
 	设置异常断点:<button type="button" onclick="addExp(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="next_form" name="next_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	线程ID:<s:textfield id="threadId1" name="paraMap.threadId"></s:textfield></br>
	下一步:<button type="button" onclick="next(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="in_form" name="in_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	线程ID:<s:textfield id="threadId2" name="paraMap.threadId"></s:textfield></br>
	步入:<button type="button" onclick="inform(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="out_form" name="out_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	线程ID:<s:textfield id="threadId3" name="paraMap.threadId"></s:textfield></br>
	步出:<button type="button" onclick="outform(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="cont_form" name="cont_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	线程ID:<s:textfield id="threadId4" name="paraMap.threadId"></s:textfield></br>
	F8:<button type="button" onclick="cont(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="del_form" name="del_form" action="${path}sys/pageDebugAction_index.ms" method="post">
	断点ID:<s:textfield id="breakPointId" name="paraMap.breakPointId"></s:textfield></br>
	F8:<button type="button" onclick="delform(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
</s:form>
<s:form id="close_form" name="close_form" action="${path}sys/pageDebugAction_closeClsCode.ms" method="post">
	全路径类名:<s:textfield name="paraMap.className"></s:textfield></br>
 	设置断点:<button type="button" onclick="close1(this);"><i class="ico ico-save"></i><dict:lang value="关闭" /></button>
</s:form>
</div>	
<script type="text/javascript">
var urlTest= "${path}sys/pageDebugAction_checkOpen.ms";
	var urlTest2= "${path}sys/pageDebugAction_loadClass.ms";
$(function(){
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : urlTest2,
		success : function(data) {
		},
		error : function(msg) {
		}
	});
})
function delform(){
	document.getElementById("del_form").action="${path}sys/pageDebugAction_delform.ms"
	document.forms.del_form.submit();
}
function addExp(){
	document.getElementById("exception_form").action="${path}sys/pageDebugAction_setExceptionPoint.ms"
	document.forms.exception_form.submit();
}
function next(){
		var url1="${path}sys/pageDebugAction_nextform.ms";
		var threadId=$("#threadId1").val();
		$.ajax({
			type : "POST",
			async : false,
			dataType : "json",
			data:{'paraMap.threadId':threadId},
			url : url1,
			success : function(data) {
			},
			error : function(msg) {
			}
		});
}
function inform(){
	var url1="${path}sys/pageDebugAction_inform.ms"
	var threadId=$("#threadId2").val();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		data:{'paraMap.threadId':threadId},
		url : url1,
		success : function(data) {
		},
		error : function(msg) {
		}
	});
}
function outform(){
	var url1="${path}sys/pageDebugAction_outform.ms"
	var threadId=$("#threadId3").val();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		data:{'paraMap.threadId':threadId},
		url : url1,
		success : function(data) {
		},
		error : function(msg) {
		}
	});
}
function cont(){
	var url1="${path}sys/pageDebugAction_contform.ms"
	var threadId=$("#threadId4").val();
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		data:{'paraMap.threadId':threadId},
		url : url1,
		success : function(data) {
		},
		error : function(msg) {
		}
	});
}
function addCon(){
	document.getElementById("con_form").action="${path}sys/pageDebugAction_addBreakPointForCon.ms"
	document.forms.con_form.submit();
}
function addVar(){
	document.getElementById("var_form").action="${path}sys/pageDebugAction_addBreakPointForVar.ms"
	document.forms.var_form.submit();
}
function addExpress(){
	document.getElementById("add_express_form").action="${path}sys/pageDebugAction_addBreakPointForExpress.ms"
	document.forms.add_express_form.submit();
}
function extendExpress(){
	document.getElementById("extend_express_form").action="${path}sys/pageDebugAction_extendExpress.ms"
	document.forms.extend_express_form.submit();
}
function add(){

	document.getElementById("add_form").action="${path}sys/pageDebugAction_addBreakPoint.ms"
	document.forms.add_form.submit();
}
function close1(){
	alert(1);

	document.getElementById("close_form").action="${path}sys/pageDebugAction_closeClsCode.ms"
	document.forms.close_form.submit();
}
/* //判断当前浏览器是否支持WebSocket  
if ('WebSocket' in window) {  
    websocket = new WebSocket("ws://" + "190.160.5.123:8080" + "/mc/websocket/w");  
} else {  
    alert('当前浏览器 Not support websocket')  
}  
  		
//连接发生错误的回调方法  
websocket.onerror = function() {  
    alert("WebSocket连接发生错误");  
};  
  
//连接成功建立的回调方法  
websocket.onopen = function() {  
    alert("WebSocket连接成功");  
}  
//接收到消息的回调方法  
websocket.onmessage = function(event) {
	$("#testDebug").append(event.data);
	alert(event.data);
}  
  
//连接关闭的回调方法  
websocket.onclose = function() {  
    alert("WebSocket连接关闭");  
}  
  
//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
window.onbeforeunload = function() {  
    closeWebSocket();  
}  
  
//关闭WebSocket连接  
function closeWebSocket() {  
    websocket.close();  
}   */
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>