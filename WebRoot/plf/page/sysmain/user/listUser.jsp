<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="用户信息列表" /></title>
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
				    <bu:funOper funcNo="F24" type="button" onclick="add('@{funcUrl}');" />
				    <bu:funOper funcNo="F25" type="button" onclick="update('@{funcUrl}');" />
				    <bu:funOper funcNo="F26" type="button" onclick="del('@{funcUrl}');" />
				    <bu:funOper funcNo="F637" type="button" onclick="adds('@{funcUrl}');" />
				    <bu:funOper funcNo="F5095" type="button" onclick="see('@{funcUrl}');" />
				    <button type="button" onclick="query('formId1',null,'');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		  			</td>
	    		</tr>
				</table>
				</div></div>
                  
                  <div class="bd">
                      <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/UserAction_listUser.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<s:hidden name="%{@com.more.fw.core.sysfa.usermessage.model.SHOW_DEFAULT_NUMBER@SHOW_DEFAULT_NUMBER}" />
	<table class="search_table">
		<tr>
		  <!-- //人员、角色、功能、部门表中增加组织机构字段及功能改造 -->
		  <s:if test="${isEnableAuth==1}">
		  	<td style="white-space: nowrap;">
	  	    	&#x3000;<dict:lang value="组织机构" />
                <s:if test="${fn:length(deptLs_auth)==1}">
               		<s:select list="deptLs_auth" listKey="id" listValue="name"  
               		name="dept_auth" id="dept_auth" 
               		cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
               	</s:if>
               	
               	<s:else>
	            	<s:select list="deptLs_auth" headerKey="" headerValue='--%{getText("请选择")}--' 
					listKey="id" listValue="name"  
					name="dept_auth" id="dept_auth"  
					cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
 			    </s:else>
 			
		    </td>
		  </s:if>
		  
		  <td style="white-space: nowrap;">
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="员工编号" />
			  	<s:textfield id="loginName" name="userDtoSh.loginName" cssClass="input" maxlength="120"/>
		  </td>
		  <td style="white-space: nowrap;"> 
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="员工姓名" />
			  	<s:textfield id="name" name="userDtoSh.name" cssClass="input" maxlength="30"/>
		  </td>
		  <td style="white-space: nowrap;">
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="所属部门" />
			  	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="levleName"  id="deptId" name="userDto.deptId" 
					cssStyle="width: 200px;" cssClass="dept_select"/> 
			  	<%-- <s:textfield id="deptId" name="userDtoSh.deptName" cssClass="input" maxlength="120" /> --%>
		  </td>
	    </tr>
	</table>
	</form>
	</div>
	
	<!--  
    <table id="listTable-h" class="dlist-table table-line" style="width: 100%;margin-top: 10px;table-layout: fixed;" >
		<thead>
		<tr>
			<td width="30px" style="text-align:center;"></td>
			<td width="30px" style="text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			
			<td style="text-align:center;">
				<dict:lang value="员工编号" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'LOGIN_NAME');" id="sort_img_LOGIN_NAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="员工姓名" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'NAME');" id="sort_img_NAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="所属部门" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'DEPTNAME');" id="sort_img_DEPTNAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="状态" />&#x3000;
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'ENABLE');" id="sort_img_ENABLE">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="分类 " />&#x3000;
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'USER_TYPE');" id="sort_img_USER_TYPE">
			</td>
			
			<td style="text-align:center;"><dict:lang value="重置密码" /></td>
		</tr>
		</thead>
	</table>
	-->
	</br>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
    <table id="listTable" class="dlist-table  table-line resizable-table" style="width: 100%;table-layout: fixed;" >
    	<thead>
		<tr>
			<td width="55px" style="text-align:center;"></td>
			<td width="55px" style="text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			
			<td style="text-align:center;">
				<dict:lang value="员工编号" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'LOGIN_NAME');" id="sort_img_LOGIN_NAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="员工姓名" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'NAME');" id="sort_img_NAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="所属部门" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'DEPTNAME');" id="sort_img_DEPTNAME">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="状态" />&#x3000;
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'ENABLE');" id="sort_img_ENABLE">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="分类 " />&#x3000;
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'USER_TYPE');" id="sort_img_USER_TYPE">
			</td>
			
			<td style="text-align:center;">
				<dict:lang value="组织机构" />&#x3000;
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'DATA_AUTH');" id="sort_img_DATA_AUTH">
			</td>
			
			<td style="text-align:center;"><dict:lang value="重置密码" /></td>
		</tr>
		</thead>
		
		<tbody id="dictLs">
		</tbody>
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
	</div>
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="del_id" name="userDto.id" />
	</form>
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
		$('.main').height($(window).height() -  35 - 127);
	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
          $('.dept_select').chosen();
          initHeight();
          _newScroll("main");
          getListUser();
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
	function adds(url){
			var url = "${path}"+url;
			showPopWinFp(url, 700, 360,null,''+"<dict:lang value="导入用户" />");
		}
	function jobAndRole(userId){
			//util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_RoleJobUser.ms",
			    data: "paraMap.userId="+userId,
				success: function(data){
						//util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var roleList = eval(data.ajaxList[0]);
							$("#roletable").empty();
							$("#roletable").append("<thead><tr></tr></thead>");
							$("#roletable tr:last").append("<th width='30px'></th>");
							$("#roletable tr:last").append("<th width='200px'><dict:lang value="角色名称" /></th>");
							for(var i = 0;i < roleList.length; i++){
								$("#roletable").append("<tr></tr>");
								$("#roletable tr:last").append("<td>"+(i+1)+"</td>");
								$("#roletable tr:last").append("<td >"+roleList[i].name+"</td>");
							}
							var jobList = eval(data.ajaxList[1]);
							$("#jobtable").empty();
							$("#jobtable").append("<thead><tr></tr></thead>");
							$("#jobtable tr:last").append("<th width='30px'></th>");
							$("#jobtable tr:last").append("<th width='200px'><dict:lang value="工种名称" /></th>");
							for(var i = 0;i < jobList.length; i++){
								$("#jobtable").append("<tr></tr>");
								$("#jobtable tr:last").append("<td>"+(i+1)+"</td>");
								$("#jobtable tr:last").append("<td >"+jobList[i].jobName+"</td>");
							}
						
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});

	}
	
	function getListUser(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_getListUser.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						//$("#listTable").empty();
						$("#dictLs").empty();
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
								if (usertList[i].ENABLE=="1") {
									usertList[i].ENABLE ="启用";
								}else{
									usertList[i].ENABLE ="禁用";
								}
								if (usertList[i].USER_TYPE=="1") {
									usertList[i].USER_TYPE = "外部";
								}else{
									usertList[i].USER_TYPE ="内部";
								}
								$("#listTable").append("<tr id='"+usertList[i].ID+"' ondblclick=seeDetailed('"+usertList[i].ID+"')></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+usertList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].LOGIN_NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].DEPTNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].ENABLE+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].USER_TYPE+"</td>");
								
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].DATA_AUTH_NAME+"</td>");
								
								$("#listTable tr:last").append("<td style='text-align:center;'><a title='重置密码' href=\"javascript:resetPw('sys/UserAction_resetUserPw.ms?FUNC_CODE=F27','"+usertList[i].ID+"','"+usertList[i].NAME+"');\"><img src='${IMG_PATH}/ContImg07.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG07_GIF%>' class='mCS_img_loaded'></a></td>");
							}
							init();
							checkboxAll("listTable");
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
	function query(paginationImpl,obj,sort_name){
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		
		var sort_type='';
		if(typeof(obj) == "undefined") { 
			//分页
			obj=null;
			sort_name="";
			if(document.getElementById("sort_img_LOGIN_NAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_LOGIN_NAME");
				sort_name="LOGIN_NAME";
				
			}
			if(document.getElementById("sort_img_NAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_NAME");
				sort_name="NAME";
				
			}
			if(document.getElementById("sort_img_DEPTNAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_DEPTNAME");
				sort_name="DEPTNAME";
				
			}
			if(document.getElementById("sort_img_ENABLE").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_ENABLE");
				sort_name="ENABLE";
				
			}
			if(document.getElementById("sort_img_USER_TYPE").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_USER_TYPE");
				sort_name="USER_TYPE";
				
			}
			if(document.getElementById("sort_img_DATA_AUTH").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_DATA_AUTH");
				sort_name="DATA_AUTH";
				
			}
			
			if(obj!=null && obj!=''){
				if(obj.src.indexOf('arrow03.png')!=-1){//箭头上下
					sort_type='';
				}
				if(obj.src.indexOf('arrow01.png')!=-1){//箭头下
					sort_type='desc';
				}
				if(obj.src.indexOf('arrow02.png')!=-1){//箭头上
					sort_type='asc';
				}
	
			}
			
		}else{
			if(obj!=null && obj!=''){
				if(obj.src.indexOf('arrow03.png')!=-1){//箭头上下
					sort_type='desc';
				}
				if(obj.src.indexOf('arrow01.png')!=-1){//箭头下
					sort_type='asc';
				}
				if(obj.src.indexOf('arrow02.png')!=-1){//箭头上
					sort_type='';
				}
	
			}
			if(sort_name=='LOGIN_NAME'){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='NAME'){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='DEPTNAME'){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='ENABLE'){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='USER_TYPE'){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='DATA_AUTH'){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name==''){
				document.getElementById("sort_img_LOGIN_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DEPTNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ENABLE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_USER_TYPE").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			
		}
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_searchlistUser.ms",
			    data: {
			    	"loginName" : $("#loginName").val(),
			    	"name" : $("#name").val(),
			    	"deptId" : $("#deptId").val(),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	
			    	"paraMap.sort_type" : sort_type,
			    	"paraMap.sort_name" : sort_name,
			    	
			    	"dept_auth" :  $("#dept_auth").val()
			    },
				success: function(data){
						if(obj!=null && obj!=''){
							if(sort_type==''){
								obj.src='${path}/plf/page/fp/img/arrow03.png';
							}
							if(sort_type=='asc'){
								obj.src='${path}/plf/page/fp/img/arrow02.png';
							}
							if(sort_type=='desc'){
								obj.src='${path}/plf/page/fp/img/arrow01.png';
							}
						
						}
						
						util.closeLoading();
						if(null == data){return ;}
						//$("#listTable").empty();
						$("#dictLs").empty();
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
								if (usertList[i].ENABLE=="1") {
									usertList[i].ENABLE ="启用";
								}else{
									usertList[i].ENABLE ="禁用";
								}
								if (usertList[i].USER_TYPE=="1") {
									usertList[i].USER_TYPE = "外部";
								}else{
									usertList[i].USER_TYPE ="内部";
								}
								$("#listTable").append("<tr id='"+usertList[i].ID+"' ondblclick=seeDetailed('"+usertList[i].ID+"')></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((data.ajaxPage.currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+usertList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].LOGIN_NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].DEPTNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].ENABLE+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].USER_TYPE+"</td>");
								
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].DATA_AUTH_NAME+"</td>");
								
								$("#listTable tr:last").append("<td style='text-align:center;'><a title='重置密码' href=\"javascript:resetPw('sys/UserAction_resetUserPw.ms?FUNC_CODE=F27','"+usertList[i].ID+"','"+usertList[i].NAME+"');\"><img src='${IMG_PATH}/ContImg07.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG07_GIF%>' class='mCS_img_loaded'></a></td>");
							}
							init();
							checkboxAll("listTable");
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	/* function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){utilsFp.alert(utiutilsFpbmit_default_info);};
		util.showTopLoading();
	} */
	
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
		
	function seeDetailed(id){
		
		var url = "sys/UserAction_showSeeUser.ms?FUNC_CODE=F5095&userDto.id="+id;
		showPopWinFp(url, 851, 550,null,"<dict:lang value="查看"/>");
	}

	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	

	function add(url){
    	showPopWinFp(url, 830, 560,null,"<dict:lang value="新增"/>");
	}
	
	function update(url){
	var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checksub == 1) {
		var id = $("input[type='checkbox'][id='subcheck']:checked").val();
		var url = url+"&userDto.id="+id;
		showPopWinFp(url, 851, 550,null,"<dict:lang value="修改"/>");
	} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
	}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
	}
	
	}
	
	function see(url){
	var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checksub == 1) {
		var id = $("input[type='checkbox'][id='subcheck']:checked").val();
		var url = url+"&userDto.id="+id;
    	showPopWinFp(url, 851, 500,null,"<dict:lang value="查看"/>");
	} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
	}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
	}
	
	}

 	function del(url){
		text = $("input:checkbox[name='userDtoId']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(',');
		if (text != null && text != "") {
			utilsFp.confirmIcon(1,"","delConfirm",url, "<dict:lang value="确认删除选中的用户吗" />",1,"300","");
				//utilsFp.confirm(delConfirm,"<dict:lang value="确认删除选中的用户吗"/>",url);
				delId = text;
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
		
	} 
	
	function delConfirm(url){
    	document.forms.submit_form.action=url;
		$("#del_id").val(delId);
		document.forms.submit_form.submit();
	}
	
	function resetPw(url,uid,uname){
		var paramObj =new Object;
		paramObj.url = url;
		paramObj.uid = uid;
			utilsFp.confirmIcon(1,"","resetPwCf",paramObj, "<dict:lang value="确定要重置"/>"+uname+"<dict:lang value="用户密码"/>",1,"300","");
		//utilsFp.confirm(resetPwCf," <dict:lang value="确定要重置"/><font class=\"hzt\">“&lt;"+uname+"&gt;<dict:lang value="用户密码"/>”</font>",paramObj);
	}
	function resetPwCf(paramObj){
    	document.forms.submit_form.action=paramObj.url;
		$("#del_id").val(paramObj.uid);
		document.forms.submit_form.submit();
	}
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	
	function reloadPgExe(isCloseWin){
		/* document.forms.search_form.submit();
		util.showTopLoading(); */
		query("formId1",null,'');	
		if ("0"!=isCloseWin) {
			top.$(".dialog-close").click();
		}
	}
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		 //_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	
	function alertInfo(msg){
		utilsFp.confirmIcon(1,"","","", msg,0,"300","");
	}
	
	function _sortData(obj,field){
  		query('formId1',obj,field);
  	}

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.js"></script>
<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.min.js"></script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>