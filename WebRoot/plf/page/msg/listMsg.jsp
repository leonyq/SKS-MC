<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="消息列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<style type="text/css">
		td{
			overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
		</style>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}comm/MsgAction_listMsg.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.UP_ID" />
			<s:hidden name="shMap.UP_ID" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
			<%-- 	<table class="search_table">
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
				</table> --%>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" style="table-layout: fixed;" >
		<thead>
		<tr class="tdcolor">
			<th width="40px;"><dict:lang value="序号" /></th>
			<th width="180px;"><dict:lang value="消息标题" /></th>
			<th width="100px;"><dict:lang value="消息类型" /></th>
		<%-- 	<th width="5%"><dict:lang value="接收类型" /></th> --%>
			<th ><dict:lang value="消息内容" /></th>
			<th width="90px;"><dict:lang value="操作" />
			    <a  title="<dict:lang value="发送" />" href="javascript:add();"><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="title"/>"><s:property value="title"/></td>
			<td><dict:viewDict dictCode="MSGDTO_TYPE" dictValue="%{type}"/></td>
			<%-- <td><dict:viewDict dictCode="REC_OBJ_TYPE" dictValue="%{recObjType}"/></td> --%>
			<td title="<s:property value="text" />"><s:property value="text" /></td>
			<td>
			 </td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
	 --%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
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
	
	function add(){
		var mcIframeName = window.frameElement.name;
		var url = "${path}comm/MsgAction_addSendMsg.ms?paraMap.mcIframeName="+mcIframeName;
		showPopWin(url, 900, 500,null,"<dict:lang value="发送消息新增" />");
	}
	
	function update(id){
		var url = "${path}sys/UserCustomAction_showEditCommPage.ms?paraMap.ID="+id;
		showPopWin(url, "90%", "100%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/UserCustomAction_delCommPage.ms";
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