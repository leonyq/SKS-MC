<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="发件人设置" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}email/userEmailManageAction_listUser.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<dict:lang value="发件人账号" />
								<div class="layui-input-inline">
									<s:textfield id="paraMap_account" name="paraMap.account" cssClass="input_sh" maxlength="33" />
								</div>
							</div>
							<div class="search_table_wrap">
								<dict:lang value="SMTP地址" />
								<div class="layui-input-inline">
									<s:textfield id="paraMap_smtp" name="paraMap.smtp" cssClass="input_sh" maxlength="300" />
								</div>
							</div>
							<div class="search_table_wrap">
								<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
								<input type="button" id="" value="<dict:lang value="新增" />" onclick="add();"  class="layui-btn" />
							</div>
						</td>
						<%-- 
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="发件人账号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_account" name="paraMap.account" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="SMTP地址" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_smtp" name="paraMap.smtp" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
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
			<th><dict:lang value="发件人账号" /></th>
			<th width="150px;"><dict:lang value="SMTP地址" /></th>
			<th width="100px;"><dict:lang value="端口号" /></th>
			<th width="90px;"><dict:lang value="启用标识" /></th>
			<th width="100px;"><dict:lang value="账户类型" /></th>
			<th width="100px;"><dict:lang value="操作" />
				<%--<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>--%>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr id="<s:property value="id"/>">
			<td><s:property value="#index.count"/></td>
			<td><s:property value="account"/></td>
			<td><s:property value="smtp"/></td>
			<td><s:property value="port_num"/></td>
			<td><dict:viewDict dictCode="EMAIL_FLAG" dictValue="%{#configPage.flag}" /></td>
			<td><dict:viewDict dictCode="YJ" dictValue="%{#configPage.account_type}" /></td>
			<td>
				<bu:funOper funcNo="F626" cssClass="layui-btn layui-btn-xs" type="a" href="javascript:void(0);" onclick="modify('%{id}');" >
					<dict:lang value="修改" />
				</bu:funOper>
				<bu:funOper funcNo="F627" cssClass="layui-btn layui-btn-danger layui-btn-xs"  type="a" href="javascript:void(0);" onclick="del('%{id}');" prefix="&nbsp;" >
					<dict:lang value="删除" />
				</bu:funOper>
			</td>
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
<script type="text/javascript">
	
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	$(function(){
		$("#listTable").attr("style","");
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
	
	function add(){
		var url = "${path}email/userEmailManageAction_addUpdate.ms"+"?mcIframeName="+window.name;
		showPopWin(url, 500, 450,null,"<dict:lang value="发件人配置" /> <dict:lang value="新增" />");
	}
	
	function modify(id){
		var url = "${path}email/userEmailManageAction_addUpdate.ms?paraMap.id="+id+"&mcIframeName="+window.name;
		showPopWin(url, 500, 450,null,"<dict:lang value="发件人配置" /> <dict:lang value="修改" />");
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
    								top.util.alert("<dict:lang value="操作成功！" />");
    							}else{
    								top.util.alert("<dict:lang value="操作失败：" />:"+msg);
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