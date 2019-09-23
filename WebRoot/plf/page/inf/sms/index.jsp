<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模型管理"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			<jsp:param name="pageWidth" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
<div class="">
	<form id="search_form" name="searchForm" action="${path}sys/ALIMsgAction_queryList.ms"  method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
		<table class="search_table">
		<tr>
			<td>
				<div class="search_table_wrap">
					<dict:lang value="短信模板名称" />
					<div class="layui-input-inline">
						<s:textfield id="name" name="aliMsgDtoSh.name" cssClass="input_sh" maxlength="100" />
					</div>
				</div>
				<div class="search_table_wrap">
					<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
					<input type="button" value="<dict:lang value="新增" />" onclick="add()"  class="layui-btn" />
					<input type="button" value="<dict:lang value="修改" />" onclick="update(this);"  class="layui-btn" />
					<input type="button" value="<dict:lang value="删除" />" onclick="del()"  class="layui-btn" />
					<input type="button" value="<dict:lang value="模板属性" />" onclick="config(this)"  class="layui-btn" />
				</div>
			</td>
				
	    </tr>
	</table>
	</form>
		
	<div class="table_div">
	<form id="moduleForm" name="moduleForm" action="${path}sys/ALIMsgAction_queryList.ms" method="post" target="submitFrame">
   <input type="hidden" id="filepaths" name="paraMap.filepaths"></input>
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th width="40px;"><input type="checkbox" id="selectAll"/></th>
			<th width="40px;"><dict:lang value="序号" /></th>
			<th width="120px;"><dict:lang value="短信模板名称" /></th>
			<th width="120px;"><dict:lang value="accessKeyId" /></th>
			<th><dict:lang value="accessKeySecrt" /></th>
			<th width="200px;"><dict:lang value="短信签名" />
			<th width="100px;"><dict:lang value="短信类型" />
			</th>
		</tr>
		<thead>
		<tbody>
		<c:forEach items="${page.dataList}" var="ls" varStatus="index">
		<tr id="<c:out value='${ls.id}'/>">
			<td><input type = "checkbox" name="checkbox" value = "<c:out value='${ls.id}' />" ></td>
			<td>${index.count}</td>
			<td title="<c:out value='${ls.name}' />"><c:out value='${ls.name}' /></td>
			<td title="<c:out value='${ls.accessKeyId}' />"><c:out value='${ls.accessKeyId}' /></td>
			<td title="<c:out value='${ls.accessKeySecrt}' />"><c:out value='${ls.accessKeySecrt}' /></td>
			<td title="<c:out value='${ls.autograph}' />"><c:out value='${ls.autograph}' /></td>
			<td><dict:viewDict dictCode="ALIMSG_TYPE" dictValue="${fn:escapeXml(ls.type)}" /></td>
		</tr>
		</c:forEach>
	
	</tbody>
	</table>
	</form>
	</div>
	<%-- 
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm&resetSearchVal=resetSearchVal" />
	</div>--%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
</div>

	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	function add(){
		var url = "${path}sys/ALIMsgAction_toAdd.ms"+"?mcIframeName="+window.name;
		showPopWin(url, 650, 480,null,"<dict:lang value="新增"/>");
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	$("#selectAll").click(function(){
		if($(this).is(":checked"))
		{
			$("[name=checkbox]:checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}
		else
		{
			$("[name=checkbox]:checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	});
	
	//点击行寄选中该行
	$("#listTable tr").on("click",function(e){
		var trId = $(this).attr("id");
		
		if ($("#"+trId+" :checkbox").attr("checked")) {
			$("#"+trId+" :checkbox").attr("checked",false);
			$("#"+trId).css("background-color","");
		}else{
			$("#listTable input[type='checkbox']").each(function(){
				if ($(this).attr("checked")) {
					$(this).attr("checked",false);
					$(this).parents("tr").css("background-color","");
				}
			});
			$("#"+trId+" :checkbox").attr("checked",true);
			$("#"+trId).css("background-color","#a0c8e5");
		}
	});
	
	  $("#listTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#a0c8e5");
		  }
	  });
	
	function reloadPg(msg){
		util.alert(msg,reload);
	}
	
	function reload()
	{
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	function query()
	{
		document.forms.searchForm.submit();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	var allDels = null;
	var count=0;
	function getAlldelAx(){
		allDels = null
		count=0;
		$("#listTable :checkbox").each(function(){
					if($(this).attr("checked")){
						if(allDels ==null){
							allDels=$(this).val();
						}else{
							allDels=allDels+","+$(this).val();
						}
						count++
					}
				});
	}
	function update(id){
		getAlldelAx();
		if(count==0){
			util.alert("请至少选择一条记录");
			return;
		}
		if(count>1){
			util.alert("只能选择一条记录");
			return;
		}
		var url = "${path}sys/ALIMsgAction_toUpdate.ms?paraMap.id="+allDels+"&mcIframeName="+window.name;
		showPopWin(url, 650, 480,null,"<dict:lang value="修改"/>");
	}
	function del() {
		getAlldelAx();
		if(count==0){
			util.alert("请至少选择一条记录");
			return;
		}
		util.confirm(delConfirm,"确定是否删除");
	}
	function delConfirm() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/ALIMsgAction_delete.ms",
			data : {"paraMap.id":allDels},
			success : function(data) {
				util.closeLoading();
				top.util.alert("删除成功");
				window.document.location.reload();
			},
			error : function(msg) {
				util.closeLoading();
				top.util.alert("删除失败");
			}
		});
	}
	function init(){
		/*var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);*/
	}
	function config(){
		getAlldelAx();
		if(count==0){
			util.alert("请至少选择一条记录");
			return;
		}
		if(count>1){
			util.alert("只能选择一条记录");
			return;
		}
		var url = "${path}sys/ALIMsgAction_toConfig.ms?paraMap.msg_id="+allDels;
		showPopWin(url, 700, 550,null,"<dict:lang value="模板属性"/>","");
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>