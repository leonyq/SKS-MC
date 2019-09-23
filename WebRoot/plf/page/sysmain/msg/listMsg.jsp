<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="消息列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<style>
	td{
			overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
	</style>
	</head>
<body style="overflow: hidden;">
<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  <div class="optn">
                  <table class="func_table">
                  <tr>
					<td width="100%" align="right">
				    <button type="button" onclick="query('formId1');" id="searchBt"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		  			</td>
	    		</tr>
				</table>
				</div></div>

			<div class="bd">
				<div class="search-box">
					<form id="search_form" name="searchForm"
						action="${path}sys/UserAction_listUser.ms" method="post">
						<s:hidden
							name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
						<s:hidden
							name="%{@com.more.fw.core.sysfa.usermessage.model.SHOW_DEFAULT_NUMBER@SHOW_DEFAULT_NUMBER}" />
						<table class="search_table">
							<tr>
								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="消息标题" />
										</div>
										<div class="dec">
											<s:textfield id="TITLE" cssClass="input"
												cssStyle="width: 245px;" />
										</div>
									</div>
								</td>

								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="消息类型" />
										</div>
										<div class="dec">
											<dict:selectDict id="TYPE" name="TYPE"
												dictCode="MSGDTO_TYPE" cssClass="_VAL_NULL" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
										</div>
									</div>
								</td>

								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="消息内容" />
										</div>
										<div class="dec">
											<s:textfield id="TEXT" cssClass="input"
												cssStyle="width: 245px;" />
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>

				<table id="listTable-h" class="dlist-table table-line t"
					style="width: 100%;table-layout: fixed;">
					<thead>
						<tr>
							<td width="30px" style="text-align:center;"></td>
						<!-- 	<td width="30px" style="text-align:center;"><input
								type="checkbox" id="SelectAll" onclick="selectAll();"
								style="margin:0">
							</td> -->
							<td style="text-align:center;"><dict:lang value="消息标题" />
							</td>
							<td style="text-align:center;"><dict:lang value="消息类型" />
							</td>
							<td style="text-align:center;"><dict:lang value="已读标记" />
							</td>
							<td style="text-align:center;"><dict:lang value="消息内容" />
							</td>
							<td style="text-align:center;"><dict:lang value="操作" />
							</td>
						</tr>
					</thead>
				</table>
				
				<div class="main" id="main"
					style="overflow-y: auto;overflow-x: hidden;">
					<table id="listTable" class="dlist-table"
						style="width: 100%;table-layout: fixed;">
						<tbody>
						</tbody>
					</table>
				</div>

				<div class="center">
					<s:include
						value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
				</div>
			</div>


			<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>
	<br />
	
	<div style="width: 85%;" >
	<div style="width:45%;float: left;">
    <table  class="dlist-table table-line " id="roletable">

	</table>

	</div>
	
	<div style="width:45%;float: right;">
	 <table  class="dlist-table table-line " id="jobtable">
	</table>
	</div>
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
	
	 /*  $("#listTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#d3eafc");
		  }
	  }); */
	  
	//高度
	function initHeight(){
		$('.main').height($(window).height() -  35 - 127);
	 	$('#listTable').width($(window).width() - 2);
	}
	//界面初始化
	$(function(){
          $('.dept_select').chosen();
          initHeight();
          _newScroll("main");
          getListTables();
    });
    
    //界面高度初始化
    $(window).resize(function(){  
		initHeight();	  		
	});
      
    /* //选中所有，复选框。 
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	} */

	
	//获取列表table
	function getListTables(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/MsgAction_showTable.ms",
			    data: "",
				success: function(data){
						 util.closeLoading();
						if(null == data){return ;}
						$("#listTable").empty();
						if(null != data.ajaxPage.dataList){
							var msgtList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < msgtList.length; i++){
								//类型
								var type=msgtList[i].TYPE;
								if(type=="1"){type="系统公告类通知"}else if(type=="2"){type="流程处理消息"}else if(type=="3"){type="预警消息"};
								//状态
								var status=msgtList[i].STATUS;
								if(status=="1"){status="已读"}else if(status=="0"){status="未读"};
								//空
								if(msgtList[i].TITLE==null) msgtList[i].TITLE="";
								if(type==null) type="";
								if(status==null) status="";
								if(msgtList[i].TEXT==null) msgtList[i].TEXT="";
								//数据table
								$("#listTable").append("<tr id='"+msgtList[i].ID+"' </tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+msgtList[i].TITLE+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+type+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+status+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+msgtList[i].TEXT+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'><a href='javascript:void(0);' onclick=\"seeMsg('"+msgtList[i].ID+"');\" title='<dict:lang value='查看' />'><dict:lang value='查看' /></a></td>");}
							init();
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
			    url: "${path}comm/MsgAction_searchShowTable.ms",
			    data: {
			    	"TITLE" : $("#TITLE").val(),
			    	"TYPE" : $("#TYPE").val(),
			    	"TEXT" : $("#TEXT").val(),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
						util.closeLoading();
						$("#listTable").empty();
						if(null == data){return ;}
						
						if(null != data.ajaxPage.dataList){
							var msgtList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < msgtList.length; i++){
								//类型
								var type=msgtList[i].TYPE;
								if(type=="1"){type="系统公告类通知"}else if(type=="2"){type="流程处理消息"}else if(type=="3"){type="预警消息"};
								//状态
								var status=msgtList[i].STATUS;
								if(status=="1"){status="已读"}else if(status=="0"){status="未读"}
								//空
								if(msgtList[i].TITLE==null) msgtList[i].TITLE="";
								if(type==null) type="";
								if(status==null) status="";
								if(msgtList[i].TEXT==null) msgtList[i].TEXT="";
								//数据
								$("#listTable").append("<tr id='"+msgtList[i].ID+"'></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+msgtList[i].TITLE+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+type+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+status+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+msgtList[i].TEXT+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'><a href='javascript:void(0);' onclick=\"seeMsg('"+msgtList[i].ID+"');\" title='<dict:lang value='查看' />'><dict:lang value='查看' /></a></td>");}
							init();
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
		
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_tongLineColor(tableTrJs);
	};
	//查看
	function seeMsg(thisID){
		
		var url = "${path}comm/MsgAction_seeMsgData.ms?ID="+thisID;
		showPopWinFp(url, 770, 332, null, "<dict:lang value="查看"/>");
		//重新计算未读条数
		parent.showMsgCount();
		//刷新列表
		$("#searchBt").click();
	};
	
	
	
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>