<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
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

<div class="all>
	<%-- 
	<div class="ptop_10 txac">
		<input type="button" value="<dict:lang value="重新加载" />" onclick="reload();" class="botton_img_add">
	</div>--%>
	<div  class="add_table_div">
	<form id="add_form" class="layui-form" name="addForm" action="" method="post">
	<table class="add_table">
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="编号" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="id" value="<s:property value="paraMap.id"/>" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口名称" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="interfaceName" value="<s:property value="paraMap.interfaceName"/>" />
						</td>
					</tr> 
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
						<dict:lang value="服务类型" />
						</td>
						<td style="width: 270px;">							
							<dict:selectDict id="interfaceType" dictCode="WS_CLIENT_TYPE" dictValue="${fn:escapeXml(paraMap.interfaceType)}"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="interfaceMemo" value="<s:property value="paraMap.interfaceMemo"/>" />
						</td>
					</tr>
	</table>
	<div class="ptop_10 txac">
			<input type="button" value="重新加载" onclick="reload();" class="layui-btn">
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
function reload() {
	util.showLoading("正在重新加载配置,请稍后...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}webservice/ClientMgrAction_reloadAddress.ms",
		success: function(data){
			util.closeLoading();
			util.alert("加载成功");
		},
		error: function(msg){
			util.closeLoading();
			util.alert("加载失败");
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