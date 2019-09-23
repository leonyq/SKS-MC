<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<style>
	html,body{
		overflow-y:hidden;
	}
</style>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" name="addForm" action="${path}httpService/httpMgrAction_addConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
					
				<table class="add_table">
					<%-- <tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<blockquote class="layui-elem-quote">
						<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
					</blockquote>--%>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口模块名" />
						</td>
						<td style="width: 270px;">
							<input type="text" readonly="readonly" id="portModuleName" name="config.portModuleName" value="<s:property value="config.portModuleName"/>" class="_VAL_NULL"  />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口方法名" />
						</td>
						<td style="width: 270px;">
							<input type="text" readonly="readonly" id="portMethodName" name="config.portMethodName"  value="<s:property value="config.portMethodName"/>" class="_VAL_NULL" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="服务类型" />
						</td>
						<td style="width: 270px;">
							<dict:viewDict  dictCode="PORT_TYPE" dictValue="${fn:escapeXml(paramMap.serverType)}" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求方法类型" />
						</td>
						<td style="width: 270px;">
							<dict:viewDict  dictCode="RQ_TYPE" dictValue="${fn:escapeXml(paramMap.portMethodType)}" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求报文类型" />
						</td>
						<td style="width: 270px;">
							<dict:viewDict  dictCode="RQF_TYPE" dictValue="${fn:escapeXml(paramMap.requestType)}" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="返回报文类型" />
						</td>
						<td style="width: 270px;">
							<dict:viewDict  dictCode="RS_TYPE" dictValue="${fn:escapeXml(paramMap.returnType)}" />
						</td>		
					</tr> 
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口状态" />
						</td>
						<td style="width: 270px;">
						
						<s:if test="${paramMap.portStatus == 0}">
						<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="shutPort('%{#paramMap.httpid}');" title="%{getText('关闭接口')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ico-state-h.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_H_PNG %>" />
						</bu:funOper>
						</s:if>
						<s:if test="${paramMap.portStatus == 1}">
							<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="openPort('%{#paramMap.httpid}');" title="%{getText('开启接口')}" prefix="&nbsp;" >
							<img src="${IMG_PATH}/ico-state.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_PNG %>" />
							</bu:funOper>
						</s:if>
						</td>
					</tr>
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口实现类" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							<input readonly="readonly" type="text" id="className" name="config.className"  value="<s:property value="config.className"/>" class="_VAL_NULL input_indent" style="width:100%;" />
							<i class="layui-icon layui-icon-search" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<input type="hidden" id="codeType" name="config.codeType" value="<s:property value="config.codeType"/>"/>
							<textarea type="hidden" id="classCode" name="config.classCode" style="display:none"><s:property value="config.classCode"/></textarea>
							<%-- 
							<a href="javascript:void(0);" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');">
								<dict:lang value="查看" />
							</a>--%>
						</td>
						
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td colspan="4">
							<textarea id="portDetail" readonly="readonly"  name="config.portDetail" rows="4" style="width:100%" class="_VAL_NULL" ><s:property value="config.portDetail"/></textarea>
						</td>
					</tr> 
					<tr id="http_tr">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口路径HTTP" />
						</td>
						<td colspan="4">
							<textarea id="portPath"  readonly="readonly" name="config.portPath" rows="4" style="width:100%" class="_VAL_NULL" ><s:property value="config.portPath"/></textarea>
						</td>
					</tr> 
					<tr id="https_tr">
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口路径HTTPS" />
						</td>
						<td colspan="4">
							<textarea readonly="readonly" style="width:100%" class="_VAL_NULL" rows="4" >${fn:escapeXml(paramMap.httpsAddress)}</textarea>
						</td>
					</tr> 
				</table>
				<input type="hidden" id="mcIframeName" value="<s:property value="paraMap.mcIframeName"/>" />
				<input type="hidden" id="portParentModuleID" name="config.portParentModuleID"  value="<s:property value="config.portParentModuleID"/>"/>
				<input type="hidden" id="hdReturnType"  value="<s:property value="config.returnType"/>"/>
				<input type="hidden" id="hdRequestType"  value="<s:property value="config.requestType"/>"/>
				<input type="hidden" id="hdPortMethodType"  value="<s:property value="config.portMethodType"/>"/>
				<input type="hidden" id="hdServerType"  value="<s:property value="config.serverType"/>"/>
				<input type="hidden" id="serverSourceId" name="config.serverSourceId" value="<s:property value="config.serverSourceId"/>"/>
				<input type="hidden" id="Id" name="config.Id"  value="<s:property value="config.Id"/>"/>
				<input type="hidden" id="portStatus" name="config.portStatus"  value="<s:property value="config.portStatus"/>"/>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var id = $("#Id").val();
	function init(){
		
	}
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var piframeName = window.frameElement.name;
		var url = "${path}httpService/httpMgrAction_toViewCode.ms"+"?paraMap.piframeName="+piframeName;
		showPopWin(url, '99%', '99%',null,"<dict:lang value="查看类源码"/>");
	}
	
	function updateCodeData(codeType,className,classCode) {
		$("#codeType").val(codeType);
		$("#className").val(className);
		$("#classCode").val(classCode);
	}
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	function init() {
	var buttonflag=<s:property value="paramMap.httpHttpsButton"/>;
	
	if(buttonflag==2){
		$("#http_tr").hide();
	}
	if(buttonflag==1){
		$("#https_tr").hide();
	}
} 
function openPort() {
	if(!id)return;
	util.showLoading("接口正在打开,请稍后...");
	var mcIframeName = $("#mcIframeName").val();
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}httpService/httpMgrAction_openPort.ms",
		success: function(data){
			util.closeLoading();
			mcWindow.frames['mainFrame'].flashPage();
			window.document.location.reload();
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}

function shutPort() {
if(!id)return;
	util.showLoading("接口正在关闭,请稍后...");
	var mcIframeName = $("#mcIframeName").val();
	var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
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
			mcWindow.frames['mainFrame'].flashPage();
			window.document.location.reload();
		},
		error: function(msg){
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>