<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<html>
	<head>
		<title><dict:lang value="多语言配置文件修改页面" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<style>
		#main td{
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
	</style>
	</head>

	<body style="overflow:hidden">
		<div class="content-in">
	        <div class="dlist">
	            <div class="hd">
					<div class="optn">
		                  <table class="func_table">
			                  <tr>
								<td width="100%" align="right">
									<button type="button" onclick="editLang('search_form');"><i class="ico ico-save"></i><dict:lang value="语种配置" /></button>
									<bu:funOper funcNo="F4052" type="button" onclick="addAx('@{funcUrl}');" />&nbsp;<bu:funOper funcNo="F5001" type="button" onclick="updateAx('@{funcUrl}');" />&nbsp;<bu:funOper funcNo="F71" type="button" onclick="delAx();" />&nbsp;<button type="button" onclick="query('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button> 
								</td>
				    		</tr>
						</table>
				</div>
	            </div>
	            <div class="bd">
	            <div  class="search-box">
				<form id="search_form" name="search_form" action="${path}comm/CacheAction_queryLangList.ms?FUNC_CODE=F67" method="post">
				<table class="search_table">
					<tr>
						<td style="white-space: nowrap;">
							<div class="group">
								<div class="name">
						  			<dict:lang value="属性名称" />
						  		</div>
						  		<div class="dec">	
					  				<s:textfield id="paraMap_key"  cssClass="input" maxlength="300" onchange="codeJSFun(this)" value="${paraMap.key}"/>
					  			 	<input type="hidden" name="paraMap.key" id="paraMap_key_code" />
					  			</div>
					  		</div>
					  	</td>
					  	<td style="white-space: nowrap;">
					  		<div class="group">
					  			<div class="name">
						  			<dict:lang value="模块名称" />
						  		</div>
						  		<div class="dec">
						  			<s:textfield id="paraMap_moduleName"  cssClass="input" maxlength="300" onchange="codeJSFun(this)" value="${paraMap.moduleName}"/>
					  				<input type="hidden" name="paraMap.moduleName" id="paraMap_moduleName_code"/>
					  			</div>
					  		</div>
					  	</td>
					 	<td style="white-space: nowrap;">
					 		<div class="group">
					 			<div class="name">
						  			<dict:lang value="中文属性值" />
						  		</div>
						  		<div class="dec">
						  			<s:textfield id="paraMap_zhCn"  cssClass="input" maxlength="300" onchange="codeJSFun(this)"  value="${paraMap.zhCn}" />
					  				<input type="hidden" name="paraMap.zhCn" id="paraMap_zhCn_code" />
					  			</div>
					  		</div>
					  	</td>
					  	
					</tr>
					<tr>
					<td style="white-space: nowrap;">
					  		<div class="group">
					  			<div class="name">
						  			<dict:lang value="繁体属性值" />
						  		</div>
						  		<div class="dec">
						  			<s:textfield id="paraMap_zhTw"  cssClass="input" maxlength="300" onchange="codeJSFun(this)" value="${paraMap.zhTw}"/>
					  				<input type="hidden" name="paraMap.zhTw" id="paraMap_zhTw_code"/>
					  			</div>
					  		</div>
					  	</td>
						<td style="white-space: nowrap;">
							<div class="group">
								<div class="name">
						  			<dict:lang value="英文属性值" />
						  		</div>
						  		<div class="dec">
						  			<s:textfield id="paraMap_enUs"  cssClass="input" maxlength="300" onchange="codeJSFun(this)" value="${paraMap.enUs}" />
					  				<input type="hidden" name="paraMap.enUs" id="paraMap_enUs_code" />
					  			</div>
					  		</div>
					  	</td>
					</tr>
				
				</table>
		</form>
		</div>
		<s:form id="list_form" name="list_form" action="CacheAction_forEditLangFile.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="F67" />
		</s:form>
