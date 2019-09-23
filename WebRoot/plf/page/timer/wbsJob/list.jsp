<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		  table#listTable tr td:nth-child(2){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 	
		 }
		  table#listTable tr td:nth-child(3){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 }
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/websJobMagAction_queryWebsList.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="事务名称" /></div>
								<div class ="search_value">
								<s:textfield id="wbsSh.jobName" name="wbsSh.jobName" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="详细描述" /></div>
								<div class ="search_value">
								<s:textfield id="wbsSh.jobDec" name="wbsSh.jobDec" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" style="width:100%;table-layout: fixed">
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="8%"><dict:lang value="事务名称" /></th>
			<th width="10%"><dict:lang value="详细描述" /></th>
			<th width="23%"><dict:lang value="请求接口" /></th>
			<th width="23%"><dict:lang value="访问方法" /></th>
			<th width="5%"><dict:lang value="操作" />
				<a href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF%>" /></a>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="wbsList" id="websJob" status="index">
		<tr id="<s:property value="#websJob.id"/>">
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="#websJob.jobName"/>"><s:property value="#websJob.jobName"/></td>
			<td title="<s:property value="#websJob.jobDec"/>">
				<s:property value="#websJob.jobDec"/></span>
			</td>
			<td >
				<s:property value="#websJob.wscName"/></span>
			</td>
			<td >
				<s:property value="#websJob.func"/></span>
			</td>
			<td>
				<a href="javascript:void(0);" onclick="edit('<s:property value="id"/>');" title="<dict:lang value="修改" />" prefix="&nbsp;" >
					<img src="${IMG_PATH}/m_modify.gif?_mc_res_version=<%=PlfStaticRes.M_MODIFY_GIF%>" />
				</a>||
				<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />" prefix="&nbsp;" >
					<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" />
				</a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	function query(){
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	var delId;
	function del(id) {
		delId = id;
		util.confirm(canDelete);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function canDelete(){
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/websJobMagAction_canDelete.ms",
			data : {"paraMap.id":delId},
			success : function(data) {
				var flag=data.ajaxMap.flag
				if(flag=="true"){
					util.closeLoading();
					util.alert("该事务已关联触发器，请先删除相关触发器，再执行删除事务！");
				}else{
					delConfirm()
				}
			},
			error : function(msg) {
				util.closeLoading();
				util.alert("删除失败");
			}
		});
	}
	function delConfirm() {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/websJobMagAction_deleteWebs.ms",
			data : {"paraMap.id":delId},
			success : function(data) {
				util.closeLoading();
				util.alert("删除成功");
				window.document.location.reload();
			},
			error : function(msg) {
				util.closeLoading();
				util.alert("删除失败");
			}
		});
	}
	function add(){
		var url = "${path}sys/websJobMagAction_toAddWebs.ms";
		showPopWin(url, 800, 400,null,"<dict:lang value="新增webservice事务" />");
	}

	function edit(id){
		var url = "${path}sys/websJobMagAction_toEditWebs.ms?paraMap.id="+id;
		showPopWin(url, 800, 400,null,"<dict:lang value="webservice事务修改" />");
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}

	function reloadPgExe(msg){
		document.forms.searchForm.submit();
	}
	function alertInfo(msg){
		
		util.alert(msg);
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>