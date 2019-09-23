<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="数据字典列表" /></title>
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
			   	<bu:funOper funcNo="F51" type="button" onclick="showAdd('@{funcUrl}');"  cssClass="botton_img_add" />
			   	<bu:funOper funcNo="F5040" type="button" onclick="edit('@{funcUrl}');" cssClass="botton_img_add" />
			   	<bu:funOper funcNo="F5041" type="button" onclick="config('@{funcUrl}');"  cssClass="botton_img_add" />
			   	<bu:funOper funcNo="F5042" type="button" onclick="delAx();"  cssClass="botton_img_add" />
			    <button type="button" onclick="query('formId1',null,'');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			</td>
	    		</tr>
				</table>
			</div>
		</div>
                  
                <div class="bd">
                
				<s:form id="search_form" name="search_form" action="DictAction_listDict.ms" method="post">
				
				<s:hidden id="dictDto_dictId" name="dictDto.dictId" />
				<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<div class="search-box">
				<table class="search_table">
					<tr>
					  	
						<td style="white-space: nowrap;">
							<div class="group">
								<div class="name">
						  			<dict:lang value="类型编码" />
						  		</div>
						  		<div class="dec">	
					  				<s:textfield id="dictDtoSearch_code" name="dictDtoSearch.code" cssClass="input" theme="simple" maxlength="50"/>
					  			</div>
					  		</div>
					  	</td>
					 	<td style="white-space: nowrap;">
					 		<div class="group">
					 			<div class="name">
						  			<dict:lang value="类型编码名称" />
						  		</div>
						  		<div class="dec">
					  				<s:textfield id="dictDtoSearch_value"  cssClass="input" theme="simple" maxlength="50" onchange="codeJSFun(this)" />
					  				<input type="hidden" name="dictDtoSearch.value"  id="code_dictDtoSearch_value" />
					  			</div>
					  		</div>
					  	</td> 	
					</tr>			
				</table>
				
			</div>
			
			<!--  
			<table id="listTable-h" class="dlist-table table-line query-list" style="width: 100%;table-layout: fixed;">
				<thead>
				<tr class="tableHead">
					<td style="width:30px;"></td>
					<td style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
					
					<td style="width:300px;text-align:center;">
						<dict:lang value="编码" />(key)
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'CODE');" id="sort_img_code">
					</td>
					
					<td style="text-align:center;">
						<dict:lang value="编码值" />(value)
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'VALUE');" id="sort_img_value">
					</td>
					
					
					<td style="text-align:center;">
						<dict:lang value="备注" />
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/mc/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'REMARK');" id="sort_img_remark">
					</td>
					
				</tr>
				</thead>
			</table>
			-->
			
			<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
		    <table id="listTable" class="dlist-table table-line query-list resizable-table" style="width: 100%;table-layout: fixed;">
		    	<thead>
				<tr class="tableHead">
					<td style="width:55px;"></td>
					<td style="width:55px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></td>
					
					<td style="width:300px;text-align:center;">
						<dict:lang value="类型编码" />
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'CODE');" id="sort_img_code">
					</td>
					
					<td style="text-align:center;">
						<dict:lang value="类型编码名称" />
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'VALUE');" id="sort_img_value">
					</td>

					<td style="text-align:center;">
						<dict:lang value="备注" />
						<img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="${path}/plf/page/fp/img/arrow03.png" title="点击排序" onclick="_sortData(this,'REMARK');" id="sort_img_remark">
					</td>
					
				</tr>
				</thead>
				
				<tbody id="dictLs">
					<%-- <s:iterator value="list" status="index">
						<tr>
							<td style="width:30px;text-align:center;"><s:property value="#index.count"/></td>
							<td style="width:30px;text-align:center;"><input type="checkbox" style="margin:0;"></td>
							<td style="width:300px;text-align:center;"><s:property value="code"/></td>
							<td style="text-align:center;"><s:property value="value"/></td>
						</tr>
					</s:iterator> --%>
				
				</tbody>
			</table>
			</div>
		</s:form>
	<form id="del_form" name="delForm" action="${path}comm/DictAction_delDictAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5042" method="post" target="submit_frame">
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
		getDict();
		
  	});
  
	

	var paginationImpl = {};
	
	function getDict(){
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/DictAction_getDictAx.ms",
			    data: "",
				success: function(data){
						if(null == data){
						return ;
						}
						$("#dictLs").empty();
						if(null != data.ajaxPage.dataList){
							var list = data.ajaxPage.dataList;
							for(var i = 0;i < list.length; i++){
								if (list[i].VALUE==null) {
									list[i].VALUE="";
								}
								$("#dictLs").append("<tr id='"+list[i].DICT_ID+"' ondblclick=seeDetailed('"+list[i].DICT_ID+"')></tr>");
								$("#dictLs tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#dictLs tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='subcheck' title='"+list[i].VALUE+"' name='"+list[i].DICT_ID+"' dict_type='"+list[i].TYPE+"' value='"+list[i].CODE+"'/></td>");
								
								
								$("#dictLs tr:last").append("<td style='width: 300px;text-align: center;'>"+list[i].CODE+"</td>");
								$("#dictLs tr:last").append("<td style='text-align: center;'>"+list[i].VALUE+"</td>");
								if(list[i].REMARK==null){
									$("#dictLs tr:last").append("<td style='text-align: center;'> </td>");
								}else{
									$("#dictLs tr:last").append("<td style='text-align: center;'>"+list[i].REMARK+"</td>");
								}
								
							}
							init();
							checkboxAll("dictLs");
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
		$("#dictLs").empty();
		
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
			if(document.getElementById("sort_img_remark").src.indexOf('arrow03.png')==-1){
				obj=document.getElementById("sort_img_remark");
				sort_name="REMARK";
				
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
				document.getElementById("sort_img_remark").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='VALUE'){
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_remark").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name=='REMARK'){
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_value").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
			if(sort_name==''){
				document.getElementById("sort_img_remark").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_code").src='${path}/plf/page/fp/img/arrow03.png';
				document.getElementById("sort_img_value").src='${path}/plf/page/fp/img/arrow03.png';
				
			}
		
		}
		
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/DictAction_searchDictAx.ms",
			    data: {
			    	"paraMap.code" : $("#dictDtoSearch_code").val(),
			    	"paraMap.value" : $("#code_dictDtoSearch_value").val(),
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	
			    	"paraMap.sort_type" : sort_type,
			    	"paraMap.sort_name" : sort_name,
			    	"paraMap.type" : $("#dictDtoSearch_type").val()
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
						
						if(null == data){
						return ;}
						$("#dictLs").empty();
						if(null != data.ajaxPage.dataList){
						var totalPagaStr = data.ajaxPage.totalPage;
							var list = data.ajaxPage.dataList;
							for(var i = 0;i < list.length; i++){
								if (list[i].VALUE==null) {
									list[i].VALUE="";
								}
								var page;
								if(1==totalPagaStr){
								 page =i+1;
								}else{
								 page =(currentPage-1)*pageRecord+(i+1);
								}
								
								$("#dictLs").append("<tr id='"+list[i].DICT_ID+"' ondblclick=seeDetailed('"+list[i].DICT_ID+"')></tr>");
								$("#dictLs tr:last").append("<td style='width: 30px;text-align: center;'>"+ page +"</td>");
								$("#dictLs tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='subcheck' title='"+list[i].VALUE+"' name='"+list[i].DICT_ID+"' dict_type='"+list[i].TYPE+"' value='"+list[i].CODE+"'/></td>");
								
								$("#dictLs tr:last").append("<td style='width: 300px;text-align: center;'>"+list[i].CODE+"</td>");
								$("#dictLs tr:last").append("<td style='text-align: center;'>"+list[i].VALUE+"</td>");
								if(list[i].REMARK==null){
									$("#dictLs tr:last").append("<td style='text-align: center;'> </td>");
								}else{
									$("#dictLs tr:last").append("<td style='text-align: center;'>"+list[i].REMARK+"</td>");
								}
							}
							}
							init();
							checkboxAll("dictLs");
							pageFun(data.ajaxPage,"formId1");
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
	}
	
	
	
	function edit(url){
		var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
		if (checksub == 1) {
			var dictId = $("input[type='checkbox'][id='subcheck']:checked").val();
			var url = url+"&paraMap.dictId="+dictId;
	    	showPopWinFp(url, 430, 210,null,"<dict:lang value="修改"/>");
		} else if(checksub == 0){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
		}
	}
	
	var allDels = [];
	function getAlldelAx(){
		$("#dictLs :checkbox").each(function(){
					if($(this).attr("checked")){
						allDels.push({
							delId: $(this).attr("name")
				});
					}
				});
		return JSON.stringify(allDels);
	}
  
	function delAx(){
		allDels = [];
		getAlldelAx();
		if (allDels.length==0) {
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}else{
			var dict_type=''
			$("#dictLs :checkbox").each(function(){
					if($(this).attr("checked")){
						dict_type=$(this).attr("dict_type");
					}
			});
			if(dict_type=='1' || dict_type=='2'){
				utilsFp.alert("平台或者产品类型的数据字典不允许删除");
				return;
			}
			
			utilsFp.confirmIcon(1,"","delAx_s","", "<dict:lang value="确认删除" />？",1,"300","");
		}
	}
	
	function delAx_s(){
		utilsFp.confirmIcon(1,"","delAxs","", "<dict:lang value="二次确认删除" />？\n<dict:lang value="数据字典删除后将有可能影响到整个系统" />！！！",1,"320","180");
	}
	
	function delAxs(){
		$("#delId").val(getAlldelAx());
		document.forms.del_form.submit();
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
		
	
	
	
		function initHeight(){
			$('.main').height($(parent.window).height() - 65 - 100 -  35 - 36 + 11);
		}
	      
	    $(window).resize(function(){  
			initHeight();	  		
		});
		
		function closePopWin(){
			hidePopWin(false);
		}
		
		function clearSearchVal(thisObj){//清空查询条件
			document.getElementById("dictDtoSearch_code").value="";
			document.getElementById("dictDtoSearch_value").value="";
			query(thisObj,null,'');
		}
		
		/* function query(thisObj){
			document.search_form.submit();
			thisObj.onclick = function(){utilsFp.alert(util.submit_default_info);}
			util.showLoading();
		} */
		
		
		
		//全选
		function selectAll(){   
			if ($("#SelectAll").attr("checked")){
				$(":checkbox").attr("checked",true);
				$("#listTable :checkbox").parents("tr").css("background-color","#D3EAFC");
			}else{
				$(":checkbox").attr("checked",false);
				$("#listTable :checkbox").parents("tr").css("background-color","");
			}
		}
		
		function showAdd(url){
    		showPopWinFp(url, 430, 210,null,"<dict:lang value="新增"/>");
		}
		
		function seeDetailed(dictId){
	   		var url = "comm/DictAction_viewDict.ms?dictDto.dictId="+dictId+"&FUNC_CODE=F52";
	   		showPopWinFp(url, 430, 170,null,"<dict:lang value="查看数据字典" />");
		}
		
		function showUpdate(url,dictId){
			resetSearchVal();
	   		var formObj= document.search_form;
	   		document.getElementById("dictDto_dictId").value = dictId;
	   		formObj.action = url;
	   		formObj.submit();
		}
				
		function config(url){
			var checksub = $("input[type='checkbox'][id='subcheck']:checked").length;
			if (checksub == 1) {
				var dictCode = $("input[type='checkbox'][id='subcheck']:checked").val();
				var dictValue = $("input[type='checkbox'][id='subcheck']:checked").attr("title");
				dictValue=encodeHtml(dictValue);
				var url = url+"&paraMap.dictCode="+dictCode;
		    	showPopWinFp(url, 900, 500,null,"<dict:lang value="数据字典配置"/>",dictCode,"1");
			} else if(checksub == 0){
					utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			}else{
					utilsFp.confirmIcon(1,"","","", "<dict:lang value="只能选择一条记录" />",0,"300","");
			}
		
			/* resetSearchVal();
			var formObj= document.search_form;
			var inputEle = $('<input type="hidden" id="page_pCurrentPage" name="page.pCurrentPage" value="'+document.getElementById("page_currentPage").value+'"  />');
			$(formObj).append(inputEle);
			document.getElementById("page_currentPage").value="1";
	  		document.getElementById("dictDto_dictId").value = dictId;
	  		formObj.action = url+"&dictDto.dictId="+dictId+"&dictDto.code="+code;
	  		formObj.submit();
			util.showLoading(); */
		}
				
		function del(url,dictId){
	   		var paramObj = new Object();
	   		paramObj.url=url;
	   		paramObj.dictId=dictId;
	   		utilsFp.confirm(delCf, "<dict:lang value="确认删除吗" />", paramObj);
		}
				
		function delCf(paramObj){
			var url = paramObj.url;
			var dictId = paramObj.dictId;
	   		if(!confirm("<dict:lang value="二次确认删除" />？\n<dict:lang value="数据字典删除后将有可能影响到整个系统" />！！！")){
	   			return ;
	   		}
	   		var formObj= document.search_form;
	   		document.getElementById("dictDto_dictId").value = dictId;
	   		formObj.action = url+"&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE_UP}'/>=F4";
	   		formObj.submit();
		}
		
		function resetSearchVal(){//重置查询条件值
			document.getElementById("dictDtoSearch_code").value="<s:property value="dictDtoSearch.code"/>";
			document.getElementById("dictDtoSearch_value").value="<s:property value="dictDtoSearch.value"/>";
		}


		if("<c:out value='${actionErrors[0]}' />" !=""){
			utilsFp.alert("<c:out value='${actionErrors[0]}' />");
		}
		if("<c:out value='${actionMessages[0]}' />" !=""){
			utilsFp.alert("<c:out value='${actionMessages[0]}' />");
		}
	
		function init(){
			var tableTrJs = $("#listTable tbody tr");
			initHeight();
			_toClickColor(tableTrJs);
			_tongLineColor(tableTrJs);
		}

	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	
	function reloadPgExe(isCloseWin){
		query("formId1");
		//document.forms.search_form.submit();
		util.showTopLoading();		
		if ("0"!=isCloseWin) {
			top.$(".dialog-close").click();
		}
	}
	$(function(){
        _newScroll("main");
  	});
  	
  	function _sortData(obj,field){
  		query('formId1',obj,field);
  	}
  	

</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>

<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.js"></script>
<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.min.js"></script>


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	</body> 

<jsp:include page="/plf/common/pub_end.jsp" />