<s:form action="CacheAction_editLangFile.ms" name="edit_form" id="edit_form" method="post">
	<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="F69" />
	<s:hidden name="cacheDto.ppsFileName" />
	<div id="tableHead" style="overflow:hidden;width:100%;">
		<table id="listTable-h" class="dlist-table table-line query-list" style="width: 100%;table-layout: fixed;">
			<thead>
			<tr class="tableHead">
				<td width="40px"></td>
				<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
				<td><dict:lang value="属性名称" /></td>
				<td><dict:lang value="模块名称" /></td>
				<s:hidden id="languageCount" value="<c:out value='${keyList.size()}'/>"></s:hidden>
						<s:iterator id="key"  value="keyList" status="state">
					
							<td>
								<dict:lang value="${key}" />
							</td>
						</s:iterator>
			</tr>
			</thead>
		</table>
	</div>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="listTable" class="dlist-table query-list" style="width: 100%;table-layout: fixed;">
		<tbody  id="langLs">
			<s:iterator value="langList"  id="map" status="state">
			<tr id="col_${state.count}" >
			<input  type="hidden" id="data_col_${state.count}" value="<c:out value='${langList[state.index].col1}' />" />
			<input  type="hidden" id="data_col2_${state.count}" value="<c:out value='${langList[state.index].col2}' />" />
				<script>
				$(function(){
				
				var valStr = $("#data_col_${state.count}").val();
				var valMod = $("#data_col2_${state.count}").val();
				valStr = _mcBase64JsToJava.getMcDealBase64Encode(valStr);
				valMod = _mcBase64JsToJava.getMcDealBase64Encode(valMod);
				$("#col_${state.count}").dblclick(function(){
					   seeDetailed(valStr,valMod);
					});
				
				});
				</script>
				<s:if test="${page.currentPage==1}">
				<td style="width:40px;text-align:center;"><c:out value='${state.count}' /></td>
				</s:if>
				<s:else>
				<td style="width:40px;text-align:center;"><c:out value='${(page.currentPage-1)*page.pageRecord+state.count}' /></td>
				</s:else>
				<s:iterator value="langList[#state.index]" status="colMap" >
					<s:if test="${key=='col1'}">
						<td style="width:30px; text-align:center;" ><input type="checkbox" name="messageKey" id="subcheck" value="${state.count}" style="margin:0"></td>
						<td style="text-align:center;" title="<c:out value='${value}'/>"><c:out value='${value}'/></td>
					</s:if>
					<s:else >
						<td style="text-align:center;" title="<c:out value='${value}'/>"><c:out value='${value}'/></td>
					</s:else>
				</s:iterator>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	</div>
		
		
</s:form>

	 <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=search_form" />
  </div>
  <% }}%>
	
	<form id="del_form" name="delForm" action="${path}comm/CacheAction_delLangFileAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5033" method="post" target="submit_frame">
		<input type="hidden" id="delId" name="paraMap.delId" >
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
	</form>
	
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>
</div>
		</div>
	</div>
