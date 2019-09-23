<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="持久模型列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="search_form" name="searchForm" action="" method="post">
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="10%"><dict:lang value="序号" /></th>
			<th width="25%"><dict:lang value="类全名" /></th>
			<th width="25%"><dict:lang value="类说明" /></th>
			<th width="25%"><dict:lang value="类型" /></th>
			<th width="15%"><dict:lang value="操作" />
				<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="CLZ_QNAME"/></td>
			<td><s:property value="CLASS_DESC"/></td>
			<td><s:property value="MS_CLASS_TYPE"/></td>
			<td>
				<a href="javascript:view('<s:property value="id"/>')" title="<dict:lang value='查看' />" ><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
				||<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.id" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
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
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(){
		var url = "${path}sys/BussModelAction_addClzMgr.ms?paraMap.MID=<s:property value="paraMap.MID"/>";
		showPopWin(url, 800, 400,null,"新增");
	}
	
	function view(id){
		var url = "${path}sys/BussModelAction_viewClzMgr.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ID="+id;
		showPopWin(url, 800, 400,null,"修改");
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_forEditClzMgr.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ID="+id;
		showPopWin(url, 800, 400,null,"修改");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delClzMgr.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);<%-- 设置table点击行颜色 --%>
		_tongLineColor(tableTrJs);<%-- 设置table隔行换颜色 --%>
	}
	
	init();

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>