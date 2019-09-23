<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="统一图片管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<!--  
	<div align="center" style='color:red;margin-bottom:10px;margin-top:10px;'>
		<s:if test="ajaxMap.NODE_NAME != null && ajaxMap.NODE_NAME != \"\" ">
			<s:property value="ajaxMap.NODE_NAME"/>---图列表
		</s:if>			
	</div>
	-->
	<form id="searchForm" name="searchForm" action="${path}picmg/picmgAction_picmglist.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="NODE_ID" name="paramMap.NODE_ID" value='<s:property value="paramMap.NODE_ID"/>'/>
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<span><dict:lang value="文件名称" /></span>
								<div class="layui-input-inline">
				  					<s:textfield id="PIC_FILES_NAME" name="paramMap.PIC_FILES_NAME" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
								<input type="button" value="<dict:lang value="新增" />" onclick="add_tree()"  class="layui-btn" />
								<input type="button" value="<dict:lang value="修改" />" onclick="edit_tree()"  class="layui-btn" />
								<input type="button" value="<dict:lang value="删除" />" onclick="del_tree()"  class="layui-btn" />
							</div>
						</td>
						<%--
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="文件名称" /></div>
								<div class ="search_value">
								<s:textfield id="PIC_FILES_NAME" name="paramMap.PIC_FILES_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							
							<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
							
							<div style='float:right;margin-top:5px;'>
								<input type="button" value="<dict:lang value="新增" />" onclick="add_tree()"  class="botton_img_add" />
								<input type="button" value="<dict:lang value="修改" />" onclick="edit_tree()"  class="botton_img_add" />
								<input type="button" value="<dict:lang value="删除" />" onclick="del_tree()"  class="botton_img_add" />
								
							</div>
							
							</div>
						</td> --%>
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
					
					<th width="100px;"><dict:lang value="上传路径" /></th>
					
					<th width="200px"><dict:lang value="文件名称" /></th>
					<th width="90px;"><dict:lang value="文件大小(KB)" /></th>
					<th width="150px;"><dict:lang value="上传时间" /></th>
				</tr>
				</thead>
				<tbody>
			<s:iterator value="page.dataList" status="index">
				<tr>
					<td><s:property value="#index.count"/></td>
					
					<td title="<s:property value="ajaxMap.PIC_PATH"/>"><s:property value="ajaxMap.PIC_PATH"/></td>
					
					<td title="<s:property value="PIC_FILES_NAME"/>"><s:property value="PIC_FILES_NAME"/></td>
					<td title="<fmt:formatNumber  value="${PIC_FILES_SIZE/1024 + 0.0001}"  pattern="#,###,###,###"/>"><fmt:formatNumber  value="${PIC_FILES_SIZE/1024 + 0.0001}"  pattern="#,###,###,###"/></td>
					<td title="<s:property value="CREATE_TIME"/>"><s:property value="CREATE_TIME"/></td>
					
				</tr>
			</s:iterator>
			</tbody>
			</table>
		</div>
	</div>
	<!-- left end -->
	<!-- right start -->
	<div class="mc-table-right">
		<table class="table_list" >
			<thead>
				<tr class="tdcolor">
					<th width="100px;"><dict:lang value="操作" />
					    <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
					</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="page.dataList" status="index">
					<tr>
						<td>
							<a href="javascript:update('<s:property value="ID"/>')" class="layui-btn layui-btn-xs"><dict:lang value="修改" /></a>
							<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" class="layui-btn layui-btn-danger layui-btn-xs"><dict:lang value="删除" /></a>
						</td>
					</tr>
				</s:iterator>
				</tbody>
		</table>
	</div>
	<!-- right end -->
	</div>
	</div>
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div> --%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paramMap.del_id" />
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
		//util.alert(msg);
		alterWindows(msg,5);
	}
	
	function reloadPg(msg){
		//util.alert(msg,reloadPgExe);
		alterWindows(msg,5);
	}
	function reloadTreeMsg(type,json){
	if(type=="404")return;
	type = type=="10"?"1":type;
	type = type=="11"?"2":type;
	var obj = JSON.parse(json);
	//添加父节点
	window.parent.leftFrame.actionIs(type,obj);
	}
		
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		var node_id="<s:property value='paramMap.NODE_ID' />";
		if(node_id==null || node_id==''){
			util.alert("请先选择左边树节点");
			return false;
		}
		
		url = "${path}picmg/picmgAction_showaddpicmg.ms?paramMap.NODE_ID=<s:property value='paramMap.NODE_ID' />"+"&mcIframeName="+window.parent.name;
		showPopWin(url, 500, 500,null,"<dict:lang value="上传图片" />");
	}
	
	function update(id){
		var node_id="<s:property value='paramMap.NODE_ID' />";
		if(node_id==null || node_id==''){
			util.alert("请先选择左边树节点");
			return false;
		}
		
		url = "${path}picmg/picmgAction_showeditpicmg.ms?paramMap.NODE_ID=<s:property value='paramMap.NODE_ID' />&paramMap.ID="+id+"&mcIframeName="+window.parent.name;
		showPopWin(url, 500, 500,null,"<dict:lang value="上传图片" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
		var mcIframeName = parent.name;
		document.forms.submitForm.action="${path}picmg/picmgAction_delpicmg.ms?mcIframeName="+mcIframeName;
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	$(function(){
		$("#listTable").removeAttr("style");
	});
	/*function init(){
		
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}*/
			
	function get_selectednode(){
		var selectednode=null;
		
		var treeObj = parent.leftFrame.$.fn.zTree.getZTreeObj("index_tree");
		
		//var treeObj = $.fn.zTree.getZTreeObj("index_tree");
		var node = treeObj.getSelectedNodes();
		if(node!=null){
			selectednode=node[0];
		}
		
		return selectednode;
		
	}
	
	function add_tree(){
		var selectednode=get_selectednode();
		if(selectednode==null){
			util.alert("请先选中要新增的树节点");
  				return false;
		}
		var url='${path}picmg/picmgAction_showaddtreenode.ms?paramMap.UP_ID='+selectednode.id+"&mcIframeName="+window.parent.name;
  			showPopWin(url, 550, 390,null,"<dict:lang value="统一图片管理"/> <dict:lang value="新增"/>");
		
	}
	
	function edit_tree(){
		var selectednode=get_selectednode();
		if(selectednode==null){
			util.alert("请先选中要修改的树节点");
  				return false;
		}
		
		if(selectednode.id=='0'){
			util.alert("根节点不能修改");
  				return false;
		}
		
		var url='${path}picmg/picmgAction_showedittreenode.ms?paramMap.ID='+selectednode.id+"&mcIframeName="+window.parent.name;
  			showPopWin(url, 550, 390,null,"<dict:lang value="统一图片管理"/> <dict:lang value="修改"/>");
		
	}
	
	function del_tree(){
		var selectednode=get_selectednode();
		if(selectednode==null){
			util.alert("请先选中要删除的树节点");
  				return false;
		}
		
		if(selectednode.id=='0'){
			util.alert("根节点不能删除");
  				return false;
		}
		util.confirm(function(){
			$.ajax({
		           url:'${path}picmg/picmgAction_deletetreenode.ms',
		           type:'GET',
		           dataType:'json',
		           data: {
		           	"paramMap.ID":selectednode.id
		           },
		           success:function (res) {
		               if(res.ajaxMap.result=='0'){
		               		util.alert("删除成功");
		               		
		               		parent.leftFrame.reload_ztree();
			
		               }else if(res.ajaxMap.result=='2'){
		               
		               		util.alert("删除失败,请先删除下级节点");
		               		
		               }else if(res.ajaxMap.result=='3'){
		               
		               		util.alert("删除失败,该节点下已经配置图片");
		               		
		               }else{
		               
		               		util.alert("删除失败");
		               }
		               
		           }
		     });
		},"<dict:lang value="确定要删除选中的数据" />");
		
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>