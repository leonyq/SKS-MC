<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="业务查询" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	</head>
<body style="overflow: hidden;">
<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  <div class="optn">
                  <table class="func_table">
                  <tr>
					<td width="100%" align="right">
				    <button type="button" onclick="query('formId1');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
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
											<dict:lang value="表名" />
										</div>
										<div class="dec">
											<s:textfield id="tableName" cssClass="input"
												cssStyle="width: 248px;" />
										</div>
									</div>
								</td>

								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="表描述" />
										</div>
										<div class="dec">
											<s:textfield id="tableDes" cssClass="input"
												cssStyle="width: 248px;" />
										</div>
									</div>
								</td>

								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="字段名" />
										</div>
										<div class="dec">
											<s:textfield id="columnName" cssClass="input"
												cssStyle="width: 248px;" />
										</div>
									</div>
								</td>
							</tr>
							<tr>

								<td style="white-space: nowrap;">
									<div class="group">
										<div class="name">
											<dict:lang value="字段描述" />
										</div>
										<div class="dec">
											<s:textfield id="columnDes" cssClass="input"
												cssStyle="width: 248px;" />
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>

				<table id="listTable-h" class="dlist-table table-line"
					style="width: 100%;table-layout: fixed;">
					<thead>
						<tr>
							<td width="30px" style="text-align:center;"></td>
							<td width="30px" style="text-align:center;"><input
								type="checkbox" id="SelectAll" onclick="selectAll();"
								style="margin:0">
							</td>
							<td style="text-align:center;"><dict:lang value="表名" />
							</td>
							<td style="text-align:center;"><dict:lang value="表描述" />
							</td>
							<td style="text-align:center;"><dict:lang value="字段名" />
							</td>
							<td style="text-align:center;"><dict:lang value="字段描述" />
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
		$('.main').height($(window).height() -  78 - 127);
	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
          $('.dept_select').chosen();
          initHeight();
          _newScroll("main");
          getListTables();
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

	
	
	function getListTables(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/TablesAction_getListTables.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						$("#listTable").empty();
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
							
								$("#listTable").append("<tr id='"+usertList[i].ID+"' </tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+usertList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].TABLENAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].TABLEDES+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].COLUMNNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].COLUMNDES+"</td>");}
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
			    url: "${path}sys/TablesAction_searchlistTables.ms",
			    data: {
			    	"tableName" : _mcBase64JsToJava.getMcDealBase64Encode($("#tableName").val()),
			    	"tableDes" : _mcBase64JsToJava.getMcDealBase64Encode($("#tableDes").val()),
			    	"columnName" :_mcBase64JsToJava.getMcDealBase64Encode($("#columnName").val()) ,
			    	"columnDes" : _mcBase64JsToJava.getMcDealBase64Encode($("#columnDes").val()),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				
						util.closeLoading();
						$("#listTable").empty();
						if(null == data){return ;}
						
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
								if(usertList[i].TABLENAME==null) usertList[i].TABLENAME="";
								if(usertList[i].TABLEDES==null) usertList[i].TABLEDES="";
								if(usertList[i].COLUMNNAME==null) usertList[i].COLUMNNAME="";
								if(usertList[i].COLUMNDES==null) usertList[i].COLUMNDES="";
								
								$("#listTable").append("<tr id='"+usertList[i].ID+"'></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+usertList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].TABLENAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].TABLEDES+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].COLUMNNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].COLUMNDES+"</td>");}
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
	}
	


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>