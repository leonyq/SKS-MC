<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="任务管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/cusControlAction_queryList.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<dict:lang value="控件名称" />
							<s:textfield id="uiName" name="cusControlDtosh.uiName" cssClass="input_sh" maxlength="300" />
						</td>
						<td>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
							<input type="button" value="<dict:lang value="新增" />" onclick="add()"  class="layui-btn" />
						</td>
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
	<div class="table_div">
    <table id="listTable" style="table-layout: fixed;"  width="1000px" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="40px"><dict:lang value="序号" /></th>
			<th width="150px"><dict:lang value="名称" /></th>
			<th ><dict:lang value="实现类" /></th>
			<th width="60px"><dict:lang value="种类" /></th>
			<th width="60px"><dict:lang value="显示顺序" /></th>
			<th width="180px"><dict:lang value="资源压缩zip文件名" /></th>
			<th width="80px"><dict:lang value="操作" />
				<%-- <bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
				--%>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr id="<s:property value="ID"/>">
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="uiName"/>><s:property value="uiName"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="uiClass"/>><s:property value="uiClass"/></td>
			<td><dict:viewDict dictCode="MC_CON_TYPE" dictValue="%{#configPage.uiType}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="showOrder"/>><s:property value="showOrder"/></td>
			
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="reszipfilename"/>>
			<a href="javascript:void()" onclick="seefile('<s:property value='id'/>')">
			<s:property value="reszipfilename"/>
			</a>
			</td>
			
			<td>
				<s:if test="FLAG==1">
				<a href="javascript:view('<s:property value="id"/>')" title="<dict:lang value="查看" />"><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>||
				</s:if>
				<s:if test="FLAG==3">
				<a href="javascript:send('<s:property value="id"/>')" title="<dict:lang value="发送" />"><img src="${IMG_PATH}/ContImg25.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG25_GIF %>" /></a>||
				</s:if>
				<a href="javascript:void(0);" onclick="modify('<s:property value="id"/>')" title="" class="layui-btn layui-btn-xs" >
						<dict:lang value="修改" />
				</a>
				<a href="javascript:void(0);" onclick="del('<s:property value="id"/>')" title=""  class="layui-btn layui-btn-danger layui-btn-xs">
					<dict:lang value="删除" />
				</a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>--%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>
<script type="text/javascript">

	function modify(id){
	var url = "${path}sys/cusControlAction_toModify.ms?paraMap.id="+id+"&mcIframeName="+window.name;
	showPopWin(url, 600, 400,null,"<dict:lang value="注册控件修改" />");
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
	
	function add(){
		var url = "${path}sys/cusControlAction_toAdd.ms"+"?mcIframeName="+window.name;
		showPopWin(url, 700, 400,null,"<dict:lang value="新增注册控件" />");
	}
	
	//删除
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	function delConfirm() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/cusControlAction_delCus.ms",
			data : {"paraMap.id":delId},
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
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
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
 								showPopWin(url, "95%", "100%",null,"<dict:lang value="自定义类查看" />");
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
	function queryDate(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function seefile(id){
		var url = "${path}sys/cusControlAction_toseefile.ms?paraMap.id="+id
		showPopWin(url, 420, 250,null,"<dict:lang value="查看资源文件" />");
	
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>