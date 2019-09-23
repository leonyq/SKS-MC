<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="部门信息列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	</head>
	
	
<body style="overflow:hidden;">

<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  <div class="optn">
                  <table class="func_table">
                  <tr>
				<td width="100%" align="right">
			    <bu:funOper funcNo="F31" type="button" onclick="add('@{funcUrl}');" />
			    <bu:funOper funcNo="F32" type="button" onclick="update('@{funcUrl}');" />
			    <bu:funOper funcNo="F33" type="button" onclick="del('@{funcUrl}');" />
			    <button type="button"onclick="query('formId1',null,'');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		  	</td>
	    		</tr>
				</table>
				</div></div>
                  
                  <div class="bd">
                      <div class="search-box">
	<form id="search_form" name="searchForm" action="${path}sys/DeptAction_listDept.ms" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<s:hidden id="deptDtoSh_upId" name="deptDtoSh.upId" />
		<s:hidden id="deptDtoUp_id" name="deptDtoUp.id" />
		<s:hidden id="deptDtoUp_name" name="deptDtoUp.name" />
		
		<s:hidden id="deptDtoUp_path" name="deptDtoUp.path" />
		
	<table class="search_table">
		<tr>
			<!-- //人员、角色、功能、部门表中增加组织机构字段及功能改造 -->
			 <s:if test="${isEnableAuth==1}">
			 	<td  style="white-space: nowrap;">
			  	&#x3000;&#x3000;&#x3000;<dict:lang value="组织机构" />
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
		    
		  	
			<td >
				&#x3000;&#x3000;&#x3000;
				<dict:lang value="部门名称" />
				<s:textfield id="name" name="deptDtoSh.name" cssClass="input" maxlength="300" />
		  	</td>
			
	    </tr>
	</table>
	</form>
	</div>
	
	<!--  
    <table id="listTable-h" class="dlist-table table-line" style="margin-top: 10px;width: 100%;table-layout: fixed;">
		<thead>
		<tr class="tableHead">
			<td style="width: 30px;text-align: center; box-sizing: border-box;"></td>
			<td style="width: 30px;text-align: center; box-sizing: border-box;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="部门名称" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'NAME');" id="sort_img_NAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="上级部门" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'UPNAME');" id="sort_img_UPNAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="默认角色" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'ROLENAME');" id="sort_img_ROLENAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="默认工种" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'JOBNAME');" id="sort_img_JOBNAME">
			</td>
			
		</tr>
		</thead>
	</table>
	-->
	</br>
	<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;min-height:470px;">
    <table id="listTable" class="dlist-table table-line resizable-table " style="width: 100%;table-layout: fixed;">
    	<thead>
		<tr class="tableHead">
			<td style="width: 55px;text-align: center; box-sizing: border-box;"></td>
			<td style="width: 55px;text-align: center; box-sizing: border-box;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="部门名称" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'NAME');" id="sort_img_NAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="上级部门" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'UPNAME');" id="sort_img_UPNAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="默认角色" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'ROLENAME');" id="sort_img_ROLENAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="默认工种" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'JOBNAME');" id="sort_img_JOBNAME">
			</td>
			
			<td style="text-align: center;box-sizing: border-box;">
				<dict:lang value="组织机构" />
				<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'DATA_AUTH');" id="sort_img_DATA_AUTH">
			</td>
			
		</tr>
		</thead>
		
		<tbody id="dictLs">

			<s:iterator value="deptLs" status="index">
			<tr id="<c:out value='${id}'/>" ondblclick="seeDetailed('<c:out value='${id}'/>')">
				<td style="width: 30px;text-align: center;box-sizing: border-box;"><s:property value="#index.count"/></td>
				<td style="width: 30px;text-align: center;box-sizing: border-box;"><input type="checkbox" name="DeptId" id="subcheck" value="<c:out value='${id}'/>" style="margin:0"></td>
				<td style="text-align: center;box-sizing: border-box;" title=<s:property value="name"/>><s:property value="name"/></td>
				<td style="text-align: center;box-sizing: border-box;" title=<s:property value="deptDtoUp.name"/>><s:property value="deptDtoUp.name"/></td>
				<td style="text-align: center;box-sizing: border-box;" title=<s:property value="roleName"/>><s:property value="roleName"/></td>
				<td style="text-align: center;box-sizing: border-box;" title=<s:property value="jobName"/>><s:property value="jobName"/></td>
				
				<td style="text-align: center;box-sizing: border-box;" title=<s:property value="DATA_AUTH_NAME"/>><s:property value="DATA_AUTH_NAME"/></td>
				
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
		<input type="hidden" id="deptDtoSh_id" name="deptDtoSh.id" />
		<input type="hidden" id="deptDtoUp_id_add" name="deptDtoUp.id" value="<s:property value="deptDtoUp.id" />" />
		<input type="hidden" id="deptDtoUp_name_add" name="deptDtoUp.name" value="<s:property value="deptDtoUp.name" />" />
		<input type="hidden" id="deptDtoUp_iframeid" name="deptDtoUp.iframeid" value="<c:out value='${iframeid}' />"/>
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
		$('.main').height($(window).height() -  35 -127);

	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
          $('.dept_select').chosen();
          $("#deptDtoUp_iframeid").val(parent.window.name);
          
          initHeight();
          _newScroll("main");
          getDept();
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
	function getDept(){
		util.showTopLoading();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_getlistDept.ms",
			    data: "deptUpid="+$("#deptDtoSh_upId").val(),
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						//$("#listTable").empty();
						$("#dictLs").empty();
						if(null != data.ajaxPage.dataList){
							var deptList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < deptList.length; i++){
								if (deptList[i].ROLENAME==null) {
									deptList[i].ROLENAME = "";
								}
								if (deptList[i].JOBNAME==null) {
									deptList[i].JOBNAME = "";
								}
								$("#listTable").append("<tr id='"+deptList[i].ID+"' ondblclick=seeDetailed('"+deptList[i].ID+"')>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='DeptId' value='"+deptList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].NAME+">"+deptList[i].NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].UPNAME+">"+deptList[i].UPNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].ROLENAME+">"+deptList[i].ROLENAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].JOBNAME+">"+deptList[i].JOBNAME+"</td></tr>");
								
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].DATA_AUTH_NAME+">"+deptList[i].DATA_AUTH_NAME+"</td></tr>");
								
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
	
		var sort_type='';
		if(typeof(obj) == "undefined") { 
			//分页
			obj=null;
			sort_name="";
			if(document.getElementById("sort_img_NAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_NAME");
				sort_name="NAME";
				
			}
			if(document.getElementById("sort_img_UPNAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_UPNAME");
				sort_name="UPNAME";
				
			}
			if(document.getElementById("sort_img_ROLENAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_ROLENAME");
				sort_name="ROLENAME";
				
			}
			if(document.getElementById("sort_img_JOBNAME").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_JOBNAME");
				sort_name="JOBNAME";
				
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
			if(sort_name=='NAME'){
				document.getElementById("sort_img_UPNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ROLENAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_JOBNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='UPNAME'){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ROLENAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_JOBNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='ROLENAME'){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_UPNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_JOBNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='JOBNAME'){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_UPNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ROLENAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='DATA_AUTH'){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_UPNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ROLENAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_JOBNAME").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name==''){
				document.getElementById("sort_img_NAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_JOBNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_UPNAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_ROLENAME").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_DATA_AUTH").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
		
		}
		
		var data;
		if (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage != undefined && _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord!= undefined) {
			data = {
				"deptUpid" : $("#deptDtoSh_upId").val(),
				"paraMap.name" : $("#name").val(),
				"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				"page.pageRecord" :  _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				"dept_auth" : $("#dept_auth").val(),//人员、角色、功能、部门表中增加组织机构字段及功能改造
                "paraMap.sort_type" : sort_type,
			    "paraMap.sort_name" : sort_name
			}
		}else{
			data = {
				"deptUpid" : $("#deptDtoSh_upId").val(),
				"paraMap.name" : $("#name").val(),
				"dept_auth" : $("#dept_auth").val(),//人员、角色、功能、部门表中增加组织机构字段及功能改造
                "paraMap.sort_type" : sort_type,
			    "paraMap.sort_name" : sort_name
			}
		}
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		//$("#listTable").empty();
		$("#dictLs").empty();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_searchlistDept.ms",
			    data: data,
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
						if(null != data.ajaxPage.dataList){
							var deptList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < deptList.length; i++){
								if (deptList[i].ROLENAME==null) {
									deptList[i].ROLENAME = "";
								}
								if (deptList[i].JOBNAME==null) {
									deptList[i].JOBNAME = "";
								}
								$("#listTable").append("<tr id='"+deptList[i].ID+"' ondblclick=seeDetailed('"+deptList[i].ID+"')>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='DeptId' value='"+deptList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].NAME+">"+deptList[i].NAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].UPNAME+">"+deptList[i].UPNAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].ROLENAME+">"+deptList[i].ROLENAME+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].JOBNAME+">"+deptList[i].JOBNAME+"</td></tr>");
								
								$("#listTable tr:last").append("<td style='text-align:center;' title="+deptList[i].DATA_AUTH_NAME+">"+deptList[i].DATA_AUTH_NAME+"</td></tr>");
								
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
	/* function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","",util.submit_default_info,0,"300","");}
		util.showTopLoading();
	} */
	
	function reloadPg(msg,title,width,height,time,isCloseWin){
		//utilsFp.alert(msg,reloadPgExe);
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
	
	function getUpId(){
		return $("#deptDtoSh_upId").val();
	}
	
	function getUpName(){
		return $("#deptDtoUp_name").val();
	}

	function add(url){
    /* var submitForm = document.forms.submit_form;
    var oldAction = submitForm.action;
    var oldTarget = submitForm.target;
  	submitForm.action= url;
		submitForm.target = popupFrameId; */

  	showPopWinFp(url+"&deptDtoUp.id="+$("#deptDtoUp_id").val()+"&iframeid="+$("#deptDtoUp_iframeid").val(), 375, 325,null,"<dict:lang value="新增" />");

/*   	submitForm.submit();
  	submitForm.action= oldAction;
		submitForm.target = oldTarget; */
	}
	
	function update(url){
	var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checksub == 1) {
		var id = $("input[type='checkbox'][id='subcheck']:checked").val();
    	$("#deptDtoSh_id").val(id);
   /*  var submitForm = document.forms.submit_form;
    var oldAction = submitForm.action;
    var oldTarget = submitForm.target;
  	submitForm.action= url;
		submitForm.target = popupFrameId; */
	url = url+"&deptDto.id="+id;
  	showPopWinFp(url+"&iframeid="+$("#deptDtoUp_iframeid").val(), 375, 325,null,"<dict:lang value="修改" />");
/*   	submitForm.submit();
  	submitForm.action= oldAction;
		submitForm.target = oldTarget; */
	} else if(checksub == 0){
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			//utilsFp.alert("<dict:lang value="请至少勾选一条记录" />");
	}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
	}
		
	}
	
	function seeDetailed(id){
		console.log("[deptlist]");
		var url = "sys/DeptAction_showSeeDept.ms?deptDto.id="+id;
		showPopWinFp(url, 355, 235,null,"<dict:lang value="查看"/>");
	}

	function del(url){
		text = $("input:checkbox[name='DeptId']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(',');
		if (text != null && text != "") {
			var paramObj =new Object;
			paramObj.url = url+"&iframeId="+$("#deptDtoUp_iframeid").val();
			paramObj.id = text;
			utilsFp.confirmIcon(1,"","delConfirm",paramObj, "<dict:lang value="确认删除选中的部门吗" />",1,"300","");
			//utilsFp.confirm(delConfirm,"",paramObj);
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
		
	}
	
	function delConfirm(paramObj){
    	document.forms.submit_form.action=paramObj.url;
		$("#deptDtoSh_id").val(paramObj.id);
		document.forms.submit_form.submit();
	}
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	
	function _sortData(obj,field){
  		query('formId1',obj,field);
  	}
	

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.js"></script>
<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.min.js"></script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>