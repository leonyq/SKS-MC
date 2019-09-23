<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
<script type="text/javascript">
var loaded = 1;
	var tab_len = 4;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
		document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
		if(tag=="tag1"){
			$("#itemZero").attr("onclick","addInventoryZero();");
			$("#cancelZero").attr("onclick","");
			$("#detailCheck").attr("onclick","");
			$("#allDetailCheck").attr("onclick","");
		}
		if(tag=="tag2"){
			$("#itemZero").attr("onclick","");
			$("#cancelZero").attr("onclick","cancelInventoryZero();");
			$("#detailCheck").attr("onclick","");
			$("#allDetailCheck").attr("onclick","");
		}
		if(tag=="tag3"){
			$("#itemZero").attr("onclick","");
			$("#cancelZero").attr("onclick","");
			$("#detailCheck").attr("onclick","addDetailCheck();");
			$("#allDetailCheck").attr("onclick","addAllDetailCheck();");
		}
		if(tag=="tag4"){
			$("#itemZero").attr("onclick","");
			$("#cancelZero").attr("onclick","");
			$("#detailCheck").attr("onclick","");
			$("#allDetailCheck").attr("onclick","");
		}
	}
$(function(){
	$("#docNum").val($("#paraMapObj_WII_DOC_NUM").val());
	$("#tag1").addClass("current");
	$("#itemZero").attr("onclick","addInventoryZero();");
	loadWaitInventory();
	loadInventoryZero();
	loadWaitExamine();
	loadExamineItem();
})
//进行盘0操作
function addInventoryZero(){
	var falg = 0;
	var tempId;
	$('input[name="isSelect1"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect1"]:checked').each(function(i){
			if(i==0){
				tempId = $(this).attr("id");
			}else{
				tempId = tempId + "," + $(this).attr("id");
			}
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	var dataAuth = $("#deptLs_data_auth").val();
	var inventoryZeroUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=3d1227e37700467c8afb304711e78e5d";
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: inventoryZeroUrl,
			    data: {
			        "checkId" : tempId,
			        "dataAuth" : dataAuth,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								msgPop(data.alertMsg,"",data.title,data.width,data.height,data.time,"");
								loadWaitInventory();
								loadInventoryZero();
								loadWaitExamine();
								loadExamineItem();
								$("#allSelects1").removeAttr("checked");
								//switchTag("tag2", "content2", "");
							}
							if(data.returnMsg=="addError"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
								return;
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//取消盘0操作
function cancelInventoryZero(){
	var falg = 0;
	var tempId;
	$('input[name="isSelect2"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect2"]:checked').each(function(i){
			if(i==0){
				tempId = $(this).attr("id");
			}else{
				tempId = tempId + "," + $(this).attr("id");
			}
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	var cancelInventoryZeroUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=ec176ebcfbfa41b7affc40fe6fa06cb2";
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: cancelInventoryZeroUrl,
			    data: {
			        "checkId" : tempId,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								msgPop(data.alertMsg,"",data.title,data.width,data.height,data.time,"");
								loadWaitInventory();
								loadInventoryZero();
								loadWaitExamine();
								loadExamineItem();
								$("#allSelects2").removeAttr("checked");
								//switchTag("tag2", "content2", "");
							}
							if(data.returnMsg=="addError"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
								return;
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//明细审核操作
function addDetailCheck(){
	var falg = 0;
	var tempId;
	$('input[name="isSelect3"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect3"]:checked').each(function(i){
			if(i==0){
				tempId = $(this).attr("id");
			}else{
				tempId = tempId + "," + $(this).attr("id");
			}
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	var addDetailCheckUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=44bcbd1653f64d5d9cea0acd533d7c52";
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: addDetailCheckUrl,
			    data: {
			        "checkId" : tempId
			    },
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								msgPop(data.alertMsg,"",data.title,data.width,data.height,data.time,"");
								loadWaitInventory();
								loadInventoryZero();
								loadWaitExamine();
								loadExamineItem();
								$("#allSelects3").removeAttr("checked");
								//switchTag("tag2", "content2", "");
							}
							if(data.returnMsg=="addError"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
								return;
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//一键明细审核
function addAllDetailCheck(){
    var addDetailCheckUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e96393db0da741e594b36ec63db44bf1";
    var docNum = $("#paraMapObj_WII_DOC_NUM").val();
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: addDetailCheckUrl,
			    data: {
			        "docNum" : docNum
			    },
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								msgPop(data.alertMsg,"",data.title,data.width,data.height,data.time,"");
								loadWaitInventory();
								loadInventoryZero();
								loadWaitExamine();
								loadExamineItem();
								$("#allSelects3").removeAttr("checked");
								//switchTag("tag2", "content2", "");
							}
							if(data.returnMsg=="addError"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
								return;
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
var loadItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=8b4f7a03ca5545569d786b1961026f48";
//加载待盘点物料信息
function loadWaitInventory(){
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,
			    data: {
			        "itemState" : 1,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                 $("#addWaitInventory").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9b4a");
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9b4a");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//待盘点物料信息分页
var paginationImpl = {};
function SearchWaitInventory(paginationImpl,url){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
    	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			        "paraMap.itemState" : 1,
			        "paraMap.docNum" : $("#paraMapObj_WII_DOC_NUM").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemState=1&paraMap.docNum="+$("#paraMapObj_WII_DOC_NUM").val()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addWaitInventory").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//加载盘0物料信息
function loadInventoryZero(){
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,
			    data: {
			        "itemState" : 3,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                 $("#addInventoryZero").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//盘0物料信息分页    buss/bussModel_exeFunc.ms?FUNC_CODE=F6972&funcMId=16d9d9524aba4ae79435d30f4bf43937
function searchInventoryZero(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
    	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=16d9d9524aba4ae79435d30f4bf43937",
			    data: {
			        "paraMap.itemState" : 3,
			        "paraMap.docNum" : $("#paraMapObj_WII_DOC_NUM").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemState=3&paraMap.docNum="+$("#paraMapObj_WII_DOC_NUM").val()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addInventoryZero").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
								defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//加载待审核物料信息
function loadWaitExamine(){
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,
			    data: {
			        "itemState" : 2,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                 $("#addWaitExamine").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect3'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');
								defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//待审核物料信息分页    buss/bussModel_exeFunc.ms?FUNC_CODE=F6972&funcMId=16d9d9524aba4ae79435d30f4bf43937
function searchWaitExamine(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
    	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=16d9d9524aba4ae79435d30f4bf43937",
			    data: {
			        "paraMap.itemState" : 2,
			        "paraMap.docNum" : $("#paraMapObj_WII_DOC_NUM").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemState=2&paraMap.docNum="+$("#paraMapObj_WII_DOC_NUM").val()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addWaitExamine").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect3'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');
								defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//加载已审核物料信息
function loadExamineItem(){
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,
			    data: {
			        "itemState" : 4,
			        "docNum" : $("#paraMapObj_WII_DOC_NUM").val()
			    },
				success: function(data){
				                 $("#addExamineItem").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect4'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9999");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//待审核物料信息分页    buss/bussModel_exeFunc.ms?FUNC_CODE=F6972&funcMId=16d9d9524aba4ae79435d30f4bf43937
function searchExamineItem(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
    	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=16d9d9524aba4ae79435d30f4bf43937",
			    data: {
			        "paraMap.itemState" : 4,
			        "paraMap.docNum" : $("#paraMapObj_WII_DOC_NUM").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemState=4&paraMap.docNum="+$("#paraMapObj_WII_DOC_NUM").val()+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addExamineItem").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].INVENTORY_TIME==null) rccList[i].INVENTORY_TIME="";
								
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999  tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect4'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].INVENTORY_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9999");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
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

	//全选1
     	function getAllItems1(){
		if($("#allSelects1").attr("checked")=="checked"){
			$("#addWaitInventory :checkbox").attr("checked",true);
		}else{
			$("#addWaitInventory :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选2
     	function getAllItems2(){
		if($("#allSelects2").attr("checked")=="checked"){
			$("#addInventoryZero :checkbox").attr("checked",true);
		}else{
			$("#addInventoryZero :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选3
     	function getAllItems3(){
		if($("#allSelects3").attr("checked")=="checked"){
			$("#addWaitExamine :checkbox").attr("checked",true);
		}else{
			$("#addWaitExamine :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选4
     	function getAllItems4(){
		if($("#allSelects4").attr("checked")=="checked"){
			$("#addExamineItem :checkbox").attr("checked",true);
		}else{
			$("#addExamineItem :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	
	function searchWaitInventory(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=16d9d9524aba4ae79435d30f4bf43937";

	SearchWaitInventory(paginationImpl,url);
}

function addDocCheck(){
        if(!val.valDataBaseSetData()){
        		return ;
        	}
        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=079c884dad364fdd87a8d99ed4567521";
       document.forms.editForm.submit();
}
	
	
	
</script>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        	<button type="button" id="itemZero" onclick=""><i class="ico ico-save"></i><dict:lang value="物料盘0" /></button>
        					<button type="button" id="cancelZero" onclick="" ><i class="ico ico-cancel"></i><dict:lang value="取消盘0" /></button>
        					<button type="button" id="detailCheck" onclick=""><i class="ico ico-save"></i><dict:lang value="明细审核" /></button>
        					<button type="button"  id="allDetailCheck" onclick=""><i class="ico ico-save"></i><dict:lang value="一键明细审核" /></button>
        					<button type="button" id="docCheck" onclick="addDocCheck();"><i class="ico ico-save"></i><dict:lang value="单据审核" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 514px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="831b2dbf0dfb494695b7ce66538a8536" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" id="docNum" name="docNum" value="" />
	<input type="hidden" name="formIds" value="831b2dbf0dfb494695b7ce66538a8536" />
	<input type="hidden" name="831b2dbf0dfb494695b7ce66538a8536" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4974e24446bd4dbfa37603e56b901a8a'" />
		<s:set name="_$formId_1" value="'831b2dbf0dfb494695b7ce66538a8536'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WII_DOC_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="WII_DOC_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="WII_DOC_NUM" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="T2#WID_DOC_TYPE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="T2#WID_DOC_TYPE" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="T2#WID_DOC_TYPE" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WID_INVENTORY_DATE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T2#WID_INVENTORY_DATE" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="T2#WID_INVENTORY_DATE" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WID_MEMO" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="T2#WID_MEMO" formId="831b2dbf0dfb494695b7ce66538a8536" style="height:80px;" colspan="5"><bu:ui colNo="T2#WID_MEMO" style="width:100%;height:100%" formId="831b2dbf0dfb494695b7ce66538a8536" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
		<input type="hidden" name="formId" id="formId1" value='4f273d714d9544149f34e2d6d7ff9b4a'/>
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
		<input type="hidden" name="formId" id="formId3" value='4f273d714d9544149f34e2d6d7ff5678'/>
		<input type="hidden" name="formId" id="formId4" value='4f273d714d9544149f34e2d6d7ff9999'/>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="待盘点物料" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="盘0物料" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="待审核物料" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="已审核物料" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff9b4a" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" />
										</td>
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="盘点人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="盘点时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:250px;">
							<table class="datagrid-btable fixedTable dblClick"   id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a" >
								<tbody id="addWaitInventory" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchWaitInventory&formId=formId1&showLoading=0" />
                                 	</div>
			</DIV>
		 
        	<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head2" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects2" name="allSelect" onchange="getAllItems2();" />
										</td>
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="盘点人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="盘点时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:250px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
								<tbody id="addInventoryZero" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				<div style="background-color: white;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchInventoryZero&formId=formId2&showLoading=0" />
                                 		</div>
		</DIV>
		<DIV id="content3" style="display:none" data-tab="tag3">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head3" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects3" name="allSelect" onchange="getAllItems3();" />
										</td>
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="盘点人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="盘点时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll3" style="height:250px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678" >
								<tbody id="addWaitExamine" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				<div style="background-color: white;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchWaitExamine&formId=formId3&showLoading=0" />
                                 		</div>
		</DIV>
		<DIV id="content4" style="display:none" data-tab="tag4">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head4">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff9999" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects4" name="allSelect" onchange="getAllItems4();" />
										</td>
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="盘点人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="盘点时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll4" style="height:250px;">
							<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9999" >
								<tbody id="addExamineItem" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				<div style="background-color: white;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchExamineItem&formId=formId4&showLoading=0" />
                                 		</div>
		</DIV>
		 				

	</DIV>

</DIV>
			<bu:jsVal formId="831b2dbf0dfb494695b7ce66538a8536" formIndex="1" />
									
			</div>
	</form>	
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<bu:script viewId="4974e24446bd4dbfa37603e56b901a8a" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    	
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
    setPopScroll('.scroll4','.head4');
  })
})(jQuery)</script>
	<!-- js初始化方法 -->


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

