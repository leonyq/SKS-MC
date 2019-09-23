<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="用户操作日志" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<link  href="${path}plf/js/mCustomScrollbar/jquery.mCustomScrollbar.css?_mc_res_version=20180125" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${path}plf/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=20180125"></script>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}oper/LogAction_listSyOperLog.ms"  method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
						<div class="search_table_wrap">
							<span><dict:lang value="角色名称" /></span>
							<div class="layui-input-inline">
			  					<s:textfield id="paraMap_account" name="paraMap.ACTION_NAME" cssClass="input_sh" maxlength="33" />
							</div>
						</div>
						<div class="search_table_wrap">
							<span><dict:lang value="执行方法" /></span>
							<div class="layui-input-inline">
			  					<s:textfield id="paraMap_smtp" name="paraMap.ACTION_METHOD" cssClass="input_sh" maxlength="300" />
							</div>
						</div>
						<div class="search_table_wrap">
							<span><dict:lang value="起始时间" /></span>
							<div class="layui-input-inline">
			  				<input id="starttime" name="paraMap.CREATE_TIME"
								value='<fmt:formatDate value="${starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
								 class="input_sh WdateNomorl"
								onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
								readonly="readOnly"> 
							</div>
						</div>
						<div class="search_table_wrap">
							<span><dict:lang value="结束时间" /></span>
							<div class="layui-input-inline">
			  				<input id="endtime" name="paraMap.END_TIME"
								value='<fmt:formatDate value="${endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
								 class="input_sh WdateNomorl"
								onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
								readonly="readOnly"> 
							</div>
						</div>
						<div class="search_table_wrap">
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
						</div>
						</td>
						<%-- 
						<td>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="角色名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_account" name="paraMap.ACTION_NAME" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="执行方法" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_smtp" name="paraMap.ACTION_METHOD" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
						<div class="search_div" style="margin-left:  10px;">
								<div  style="width: 60px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="起始时间" /></div>
								<div class ="search_value">
								<input id="starttime" name="paraMap.CREATE_TIME"
								value='<fmt:formatDate value="${starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
						 class="input WdateNomorl"
						onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
						readonly="readOnly"> 
								</div>
							</div>
							<div class="search_div" style="margin-left:  10px;">
								<div  style="width: 55px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="结束时间" /></div>
								<div class ="search_value">
								<input id="starttime" name="paraMap.END_TIME"
								value='<fmt:formatDate value="${endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
						 class="input WdateNomorl"
						onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
						readonly="readOnly"> 
								</div>
							</div>
							<input type="button" style="margin-left: 30px;margin-top: 3px;" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_search" />
						</td>
						--%>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="100px;"><dict:lang value="部门" /></th>
			<th width="100px;"><dict:lang value="用户" /></th>
			<th width="120px;"><dict:lang value="角色名称" /></th>
			<th width="120px;"><dict:lang value="执行方法" /></th>
			<th width="150px;"><dict:lang value="创建时间" /></th>
			<th width="130px;"><dict:lang value="操作者IP" /></th>
			<th width="120px;"><dict:lang value="功能编码" /></th>
			<th width="90px;"><dict:lang value="应用标识" /></th>
<%-- 			<th width="20%"><dict:lang value="访问参数" /></th> --%>
			<th width="350px;"><dict:lang value="请求地址" /></th>
			<th width="400px;"><dict:lang value="功能菜单" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr>			
			<td title="<s:property value="DEPTNAME"/>"><s:property value="DEPTNAME"/></td>
			<td title="<s:property value="USERNAME"/>"><s:property value="USERNAME"/></td>
			<td title="<s:property value="ACTION_NAME"/>"><s:property value="ACTION_NAME"/></td>
			<td title="<s:property value="ACTION_METHOD"/>"><s:property value="ACTION_METHOD"/></td>
			<td title="<s:property value="CREATETIME"/>"><s:property value="CREATETIME"/></td>
			<td title="<s:property value="CLIENT_IP"/>"><s:property value="CLIENT_IP"/></td>
			<td title="<s:property value="FUNC_CODE"/>"><s:property value="FUNC_CODE"/></td>
			<td><s:property value="APP_CODE"/></td>
		<%-- 	<td><s:property value="PARAM"/></td> --%>
			<td style="max-width:150px">
			 <div class="scroll">
			 <s:property value="PARAM"/>
			 </div>
			
			</td>
			
			<td title="<s:property value="MENU_PATH"/>"><s:property value="MENU_PATH"/></td>
			
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
		setPopScroll('.scroll');
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>