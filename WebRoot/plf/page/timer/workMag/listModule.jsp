<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="任务管理" /></title>
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
	<form id="searchForm" name="searchForm" action="${path}sys/workMagAction_listModuleDate.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<span><dict:lang value="任务名称" /></span>
								<div class="layui-input-inline">
									<s:textfield id="MODEL_NAME" name="paraMap.MODEL_NAME" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
								<input type="button" value="<dict:lang value="新增" />" onclick="add();"  class="layui-btn" />
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
						</td>--%>
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
	<%--?????? 
	<form id="searchFormDel" name="searchFormDel" action="${path}sys/workMagAction_listModule.ms" method="post">
		<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	</form>--%>
	
	<div class="table_div mc-table-container">
		<!-- left start -->
		<div class="mc-table-left" style="padding-right: 170px;">
			<!-- left content start -->
			<div class="mc-table-left-content">
			    <table id="listTable" style="table-layout: fixed;"   class="table_list">
					<thead>
						<tr class="tdcolor">
							<th width="40px"><dict:lang value="序号" /></th>
							<th width="200px"><dict:lang value="编号" /></th>
							<th width="230px"><dict:lang value="任务名称" /></th>
							<th width="300px"><dict:lang value="任务说明" /></th>
							<th width="95px"><dict:lang value="接口类型" /></th>
				
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" id="configPage" status="index">
							<tr id="<s:property value="ID"/>">
								<td><s:property value="#index.count"/></td>
								<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<s:property value="ID"/>'><s:property value="ID"/></td>
								<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<s:property value="MODEL_NAME"/>'><s:property value="MODEL_NAME"/></td>
								<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<s:property value="MODEL_MEMO"/>'><s:property value="MODEL_MEMO"/></td>
								<td><dict:viewDict dictCode="MC_WORK_TYPE" dictValue="%{#configPage.FLAG}" /></td>
					
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- right start -->
		<div class="mc-table-right" style="width: 170px;">
			<table  class="table_list">
				<thead>
					<tr>
						<th width="170px"><dict:lang value="操作" />
							<!-- 
							<a href="javascript:add();" title="<dict:lang value="新增" />" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></a>
							 -->
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="page.dataList" id="configPage" status="index">
					<tr id="<s:property value="ID"/>">
						<td class="layui-btn-left">
							<%-- <s:if test="FLAG==3">
							<a href="javascript:send('<s:property value="WORKID"/>')" class="layui-btn layui-btn-normal layui-btn-xs"><dict:lang value="发送" /></a>
							</s:if> --%>
							<a href="javascript:void(0);" onclick="modify('<s:property value="ID"/>','<s:property value="FLAG"/>')" class="layui-btn layui-btn-xs"  >
									<dict:lang value="修改" />
							</a>
							<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>')" class="layui-btn layui-btn-danger layui-btn-xs" >
								<dict:lang value="删除" />
							</a>
							<s:if test="FLAG==1">
							<a href="javascript:view('<s:property value="WORKID"/>')" class="layui-btn layui-btn-normal layui-btn-xs" ><dict:lang value="查看" /></a>
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
	<%---?????? 
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	--%>
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>--%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>
<script type="text/javascript">

	function modify(id,FLAG){
	var UP_ID=$("#up_id").val();
	var url = "${path}sys/workMagAction_toModify.ms?paraMap.id="+id+"&paraMap.FLAG="+FLAG+"&mcIframeName="+window.parent.name;
	showPopWin(url, 900, 550,null,"<dict:lang value="任务管理" /> <dict:lang value="修改" />");
	}
	function modifyTree(modifyId,MODEL_NAME){
		//query(document.getElementById("searchButtonId"));
		var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
		var node = treeObj.getNodeByParam("id", modifyId, null);
		node.name = MODEL_NAME;
		treeObj.updateNode(node);
	}
	function addTree(addId,MODEL_NAME){
		var up_id=$("#up_id").val();
		//query(document.getElementById("searchButtonId"));
		var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
		var par_node = treeObj.getNodeByParam("id", up_id, null);
		
		var newNode = {id:addId,name:MODEL_NAME,icon:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png"};
		var newNode = treeObj.addNodes(par_node, newNode);
		
	}
	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	function send(id){
		var url = "${path}sys/workMagAction_sendEmail.ms?paraMap.id="+id;
		showPopWin(url, 900, 500,null,"<dict:lang value="任务管理" /> <dict:lang value="发送" />");
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchFormDel.submit();
		util.showTopLoading();
	}
	
	function add(){
		var url = "${path}sys/workMagAction_addModulePage.ms?paraMap.UP_ID="+$("#up_id").val()+"&mcIframeName="+window.parent.name;
		showPopWin(url, 900, 500,null,"<dict:lang value="任务管理" /> <dict:lang value="新增" />");
	}
	//删除
	var delId = "";
	function del(id){
		util.confirm(checkDel);
		delId = id;
	}
	function checkDel(){
      	 $.ajax({
   			type: "POST",
   		    dataType: "json",
   		    url: "${path}sys/workMagAction_checkDel.ms",
   		    data: "paraMap.id="+delId,
   			success: function(data){
        				if(data.ajaxMap != null && data.ajaxMap != ""){
   							if(data.ajaxMap.msg == "1"){
   								delConfirm();
   							}else{
   								top.util.alert("<dict:lang value="操作失败" />:"+data.ajaxMap.msg);
   							}
        				}
   				},
   			error: function(msg){
   					util.closeLoading();
   					top.util.alert("error:"+msg);
   			  }
   			});		
	}
	
	function delConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/workMagAction_delModule.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								top.util.alert("<dict:lang value="操作成功！" />");
    								var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
									var node = treeObj.getNodeByParam("id", delId, null);
									treeObj.removeNode(node);
    								query(document.getElementById("searchButtonId"));
    							}else{
    								top.util.alert("<dict:lang value="操作失败" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					top.util.alert("error:"+msg);
    			  }
    			});		
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	/*function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}*/
	function view(id){
		 $.ajax({
 			type: "POST",
 		    dataType: "json",
 		    url: "${path}sys/workMagAction_findClass.ms",
 		    data: "paraMap.id="+id,
 			success: function(data){
      				if(data.ajaxMap != null && data.ajaxMap != ""){
 							if(data.ajaxMap.status == "true"){
 								var id=data.ajaxMap.msg;
 								var url = "${path}sys/JClzAction_showView.ms?paraMap.CODE_ID="+id;
 								showPopWin(url, "99%", "99%",null,"<dict:lang value="任务管理" /> <dict:lang value="查看" />");
 							}else{
 								util.alert(data.ajaxMap.msg);
 							}
      				}
 				},
 			error: function(msg){
 					util.closeLoading();
 					util.alert("error:"+msg);
 			  }
 			});		
		
	}
	function query(thisObj){//queryDate
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>