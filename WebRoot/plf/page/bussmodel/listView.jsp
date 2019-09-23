<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="视图模型"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
		    <jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm"
				action="${path}sys/BussModelAction_listView.ms" method="post">
				<input type="hidden" id="paraMap_MID" name="paraMap.MID"
					value="<s:property value="paraMap.MID"/>" />
				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
				<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
		   <table class="search_table">
			<tr>
				<td >
				<div class="search_table_wrap">
				  	<span><dict:lang value="视图ID" /></span>
				  	 <div class="layui-input-inline">
				  	<s:textfield id="shMap_ID" name="paraMap.ID" cssClass="input_sh" maxlength="33" onkeyup="javascript:util.replaceLikeVal(this)" />
			  </div>
				        </div>
					
					<div class="search_table_wrap">
				         <span><dict:lang value="视图名称" /></span>
				          <div class="layui-input-inline">
				  	<s:textfield id="shMap_PAGE_NAME" name="paraMap.VIEW_NAME" cssClass="input_sh" maxlength="120" onkeyup="javascript:util.replaceLikeVal(this)" />
				  	</div>
				        </div>
				  	
				  	
				  	
			  <div class="search_table_wrap">
				          <div class="layui-input-inline">
				    <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
				    <a href="javascript:add();" class='layui-btn' title="<dict:lang value="新增" />" ><dict:lang value="新增" /></a>
				        </div>
				        </div>
			  	</td>
		    </tr>
	</table>
					
			</form>
			
     <div class="table_div mc-table-container" >
     	<!-- left start -->
			<div class="mc-table-left">
				<!-- left content start -->
				<div class="mc-table-left-content">
	   <table id="listTable" class="table_list">
           <thead>
		<tr class="tdcolor">
			<th style="width: 40px;"><dict:lang value="序号" /></th>
			<th style="width: 140px;"><dict:lang value="视图ID" /></th>
			<th style="width: 200px;"><dict:lang value="视图名称" /></th>
			<th style="width: 100px;"><dict:lang value="视图编码" /></th>
			<th style="width: 120px;"><dict:lang value="视图类型" /></th>
			<th style="width: 120px;"><dict:lang value="自定义类名" /></th>
			<th style="width: 130px;"><dict:lang value="默认分页记录数" /></th>
			<%-- <th style="width: 150px;"><dict:lang value="操作" />
				
			</th>--%>
		</tr>
		<thead>
		<tbody>
	<s:iterator value="listData" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="ID"/>"><s:property value="ID"/></td>
			<td title="<s:property value="VIEW_NAME"/>"><s:property value="VIEW_NAME"/></td>
			<td title="<s:property value="VIEW_MODEL_CODE"/>"><s:property value="VIEW_MODEL_CODE"/></td>
			<td><dict:viewDict dictCode="VIEW_TYPE" dictValue="%{VIEW_TYPE}"/></td>
			<td><s:property value="CLASS_NAME"/></td>
			
			<td><s:property value="DEF_PAGE_NUM"/></td>
			<%--
			<td>
				<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="id"/>','<s:property value="VIEW_NAME"/>')" title="<dict:lang value="修改" />" ><dict:lang value="编辑" /></a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><dict:lang value="删除" /></a>
				<a class='layui-btn layui-btn-normal layui-btn-xs'  href="javascript:void(0);" onclick="publish('<s:property value="id"/>','<s:property value="VIEW_NAME"/>');" title="<dict:lang value="发布" />" ><dict:lang value="发布" /></a> 
			</td> --%>
		</tr>
	</s:iterator>
	</tbody>
	</table>
		</div>
			<!-- left content end -->
				
			</div>
			<!-- left end -->
			<!-- right start -->
			<div class="mc-table-right">
				<table  class="table_list">
					<thead>
						<tr>
							<th style="width: 150px;"><dict:lang value="操作" />
								<!--  
								<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
								-->
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="listData" status="index">
						<tr>
							<td>
								<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="id"/>','<s:property value="VIEW_NAME"/>')" title="<dict:lang value="修改" />" ><dict:lang value="编辑" /></a>
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><dict:lang value="删除" /></a>
								<a class='layui-btn layui-btn-normal layui-btn-xs'  href="javascript:void(0);" onclick="publish('<s:property value="id"/>','<s:property value="VIEW_NAME"/>');" title="<dict:lang value="发布" />" ><dict:lang value="发布" /></a> 
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- right end -->
	</div>
</div>
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
	  if(!val.valDataBaseSetData()){
			
			return ;
		}
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		//util.alert(msg);
		document.forms.searchForm.submit();
		//util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}

	function add(){
		var url = "${path}sys/BussModelAction_forAddView.ms?paraMap.MID=<s:property value="paraMap.MID"/>&mcIframeName="+window.parent.name;
		showPopWin(url, 900, 600,null,"<dict:lang value="新增"/>");
	}
	
	function publish(id,viewName){
		var url = encodeURI("${path}sys/FuncAction_showAddPublishFunc.ms?funcDto.viewId="+id+"&funcDto.name="+viewName+"&mcIframeName="+window.parent.name);
      	showPopWin(url, 900, 600,null,"<dict:lang value="发布" />");
	}	
	
	function update(id,viewName){
		var url = encodeURI("${path}sys/BussModelAction_showViewTab.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ID="+id);
		window.open(url);
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/BussModelAction_delView.ms?mcIframeName="+window.parent.name;
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}
	
	 layui.use('layer',function(){
		layer = layui.layer;
	 });
	 //setTableStyle("listTable");

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>