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
	<jsp:param name="serializeForm" value="1" />
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
	//setPopScroll("#overflow_content"); 
	
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
										<button type="button" class="botton_img_add"  value="" onclick="searchAjaxOpen(this);">
											<i class="ico ico-search-new"></i><dict:lang value="查询" />
										</button>
										</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="bd" id = "overflow_content" style="height:calc(100% - 40px - 5px); ">
				<div class="search-box" style="">
					<form id="searchForm" name="searchForm" action="" method="post">
					   <input type="hidden" name="paraMap.title" value="<c:out value='${title}' />" >
					   <input type="hidden" name="paraMap.UI_DATA" value="<c:out value='${UI_DATA}' />" >
					   <input type="hidden" name="paraMap.paramKey" value="<c:out value='${popId}' />" >
					   <input type="hidden" name="paraMap.dataAuth" value="<c:out value='${paraMap.dataAuth}' />" >
					   <input type="hidden" name="paraMap.isOpenDataAuth" value="<c:out value='${paraMap.isOpenDataAuth}' />" >
					   <table class="search_table">
								<tr>
									<td width="90%" id="search-td">
									</td>
								</tr>
					   </table>
							<input type="hidden" name="paraMap.searchParaShowState" id="paraMap_searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
							<input type="hidden" id="searchParaNull" value="4" />
							<input type="hidden" id="isOpener" value="1" />
							<input type="hidden" id="isOpener" value="1" />
							<input type="text" style="display:none;">
					</form>
					<a href="javascript:void(0);" class="more"></a>
				</div>
				<form id="submitForm" name="submitForm" action="" method="post" target="submitFrame">
				
					<div class="panel datagrid datagrid-div1">
					  <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
					  	  <div class="datagrid-header">
					  	     <div class="datagrid-header-inner" id="datagrid-header-inner03b09741c53541aaaea80383029ebe4b" style="width: 100%;">
								<table id="datagrid-htable03b09741c53541aaaea80383029ebe4b" class="datagrid-htable fixedTable " style="height: 30px;">
									<tbody>
										<tr class="thcolor datagrid-header-row isPopRadioTable">
											
										</tr>
									</tbody>
								</table>
							  </div>
							</div>
							 <div class="datagrid-body datagrid-body-ajax datagrid-div3" id="tableDiv03b09741c53541aaaea80383029ebe4b">
								<table class="datagrid-btable fixedTable" id="datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b">
									<tbody id="tbody_03b09741c53541aaaea80383029ebe4b">
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
		if(null == _key){
			//utilsFp.alert("<dict:lang value="选择项不能为空" />");
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="选择项不能为空" />","","260","145");
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
		var formData = form.serialize($("#searchForm"));
		formData["page.currentPage"] =currentPage;
		formData["page.pageRecord"] =pageRecord;
	    util.showLoading("处理中...");
	    $.ajax({
	           type: "POST",
		       dataType: "json",
		       url: url,
		       data:formData,
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
		$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b tr").empty();
	}
	
    function guid() {
        return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    }

	
	// 创建搜索条件
	function createSerachModel(titleLs,multList){
		var arr = [];
		
		if(!$.isEmptyObject(multList)){
			$.each(titleLs,function(i,title){
				$.each(multList,function(i,colp){//<s:property value="FIELD_NAME"/>
					if(title == colp.SHOW_NAME && colp.IS_SEARCH=="1"){
						var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
						var id=guid();
						arr.push("<div class='group'>");
						arr.push("<div class='name' title='等于'>");
						arr.push(title);
						arr.push("</div>");
						arr.push("<div class='dec'>");
						if(reg.test(colp.FIELD_NAME)){
							arr.push("<input type='text' id='paraMap2_a"+id+"' ");
							arr.push("name = 'paraMap2.a"+id+"' ");
							arr.push("value = '' class='input'>");
							arr.push("<input type='hidden' id='paraMap6_a"+id+"' ");
							arr.push("name = 'paraMap6.a"+id+"' ");
							arr.push("value = '"+colp.FIELD_NAME+"' class='input'>");
						}else{
							arr.push("<input type='text' id='paraMap2_"+colp.FIELD_NAME+"' ");
							arr.push("name = 'paraMap2."+colp.FIELD_NAME+"' ");
							arr.push("value = '' class='input'>");
						}
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
	
	function isShowColList(multList){
		var showCol = 0;
		$.each(multList,function(i,colp){
			if(colp.IS_SHOW=="1"){
				showCol++;
			}
		});
		return showCol;
		
	}
	
	// 创建表格标题
	function createTableTitleModel(titleLs,multList){
		var arr = [];
		_multList = multList;
		arr.push("<td  style='width:30px;' align='center'></td>");
		arr.push("<td  style='width:30px;'  align='center'>&nbsp;&nbsp;</td>");
		var tdWidth = ($(window).width() - 2)/(isShowColList(multList))+"px";
		$.each(titleLs,function(i,title){
			$.each(multList,function(i,colp){
				if(title == colp.SHOW_NAME && colp.IS_SHOW=="1"){
					arr.push("<td align='center' style='width:"+tdWidth+";"+colp.OBJ_STYLE+"'>");
					arr.push(title);
					arr.push("</td>");
				}
				if(title == colp.SHOW_NAME && colp.IS_SHOW=="0"){
					arr.push("<td align='center' class='hide' style='width:"+tdWidth+";"+colp.OBJ_STYLE+";display:none;'>");
					arr.push(title);
					arr.push("</td>");
				}
			});
		});
		$(".thcolor").html(arr.join(""));
		_addDragTableEvent("03b09741c53541aaaea80383029ebe4b");
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
		var tdWidth = "";
		if(tableData.length>0){
			tdWidth = ($(window).width() - 2)/(tableData[0].dataLa.length)+"px";
		}
		$.each(tableData,function(i,v){
			var key= "key_"+i;
			var value= "value_"+i;
			dataArry[key]=v.key;
			dataArry[value]=v.value;
			arr.push("<tr class='datagrid-row' style='cursor: pointer' ");
			arr.push("onclick=\"selectVal(this,'"+key+"','"+value+"')\"" );
			arr.push("ondblclick=\"selectVal(this,'"+key+"','"+value+"',true)\"");
			arr.push(">");
			arr.push("<td class='datagrid-cell' style='width:30px;' align='center'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
			arr.push("<td class='datagrid-cell' style='width:30px;' align='center'><input type='radio' name='selectValue'></td>");
			$.each(v.dataLa,function(i,v){
				//arr.push("<td class='datagrid-cell' style="+hideCol[i+2]+">"+tableTextIsNull(v)+"</td>");
				arr.push("<td class='datagrid-cell' style="+_multList[i].OBJ_STYLE+";" +hideCol[i+2]+";width:"+tdWidth+">"+tableTextIsNull(v)+"</td>");
			});
			arr.push("</tr>");
		});
		$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b tbody").html(arr.join(""));
		$(".datagrid-btable> tbody tr:odd").addClass("tr-hover");//奇数行
		defTableWidthRewrite("03b09741c53541aaaea80383029ebe4b");
		setScroll("03b09741c53541aaaea80383029ebe4b");
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
	
	//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
	function get_select_nums(){
		var select_nums=parseInt((Number($(window).width())-50*2)/330);//每行查询条件数量
		select_nums=select_nums-1;
		if(select_nums<=0){
			select_nums=0;
		}
	
		return select_nums;
	}
	
	
	function initSearch(){
		if($(".group").length =="0"){
			$(".search-box").hide();
		}else if($(".group").length <= "1"){
			$(".search-box .more").hide();
		}else{
			$(".search-box .group").each(function(i){
				//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
				//if(i > 0 && ($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0")){
				if(i > get_select_nums() && ($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0")){
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
		getDataTable("formId1");
		
	
		$(".search-box .more").click(function(){
			$('body').css('overflow','auto');
			
   			$(".search-box .group").each(function(i){
   				//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
   				//if(i > 0){
   				if(i > get_select_nums()){
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

	}
	window.history.forward(1); 

		$(".dept_select").chosen({
			disable_search_threshold:15//少于15项，隐藏搜索框
		});
	init(); 
	$(function(){
		
	});
	</script>
</body>
