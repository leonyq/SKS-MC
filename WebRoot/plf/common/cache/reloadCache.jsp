<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<%@ include file="/plf/common/pub_tag.jsp" %>
<% 
	int i = 1; 
%>
<html>
	<head>
		<title>缓存管理(实验室功能)</title>
		
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
		
	</head>

<body class="ContBody">
<div class="table_div">
<table id="addTable" class="table_list table-mc-form" >
	<thead>
		<tr>
			<th width="90px;">序号</th>
			<th width="350px;">相关说明</th>
			<th width="400px;">缓存名称</th>
			<th width="110px;">操作</th>
		</tr>
	</thead>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>重新加载文件名称</td>
		<td><s:textfield id="ppsFileName" cssStyle="width:99%;height: 26px;" cssClass="input_sh"/></td>
		<td><%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reloadPropertieCache(this)">执行</a>
		--%>
		<input type="button" value="执行" style="width: auto;" class="layui-btn layui-btn-xs" onclick="reloadPropertieCache(this)" />
		
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td><b>清空当前应用节点缓存</b></td>
		<td>所有已读取过的.properties文件及通用缓存</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reloadPropertieAllCache(this)">执行</a>
		 --%>
		<input type="button" value="执行"  style="width: auto;" class="layui-btn layui-btn-xs" onclick="reloadPropertieAllCache(this)"  />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td><b style="color:#ff0000">清空所有节点缓存</b></td>
		<td>所有已读取过的.properties文件及通用缓存</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reloadPropertieAllCacheS(this)">执行</a>
		--%>
		<input type="button" value="执行" style="width: auto;" class="layui-btn layui-btn-xs" onclick="reloadPropertieAllCacheS(this)" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<%-- <tr class="tr1">
	  	<td><%=i++%></td>
		<td><b>所有业务表加data_auth字段</b></td>
		<td><b>所有业务表加data_auth字段--一次性任务</b></td>
		<td>&nbsp;&nbsp;<input type="button"  value="执行" class="YellowInputBtn" onclick="exeCommPageData(this)" style="width: 90%;" /></td>
	</tr> 
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>--%>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>重新加载log4j配置文件</td>
		<td>log4j.properties</td>
		<td><%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reloadLog4jCache(this)">执行</a>
		--%>
		<input type="button" value="执行" style="width: auto;" class="layui-btn layui-btn-xs" onclick="reloadLog4jCache(this)" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>重新加载数据字典缓存</td>
		<td>Map&lt;Object, Map&lt;Object, DictValDto&gt;&gt; DICT_MAP</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reLoadDictCache(this)">执行</a>
		--%>
		<input type="button" value="执行" style="width: auto;" class="layui-btn layui-btn-xs" onclick="reLoadDictCache(this)" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td>
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>修改配置文件</td>
		<td>
			<s:select id="cacheDto_ppsFileName" name="cacheDto.ppsFileName" list="propFilelist" listValue="name" cssClass="mc-list-input-edit" listKey="name" />
		</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="editPropFile(this)">执行</a>
		--%>
		<input type="button" style="width: auto;" value="修改" class="layui-btn layui-btn-xs" onclick="editPropFile(this)" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td><b>重新发布当前节点视图页面</b></td>
		<td>当前节点视图页面、公用页面</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="putAllViewPage(this,'')">执行</a>
		--%>
		<input type="button" style="width: auto;" value="执行" class="layui-btn layui-btn-xs" onclick="putAllViewPage(this,'')" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td><b>重新发布<b style="color:#ff0000">所有节点</b>视图页面</b></td>
		<td>所有节点视图页面、公用页面</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="putAllViewPage(this,'1')">执行</a>
		--%>
		<input type="button" style="width: auto;" value="执行" class="layui-btn layui-btn-xs" onclick="putAllViewPage(this,'1')" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td><b>重新发布当前节点类文件</b></td>
		<td>当前节点所有 class类文件(会清除所有class类缓存)</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reloadClassCode(this)">执行</a>
		--%>
		<input type="button" style="width: auto;" value="执行" class="layui-btn layui-btn-xs" onclick="reloadClassCode(this)" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<%--<tr class="tr1">
	  	<td><%=i++%></td>
		<td>初始化path字段数据</td>
		<td>表名|树父ID名称(不填则默认为up_id):<input type="text" value="" id="tableName" name="tableName" style="width: 250px;height:26px;" class="input_sh"/></td>
		<td>&nbsp;&nbsp;
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="recursiveUpdatePathToSyFunc(this)">执行</a>
		
		<input type="button" value="执行" class="YellowInputBtn" onclick="recursiveUpdatePathToSyFunc(this)" style="width: 90%;" />
		
		</td>
	</tr>
	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>--%>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>重新刷新多语言缓存</td>
		<td>重新刷新多语言缓存</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="reLoadLangCache(this)">执行</a>
		--%>
		<input type="button" style="width: auto;" value="执行" class="layui-btn layui-btn-xs" onclick="reLoadLangCache(this)" />
		
		</td>
	</tr>

	<tr style="height:38px;">
		<td colspan="4" height="20"></td> 
	</tr>
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>设置控件台输出文件</td>
		<td>设置控件台输出文件</td>
		<td>
		<%--
		<a href="javascript:void(0);" class="layui-btn layui-btn-xs" onclick="setPrintErrlog(this)">执行</a>
		--%>
		<input type="button" style="width: auto;" value="执行" class="layui-btn layui-btn-xs" onclick="setPrintErrlog(this)" />
		
		</td>
	</tr>
	
	<%--  
	<tr class="tr1">
	  	<td><%=i++%></td>
		<td>重新发布类源码all(暂不可用)</td>
		<td>重新发布类源码all(暂不可用)</td>
		<td>&nbsp;&nbsp;<input type="button" value="执行" class="YellowInputBtn" onclick="reloadAllClassCode(this)" style="width: 90%;" /></td>
	</tr>--%>

	<tr>
		<td colspan="4">
		<textarea  id="_showComClassInfo" rows="6" style="width: 100%;display: none;" readonly="readonly">
		</textarea>
		</td>
	</tr>
