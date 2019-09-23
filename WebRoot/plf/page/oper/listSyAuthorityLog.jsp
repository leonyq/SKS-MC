<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="越权操作日志" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}oper/LogAction_listSyAuthorityLog.ms"   method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<span><dict:lang value="部门名称" /></span>
								<div class="layui-input-inline">
				  				<s:textfield id="paraMap_account" name="paraMap.DEPTNAME" cssClass="input_sh" maxlength="33" />
								</div>
							</div>
							<div class="search_table_wrap">
								<span><dict:lang value="用户" /></span>
								<div class="layui-input-inline">
				  				<s:textfield id="paraMap_smtp" name="paraMap.USERNAME" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<span><dict:lang value="访问url" /></span>
								<div class="layui-input-inline">
				  				<s:textfield id="paraMap_smtp" name="paraMap.URL" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
							</div>
						</td>
						<%-- 
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="部门名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_account" name="paraMap.DEPTNAME" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="用户" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_smtp" name="paraMap.USERNAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" >访问url</div>
								<div class ="search_value">
								<s:textfield id="paraMap_smtp" name="paraMap.URL" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_search" />
						</td>
						--%>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="100px;"><dict:lang value="访问者IP" /></th>
			<th width="200px;"><dict:lang value="访问URL" /></th>
			<th width="90px;"><dict:lang value="部门" /></th>
			<th width="90px;"><dict:lang value="用户" /></th>
			<th width="100px;"><dict:lang value="功能编码" /></th>
			<th width="100px;"><dict:lang value="应用标识" /></th>
			<th width="100px;"><dict:lang value="主机IP" /></th>
			<th width="100px;"><dict:lang value="组织机构" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr>
			<td title="<s:property value="CLIENT_IP"/>"><s:property value="CLIENT_IP"/></td>
			<td title="<s:property value="URL"/>"><s:property value="URL"/></td>
			<td title="<s:property value="DEPTNAME"/>"><s:property value="DEPTNAME"/></td>
			<td title="<s:property value="NAME"/>"><s:property value="NAME"/></td>
			<td title="<s:property value="FUNC_CODE"/>"><s:property value="FUNC_CODE"/></td>
			<td title="<s:property value="APP_CODE"/>"><s:property value="APP_CODE"/></td>
			<td title="<s:property value="M_IP"/>"><s:property value="M_IP"/></td> 
			<td title="<s:property value="DATA_AUTH"/>"><s:property value="DATA_AUTH"/></td>


			

		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div> --%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
	
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
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
	
	function add(){
		var url = "${path}email/userEmailManageAction_addUpdate.ms";
		showPopWin(url, 900, 500,null,"<dict:lang value="发件人配置" /> <dict:lang value="新增" />");
	}
	
	function modify(id){
		var url = "${path}email/userEmailManageAction_addUpdate.ms?paraMap.id="+id;
		showPopWin(url, 900, 500,null,"<dict:lang value="发件人配置" /> <dict:lang value="修改" />");
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
    		    url: "${path}email/userEmailManageAction_delEmailUser.ms",
    		    data: "paraMap.id="+delId,
    			success: function(data){
    					util.closeLoading();
    					if(data.ajaxMap != null && data.ajaxMap != ""){
         					if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.msg == "1"){
    								util.alert("<dict:lang value="操作成功！" />");
    							}else{
    								util.alert("<dict:lang value="操作失败：" />:"+msg);
    							}
    							
    							query(document.getElementById("searchButtonId"));
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