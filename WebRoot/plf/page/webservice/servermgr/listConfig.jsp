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
	<form id="searchForm" name="searchForm" action="${path}webservice/ServerMgrAction_listConfig.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编号" /></div>
								<div class ="search_value">
								<s:textfield id="config.id" name="config.id" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="接口名称" /></div>
								<div class ="search_value">
								<s:textfield id="config.name" name="config.name" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<s:hidden name="config.moduleId"></s:hidden>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" style="table-layout: fixed;">
		<thead>
		<tr class="tdcolor">
			<th width="50px"><dict:lang value="序号" /></th>
			<th width="100px"><dict:lang value="编号" /></th>
			<th width="100px"><dict:lang value="接口名称" /></th>
			<th width="80px"><dict:lang value="服务状态" /></th>
			<th width="100px"><dict:lang value="接口说明" /></th>
			<th width="80px"><dict:lang value="操作" />
				<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="config" status="index">
		<tr id="<s:property value="#config.id"/>">
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="#config.id"/>><s:property value="#config.id"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="#config.name"/></td>
			<td><dict:viewDict dictCode="SERVICE_STSTUS" dictValue="%{#config.status}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="memo"/>><s:property value="#config.memo"/></td>
			<td>
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="edit('%{#config.id}');" title="%{getText('修改')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_modify.gif" />
				</bu:funOper>||
				<s:if test="#config.status == 0 || #config.status==3">
					<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="unDeploy('%{#config.id}');" title="%{getText('关闭')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/m_cancel.gif" />
					</bu:funOper>
				</s:if>
				<s:else>
					<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="deploy('%{#config.id}');" title="%{getText('发布')}" prefix="&nbsp;" >
						<img src="${IMG_PATH}/up_16x16.gif" />
					</bu:funOper>
				</s:else>
				||
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="view('%{#config.id}');" title="%{getText('查看')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/books_open.gif" />
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
	var url = "${path}webservice/ServerMgrAction_toAddConfig.ms?config.moduleId="+"<s:property value="config.moduleId"/>";
	showPopWin(url, 800, 450,null,"<dict:lang value="服务配置" /> <dict:lang value="新增" />");
}

function edit(id){
	var url = "${path}webservice/ServerMgrAction_toEditConfig.ms?config.id="+id;
	showPopWin(url, 800, 450,null,"<dict:lang value="服务配置" /> <dict:lang value="修改" />");
}

function deploy(id) {
	util.showLoading("服务正在发布,请稍后...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}webservice/ServerMgrAction_deployConfig.ms",
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

function unDeploy(id) {
	util.showLoading("服务正在关闭,请稍后...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"config.id":id
	    },
	    url: "${path}webservice/ServerMgrAction_unDeployConfig.ms",
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

function view(id) {
	var url = "${path}webservice/ServerMgrAction_toViewDetail.ms?config.id="+id;
	showPopWin(url, 800, 450,null,"<dict:lang value="服务详情" /> <dict:lang value="查看" />");
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
		url : '${path}webservice/ServerMgrAction_deleteConfig.ms',
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