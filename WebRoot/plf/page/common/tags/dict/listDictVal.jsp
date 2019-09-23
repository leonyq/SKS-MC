<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %> 
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<html>
	<head>
		<title><dict:lang value="数据字典值列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<style>
		.main td{
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
	</style>
	</head>

	<body>
	<div class="content-in">
	<div class="dlist">
		<div class="hd">
             <div class="optn">
                  <table class="func_table">
                  	<tr>
						<td width="100%" align="right">
					   	<bu:funOper funcNo="F5060" type="button" onclick="showAdd('@{funcUrl}');" prefix="&nbsp;" cssClass="botton_img_add" />
					   	<bu:funOper funcNo="F5061" type="button" onclick="edit('@{funcUrl}');" prefix="&nbsp;" cssClass="botton_img_add" />
					   	<bu:funOper funcNo="F5062" type="button" onclick="delAx();" prefix="&nbsp;" cssClass="botton_img_add" />
					    <button type="button" onclick="query('formId1',null,'');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						</td>
	    			</tr>
				</table>
			</div>
		</div>
                  
                <div class="bd">
                	<form id="search_form" name="search_form" action="DictAction_listDict.ms" method="post">
					<s:hidden id="dictDto_dictId" name="dictDto.dictId" />
					<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
					<div class="search-box">
					<table class="search_table">
						<tr>
							<td style="white-space: nowrap;">
								<div class="group">
									<div class="name">
							  			<dict:lang value="明细项编码" />
							  		</div>
							  		<div class="dec">	
						  				<s:textfield id="dictDtoSearch_code" name="dictDtoSearch.code" cssClass="input" theme="simple" maxlength="20"/>
						  			</div>
						  		</div>
						  	</td>
						 	<td style="white-space: nowrap;">
						 		<div class="group">
						 			<div class="name">
							  			<dict:lang value="明细项编码值" />
							  		</div>
							  		<div class="dec">
						  				<s:textfield id="dictDtoSearch_value"  cssClass="input" theme="simple" maxlength="20" onchange="codeJSFun(this)" />
						  				<input type="hidden" name="dictDtoSearch.value" id="code_dictDtoSearch_value"/>
						  			</div>
						  		</div>
						  	</td> 	
						</tr>			
					</table>
				</div>
				</form>
				<form action="${path}comm/DictValAction_listDictVal.ms" method="post" name="list_form" id="list_form">
					<input type="hidden" name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			    	<input type="hidden" id="dictCode" name="paraMap.dictCode" value="<c:out value='${list[0].dictCode}'/>"/>
			    	<input type="hidden" id="dictValue" name="paraMap.dictValue" value="<c:out value='${list[0].dictValue}'/>"/>
			    	
				
					<table id="listTable-h" class="dlist-table table-line" style="width: 100%;table-layout: fixed;">
						<thead>
							<tr class="tableHead">
								<td style="width:30px;text-align:center;"></td>
								<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
								
								<td style="width:150px;text-align:center;"><dict:lang value="类型编码"/></td>
								
								<td style="width:150px;text-align:center;"><dict:lang value="类型编码名称"/></td>
								
								<td style="width:150px;text-align:center;">
								<dict:lang value="明细项编码"/>
								<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'CODE');" id="sort_img_code">
								</td>
								
								<td style="width:150px;text-align:center;">
								<dict:lang value="明细项编码值"/>
								<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'VALUE');" id="sort_img_value">
								</td>
								
								<td style="width:150px;text-align:center;">
								<dict:lang value="下拉列表显示顺序"/>
								<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'DISP_INDX');" id="sort_img_disp_indx">
								</td>
								
								<td style="width:100px;text-align:center;"><dict:lang value="是否显示"/></td>
								<td style="width:100px;text-align:center;"><dict:lang value="是否可用"/></td>
								
								<td style="width:100px;text-align:center;"><dict:lang value="是否可删除"/></td>
								<td style="width:100px;text-align:center;"><dict:lang value="编码值是否可编辑"/></td>
								
							</tr>
						</thead>			
					</table>
					<div class="main" style="overflow-y: auto;overflow-x: hidden;">
						    <table id="listTable" class="dlist-table query-list" style="width: 100%;table-layout: fixed;">
								<tbody id="dictValLs">
									
								
								</tbody>
							</table>
					</div>
				</form>
				<form id="del_form" name="delForm" action="${path}comm/DictValAction_delDictValAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5062" method="post" target="submit_frame">
					<input type="hidden" id="delId" name="paraMap.delId" >
					<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
				</form>
				<div style="display: none;">
					<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
				</div>
				
					<div class="center">
						<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
					</div>
				</div>
			</div>
		</div>	
		
	<script type="text/javascript">
	
	function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
		getDictVal();
  });
  
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	
	function reloadPgExe(isCloseWin){
		query("formId1");
		util.showTopLoading();
		if ("0"!=isCloseWin) {
			top.$(".dialog-close").click();
		}
	}

	function showAdd(url){
		url = url + "&paraMap.dictCode="+$("#dictCode").val();
    	showPopWinFp(url, 450, 210,null,"<dict:lang value="新增"/>");
	}
	
	function edit(url){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var dictValId = $("input[type='checkbox'][id='subcheck']:checked").val();
			var dictCode = $("input[type='checkbox'][id='subcheck']:checked").attr("name");
			var url = url+"&paraMap.dictValId="+dictValId+"&paraMap.dictCode="+dictCode;
	    	showPopWinFp(url, 500, 300,null,"<dict:lang value="修改"/>");
		} else if(checksub == 0){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}	
	var paginationImpl = {};
	
	function getDictVal(){
		var dictCodes = $("#dictCode").val();
		var dictValue = $("#dictValue").val();
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/DictValAction_listDictValAx.ms?paraMap.dictCode="+dictCodes,
			    data: "",
				success: function(data){
						if(null == data){
						return ;}
						$("#dictValLs").empty();
						if(null != data.ajaxPage.dataList){
							var list = data.ajaxPage.dataList;
							for(var i = 0;i < list.length; i++){
								if (list[i].VALUE==null) {
									list[i].VALUE="";
								}
								$("#dictValLs").append("<tr id='"+list[i].DICT_VAL_ID+"' ondblclick=seeDetailed('"+list[i].DICT_VAL_ID+"')></tr>");
								$("#dictValLs tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' isdel_value='"+list[i].IS_DEL+"' id='subcheck' name='"+dictCodes+"' value='"+list[i].DICT_VAL_ID+"'/></td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+dictCodes+"</td>");
								
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+dictValue+"</td>");
								
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+list[i].CODE+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'  title='"+list[i].VALUE+"'>"+list[i].VALUE+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+list[i].DISP_INDX+"</td>");
								if (list[i].IS_DISP==1) {
									list[i].IS_DISP = "<dict:lang value="是"/>";
								}else{
									list[i].IS_DISP = "<dict:lang value="否"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_DISP+"</td>");
								if (list[i].IS_SELC==1) {
									list[i].IS_SELC = "<dict:lang value="是"/>";
								}else{
									list[i].IS_SELC = "<dict:lang value="否"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_SELC+"</td>");
								
								if (list[i].IS_DEL==1) {
									list[i].IS_DEL = "<dict:lang value="不可删除"/>";
								}else{
									list[i].IS_DEL = "<dict:lang value="可删除"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_DEL+"</td>");
								
								if (list[i].IS_EDIT==1) {
									list[i].IS_EDIT = "<dict:lang value="不可编辑"/>";
								}else{
									list[i].IS_EDIT = "<dict:lang value="可编辑"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_EDIT+"</td>");
								
							}
							init();
							checkboxAll("dictValLs");
							pageFun(data.ajaxPage,"formId1");
							}
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
	}
		
	function query(paginationImpl,obj,sort_name){
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$("#dictValLs").empty();
		var dictCodes = $("#dictCode").val();
		var dictValue = $("#dictValue").val();
		
		var sort_type='';
		if(typeof(obj) == "undefined") { 
			//分页
			obj=null;
			sort_name="";
			if(document.getElementById("sort_img_code").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_code");
				sort_name="CODE";
				
			}
			if(document.getElementById("sort_img_value").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_value");
				sort_name="VALUE";
				
			}
			if(document.getElementById("sort_img_disp_indx").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_disp_indx");
				sort_name="DISP_INDX";
				
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
			if(sort_name=='CODE'){
				document.getElementById("sort_img_value").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_disp_indx").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='VALUE'){
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_disp_indx").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='DISP_INDX'){
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_value").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name==''){
				document.getElementById("sort_img_disp_indx").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_value").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
		
		}
		
		var data;
		if (_GLO_FORM_PAGE_MAP[paginationImpl].currentPage != undefined && _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord!= undefined) {
			data = {
				"paraMap.dictCode" : dictCodes,
				"paraMap.code" : $("#dictDtoSearch_code").val(),
				"paraMap.value" : $("#code_dictDtoSearch_value").val(),
				"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				"paraMap.sort_type" : sort_type,
		    	"paraMap.sort_name" : sort_name
			}
		}else{
			data = {
				"paraMap.dictCode" : dictCodes,
				"paraMap.code" :$("#dictDtoSearch_code").val(),
				"paraMap.value" : $("#code_dictDtoSearch_value").val(),
				"paraMap.sort_type" : sort_type,
		    	"paraMap.sort_name" : sort_name
			}
		}
		
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/DictValAction_searchDictValAx.ms",
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
					
						if(null == data){
						return ;}
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null != data.ajaxPage.dataList){
							var list = data.ajaxPage.dataList;
							for(var i = 0;i < list.length; i++){
								if (list[i].VALUE==null) {
									list[i].VALUE="";
								}
								$("#dictValLs").append("<tr id='"+list[i].DICT_VAL_ID+"'  ondblclick=seeDetailed('"+list[i].DICT_VAL_ID+"')></tr>");
								$("#dictValLs tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' isdel_value='"+list[i].IS_DEL+"' id='subcheck' name='"+dictCodes+"' value='"+list[i].DICT_VAL_ID+"'/></td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+dictCodes+"</td>");
								
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+dictValue+"</td>");
								
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+list[i].CODE+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;' title='"+list[i].VALUE+"'>"+list[i].VALUE+"</td>");
								$("#dictValLs tr:last").append("<td style='width: 150px;text-align: center;'>"+list[i].DISP_INDX+"</td>");
								if (list[i].IS_DISP==1) {
									list[i].IS_DISP = "<dict:lang value="是"/>";
								}else{
									list[i].IS_DISP = "<dict:lang value="否"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_DISP+"</td>");
								if (list[i].IS_SELC==1) {
									list[i].IS_SELC = "<dict:lang value="是"/>";
								}else{
									list[i].IS_SELC = "<dict:lang value="否"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_SELC+"</td>");
								
								if (list[i].IS_DEL==1) {
									list[i].IS_DEL = "<dict:lang value="不可删除"/>";
								}else{
									list[i].IS_DEL = "<dict:lang value="可删除"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_DEL+"</td>");
								
								if (list[i].IS_EDIT==1) {
									list[i].IS_EDIT = "<dict:lang value="不可编辑"/>";
								}else{
									list[i].IS_EDIT = "<dict:lang value="可编辑"/>";
								}
								$("#dictValLs tr:last").append("<td style='width: 100px;text-align: center;'>"+list[i].IS_EDIT+"</td>");
								
							}
							}
							init();
							checkboxAll("dictValLs");
							pageFun(data.ajaxPage,"formId1");
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
	}
	
	var allDels = [];
	function getAlldelAx(){
		$("#dictValLs :checkbox").each(function(){
					if($(this).attr("checked")){
						allDels.push({
							delId: $(this).val()
						});
												
					}
				});
		return JSON.stringify(allDels);
	}
	
	var isdel_value="";
	function getAlldelAx2(){
		$("#dictValLs :checkbox").each(function(){
					if($(this).attr("checked")){
						isdel_value=$(this).attr("isdel_value");
						
					}
				});
	}
  
	function delAx(){
		    var flag=false;
		    $("#dictValLs :checkbox").each(function(){
		          if($(this).attr("checked")){
		            isdel_value=$(this).attr("isdel_value");
		            if(isdel_value=='1'){
		              flag=true;
		              return;
		            }   
		           }    
		    });
		    
		    if(flag){
		      utilsFp.alert("包含不可删除的数据，请重新选择");
		      return;
		    }else{
		      getAlldelAx();
		      if (allDels.length==0) {
		        utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		      }else{
		        utilsFp.confirmIcon(1,"","delAxs","", "<dict:lang value="确认删除" />？",1,"300","");
		      }
		    
		    }
	}
	
	function delAxs(){
		getAlldelAx2()
		if(isdel_value=='1'){
			utilsFp.alert("该数据字典不可删除");
			
		}else{
			$("#delId").val(getAlldelAx());
			document.forms.del_form.submit();
			
		}
		
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
				$("#"+trId).css("background-color","#D3EAFC");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#D3EAFC");
			  }
		  });
		}
		
		function closePopWin(){
			hidePopWin(false);
		}
		
		function clearSearchVal(thisObj){
			document.getElementById("dictValDtoSearch_code").value="";
			document.getElementById("dictValDtoSearch_value").value="";	
			query(thisObj,null,'');
		}
		
		/* function query(thisObj){
			_pageCurrentPageObj.value="1";
			document.list_form.submit();
			thisObj.onclick = function(){util.alert(util.submit_default_info);}
			util.showLoading();
		}
		
		function showAdd(){
			resetSearchVal();
       		var formObj= document.list_form;
       		formObj.action = "${path}comm/DictValAction_showAddDictVal.ms";
       		formObj.submit();
		} */
		
		function view(dictValId){
			console.log("[dictValid]"+dictValId);
			resetSearchVal();
	        var listForm = document.list_form;
	        var oldAction = listForm.action;
	        var oldTarget = listForm.target;
	        console.log("[dictValid]"+dictValId);
       		listForm.action= "${path}comm/DictValAction_viewDictVal.ms";
			listForm.target = popupFrameId;
			document.getElementById("dictValDto_dictValId").value = dictValId;
       		showPopWin("", 600, 300,null,"<dict:lang value="查看数据字典值"/>");
       		listForm.submit();
       		listForm.action= oldAction;
			listForm.target = oldTarget;
		}
		
		function seeDetailed(id){
			
			var url = "comm/DictValAction_viewDictVal.ms?dictValDto.dictValId="+id;
			showPopWinFp(url, 500, 263,null,"<dict:lang value="查看"/>");
		}
		
		function showUpdate(dictValId){
			resetSearchVal();
       		var formObj= document.list_form;
       		document.getElementById("dictValDto_dictValId").value = dictValId;
       		formObj.action = "${path}comm/DictValAction_showUpdateDictVal.ms";
       		formObj.submit();
		}
				
		function del(dictValId){
			resetSearchVal();
			util.confirm(delCf, "<dict:lang value="确认删除吗"/>", dictValId);
		}
				
		function delCf(dictValId){
       		if(!confirm("<dict:lang value="二次确认删除"/>？\n<dict:lang value="数据字典删值除后将有可能影响到整个系统"/>！！！")){
       			return ;
       		}
       		var formObj= document.list_form;
       		document.getElementById("dictValDto_dictValId").value = dictValId;
       		formObj.action = "${path}comm/DictValAction_delDictVal.ms";
       		formObj.submit();
		}
		
		function goBack(thisObj){
			resetSearchVal();
			document.getElementById("page_currentPage").value= document.getElementById("page_pCurrentPage").value;
	   		var formObj= document.list_form;
	   		formObj.action = "${path}comm/DictAction_listDict.ms?FUNC_CODE=F4";
	   		formObj.submit();
			thisObj.onclick = function(){util.alert(util.submit_default_info);}
			util.showLoading();
    	}
		
		function resetSearchVal(){//重置查询条件值
			document.getElementById("dictValDtoSearch_code").value= "<s:property value="dictValDtoSearch.code"/>";
			document.getElementById("dictValDtoSearch_value").value="<s:property value="dictValDtoSearch.value"/>";
		}

		
		<%-- 显示提示信息 --%>
		if("<c:out value='${actionErrors[0]}' />" !=""){
			util.alert("<c:out value='${actionErrors[0]}' />");
		}
		if("<c:out value='${actionMessages[0]}' />" !=""){
			util.alert("<c:out value='${actionMessages[0]}' />");
		}
		
		function init(){
			var tableTrJs = $("#listTable tbody tr");
			_toClickColor(tableTrJs);
			_tongLineColor(tableTrJs);
			initHeight();
		}
		function initHeight(){
			$('.main').height($(parent.window).height() - 65 - 100 -  35 - 36 + 11);
		}
	      
	    $(window).resize(function(){  
			initHeight();	  		
		});
		//全选
		function selectAll(){   
			if ($("#SelectAll").attr("checked")){
				$(":checkbox").attr("checked",true);
				$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
			}else{
				$(":checkbox").attr("checked",false);
				$("#listTable :checkbox").parents("tr").css("background-color","");
			}
		}
		
		function _sortData(obj,field){
	  		query('formId1',obj,field);
	  	}
		
	</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	</body>
<jsp:include page="/plf/common/pub_end.jsp" />
</html>