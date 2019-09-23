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
  
	<!-- head里面 -->
<script type="text/javascript">
var loaded = 1;
	var tab_len = 3;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
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
		if(tag=="tag2"){
			//searchItemDetail();
		}
	}
$(function(){
	$("#tag1").addClass("current");
	$("#paraMap1_WID_WH_CODE").attr("onchange","_selectCascadNew(this.value,'paraMap1_WID_WH_CODE','d01d895f7b3a4b2992dce2c030fa2715','WID_WH_CODE','WID_DISTRICT_CODE');getStorageCode();");
	$("#paraMap1_WID_DISTRICT_CODE").attr("onchange","getStorageCode();");
	$("#paraMap1_WID_STORAGE_CODE").removeAttr("onchange");
	$("#paraMap1_WII_INVENTORY_COUNT").removeAttr("disabled");
	//console.log($("#paraMap1_WII_STORE_EMP option").size());
	$("#paraMap1_WII_STORE_EMP").chosen("destroy");
	if($("#paraMap1_WII_STORE_EMP option").size()>15){
	    $("#paraMap1_WII_STORE_EMP").chosen({search_contains: true});
        $("#paraMap1_WII_STORE_EMP_chosen .chosen-search").css("display","block");
	}else{
	    $("#paraMap1_WII_STORE_EMP").chosen();
        //$("#paraMap1_WII_STORE_EMP_chosen .chosen-search").css("display","block");
	}
	$("#paraMap1_WID_WH_CODE").chosen("destroy");
	if($("#paraMap1_WID_WH_CODE option").size()>15){
	    $("#paraMap1_WID_WH_CODE").chosen({search_contains: true});
        $("#paraMap1_WID_WH_CODE_chosen .chosen-search").css("display","block");
	}else{
	    $("#paraMap1_WID_WH_CODE").chosen();
        //$("#paraMap1_WID_WH_CODE_chosen .chosen-search").css("display","block");
	}
	var t1 = window.setTimeout(setDocTypeVal,500);
    function setDocTypeVal(){
	    $("#paraMap1_T2#WID_DOC_TYPE").val("DJ17");
	    $("#paraMap1_T2#WID_DOC_TYPE").trigger("chosen:updated");
	}
	if($("#paraMap1_T2#WID_DOC_TYPE").val()=="DJ17"){
	    window.clearTimeout(t1);
	}
});
//根据仓库或者库区获取库位
function getStorageCode(){
    var getStorageUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd";
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getStorageUrl,
			    data: {
			        "whCode" : $("#paraMap1_WID_WH_CODE").val(),
			        "DISTRICT_CODE" : $("#paraMap1_WID_DISTRICT_CODE").val()
			    },
				success: function(data){	
                        util.closeLoading();
                        
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
							$("#paraMap1_WID_STORAGE_CODE").chosen("destroy");
							$("#paraMap1_WID_STORAGE_CODE").empty();
             				$("#paraMap1_WID_STORAGE_CODE").append("<option value=''>--请选择--</option>");
             				$("#paraMap1_WID_STORAGE_CODE").append(tempOption);
             				//$("#paraMap1_WID_STORAGE_CODE").trigger("chosen:updated");
             				if(rccList.length>15){
                            	$("#paraMap1_WID_STORAGE_CODE").chosen({search_contains: true});
                            	$("#paraMap1_WID_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}else{
                        	    $("#paraMap1_WID_STORAGE_CODE").chosen();
                        	    //$("#paraMap1_WID_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}
						}
						
					},
				error: function(msg){
						
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			      
				  }
				});
}
//加载物料库存明细
function loadItemDetail(){
var loadStockInfo = "${path}buss/bussModel_exeFunc.ms?funcMId=cbbefe25f8eb4583badf49886c22a554";
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadStockInfo,
			    data: {
			        "itemCode" : itemCode,
			        "custCode" : custCode,
			        "supCode" : supCode,
			        "whCode" : whCode,
			        "districtCode" : districtCode,
			        "storageCode" : storageCode,
			        "storeEmp" : storeEmp,
			        "invenCount" : invenCount
			    },
				success: function(data){
				                 $("#addItemInfo").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
						
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WSI_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WSI_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].RECEIVE_TIME+"</td>");
								
							}
							
						}
						
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
						
					},
				error: function(msg){
					    console.log("sssssssssssswwwwwwwwwwwwwww");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			      
				  }
				});
}

