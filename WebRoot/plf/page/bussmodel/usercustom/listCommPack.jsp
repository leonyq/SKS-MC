<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用类列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/UserCustomAction_listCommPack.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.UP_ID" />
			<s:hidden name='paraMap.namePath' />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		    <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		    
				<table class="search_table">
					<tr>
						<td>
						<!--  
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类编号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_ID" name="paraMap.MS_CLASS_CODE_ID" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类说明" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_DESC" name="paraMap.CLASS_DESC" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
						-->
							<!--  
							<td >
						  		<span><dict:lang value="类编号" /></span>
						  		<s:textfield id="paraMap_ID" name="paraMap.MS_CLASS_CODE_ID" cssClass="input_sh" maxlength="300" />
					  	    </td>
					  	    -->

					  	    <div class="search_table_wrap">
					         <span><dict:lang value="类名称" /></span>
					          <div class="layui-input-inline">
					            <s:textfield id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME" cssClass="input_sh" maxlength="300" />
					          </div>
					        </div>
					  	    
					  	    <div class="search_table_wrap">
					         <span><dict:lang value="类说明" /></span>
					          <div class="layui-input-inline">
					            <s:textfield id="paraMap_CLASS_DESC" name="paraMap.CLASS_DESC" cssClass="input_sh" maxlength="300" />
					          </div>
					        </div>

					  		<div class="search_table_wrap">
					          <div class="layui-input-inline">
					            <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						    
						     	<bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" >新增</bu:funOper>
					            
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
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<%-- <th width="5%"><dict:lang value="编号" /></th> --%>
			<th style="width:250px;"><dict:lang value="类编号" /></th>
			<th style="width:250px;"><dict:lang value="类名称" /></th>
			<th ><dict:lang value="类说明" /></th>
			<th style="width:100px;"><dict:lang value="上级类" /></th>
			<th style="width:100px;"><dict:lang value="类型" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="MS_CLASS_CODE_ID"/>"><s:property value="MS_CLASS_CODE_ID"/></td>
			<td title="<s:property value="CLASS_NAME"/>"><s:property value="CLASS_NAME"/></td>
			<td title="<s:property value="CLASS_DESC"/>"><s:property value="CLASS_DESC"/></td>
			<td><s:property value="UP_DESC"/></td>
			<td><s:property value="MS_CLASS_TYPE_NAME"/></td>
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
							<th style="width: 170px;"><dict:lang value="操作" />
								
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="page.dataList" status="index">
						<tr>
							<td>
								<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:view('<s:property value="MS_CLASS_CODE_ID"/>')" title="<dict:lang value="查看" />" >查看
								</a>
								
								<a class="layui-btn layui-btn-xs" href="javascript:update('<s:property value="ID"/>')" title="<dict:lang value="修改" />" >修改
								</a>
								
								<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" >删除
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
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
	--%>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
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
		util.alert(msg);
	}
	
	function reloadPg(msg){
		if(null !=msg){
			util.alert(msg,reloadPgExe);
		}
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		var mcIframeName = window.parent.name; //外层iframe的name
		url = "${path}sys/UserCustomAction_showAddCommPack.ms?paraMap.ID=<s:property value='paraMap.namePath' />&mcIframeName="+mcIframeName;
		showPopWin(url, 430, 290,null,"<dict:lang value="公用类" /> <dict:lang value="新增" />");
	}
	var isModify=false;
	function closePopCbFun(){
		if(isModify){
			reloadPg();
		}
		return true;
	}
	
	function update(id){
	    var mcIframeName = window.parent.name; //外层iframe的name
		var url = "${path}sys/UserCustomAction_showAddCommPack.ms?paraMap.ID="+id+"&mcIframeName="+mcIframeName;
		showPopWin(url, "430", "290",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="修改" />");
	}
	function view(id){
		if(null==id||""==id){
			util.alert("类编号为空不能查看！");
			return;
		}
		var url = "${path}sys/UserCustomAction_showView.ms?paraMap.CODE_ID="+id;
		showPopWin(url, "99%", "99%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="查看" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/UserCustomAction_delCommClass.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	
	$(function(){
		setTableStyle('listTable'); 
	    
	})

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>