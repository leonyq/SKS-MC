<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
		<style type="text/css">
		 /*table#listTable tr td input {
		 	border:none;
		 }*/
		</style>
	</head>
<body>
<%-- 
<div class="ptop_10 txac">
			<table class="func_table">
	    		<tr>
	      			<td width="100%" align="right">
						<input type="button" value="<dict:lang value="查看" />" onclick="view();" class="botton_img_add">
	      			</td>
	      		</tr>
			</table>
	</div>--%>
<div class="all" >	
	<div  class="add_table_div">
	<form id="add_form" class="layui-form" name="addForm" action="" method="post">
	<input type="hidden" id="id" value="<s:property value="paraMap.id"/>" />
	<table class="add_table">
		
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口模块名" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="portModuleName" value="<s:property value="paraMap.portModuleName"/>" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口方法名" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="portMethodName" value="<s:property value="paraMap.portMethodName"/>" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="服务类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict id="serverType" dictCode="PORT_TYPE" dictValue="${fn:escapeXml(paraMap.serverType)}"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="portDetail" value="<s:property value="paraMap.portDetail"/>" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口状态" />
						</td>
						<td style="width: 270px;">
						<s:if test="${paraMap.portStatus == 0}">
						<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="shutPort('%{#config.id}');" title="%{getText('关闭接口')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ico-state-h.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_H_PNG %>" />
						</bu:funOper>
						</s:if>
						<s:else>
							<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="openPort('%{#config.id}');" title="%{getText('开启接口')}" prefix="&nbsp;" >
							<img src="${IMG_PATH}/ico-state.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_PNG %>" />
							</bu:funOper>
						</s:else>
						</td>
					</tr>
	</table>
	<div class="ptop_10 txac">
			<input type="button" value="查看" onclick="view();" class="layui-btn">
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
	</div>
	</form>
	</div>
</div>
<script type="text/javascript">
var id=$("#id").val();
function reloadPg(msg){
	util.alert(msg,reloadPgExe);
}

layui.use('form', function(){
	  var form = layui.form;
	  form.render("select");
});

function reloadPgExe(msg){
	document.forms.searchForm.submit();
}
function view() {
	var url = "${path}httpService/httpMgrAction_toViewDetail.ms?config.id="+id;
	showPopWin(url, 900, 500,null,"<dict:lang value="服务详情" /> <dict:lang value="查看" />");
}
function openPort() {
	util.showLoading("接口正在打开,请稍后...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}httpService/httpMgrAction_openPort.ms",
		success: function(data){
			util.closeLoading();
			window.document.location.reload();
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}

function shutPort() {
	util.showLoading("接口正在关闭,请稍后...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}httpService/httpMgrAction_shutPort.ms",
		success: function(data){
			if(data.ajaxMap.sucess==undefined){
				util.closeLoading();
				util.alert("error:" + data.ajaxMap.fail);
				return ;
			}
			util.closeLoading();
			window.document.location.reload();
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}


function query(thisObj){
	_pageCurrentPageObj.value="1";
	document.forms.searchForm.submit();
	thisObj.onclick = function(){util.alert(util.submit_default_info);}
	util.showTopLoading();
}
function init() {
	var tableTrJs = $("#listTable tbody tr");
	_toClickColor(tableTrJs);
	_tongLineColor(tableTrJs);
}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>