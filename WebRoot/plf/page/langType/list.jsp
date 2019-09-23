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
		
		<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	</head>

	<body style="overflow:hidden">
		<div class="content-in">
	        <div class="dlist">
	            <div class="hd" style="margin-top:5px">
					<div class="optn" style="top:5px;">
		                  <table class="func_table">
			                  <tr>
								<td width="100%" align="right">
									<%-- <button type="button" onclick="submitForm('@{funcUrl}',this);"><i class="ico ico-search-new"></i><dict:lang value="保存" /></button> --%>
									<button type="button" onclick="add();"><i class="ico ico-kl"></i><dict:lang value="新增" /></button>
									<button type="button" onclick="update();"><i class="ico ico-xg"></i><dict:lang value="修改" /></button>
									<button type="button" onclick="delAx();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
						    		<button type="button" onclick="query();"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						    		<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
					
								</td>
				    		</tr>
						</table>
				</div>
	            </div>
	            <div class="bd" style="height:450px;">
	            <div  class="search-box">
				<form id="search_form" name="search_form" action="${path}sys/LangTypeMagAction_query.ms" method="post">
				<table class="search_table">
					<tr>
						<td style="white-space: nowrap;">
							<div class="group">
								<div class="name">
						  			<dict:lang value="语种名称" />
						  		</div>
						  		<div class="dec">	
					  				<s:textfield id="lanNameSh" name="lanNameSh" cssClass="input" maxlength="100"/>
					  			</div>
					  		</div>
					  	</td>
					 	<td style="white-space: nowrap;">
					 		<div class="group">
					 			<div class="name">
						  			<dict:lang value="语种英文名称" />
						  		</div>
						  		<div class="dec">
						  			<s:textfield id="lanEnNameSh" name="lanEnNameSh" cssClass="input" maxlength="100"/>
					  			</div>
					  		</div>
					  	</td>
					</tr>
				</table>
		</form>
		</div>
		<s:form id="list_form" name="list_form" action="LangTypeMagAction_query.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="F67" />
		</s:form>
<s:form action="LangTypeMagAction_query.ms" name="edit_form" id="edit_form" method="post">
	<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="F69" />
	<s:hidden name="cacheDto.ppsFileName" />
	
	<table id="listTable-h" class="dlist-table table-line query-list" style="width: 1000;table-layout: fixed;">
		<thead>
		<tr class="tableHead">
			<td width="30px"></td>
		<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			<td style="width:100px;"><dict:lang value="语种名称" /></td>
			<td style="width:150px;"><dict:lang value="语种展示名称" /></td>
			<td style="width:150px;"><dict:lang value="语种英文名称" /></td>
			<td style="width:150px;"><dict:lang value="语种代码" /></td>
			<td style="width:150px;"><dict:lang value="语种key" /></td>
			<td style="width:150px;"><dict:lang value="创建时间" /></td>
		</tr>
		</thead>
	</table>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;height:309px;">
    <table id="listTable" class="dlist-table query-list" style="width: 1000;table-layout: fixed;">
		<tbody  id="langLs">
			<c:forEach items="${langTypeList}" var="ls" varStatus="index">
				<tr id="<c:out value='${ls.id}'/>" >	
				<s:if test="${page.currentPage==1}">
				<td style="width:30px;text-align:center;"><c:out value='${index.count}'/></td>
				</s:if>
				<s:else>
				<td style="width:30px;text-align:center;"><c:out value='${(page.currentPage-1)*page.pageRecord+index.count}' /></td>
				</s:else>
					<td style="width:30px; text-align:center;"><input type="checkbox" name="typeId" id="subcheck" value="<c:out value='${ls.id}'/>" style="margin:0"></td>
					<td style="width:100px;text-align:center;"><c:out value='${ls.languageName}'/><s:property value="languageName"/></td>
					<td style="width:150px;text-align:center;"><c:out value='${ls.languageShowName}'/><s:property value="languageShowName"/></td>
					<td style="width:150px;text-align:center;"><c:out value='${ls.languageEnName}'/><s:property value="languageEnName"/></td>
					<td style="width:150px;text-align:center;"><c:out value='${ls.languageCode}'/><s:property value="languageEnName"/></td>
					<td style="width:150px;text-align:center;"><c:out value='${ls.languageKey}'/><s:property value="languageKey"/></td>
					<td style="width:150px;text-align:center;"><c:out value='${ls.showDate}'/><s:property value="showDate"/></td>
					
				</tr>
			</c:forEach>
			
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
	
	
	<form id="del_form" name="delForm" action="${path}sys/LangTypeMagAction_delLangType.ms" method="post" target="submit_frame">
		 <input type="hidden" id="delId" name="paraMap.delId" >
	</form>
	
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>
</div>
		</div>
	</div>
<script type="text/javascript">
	var isDel=true;
	var info=null;
	
   
	var paginationImpl = {};
	function add(){
		var url="${path}/sys/LangTypeMagAction_toAdd.ms";
		showPopWinFp(url, 450, 300,null,"<dict:lang value="语种新增"/>","addLangFrame");
	}
	function query(){
			util.showTopLoading();
			document.forms.search_form.submit();
	}
	function reloadIframe(){
		window.location.reload();
		window.parent.closePopWinFp('addLangFramepop');
		window.parent.closePopWinFp('updateLangFramepop');
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
		
	
	function delAx(){
		getAlldelAx();
		if(!isDel){
			utilsFp.confirmIcon(3,"","","", info,"","260","145");
			return;
		}
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
	var allDels = [];
	function getAlldelAx(){
		isDel=true;
		allDels = [];
		$("#langLs :checkbox").each(function(){
					if(isDel==false){
						return false;
					}
					if($(this).attr("checked")){
						allDels.push({
							delId: $(this).val()
						});
						$.ajax({
							type : "POST",
							async : false,
							dataType : "json",
							url : "${path}sys/LangTypeMagAction_queryDel.ms?",
							data : {
								'paraMap.id' :$(this).val()
							},
							success : function(data) {
								if (data.ajaxMap.status == "false") {
									isDel=false;
									info=data.ajaxMap.info;
									return false;
								}else{
									isDel=true
									return false;
								}
							},
							error : function(msg) {
								isNoInit = true;
								if (isNoInit) {
									util.closeLoading();
								}
								utilsFp.confirmIcon("3", "", "", "", "error:" + msg, "", 320,
										150);
							}

						});
					}
				});
		return JSON.stringify(allDels);
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
  

	var row_count=0;
	
	function update(){
		var url="${path}sys/LangTypeMagAction_toUpdate.ms";
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var updateId = $("input[type='checkbox'][id='subcheck']:checked").val();
			var url = url+"?paraMap.updateId="+updateId;
	    	showPopWinFp(url, 400, 250,null,"<dict:lang value="修改"/>",'updateLangFrame');
		} else if(checksub == 0){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"300","");
		}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	
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
		
        _newScroll("main");
        checkboxAll("langLs");
	});
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