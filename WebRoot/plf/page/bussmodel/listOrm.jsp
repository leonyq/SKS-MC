<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="持久模型列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="search_form" name="searchForm"
				action="${path}sys/BussModelAction_listOrm.ms" method="post">
				<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>" />
				
				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
				
				
				<!--  
				<div class="search_div">
					<div
						style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
						class="search_text">
						<dict:lang value="持久模型名称" />
					</div>
					<div class="search_value">
						<s:textfield id="shMap_ID" name="paraMap.ORM_NAME" cssClass="input_sh"
							maxlength="120" cssStyle="width:132px;" onkeyup="javascript:util.replaceLikeVal(this)" />
					</div>
				</div>
				<div class="search_div">
					<div
						style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
						class="search_text">
						<dict:lang value="持久模型表名" />
					</div>
					<div class="search_value">
						<s:textfield id="shMap_PAGE_NAME" name="paraMap.TABLE_NAME"
							cssClass="input_sh" maxlength="64" cssStyle="width:132px;" onkeyup="javascript:util.replaceLikeVal(this)" />
					</div>
				</div>
				<input type="button" value="<dict:lang value="查询" />"
					onclick="query(this)" class="botton_img_add" />
			    -->
			    
			    <table class="search_table">
					<tr>
						<td>

					  	<div class="search_table_wrap">
				         <span><dict:lang value="持久模型名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="shMap_ID" name="paraMap.ORM_NAME" 
							maxlength="120"  cssClass="input_sh" onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="持久模型表名" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="shMap_PAGE_NAME" name="paraMap.TABLE_NAME"
							 maxlength="64"  cssClass="input_sh" onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				            <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     
						     <bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="javascript:add();" >新增</bu:funOper>
						     
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
			<th width="40px"><dict:lang value="序号" /></th>
			<th width="300px"><dict:lang value="持久模型名称" /></th>
			<th width="261px"><dict:lang value="持久模型表名" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="ORM_NAME"/>"><s:property value="ORM_NAME"/></td>
			<td title="<s:property value="ORM_NAME"/>"><s:property value="TABLE_NAME"/></td>
			
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
							<th width="150px"><dict:lang value="操作" />
								<!-- 
								<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
								 -->
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" status="index">
						<tr>
							<td>
								<!--  
								<a href="javascript:view('<s:property value="id"/>')" title="<dict:lang value='查看' />" ><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
								||<a href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
								||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
								-->
								
								<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:view('<s:property value="id"/>')" title="<dict:lang value="查看" />" >查看
								</a>
								
								<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="id"/>')" title="<dict:lang value="修改" />" >修改
								</a>
								
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" >删除
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
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
	--%>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

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
	if(!val.valDataBaseSetData()){
			
			return ;
		}
		//_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		 top.util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(){
		var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_addOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&mcIframeName="+mcIframeName;
		showPopWin(url, 950, 610,null,"持久模型 新增");
	}
	
	function view(id){
		var url = "${path}sys/BussModelAction_viewOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ORMID="+id;
		showPopWin(url, 950, 510,null,"持久模型 查看");
	}
	
	function update(id){
		var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_forEditOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>&paraMap.ORMID="+id+"&mcIframeName="+mcIframeName;
		showPopWin(url, 990, 610,null,"持久模型 修改");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
		var mcIframeName = window.parent.name; //外层iframe的name
		var curIframeName= window.parent.name;
   	 	document.forms.submitForm.action="${path}sys/BussModelAction_delOrm.ms?mcIframeName="+mcIframeName+"&curIframeName="+curIframeName;
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