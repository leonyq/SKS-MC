<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="对外接口" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="zTree" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}exInterface/externalInterfaceAction_listModule.ms" method="post"><%-- listModuleDate--%>
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td >
							<div class="search_table_wrap">
							  	<span><dict:lang value="模块名称" /></span>
							  	<div class="layui-input-inline">
							  		<s:textfield id="MODEL_NAME" name="paraMap.MODEL_NAME" cssClass="input_sh" maxlength="300" />
					  			</div>
					  		</div>
					  		<div class="search_table_wrap">
							    <input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this);" class="layui-btn"> 
							    <input type="button" value="<dict:lang value="新增" />" onclick="add();" class="layui-btn">
					  		</div>
					  	</td>
					  	<%--
						<td width="100%">
							 <div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="MODEL_NAME" name="paraMap.MODEL_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this)"  class="botton_img_add" />
						</td> --%>
					</tr>
				</table>
			<input type="hidden" id="typeFlag" name="paraMap.typeFlag" value="<s:property value="ajaxMap.typeFlag"/>">
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
	<form id="searchFormDel" name="searchFormDel" action="${path}exInterface/externalInterfaceAction_listModule.ms" method="post">
		<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
		<input type="hidden" id="typeFlag" name="paraMap.typeFlag" value="<s:property value="ajaxMap.typeFlag"/>">
	</form>
	<div class="table_div mc-table-container" style="margin: 0; overflow-x:hidden;">
	<!-- left start -->
	<div class="mc-table-left" style="padding-right: 260px;">
	<!-- left content start -->
	<div class="mc-table-left-content">

    <table id="listTable" style="table-layout: fixed;" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="40px"><dict:lang value="序号" /></th>
			<th width="130px"><dict:lang value="编号" /></th>
			<th width="110px"><dict:lang value="模块名称" /></th>
			<th width="110px"><dict:lang value="状态" /></th>
			<th width="80px"><dict:lang value="接口类型" /></th>
			<th width="80px"><dict:lang value="协议" /></th>
			<th width="130px"><dict:lang value="模块说明" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr id="<s:property value="ID"/>">
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<s:property value="ID"/>'><s:property value="ID"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<s:property value="MODEL_NAME"/>'><s:property value="MODEL_NAME"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" >
			<s:if test="#configPage.FLAG == 0 "><!-- 服务器 -->
				<s:if test="#configPage.SERVICE_STATUS == 0 "><!-- http -->
					<dict:lang value="启动" />
				</s:if>
				<s:if test="#configPage.SERVICE_STATUS == 1 "><!-- http -->
					<dict:lang value="关闭" />
				</s:if>
				<s:if test="#configPage.SERVICE_STATUS == 2 "><!-- http -->
					<dict:lang value="发布失败" />
				</s:if>
				<s:if test="#configPage.SERVICE_STATUS == 3 "><!-- http -->
					<dict:lang value="启动未同步" />
				</s:if>
			</s:if> 
			
			<s:if test="#configPage.FLAG == 2 "><!-- http -->
				<s:if test="#configPage.PORT_STATUS == 0 "><!-- http -->
					<dict:lang value="启动" />
				</s:if>
				<s:else>
					<dict:lang value="关闭" />
				</s:else>
			</s:if> 
			</td>
			
			<td title="<dict:viewDict dictCode="MC_EXTERNAL_INTERFACE" dictValue="%{#configPage.FLAG}" />"><dict:viewDict dictCode="MC_EXTERNAL_INTERFACE" dictValue="%{#configPage.FLAG}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" ><s:property value="ajaxMap.SSL"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title="<s:property value='MODEL_MEMO'/>" ><s:property value="MODEL_MEMO"/></td>
			
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	<!-- left content end -->
	</div>
	<!-- left end -->
	<!-- right start -->
			<div class="mc-table-right" style="width: 260px;">
				<table  class="table_list">
					<thead>
						<tr>
							<th><dict:lang value="操作" />
								<%--<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>--%>
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" id="configPage" status="index">
						<tr >
							<td class="layui-btn-left">
							
								<s:if test="#configPage.type == 1">
								<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="modify('%{id}');" cssClass="layui-btn layui-btn-xs" title="修改接口">
									<dict:lang value="修改接口" />
								</bu:funOper>
									<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="modifyModuelInterface('%{id}');" cssClass="layui-btn layui-btn-xs" title="修改模块">
									<dict:lang value="修改模块" />
									</bu:funOper>
								</s:if>
								<s:else>
									<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="modifyModuel('%{id}');" cssClass="layui-btn layui-btn-xs" title="修改模块">
									<dict:lang value="修改模块" /><%--funcNo="F626" --%>
									</bu:funOper> 
								</s:else>
								<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="del('%{id}');" cssClass="layui-btn layui-btn-danger layui-btn-xs" title="删除">
									<dict:lang value="删除" /><%--funcNo="F627" --%>
								</bu:funOper>
								<s:if test="#configPage.type == 1 && #configPage.FLAG == 1">
								<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" cssClass="layui-btn layui-btn-normal layui-btn-xs" onclick="detail('%{id}');" title="详细">
									<dict:lang value="详情" />
								</bu:funOper> 
								</s:if> 
								
								<s:if test="#configPage.type == 1 && #configPage.FLAG == 2">
								<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" cssClass="layui-btn layui-btn-normal layui-btn-xs" onclick="view('%{id}');" title="详细">
									<dict:lang value="详情" />
								</bu:funOper> 
								</s:if> 
								
								
								<s:if test="#configPage.type == 1  && #configPage.FLAG == 0">
								<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" cssClass="layui-btn layui-btn-normal layui-btn-xs" onclick="detail('%{id}');" title="详细">
									<dict:lang value="发布" />
								</bu:funOper> 
								</s:if> 
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- right end -->
	</div>
	</div>
	<input type="hidden" id="typeFlag" name="paraMap.typeFlag" value="<s:property value="ajaxMap.typeFlag"/>">
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>--%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>
<script type="text/javascript">
	function view(id) {
		
		var url = "${path}httpService/httpMgrAction_toViewDetail.ms?paraMap.id="+id+"&paraMap.mcIframeName="+window.parent.name;
		showPopWin(url, 900, 500,null,"<dict:lang value="服务详情" /> <dict:lang value="查看" />");
	}

	function modifyTree(modifyId,MODEL_NAME){
		//parent.treeFrame.tree.setItemText(modifyId,MODEL_NAME,MODEL_NAME);
		//query(document.getElementById("searchButtonId"));
		
		var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
		var node = treeObj.getNodeByParam("id", modifyId, null);
		node.name = MODEL_NAME;
		treeObj.updateNode(node);
	}
	function addTree(addId,MODEL_NAME,UP_ID){
		//query(document.getElementById("searchButtonId"));
		//parent.treeFrame.tree.insertNewItem($("#up_id").val(),addId,MODEL_NAME);
		
		var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
		var par_node = treeObj.getNodeByParam("id", UP_ID, null);
		
		var newNode = {id:addId,name:MODEL_NAME,icon:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png"};
		var newNode = treeObj.addNodes(par_node, newNode);
		
	}
	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchFormDel.submit();
		util.showTopLoading();
	}
	
	function add(){
		
		var url = "${path}exInterface/externalInterfaceAction_addModulePage.ms?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
		showPopWin(url, 500, 350,null,"<dict:lang value="对外接口" /> <dict:lang value="新增" />");
	}
	function detail(id){
		var url = "${path}exInterface/externalInterfaceAction_toDetailListPage.ms?paraMap.id="+id+"&paraMap.mcIframeName="+window.parent.name;
		showPopWin(url, 500, 500,null,"<dict:lang value="对外接口" /> <dict:lang value="详情" />");
	}
	function modify(id){
		var UP_ID=$("#up_id").val();
		var typeFlag=$("#typeFlag").val();
		//var url = "${path}exInterface/externalInterfaceAction_addModulePage.ms?paraMap.id="+id+"&paraMap.UP_ID="+UP_ID+"&paraMap.typeFlag="+typeFlag;
		var url = "${path}exInterface/externalInterfaceAction_toPageDetail.ms?paraMap.id="+id+"&mcIframeName="+window.parent.name;
		
		showPopWin(url, 900, 500,null,"<dict:lang value="对外接口" /> <dict:lang value="修改接口" />");
		}
	function modifyModuel(id){
		var url = "${path}exInterface/externalInterfaceAction_toEditModuel.ms?paraMap.id="+id;
		showPopWin(url, 450, 300,null,"<dict:lang value="对外接口" /> <dict:lang value="修改模块" />");
		
	}
	function modifyModuelInterface(id){
		var url = "${path}exInterface/externalInterfaceAction_toEditModuelInterface.ms?paraMap.id="+id+"&mcIframeName="+window.parent.name;
		showPopWin(url, 450, 300,null,"<dict:lang value="对外接口" /> <dict:lang value="修改模块" />");
		
	}
	//删除
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	function delConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}exInterface/externalInterfaceAction_delModule.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="操作成功！" />");
    								//parent.treeFrame.tree.deleteItem(delId,true);
    								
    								var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
									var node = treeObj.getNodeByParam("id", delId, null);
									
									treeObj.removeNode(node);
									
    								query(document.getElementById("searchButtonId"));
    							}else{
    								top.util.alert("<dict:lang value="操作失败：" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	
	function init(){
	var obj =$("a");
	obj .removeAttr("title");
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		//document.forms.searchFormDel.submit();
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function queryDate(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function errorPageMethod(){
		util.alert("<dict:lang value="还未配置数据，不能查看详细信息" />");
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>