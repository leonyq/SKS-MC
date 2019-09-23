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
    <style type="text/css">	
    	#addSecondItemDetail .chosen-container {
    	    position: initial
    	}
    	#addItemInfo .chosen-container {
    	    position: initial
    	}
	</style>
 <script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
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
				document.getElementById("tag3").style.display="none";
		}
		if(tag=="tag2"){
				document.getElementById("tag3").style.display="";
		}
	}
$(function(){
	$("#tag2").addClass("current");
	switchTag('tag2','content2','');
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
<script type="text/javascript">
function popItemDiv(showId,backId){
            if($(document.getElementById('paraMapObj_T2#WRD_SUP_CODE')).val()==""){
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择供应商" />",0,"260","");
           	return;
           }
            $("#itemCode").val("");
		    $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			
			addItemInfo();
			
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
function popPoInfoDiv(showId,backId){//paraMapObj_T2#WRD_SUP_CODE
           /*if($(document.getElementById('paraMapObj_T2#WRD_SUP_CODE')).val()==""){
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择供应商" />",0,"260","");
           	return;
           }*/
		$("#itemCode1").val("");
        	$("#poCode").val("");
        	$("#beginTime").val("");
        	$("#endTime").val("");
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			addPoInfo();
			
}
function hideDiv1(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
var trCount=0;
//弹出div物料信息
function addItemInfo(){
		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=10fa4e9c1bf54521bb2908f556188e03",//VM-采购入库管理-新增 操作功能 加载物料信息
			    data: "",
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].ITEM_TYPE==null) rccList[i].ITEM_TYPE="";
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_CODE+"'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;' title='"+rccList[i].ITEM_TYPE+"'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a02');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//div物料信息分页
var paginationImpl = {};
function searchItemInfo(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $.trim($("#itemCode").val());
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=dacc93bddbed4920963eccd4afcf0d25",//VM-采购入库管理-新增 操作功能 物料信息分页
			    data:{
			       "paraMap.type":"1",
			       "paraMap.itemCode":itemCode,
			       "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			       "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord, 
			    },
			    //data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].ITEM_TYPE==null) rccList[i].ITEM_TYPE="";
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_CODE+"'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;' title='"+rccList[i].ITEM_TYPE+"'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a02');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//弹出div采购单信息
function addPoInfo(){
		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=70d2406cab12485da92cf3e9da593e7e",//VM-采购入库管理-新增 操作功能 加载采购单信息
			    data: {
			        "supCode":$(document.getElementById('paraMapObj_T2#WRD_SUP_CODE')).val(),
			    },
				success: function(data){
				                 $("#poInfoTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].WPD_PLAN_NUM==null) rccList[i].WPD_PLAN_NUM=0;
								if(rccList[i].WPD_RECEIVE_NUM==null) rccList[i].WPD_RECEIVE_NUM=0;
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
								if(rccList[i].ALREADY_NUM==null) rccList[i].ALREADY_NUM=0;
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:140px;text-align: center;' title='"+rccList[i].WPD_PO+"'>"+rccList[i].WPD_PO+"<input type='hidden' id='WPD_PO"+(trCount+1)+"' value='"+rccList[i].WPD_PO+"'/><input type='hidden' id='WPI_SUP_CODE"+(trCount+1)+"' value='"+rccList[i].WPI_SUP_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;text-align: center;' title='"+rccList[i].WPD_ITEM_CODE+"'>"+rccList[i].WPD_ITEM_CODE+"<input type='hidden' id='WPD_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].WPD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:60px;text-align: center;' title='"+rccList[i].WPD_ITEM_SEQ+"'>"+rccList[i].WPD_ITEM_SEQ+"<input type='hidden' id='WPD_ITEM_SEQ"+(trCount+1)+"' value='"+rccList[i].WPD_ITEM_SEQ+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/><input type='hidden' id='ALREADY_NUM"+(trCount+1)+"' value='"+rccList[i].ALREADY_NUM+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:130px;text-align: center;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+(trCount+1)+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='DELIVERY_DATE"+(trCount+1)+"' value='"+rccList[i].DELIVERY_DATE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:100px;text-align: center;' title='"+rccList[i].WPD_PLAN_NUM+"'>"+rccList[i].WPD_PLAN_NUM+"<input type='hidden' id='WPD_PLAN_NUM"+(trCount+1)+"' value='"+rccList[i].WPD_PLAN_NUM+"'/><input type='hidden' id='WPD_RECEIVE_NUM"+(trCount+1)+"' value='"+rccList[i].WPD_RECEIVE_NUM+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a03');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//div采购单信息分页
var paginationImpl = {};
function searchPoInfo(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var supCode = $(document.getElementById('paraMapObj_T2#WRD_SUP_CODE')).val();
    	var poCode = $.trim($("#poCode").val());
    	var itemCode = $.trim($("#itemCode").val());
    	var beginTime = $("#beginTime").val();
    	var endTime = $("#endTime").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=41c8f1e49e8443cdb1737df812a75575",//VM-采购入库管理-新增 操作功能 采购单信息分页
			    data:{
			        "paraMap.type":"1",
			        "paraMap.supCode":supCode,
			        "paraMap.poCode":poCode,
			        "paraMap.itemCode":itemCode,
			        "paraMap.beginTime":beginTime,
			        "paraMap.endTime":endTime,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord, 
			    },
			    //data: "paraMap.type=1&paraMap.supCode="+supCode+"&paraMap.poCode="+poCode+"&paraMap.itemCode="+itemCode+"&paraMap.beginTime="+beginTime+"&paraMap.endTime="+endTime+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#poInfoTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].WPD_PLAN_NUM==null) rccList[i].WPD_PLAN_NUM=0;
								if(rccList[i].WPD_RECEIVE_NUM==null) rccList[i].WPD_RECEIVE_NUM=0;
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
								if(rccList[i].ALREADY_NUM==null) rccList[i].ALREADY_NUM=0;
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect2'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:140px;text-align: center;' title='"+rccList[i].WPD_PO+"'>"+rccList[i].WPD_PO+"<input type='hidden' id='WPD_PO"+(trCount+1)+"' value='"+rccList[i].WPD_PO+"'/><input type='hidden' id='WPI_SUP_CODE"+(trCount+1)+"' value='"+rccList[i].WPI_SUP_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;text-align: center;' title='"+rccList[i].WPD_ITEM_CODE+"'>"+rccList[i].WPD_ITEM_CODE+"<input type='hidden' id='WPD_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].WPD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:60px;text-align: center;' title='"+rccList[i].WPD_ITEM_SEQ+"'>"+rccList[i].WPD_ITEM_SEQ+"<input type='hidden' id='WPD_ITEM_SEQ"+(trCount+1)+"' value='"+rccList[i].WPD_ITEM_SEQ+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/><input type='hidden' id='ALREADY_NUM"+(trCount+1)+"' value='"+rccList[i].ALREADY_NUM+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:130px;text-align: center;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+(trCount+1)+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='DELIVERY_DATE"+(trCount+1)+"' value='"+rccList[i].DELIVERY_DATE+"'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:100px;text-align: center;' title='"+rccList[i].WPD_PLAN_NUM+"'>"+rccList[i].WPD_PLAN_NUM+"<input type='hidden' id='WPD_PLAN_NUM"+(trCount+1)+"' value='"+rccList[i].WPD_PLAN_NUM+"'/><input type='hidden' id='WPD_RECEIVE_NUM"+(trCount+1)+"' value='"+rccList[i].WPD_RECEIVE_NUM+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a03');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
var trrCount=0;
//保存选择的物料
function addItemList(showId,backId){
	var len = $("#addItemInfo tr").length;
	$("#itemTbody :checkbox").each(function(){
			if($(this).attr("checked")){
					var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='width:120px;'>"+ wmsOption +"</select>";
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"<input type='hidden' name='itemId' value=''/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' /></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='PLAN_NUM' value=''/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:102px;text-align: center;padding:0;'><input type='text' style='width: 102px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='GIFT_NUM_"+(trrCount+1)+"' name='GIFT_NUM' value='0'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='ITEM_SEQ_"+(trrCount+1)+"' name='ITEM_SEQ' value='0'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:160px;text-align: center;padding:0;'><input type='text' style='width: 160px;padding:0;' maxlength='50' class=' input isSubmit' id='WPI_PO_"+(trrCount+1)+"' name='WPI_PO' value=''/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+wmsSel+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;text-align: center;padding:0;'><input style='width: 120px;padding:0;' name='WRI_DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' maxlength='50' style='width: 120px;padding:0;text-align: right;' id='WRI_LOT_NO_"+(trrCount+1)+"' name='WRI_LOT_NO'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='WRI_PRODUCE_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					
				//	mySetChosen();//设置下拉框样式
					$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len+1;
						trrCount++;
					
					var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4');	
					defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1aa4');
				
			}
	})
	$("#itemTbody").empty();
	
	hideDiv(showId,backId);
	trCount=0;
	$("#item_list_cb").attr("checked",false);
}
//保存选择的采购单
function addPoInfoList(showId,backId){
	var len = $("#addItemInfo tr").length;
	var tempf = 0;
    var supCode;
    var supName;
	$("#poInfoTbody :checkbox").each(function(){
			if($(this).attr("checked")){
			    supCode = $("#WPI_SUP_CODE"+$(this).attr("id")).val();
			    supName = $("#SUPPLIER_NAME"+$(this).attr("id")).val();
			    $("#poInfoTbody :checkbox").each(function(){
			        if($(this).attr("checked")){
			            	if(supCode!=$("#WPI_SUP_CODE"+$(this).attr("id")).val()){
			            	    tempf = 1;
			            	    return false;
			            	}
                    }					
                })
			}
	})
	if(tempf==1){
	    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择相同的供应商" />",0,"300","");
	    return ;
	}
	$(document.getElementById('paraMapObj_T2#WRD_SUP_CODE')).val(supCode);
	$(document.getElementById('paraMapObj_T2#WRD_SUP_CODE_SHOW')).val(supName);
	$("#poInfoTbody :checkbox").each(function(){
			if($(this).attr("checked")){
					var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class='wmsSelect input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>"+ wmsOption +"</select>";
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"<input type='hidden' name='itemId' value=''/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#WPD_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' class='CI_ITEM_CODE' name='CI_ITEM_CODE' value='"+$("#WPD_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'>"+$("#ALREADY_NUM"+$(this).attr("id")).val()+"<input type='hidden' id='ALREADY_NUM_"+(trrCount+1)+"' name='ALREADY_NUM' value='"+$("#ALREADY_NUM"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='PLAN_NUM' value='"+($("#WPD_PLAN_NUM"+$(this).attr("id")).val()-$("#WPD_RECEIVE_NUM"+$(this).attr("id")).val())+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:102px;text-align: center;padding:0;'><input type='text' style='width: 102px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='GIFT_NUM_"+(trrCount+1)+"' name='GIFT_NUM' value='0'/><input type='hidden' id='"+(trrCount+1)+"' name='poPlanNum' value='"+($("#WPD_PLAN_NUM"+$(this).attr("id")).val()-$("#ALREADY_NUM"+$(this).attr("id")).val())+"'></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='ITEM_SEQ_"+(trrCount+1)+"' name='ITEM_SEQ' value='"+$("#WPD_ITEM_SEQ"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:160px;text-align: center;padding:0;'><input type='text' style='width: 160px;padding:0;' maxlength='50' class=' input isSubmit' id='WPI_PO_"+(trrCount+1)+"' name='WPI_PO' value='"+$("#WPD_PO"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+wmsSel+"</td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;text-align: center;padding:0;'><input style='width: 120px;padding:0;' name='WRI_DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'  value='"+$("#DELIVERY_DATE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' maxlength='50' style='width: 120px;padding:0;text-align: right;' id='WRI_LOT_NO_"+(trrCount+1)+"' name='WRI_LOT_NO'/></td>");
					$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='WRI_PRODUCE_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					mySetChosen();//设置下拉框样式
					$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
						len = len+1;
						trrCount++;
					var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4');	
					defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1aa4');
				
			}
	})
	$("#poInfoTbody").empty();
	
	hideDiv(showId,backId);
	trCount=0;
	$("#po_list_cb").attr("checked",false);
}

var wmsOption;
//获取仓库信息
function getWmsSel(){
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625",//VM-采购入库管理-新增 操作功能 加载仓库信息
			    data: "",
				success: function(data){
						//console.log(data.ajaxMap.samplList);
						wmsOption = "<option value=''>--请选择--</option>";
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								wmsOption = wmsOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
						}
						getItem();
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""&&item.id.indexOf("#")<0){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
		}

	});
}
function delRow(){
        //先判断是否有物料明细信息
        var falg = 0;
	var delId;
	$('input[name="isSelect1"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect1"]:checked').each(function(i){
    			if(i==0){
        			delId = $(this).val();
    			}else{
        			delId = delId + "," +$(this).val();
    			} 
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	util.showLoading("处理中...");
	var checkDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=61aa13d52939454287af58e843aaa400";//VM-采购入库管理-修改 操作功能 判断要删除的物料是否有明细
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: checkDetailUrl,
			    data: {
			        "checkId":delId,
			    },
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							console.log("data.returnMsg::"+data.returnMsg);
							if(data.returnMsg=="addSucc"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="有明细的物料不允许删除" />",0,"300","");
								return;
							}
							if(data.returnMsg=="addError"){
								$("#delIds").val(delId);
								//删除行
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 :checkbox").each(function(){
									if($(this).attr("checked")){
										var trid = $(this).parent().parent().attr("id");
			                                                         
										$("#"+trid).remove();
									}
								});
								reSort("datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4");
								var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody tr");
								_tongLineColor(tableTrJs);
								clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4');
								defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1aa4');
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
				
	
	//删除行
	/*$("#itemInfo :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("itemInfo");
	var tableTrJs = $("#itemInfo tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('itemInfo');*/       
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
   //全选
     	function getAllItem(){
		if($("#item_list_cb").attr("checked")=="checked"){
			$("#itemTbody :checkbox").attr("checked",true);
		}else{
			$("#itemTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
  //全选1
     	function getAllPo(){
		if($("#po_list_cb").attr("checked")=="checked"){
			$("#poInfoTbody :checkbox").attr("checked",true);
		}else{
			$("#poInfoTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选2
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height: 534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7b5230d9dda44e8cadb18aa7137d1aa4" type="edit" />
<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
					<!--	<DIV class="hd"> -->
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="单据明细" /></SPAN> </A>
								</LI>
									<LI id="tag3" style="display:none;margin-left:850px;">
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
                                    	<button type="button" onclick="popPoInfoDiv('addPoInfo','backItem');" style="padding:0;" title="选择采购单">
                                    		<i class="ico ico-choosePO ico-small"></i>
                                    	</button>
                                    	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料">
                                    		<i class="ico ico-chooseMaterials ico-small"></i>
                                    	</button>
                                    	<button type="button" onclick="delRow();" style="padding:0" title="删除">
                                    		<i class="ico ico-sc-new-add ico-small"></i>
                                    	</button>
                                    </div>						
                                </LI>
							</UL>
					<!--	</DIV>  -->
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" id="docNum" name="docNum" value="" />
	<input type="hidden" id="delIds" name="delIds" value="" />
	<input type="hidden" name="formIds" value="7b5230d9dda44e8cadb18aa7137d1aa4" />
	<input type="hidden" name="formId" id="formId2" value='7b5230d9dda44e8cadb18aa7137d1a02'/>
	<input type="hidden" name="formId" id="formId3" value='7b5230d9dda44e8cadb18aa7137d1a03'/>
	<input type="hidden" name="formId" id="formId4" value='7b5230d9dda44e8cadb18aa7137d1a04'/>
	<input type="hidden" name="7b5230d9dda44e8cadb18aa7137d1aa4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6194178735de465d90b89ececb825206'" />
		<s:set name="_$formId_1" value="'7b5230d9dda44e8cadb18aa7137d1aa4'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WRI_DOC_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="WRI_DOC_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="WRI_DOC_NUM" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WRD_DOC_TYPE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_DOC_TYPE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WRD_DOC_TYPE" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WRD_DISPATCH_SN" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_DISPATCH_SN" style="width:200px;"  formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WRD_DISPATCH_SN" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="T2#WPD_DELIVERY_DATE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WPD_DELIVERY_DATE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WPD_DELIVERY_DATE" style="width:200px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="T2#WRD_SUP_CODE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_SUP_CODE" style="width:240px;"  formId="7b5230d9dda44e8cadb18aa7137d1aa4" ><bu:ui colNo="T2#WRD_SUP_CODE" style="width:240px;" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WRD_MEMO" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<bu:td cssClass="dec" colNo="T2#WRD_MEMO" formId="7b5230d9dda44e8cadb18aa7137d1aa4" style="height:80px;" colspan="5"><bu:ui colNo="T2#WRD_MEMO" style="width:100%;height:100%" formId="7b5230d9dda44e8cadb18aa7137d1aa4" dataId="${dataId}" formIndex="1" /></bu:td>
			
		</tr>
	</table>
	</div>
	<DIV id="content2" style="display:none" data-tab="tag2">
        
        
		
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head1" style="width:100%;" id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1aa4">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="已下达数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:102px;" ><dict:lang value="标准包装数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="赠品数量" /></td >
										<td class="datagrid-cell" style="width:70px;"><dict:lang value="项次" /></td>
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="采购单号" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="仓库" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="交货日期" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="生产批号" /></td>
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="生产日期" /></td>
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:380px;">
							<table class="datagrid-htable fixedTable" style="table-layout:fixed;" id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
	<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:150px;left:16px;top:0px;width:870px;height:520px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 20px)">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItemInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
			    	<div class="panel datagrid datagrid-div1">
			    	    <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
        			    	<div  class="datagrid-header">  
        			    	    <div class="datagrid-header-inner head2" style="width:100%;" id="datagrid-header-inner1">
                			    	<table class="datagrid-htable fixedTable" style="width:100%" id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a02">
                						<tbody>
                						<tr  class="datagrid-header-row">
                			    			<td style="width: 30px;text-align: center;"></td>
                							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></td>
                							<td style="width: 180px;text-align: center;"><dict:lang value="物料名称" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="供应商" /></td>
                							<td style="width: 100px;text-align: center;"><dict:lang value="物料类型" /></td>	
                						</tr>
                			    	    </tbody>
                			    	</table>	
                                </div>
        			    	</div>
        			    	<div class="datagrid-body datagrid-div3 scroll2" style="height:360px;overflow-y: auto;overflow-x: hidden;" >  
            			    	<table  style="table-layout:fixed;width:100%;" class="dlist-table table-line" id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02" >
            			    	<tbody id="itemTbody">
            		                </tbody>
            				    </table>
        				    </div>	
                        </div>
	                </div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
	<div id="backPoInfo" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addPoInfo" style="display:none;z-index:1030;margin-left:150px;left:16px;top:10px;width:870px;height:520px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择采购单" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPoInfo','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 20px);">
					<div class="optn optn_div">
					
					<span class="txt" title="等于">开单时间</span>
					
					<input id="beginTime" name="" value="" style="width:200px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">
					
					<span class="txt">~</span>
					<input id="endTime" name="" value="" style="width:200px;margin-right:145px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">
					
      					
			        <button type="button" onclick="addPoInfoList('addPoInfo','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addPoInfo','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="采购单号"/></td>
					<td class="dec"><input type="text" id="poCode" name="poCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>			
			
			        <div class="panel datagrid datagrid-div1">
			    	    <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
        			    	<div  class="datagrid-header">  
        			    	    <div class="datagrid-header-inner head3" style="width:100%;" id="datagrid-header-inner1">
                			    	<table class="datagrid-htable fixedTable" style="width:100%" id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a03">
                						<tbody>
                						<tr  class="datagrid-header-row">
                			    			<td style="width: 30px;text-align: center;"></td>
                							<td style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb"  onchange="getAllPo();" /></td>
                							<td style="width: 140px;text-align: center;"><dict:lang value="采购单号" /></td>
                							<td style="width: 140px;text-align: center;"><dict:lang value="物料料号" /></td>
                							<td style="width: 60px;text-align: center;"><dict:lang value="项次" /></td>
                							<td style="width: 130px;text-align: center;"><dict:lang value="物料名称" /></td>
                							<td style="width: 130px;text-align: center;"><dict:lang value="物料规格" /></td>
                							<td style="width: 130px;text-align: center;"><dict:lang value="供应商" /></td>
                							<td style="width: 100px;text-align: center;"><dict:lang value="计划数量" /></td>		
                						</tr>
                			    	    </tbody>
                			    	</table>	
                                </div>
        			    	</div>
        			    	<div class="datagrid-body datagrid-div3 scroll3" style="height:360px;overflow-y: auto;overflow-x: hidden;" >  
            			    	<table  style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03">
                			    	<tbody id="poInfoTbody">
            		                </tbody>
            				    </table>
        				    </div>
                        </div>
	                </div>
			    	<!--<div style="width:870px;">  
    			    	<table  class="dlist-table table-line "  style="width:100%" id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a03">
    						<thead>id="poInfoTable"	
        						<tr>
        			    			<th style="width: 30px;text-align: center;"></th>
        							<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb"  onchange="getAllPo();" /></th>
        							<th style="width: 140px;text-align: center;"><dict:lang value="采购单号" /></th>
        							<th style="width: 140px;text-align: center;"><dict:lang value="物料料号" /></th>
        							<th style="width: 60px;text-align: center;"><dict:lang value="项次" /></th>
        							<th style="width: 130px;text-align: center;"><dict:lang value="物料名称" /></th>
        							<th style="width: 130px;text-align: center;"><dict:lang value="物料规格" /></th>
        							<th style="width: 130px;text-align: center;"><dict:lang value="供应商" /></th>
        							<th style="text-align: center;"><dict:lang value="计划数量" /></th>	
        						</tr>
    			    	    </thead>
    			    	</table>
			    	</div>
			    	<div class="scroll3" style="width:870px;height: calc(100% - 136px);overflow-y: auto;overflow-x: hidden;" >  
    			    	<table  style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03" >
        			    	<tbody id="poInfoTbody">
    		                </tbody>
    				    </table>
				    </div>-->
				<div style="background-color: white;" id="pageDiv1">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPoInfo&formId=formId2&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="7b5230d9dda44e8cadb18aa7137d1aa4" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="6194178735de465d90b89ececb825206" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">
$(function(){
  	$("#docNum").val($("#paraMapObj_WRI_DOC_NUM").val());
  	getWmsSel();
	
})
//根据入库单号获取对应物料信息
function getItem(){ //console.log(itemUrl);
var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=4df28c380ad54dcf81f10de621ea220f";//VM-采购入库管理-修改 操作功能 ajax回填入库物料信息
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: itemUrl,
			    data: {
			        "docNum":$("#paraMapObj_WRI_DOC_NUM").val(),
			    },
				success: function(data){
				                  $("#addItemInfo").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var  alreadyNum;
							//console.log(rccList[0].WRI_WH_CODE);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WRI_PLAN_NUM==null) rccList[i].WRI_PLAN_NUM="";
								if(rccList[i].WRI_GIFT_NUM==null) rccList[i].WRI_GIFT_NUM="";
								if(rccList[i].WRI_PACK_NUM==null) rccList[i].WRI_PACK_NUM="";
								if(rccList[i].WRI_ITEM_SEQ==null) rccList[i].WRI_ITEM_SEQ="";
								if(rccList[i].WRI_LOT_NO==null) rccList[i].WRI_LOT_NO="";
								if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].WRI_CONNECT_DOC==null) rccList[i].WRI_CONNECT_DOC="";
								
								if(rccList[i].REAL_NUM==null) rccList[i].REAL_NUM="";
								if(rccList[i].ALREADY_NUM==null){
            								    alreadyNum="<td style='position: relative; width: 90px;text-align: center;padding:0;''></td>"
            								}else{
            								    alreadyNum="<td style='position: relative; width:90px;text-align: center;padding:0;'>"+rccList[i].ALREADY_NUM+"<input type='hidden' id='"+(trrCount+1)+"' name='poPlanNum1' value='"+(rccList[i].ALREADY_NUM+rccList[i].SUR_NUM)+"'></td>"
            								}
								var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class='wmsSelect input isSubmit _VAL_OjbsData' style='width:120px;'>"+ wmsOption +"</select>";
					
            					
					           var temp = "<tr id='trr"+(trrCount+1)+"' >"
					                    +"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"
					                    +"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WRI_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' value='"+rccList[i].WRI_ITEM_CODE+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' name='itemId' value='"+rccList[i].ID+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>"
					                    +alreadyNum
					                    +"<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='PLAN_NUM1_"+(trrCount+1)+"' name='PLAN_NUM' value='"+rccList[i].WRI_PLAN_NUM+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+rccList[i].WRI_PACK_NUM+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-8' style='width:102px;text-align: center;padding:0;'><input type='text' style='width: 102px;padding:0;text-align: right;' maxlength='9' class=' input isSubmit' id='GIFT_NUM_"+(trrCount+1)+"' name='GIFT_NUM' value='"+rccList[i].WRI_GIFT_NUM+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit' id='ITEM_SEQ_"+(trrCount+1)+"' name='ITEM_SEQ' value='"+rccList[i].WRI_ITEM_SEQ+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-10' style='width:160px;text-align: center;padding:0;'><input type='text' style='width: 160px;padding:0;' maxlength='50' class=' input isSubmit' id='WPI_PO_"+(trrCount+1)+"' name='WPI_PO' value='"+rccList[i].WRI_CONNECT_DOC+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+wmsSel+"</td>"
					                    +"<td class='datagrid-cell datagrid-cell-12' style='width:120px;text-align: center;padding:0;'><input style='width: 120px;padding:0;' name='WRI_DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].DELIVERY_DATE+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-13' style='width:120px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' maxlength='50' style='width: 120px;padding:0;text-align: right;' id='WRI_LOT_NO_"+(trrCount+1)+"' name='WRI_LOT_NO' value='"+rccList[i].WRI_LOT_NO+"'/></td>"
					                    +"<td class='datagrid-cell datagrid-cell-14' style='width:150px;text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='WRI_PRODUCE_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].PRODUCE_DATE+"'/></td>"
					                    $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4").append(temp);
					                    	$("#wmsSel_"+(trrCount+1)).val(rccList[i].WRI_WH_CODE);
                							//$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
                							//$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                						
                							trrCount++;
					
							}
						
							
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1aa4');
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}



function checkVal2(){  //标准包装数量   
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#CI_MIN_PACK_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("CI_MIN_PACK_"+i);
			tempFlag1 = checkNum(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}
function checkVal3(){  //赠品数量
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#GIFT_NUM_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("GIFT_NUM_"+i);
			tempFlag1 = checkNum(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}
function checkVal4(){  //项次
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#ITEM_SEQ_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("ITEM_SEQ_"+i);
			tempFlag1 = checkNum(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}


function checkVal1(){  //计划数量
    	
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
	    	
		tempVal = $("#PLAN_NUM1_"+i).val();
	
		if(tempVal==null) continue;
		if(tempVal!=""){ 
			tempId = document.getElementById("PLAN_NUM1_"+i);
			tempFlag1 = checkNum1(tempVal,tempId);
		}
		
		if(tempFlag1=="0")
		return "0";
	}

}

function checkNum(tempVal,tempId){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0){
		_alertValMsg(tempId,"<dict:lang value="该项必须为0或正整数" />");
		return "0";  
	}else 
	return "1"; 
}
function checkNum1(tempVal,tempId){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal <= 0){
		_alertValMsg(tempId,"<dict:lang value="该项必须为正整数" />");
		return "0";  
	}else 
	return "1"; 
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


function editCal(){
                    if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
				if(!val.valDataBaseSetData()){
                        return ;
                    }
                     var tempWmsSel;
                   $(".wmsSelect").each(function(){
                          if($(this).val()==""){
                             tempWmsSel = "0";
                            return false;
                          }
                   });
                   if(tempWmsSel=="0"){
                         //utilsFp.confirmIcon(1,"","","", "%{getText("请选择仓库")}",0,"260","");
                         utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择仓库" />",0,"260","");
                         return ;
                    }
                    
                    var tempFlag2 = checkVal2();
                    if(tempFlag2=="0"){
                         return ;
                    }
                    var tempFlag3 = checkVal3();
                    if(tempFlag3=="0"){
                         return ;
                    }
                    var tempFlag4 = checkVal4();
                    if(tempFlag4=="0"){
                         return ;
                    }
                    
                    var tempFlag1 = checkVal1();
                    console.log("tempFlag1:"+tempFlag1);
                    if(tempFlag1=="0"){
                         return ;
                    }
                    
                    var tempPlanNum1;
                    $("input[name='poPlanNum1']").each(function(i){
                          if($(this).val()!=""){  
                              if($(this).val()<parseInt($("#PLAN_NUM1_"+$(this).attr("id")).val())){
                                 tempPlanNum1 = "0";
                                 return false;
                              }
                          }
                   });
                   if(tempPlanNum1=="0"){
                         
                          utilsFp.confirmIcon(3,"","","", "<dict:lang value="计划数量超过采购单的计划数量" />",0,"260","");
                         return ;
                    }
                    var tempPlanNum;
                    $("input[name='poPlanNum']").each(function(i){
                          if($(this).val()!=""){  
                              if($(this).val()<parseInt($("#PLAN_NUM_"+$(this).attr("id")).val())){
                                 tempPlanNum = "0";
                                 return false;
                              }
                          }
                   });
                   if(tempPlanNum=="0"){
                         
                          utilsFp.confirmIcon(3,"","","", "<dict:lang value="计划数量超过采购单的计划数量" />",0,"260","");
                         return ;
                    }
                        
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条物料信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条物料信息" />",0,"260","");
                           return;
                        }
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=fd8fe237623843d78ddbdf519df1e629";
  document.forms.editForm.submit();
}
</script>
	<!-- js初始化方法 -->
		 <script type="text/javascript">
                     var parentWindow;
                        $(function(){
                             parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                        });
                    var isQuery = false;
                    function edit(thisObj){
                        if(isQuery){util.alert("?数据正在提交，请稍候...");}
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!valData()){
                            return ;
                        }
                        if(!val.valOjbsData()){
                            return ;
                        }
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
                        document.forms.editForm.submit();
                        isQuery = true;
                    }
                    
                    /*function alertInfo(msg){
                        isQuery = false;
                        utilsFp.alert(msg);
                    }*/
                    
                    function reloadPg(msg){
                        isQuery = false;
                        parentWindow.reloadPg(msg);;
                    }
            
                    //重置    
                    function resetForm(){
                        $("#editForm")[0].reset();
                    }
                            
                    
                    
                    function init(){
                        if($("#leftTable-kz").length>0){
                            $("#leftTable-kz").show();
                        }
                        
                        if($("#leftTable").length>0){
                            $("#leftTable").show();
                        }
                        if($("input[type='hidden'][name='formIds']").length>1){
                            initEditDataLs();
                        }
                        /*
                        var formIds = $("input[type='hidden'][name='formIds']").val();
                        var formIdLs = formIds.split(",");
                        for(var i=0,j=formIdLs.length;i<j;i++){
                            getEditRows(formIdLs[i],"0");
                        }
                        */
                    }
                    
            
                
             </script>
             <script>(function($){
  $(window).on('load',function(){
    //setPopScroll('.datagrid-body','.datagrid-header-inner');
    setPopScroll('.scroll1','.head1')
    setPopScroll('.scroll2','.head2')
    setPopScroll('.scroll3','.head3')
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

