<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="自定义报表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}rep/listReport.ms" method="post">
			<s:hidden name="paraMap.MID" />
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<span><dict:lang value="报表名称" /></span>
								<div class="layui-input-inline">
				  					<s:textfield id="paraMap_NAME" name="paraMap.NAME" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn">
								<input type="button" value="<dict:lang value="新增" />" onclick="add('@{funcUrl}','%{id}');" class="layui-btn">
							</div>
						</td>
						<%--
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" >报表名称</div>
								<div class ="search_value">
								<s:textfield id="paraMap_NAME" name="paraMap.NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="查询" onclick="query(this)"  class="botton_img_search" />
						</td>
						 --%>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="40px;"><dict:lang value="序号" /></th>
			<th width="120px;"><dict:lang value="报表名称" /></th>
			<th width="150px;"><dict:lang value="报表全路径" /></th>
			<th width="90px;"><dict:lang value="数据源类型" /></th>
			<th width="80px;"><dict:lang value="报表类型" /></th>
		 
			<th width="390px;"><dict:lang value="操作" />
			    <%--<bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
				--%>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="NAME"/>"><s:property value="NAME"/></td>
			<td title="<s:property value="PATH"/><s:property value="FNAME"/>"><s:property value="PATH"/><s:property value="FNAME"/></td>
			<td><dict:viewDict dictCode="REPORT_DS" dictValue="%{DS}" /></td>
			<td><dict:viewDict dictCode="REPORT_TYPE" dictValue="%{TYPE}" /></td>
		 
			<td>
				<a href="javascript:update('<s:property value="ID"/>')" class="layui-btn layui-btn-xs" ><dict:lang value="修改" /></a>
				<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" class="layui-btn layui-btn-danger layui-btn-xs" ><dict:lang value="删除" /></a>
				<a href="javascript:void(0);" onclick="view('<s:property value="ID"/>');" class="layui-btn layui-btn-normal layui-btn-xs" ><dict:lang value="预览报表" /></a>
				<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs"
				onclick="publish('<s:property value="id"/>','<s:property value="NAME"/>','<s:property value="REPTYPE"/>','<s:property value="WISBIREPTYPE"/>','<s:property value="FNAME"/>');" ><dict:lang value="发布报表" /></a>
				<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="print('<s:property value="ID"/>');" ><dict:lang value="报表打印" /></a>
				<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="downLoad('<s:property value="ID"/>');" ><dict:lang value="模板下载" /></a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<%--<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form" />
	</div>
	
	--%><div id="currentPageDiv" class="table_div"></div>
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
	$(function(){
		$("#listTable").removeAttr("style");
	});
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
		url = "${path}rep/showAddReport.ms?paraMap.MID=<s:property value='paraMap.MID' />"+"&mcIframeName="+window.parent.name;
		showPopWin(url, 830, 340,null,"<dict:lang value="报表模型" /> <dict:lang value="新增" />");
	}
	
	function update(id){
		var url = "${path}rep/showEditReport.ms?paraMap.MID=<s:property value='paraMap.MID' />&paraMap.ID="+id+"&mcIframeName="+window.parent.name;
		showPopWin(url, 830, 340,null,"<dict:lang value="报表模型" /> <dict:lang value="修改" />");
	}
	
	 function publish(id,viewName,repType,wisBiType,repFiles){
	      //repType==2是 ireport
	       var url = encodeURI("${path}sys/FuncAction_showAddPublishFunc.ms?funcDto.viewId="+id+"&funcDto.name="+viewName+"&paraMap.url=repShow/showReport.ms?paraMap.ID="+id);
       	   var repUrl="sys/report/FrepAction_showReport.ms?ReportPathPram=reportlet="+repFiles+"&title="+viewName+"&paraMap.ID="+id;
       	  
       	  if(repType=="1")
	       	   switch(wisBiType) {
				case "0":		
				  url = encodeURI("${path}sys/FuncAction_showAddPublishFunc.ms?funcDto.viewId="+id+"&funcDto.name="+viewName
				  +"&paraMap.url="+repUrl+"&mcIframeName="+window.parent.name);
				   break;
				case "1":		 
	       	     repUrl="sys/report/FrepAction_showLReport.ms?ReportPathPram=formlet="+repFiles+"&title="+viewName+"&paraMap.ID="+id;
	       	     url = encodeURI("${path}sys/FuncAction_showAddPublishFunc.ms?funcDto.viewId="+id+"&funcDto.name="+viewName
				  +"&paraMap.url="+repUrl+"&mcIframeName="+window.parent.name);  
	       	      break;			 
				}//switch(wisBiType) {
		 
		showPopWin(url, 830, 500,null,"<dict:lang value="发布报表" />");
	 }//function publish(id,viewName,repType){
	  //原先
    function publishOriginal(id,viewName){
        var url = encodeURI("${path}sys/FuncAction_showAddPublishFunc.ms?funcDto.viewId="+id+"&funcDto.name="+viewName+"&paraMap.url=repShow/showReport.ms?paraMap.ID="+id);
       showPopWin(url, 700, 350,null,"<dict:lang value="发布报表" />");
    }// function publishOriginal(id,viewName){
	
	function view(id){
		var url = "${path}rep/viewReport.ms?paraMap.ID="+id;
		window.open(url);
	}
	
	function print(id){
		var url = "${path}rep/printPdf.ms?paraMap.ID="+id;
		window.open(url);
	}
	
	function downLoad(id){
		var url = "${path}rep/downLoadRepM.ms?paraMap.ID="+id;
		window.open(url);
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}rep/delReport.ms";
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