//物料库存明细 分页及查询
var paginationImpl = {};
function SearchItemInfo(paginationImpl,url){
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			        "paraMap.itemCode" : itemCode,
			        "paraMap.custCode" : custCode,
			        "paraMap.supCode" : supCode,
			        "paraMap.whCode" : whCode,
			        "paraMap.districtCode" : districtCode,
			        "paraMap.storageCode" : storageCode,
			        "paraMap.storeEmp" : storeEmp,
			        "paraMap.invenCount" : invenCount,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemCode="+itemCode+"&paraMap.custCode="+custCode+"&paraMap.supCode="+supCode+"&paraMap.whCode="+whCode+"&paraMap.districtCode="+districtCode+"&paraMap.storageCode="+storageCode+"&paraMap.storeEmp="+storeEmp+"&paraMap.invenCount="+invenCount+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addItemInfo").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WSI_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WSI_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].RECEIVE_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
						
					},
				error: function(msg){
					 console.log("wwwwwwwwwwwww");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			       
				  }
				});
}
//加载物料汇总信息
function loadItemCollect(){
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	util.showLoading("处理中...");
	var loadCollectInfo = "${path}buss/bussModel_exeFunc.ms?funcMId=581f1f30597740e1893baf134f89a4e6";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadCollectInfo,
			    data: {
			        "itemCode" : itemCode,
			        "custCode" : custCode,
			        "supCode" : supCode,
			        "whCode" : whCode,
			        "districtCode" : districtCode,
			        "storageCode" : storageCode,
			        "storeEmp" : storeEmp,
			        "invenCount" : invenCount
			    },
				success: function(data){
				                 $("#addStockInfo").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
						//	$('.scroll1').mCustomScrollbar("destroy");
							for(var i=0;i<rccList.length;i++){
								
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:250px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:200px;text-align: center;'>"+rccList[i].ITEM_NUM+"</td>");
								
								
							}
							
						}
					//	setPopScroll('.scroll1','.head');
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a');
						defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9b4a");
						
					},
				error: function(msg){
					console.log("fffffffffffffffff");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			      
				  }
				});
}
//物料汇总信息  查询及分页
function SearchItemCollect(paginationImpl,url){
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			        "paraMap.itemCode" : itemCode,
			        "paraMap.custCode" : custCode,
			        "paraMap.supCode" : supCode,
			        "paraMap.whCode" : whCode,
			        "paraMap.districtCode" : districtCode,
			        "paraMap.storageCode" : storageCode,
			        "paraMap.storeEmp" : storeEmp,
			        "paraMap.invenCount" : invenCount,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemCode="+itemCode+"&paraMap.custCode="+custCode+"&paraMap.supCode="+supCode+"&paraMap.whCode="+whCode+"&paraMap.districtCode="+districtCode+"&paraMap.storageCode="+storageCode+"&paraMap.storeEmp="+storeEmp+"&paraMap.invenCount="+invenCount+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addStockInfo").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
						//	$('.scroll1').mCustomScrollbar("destroy");
							for(var i=0;i<rccList.length;i++){
								
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
									if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:250px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].ITEM_NUM+"</td>");
								
								
							}
							
						}
					//	setPopScroll('.scroll1','.head');
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff9b4a");
						
					},
				error: function(msg){
					console.log("qqqqqqqqqqqq");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			    
				  }
				});
}
//加载盘点中物料信息
function loadInventoryItem(){
var loadInventoryInfo = "${path}buss/bussModel_exeFunc.ms?funcMId=5c854560385f4f039ad0755146454119";
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadInventoryInfo,
			    data: {
			        "itemCode" : itemCode,
			        "custCode" : custCode,
			        "supCode" : supCode,
			        "whCode" : whCode,
			        "districtCode" : districtCode,
			        "storageCode" : storageCode,
			        "storeEmp" : storeEmp,
			        "invenCount" : invenCount
			    },
				success: function(data){
				                 $("#addPdItemInfo").empty();
						util.closeLoading();
					
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WSI_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WSI_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].RECEIVE_TIME+"</td>");
								
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
						
					},
				error: function(msg){
						console.log("eeeeeeeeeeeeeeee");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			       
				  }
				});
}

