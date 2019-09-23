<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
	<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="选择数据" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script src="${path}/plf/js/ui/textform/js/jquery.validate.js?_mc_res_version=<%=PlfStaticRes.JQUERY_VALIDATE_JS %>"></script>
<style type="text/css">
	.hide{display:none;}
</style>
<script type="text/javascript">
$(function(){
	$('th').each(function(i){
		if($(this).attr("class")=='hide'){
		 $('table tbody tr').each(function(j){
			$(this).find('td').eq(i).addClass('hide');
		 });
		}
	});
	
	$('.panel').height($(window).height() - 130)
	
	//美化滚动条
	setPopScroll(".datagrid-body"); 
});

</script>
</head>
<body>
	<div class="content-in">
		<div class="dlist">
			<div class="hd" style="padding-top:5px;">
				<div>
					<div id='timeBucketId'></div>
					<div class="optn" style="margin-right:6px;top:5px;">
						<form id="funForm" name="funForm" action="${path}buss/bussModel.ms"
							method="post" target="submitFrame">
							<table class="func_table">
								<tr>
									<td width="100%" align="right">
										<button type="button" value=""
											onclick="add('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');" sytle=""
											class="botton_img_add">
											<i class="ico ico-kl "></i>
											<dict:lang value="提交" />
										</button>
										<button type="button" value=""
											onclick="clearSel('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');" sytle=""
											class="botton_img_add">
											<i class="ico ico-xg "></i>
											<dict:lang value="清空" />
										</button>
										<%-- <button type="button" value=""
											onclick="parent.closePopWinFp('${popId}pop','${popId}shadow');"
											sytle="" class="botton_img_add">
											<i class="ico ico-sc "></i><dict:lang value="关闭" />
										</button>--%>
										
										<%--
										<button type="button" class="botton_img_add"  value="" onclick="searchAjaxOpen(this);">
											<i class="ico ico-search-new"></i><dict:lang value="查询" />
										</button>
										--%>
										
										</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>

			<div class="bd" style="height:calc(100% - 40px - 5px);">
				<div class="search-box" style="">
					<form id="searchForm" name="searchForm" action="" method="post">
					   <input type="hidden" name="paraMap.title" value="<c:out value='${title}' />" >
					   <input type="hidden" name="paraMap.UI_DATA" value="<c:out value='${UI_DATA}' />" >
					   <input type="hidden" name="paraMap.paramKey" value="<c:out value='${popId}' />" >
					   <table class="search_table">
								<tr>
									<td width="90%" id="search-td">
									</td>
								</tr>
					   </table>
							<input type="hidden" name="paraMap.searchParaShowState" id="paraMap_searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
							<input type="hidden" id="searchParaNull" value="4" />
							<input type="hidden" id="isOpener" value="1" />
					</form>
					<!--  <a href="javascript:void(0);" class="more"></a>-->
				</div>
				<form id="submitForm" name="submitForm" action="" method="post" target="submitFrame">
				
					<div class="panel datagrid datagrid-div1">
					  <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
					  	  <div class="datagrid-header">
					  	     <div class="datagrid-header-inner" id="datagrid-header-inner">
								<table id="datagrid-htable" class="datagrid-htable fixedTable" style="height: 30px;">
									<tbody>
										  <tr class="thcolor">
										  	<td width="30px" align="center">连接符(</td>
										  	<td width="50px" align="center">比较运算符</td>
										  	<td width="90px" align="center">查询值</td>
										  	<td width="30px" align="center" style="">连接符)</td>
										  	<td width="50px" align="center" style="">条件运算符</td>
										  	<td width="15px" align="center" style="">
										  		<a onclick="groupselect_add()" href="javascript:void(0);"><img src="/mc/plf/style/css1/images/button_add.gif?_mc_res_version=20180205"></a>
										  	</td>
										  	
										  </tr>

									</tbody>
								</table>
							  </div>
							</div>
							 <div class="datagrid-body datagrid-div3" id="datagrid-body">
								<table class="datagrid-btable fixedTable" id="datagrid-btable">
									<tbody>
										<!--<s:iterator value="#request.dataLs" id="data" status="seq">
											<tr  class="datagrid-row " style="cursor: pointer;"
												onclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>');"
												ondblclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',true);">
												<td class="datagrid-cell" width="40px" align="center"><input type="radio" name="selectValue"></td>
												<td class="datagrid-cell"><s:property value="#seq.count" /></td>
												<s:iterator value="dataLa" id="val">
													<td class="datagrid-cell"><s:property value="#val" /></td>
												</s:iterator>
											</tr>
										</s:iterator>-->
										
										<!-- 
										  <tr class="datagrid-row" style="cursor: pointer" onclick="selectVal(this,'key_0','value_0')" ondblclick="selectVal(this,'key_0','value_0',true)">
										-->
										  <tr class="datagrid-row" style="cursor: pointer" id="data_row1">
										  	<td class="datagrid-cell" width="30px" align="center">
										  		<input name="left_kh" type="checkbox" value="("/>&nbsp;&nbsp;(

										  	</td>
										  	
										  	<td class="datagrid-cell" width="50px" align="center">
										  		<select name="compare_sign" style="width:70px;"> 
										  		   <option value ="=">=</option>
												   <option value =">">></option>
												   <option value ="<"><</option>
												   <option value =">=">>=</option>
												   <option value ="<="><=</option>
												   <option value ="like">like</option>
													
												</select>
												
										  	</td>
										  	
										  	<td class="datagrid-cell" width="90px" align="center">
										  		<input name="select_value" type="text" value="" style="width:200px;"/>
										  	</td>
										  	
										  	<td class="datagrid-cell" width="30px" align="center" style=";">
										  		)&nbsp;&nbsp;<input name="right_kh" type="checkbox" value=")" />
										  	</td>
										  	
										  	<td class="datagrid-cell" width="50px" align="center" style=";">
										  		<select name="connect_sign" style="width:70px;"> 
										  		   <option value ="">-请选择-</option>
												   <option value ="and">and</option>
												   <option value ="or">or</option>
												   
												</select>
												
										  	</td>
										  	
										  	<td class="datagrid-cell" width="15px" align="center" style=";">
										  		<a onclick="groupselect_del(this)" href="javascript:void(0);">
										  			<img src="/mc/plf/style/css1/images/ContImg10.gif?_mc_res_version=20180205">
										  		</a>
										  	</td>
										  	
										  </tr>
										  
										  
										  
									</tbody>
								</table>
							</div>
					  </div>
					</div>
					
					
					

			<div class="center">
			    <c:choose>
					<c:when test="${isFullScreen==1}">
						<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=getDataTable&formId=formId1&showLoading=0" />
					</c:when>
					<c:otherwise>
						<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=getDataTable&formId=formId1&showLoading=0" />
					</c:otherwise>
				</c:choose>
			</div>
	</div>
			</form>
		</div>
	</div>
	</div>
	<script type="text/javascript">
	//var ISMORELANG = "<c:out value='${ISMORELANG}' />";//平台所有控件增加是否多语言配置项
	//alert(ISMORELANG);

	var _key;
	var _value;
	//cjd callClearFunc 2017-12-15
	var ccbFun,callClearFunc;
	var titles;
	var _resObj = new Object();
	var parentWindow;
	if(top.$("#"+window.frameElement.name)[0] != null)
	{
		parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
	}

	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){utilsFp.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function add(pop,shadow){
		 _key='';
		 _value='';
	
		 var tr_nums=$("#datagrid-btable tr").length;
		 if(tr_nums==0){
		 	utilsFp.confirmIcon(3,"","","", "请先配置组合查询条件","","300","165");
		 	return false;
		 }
		
		 var select_value='';//查询值
	     var connect_sign='';//条件运算符
	     var compare_sign='';//比较运算符
	     var left_kh='';//连接符(
	     var right_kh='';//连接符)
	     var flag=false;
	     
	     var left_kh_nums=0;
	     var right_kh_nums=0;
	     
	     var json = [];
		 $("#datagrid-btable tr").each(function(i){
		 	var row = {};
		 	
		 	var tr_num=i+1;
		 	
		 	var left_kh_ck=$(this).find('td').find(":input[name='left_kh']").eq(0).prop("checked");
		 	//if(left_kh_ck=='checked'){
		 	if(left_kh_ck){
		 		left_kh='(';
		 		left_kh_nums=left_kh_nums+1;
		 	}else{
		 		left_kh='';
		 	}   
		 	
			select_value=$(this).find('td').find(":input[name='select_value']").val();  
			if(select_value==null || select_value==''){
		 		utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的查询值不能为空","","300","165");
		 		flag=true;
		 		return false;
		 	}
		 	
		 	compare_sign=$(this).find('td').find(":input[name='compare_sign']").val();  
		 	if(compare_sign=='>' || compare_sign=='<' || compare_sign=='>=' || compare_sign=='<='){
		 		if(isNaN(select_value)){
					utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的查询值只能输入数字","","300","165");
					flag=true;
			   		return false;
				}
				
		 	}
		 	
		 	connect_sign=$(this).find('td').find(":input[name='connect_sign']").val();  
		 	if(tr_num>0 && tr_num!=tr_nums){   
				if(connect_sign==null || connect_sign==''){
			 		utilsFp.confirmIcon(3,"","","", "请选择第"+tr_num+"行的条件运算符","","300","165");
			 		flag=true;
			 		return false;
			 	}
		 	
		 	}
		 	
		 	if(tr_num==tr_nums){
				if(connect_sign!=null && connect_sign!=''){
			 		utilsFp.confirmIcon(3,"","","", "请清空第"+tr_num+"行的条件运算符","","300","165");
			 		flag=true;
			 		return false;
			 	}
		 	
		 	}
		 	
		 	var right_kh_ck=$(this).find('td').find(":input[name='right_kh']").eq(0).prop("checked");
		 	//if(right_kh_ck=='checked'){
		 	if(right_kh_ck){
		 		right_kh=')';
		 		right_kh_nums=right_kh_nums+1;
		 	}else{
		 		right_kh='';
		 	}   
			if(connect_sign!='' && right_kh==')'){
		 		//utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的条件运算符和连接符)只能配置其中一项","","300","165");
		 		//flag=true;
		 		//return false;
		 	}
		 	
		 	_value=_value+left_kh+' '+compare_sign+' '+select_value+' '+right_kh+' '+connect_sign+' ';
		 	
		 	row.left_kh= left_kh;
		 	row.compare_sign= compare_sign;
		 	row.select_value= select_value;
		 	row.right_kh= right_kh;
		 	row.connect_sign= connect_sign;
		 	json.push(row);
		 	
		 });
		 
		 if(flag){
		 	return false;
		 }
		 
		 //检查(和)数量是否匹配
		 if(left_kh_nums!=right_kh_nums){
		 	utilsFp.confirmIcon(3,"","","", "连接符(和连接符)不匹配,请检查","","300","165");
		 	return false;
		 }
		 
		_key = JSON.stringify(json);
		//alert(_key);
		 
		if(null == _key || _key==''){
			//utilsFp.alert("<dict:lang value="选择项不能为空" />");
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="组合查询配置不能为空" />","","300","165");
			return false;
		}
		if(ccbFun == "" || ccbFun == null){
			_key=decodeHtml(_key);
			_value=decodeHtml(_value);
			_setSelValue(_key,_value,_resObj);
		}else{
	    	_key=decodeHtml(_key);
			_value=decodeHtml(_value);
			eval("parentWindow."+ccbFun+"(_key,_value,_resObj)");<%-- 加入回调函数 --%>
		 
		}
		parent.closePopWinFp(pop,shadow);
		 
	}
	
	function clearSel(pop,shadow){
		if(ccbFun == "" || ccbFun == null){
			_setSelValue("","",null);
		}else{
			eval("parentWindow."+ccbFun+"('','',null)");<%-- 加入回调函数 --%>
		}
	   
		if(callClearFunc!=""&&callClearFunc!=null ){ 
		  eval("parentWindow."+callClearFunc+"()");<%-- 加入回调函数 --%>
		} 
		parent.closePopWinFp(pop,shadow);
	}
	
	function selectVal(thisObj,key,value,isClose){
		_key = dataArry[key];
		_value =dataArry[value];
		extVals=$(thisObj).find("td");
		$.each(titles,function(i,title){
			_resObj[title] = extVals.eq(i+2).text();
		});
		_resObj=$(thisObj).find("td");
		$(thisObj).find("input[type='radio'][name='selectValue']").eq(0).prop("checked",true);
		if(isClose){add('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');}
	}

	<%-- 回填选择的值 --%>
	function _setSelValue(key,val,obj){
		_thisSelObj=parentWindow._thisSelObj;
		_thisSelObj.value = val;
		var editName=$(_thisSelObj).attr("editName");
		parentWindow.$("input[name='"+editName+"']").val(key);
		_thisSelObj.focus();
	}
	
	
	function searchAjaxOpen(thisObj){
 	   getDataTable("formId1");
 	};
	
	function initPage(page){
		var ajaxPage = new Object();
    	ajaxPage.currentPage = parseInt(page.currentPage);
    	ajaxPage.pageRecord = parseInt(page.pageRecord);
    	ajaxPage.totalPage = parseInt(page.totalPage);
    	ajaxPage.totalRecord = parseInt(page.totalRecord);
    	ajaxPage.first = page.first;
    	ajaxPage.last = page.last;
    	showPageBar(ajaxPage,"formId1");
	};
	
	function getDataTable(paginationImpl){
		var url = "${path}buss/bussModel_showSelFkSql.ms";
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	    util.showLoading("处理中...");
	    $.ajax({
	           type: "POST",
		       dataType: "json",
		       url: url,
		       data:$("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
			   success: function(data){
				var arrDataList = data.ajaxMap;
				if(isFirstLoad){
					titles = arrDataList.titleLs;
					createSerachModel(arrDataList.titleLs,arrDataList.multList);
					createTableTitleModel(arrDataList.titleLs,arrDataList.multList);
				}
				if(arrDataList.dataLs){
					createTableModel(arrDataList.dataLs,currentPage,pageRecord);
				}else{
					clearTable();
				}
				ccbFun = arrDataList.ccbFun;
				callClearFunc=arrDataList.callClearFunc;
				initPage(arrDataList.page);
			},
			error: function(msg){
				isSubmit = false;
			}
		});
   	}
	
	function clearTable(){
		$("#datagrid-btable tr").empty();
	}
	
	// 创建搜索条件
	function createSerachModel(titleLs,multList){
		var arr = [];
		if(!$.isEmptyObject(multList)){
			$.each(titleLs,function(i,title){
				$.each(multList,function(i,colp){//<s:property value="FIELD_NAME"/>
					if(title == colp.SHOW_NAME && colp.IS_SEARCH=="1"){
						arr.push("<div class='group'>");
						arr.push("<div class='name' title='等于'>");
						arr.push(title);
						arr.push("</div>");
						arr.push("<div class='dec'>");
						arr.push("<input type='text' id='paraMap2_"+colp.FIELD_NAME+"' ");
						arr.push("name = 'paraMap2."+colp.FIELD_NAME+"' ");
						arr.push("value = '' class='input'>");
						arr.push("</div>");
						arr.push("</div>");
					}
				});
			});
		}else{
			$.each(titleLs,function(i,title){
				arr.push("<div class='group'>");
				arr.push("<div class='name' title='等于'>");
				arr.push(title);
				arr.push("</div>");
				arr.push("<div class='dec'>");
				arr.push("<input type='text' id='paraMap2_"+title+"' ");
				arr.push("name = 'paraMap2."+title+"' ");
				arr.push("value = '' class='input'");
				arr.push("</div>");
				arr.push("</div>");
			});
		}
		$("#search-td").html(arr.join(""));
		initSearch();
	}
	
	// 创建表格标题
	function createTableTitleModel(titleLs,multList){
		var arr = [];
		_multList = multList;
		arr.push("<td width='30px' align='center'></td>");
		arr.push("<td width='30px' align='center'>&nbsp;&nbsp;</td>");
		$.each(titleLs,function(i,title){
			$.each(multList,function(i,colp){
				if(title == colp.SHOW_NAME && colp.IS_SHOW=="1"){
					arr.push("<td align='center' style='"+colp.OBJ_STYLE+"'>");
					arr.push(title);
					arr.push("</td>");
				}
				if(title == colp.SHOW_NAME && colp.IS_SHOW=="0"){
					arr.push("<td align='center' class='hide' style='"+colp.OBJ_STYLE+";display:none;'>");
					arr.push(title);
					arr.push("</td>");
				}
			});
		});
		$(".thcolor").html(arr.join(""));
	}
	
	// 创建表格内容
	var _multList = null;
		var dataArry={};
	function createTableModel(tableData,currentPage,pageRecord){
		var hideCol = [];
		$(".thcolor").find("td").each(function(i,obj){
			if($(this).hasClass("hide")){
				hideCol.push("display:none;");
			}else{
				hideCol.push("");
			}
		});
		var arr = [];
		var i=0;
		$.each(tableData,function(i,v){
			var key= "key_"+i;
			var value= "value_"+i;
			dataArry[key]=v.key;
			dataArry[value]=v.value;
			arr.push("<tr class='datagrid-row' style='cursor: pointer' ");
			arr.push("onclick=\"selectVal(this,'"+key+"','"+value+"')\"" );
			arr.push("ondblclick=\"selectVal(this,'"+key+"','"+value+"',true)\"");
			arr.push(">");
			arr.push("<td class='datagrid-cell' width='30px' align='center'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
			arr.push("<td class='datagrid-cell' width='30px' align='center'><input type='radio' name='selectValue'></td>");
			$.each(v.dataLa,function(i,v){
				//arr.push("<td class='datagrid-cell' style="+hideCol[i+2]+">"+tableTextIsNull(v)+"</td>");
				arr.push("<td class='datagrid-cell' style="+_multList[i].OBJ_STYLE+";" +hideCol[i+2]+">"+tableTextIsNull(v)+"</td>");
			});
			arr.push("</tr>");
		});
		$("#datagrid-btable").html(arr.join(""));
		$(".datagrid-btable> tbody tr:odd").addClass("tr-hover");//奇数行
	}
	
	function tableTextIsNull(v){
		if(v == null || v == "null"){
			return "";
		}else{
			return v;
		}
	}
	
	function firstLoadThisPage(paginationImpl){
		if(typeof(_GLO_FORM_PAGE_MAP[paginationImpl].currentPage) =="undefined"){
			return true;
		}
		return false;
	}
	
	
	function initSearch(){
		if($(".group").length =="0"){
			$(".search-box").hide();
		}else if($(".group").length <= "1"){
			$(".search-box .more").hide();
		}else{
			$(".search-box .group").each(function(i){
				if(i > 0 && ($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0")){
					$(this).hide();
				}
			});
			
			if($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0"){
				$(".search-box").addClass("show");
			}else{
				$(".search-box").removeClass("show");
			}
		}		
	}
	
	function init(){
		//getDataTable("formId1");
		
	
		$(".search-box .more").click(function(){
			//$('body').css('overflow','auto');
			
   			$(".search-box .group").each(function(i){
   				if(i > 0){
   					$(this).toggle();
   				}
   			});
   			
            if($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0"){
            	$("#paraMap_searchParaShowState").val("1");
            	$(".search-box").removeClass("show");
            }else{
            	$("#paraMap_searchParaShowState").val("0");
            	$(".search-box").addClass("show");
            }
            
            $(".panel").height($(window).height() - $(".search_table").height() - 92)
               			
		});
		//getColData();
		
	/*隔行换色
	$(".datagrid-btable").each(function(seq) {
		var tableTrJs =$(this).find("tbody tr");
		tableTrJs.each(function(i) {
			if (i % 2 == 0) {
			} else {
				$(this).addClass("tr-hover");
			}
		});
	});*/
	
	//选中换色
	$(".datagrid-btable tbody tr").click(function() {
	     var _this = $(this);
	    if(!_this.hasClass("datagrid-selected")){
	      _this.addClass("datagrid-selected").siblings().removeClass("datagrid-selected");
	    }
	   if(_this.hasClass("tr-hover") && _this.hasClass("datagrid-selected")){
	    	 _this.removeClass("tr-hover").addClass("tr-hover-flag");
	    }
	    
	    _this.siblings().each(function(){
	    	if($(this).hasClass("tr-hover-flag")){
				$(this).addClass("tr-hover").removeClass("tr-hover-flag");
	    	}
	    });
	  });
	  
	  //初始化配置
	  var _key='${_key}';
	  //alert(_key);
	  if(_key!=null && _key!=''){
	  	  $("#data_row1").remove();
	  	  
	  	  var nodeObj=jQuery.parseJSON(_key); //由JSON字符串转换为JSON对象 
	      $("#reportNode").empty();
	      var ipPort="";
	      for(var i=0; i<nodeObj.length; i++){  
	            var left_kh=nodeObj[i].left_kh; 
	            var compare_sign=nodeObj[i].compare_sign; 
	            var select_value=nodeObj[i].select_value; 
	            var connect_sign=nodeObj[i].connect_sign; 
	            var right_kh=nodeObj[i].right_kh; 
	          
	            var arr = [];	
				arr.push("<tr class='datagrid-row' style='cursor: pointer'> ");
		        arr.push("<td class='datagrid-cell' width='30px' align='center'> ");
		        
		        if(left_kh==null || left_kh==''){
		        	 arr.push("<input name='left_kh' type='checkbox' value='('/>&nbsp;&nbsp;( ");
		        }else{
		        	 arr.push("<input checked='checked' name='left_kh' type='checkbox' value='('/>&nbsp;&nbsp;( ");
		        }
		
		        arr.push("</td> ");
		                        
		        arr.push("<td class='datagrid-cell' width='50px' align='center'> ");
		        arr.push("<select name='compare_sign' style='width:70px;'> "); 
		        
		        if(compare_sign=='='){
		        	 arr.push("<option selected ='true' value ='='>=</option> ");
		        }else{
		        	 arr.push("<option value ='='>=</option> ");
		        }
		        
		        if(compare_sign=='>'){
		        	arr.push("<option selected ='true' value ='>'>></option> ");
		        }else{
		        	arr.push("<option value ='>'>></option> ");
		        }
		        
		        if(compare_sign=='<'){
		        	arr.push("<option selected ='true' value ='<'><</option> ");
		        }else{
		        	arr.push("<option value ='<'><</option> ");
		        }
		        
		        if(compare_sign=='>='){
		        	arr.push("<option selected ='true' value ='>='>>=</option> ");
		        }else{
		        	arr.push("<option value ='>='>>=</option> ");
		        }
		        
		        if(compare_sign=='<='){
		        	arr.push("<option selected ='true' value ='<='><=</option> ");
		        }else{
		        	arr.push("<option value ='<='><=</option> ");
		        }
		        
		        if(compare_sign=='like'){
		        	arr.push("<option selected ='true' value ='like'>like</option> ");
		        }else{
		        	arr.push("<option value ='like'>like</option> ");
		        }
		                          
		        arr.push("</select> ");
		                        
		        arr.push("</td> ");
		                        
		        arr.push("<td class='datagrid-cell' width='90px' align='center'> ");
		        arr.push("<input name='select_value' type='text' value='"+select_value+"' style='width:200px;'/> ");
		        arr.push("</td> ");
		                                     
		        arr.push("<td class='datagrid-cell' width='30px' align='center' style=';'> ");
		        
		        if(right_kh==null || right_kh==''){
		        	 arr.push(")&nbsp;&nbsp;<input name='right_kh' type='checkbox' value=')'/> ");
		        }else{
		        	 arr.push(")&nbsp;&nbsp;<input checked='checked' name='right_kh' type='checkbox' value=')'/> ");
		        }
		        
		        arr.push("</td> ");
		        
		        arr.push("<td class='datagrid-cell' width='50px' align='center' style=';'> ");
		        arr.push("<select name='connect_sign' style='width:70px;'> "); 
		        
		        if(connect_sign==null || connect_sign==''){
		        	arr.push("<option selected ='true' value =''>-请选择-</option> ");
		        }else{
		        	arr.push("<option value =''>-请选择-</option> ");
		        }
		        
		        if(connect_sign=='and'){
		        	 arr.push("<option selected ='true' value ='and'>and</option> ");
		        }else{
		        	 arr.push("<option value ='and'>and</option> ");
		        }
		        
		        if(connect_sign=='or'){
		        	 arr.push("<option selected ='true' value ='or'>or</option> ");
		        }else{
		        	 arr.push("<option value ='or'>or</option> ");
		        }
		                           
		        arr.push("</select> ");
		                        
		        arr.push("</td> ");
		                        
		        arr.push("<td class='datagrid-cell' width='15px' align='center' style=';'> ");
		        arr.push("<a onclick='groupselect_del(this)' href='javascript:void(0);'> ");
		        arr.push("<img src='/mc/plf/style/css1/images/ContImg10.gif?_mc_res_version=20180205'> ");
		        arr.push("</a> ");
		        arr.push("</td> ");
		                        
		        arr.push("</tr> ");
				
				$("#datagrid-btable").append(arr.join(""));
	     
	      }
	      
	  }

	}
	window.history.forward(1); 

		$(".dept_select").chosen({
			disable_search_threshold:15//少于15项，隐藏搜索框
		});
	init(); 
	
	
	function groupselect_del(obj){
		$(obj).parent().parent().remove();
	}
	
	function groupselect_add(){
	     var tr_nums=$("#datagrid-btable tr").length;
		 if(tr_nums>4){
		 	utilsFp.confirmIcon(3,"","","", "组合查询配置条件最多配置5个","","300","165");
		 	return;
		 }
	     
	     var select_value='';//查询值
	     var connect_sign='';//条件运算符
	     var compare_sign='';//比较运算符
	     var right_kh='';//连接符)
	     var flag=false;
		 $("#datagrid-btable tr").each(function(i){
		 	var tr_num=i+1;
		 	
			select_value=$(this).find('td').find(":input[name='select_value']").val();  
			if(select_value==null || select_value==''){
		 		utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的查询值不能为空","","300","165");
		 		flag=true;
		 		return false;
		 	}
		 	
		 	compare_sign=$(this).find('td').find(":input[name='compare_sign']").val();  
		 	if(compare_sign=='>' || compare_sign=='<' || compare_sign=='>=' || compare_sign=='<='){
		 		if(isNaN(select_value)){
					utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的查询值只能输入数字","","300","165");
					flag=true;
			   		return false;
				}
				
		 	}
		 	  
			connect_sign=$(this).find('td').find(":input[name='connect_sign']").val();     
			if(connect_sign==null || connect_sign==''){
		 		utilsFp.confirmIcon(3,"","","", "请选择第"+tr_num+"行的条件运算符","","300","165");
		 		flag=true;
		 		return false;
		 	}
		 	
		 	var right_kh_ck=$(this).find('td').find(":input[name='right_kh']").eq(0).prop("checked");
		 	//if(right_kh_ck=='checked'){
		 	if(right_kh_ck){
		 		right_kh=')';
		 	}else{
		 		right_kh='';
		 	}   
			if(connect_sign!='' && right_kh==')'){
		 		//utilsFp.confirmIcon(3,"","","", "第"+tr_num+"行的条件运算符和连接符)只能配置其中一项","","300","165");
		 		//flag=true;
		 		//return false;
		 	}
		 	
		 });
		 
		 if(flag){
		 	return false;
		 }
	
		var arr = [];	
		arr.push("<tr class='datagrid-row' style='cursor: pointer'> ");
        arr.push("<td class='datagrid-cell' width='30px' align='center'> ");
        arr.push("<input name='left_kh' type='checkbox' value='('/>&nbsp;&nbsp;( ");

        arr.push("</td> ");
                        
        arr.push("<td class='datagrid-cell' width='50px' align='center'> ");
        arr.push("<select name='compare_sign' style='width:70px;'> "); 
        arr.push("<option value ='='>=</option> ");
        arr.push("<option value ='>'>></option> ");
        arr.push("<option value ='<'><</option> ");
        arr.push("<option value ='>='>>=</option> ");
        arr.push("<option value ='<='><=</option> ");
        arr.push("<option value ='like'>like</option> ");
                          
        arr.push("</select> ");
                        
        arr.push("</td> ");
                        
        arr.push("<td class='datagrid-cell' width='90px' align='center'> ");
        arr.push("<input name='select_value' type='text' value='' style='width:200px;'/> ");
        arr.push("</td> ");
           
        arr.push("<td class='datagrid-cell' width='30px' align='center' style=';'> ");
        arr.push(")&nbsp;&nbsp;<input name='right_kh' type='checkbox' value=')'/> ");
        arr.push("</td> ");
        
        arr.push("<td class='datagrid-cell' width='50px' align='center' style=';'> ");
        arr.push("<select name='connect_sign' style='width:70px;'> "); 
        arr.push("<option value =''>-请选择-</option> ");
        arr.push("<option value ='and'>and</option> ");
        arr.push("<option value ='or'>or</option> ");
                           
        arr.push("</select> ");
                        
        arr.push("</td> ");
                        
        arr.push("<td class='datagrid-cell' width='15px' align='center' style=';'> ");
        arr.push("<a onclick='groupselect_del(this)' href='javascript:void(0);'> ");
        arr.push("<img src='/mc/plf/style/css1/images/ContImg10.gif?_mc_res_version=20180205'> ");
        arr.push("</a> ");
        arr.push("</td> ");
                        
        arr.push("</tr> ");
		
		$("#datagrid-btable").append(arr.join(""));
		
	}
	
	</script>
</body>
