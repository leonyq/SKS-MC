<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="视图模型"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<style type="text/css">
			.layui-form-select,.layui-anim{
	        	width:180px !important ;
	        	word-break: break-all;
	        }
		</style>
	</head>
<body>

<div class="" style="overflow-x: visible;">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/FuncAction_platformParamList.ms" class="layui-form" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.MID" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
				<table class="search_table" style="overflow: auto;">
					<tr>
						<td>
						<c:if test="${isEnableAuth=='1'}">
							<div class="search_table_wrap">
								<span><dict:lang value="组织机构" /></span>
								<div class="layui-input-inline">
								<select class="input_sh" lay-search name="paraMap.DATA_AUTH">
									<option value="">--<dict:lang value="请选择" />--</option>
									<c:forEach items="${deptLs}"  var="dept">
									   <option value="<c:out value="${dept.id}"/>" <c:if test="${paraMap.DATA_AUTH eq dept.id}">selected</c:if>><c:out value="${dept.name}"/></option>
									</c:forEach>
								</select>
								</div>
							</div>
						</c:if>
						<div class="search_table_wrap">
							<span><dict:lang value="参数KEY" /></span>
							<div class="layui-input-inline">
			  					<s:textfield id="paraMap_PNAME" name="paraMap.PNAME" cssClass="input_sh" cssStyle="width:180px;" maxlength="300"/>
							</div>
						</div>
						<div class="search_table_wrap">
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
						</div>
						</td>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th width="40px;"><dict:lang value="序号" /></th>
			<c:if test="${isEnableAuth=='1'}">
				<th width="150px;">组织机构</th>
			</c:if>
			<th width="150px;"><dict:lang value="参数KEY" /></th>
			<th ><dict:lang value="参数VAL" /></th>
			<%--<th width="15%"><dict:lang value="参数类型" /></th>
			--%>
			<th width="80px;"><dict:lang value="状态" /></th>
			<th width="120px;"><dict:lang value="是否立即生效" /></th>
			<th width="80px;"><dict:lang value="操作" />
				<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
			</th>
		</tr>
		<thead>
		<tbody>
		<c:forEach items="${listData}" var="platformParam" varStatus="status">
		    <tr>
			<td><c:out value='${status.count}'/></td>
			<c:if test="${isEnableAuth eq '1'}">
			<td title="<c:out value='${platformParam.DEPTNAME}'/>"><c:out value='${platformParam.DEPTNAME}'/><input type="hidden" value="<c:out value='${platformParam.DATA_AUTH}'/>"/></td>
			</c:if>
			<td title="<c:out value='${platformParam.PNAME }' escapeXml='false'/>"><c:out value='${platformParam.PNAME }' escapeXml='false'/></td>
			<td title="<c:out value='${platformParam.PVALUE }' escapeXml='false'/>"><c:out value='${platformParam.PVALUE }' escapeXml='false'/></td>
			<%--<td>${platformParam.PTYPE }</td>
			--%>
			<td>
				<c:choose> 
				   <c:when test="${platformParam.STATE eq '1'}"> 启用</c:when> 
				   <c:otherwise>禁用</c:otherwise> 
				</c:choose> 
			</td>
			
				<td>
				<c:choose> 
				   <c:when test="${platformParam.WIE eq '1'}"> 是</c:when> 
				   <c:otherwise>否</c:otherwise> 
				</c:choose> 
			</td>
			<td>
				<a href="javascript:update('<c:out value="${platformParam.ID}"/>','<c:out value="${platformParam.PNAME }"/>','<c:out value='${platformParam.DEPTNAME}'/>')" class="layui-btn layui-btn-xs" ><dict:lang value="修改" /></a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm&resetSearchVal=resetSearchVal" />
	</div> --%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

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
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function alertMsg(msg){
		util.alert(msg);
		closePopWin();
		add();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}

	function add(){
		var height = 430;
		<c:if test="${isEnableAuth eq '1'}">
			height = 485;
		</c:if>
		var url = "${path}sys/FuncAction_forPlatForm.ms?paraMap.MID=<s:property value="paraMap.MID"/>"+"&mcIframeName="+window.name;
		showPopWin(url, 850, height,null,"<dict:lang value="新增"/>");
	}
	
	
	function update(id,viewName,authDataName){
		var height = 430;
		<c:if test="${isEnableAuth eq '1'}">
			height = 485;
		</c:if>
		var url = encodeURI("${path}sys/FuncAction_forPlatForm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ID="+id+"&mcIframeName="+window.name+"&authDataName="+authDataName);
		showPopWin(url, 850, height,null,"<dict:lang value="修改"/>");
		//window.open(url);
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delView.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
		
	}
	
	   layui.use('form', function(){
    	  var form = layui.form;
    	  form.render("select");
   	 });

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>