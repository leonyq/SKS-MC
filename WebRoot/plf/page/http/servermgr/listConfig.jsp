<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}httpService/httpMgrAction_listConfig.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="接口模块名" /></div>
								<div class ="search_value">
								<s:textfield id="portModuleName" name="config.portModuleName" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="接口方法名" /></div>
								<div class ="search_value">
								<s:textfield id="portMethodName" name="config.portMethodName" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="服务类型" /></div>
								<div class ="search_value">
								<dict:selectDict name="config.serverType" dictCode="PORT_TYPE" dictValue="%{${config.serverType}}"/>
								</div>
							</div>
							<input type="hidden" id="portParentModuleID" name="config.portParentModuleID"  value="${paramMap.portParentModuleID }"/>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" style="table-layout: fixed;"  width="1000px" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="30px"><dict:lang value="序号" /></th>
			<th width="90px"><dict:lang value="接口模块名" /></th>
			<th width="90px"><dict:lang value="接口方法名" /></th>
			<th width="50px"><dict:lang value="服务类型" /></th>
			<th width="100px"><dict:lang value="接口说明" /></th>
			<th width="50px"><dict:lang value="接口状态" /></th>
			<th width="55px"><dict:lang value="操作" />
				<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="config" status="index">
		<tr id="<s:property value="#config.id"/>">
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="#config.portModuleName"/>><s:property value="#config.portModuleName"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="#config.portMethodName"/>><s:property value="#config.portMethodName"/></td>
			<td><dict:viewDict dictCode="PORT_TYPE" dictValue="%{#config.serverType}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="#config.portDetail"/>><s:property value="#config.portDetail"/></td>
			<td>
				<s:if test="#config.portStatus == 0">
					<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="shutPort('%{#config.id}');" title="%{getText('关闭接口')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ico-state-h.png" />
					</bu:funOper>
				</s:if>
				<s:else>
					<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="openPort('%{#config.id}');" title="%{getText('开启接口')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ico-state.png" />
					</bu:funOper>
				</s:else>
			</td>
			<td>
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="edit('%{#config.id}');" title="%{getText('修改')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_modify.gif" />
				</bu:funOper>||
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="view('%{#config.id}');" title="%{getText('查看')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_view.gif" />
				</bu:funOper>||
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="del('%{#config.id}');" title="%{getText('删除')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_del.gif" />
				</bu:funOper>
			</td>
		</tr>
		
	</s:iterator>
	</tbody>
	
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">

function reloadPg(msg){
	util.alert(msg,reloadPgExe);
}

function reloadPgExe(msg){
	document.forms.searchForm.submit();
}

function add(){
	var url = "${path}httpService/httpMgrAction_toAddConfig.ms?config.portParentModuleID="+$("#portParentModuleID").val();
	showPopWin(url, 900, 500,null,"<dict:lang value="服务配置" /> <dict:lang value="新增" />");
}

function edit(id){
	var url = "${path}httpService/httpMgrAction_toEditConfig.ms?config.id="+id+"&type=mody";
	showPopWin(url, 900, 500,null,"<dict:lang value="服务配置" /> <dict:lang value="修改" />");
}

function openPort(id) {
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

function shutPort(id) {
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

function view(id) {
	var url = "${path}httpService/httpMgrAction_toViewDetail.ms?config.id="+id;
	showPopWin(url, 900, 500,null,"<dict:lang value="服务详情" /> <dict:lang value="查看" />");
}
function query(thisObj){
	_pageCurrentPageObj.value="1";
	document.forms.searchForm.submit();
	thisObj.onclick = function(){util.alert(util.submit_default_info);}
	util.showTopLoading();
}



var delId;
function del(id) {
	delId = id;
	util.confirm(delConfirm);
}

function delConfirm() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : '${path}httpService/httpMgrAction_deleteConfig.ms',
		data : "config.id=" + delId,
		success : function(data) {
			util.closeLoading();
			window.document.location.reload();
		},
		error : function(msg) {
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
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