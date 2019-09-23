<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="工种列表" /></title>
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
			    <bu:funOper funcNo="F631" type="button" onclick="add('@{funcUrl}');" />
			    <bu:funOper funcNo="F632" type="button" onclick="update('@{funcUrl}');" />
			    <bu:funOper funcNo="F633" type="button" onclick="del('@{funcUrl}');" />
			    <bu:funOper funcNo="F686" type="button" onclick="confAuty('@{funcUrl}');" />
			    <bu:funOper funcNo="F685" type="button" onclick="confUser('@{funcUrl}');"/>
			    <button type="button"onclick="query('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			</td>
	    		</tr>
				</table>
				</div></div>
                  
                  <div class="bd">
                      <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/JobAction_listJob.ms" method="post" onkeydown="if(event.keyCode==13){return false;}">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
	<table class="search_table">
		<tr>
			
			<td width="30%" >
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="工种名称" />
			  	<input class="input" id="jobDtoSh_jobName" name="jobDtoSh.jobName" cssClass="input_sh" maxlength="30" />
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
			<td style="text-align:center;"><dict:lang value="工种名称" /></td>
			<td style="text-align:center;"><dict:lang value="工种等级" /></td>
			<td style="text-align:center;"><dict:lang value="工种描述" /></td>
		</tr>
		</thead>
	</table>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="listTable" class="dlist-table" style="width: 100%;table-layout: fixed;">
		<tbody id="joblist">
	<s:iterator value="jobLs" status="index">
		<tr id="<c:out value='${id}'/>" ondblclick="seeDetailed('<c:out value='${id}'/>')">
			<td style="width:30px;text-align:center;"><s:property value="#index.count"/></td>
			<td style="width:30px;text-align:center;"><input type="checkbox" name="jobDtoId" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td>
			<td style="text-align:center;"><s:property value="jobName"/></td>
			<td style="text-align:center;"><s:property value="jobLevel"/></td>
			<td style="text-align:left;" ondblclick="remark(this);" title='<s:property value="remark"/>'><s:property value="remark"/></td>
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
		<input type="hidden" id="jobDtoSh_id" name="jobDtoSh.id" />
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
        getJob();
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
	function confAuty(url){
			var url = "${path}"+url;
			showPopWinFp(url, 900, 462,null,''+"<dict:lang value="权限配置" />");
		}
	function confUser(url){
			var url = "${path}"+url;
			showPopWinFp(url, 900, 462,null,''+"<dict:lang value="配置用户" />");
		}
		
	function getJob(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_getlistJob.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
							$("#joblist").empty();
						if(null != data.ajaxPage.dataList){
							var jobtList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < jobtList.length; i++){
								if (jobtList[i].JOB_LEVEL==null) {
									jobtList[i].JOB_LEVEL = "";
								}
								if (jobtList[i].REMARK==null) {
									jobtList[i].REMARK = "";
								}
								$("#joblist").append("<tr id='"+jobtList[i].ID+"' ondblclick=seeDetailed('"+jobtList[i].ID+"')>");
								$("#joblist tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#joblist tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='jobDtoId' value='"+jobtList[i].ID+"'/></td>");
								$("#joblist tr:last").append("<td style='text-align:center;' title=\""+jobtList[i].JOB_NAME+"\">"+jobtList[i].JOB_NAME+"</td>");
								$("#joblist tr:last").append("<td style='text-align:center;' title=\""+jobtList[i].JOB_LEVEL+"\">"+jobtList[i].JOB_LEVEL+"</td>");
								$("#joblist tr:last").append("<td style='text-align:left;' title=\""+jobtList[i].REMARK+"\">"+jobtList[i].REMARK+"</td></tr>");
							}
							init();
							checkboxAll("joblist");
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
		/* _pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(utilsFp.submit_default_info);} */
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_searchlistJob.ms",
			    data: {
			    	"paraMap.jobName" : $("#jobDtoSh_jobName").val(),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						$("#joblist").empty();
						if(null != data.ajaxPage.dataList){
							var jobtList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < jobtList.length; i++){
								if (jobtList[i].JOB_LEVEL==null) {
									jobtList[i].JOB_LEVEL = "";
								}
								if (jobtList[i].REMARK==null) {
									jobtList[i].REMARK = "";
								}
								$("#joblist").append("<tr id='"+jobtList[i].ID+"' ondblclick=seeDetailed('"+jobtList[i].ID+"')>");
								//$("#joblist tr:last").append("<td style='width:30px;text-align:center;'>"+$('.center #page-num').val()+"</td>");
								$("#joblist tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#joblist tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='jobDtoId' value='"+jobtList[i].ID+"'/></td>");
								$("#joblist tr:last").append("<td style='text-align:center;' title=\""+jobtList[i].JOB_NAME+"\">"+jobtList[i].JOB_NAME+"</td>");
								$("#joblist tr:last").append("<td style='text-align:center;' title=\""+jobtList[i].JOB_LEVEL+"\">"+jobtList[i].JOB_LEVEL+"</td>");
								$("#joblist tr:last").append("<td style='text-align:left;' title=\""+jobtList[i].REMARK+"\">"+jobtList[i].REMARK+"</td></tr>");
							}
							init();
							checkboxAll("joblist");
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
		checkboxAll("joblist");
		
	}

	function add(url){
    showPopWinFp(url, 405, 225,null,"<dict:lang value="新增" />");
	}
	
	function update(url,id){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var id = $("input[type='checkbox'][id='subcheck']:checked").val();
    		showPopWinFp(url+"&jobDtoSh.id="+id, 405, 220,null,"<dict:lang value="修改" />");
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
		text = $("input:checkbox[name='jobDtoId']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(',');
		if (text != null && text != "") {
			var paramObj =new Object;
			paramObj.url = url;
			paramObj.id = text;
			utilsFp.confirmIcon(1,"","delConfirm",paramObj, "<dict:lang value="确认删除选中的工种吗" />",1,"300","");
			//utilsFp.confirm(delConfirm,"",paramObj);
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
	}
	
	function delConfirm(paramObj){
    	document.forms.submit_form.action=paramObj.url;
		$("#jobDtoSh_id").val(paramObj.id);
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