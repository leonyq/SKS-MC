<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
<script type="text/javascript">

</script>
</head>
<body scroll="auto" style="overflow: auto;">
	<div class="content-in">
			<div class="hd">
				
					<div id='timeBucketId'></div>
					<div class="optn" style="margin-right:6px;margin-top:46px;">
						<form id="funForm" name="funForm" action="/mes/buss/bussModel.ms"
							method="post" target="submitFrame">
							<table class="func_table">
								<tr>
									<td width="100%" align="right">
										<button type="button" value=""
											onclick="add();" sytle=""
											class="botton_img_add">
											<i class="ico ico-kl "></i>
											<dict:lang value="提交" />
										</button>
										<button type="button" value=""
											onclick="clearSel();" sytle=""
											class="botton_img_add">
											<i class="ico ico-xg "></i>
											<dict:lang value="清空" />
										</button>
										<button type="button" value=""
											onclick="closePopWinFp('hidePop_65eec5ae8fa948b0bfaa48c814f5725d','hidePops_65eec5ae8fa948b0bfaa48c814f5725d');"
											sytle="" class="botton_img_add">
											<i class="ico ico-sc "></i><dict:lang value="关闭" />
										</button>
										<button class="botton_img_add" onclick="search_item();">
											<i class="ico ico-search-new"></i><dict:lang value="查询" />
										</button></td>
								</tr>
							</table>
							</form>
					</div>
			</div>

			<div class="bd">
				<div class="search-box">
					<form id="searchForm" name="searchForm" action="" method="post">
						<table class="search_table" style="margin-top:10px;">
								<tr>
									<td style="width:28%" align="right">料号&nbsp;<input style="width:70%" id ="itemCode"></td>
									<td style="width:33%" align="center">料号名称&nbsp;<input style="width:60%" id ="itemName"></td>
									<td style="width:33%" align="left">料号规格&nbsp;<input style="width:60%" id ="itemSpec"></td>
								</tr>
							</table>
					</form>
				</div>

				<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
					<div style="margin: 5px;">
						<table id="add_table" width="100%" class="dlist-table table-line " style="width: 100%;table-layout: fixed;">
							<thead>
								<tr class="thcolor">
									<th width="34px;" style="text-align:center;">&nbsp;&nbsp;</th>
									<th width="34px;" style="text-align:center;">序号</th>
									<th width="137px;" style="text-align:center;">料号</th>
									<th width="206px;" style="text-align:center;">料号名称</th>
									<th width="141px;" style="text-align:center;">料号规格</th>
									<th width="137px;" style="text-align:center;">料号类型</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.dataList}" var="items" varStatus="status">
								<tr style="cursor: pointer;"onclick="selectVal(this);"
										ondblclick="selectVal(this,true);">
								<td align="center"><input type="radio" id="${items.ID}" name="single"/></td>
								<td align="center">${status.index+1}</td>
								<td align="center">${items.CI_ITEM_CODE}</td>
								<td align="center" style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;"  title="${items.CI_ITEM_NAME}">${items.CI_ITEM_NAME}</td>
								<td align="center" style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;"  title="${items.CI_ITEM_SPEC}">${items.CI_ITEM_SPEC}</td>
								<td align="center">${items.CI_ITEM_TYPE}</td>
								</tr>
							 
							 </c:forEach>
							</tbody>
						</table>
					</div>
					<div class="center"></div>
			</div>
			<c:choose>
				<c:when test="${isFullScreen==1}">
					<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listAx&formId=searchForm&showLoading=0" />
				</c:when>
				<c:otherwise>
					<%--<s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
				--%>
				<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=listAx&formId=searchForm&showLoading=0" />
				</c:otherwise>
			</c:choose>

			</form>

		</div>
	</div>
	
	<script type="text/javascript">

	var _resObj = new Object();
	var parentWindow=top.$("#popupFrameFpId")[0].contentWindow;
	var tableId=$("#tableId").val();
	var ajaxPage = new Object();
	var firstTemp = "${page.first}";
	var lastTemp = "${page.last}";
	ajaxPage.currentPage = parseInt("${page.currentPage}");
	ajaxPage.pageRecord = parseInt("${page.pageRecord}");
	ajaxPage.totalPage = parseInt("${page.totalPage}");
	ajaxPage.totalRecord = parseInt("${page.totalRecord}");
	ajaxPage.first = firstTemp == "true" ? true : false;
	ajaxPage.last = lastTemp == "true" ? true : false;
	showPageBar(ajaxPage,"searchForm");
	function search_item(){
		var itemCode=$("#itemCode").val();
		var itemName=$("#itemName").val();
		var itemSpec=$("#itemSpec").val();
		var url="/mes/buss/bussModel_exeFunc.ms?FUNC_CODE=F1890&funcMId=d55495acbdfa4f0b858d8ee6b9be0600&type=0";
		$.ajax({
			url:url,
			type:"post",
			data:{"ITEM_CODE":itemCode,"ITEM_NAME":itemName,"ITEM_SPEC":itemSpec},
			success:function(data){
				var tabContent=$(data).find("#submitForm");
				$("#submitForm").html(tabContent.html());
				var pageContent=$(data).find("#pageDiv");
				$("#pageDiv").html(pageContent.html());
			}
		});
	}

	function listAx(paginationImpl){
		var url = "/mes/buss/bussModel_exeFunc.ms?FUNC_CODE=F1890&funcMId=d55495acbdfa4f0b858d8ee6b9be0600&type=0";
		
		util.showLoading("处理中...");
	  $.ajax({
		type: "POST",
	    dataType: "html",
	    url: url,
	    data: $("#searchForm").serialize()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
				var tbodyStr = "";
					var tabContent=$(data).find("#submitForm");
					$("#submitForm").html(tabContent.html());
					ajaxPage.currentPage =_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;	
					ajaxPage.pageRecord =_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
					showPageBar(ajaxPage,"searchForm");

			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});	
	}
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function add(){
		if(null == _resObj){
			util.alert("<dict:lang value="选择项不能为空" />");
			return false;
		}
		_setSelValue(_resObj);
		closePopWinFp("hidePop_"+tableId,"hidePops_"+tableId);
	}
	
	function clearSel(){
		_setSelValue(null);
		closePopWinFp("hidePop_"+tableId,"hidePops_"+tableId);
	}
	
	function selectVal(thisObj,isClose){
		$(thisObj).find("td").each(function(seq) {
			if(seq>1){
			}
		});
		_resObj=$(thisObj).find("td");
		$(thisObj).find("input[type='radio'][name='single']").eq(0).prop("checked",true);
		if(isClose){add();}
	}
	
	function init(){
		var tableTrJq = $("#add_table tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}
	
	<%-- 回填选择的值 --%>
	function _setSelValue(obj){
		if(null!=obj){
			parentWindow.$("#main_code").val(obj.eq(2).text());
			parentWindow.$("#main_code_SHOW").val(obj.eq(2).text());
			parentWindow.$("#CR_MAIN_NAME").val(obj.eq(3).text());
			parentWindow.$("#CR_MAIN_TYPE").val(obj.eq(4).text());
		}else{
			parentWindow.$("#main_code").val('');
			parentWindow.$("#main_code_SHOW").val('');
			parentWindow.$("#CR_MAIN_NAME").val('');
			parentWindow.$("#CR_MAIN_TYPE").val('');
		}
		parentWindow.$("#main_code_SHOW").focus();
	}
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
	}
</script>
<script> window.history.forward(1);  try{init();/*调用默认的初始化方法*/}catch(e){} </script>
</body>
