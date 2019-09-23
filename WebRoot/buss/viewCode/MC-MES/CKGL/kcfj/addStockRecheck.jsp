<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
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
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	var t1 = window.setTimeout(setDocTypeVal,500);
	function setDocTypeVal(){
	    $("#paraMap1_WRD_DOC_TYPE").val("DJ19");
	    $("#paraMap1_WRD_DOC_TYPE").trigger("chosen:updated");
	    if($("#paraMap1_WRD_DOC_TYPE").val()=="DJ19"){
	        window.clearTimeout(t1);
	    }
	}
	
})

</script>
	<!-- head里面 -->
<script type="text/javascript">
function popItemDiv(showId,backId){   //
        		
            if($("#paraMap1_WRD_ITEM_CODE").val()==""){
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择物料" />",0,"260","");
           	return;
           }
            	$("#itemCode").val($("#paraMap1_WRD_ITEM_CODE").val());
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$("#paraMap1_WRD_WH_CODE_chosen").attr("style","width:200px;");
			loadItemDetail();
	
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
//加载库存复检信息
var trCount = 0;
function loadItemDetail(){
    var itemSn = $.trim($("#paraMap1_WRD_ITEM_SN").val());
	var itemCode = $("#itemCode").val();
	var custCode = $("#paraMap1_WRD_CUST_CODE").val();
	var supCode = $("#paraMap1_WRD_SUP_CODE").val();
	var whCode = $("#paraMap1_WRD_WH_CODE").val();
	var itemLot = $.trim($("#paraMap1_WRD_LOT_NO").val());
	var outBegin = $("#OUT_TIME_BEGIN").val();
	var outEnd = $("#OUT_TIME_END").val();
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=57d8fd1d645e4679a0710ccdb933f375",
			    data: {
			        itemSn: itemSn,
			        itemCode: itemCode,
			        custCode: custCode,
			        supCode: supCode,
			        whCode: whCode,
			        itemLot: itemLot,
			        outBegin: outBegin,
			        outEnd: outEnd
			    },
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var outFlag;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].WSI_SUP_CODE==null) rccList[i].WSI_SUP_CODE="";
								if(rccList[i].WSI_CUST_CODE==null) rccList[i].WSI_CUST_CODE="";
								if(rccList[i].WSI_WH_CODE==null) rccList[i].WSI_WH_CODE="";
								if(rccList[i].WSI_DISTRICT_CODE==null) rccList[i].WSI_DISTRICT_CODE="";
								if(rccList[i].WSI_STORAGE_CODE==null) rccList[i].WSI_STORAGE_CODE="";
								if(rccList[i].OUTTIME==null) outFlag="";
								if(rccList[i].OUTTIME=='Y') outFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].OUTTIME=='N') outFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WSI_ITEM_SN+"'>"+rccList[i].WSI_ITEM_SN+"<input type='hidden' id='WSI_ITEM_SN"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_SN+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:70px;text-align: center;'>"+outFlag+"<input type='hidden' id='OUTTIME"+rccList[i].ID+"' value='"+rccList[i].OUTTIME+"'/><input type='hidden' id='WSI_WH_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_WH_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"<input type='hidden' id='WH_NAME"+rccList[i].ID+"' value='"+rccList[i].WH_NAME+"'/><input type='hidden' id='WSI_DISTRICT_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_DISTRICT_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"<input type='hidden' id='WSI_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_NUM+"'/><input type='hidden' id='WSI_STORAGE_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_STORAGE_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"<input type='hidden' id='CI_RECHECK_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_RECHECK_DAYS+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"<input type='hidden' id='RECHECKOUT"+rccList[i].ID+"' value='"+rccList[i].RECHECKOUT+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'>"+rccList[i].WSI_ITEM_CODE+"<input type='hidden' id='WSI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"<input type='hidden' id='WSI_LOT_NO"+rccList[i].ID+"' value='"+rccList[i].WSI_LOT_NO+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"<input type='hidden' id='CUSTOMER"+rccList[i].ID+"' value='"+rccList[i].CUSTOMER+"'/><input type='hidden' id='WSI_CUST_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_CUST_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+rccList[i].ID+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='WSI_SUP_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_SUP_CODE+"'/></td>");
	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;text-align: center;' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"<input type='hidden' id='TEST_TIME"+rccList[i].ID+"' value='"+rccList[i].TEST_TIME+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"<input type='hidden' id='RECEIVE_TIME"+rccList[i].ID+"' value='"+rccList[i].RECEIVE_TIME+"'/></td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');	
						defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff5678');	
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//库存复检 分页及查询
var paginationImpl = {};
function searchItemInfo(paginationImpl){
	var itemSn = $.trim($("#paraMap1_WRD_ITEM_SN").val());
	var itemCode = $("#itemCode").val();
	var custCode = $("#paraMap1_WRD_CUST_CODE").val();
	var supCode = $("#paraMap1_WRD_SUP_CODE").val();
	var whCode = $("#paraMap1_WRD_WH_CODE").val();
	var itemLot = $.trim($("#paraMap1_WRD_LOT_NO").val());
	var outBegin = $("#OUT_TIME_BEGIN").val();
	var outEnd = $("#OUT_TIME_END").val();
	
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=adca3d792f7349d29e6b81e488d2cde2",
			    data: {
			        "paraMap.itemSn": itemSn,
			        "paraMap.itemCode": itemCode,
			        "paraMap.custCode": custCode,
			        "paraMap.supCode": supCode,
			        "paraMap.whCode": whCode,
			        "paraMap.itemLot": itemLot,
			        "paraMap.outBegin": outBegin,
			        "paraMap.outEnd": outEnd,
			        "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemCode="+itemCode+"&paraMap.custCode="+custCode+"&paraMap.supCode="+supCode+"&paraMap.whCode="+whCode+"&paraMap.districtCode="+districtCode+"&paraMap.storageCode="+storageCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var outFlag;
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].WSI_SUP_CODE==null) rccList[i].WSI_SUP_CODE="";
								if(rccList[i].WSI_CUST_CODE==null) rccList[i].WSI_CUST_CODE="";
								if(rccList[i].WSI_WH_CODE==null) rccList[i].WSI_WH_CODE="";
								if(rccList[i].WSI_DISTRICT_CODE==null) rccList[i].WSI_DISTRICT_CODE="";
								if(rccList[i].WSI_STORAGE_CODE==null) rccList[i].WSI_STORAGE_CODE="";
								if(rccList[i].OUTTIME==null) outFlag="";
								if(rccList[i].OUTTIME=='Y') outFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].OUTTIME=='N') outFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WSI_ITEM_SN+"'>"+rccList[i].WSI_ITEM_SN+"<input type='hidden' id='WSI_ITEM_SN"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_SN+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:70px;text-align: center;'>"+outFlag+"<input type='hidden' id='OUTTIME"+rccList[i].ID+"' value='"+rccList[i].OUTTIME+"'/><input type='hidden' id='WSI_WH_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_WH_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"<input type='hidden' id='WH_NAME"+rccList[i].ID+"' value='"+rccList[i].WH_NAME+"'/><input type='hidden' id='WSI_DISTRICT_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_DISTRICT_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"<input type='hidden' id='WSI_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_NUM+"'/><input type='hidden' id='WSI_STORAGE_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_STORAGE_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"<input type='hidden' id='CI_RECHECK_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_RECHECK_DAYS+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"<input type='hidden' id='RECHECKOUT"+rccList[i].ID+"' value='"+rccList[i].RECHECKOUT+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'>"+rccList[i].WSI_ITEM_CODE+"<input type='hidden' id='WSI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"<input type='hidden' id='WSI_LOT_NO"+rccList[i].ID+"' value='"+rccList[i].WSI_LOT_NO+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"<input type='hidden' id='CUSTOMER"+rccList[i].ID+"' value='"+rccList[i].CUSTOMER+"'/><input type='hidden' id='WSI_CUST_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_CUST_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+rccList[i].ID+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='WSI_SUP_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_SUP_CODE+"'/></td>");
	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;text-align: center;' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"<input type='hidden' id='TEST_TIME"+rccList[i].ID+"' value='"+rccList[i].TEST_TIME+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"<input type='hidden' id='RECEIVE_TIME"+rccList[i].ID+"' value='"+rccList[i].RECEIVE_TIME+"'/></td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');
                        defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff5678');
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
	var outFlag;
	var RECHECK_DAYS;
	$("#itemTbody :checkbox").each(function(){
			if($(this).attr("checked")){	
			    if (!$("#trr"+$(this).attr("id")).length) {
                    var trId = $(this).attr("id");
			        if($("#OUTTIME"+trId).val()==null) outFlag="";
					if($("#OUTTIME"+trId).val()=='Y') outFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
					if($("#OUTTIME"+trId).val()=='N') outFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
					 if($("#CI_RECHECK_DAYS"+trId).val()==null){
					     RECHECK_DAYS="";
					 }else{
					    RECHECK_DAYS=$("#CI_RECHECK_DAYS"+trId).val();
					 } 
					 
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr"+trId+"' ></tr>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+$("#WSI_ITEM_SN"+trId).val()+"'>"+$("#WSI_ITEM_SN"+trId).val()+"<input type='hidden' name='WSI_ITEM_SN' value='"+$("#WSI_ITEM_SN"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:70px;text-align: center;'>"+outFlag+"<input type='hidden' name='WSI_WH_CODE' value='"+$("#WSI_WH_CODE"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;' title='"+$("#WH_NAME"+trId).val()+"'>"+$("#WH_NAME"+trId).val()+"<input type='hidden' name='WSI_DISTRICT_CODE' value='"+$("#WSI_DISTRICT_CODE"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+$("#WSI_ITEM_NUM"+trId).val()+"'>"+$("#WSI_ITEM_NUM"+trId).val()+"<input type='hidden' name='WSI_ITEM_NUM' value='"+$("#WSI_ITEM_NUM"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;' title='"+RECHECK_DAYS+"'>"+RECHECK_DAYS+"<input type='hidden' name='CI_RECHECK_DAYS' value='"+RECHECK_DAYS+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;' title='"+$("#RECHECKOUT"+trId).val()+"'>"+$("#RECHECKOUT"+trId).val()+"<input type='hidden' name='RECHECKOUT' value='"+$("#RECHECKOUT"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+$("#WSI_ITEM_CODE"+trId).val()+"'>"+$("#WSI_ITEM_CODE"+trId).val()+"<input type='hidden' name='WSI_ITEM_CODE' value='"+$("#WSI_ITEM_CODE"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;' title='"+$("#CI_ITEM_NAME"+trId).val()+"'>"+$("#CI_ITEM_NAME"+trId).val()+"<input type='hidden' name='WSI_STORAGE_CODE' value='"+$("#WSI_STORAGE_CODE"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+$("#CI_ITEM_SPEC"+trId).val()+"'>"+$("#CI_ITEM_SPEC"+trId).val()+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+$("#WSI_LOT_NO"+trId).val()+"'>"+$("#WSI_LOT_NO"+trId).val()+"<input type='hidden' name='WSI_LOT_NO' value='"+$("#WSI_LOT_NO"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+$("#CUSTOMER"+trId).val()+"'>"+$("#CUSTOMER"+trId).val()+"<input type='hidden' name='WSI_CUST_CODE' value='"+$("#WSI_CUST_CODE"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+$("#SUPPLIER_NAME"+trId).val()+"'>"+$("#SUPPLIER_NAME"+trId).val()+"<input type='hidden' name='WSI_SUP_CODE' value='"+$("#WSI_SUP_CODE"+trId).val()+"'/></td>");
	
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;text-align: center;' title='"+$("#TEST_TIME"+trId).val()+"'>"+$("#TEST_TIME"+trId).val()+"<input type='hidden' name='TEST_TIME' value='"+$("#TEST_TIME"+trId).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:130px;text-align: center;' title='"+$("#RECEIVE_TIME"+trId).val()+"'>"+$("#RECEIVE_TIME"+trId).val()+"<input type='hidden' name='RECEIVE_TIME' value='"+$("#RECEIVE_TIME"+trId).val()+"'/></td>");
								
					
					len = len+1;
						trrCount++;
					
					var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
					defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
				}
			}
	})
	$("#itemTbody").empty();

	hideDiv(showId,backId);
	trCount=0;
	$("#item_list_cb").attr("checked",false);
}
function addCal(){      

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
            var len = $("#addItemInfo tr").length;
            if(len<=0){
                   utilsFp.confirmIcon(1,"","","", "<dict:lang value = "请添加单据明细" />",0,"260","");
                return;
            }
             if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");

            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=61229aa972a84c2aa232c228afc7321c";
            document.forms.addForm.submit();
                        
}
$(function(){
    $("#paraMap1_WRD_DOC_TYPE").val("DJ19");
    $("#paraMap1_WRD_DOC_TYPE").trigger("chosen:updated");
    $("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
})
function delRow(){
	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234");
	var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');	
	defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff1234');
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
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
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	
	function clearInfo(){
	    $("#addItemInfo").empty();
	}
</script>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        
			    </div>
			   
			</div>
			<div class="bd" style="height:534px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c408f3497e29446eb0d2f546ff63868b" type="add" />
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
		<input type="hidden" name="formId" id="formId3" value='4f273d714d9544149f34e2d6d7ff5678'/>
<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="单据明细" /></SPAN> </A>
								</LI>
								<LI id="tag3" style="display:none;margin-left:875px;">
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
                                    	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料">
                                    		<i class="ico ico-kl-new-add ico-small"></i>
                                    	</button>
                                    	<button type="button" onclick="delRow();" style="padding:0" title="删除">
                                    		<i class="ico ico-sc-new-add ico-small"></i>
                                    	</button>
                                    </div>					
                                </LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<s:hidden id ="curUser" name="curUser" value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}'/>
	
	<input type="hidden" name="formIds" value="c408f3497e29446eb0d2f546ff63868b" />
	<input type="hidden" name="c408f3497e29446eb0d2f546ff63868b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cd7439c86e3849dfbc6634e859e36a87'" />
		<s:set name="_$formId_1" value="'c408f3497e29446eb0d2f546ff63868b'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="WRD_TEST_DOC" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_TEST_DOC" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_TEST_DOC"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_TEST_DOC}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WRD_DOC_TYPE" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_DOC_TYPE" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_DOC_TYPE"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_DOC_TYPE}" formIndex="1" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="WRD_TEST_STEP" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec"   style="width:200px;" colNo="WRD_TEST_STEP" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_TEST_STEP"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_TEST_STEP}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WRD_SAMPLE_TYPE" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_SAMPLE_TYPE" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_SAMPLE_TYPE"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_SAMPLE_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WRD_ITEM_CODE" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_ITEM_CODE" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_ITEM_CODE"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_ITEM_CODE}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="WRD_CREATE_MAN" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_CREATE_MAN" formId="c408f3497e29446eb0d2f546ff63868b" ><bu:ui colNo="WRD_CREATE_MAN"  style="width:200px;" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_CREATE_MAN}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WRD_MEMO" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<bu:td cssClass="dec" colNo="WRD_MEMO" formId="c408f3497e29446eb0d2f546ff63868b" style="height:80px;" colspan="5"><bu:ui colNo="WRD_MEMO" style="width:100%;height:100%" formId="c408f3497e29446eb0d2f546ff63868b" value="%{WRD_MEMO}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	</div>
