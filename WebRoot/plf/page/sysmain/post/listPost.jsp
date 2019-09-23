<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="岗位管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	</head>
<body>

<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  <div class="optn">
                  <table class="func_table">
                  <tr>
				<td width="100%" align="right">
			    <button type="button"  onclick="add('sys/PostMgrAction_showAddPost.ms');"><i class="ico ico-kl"></i><dict:lang value="新增" /></button>
			    <button type="button"  onclick="update('sys/PostMgrAction_showUpPost.ms');"><i class="ico ico-xg"></i><dict:lang value="修改" /></button>
			    <button type="button"  onclick="del('sys/PostMgrAction_delPost.ms');"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
			    <button type="button"  onclick="confPost('sys/PostMgrAction_showConfPost.ms');" style="max-width: 135px;"><i class="ico ico-kl"></i><dict:lang value="设置部门岗位" /></button>
			   
			    <button type="button"onclick="query('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			</td>
	    		</tr>
				</table>
				</div></div>
                  
                  <div class="bd">
                      <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/JobAction_listJob.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<table class="search_table">
		<tr>
			
			<td width="30%" >
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="岗位名称" />
			  	<input class="input" id="postName"  cssClass="input_sh" maxlength="30" />
		  	</td>
			
	    </tr>
	</table>
	</form>
	</div>
	
    <table id="listTable-h" class="dlist-table table-line" style="margin-top: 10px;width: 100%;table-layout: fixed;">
		<thead>
		<tr class="tableHead">
			<td width="30px"></td>
			<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			<td style="text-align:center;"><dict:lang value="岗位名称" /></td>
			<td style="text-align:center;"><dict:lang value="岗位描述" /></td>
		</tr>
		</thead>
	</table>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="listTable" class="dlist-table" style="width: 100%;table-layout: fixed;">
		<tbody id="postlist">
	
		</tbody>
	</table>
	</div>
	
	<div class="center">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
	</div>
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="postDtoSh_id" name="paraMap.id" />
	</form>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>
	</div>
	</div>

<script type="text/javascript">

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

	//双击显示备注详情
	function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}
	  
	
	function initHeight(){
		$('.main').height($(window).height() -  35 - 127);
	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
        $('.dept_select').chosen();
        initHeight();
        _newScroll("main");
        query('formId1');
    });
    
    $(window).resize(function(){  
		initHeight();	  		
	});
    
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	}
	
	function confPost(url){
			var url = "${path}"+url;
			showPopWinFp(url, 950, 462,null,''+"<dict:lang value="设置部门岗位" />",'confPostFpId');
		}
		
	
var paginationImpl = {};
	function query(paginationImpl){
		
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/PostMgrAction_searchList.ms",
			    data: {
			    	"paraMap.postName" : $("#postName").val(),
			    	"ajaxPage.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"ajaxPage.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						$("#postlist").empty();
						if(data.ajaxMap.errmsg!=null)
				        {
				          utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
				        }
						if(null != data.ajaxPage.dataList){
							var posttList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < posttList.length; i++){
								
								if (posttList[i].description==null) {
									posttList[i].description = "";
								}
								$("#postlist").append("<tr id='"+posttList[i].id+"' ondblclick=seeDetailed('"+posttList[i].id+"')>");
								//$("#postlist tr:last").append("<td style='width:30px;text-align:center;'>"+$('.center #page-num').val()+"</td>");
								$("#postlist tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#postlist tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='postId' value='"+posttList[i].id+"'/></td>");
								$("#postlist tr:last").append("<td style='text-align:center;' title=\""+posttList[i].name+"\">"+posttList[i].name+"</td>");
								$("#postlist tr:last").append("<td style='text-align:left;' title=\""+posttList[i].description+"\">"+posttList[i].description+"</td></tr>");
							}
							init();
							checkboxAll("postlist");
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
		//点击行寄选中该行
		function checkboxAll(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
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
	
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	
	function reloadPgExe(isCloseWin){
		/* document.forms.search_form.submit();
		util.showTopLoading(); */
		query("formId1");
		if ("0"!=isCloseWin) {
			top.$(".dialog-close").click();
		}
		checkboxAll("postlist");
		
	}

	function add(url){
    showPopWinFp(url, 405, 225,null,"<dict:lang value="新增" />");
	}
	
	function update(url,id){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
			var $tr=$("input[type='checkbox'][id='subcheck']:checked").parents('tr');
			var name=$tr.find('td').eq(2).text();
			var remark=$tr.find('td').eq(3).text();
    		showPopWinFp(url+"?paraMap.name="+name+"&paraMap.id="+id+"&paraMap.remark="+remark, 405, 220,null,"<dict:lang value="修改" />");
		} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	
	function seeDetailed(id){
		var url = "sys/JobAction_showSeeJob.ms?jobDtoSh.id="+id;
		showPopWinFp(url, 405, 180,null,"<dict:lang value="查看"/>");
	}

	function del(url){
		text = $("input:checkbox[name='postId']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(';');
		if (text != null && text != "") {
			var paramObj =new Object;
			paramObj.url = url;
			paramObj.id = text;
			utilsFp.confirmIcon(1,"","delConfirm",paramObj, "<dict:lang value="确认删除选中的岗位吗" />",1,"300","");
			//utilsFp.confirm(delConfirm,"",paramObj);
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
	}
	
	function delConfirm(paramObj){
    	document.forms.submit_form.action=paramObj.url;
		$("#postDtoSh_id").val(paramObj.id);
		document.forms.submit_form.submit();
	}
	
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	

</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>