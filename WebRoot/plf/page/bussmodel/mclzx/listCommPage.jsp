<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/MClzMgrAction_listCommPage.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
			<s:hidden name="paraMap.MID" />
			<s:hidden name="shMap.MID" />
			
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编号" /></div>
								<div class ="search_value">
								<s:textfield id="shMap_ID" name="shMap.ID" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="页面名称" /></div>
								<div class ="search_value">
								<s:textfield id="shMap_PAGE_NAME" name="shMap.PAGE_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="8%"><dict:lang value="序号" /></th>
			<th width="10%"><dict:lang value="编号" /></th>
			<th width="25%"><dict:lang value="页面名称" /></th>
			<th width="35%"><dict:lang value="上级页面" /></th>
			<th width="10%"><dict:lang value="页面类型" /></th>
			<th width="12%"><dict:lang value="操作" />
			    <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><div style="width:80px;" class="nowrap_ellipsis" ><s:property value="ID"/></div></td>
			<td><s:property value="PAGE_NAME"/></td>
			<td><s:property value="UP_NAME"/></td>
			<td><s:property value="COMM_PAGE_TYPE"/></td>
			<td>
				<a href="javascript:update('<s:property value="ID"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif" /></a>
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
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		url = "${path}sys/MClzMgrAction_showAddCommPage.ms?paraMap.MID=<s:property value='shMap.MID' />";
		showPopWin(url, 800, 400,null,"<dict:lang value="公用页面" /> <dict:lang value="新增" />");
	}
	
	function update(id){
		var url = "${path}sys/MClzMgrAction_showEditCommPage.ms?paraMap.ID="+id;
		showPopWin(url, "90%", "100%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/MClzMgrAction_delCommPage.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
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