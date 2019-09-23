<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp"/>
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}httpService/httpMgrAction_listModule.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编号" /></div>
								<div class ="search_value">
								<s:textfield id="module.id" name="module.id" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="module.name" name="module.name" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="8%"><dict:lang value="编号" /></th>
			<th width="10%"><dict:lang value="模块名称" /></th>
			<th width="23%"><dict:lang value="模块说明" /></th>
			<th width="5%"><dict:lang value="操作" />
				<bu:funOper funcNo="F625" type="a" href="javascript:add();" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="module" status="index">
		<tr id="<s:property value="#module.id"/>">
			<td><s:property value="#index.count"/></td>
			<td><s:property value="#module.id"/></td>
			<td class="addTd">
				<span class="addSpan">
				<s:property value="#module.name"/></span>
				<input class="addInput" style="display:none" value="<s:property value='#module.name'/>">
			</td>
			<td class="addTdDec">
				<span class="addSpanDec">
				<s:property value="#module.memo"/></span>
				<input class="addInputDec" style="display:none" value="<s:property value='#module.memo'/>">
			</td>
			<td>
				<bu:funOper funcNo="F627" type="a" href="javascript:void(0);" onclick="del('%{#module.id}');" title="%{getText('删除')}" prefix="&nbsp;" >
					<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" />
				</bu:funOper>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
function upName(input){
	if($.trim(input.val())=='') {
		input.val("");
		input.css({"border":"solid 1px red","box-shadow":"0px 0px 5px red"});
		return false;
	}
	$.ajax({
		type: "POST",
	    dataType: "json",
	    data: {
	    	"module.id":input.parents("tr").attr("id"),
	    	"module.name":input.val()	
	    },
	    url: "${path}httpService/httpMgrAction_updateModuleName.ms",
		success: function(data){
			input.hide();
			input.prev().show();
			input.prev().text(input.val());
			parent.treeFrame.tree.setItemText(data.ajaxMap.item.id,data.ajaxMap.item.name,data.ajaxMap.item.name);
		},
		error: function(msg){
		}
	});
	
}

function upDec(input) {
		$.ajax({
			type: "POST",
		    dataType: "json",
		    data:{
		    	"module.id":input.parent().parent().attr("id"),
		    	"module.memo":input.val()	
		    },
		    url: '${path}httpService/httpMgrAction_updateModuleMemo.ms',
			success: function(data){
				input.hide();
				input.prev().show();
				input.prev().text(input.val());
			},
			error: function(msg){
			}
		});
}

	

function query(thisObj){
	_pageCurrentPageObj.value="1";
	document.forms.searchForm.submit();
	thisObj.onclick = function(){util.alert(util.submit_default_info);}
	util.showTopLoading();
}

function add(){
	var countPerPage=$("#countPerPage").val();
	var trNumber=$("#listTable tbody tr").length;
	if(trNumber==countPerPage){
		
	}
	var $tr = $("<tr></tr>");
	var $td1 = $("<td></td>");
	var $td2 = $("<td ></td>");
	var $td3 = $("<td class=\"addTd\">"
		+"<span style=\"display:none\" class=\"addSpan\"></span>"	
		+"<input class=\"jsAddInput\" value=\"\">"
		+"</td>");
	var $td4 = $("<td class=\"addTdDec\">"
			+"<span class=\"addSpanDec\"></span>"	
			+"<input  class=\"addInputDec\" style=\"display:none\" value=\"\">"
			+"</td>");
	var $td5 = $("<td>&nbsp;&nbsp;</td>");
	$td1.html($("#listTable tbody tr").length+1);
	
	$tr.append($td1).append($td2).append($td3).append($td4).append($td5);
	$(".jsAddInput").die().live("blur",function(e) {
		var _this = $(this);
		if ($.trim(_this.val()) == "") {
			_this.css({"border":"solid 1px red","box-shadow":"0px 0px 5px red"});
			return;
		}
		$.ajax({
			type: "POST",
		    dataType: "json",
		    data:{
		    	'module.name':_this.val()	
		    },
		    url: "${path}httpService/httpMgrAction_addModule.ms",
			success: function(data){
				_this.hide().prev().show();
				_this.prev().text(_this.val());
				$td2.html(data.ajaxMap.item.id);
				$tr.attr("id",data.ajaxMap.item.id);
				parent.treeFrame.tree.insertNewItem("1",data.ajaxMap.item.id,data.ajaxMap.item.name);
				var $a = $tr.find("a");
				$a.unbind();
				_this.removeClass("jsAddInput").addClass("addInput");
				$a.click(function(){
					$(".addInputDec").hide();
					del(data.ajaxMap.item.id);
				});				
			},
			error: function(msg){
			}
		});
	});
	var $a = $("<a></a>");
	var $img = $("<img src='${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>'/>")
	$a.append($img);
	$a.click(function(e) {
		$tr.remove();
	});
	$td5.append($a);
	$tr.appendTo($("#listTable tbody"));
	$(".jsAddInput").focus();
	init();
}



var delId;
function del(id) {
	delId = id;
	util.confirm(delConfirm);
}

function delConfirm() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "${path}httpService/httpMgrAction_deleteModule.ms",
		data : "module.id=" + delId,
		success : function(data) {
			util.closeLoading();
			parent.treeFrame.tree.deleteItem(delId,true);
			window.document.location.reload();

		},
		error : function(msg) {
			util.closeLoading();
			util.alert("error:" + msg);
		}
	});
}

function init() {
	var tableTrJs = $("#listTable tbody tr");
	_toClickColor(tableTrJs);
	_tongLineColor(tableTrJs);
}

$(function(){
	$(".addTd").live("click",function(e){
		if(e.target.nodeName=="INPUT"){
			return;
		}
		var $span = $(this).find("span");
		if($span.is(":visible")){
			
			$span.hide();
			$span.next().show();
			$span.next().focus();
		}else{
			$span.show();
			$span.next().hide();
		}
		//editName(e.target);
	})
	
	$(".addInput").live("blur",function(e) {
		upName($(this));
	});
	
	$(".addTdDec").live("click",function(e){
		if(e.target.nodeName=="INPUT"){
			return;
		}
		
		var $span = $(this).find(".addSpanDec");
		var nameInput=$(this).prev().find(".jsAddInput").val();
		if(nameInput==""){
			return;
		}
		
			$span.hide();
			$span.next().show();
			$span.next().focus();
		//editName(e.target);
	})
	
	$(".addInputDec").live("blur",function() {
		upDec($(this));
	}); 
})
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>