</table>
</div>


<script type="text/javascript">
	
	
function trim(s){
    return s.replace(/(^\s*)|(\s*$)/g, "");
}

layui.use('form', function(){
		  var form = layui.form;
		  form.render("select");
		  inputFocus();
	});
	
function recursiveUpdatePathToSyFunc(thisObj){
	if(!confirm("确认执行？")){return false;}
	thisObj.disabled = true;
	var tableName = trim($("#tableName").val());
	
	if(tableName==""){ 
		util.alert("表名不能为空！");
		thisObj.disabled = false;
		return;
	}
	var oldValue = thisObj.value;
	thisObj.value = "处理中";
	var url = "${path}/comm/CacheAction_recursiveUpdatePathToSyFunc.ms";
    jQuery.ajax({
	type: "POST",
    dataType: "json",
    url: url,
    data:{tableName:tableName},
	success: function(data){
			util.alert(data.ajaxCacheDto.msg);
			thisObj.disabled = false;
			thisObj.value = oldValue;
		},
		error: function(msg){
			util.alert("error:"+msg);
			thisObj.disabled = false;
			thisObj.value = oldValue;
	   }
	});
}
	
	function reloadPropertieCache(thisObj){
		if(!confirm("确认执行？")){return false;}
		fName = $("#ppsFileName").val();
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reloadPropertieCache.ms";
		util.showLoading("处理中...");
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "cacheDto.ppsFileName="+fName,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
				util.closeLoading();
			},
			error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function reLoadDictCache(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reLoadDictCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	function reLoadLangCache(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reLoadLangCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}

	function reloadPropertieAllCache(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reloadPropertieAllCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function reloadPropertieAllCacheS(thisObj){
		if(!confirm("确认执行？")){return false;}
		if(!confirm("确认清空所有应用节点缓存？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reloadPropertieAllCacheS.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function putAllViewPage(thisObj,flag){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_putAllViewPage.ms?paraMap.flag="+flag;
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				//top.util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function exeCommPageData(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		var url = "${path}/comm/CacheAction_exeCommPageData.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	
	function reloadLog4jCache(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_reloadLog4jCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function reloadAllClassCode(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		var url = "${path}/comm/CacheAction_publishClassCode.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	
	function reloadClassCode(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_publishSClassCode.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				//util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
				$("#_showComClassInfo").show();
				$("#_showComClassInfo").val(data.ajaxCacheDto.msg);
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}
	
	function editPropFile(thisObj){
		thisObj.style.background="#1E9FFF";	
		thisObj.disabled = true;
		thisObj.value = "处理中";
		var url = "${path}/comm/CacheAction_forEditPropFile.ms";
		url= url + "?pw=<c:out value='${pw}' />&cacheDto.ppsFileName="+$("#cacheDto_ppsFileName").val()+"&FUNC_CODE=<c:out value='${FUNC_CODE}' />";
		window.location.href = url;
	}
	
	function init(){
		var tableTrJs = $("#addTable tr");
		_toClickColor(tableTrJs);
	}
	
	function setPrintErrlog(thisObj){
		if(!confirm("确认执行？")){return false;}
		thisObj.disabled = true;
		var oldValue = thisObj.value;
		thisObj.value = "处理中";
		thisObj.className = "layui-btn layui-btn-normal layui-btn-xs";
		var url = "${path}/comm/CacheAction_setPrintErrlog.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){
				util.alert(data.ajaxCacheDto.msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
			},
			error: function(msg){
				util.alert("error:"+msg);
				thisObj.disabled = false;
				thisObj.value = oldValue;
				thisObj.className = "layui-btn layui-btn-xs";
		   }
		});
	}


</script>
</body>
<jsp:include page="/plf/common/pub_end.jsp" />