<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="wss详细页面" /></title>
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

<div class="all">	
	<%--<div class="ptop_10 txac">
			<table class="func_table">
	    		<tr>
	      			<td width="100%" align="right">
	      			<s:if test="${paraMap.interfaceStatus == 0}">
					<input type="button" value="<dict:lang value="关闭服务" />" onclick="unDeploy();" class="botton_img_add">
					&nbsp;&nbsp;
					</s:if>
					<s:else>
					<input type="button" value="<dict:lang value="发布" />" onclick="deploy();" class="botton_img_add">
					&nbsp;&nbsp;
					</s:else>
					<%-- <input type="button" value="<dict:lang value="查看" />" onclick="view();" class="botton_img_search"> 
					</td>
	      		</tr>
			</table>
	</div>
	--%>
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
							<input type="text" id="interfaceName" value="<s:property value="paraMap.interfaceName"/>" readonly="readonly" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="服务状态" />
						</td>
						
						<td style="width: 270px;">
							<dict:selectDict id="interfaceStatus" dictCode="SERVICE_STSTUS" dictValue="${fn:escapeXml(paraMap.interfaceStatus)}"/>
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
					<tr id="http_tr">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口地址" />
						</td>
						<td style="width: 270px;">
							<input type="text" value="<s:property value="paraMap.serverAddress"/>" readonly="readonly" />
						</td>
					</tr> 
					<tr id="http_tr2">
						<td width="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口描述文件地址" />
						</td>
						<td style="width: 270px;">
							<input type="text" value="<s:property value="paraMap.descFileAddress"/>" readonly="readonly" />
						</td>
					</tr> 
					<tr id="https_tr">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口地址https" />
						</td>
						<td style="width: 270px;">
							<input type="text" value="<s:property value="paraMap.wssAddress"/>" readonly="readonly" />
						</td>
					</tr> 
					<tr id="https_tr2">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口描述文件地址https" />
						</td>
						<td style="width: 270px;">
							<input type="text" value="<s:property value="paraMap.descWssAddress"/>" readonly="readonly" />
							
						</td>
					</tr> 
					
	</table>
	<input type="hidden" id="mcIframeName" value="<s:property value="paraMap.mcIframeName"/>" />
	<div class="ptop_10 txac">
		<s:if test="${paraMap.interfaceStatus == 0}">
			<input type="button" value="<dict:lang value="关闭服务" />" onclick="unDeploy();" class="layui-btn">
				
		</s:if>
		<s:else>
			<input type="button" value="<dict:lang value="发布" />" onclick="deploy();" class="layui-btn layui-btn-normal">
			
		</s:else>
			
	</div>
	</form>
	</div>
</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
		
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
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

function deploy() {
	util.showLoading("服务正在发布,请稍后...");
	var mcIframeName = $("#mcIframeName").val();
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}webservice/ServerMgrAction_deployConfig.ms",
		success: function(data){
			util.closeLoading();
			mcWindow.frames['mainFrame'].flashPage();
			//closePopWin();
			location.replace(location.href);
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}

function unDeploy() {
	util.showLoading("服务正在关闭,请稍后...");
	var mcIframeName = $("#mcIframeName").val();
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}webservice/ServerMgrAction_unDeployConfig.ms",
		success: function(data){
			util.closeLoading();
			mcWindow.frames['mainFrame'].flashPage();
			location.replace(location.href);
			//closePopWin();
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}

function view() {
	var url = "${path}webservice/ServerMgrAction_toViewDetail.ms?config.id="+id;
	showPopWin(url, 800, 450,null,"<dict:lang value="服务详情" /> <dict:lang value="查看" />");
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
	var buttonflag=<s:property value="paraMap.httpHttpsButton"/>;
	if(buttonflag==2){
		$("#http_tr").hide();
		$("#http_tr2").hide();
	}
	if(buttonflag==1){
		$("#https_tr").hide();
		$("#https_tr2").hide();
	}
} 
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>