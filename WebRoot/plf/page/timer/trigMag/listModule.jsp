<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head> 
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		 
		 .addInput {
			width:100%; 
			height:25px;
			border:solid 1px red;
			box-shadow:0px 0px 5px #5FB878;
			display:none;
		}
		
		.addInputDec {
			width:100%; 
			height:25px;
			border:solid 1px red;
			box-shadow:0px 0px 5px #5FB878;
			display:none;
		}
		
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/trigMagAction_queryListModule.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
				<table class="search_table">
					<tr>
						<!--
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
								<s:textfield id="module.moduleName" name="module.moduleName" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
						  -->
						  <td >
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="编号" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="module.id" name="module.id" cssClass="input_sh"
							 maxlength="33"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
					  	
					  	<div class="search_table_wrap">
				         <span><dict:lang value="模块名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="module.moduleName" name="module.moduleName"
							cssClass="input_sh" maxlength="300"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>
	
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				            <input type="button" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     
						     <bu:funOper cssClass="layui-btn" funcNo="F143" type="a" href="javascript:add();" >新增</bu:funOper>
						     
				          </div>
				        </div>
					  	
					  	</td>
					</tr>
				</table>
	</form>
	
	<div class="table_div mc-table-container">
			<!-- left start -->
			<div class="mc-table-left" style="padding-right: 80px;">
				<!-- left content start -->
				<div class="mc-table-left-content">
    <table id="listTable" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th style="width:40px;"><dict:lang value="序号" /></th>
			<th style="width:200px;"><dict:lang value="编号" /></th>
			<th style="width:200px;"><dict:lang value="模块名称" /></th>
			<th ><dict:lang value="模块说明" /></th>
			
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="module" status="index">
		<tr id="<s:property value="#module.id"/>">
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="#module.id"/>"><s:property value="#module.id"/></td>
			<td class="addTd" title="<s:property value="#module.moduleName"/>">
				<span class="addSpan">
				<s:property value="#module.moduleName"/></span>
				<input class="addInput" style="display:none" value="<s:property value='#module.moduleName'/>">
			</td>
			<td class="addTdDec" title="<s:property value="#module.dec"/>">
				<span class="addSpanDec">
				<s:property value="#module.dec"/></span>
				<input class="addInputDec" style="display:none" value="<s:property value='#module.dec'/>">
			</td>
			
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	
	<!-- right start -->
			<div class="mc-table-right" style="width: 80px;">
				<table  class="table_list">
					<thead>
					<tr class="tdcolor">
						<th style="width:40px;"><dict:lang value="操作" />
						</th>
					</tr>
					</thead>
					<tbody id="table_list_tbody">
						<s:iterator value="page.dataList" id="module" status="index">
						<tr >
							<td style="height:27px;">
								<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-xs" onclick="del('<s:property value="id"/>');" title="<dict:lang value="删除" />"  prefix="&nbsp;">删除</a>
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
var flagAdd = false;
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
	    	"module.moduleName":input.val()	
	    },
	    url: "${path}sys/trigMagAction_updateModuleName.ms",
		success: function(data){
			input.hide();
			input.prev().show();
			input.prev().text(input.val());
			
			//parent.treeFrame.tree.setItemText(data.ajaxMap.item.id,data.ajaxMap.item.moduleName,data.ajaxMap.item.moduleName);
			var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
			var node = treeObj.getNodeByParam("id", data.ajaxMap.item.id, null);
			node.name = data.ajaxMap.item.moduleName;
			treeObj.updateNode(node);
			
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
		    	"module.dec":input.val()	
		    },
		    url: '${path}sys/trigMagAction_updateModuleDec.ms',
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
	//_pageCurrentPageObj.value="1";
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
		+"<input class=\"jsAddInput\" maxlength=\"16\" style=\"width:100%; height:25px;\" value=\"\">"
		+"</td>");
	var $td4 = $("<td class=\"addTdDec\">"
			+"<span class=\"addSpanDec\"></span>"	
			+"<input maxlength=\"32\" class=\"addInputDec\" style=\"display:none\" value=\"\">"
			+"</td>");
	//var $td5 = $("<td></td>");
	if(flagAdd){
		util.alert("<dict:lang value="请填写模块名称" />...");
		return ;
	}
	var curIndex = $("#listTable tbody tr").length+1;
	$td1.html(curIndex);
	
	$tr.append($td1).append($td2).append($td3).append($td4);//.append($td5);
	$(".jsAddInput").die().live("blur",function(e) {
		var _this = $(this);
		if ($.trim(_this.val()) == "") {
			_this.css({"border":"solid 1px red","box-shadow":"0px 0px 5px red"});
			flagAdd=true;
			return;
		}
		$.ajax({
			type: "POST",
			async:false,
		    dataType: "json",
		    data:{
		    	'module.moduleName':_this.val()	
		    },
		    url: '${path}sys/trigMagAction_addModule.ms',
			success: function(data){
			
			var tdNo = $(_this).parent().parent().find("td").eq(0).html();
			
				_this.hide().prev().show();
				_this.prev().text(_this.val());
				if(data.ajaxMap.msg!=null){
					util.alert(data.ajaxMap.msg);
				}else{
				$td2.html(data.ajaxMap.item.id);
				$tr.attr("id",data.ajaxMap.item.id);
				
				//parent.treeFrame.tree.insertNewItem("1",data.ajaxMap.item.id,data.ajaxMap.item.moduleName);
				var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
				var par_node = treeObj.getNodeByParam("id", "0", null);
				
				var newNode = {id:data.ajaxMap.item.id,name:data.ajaxMap.item.moduleName,iconClose:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-close.png",
						iconOpen:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-open.png",icon:"plf/js/zTree/css/zTreeStyle/img/diy/ico-right-last.png"};
				var newNode = treeObj.addNodes(par_node, newNode);
		
				var $a = $tr.find("a");
				$a.unbind();
				_this.removeClass("jsAddInput").addClass("addInput");
				$(".addInputDec").live("blur",function(e) {
					var _this = $(this);
					$.ajax({
						type: "POST",
					    dataType: "json",
					    data:{
					    	"module.id":_this.parent().parent().attr("id"),
					    	"module.dec":_this.val()	
					    },
					    url: '${path}sys/trigMagAction_updateModuleDec.ms',
						success: function(data){
							_this.hide().prev().show();
							_this.prev().text(_this.val());
							_this.unbind();
						},
						error: function(msg){
						}
					});
				});
				 $a.click(function(){
					$(".addInputDec").hide();
					
					del(data.ajaxMap.item.id);
				});
				$("#oper"+tdNo).click(function(){
					$(".addInputDec").hide();
					
					del(data.ajaxMap.item.id);
				}); 
				flagAdd=false;
				}					
			},
			error: function(msg){
			}
		});
	});
	var $a = $('<a class="layui-btn layui-btn-danger layui-btn-xs"  title="<dict:lang value="删除" />"  >删除</a>');
	//var $img = $("<img src='${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>'/>")
	//$a.append($img);
	$a.click(function(e) {
		$tr.remove();
	});
	//$td5.append($a);
	var $td5='<tr><td style="height:27px;">'+
	'<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-xs" id="oper'+curIndex+'"  title="<dict:lang value="删除" />"  prefix="&nbsp;">删除</a>'+
	'</td></tr>';
	$("#table_list_tbody").append($td5);
	$tr.appendTo($("#listTable tbody"));
	$(".jsAddInput").focus();
	init();
}



var delId;
function del(id) {
if(id){
delId = id;
	top.util.confirmall(delConfirm);
}
	
}

function delConfirm() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : '${path}sys/trigMagAction_deleteModule.ms',
		data : "module.id=" + delId,
		success : function(data) {
			if(data.ajaxMap.status=='false'){
				util.alert(data.ajaxMap.info);
				return;
			}
			util.closeLoading();
			
			//parent.treeFrame.tree.deleteItem(delId,true);
			var treeObj = parent.treeFrame.$.fn.zTree.getZTreeObj("index_tree");
			var node = treeObj.getNodeByParam("id", delId, null);
			treeObj.removeNode(node);
			
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