<script type="text/javascript">

  function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);
  		 $(objThis).next().val(langs);
  		}
  		
  		
	function initHeight(){
		$('.main').height($(parent.window).height() - 65 - 100 -  70 - 36 + 7);
	}
      
    $(window).resize(function(){  
		initHeight();	  		
	});
	var info1="<dict:lang value="处理中" />";

	var paginationImpl = {};
	
		
	function query(paginationImpl){
		util.showTopLoading();
		document.forms.search_form.submit();
	}
	function editLang(formId){
		var url="${path}/sys/LangTypeMagAction_index.ms";
		iframeId=window.name;
		showPopWinFpForSubmit(url, 1000, 470,null,"<dict:lang value="语种配置"/>","langFrame",null,formId,iframeId);
	}
	//点击行寄选中该行
		function checkboxAll(tableId){
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").attr("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").attr("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
		}
		
	function submitForm(url,thisObj){
		isReturn = false;
		$("#listTable tr").each(function (seq){
			$(this).find("INPUT").each(function (i){
				if(val.isBlank(this) && i<2){
					_alertValMsg(this, _GLO_VALIDATE_NULL_MSG2);
					isReturn = true;
					return false;
				}
			});
			if(isReturn){
				return false;
			}
		});
		utilsFp.confirmIcon(1,"","submitForms","", "<dict:lang value="确认执行" />？",1,"300","");
		
	}
	
	function submitForms(){
		document.edit_form.submit();
		thisObj.onclick = function(){utilsFp.alert("数据正在提交，请稍候...");};
		
	}

	function goBack(thisObj){
		window.location.href = "${path}/comm/CacheAction_reloadCache.ms";
		thisObj.onclick = function(){utilsFp.alert("数据正在提交，请稍候...");};
	}
	
	function edit(url,thisObj,id){
		var para = new Array(url,thisObj,id);
		utilsFp.confirmIcon(1,"","edits",para, "<dict:lang value="确认执行" />？",1,"300","");
	}
	
	function edits(para){
		//if(!utilsFp.confirmIcon(4,"","","", "<dict:lang value="确认执行" />？",1,"300","")){alert(111);return ;}
		var urls = para[0];
		var thisObj = para[1];
		var id = para[2];
		thisObj.disabled = true;
		_isAlertAuthMsg=false;
		var oldValue = thisObj.value;
		thisObj.value = info1;
		var url = "${path}comm/CacheAction_editLangFileSingle.ms?"+"&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F70";
		util.showLoading(info1+"...");
	  jQuery.ajax({
		type: "POST",
	  dataType: "json",
	  url: url,
	  data:{ 'cacheDto.ppsFileName':'<s:property value="cacheDto.ppsFileName" />','langDto.key':$("#"+id+"_key").val(),'langDto.zhCn':$("#"+id+"_zhCn").val(),'langDto.zhTw':$("#"+id+"_zhTw").val(),'langDto.enUs':$("#"+id+"_enUs").val()},
		success: function(data){
				$("#"+id+"_text").html($("#"+id+"_value").val());
				thisObj.disabled = false;
				thisObj.value = oldValue;
				utilsFp.confirmIcon(2,"","dels",para, data.ajaxCacheDto.msg,0,"300","");
				util.closeLoading();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
				util.closeLoading();
				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
				if (null != sessionstatus && sessionstatus == "noAuthority") {
				}else{
					
					utilsFp.alert("error:"+errorThrown);
				}
				thisObj.disabled = false;
				thisObj.value = oldValue;
		   }
		});
	}
	
	var allDels = [];
	function getAlldelAx(){
		allDels = []
		$("#langLs :checkbox").each(function(){
					if($(this).attr("checked")){
						var index=$(this).val();
						var keyName=$("#data_col_"+index).val();
						var modName=$("#data_col2_"+index).val();
						allDels.push({
							"keyId": keyName,
							"modId": modName
				});
					}
				});
		return JSON.stringify(allDels);
	}
  
	function delAx(){
		getAlldelAx();
		if (allDels.length==0) {
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />？",0,"300","");
		}else{
			utilsFp.confirmIcon(1,"","delAxs","", "<dict:lang value="确认删除" />？",1,"300","");
			}
	}
	
	function delAxs(){
		var delstr=_mcBase64JsToJava.getMcDealBase64Encode(getAlldelAx())
		$("#delId").val(delstr);
		document.forms.del_form.submit();
		util.closeLoading();
	}
	
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
  });
  
