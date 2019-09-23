<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="视图模型"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
	
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/BussModelAction_flowListView.ms" method="post">
		<input type="hidden" id="paraMap_MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
		<input type="hidden" id="paraMap_viewId" name="paraMap.viewId" value="<s:property value="paraMap.viewId"/>"/>
		<input type="hidden" id="paraMap_viewNameId" name="paraMap.viewNameId" value="<s:property value="paraMap.viewNameId"/>"/>
		<input type="hidden" id="paraMap_trId" name="paraMap.trId" value="<s:property value="paraMap.trId"/>"/>
		<input type="hidden" id="paraMap_whoPath" name="paraMap.whoPath" value="<s:property value="paraMap.whoPath"/>"/>
	</form>
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="5%"></th>
			<%--<th width="20%"><dict:lang value="视图ID" /></th>
			--%>
			<th width="15%"><dict:lang value="版本号" /></th>
			<th width="15%"><dict:lang value="流程名称" /></th>
			<%--<th width="15%"><dict:lang value="视图编码" /></th>--%>
			
			<%--<th width="15%"><dict:lang value="自定义类名" /></th>
		--%></tr>
		<thead>
		<tbody>
	<s:iterator value="listData" status="index">
		<tr class="listDataTr">
			<td><s:property value="#index.count"/></td>
			<td><input type="radio" name="viewId"  value="<s:property value="proc_de_id"/>"/></td>
			<%--<td><s:property value="ID"/></td>
			--%><td><s:property value="version"/></td>
			<td class="VIEW_NAME"><s:property value="name"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm&resetSearchVal=resetSearchVal" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
		<input type="hidden" id="MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);};
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}

	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}
	
	$(function(){
		$(".listDataTr").click(function(){
			$(this).find("input[name='viewId']").attr("checked","checked");
		});
		var parentFrame = top.document.getElementById("iframe3");
		$(".listDataTr").dblclick(function(){
			var viewId = $(this).find("input[name='viewId']:checked").val();
			var viewName = $(this).children(".VIEW_NAME").text();
			var paraMap_viewId = $("#paraMap_viewId").val();
			var trId = $("#paraMap_trId").val();
			var paraMap_viewNameId = $("#paraMap_viewNameId").val();
			var mcIframeName  =window.name;			
			var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});			
			$("#"+paraMap_viewId,parentFrame.contentWindow.document).val(viewId);
	        $("input[type='checkbox'][value='"+trId+"']",parentFrame.contentWindow.document).attr("checked","checked");
	        $("#"+paraMap_viewNameId,parentFrame.contentWindow.document).val(viewName);
	        var whoPath=$("#paraMap_whoPath").val();
	        $("#"+paraMap_viewNameId,parentFrame.contentWindow.document).attr("title",whoPath+"-"+viewName);
	        mcWindow.closePage();
		});
		
	});
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>