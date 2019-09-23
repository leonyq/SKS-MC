<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模型管理"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>
<div class="all">
	<form id="search_form" name="searchForm" action="${path}sys/BussModelAction_queryModuleExport.ms"  method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<table class="search_table">
		<tr>
				<td width="80%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模型ID" /></div>
								<div class ="search_value">
								<s:textfield id="M_ID" name="paraMap.M_ID" cssClass="input" maxlength="100"/>
								</div>
							</div>
							<div class="search_div" style="margin-left:  100px;">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="M_NAME" name="paraMap.M_NAME" cssClass="input" maxlength="100"/>
								</div>
							</div>
						</td>
			<td width="20%" align="right">
			 	<input type="button" value="<dict:lang value="查询" />" onclick="queryModule();" class="botton_img_search">
			    <input type="button" value="<dict:lang value="导入" />" onclick="importModule();" class="botton_img_search">
		  		<input type="button" value="<dict:lang value="导出" />" onclick="exportModule(this);" class="botton_img_search">
		    </td>
	    </tr>
	</table>
	</form>
	
	<div>
<div class="all">	
	<div>
	<form id="listForm" name="listForm" action="${path}sys/BussModelAction_listModuleExport.ms" method="post">
		<input type="hidden" id="paraMap_MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<form id="moduleForm" name="moduleForm" action="${path}sys/BussModelAction_exportMod.ms" method="post" target="submitFrame">
   <input type="hidden" id="filepaths" name="paraMap.filepaths"></input>
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th width=5%><input type="checkbox" id="selectAll"/></th>
			<th width="10%"><dict:lang value="序号" /></th>
			<th width="35%"><dict:lang value="模型ID" /></th>
			<th width="30%"><dict:lang value="模型名称" /></th>
			<th width="20%"><dict:lang value="操作" />
			</th>
		</tr>
		<thead>
		<tbody>
	<!--<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="ID"/></td>
			<td><s:property value="M_NAME"/></td>
			<td>
				<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif" /></a>
			</td>
		</tr>
	</s:iterator>-->
	
		<c:forEach items="${page.dataList}" var="ls" varStatus="index">
		<tr>
			<td><input type = "checkbox" name="checkbox" value = "<c:out value='${ls.id}' />"></td>
			<td>${index.count}</td>
			<td><c:out value='${ls.id}' /><s:property value="name"/></td>
			<td><c:out value='${ls.m_name}' /><s:property value="loginName"/></td>
			<td>
				<bu:funOper funcNo="F25" type="a" href="update('${fn:escapeXml(ls.id)}');" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></bu:funOper>
				<%-- <bu:funOper funcNo="F26" type="a" href="javascript:void(0);" onclick="del('@{funcUrl}','${ls.id}');" title="%{getText('模块导出')}" prefix="&nbsp;" ><img src="${IMG_PATH}/ContImg10.gif" /></bu:funOper> --%>
			</td>
		</tr>
		</c:forEach>
	
	</tbody>
	</table>
	</form>
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
	
	function queryModule(thisObj){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	function importModule()
	{
		var url = "${path}sys/BussModelAction_importModule.ms";
		showPopWin(url, 300, 200,null,"<dict:lang value="模块导入"/>");
	}
	function exportModule()
	{
		var obj = document.getElementsByName('checkbox');
		var ids = "";
		for(var i = 0; i < obj.length; i++)
		{
			if(obj[i].checked)
			{
				ids += obj[i].value + ',';
			}
		}
		if (ids == '')
		{
			util.alert("<dict:lang value="请选择至少一条记录"/>");
		}
		else
		{
			var filepath = document.getElementById("filepaths");
			filepath.value = ids;
<%--			util.showTopLoading();--%>
			document.forms.moduleForm.submit();
		}
	}
	function alertInfo(msg){
<%--		util.closeTopLoading()--%>
		isSubmit = false;
		util.alert(msg);
	}
	$("#selectAll").click(function(){
		if($(this).is(":checked"))
		{
			$("[name=checkbox]:checkbox").attr("checked",true);
		}
		else
		{
			$("[name=checkbox]:checkbox").attr("checked",false);
		}
	});
	
	function reloadPg(msg){
		util.alert(msg,reload);
		//parent.leftFrame.location.href= "${path}sys/BussModelAction_listBussModelTree.ms";<%-- 刷新模型树菜单列表 --%>
		
		
	}
	
	function reload()
	{
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_moduleExport.ms?mid="+id;
		showPopWin(url, 300, 400,null,"<dict:lang value="模块导出及配置"/>");
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>