<%--	function del(url,thisObj,id){--%>
<%--		var para = new Array(url,thisObj,id);--%>
<%--		utilsFp.confirmIcon(4,"","dels",para, "<dict:lang value="确认执行" />？",1,"300","");--%>
<%--	}--%>
<%--	--%>
<%--	function dels(para){--%>
<%--		//if(!utilsFp.confirmIcon(4,"","","", "<dict:lang value="确认执行" />？",1,"300","")){return false;}--%>
<%--		var urls = para[0];--%>
<%--		var thisObj = para[1];--%>
<%--		var id = para[2];--%>
<%--		_isAlertAuthMsg=false;--%>
<%--		thisObj.disabled = true;--%>
<%--		var oldValue = thisObj.value;--%>
<%--		thisObj.value = info1;--%>
<%--		util.showLoading(info1+"...");--%>
<%--	  jQuery.ajax({--%>
<%--		type: "POST",--%>
<%--	    dataType: "json",--%>
<%--	    url: "${path}comm/CacheAction_delLangFile.ms?",--%>
<%--	    data:{ 'cacheDto.ppsFileName':'<s:property value="cacheDto.ppsFileName" />','langDto.key':$("#"+id+"_key").val()},--%>
<%--		success: function(data){--%>
<%--				util.closeLoading();--%>
<%--				utilsFp.confirmIcon(2,"","dels","", data.ajaxCacheDto.msg,0,"300","");--%>
<%--				//utilsFp.alert(data.ajaxCacheDto.msg);--%>
<%--				reload();--%>
<%--				thisObj.disabled = false;--%>
<%--				thisObj.value = oldValue;--%>
<%--			},--%>
<%--			error: function(XMLHttpRequest, textStatus, errorThrown){--%>
<%--				util.closeLoading();--%>
<%--				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");--%>
<%--				if (null != sessionstatus && sessionstatus == "noAuthority") {--%>
<%--				}else{--%>
<%--					--%>
<%--					utilsFp.alert("error:"+errorThrown);--%>
<%--				}--%>
<%--				thisObj.disabled = false;--%>
<%--				thisObj.value = oldValue;--%>
<%--		   }--%>
<%--		});--%>
<%--	}--%>

	var row_count=0;
	
	function addAx(url){
    	showPopWinFp(url, 430, 255,null,"<dict:lang value="新增"/>");
	}
	
	function updateAx(url){
	var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checksub == 1) {
		var index = $("input[type='checkbox'][id='subcheck']:checked").val();
		/* messageKey = messageKey.replace(/\%/g, "%25"); 
		messageKey = messageKey.replace(/\+/g, "%2B");
		messageKey = messageKey.replace(/\//g, "%2F"); 
		messageKey = messageKey.replace(/\?/g, "%3F");   
		messageKey = messageKey.replace(/\&/g, "%26");  
		messageKey = messageKey.replace(/\#/g, "%23");
		messageKey = messageKey.replace(/\"/g,"%22")
		messageKey = messageKey.replace(/\'/g, "%27") */
		var msgname = _mcBase64JsToJava.getMcDealBase64Encode($("#data_col_"+index).val());  
		var moduleName = _mcBase64JsToJava.getMcDealBase64Encode($("#data_col2_"+index).val());
		var url = url+"&paraMap.messageKey="+msgname+"&paraMap.moduleName="+moduleName;
    	showPopWinFp(url, 430, 249,null,"<dict:lang value="修改"/>");
	} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"300","");
	}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
	}
	
	}
	
	
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	
	function reloadPgExe(isCloseWin){
		util.showTopLoading();
		query("formId1");
		util.closeLoading();		
		if ("0"!=isCloseWin) {
			top.$(".dialog-close").click();
		}
	}
	
	function add(){
		
		var addTable = $('#listTable');
		var row = $("<tr></tr>");
		var td = $('<td style="width:30px;text-align:center;"></td>');
		td.append($('<span>'+row_count+'</span>'));
		row.append(td);

		td = $('<td style="padding:0"></td>');
		td.append($('<input id="langList_'+row_count+'_key" placeholder="输入属性名称" name="langList['+row_count+'].key" style="width:100%;height:100%;border:0;padding-left:5px;background-color: transparent;"/>'));
		row.append(td);
		
		td = $('<td style="padding:0"></td>');
		td.append($('<input type="text" id="langList_'+row_count+'_zhCn" placeholder="输入中文属性值" name="langList['+row_count+'].zhCn" style="width:100%;height:100%;border:0;padding-left:5px;background-color: transparent;">'));
		row.append(td);
		
		td = $('<td style="padding:0"></td>');
		td.append($('<input type="text" id="langList_'+row_count+'_zhTw" placeholder="输入繁体属性值" name="langList['+row_count+'].zhTw" style="width:100%;height:100%;border:0;padding-left:5px;background-color: transparent;">'));
		row.append(td);
		
		td = $('<td style="padding:0"></td>');
		td.append($('<input type="text" id="langList_'+row_count+'_EnUs" placeholder="输入英文属性值" name="langList['+row_count+'].EnUs" style="width:100%;height:100%;border:0;padding-left:5px;background-color: transparent;">'));
		row.append(td);
		
		td = $('<td></td>');
		td.append($('<a href="javascript:void(0);" onclick="delThisRow(this)"><dict:lang value="删除" /></a>'));
		row.append(td);
		
		addTable.append(row);
		row_count++;

		
	}
	
	function delThisRow(thisObj){
		var delSeq = $(thisObj).parent().parent().children("td").eq(0).text()-1;
		$(thisObj).parent().parent().remove();
		row_count--;
		$("#listTable tr").each(function(seq) {
			if(seq>delSeq){
				$(this).children("td").eq(0).text(seq);
			}
		});
	}
	
	function closeSub(){
		hidePopWin(true);
	}
	
	function reload(){
		var url = "${path}comm/CacheAction_forEditLangFile.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}'/>=F67";
		window.location.href = url;
	}

	function init(){
		row_count = $("#listTable tr").length + 1;
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		
		
	}
	
	$(function(){
		initHeight();
		checkboxAll("langLs");
		$('#main table').css('min-width',($('#languageCount').val() * 1 + 1) * 100 + 60)
		$('#tableHead table').css('min-width',($('#languageCount').val() * 1 + 1) * 100 + 60)
		setPopScroll('#main','#tableHead')
		
		//查询条件初始化
		if($("#paraMap_key").val()){
			$("#paraMap_key_code").val(_mcBase64JsToJava.getMcDealBase64Encode($("#paraMap_key").val()));
		}
		if($("#paraMap_zhCn").val()){
			$("#paraMap_zhCn_code").val(_mcBase64JsToJava.getMcDealBase64Encode($("#paraMap_zhCn").val()));
		}
		if($("#paraMap_zhTw").val()){
			$("#paraMap_zhTw_code").val(_mcBase64JsToJava.getMcDealBase64Encode($("#paraMap_zhTw").val()));
		}
		if($("#paraMap_moduleName").val()){
			$("#paraMap_moduleName_code").val(_mcBase64JsToJava.getMcDealBase64Encode($("#paraMap_moduleName").val()));
		}
		if($("#paraMap_enUs").val()){
			$("#paraMap_enUs_code").val(_mcBase64JsToJava.getMcDealBase64Encode($("#paraMap_enUs").val()));
		}
		
	});

		
	<%-- 显示提示信息 --%>
	if("<c:out value='${actionMessages[0]}' />" !=""){
		utilsFp.alert("<c:out value='${actionMessages[0]}' />");
	}
	function seeDetailed(id,moduleName){
		/* id = id.replace(/\%/g, "%25"); 
		id = id.replace(/\+/g, "%2B");
		id = id.replace(/\//g, "%2F"); 
		id = id.replace(/\?/g, "%3F");   
		id = id.replace(/\&/g, "%26");  
		id = id.replace(/\#/g, "%23");
		id = id.replace(/\"/g,"%22")
		id = id.replace(/\'/g, "%27") 
		id = _mcBase64JsToJava.getMcDealBase64Encode(id); */
		var url = "comm/CacheAction_showSeeLangFileAx.ms?paraMap.moduleName="+moduleName+"&paraMap.messageKey="+id;
		showPopWinFp(url, 430, 145,null,"<dict:lang value="查看"/>");
	};
	function selectAll(){   
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#D3EAFC");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	}
	
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
</body>
<jsp:include page="/plf/common/pub_end.jsp" />