<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="选择物料" /></title>
	<style type="text/css">
	 .datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>	
<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
</head>
<body style="overflow-x:hidden">
	<div class="content-in" >
	<div class="dlist">
            <div class="hd">
			    	<div class="optn">
			    	        <button type="button" onclick="addCal('${dataMap.groupSn}');"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="clearSel();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button class="botton_img_add" onclick="search_item();">
											<i class="ico ico-search-new"></i><dict:lang value="查询" />
										</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        </div>
			</div>
			<div class="bd" style="height: 300px;">
					<div class="search-box">
					<form id="searchForm" name="searchForm" action="" method="post">
						<table class="search_table">
								<tr>
									<td>
										<div class="group">
											<div class="name" style="width:80px;">料号
											</div>
											<div class="dec">
												<input type="text" id="itemCode" name="itemCode" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>.
									<td>
										<div class="group">
											<div class="name" style="width:80px;">物料名称
											</div>
											<div class="dec">
												<input type="text" id="itemName" name="itemName" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="group">
											<div class="name" style="width:80px;">物料规格
											</div>
											<div class="dec">
												<input type="text" id="itemSpec" name="itemSpec" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>
								</tr>
								
							</table>
					</form>
				</div>
			<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
				
		<div class="panel datagrid datagrid-div1">
	         <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner">
				<table id="datagrid-htable" class="datagrid-htable fixedTable  " >
					<tbody>
					<tr class="thcolor">
						<td class="datagrid-cell" style="width:20px;" ></td >
						<td class="datagrid-cell" style="width:20px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
						<td class="datagrid-cell" style="width:100px;" ><dict:lang value="供应商" /></td >
						<td class="datagrid-cell" ><dict:lang value="类型" /></td >
					</tr>
					</tbody>
	          </table>
	 </div>
</div>
								
							
	<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height:326px;">
		<table class="datagrid-btable fixedTable" id="selectItem">					
					<tbody id="loadItem">	
					<input type="hidden" id="totalPage" value="${page.totalPage}"/>
			<input type="hidden" id="totalRecord" value="${page.totalRecord}"/>				
					<c:forEach items="${page.dataList}" var="cdlList" varStatus="status">
								<tr id="${cdlList.rownum}" name="${cdlList.rownum}">
									<td  class="datagrid-cell datagrid-cell-0"  style="text-align: center;width:20px;" >
										${status.index+1}
									</td>
									<td class="datagrid-cell datagrid-cell-1"  style="text-align: center;width:20px;" ><input type="checkbox" value="${cdlList.rownum}" name="isSelect1"/></td>
									<td class="datagrid-cell datagrid-cell-2"  style="width:150px;" >
										${cdlList.ci_item_code}
										<input type="hidden" name="ci_item_code" value="${cdlList.ci_item_code}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-3"  style="width:150px;" >
										${cdlList.ci_item_name}
										<input type="hidden" name="ci_item_name" value="${cdlList.ci_item_name}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-4"  style="width:150px;">
										${cdlList.ci_item_spec}
										<input type="hidden" name="ci_item_spec" value="${cdlList.ci_item_spec}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-5"  style="width:100px;">
										${cdlList.ci_supplier_code}
										<input type="hidden" name="ci_supplier_code" value="${cdlList.ci_supplier_code}"/>
									</td>
									<td>
									<c:if test="${cdlList.ci_item_type==1}"><dict:lang value="原料" /></c:if>
									<c:if test="${cdlList.ci_item_type==2}"><dict:lang value="半成品" /></c:if>
									<c:if test="${cdlList.ci_item_type==3}"><dict:lang value="成品" /></c:if>
										<input type="hidden" name="ci_item_type" value="${cdlList.ci_item_type}"/>
									</td>
								</tr>
					</c:forEach>
					</tbody>
	</table>
	</div>
	
</div>
</div>
					
</form>
			<!--</div>-->
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
			<div class="center">
			</div>
		</div>
		</div>
