<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title>配置文件集中修改页面(该页面最好是开放给管理员)</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
		<style type="text/css">
		.noBorder{
		   border:none;
		}
		
		</style>
	</head>

	<body class="ContBody">
	
	<%--<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td colspan="2" align="center" valign="middle">
			   <div class="ptop_10 txac">
				<input type="button" value="批量修改" onclick="submitForm(this);" class="botton_img_add">
				&nbsp;&nbsp;
				<input type="reset" value="重 置" onclick="resetForm();" class="botton_img_search" />
				</div>
			</td>
		</tr>
	</table>
	
--%>
	<s:form action="CacheAction_editPropCluster.ms" name="edit_form" id="edit_form" method="post">
	<s:hidden name="cacheDto.ppsFileName" value="cluster.properties" />
	<input type="hidden" name="pw" value="<c:out value='${pw}' />" />
	<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	
	<div class="table_div">
	<table id="addTable" class="table_list" <%if(request.getHeader("User-agent").indexOf("Firefox")>-1){%>style="table-layout:fixed;" <%} %> >
		<thead>
			<tr class="tdcolor">
				<th width="40px;">序号</th>
				<th width="170px;">属性名称(key)</th>
				<th width="190px;">属性原值(value)</th>
				<th width="190px;">属性修改值</th>
				<th>备注</th>
				<th width="40px;">操作</th>
			</tr>
		</thead>
		<tbody>
		<%--  迭代map方式，但不按顺序
	<s:iterator value="propMap.entrySet()" id="id" status="index">
		<s:hidden id="propList_%{#index.index}_key" name="propList[%{#index.index}].key" value="%{key}" />
		<tr>
		  	<td><s:property value="#index.count"/></td>
			<td><s:property value="key" /></td>
			<td id="propList_<s:property value="#index.index"/>_text" style="word-break:break-all;overflow: hidden"
			 title="<s:property value="value" />" ><s:property value="value" /></td>
			<td><s:textfield id="propList_%{#index.index}_value" name="propList[%{#index.index}].value" value="%{value}"
			 cssStyle="width:280;" /></td>
			<td align="center">
			<a href="javascript:void(0);" onclick="edit(this,'propList_<s:property value="#index.index"/>')">修改</a>
			| <a href="javascript:void(0);" onclick="del(this,'propList_<s:property value="#index.index"/>')">删除</a>
			</td>
		</tr>
	</s:iterator>
	 --%>
	 <%-- 以下是按顺序 --%>
	<s:iterator value="propList" id="id" status="index">
		<%--S<s:hidden id="propList_%{#index.index}_key" name="propList[%{#index.index}].key" value="%{key}" />--%>
		<tr>
			<s:hidden id="propList_%{#index.index}_key" name="propList[%{#index.index}].key" value="%{key}" />
		  	<td><s:property value="#index.count"/></td>
			<td title="<s:property value="key" />"><s:property value="key" /></td>
			<%-- <td id="propList_<s:property value="#index.index"/>_text" style="word-break:break-all;overflow: hidden;padding: 0px"
			 title="<s:property value="%value" />" ><input type="text" class="noBorder" value="<s:property value="value" />" 
			 	readonly="readonly" style="width: 100%;height:25px;background: #ddd;" /></td>--%>
			 <td id="propList_<s:property value="#index.index"/>_text" title="<s:property value="value" />" ><s:property value="value" /></td>
			<td><s:textfield id="propList_%{#index.index}_value" cssClass="noBorder" name="propList[%{#index.index}].value" value="%{value}"
			 cssStyle="width:100%;height:25px;" /></td>
			 <%-- <td><input type="text" id="propList_%{#index.index}_comment"  title ="<c:out value='${comment}' />" class="noBorder" name="propList[%{#index.index}].comment" value="<c:out value='${comment}' />"
			 style="width:100%;height:25px;background: #ddd;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;" readonly="readonly"/></td>--%>
			 <td title="<c:out value='${comment}' />"><c:out value='${comment}' /></td>
			<td align="center">
			<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="edit(this,'propList_<s:property value="#index.index"/>')">修改</a>
			<%-- 
			| <a href="javascript:void(0);" onclick="del(this,'propList_<s:property value="#index.index"/>')">删除</a>
			--%>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td height="10px;"></td></tr></table>
	<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td colspan="2" align="center" valign="middle">
			   <div class="" style="padding-bottom: 10px;"><%--ptop_10 txac --%>
					<input type="button" value="批量修改" onclick="submitForm(this);" class="layui-btn">
					&nbsp;&nbsp;
					<input type="reset" value="重 置" onclick="resetForm();" class="layui-btn layui-btn-primary" />
				</div>
			</td>
		</tr>
	</table>
	 <%--
	 <div class="ptop_10 txac">
			 <button class="layui-btn" lay-submit="" onclick="submitForm(this);">批量修改</button>
			<input type="button" value="重 置" onclick="resetForm();" class="layui-btn layui-btn-primary">
	</div>
	--%>
	</div>
