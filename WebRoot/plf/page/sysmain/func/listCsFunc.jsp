<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="功能菜单列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div>
	<form id="search_form" name="searchForm" action="${path}sys/FuncAction_listFunc.ms" method="post">
		<s:hidden id="funcDtoSh_upId" name="funcDtoSh.upId" />
		<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
		<s:hidden id="clientType" name="clientType" />
		<s:hidden id="type" name="type" />
		<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	<table class="search_table">
		<tr>
			<s:if test="clientType==2&&type!=2">
			<!--  
			<td >
			  	<dict:lang value="功能名称" />
			  	<s:textfield id="name" name="funcDtoSh.name" cssClass="input_sh" maxlength="30" />
		  	</td>
			<td >
				    <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
				    <bu:funOper funcNo="F47" type="button" onclick="add('@{funcUrl}');" prefix="&nbsp;" cssClass="layui-btn" />
				    <input type="button" value="<dict:lang value="多选删除" />" onclick="delAll()" class="layui-btn layui-btn-danger"> 
		  	</td>
		  	-->
		  	<td>
		  		<div class="search_table_wrap">
		  			<span><dict:lang value="功能名称" /></span>
		  			<div class="layui-input-inline">
		  				<s:textfield id="name" name="funcDtoSh.name" cssClass="input_sh" maxlength="30" />
		  			</div>
		  		</div>
		  		<div class="search_table_wrap">
		  			<input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
				    <bu:funOper funcNo="F47" type="button" onclick="add('@{funcUrl}');" prefix="&nbsp;" cssClass="layui-btn" />
				    <input type="button" value="<dict:lang value="多选删除" />" onclick="delAll()" class="layui-btn layui-btn-danger"> 
		  		</div>
		  	</td>
		  	</s:if>
	    </tr>
	</table>
	</form>
	
	<div class="table_div mc-table-container">
		<!-- left start -->
		<div class="mc-table-left" style="padding-right: 120px;">
			<!-- left content start -->
			<div class="mc-table-left-content">
			
				<table id="listTable" class="table_list">
					<thead>
					<tr class="tdcolor">
						<th style="width: 40px;" ><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></th>
						<th style="width: 40px;"><dict:lang value="序号" /></th>
						<th style="width: 119px;"><dict:lang value="功能名称" /></th>
						<th style="width: 105px;"><dict:lang value="功能编码" /></th>
						<th style="width: 119px;"><dict:lang value="上级功能名称" /></th>
						<th style="width: 117px;"><dict:lang value="功能图标" /></th>
						<th style="width: 61px;"><dict:lang value="类型" /></th>
						<th style="width: 90px;"><dict:lang value="权限控制" /></th>
						<th style="width: 61px;"><dict:lang value="顺序" /></th>
						
					</tr>
					</thead>
					<tbody>
					<s:iterator value="funcLs" status="index">
						<tr id="<c:out value='${id}'/>">
							<td style="width:30px;text-align:center;"><input type="checkbox" name="" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td>
							<td><s:property value="#index.count"/></td>
							<td title="<s:property value="name"/>"><s:property value="name"/></td>
							<td title="<s:property value="funcCode"/>"><s:property value="funcCode"/></td>
							<td title="<s:property value="upName"/>"><s:property value="upName"/></td>
							<td title="<s:property value="img"/>"><s:property value="img"/></td>
							<td ><dict:viewDict dictCode="FUNC_TYPE" dictValue="%{type}" /></td>
							<td><dict:viewDict dictCode="YESNO" dictValue="%{isAuth}"/></td>
							<td><s:property value="orderBy"/></td>
							
						</tr>
					</s:iterator>
					</tbody>
				</table>
				
			</div>
			<!-- left content end -->
		</div>
		<!-- left end -->
		<!-- right start -->
		<div class="mc-table-right" style="width:120px">
			<table id="listTable" class="table_list">
				<thead>
					<tr>
						<th style="width: 120px;"><dict:lang value="操作" /></th>
					</tr>
					
				</thead>
				<tbody>
					<s:iterator value="funcLs" status="index">
					<tr>
						<td class="layui-btn-left">
							<bu:funOper funcNo="F48" cssClass="layui-btn layui-btn-xs" type="a" href="update('@{funcUrl}','%{id}');" ><dict:lang value="编辑" /></bu:funOper>
							<bu:funOper funcNo="F49" cssClass="layui-btn layui-btn-danger layui-btn-xs" type="a" href="javascript:void(0);" onclick="del('@{funcUrl}','%{id}','%{viewId}');" title="%{getText('删除')}"  ><dict:lang value="删除" /></bu:funOper>
						</td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<!-- right end -->
    
	</div>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="funcDtoSh_id" name="funcDtoSh.id" />
		<input type="hidden" id="funcDtoSh_viewId" name="funcDtoSh.viewId" />
		
	</form>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	var editTable =  $("#listTable");
	function query(thisObj){
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	 function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	}
	function delAll()
	{
		if(checkSelected()){
			util.confirm(delALLConfirm,"<dict:lang value="确定要删除选中的数据" />");
		}else{
			util.alert("<dict:lang value="请至少勾选一条记录" />");
		}
	}
	var delId;
	function delALLConfirm(){
		if(delRow()){
			//alert(delId);
			util.showTopLoading();
	   		 var params={};
	   		 params.ids=delId;
			$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}sys/FuncAction_delCheckFunc.ms",
		    data: params,
			success: function(data)
			{
			    var d=data.ajaxMap;
			    util.closeTopLoading();
				top.util.alert(d.Message);
				 window.location.reload();
						
			},
				error: function(msg){
					util.closeTopLoading();
					
			  }	
			});
		
		}
	}
		<%-- 检查是否有选中记录 --%>
	function checkSelected(){
		var finded = false;
		editTable.find("tbody tr").each(function(seq) {
			if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
				finded = true;
				return true;
			}
		});
		return finded;
	}
	
	<%-- 删除数据 --%>
	function delRow(){
		var delIds="";
		editTable.find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
			removeAdd = true;
			delIds+="'"+$(this).val()+"'";
			delIds+=",";
		});
		if(""==delIds){
			util.alert("<dict:lang value="未选择记录行" />");
			return false;
		}
		delId = delIds;
		return true;
	}
	//点击行寄选中该行
	$("#listTable tr").on("click",function(e){
		var trId = $(this).attr("id");
		
		if ($("#"+trId+" :checkbox").attr("checked")) {
			$("#"+trId+" :checkbox").attr("checked",false);
			$("#"+trId).css("background-color","");
		}else{
			$("#listTable input[type='checkbox']").each(function(){
				if ($(this).attr("checked")) {
					$(this).attr("checked",false);
					$(this).parents("tr").css("background-color","");
				}
			});
			$("#"+trId+" :checkbox").attr("checked",true);
			$("#"+trId).css("background-color","#a0c8e5");
		}
	});
	
	  $("#listTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#a0c8e5");
		  }
	  });
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.search_form.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function getUpName(){
		return $("#funcDtoUp_name").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var type=$("#type").val();
		var clientType=$("#clientType").val();
		var url = "${path}sys/FuncAction_showAddFunc.ms?funcDto.upId="+$("#funcDtoSh_upId").val()+"&type="+type+"&clientType="+clientType+"&mcIframeName="+window.parent.name+"&path=<c:out value='${paraMap.path}' />";
      	showPopWin(url, 900, 350,null,"<dict:lang value="新增" />");
	}
	
	function update(url,id){
		var type=$("#type").val();
		var clientType=$("#clientType").val();
		var url = "${path}"+url + "&funcDtoSh.id="+id+"&type="+type+"&clientType="+clientType+"&mcIframeName="+window.parent.name+"&path=<c:out value='${paraMap.path}' />";;
      	
		showPopWin(url, 900, 350,null,"<dict:lang value="修改" />");
	}

	function del(url,id,viewId){
		var paramObj =new Object;
		paramObj.url = url;
		paramObj.id = id;
		paramObj.viewId = viewId;
		util.confirm(delConfirm,"",paramObj);
	}
	
	function delConfirm(paramObj){
    document.forms.submit_form.action=paramObj.url;
		$("#funcDtoSh_id").val(paramObj.id);
		$("#funcDtoSh_viewId").val(paramObj.viewId);
		document.forms.submit_form.submit();
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