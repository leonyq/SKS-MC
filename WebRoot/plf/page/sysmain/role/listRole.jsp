<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="角色列表" /></title>
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
			    <bu:funOper funcNo="F44" type="button" onclick="add('@{funcUrl}');"/>
			    <bu:funOper funcNo="F40" type="button" onclick="update('@{funcUrl}');"/>
			    <bu:funOper funcNo="F41" type="button" onclick="del('@{funcUrl}');" />
			    <bu:funOper funcNo="F42" type="button" onclick="confAuty('@{funcUrl}');"/>
			    <bu:funOper funcNo="F5097" type="button" onclick="kpiCollocation('@{funcUrl}');"/>
			    <bu:funOper funcNo="F12010" type="button" onclick="appConfigure('@{funcUrl}');"/>
			    <%-- <bu:funOper funcNo="F43" type="button" onclick="confUser('@{funcUrl}');" /> --%>
			    <bu:funOper funcNo="F665" type="button" onclick="confUser2('@{funcUrl}');" />
			    <button type="button"onclick="query('formId1');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			</td>
	    		</tr>
				</table>
				</div></div>
                  
                  <div class="bd">
                      <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/RoleAction_listRole.ms" method="post" onkeydown="if(event.keyCode==13){return false;}">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<table class="search_table">
		<tr>
			
			<td width="30%" style="white-space: nowrap;">
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="角色名称" />
			  	<input class="input" id="roleDtoSh_name" name="roleDtoSh.name" cssClass="input_sh" maxlength="30" />
		  	</td>
			
	    </tr>
	</table>
	</form>
	</div>
	
    <table id="listTable-h" class="dlist-table table-line" style="width: 100%;margin-top: 10px;table-layout: fixed;">
		<thead>
		<tr class="tableHead">
			<td style="width:30px;"></td>
			<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0;"></td>
			<td style="text-align:center;"><dict:lang value="角色名称" /></td>
			<td style="text-align:center;"><dict:lang value="角色描述" /></td>
		</tr>
		</thead>
	</table>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="listTable" class="dlist-table " style="width: 100%;table-layout: fixed;">
		<tbody id="rolelist">
	<s:iterator value="roleLs" status="index">
		<tr id="<c:out value='${id}' />" ondblclick="seeDetailed('<c:out value='${id}' />')">
			<td style="width:30px;text-align:center;"><s:property value="#index.count"/></td>
			<td style="width:30px;text-align:center;"><input type="checkbox" name="roleDtoId" id="subcheck" value="<c:out value='${id}' />" style="margin:0;"></td>
			<td style="text-align:center;"><s:property value="name"/></td>
			<td style="text-align:left;" title='<s:property value="remark"/>'><s:property value="remark"/></td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	
	<div class="center">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
		
	</div>
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="roleDtoSh_id" name="roleDtoSh.id" />
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
			$("#"+trId).css("background-color","#d3eafc");
		}
	});
	
	  $("#listTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#d3eafc");
		  }
	  });

	

	function initHeight(){
		$('.main').height($(window).height() -  35 - 127);

	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
          $('.dept_select').chosen();
          initHeight();
          _newScroll("main");
          getRole();
    });
      
    $(window).resize(function(){  
		initHeight();	  		
	});
      	function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
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
	function getRole(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/RoleAction_getlistRole.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						$("#rolelist").empty();
						if(null != data.ajaxPage.dataList){
							var roleList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < roleList.length; i++){
								if (roleList[i].REMARK==null) {
									roleList[i].REMARK = "";
								}
								$("#rolelist").append("<tr id='"+roleList[i].ID+"' ondblclick=seeDetailed('"+roleList[i].ID+"')></tr>");
								$("#rolelist tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#rolelist tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='roleDtoId' value='"+roleList[i].ID+"'/></td>");
								$("#rolelist tr:last").append("<td style='text-align:center;' title=\""+roleList[i].NAME+"\">"+roleList[i].NAME+"</td>");
								$("#rolelist tr:last").append("<td style='text-align:left;' title=\""+roleList[i].REMARK+"\">"+roleList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("rolelist");
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
			    url: "${path}sys/RoleAction_searchlistRole.ms",
			    data: {
			    	"paraMap.roleName" : $("#roleDtoSh_name").val(),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						$("#rolelist").empty();
						if(null != data.ajaxPage.dataList){
							var roleList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < roleList.length; i++){
								if (roleList[i].REMARK==null) {
									roleList[i].REMARK = "";
								}
								$("#rolelist").append("<tr id='"+roleList[i].ID+"' ></tr>");
								$("#rolelist tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#rolelist tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='roleDtoId' value='"+roleList[i].ID+"'/></td>");
								$("#rolelist tr:last").append("<td style='text-align:center;' title=\""+roleList[i].NAME+"\">"+roleList[i].NAME+"</td>");
								$("#rolelist tr:last").append("<td style='text-align:left;' title=\""+roleList[i].REMARK+"\">"+roleList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("rolelist");
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
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
		
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
    showPopWinFp(url, 375, 205,null,"<dict:lang value="新增" />");
	}
	
	function kpiCollocation(url){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
	    	showPopWinFp(url+"&dataId="+id, 730, 450,null,"<dict:lang value="KPI配置" />");
		} else if(checksub == 0){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	
	function appConfigure(url){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
	    	showPopWinFp(url+"&dataId="+id, 730, 450,null,"<dict:lang value="APP配置" />");
		} else if(checksub == 0){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	
	function seeDetailed(id){
		var url = "sys/RoleAction_showSeeRole.ms?roleDtoSh.id="+id;
		showPopWinFp(url, 375, 160,null,"<dict:lang value="查看"/>");
	}
	
	function update(url){
	var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checksub == 1) {
		var id = $("input[type='checkbox'][id='subcheck']:checked").val();
    	showPopWinFp(url+"&roleDtoSh.id="+id, 375, 200,null,"<dict:lang value="修改" />");
	} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
	}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
	}
	}

	function del(url){
		text = $("input:checkbox[name='roleDtoId']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(',');
		if (text != null && text != "") {
			var paramObj =new Object;
			paramObj.url = url;
			paramObj.id = text;
			utilsFp.confirmIcon(1,"","delConfirm",paramObj, "<dict:lang value="确认删除选中的角色吗" />",1,"300","");
			//utilsFp.confirm(delConfirm,"",paramObj);
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
	}
	
	function delConfirm(paramObj){
    	document.forms.submit_form.action=paramObj.url;
		$("#roleDtoSh_id").val(paramObj.id);
		document.forms.submit_form.submit();
	}
	
	function confAuty(url){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
			var url = url+"&roleDto.id="+id;
    		showPopWinFp(url, 500, 580,null,''+"<dict:lang value="权限配置" />");
		} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	
	function confUser(url,id){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
			var url = "${path}"+url+"&roleDto.id="+id+"&userDtoSh.roleId="+id;
			window.open(url);
		} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	function confUser2(url){
			var url = "${path}"+url;
			showPopWinFp(url, 900, 452,null,''+"<dict:lang value="配置用户" />");
		}
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	
	function newScroll(id){   
	 	$("#" + id).mCustomScrollbar({
		    axis:"yx",
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:80,
	  	});
	}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>