</s:form>


<script type="text/javascript">

	function submitForm(thisObj){
		util.confirm(submitFormCf,"确认执行",thisObj);
	}

	function submitFormCf(thisObj){
		document.edit_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");};
	}

	  function resetForm(){
          $("#edit_form")[0].reset();
      }
	
	function goBack(thisObj){
		window.location.href = "${path}/comm/CacheAction_reloadCache.ms?pw=<c:out value='${pw}' />";
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");};
	}
	function edit(thisObj,id){
		var paraMObj = new Object();
		paraMObj.thisObj = thisObj;
		paraMObj.id = id;
		util.confirm(editCf,"确认执行",paraMObj);
	}
	
	function editCf(paraMObj){
		var thisObj = paraMObj.thisObj;
		var id = paraMObj.id;
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		var url = "${path}/comm/CacheAction_editPropFileSingle.ms";
		util.showLoading("处理中...");
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    //data: "cacheDto.ppsFileName=<s:property value="cacheDto.ppsFileName" />&propDtoParam.key="+key+"&propDtoParam.value="+$("#"+id+"").val(),
	    data:{ 'cacheDto.ppsFileName':'cluster.properties','propDtoParam.key':$("#"+id+"_key").val(),'propDtoParam.value':$("#"+id+"_value").val()},
		success: function(data){
				var v=$("#"+id+"_value").val();
				v=v.replace(/</g,"&lt;")
				$("#"+id+"_text").html(v);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				util.alert(data.ajaxCacheDto.msg);
				util.closeLoading();
			},
			error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	function del(thisObj,id){
		var paraMObj = new Object();
		paraMObj.thisObj = thisObj;
		paraMObj.id = id;
		util.confirm(delCf,"确认执行",paraMObj);
	}
	
	function delCf(thisObj,id){
		var thisObj = paraMObj.thisObj;
		var id = paraMObj.id;
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		var url = "${path}/comm/CacheAction_delPropFile.ms";
		util.showLoading("处理中...");
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data:{ 'cacheDto.ppsFileName':'<s:property value="cacheDto.ppsFileName" />','propDtoParam.key':$("#"+id+"_key").val()},
		success: function(data){
				util.alert(data.ajaxCacheDto.msg,reload);
				//$("#"+id+"_text").parent().remove();
				thisObj.disabled = false;
				thisObj.value = oldValue;
				util.closeLoading();
			},
			error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}

	function closeSub(){
		hidePopWin(true);
	}
	
	function reload(){
		var url = "${path}/comm/CacheAction_forEditPropFile.ms";
		url= url + "?pw=<c:out value='${pw}' />cacheDto.ppsFileName=<s:property value="cacheDto.ppsFileName" />";
		window.location.href = url;
	}
	
	function init(){
		//var tableTrJs = $("#addTable tbody tr");
		//_toClickColor(tableTrJs);
		//_tongLineColor(tableTrJs);
	}
		
	<%-- 显示提示信息 --%>
	if("<c:out value='${actionMessages[0]}' />" !=""){
		util.alert("<c:out value='${actionMessages[0]}' />");
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp" %>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>