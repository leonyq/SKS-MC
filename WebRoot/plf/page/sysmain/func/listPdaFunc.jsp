<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="功能菜单列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
	</head>
<body>

<div class="all">
<div >
	<form id="search_form" name="searchForm" action="${path}sys/FuncAction_listFunc.ms" method="post">
		<s:hidden id="funcDtoSh_upId" name="funcDtoSh.upId" />
		<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
		<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<s:hidden id="clientType" name="clientType" />
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
	<table class="search_table">
		<tr>
			<td >
			    <div class="search_table_wrap">
					<span><dict:lang value="功能名称" /></span>
					<div class="layui-input-inline">
	  					<s:textfield id="name" name="funcDtoSh.name" cssClass="input_sh" maxlength="30" />
					</div>
				</div>
			  	<div class="search_table_wrap">
			  		<span><dict:lang value="功能URL" /></span>
			  		<div class="layui-input-inline">
			  			<s:textfield id="url" name="funcDtoSh.url" cssClass="input_sh" maxlength="120" />
			  		</div>
			  	</div>
			  	<div class="search_table_wrap">
			  		<input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
				    <s:if test="${funcDtoSh.upId!='0'}">
					<bu:funOper funcNo="F47" type="button" onclick="add('@{funcUrl}');" cssClass="layui-btn" />
					  <input type="button" value="<dict:lang value="多选删除" />" onclick="delAll()" class="layui-btn layui-btn-danger"> 
					</s:if>
			  	</div>
		  	</td>
	    </tr>
	</table>
	</form>
	</div>
	<div class="table_div mc-table-container" style="overflow: hidden;">
	<!-- left start -->
	<div class="mc-table-left"　style="padding-left: 174px;">
	<!-- left content start -->
	<div class="mc-table-left-content">
    <table id="listTable" class="table_list">
		<thead>
			<tr class="tdcolor">
			    <th style="width: 40px;" ><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></th>
				<th style="width: 40px;"><dict:lang value="序号" /></th>
				<th style="width: 119px;"><dict:lang value="功能名称" /></th>
				<th style="width: 145px;"><dict:lang value="功能编码" /></th>
				<th style="width: 347px;"><dict:lang value="功能URL" /></th>
				<th style="width: 150px;"><dict:lang value="上级功能名称" /></th>
				<th style="width: 150px;"><dict:lang value="功能图标" /></th>
				<th style="width: 61px;"><dict:lang value="类型" /></th>
				<th style="width: 90px;"><dict:lang value="权限控制" /></th>
				<th style="width: 61px;"><dict:lang value="顺序" /></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="funcLs" status="index">
				<tr  id="<c:out value='${id}'/>">
					<td style="width: 61px;text-align:center;"><input type="checkbox" name="" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td>
					<td><s:property value="#index.count"/></td>
					<td title="<s:property value="name"/>"><s:property value="name"/></td>
					<td title="<s:property value="funcCode"/>"><s:property value="funcCode"/></td>
					<td title="<s:property value="url"/>"><s:property value="url"/></td>
					<td title="<s:property value="upName"/>"><s:property value="upName"/></td>
					<td title="<s:property value="img"/>"><s:property value="img"/></td>
					<td><dict:viewDict dictCode="FUNC_TYPE" dictValue="%{type}" /></td>
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
	<div class="mc-table-right ">
		<table class="table_list">
			<thead>
				<tr class="tdcolor">
					<th><dict:lang value="操作" /></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="funcLs" status="index">
				<tr>
					<td style="height:27px;" class="layui-btn-left">
					  <s:if test="${funcDtoSh.upId!='0'}"><%--
					   <a class="layui-btn layui-btn-xs" href="javascript:void(0);" onclick="update('@{funcUrl}','%{id}');"  lay-event="edit">编辑</a>
		 			   <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" href="javascript:void(0);" onclick="del('@{funcUrl}','%{id}','%{viewId}');" >删除</a>
					  
						--%><bu:funOper funcNo="F48" cssClass="layui-btn layui-btn-xs" type="a" href="update('@{funcUrl}','%{id}');" ><dict:lang value="编辑" /></bu:funOper>
						<bu:funOper funcNo="F49" cssClass="layui-btn layui-btn-danger layui-btn-xs" type="a" href="javascript:void(0);" onclick="del('@{funcUrl}','%{id}','%{viewId}');" title="%{getText('删除')}"  ><dict:lang value="删除" /></bu:funOper>
					  </s:if>	
					 				
						<!-- //后台功能配置列表中操作功能增加一个解除该功能所有角色功能  -->
						<s:if test="${lockrole=='1'}">
								<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="unlockRoleFunc('${id}');">解除权限
								</a>
						</s:if>
										
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- right end -->
	</div>
	
	<%--<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
	
	--%><div id="currentPageDiv" class="table_div"></div>
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
		//_pageCurrentPageObj.value="1";
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
	function replaceLikeVal(comp){  
        if (comp.value.indexOf("'") != -1 || comp.value.indexOf("\"") != -1) {  
            //comp.value = comp.value.substring(0, comp.value.length-1);  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"");  
        }  
    }
	var delId;
	function delALLConfirm(){
		if(delRow()){
			//alert(delId);
			util.showTopLoading();
	   		 var params={};
	   		 params.ids= _mcBase64JsToJava.getMcDealBase64Encode(delId);
			$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}sys/FuncAction_delCheckFunc.ms",
		    data: params,
			success: function(data)
			{
			    var d=data.ajaxMap;
			    util.closeTopLoading();
				reloadPg(d.Message);
				// window.location.reload();
						
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
		return "系统";
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var clientType = $("#clientType").val();
		var url = "${path}sys/FuncAction_showAddFunc.ms?clientType="+clientType+"&funcDto.upId="+$("#funcDtoSh_upId").val()+"&isCsMenu="+false+"&path=<c:out value='${paraMap.path}' />&mcIframeName="+window.parent.name;
		showPopWin(url, 900, 600,null,"<dict:lang value="新增" />");
	}
	
	function update(url,id){
	var clientType = $("#clientType").val();
		var url = "${path}"+url + "&funcDtoSh.id="+id+"&mcIframeName="+window.parent.name+"&clientType="+clientType;
      	showPopWin(url, 900, 600,null,"<dict:lang value="修改" />");
	}

	function del(url,id,viewId){
		var paramObj =new Object;
		paramObj.url = url;
		paramObj.id = id;
		if(viewId!=null)
		{
		 paramObj.viewId = html2Escape(viewId);
		}
		
		util.confirm(delConfirm,"",paramObj);
	}
	
	function delConfirm(paramObj){
    document.forms.submit_form.action=paramObj.url;
		$("#funcDtoSh_id").val(paramObj.id);
		$("#funcDtoSh_viewId").val(paramObj.viewId);
		document.forms.submit_form.submit();
	}
		
	function html2Escape(sHtml) 
	{
	 return sHtml.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];});
	}
	function init(){
		//var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		//_tongLineColor(tableTrJs);
	}

	
	  //后台功能配置列表中操作功能增加一个解除该功能所有角色功能 
	  function unlockRoleFunc(func_id){
	    	var paramObj =new Object;
	    	paramObj.url = '${path}sys/FuncAction_unlockRoleFunc.ms';
	    	paramObj.id = func_id;
	    	util.confirm(unlockRoleFunc_Confirm,"确定解除该功能所有角色功能 ",paramObj);
	  }
	  function unlockRoleFunc_Confirm(paramObj){
		   	var params={};
		   	params.func_id= paramObj.id;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/FuncAction_unlockRoleFunc.ms",
			    data: params,
				success: function(data)
				{
					reloadPg("已解除该功能所有角色功能");
							
				},
				error: function(msg){
						util.closeTopLoading();
						
				}	
			});
				
	  }
	  setTableStyle("listTable");
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>