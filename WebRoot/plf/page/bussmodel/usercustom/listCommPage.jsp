<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div >	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/UserCustomAction_listCommPage.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.UP_ID" />
			<s:hidden name="shMap.UP_ID" />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		    <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		<s:hidden id="paraMap_treeTid" name="paraMap.treeTid" value="%{paraMap.treeTid}"/>
				<table class="search_table">
					<tr>
						<td>
						<!--  
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
						-->

					  	<div class="search_table_wrap">
				          <span><dict:lang value="编号" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="shMap_ID" name="shMap.ID" cssClass="input_sh" maxlength="33" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				          <span><dict:lang value="页面名称" /></span>
				          <div class="layui-input-inline">
				          <s:textfield id="shMap_PAGE_NAME" name="shMap.PAGE_NAME" cssClass="input_sh" maxlength="300" />
				          </div>
				        </div>
				        
					  	<div class="search_table_wrap">
				          <div class="layui-input-inline">
				            <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						    <bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" >新增</bu:funOper>
				            
				          </div>
				        </div>
		  			
		  			</td>
					</tr>
				</table>
	</form>
	
	<div class="table_div mc-table-container">
			<!-- left start -->
			<div class="mc-table-left">
				<!-- left content start -->
				<div class="mc-table-left-content">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<th style="width:210px;"><dict:lang value="编号" /></th>
			<th style=""><dict:lang value="页面名称" /></th>
			<th style="width:60px;"><dict:lang value="上级页面" /></th>
			<th style="width:60px;"><dict:lang value="页面类型" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title='<s:property value="ID"/>' ><s:property value="ID"/></td>
			<td><s:property value="PAGE_NAME"/></td>
			<td><s:property value="UP_NAME"/></td>
			<td><s:property value="COMM_PAGE_TYPE"/></td>
			
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	
	<!-- right start -->
			<div class="mc-table-right">
				<table  class="table_list">
					<thead>
						<tr>
							<th style="width:80px;"><dict:lang value="操作" />
							<!--  
							    <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
							-->
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" status="index">
						<tr>
							<td>
								<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="ID"/>')" title="<dict:lang value="修改" />" >修改
								</a>
								
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" >删除
								</a>
								
							</td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- right end -->
	
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
	
	function add(url){
		var mcIframeName = window.parent.name; //外层iframe的name
		url = "${path}sys/UserCustomAction_showAddCommPage.ms?paraMap.UP_ID=<s:property value='shMap.UP_ID' />&paraMap.treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+mcIframeName;
		showPopWin(url, 440, 270,null,"<dict:lang value="公用页面" /> <dict:lang value="新增" />");
	}
	
	function update(id){
		var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/UserCustomAction_showEditCommPage.ms?paraMap.toFlag=commpage&paraMap.ID="+id+"&paraMap.treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+mcIframeName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="公用页面" /> <dict:lang value="修改" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
		var mcIframeName = window.parent.name;
    document.forms.submitForm.action="${path}sys/UserCustomAction_delCommPage.ms?treeTid=<c:out value='${paraMap.treeTid}' />&mcIframeName="+mcIframeName;
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