//盘点中物料信息 分页及查询
function SearchInventoryItem(paginationImpl,url){
	var itemCode = $("#paraMap1_WII_ITEM_CODE").val();
	var custCode = $("#paraMap1_WID_CUST_CODE").val();
	var supCode = $("#paraMap1_WID_SUP_CODE").val();
	var whCode = $("#paraMap1_WID_WH_CODE").val();
	var districtCode = $("#paraMap1_WID_DISTRICT_CODE").val();
	var storageCode = $("#paraMap1_WID_STORAGE_CODE").val();
	var storeEmp = $("#paraMap1_WII_STORE_EMP").val();
	var invenCount = $("#paraMap1_WII_INVENTORY_COUNT").val();
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			        "paraMap.itemCode" : itemCode,
			        "paraMap.custCode" : custCode,
			        "paraMap.supCode" : supCode,
			        "paraMap.whCode" : whCode,
			        "paraMap.districtCode" : districtCode,
			        "paraMap.storageCode" : storageCode,
			        "paraMap.storeEmp" : storeEmp,
			        "paraMap.invenCount" : invenCount,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.itemCode="+itemCode+"&paraMap.custCode="+custCode+"&paraMap.supCode="+supCode+"&paraMap.whCode="+whCode+"&paraMap.districtCode="+districtCode+"&paraMap.storageCode="+storageCode+"&paraMap.storeEmp="+storeEmp+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#addPdItemInfo").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].NAME==null) rccList[i].NAME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;'>"+rccList[i].WSI_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WSI_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: right;'>"+rccList[i].WSI_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:200px;text-align: center;'>"+rccList[i].RECEIVE_TIME+"</td>");
								
							}
							
						}
					   
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678');
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
						
					},
				error: function(msg){
						console.log("rrrrrrrrrrrrrr");
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     			     
				  }
				});
}
//全选1
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选2
     	function getAllItems1(){
		if($("#allSelects1").attr("checked")=="checked"){
			$("#addStockInfo :checkbox").attr("checked",true);
		}else{
			$("#addStockInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
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
			    	<button type="button" onclick="loadItemDetail();loadItemCollect();loadInventoryItem();"><i class="ico ico-search-new"></i><dict:lang value="加载" /></button>
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="    height: 520px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="831b2dbf0dfb494695b7ce66538a8536" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="831b2dbf0dfb494695b7ce66538a8536" />
	<input type="hidden" name="831b2dbf0dfb494695b7ce66538a8536" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a5620f5aa5e34dd2b12b0d7c50422cb3'" />
		<s:set name="_$formId_1" value="'831b2dbf0dfb494695b7ce66538a8536'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="WII_DOC_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="WII_DOC_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="WII_DOC_NUM" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{WII_DOC_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="T2#WID_DOC_TYPE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="T2#WID_DOC_TYPE" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="T2#WID_DOC_TYPE" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{T2#WID_DOC_TYPE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#WID_INVENTORY_DATE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T2#WID_INVENTORY_DATE" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="T2#WID_INVENTORY_DATE" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{T2#WID_INVENTORY_DATE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WII_ITEM_CODE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="WII_ITEM_CODE" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="WII_ITEM_CODE" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{WII_ITEM_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_CUST_CODE" formId="7263911be02d4e148c925e8e08c3f330" /></td>
			<bu:td cssClass="dec" colNo="WID_CUST_CODE" formId="7263911be02d4e148c925e8e08c3f330" ><bu:ui colNo="WID_CUST_CODE" style="width:200px;" formId="7263911be02d4e148c925e8e08c3f330" value="%{WID_CUST_CODE}" formIndex="1" /></bu:td>
					
			<td class="name" /><bu:uitn colNo="WID_SUP_CODE" formId="7263911be02d4e148c925e8e08c3f330" /></td>
			<bu:td cssClass="dec" colNo="WID_SUP_CODE" formId="7263911be02d4e148c925e8e08c3f330" ><bu:ui colNo="WID_SUP_CODE" style="width:200px;" formId="7263911be02d4e148c925e8e08c3f330" value="%{WID_SUP_CODE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_WH_CODE" formId="7263911be02d4e148c925e8e08c3f330" /></td>
			<bu:td cssClass="dec" colNo="WID_WH_CODE" formId="7263911be02d4e148c925e8e08c3f330" ><bu:ui colNo="WID_WH_CODE" style="width:200px;" formId="7263911be02d4e148c925e8e08c3f330" value="%{WID_WH_CODE}" formIndex="1" /></bu:td>
					
			<td class="name" /><bu:uitn colNo="WID_DISTRICT_CODE" formId="7263911be02d4e148c925e8e08c3f330" /></td>
			<bu:td cssClass="dec" colNo="WID_DISTRICT_CODE" formId="7263911be02d4e148c925e8e08c3f330" ><bu:ui colNo="WID_DISTRICT_CODE" style="width:200px;" formId="7263911be02d4e148c925e8e08c3f330" value="%{WID_DISTRICT_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_STORAGE_CODE" formId="7263911be02d4e148c925e8e08c3f330" /></td>
			<bu:td cssClass="dec" colNo="WID_STORAGE_CODE" formId="7263911be02d4e148c925e8e08c3f330" ><bu:ui colNo="WID_STORAGE_CODE" style="width:200px;" formId="7263911be02d4e148c925e8e08c3f330" value="%{WID_STORAGE_CODE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WII_STORE_EMP" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="WII_STORE_EMP" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="WII_STORE_EMP" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{WII_STORE_EMP}" formIndex="1" /></bu:td>
					
			<td class="name" /><bu:uitn colNo="WII_INVENTORY_COUNT" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="WII_INVENTORY_COUNT" formId="831b2dbf0dfb494695b7ce66538a8536" ><bu:ui colNo="WII_INVENTORY_COUNT" style="width:200px;" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{WII_INVENTORY_COUNT}" formIndex="1" /></bu:td>
		
		</tr>
		<!--
		<tr>
			<td class="name" /><bu:uitn colNo="T2#WID_MEMO" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<bu:td cssClass="dec" colNo="T2#WID_MEMO" formId="831b2dbf0dfb494695b7ce66538a8536" style="height:80px;" colspan="5"><bu:ui colNo="T2#WID_MEMO" style="width:100%;height:100%" formId="831b2dbf0dfb494695b7ce66538a8536" value="%{T2#WID_MEMO}" formIndex="1" /></bu:td>
		</tr>
		-->
	</table>
		<input type="hidden" name="formId" id="formId1" value='4f273d714d9544149f34e2d6d7ff9b4a'/>
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
		<input type="hidden" name="formId" id="formId3" value='4f273d714d9544149f34e2d6d7ff5678'/>
	<div class="js-tab">
						<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料汇总" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料明细" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="盘点中物料" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;"  data-tab="tag1">
				<div class="panel datagrid datagrid-div1">
				<div class="datagrid-div2 datagrid-div6 datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff9b4a" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;text-align: center"></td>
									<!--	<td class="datagrid-cell" style="width:30px;text-align: center">
										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" /> 
										</td>-->
										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:250px;"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:250px;"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="库存数量" /></td >
										
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3  scroll1" style="height:200px;">
							<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a" >
								<tbody id="addStockInfo" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				<div style="background-color: white;margin-top:0px;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemCollect&formId=formId1&showLoading=0" />
                                 	</div>
			</DIV>
		 
        	<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel datagrid datagrid-div1">
				<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
									<!--	<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td> -->
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="入库人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="入库时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:200px;">
							<table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				<div style="background-color: white;margin-top:0px;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                                 		</div>
		</DIV>
		<DIV id="content3" style="display:none" data-tab="tag3">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head3" >
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable4f273d714d9544149f34e2d6d7ff5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
									<!--	<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects3" name="allSelect" onchange="getAllItems3();" />
										</td>-->
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="盘点单号" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="入库人" /></td>
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="入库时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll3" style="height:200px;">
							<table  class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678" >
								<tbody id="addPdItemInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				<div "background-color: white;margin-top:0px;" id="" >
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchInventoryItem&formId=formId4&showLoading=0" />
                                 		</div>
		</DIV>
		 				

	</DIV>

</DIV>
			<bu:jsVal formId="831b2dbf0dfb494695b7ce66538a8536" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="a5620f5aa5e34dd2b12b0d7c50422cb3" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
<script type="text/javascript">
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
function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	//$('.datagrid-body').css('height','calc(100% - 400px)');
	$('.panel1').height($(window).height() - 45 - 105 - 30 -50);
}

$(function(){
    $(document.getElementById('paraMap1_T2#WID_DOC_TYPE')).val("DJ17");
	initHeight();
	var obj = document.getElementById("paraMap1_WII_INVENTORY_COUNT");
   var json = {"UI_RULE_RIGHT":"","UI_RULE_TIP":"请输入0或正整数","UI_RULE_LEFT":"0","UI_RULE":"number"};
   obj.validateJson = json;
   addLoadEvent(function () 
   {
   initValidate(obj);
   });
})

$(window).resize(function(){
	initHeight();
})

function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f242233297b54473884293a518ff0f7f";
	SearchItemInfo(paginationImpl,url);
}
		function alertInfo(msg){
			isQuery = false;
			$("#saveBtn").prop("disabled",false);
			//utilsFp.alert(msg);
			util.closeLoading();
			utilsFp.confirmIcon(3,"","","", msg,"","280","");
		}

function searchItemCollect(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=ea2127cb3ae947dd84ff0f1486670b40";
	SearchItemCollect(paginationImpl,url);
}

function searchInventoryItem(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=e31d365b62a6461caed52d10ce43290b";
	SearchInventoryItem(paginationImpl,url);
}


function addCal(){     
                      // if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                        util.showLoading("处理中...");
                        if(!val.valNullData()){
                            util.closeLoading();
            				return ;
            			}
            			if(!valData()){
            			    util.closeLoading();
            				return ;
            			}
            			if(!val.valOjbsData()){
            			    util.closeLoading();
            				return ;
            			}			
                        if(!val.valDataBaseSetData()){
                             util.closeLoading();
                             return ;
                         }
                         if(!val.valDataBaseSetData()){
                            util.closeLoading();
                    		return ;
                    	}
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           util.closeLoading();
                           	//utilsFp.confirmIcon(1,"","","", "%{getText("未加载物料明细")}",0,"260","");
						    utilsFp.confirmIcon(3,"","","", "<dict:lang value="未加载物料明细" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=b28cc03d24bb47908e3ff873ea85c9d6";
                        document.forms.addForm.submit();
                        xx(); 
                        //isQuery = true;
}
 function xx(){
      util.closeLoading();
 }
</script>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