<DIV id="content2" style="display:none" data-tab="tag2">
         
      
       
	            <div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner	head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料/产品SN" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="是否超期" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="复检周期" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="复检到期时间" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料批次" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="检验时间" /></td >
										<td class="datagrid-cell" style="width:130px;"><dict:lang value="入库时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll1" style="height:400px;" >
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
</div>	
</div>
			</div>
	<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:66px;left:90px;top:20px;width:870px;height:520px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div" style="height:29px;">
					    <div style="float:left;">
        				    <span class="txt" title="等于"><dict:lang value="复检到期时间" /></span>
    	                    <input id="OUT_TIME_BEGIN" style="width:200px;" name="OUT_TIME_BEGIN" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">					
                            <span class="txt">~</span>
    					    <input id="OUT_TIME_END" style="width:200px;" name="OUT_TIME_END" value="" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">
    				    </div>			
                        <div style="float:right;">
        			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
            				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
            				<button type="button" onclick="searchItemInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>	
	                    </div>		
				   </div>
				      
				<table class="basic-table">
				 <tr>
				    <td class="name" style="width:70px;"/><bu:uitn colNo="WRD_ITEM_SN" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			        <bu:td cssClass="dec" style="width:210px;" colNo="WRD_ITEM_SN" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" ><bu:ui colNo="WRD_ITEM_SN"  style="width:200px;" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" value="%{WRD_ITEM_SN}" formIndex="1" /></bu:td>
			    								
                    <td class="name" style="width:70px;"/><dict:lang value="物料料号"/></td>
					<td class="dec" style="width:210px;"><input type="text" id="itemCode" style="width:200px;" name="itemCode" class=" input isSubmit readonly isaddSubmit" disabled="disabled"/></td>
		            					
                    <td class="name" style="width:70px;"/><bu:uitn colNo="WRD_WH_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			        <bu:td cssClass="dec"   style="width:200px;" colNo="WRD_WH_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" ><bu:ui colNo="WRD_WH_CODE"  style="width:200px;" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" value="%{WRD_WH_CODE}" formIndex="1" /></bu:td>    
		        </tr>
		        <tr>
				    <td class="name" /><bu:uitn colNo="WRD_SUP_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
        			<bu:td cssClass="dec" colNo="WRD_SUP_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" ><bu:ui colNo="WRD_SUP_CODE"  style="width:200px;" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" value="%{WRD_SUP_CODE}" formIndex="1" /></bu:td>
        		
        			<td class="name" /><bu:uitn colNo="WRD_CUST_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
        			<bu:td cssClass="dec" colNo="WRD_CUST_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" ><bu:ui colNo="WRD_CUST_CODE"  style="width:200px;" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" value="%{WRD_CUST_CODE}" formIndex="1" /></bu:td>
        		
        			<td class="name" /><bu:uitn colNo="WRD_LOT_NO" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
        			<bu:td cssClass="dec" colNo="WRD_LOT_NO" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" ><bu:ui colNo="WRD_LOT_NO"  style="width:200px;" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" value="%{WRD_LOT_NO}" formIndex="1" /></bu:td>
			    </tr>
			    </table>
			    
			     <!--<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner	head2" style="width:100%;">
								<table  class="datagrid-htable fixedTable " id="datagrid-htable4f273d714d9544149f34e2d6d7ff5678" >
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax thcolor">
										<td style="width: 30px;text-align: center;"></td>
            							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
            							<td style="width:250px;text-align: center;" ><dict:lang value="物料/产品SN" /></td >
            							<td style="width:70px;text-align: center;" ><dict:lang value="是否超期" /></td >
            							<td style="width:110px;text-align: center;" ><dict:lang value="仓库" /></td >
            							<td style="width:90px;text-align: center;" ><dict:lang value="物料数量" /></td >
            							<td style="width:90px;text-align: center;" ><dict:lang value="复检周期" /></td >
            							<td style="width:130px;text-align: center;" ><dict:lang value="复检到期时间" /></td >
            							<td style="width:150px;text-align: center;" ><dict:lang value="物料料号" /></td >
            							<td style="width:120px;text-align: center;" ><dict:lang value="物料名称" /></td >
            							<td style="width:120px;text-align: center;" ><dict:lang value="物料规格" /></td >
            							<td style="width:120px;text-align: center;" ><dict:lang value="物料批次" /></td >
            							<td style="width:110px;text-align: center;" ><dict:lang value="客户" /></td >
            							<td style="width:110px;text-align: center;" ><dict:lang value="供应商" /></td >
            										
            							<td style="width:130px;text-align: center;" ><dict:lang value="检验时间" /></td >
            							<td style="width:150px;text-align: center;"><dict:lang value="入库时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scorll2" style="height:380px;" >
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678" >
								<tbody id="itemTbody" >
								</tbody>
							</table>
					</div>
				</div>
			</div>	-->
			
			        <div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" style="width:100%;">
    							<div class="datagrid-header-inner head2" style="width:100%;" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff5678" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td style="width: 30px;text-align: center;"></td>
                							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
                							<td style="width:250px;text-align: center;" ><dict:lang value="物料/产品SN" /></td >
                							<td style="width:70px;text-align: center;" ><dict:lang value="是否超期" /></td >
                							<td style="width:110px;text-align: center;" ><dict:lang value="仓库" /></td >
                							<td style="width:90px;text-align: center;" ><dict:lang value="物料数量" /></td >
                							<td style="width:90px;text-align: center;" ><dict:lang value="复检周期" /></td >
                							<td style="width:130px;text-align: center;" ><dict:lang value="复检到期时间" /></td >
                							<td style="width:150px;text-align: center;" ><dict:lang value="物料料号" /></td >
                							<td style="width:120px;text-align: center;" ><dict:lang value="物料名称" /></td >
                							<td style="width:120px;text-align: center;" ><dict:lang value="物料规格" /></td >
                							<td style="width:120px;text-align: center;" ><dict:lang value="物料批次" /></td >
                							<td style="width:110px;text-align: center;" ><dict:lang value="客户" /></td >
                							<td style="width:110px;text-align: center;" ><dict:lang value="供应商" /></td >
                										
                							<td style="width:130px;text-align: center;" ><dict:lang value="检验时间" /></td >
                							<td style="width:150px;text-align: center;"><dict:lang value="入库时间" /></td>	
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll2"   style="height:310px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678" >
    								<tbody id="itemTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
                    <!--<div style="overflow:hidden;" class="head2">  width:870px;height:35px;-->
			        <!--<div class="datagrid-header-inner2 head2" style="width:100%;overflow:hidden;">
			    	
			    	<table  style="width:1790px;" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></th>
							<th style="width:250px;text-align: center;" ><dict:lang value="物料/产品SN" /></th >
							<th style="width:70px;text-align: center;" ><dict:lang value="是否超期" /></th >
							<th style="width:110px;text-align: center;" ><dict:lang value="仓库" /></th >
							<th style="width:90px;text-align: center;" ><dict:lang value="物料数量" /></th >
							<th style="width:90px;text-align: center;" ><dict:lang value="复检周期" /></th >
							<th style="width:130px;text-align: center;" ><dict:lang value="复检到期时间" /></th >
							<th style="width:150px;text-align: center;" ><dict:lang value="物料料号" /></th >
							<th style="width:120px;text-align: center;" ><dict:lang value="物料名称" /></th >
							<th style="width:120px;text-align: center;" ><dict:lang value="物料规格" /></th >
							<th style="width:120px;text-align: center;" ><dict:lang value="物料批次" /></th >
							<th style="width:110px;text-align: center;" ><dict:lang value="客户" /></th >
							<th style="width:110px;text-align: center;" ><dict:lang value="供应商" /></th >
										
							<th style="width:130px;text-align: center;" ><dict:lang value="检验时间" /></th >
							<th style="text-align: center;"><dict:lang value="入库时间" /></th>

						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="height:calc(100% - 171px);overflow:auto;" class="scroll2">
    			    	<table style="table-layout:fixed;width:1790px;"  class="dlist-table table-line " id="itemTable">
        			    	<tbody id="itemTbody">
    		                </tbody>
    				
    				    </table>

				    </div>-->
		
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="c408f3497e29446eb0d2f546ff63868b" formIndex="1" />		<div style="padding:1px;"></div>
		
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="cd7439c86e3849dfbc6634e859e36a87" />	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