</div>
	<script type="text/javascript">
		//var _resObj = new Object();
		var parentWindow=top.$("#popupFrameFpId")[0].contentWindow;
		var tableId=$("#loadItem").val();
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
		 var temp=false;
		 
		 function search_item(){
		 
		var itemCode=$("#itemCode").val();
		var itemName=$("#itemName").val();
		var itemSpec=$("#itemSpec").val();
		var url="/mes/buss/bussModel_exeFunc.ms?FUNC_CODE=F2076&funcMId=d882255ff2f7465392e6eb65f888907c&type=0";
		$.ajax({
			url:url,
			type:"post",
			data:{"ITEM_CODE":itemCode,"ITEM_NAME":itemName,"ITEM_SPEC":itemSpec},
			success:function(data){
				var tabContent=$(data).find("#submitForm");
				$("#submitForm").html(tabContent.html());
				
				ajaxPage.currentPage =_GLO_FORM_PAGE_MAP["searchForm"].currentPage;	
					ajaxPage.pageRecord =_GLO_FORM_PAGE_MAP["searchForm"].pageRecord;
					ajaxPage.totalPage = $("#totalPage").val();
					ajaxPage.totalRecord = $("#totalRecord").val();
				showPageBar(ajaxPage,"searchForm");
				var pageContent=$(data).find("#pageDiv");
				$("#pageDiv").html(pageContent.html());
				var tableTrJs =$("#submitForm").find("tr");
                 _tongLineColor(tableTrJs);
			}
		});
	}

	function listAx(paginationImpl){
		var url = "/mes/buss/bussModel_exeFunc.ms?FUNC_CODE=F2076&funcMId=d882255ff2f7465392e6eb65f888907c&type=0";
		util.showLoading("处理中...");
	  $.ajax({
		type: "POST",
	    dataType: "html",
	    url: url,
	    data: $("#searchForm").serialize()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
				var tbodyStr = "";
					var tabContent=$(data).find("#loadItem");
					$("#loadItem").html(tabContent.html());
					ajaxPage.currentPage =_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;	
					ajaxPage.pageRecord =_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
					ajaxPage.totalPage = $("#totalPage").val();
					ajaxPage.totalRecord = $("#totalRecord").val();
					//alert($("#totalRecord").val());
					showPageBar(ajaxPage,"searchForm");
					init();
                   

			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});	
	}
	
	//点击行寄选中该行
		function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
		
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	/*function add(){
		setSelectValue();
		if(!temp)
		parent.closePopWinFp('add_itemIdpop');
	}*/
	
	function clearSel(){
	//parent.$(".dialog-close").click();
		//setSelectValue(null);
		parent.closePopWinFp('add_itemIdpop');
	}
	
	
	<%-- 回填选择的值 --%>
	function setSelectValue(url,groupSn){
	    var k=$("input[name='isSelect1']:checked").length;
	    if(k!=0){
	    util.showTopLoading();
		$("input[name='isSelect1']:checked").each(function(i) { // 遍历选中的checkbox
		
	            var tablerow = $(this).parents("#loadItem tr");  // 获取checkbox所在行
	            var ci_item_code = tablerow.find("[name='ci_item_code']").val();
					$.ajax({
						url:url,
						type:"post",
						data:{"ITEM_CODE":ci_item_code,"groupSn":groupSn},
						success:function(data){
													
							if(k==i+1){
							   util.closeLoading();
							   parentWindow.location.reload();
							
							   parent.closePopWinFp('add_itemIdpop');
							}
							
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
	            
	               
        	 });
            }else{
            	utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            }
	}
	
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#searchForm")[0].reset();
		}
				
		
		
		function init(){
		clickTr('selectItem');
		var tableTrJs = $("#loadItem  tr");
		//_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
			<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		}
		

</script>
<bu:script viewId="d325cb3419504c1b93e2320e336a6cbc" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
