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
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    
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
		
	}
$(function(){
	
	$("#tag1").addClass("current");
	setItemInfo();
})

function popItemDiv(showId,backId){
            if($("#paraMap1_CEI_ITEM_CODE").val()==""){
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择机种" />",0,"260","");
           	return;
           }
            $("#itemCode").val("");	
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.datagrid-div1'});
			
			addItemInfo();
			
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
//根据机种加载物料明细
var trCount=0;
function addItemInfo(){
		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=4eaae601d1b04db9ab2a02bf30534196",
			    data:{
			        "modelCode":$("#paraMapObj_CEI_ITEM_CODE").val()
			    },
				success: function(data){
				        $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CBD_ITEM_NUM==null) rccList[i].CBD_ITEM_NUM=0;
								$("#datagrid-btable-ajax123456 tbody:last").append("<tr id='tr_"+i+"' ></tr>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CBD_ITEM_CODE+"<input type='hidden' id='CBD_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].CBD_POINT+"<input type='hidden' id='CBD_POINT"+rccList[i].ID+"' value='"+rccList[i].CBD_POINT+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].CBD_UNITS+"<input type='hidden' id='CBD_UNITS"+rccList[i].ID+"' value='"+rccList[i].CBD_UNITS+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].CBD_ITEM_NUM+"<input type='hidden' id='CBD_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_NUM+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
						defTableWidthRewrite("123456");
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
    	var modelCode = $("#paraMapObj_CEI_ITEM_CODE").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d595547f951e464186b0a2a463566644",
			    data:{
			      "paraMap.modelCode":modelCode,
			      "paraMap.itemCode":itemCode,
			      "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			      "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CBD_ITEM_NUM==null) rccList[i].CBD_ITEM_NUM=0;
								$("#datagrid-btable-ajax123456 tbody:last").append("<tr id='tr_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CBD_ITEM_CODE+"<input type='hidden' id='CBD_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:110px;text-align: center;'>"+rccList[i].CBD_POINT+"<input type='hidden' id='CBD_POINT"+rccList[i].ID+"' value='"+rccList[i].CBD_POINT+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:110px;text-align: center;'>"+rccList[i].CBD_UNITS+"<input type='hidden' id='CBD_UNITS"+rccList[i].ID+"' value='"+rccList[i].CBD_UNITS+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;text-align: center;'>"+rccList[i].CBD_ITEM_NUM+"<input type='hidden' id='CBD_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_NUM+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
							defTableWidthRewrite("123456");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//保存选择的物料
function addItemList(showId,backId){
	var len = $("#addItemDetail tr").length;
	var ecnAction = $("#ecnAction").html();
var actionOption = ecnAction.substring(ecnAction.indexOf('<option'));
                        	
var cutType = $("#cutType").html();
var cutTypeOption = cutType.substring(cutType.indexOf('<option'));
                        	
var projectStep = $("#projectStep").html();
var projectStepOption = projectStep.substring(projectStep.indexOf('<option'));

	$("#itemTbody :checkbox").each(function(){
			if($(this).attr("checked")){
			        if (!$("#trr"+$(this).attr("id")).length) {
			        var selId = $(this).attr("id");		
                    var tempFl = 0;
			        $('input[name="CBD_ITEM_CODE"]').each(function(i){
                        if($(this).val()==$("#CBD_ITEM_CODE"+selId).val()){
                                tempFl = 1;
                                return false;
                           }
                    });
                    if(tempFl==0){
					var actionSel = "<select id='actionSel_"+(trrCount+1)+"' name='actionSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ actionOption +"</select>";
					var cutTypeSel = "<select id='cutTypeSel_"+(trrCount+1)+"' name='cutTypeSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ cutTypeOption +"</select>";
					var projectStepSel = "<select id='projectStepSel_"+(trrCount+1)+"' name='projectStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ projectStepOption +"</select>";
					
					$("#addItemDetail").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CBD_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CBD_ITEM_CODE' value='"+$("#CBD_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+actionSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;display:none;padding:0;'>"+actionSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+projectStepSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;display:none;padding:0;'>"+actionSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;padding:0;'><input type='text' style='width:120px;' maxlength='50' class='_VAL_NULL input isSubmit' name='GROUP_CODE' value=''/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: center;padding:0;'>"+$("#CBD_POINT"+$(this).attr("id")).val()+"<input type='hidden' name='CBD_POINT' value='"+$("#CBD_POINT"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:120px;text-align: center;padding:0;'>"+$("#CBD_UNITS"+$(this).attr("id")).val()+"<input type='hidden' name='CBD_UNITS' value='"+$("#CBD_UNITS"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;text-align: center;padding:0;'>"+$("#CBD_ITEM_NUM"+$(this).attr("id")).val()+"<input type='hidden' name='CBD_ITEM_NUM' value='"+$("#CBD_ITEM_NUM"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'><input type='text' style='width:110px;' maxlength='50' class='_VAL_NULL input isSubmit' name='REPLACE_TYPE' value=''/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>"+cutTypeSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;display:none;padding:0;'>"+cutTypeSel+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='CUT_CODE' value=''/></td>");
					
					mySetChosen();//设置下拉框样式
					$("#actionSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                    $("#cutTypeSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                    $("#projectStepSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
					len = len+1;
						trrCount++;
					getItemStockDetail();
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a8536");
                    }
				}
			}
	})
	$("#itemTbody").empty();
	
	hideDiv(showId,backId);
	//trCount=0;
	$("#item_list_cb").attr("checked",false);
}
//根据选择的物料获取物料库存明细
function getItemStockDetail(){
		var myItemCode = "";
        $('input[name="CBD_ITEM_CODE"]').each(function(i){
            if(i==0){
                myItemCode = $(this).val();
            }else{
                myItemCode = myItemCode + "@@" +$(this).val();
            } 
        });
        var len = $("#addStockItem tr").length;
		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=79194bfded1643429cb285cd58c4937b",
			    data: {
			        "myItemCode":myItemCode
			    },
				success: function(data){
				                 //$("#addStockItem").empty();
						util.closeLoading();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
	                        var stockWay = $("#stockWay").html();
                            var stockWayOption = stockWay.substring(stockWay.indexOf('<option'));
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
					            if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="";
					            var stockWaySel = "<select id='stockWaySel_"+(trrCount+1)+"' name='stockWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:130px;'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								var orderWaySel = "<select id='orderWaySel_"+(trrCount+1)+"' name='orderWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:130px;'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr2_"+(len+1)+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
								//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'>"+rccList[i].WSI_ITEM_CODE+"<input type='hidden' name='ITEM_CODE1' value='"+rccList[i].WSI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"<input type='hidden' name='WSI_ITEM_NUM' value='"+rccList[i].WSI_ITEM_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='STOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;'>"+stockWaySel+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;display:none;'></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:130px;padding:0;'><input type='text' style='width:130px;' maxlength='9' class=' input isSubmit' name='ORDERITEM_NUM' value='0'/></td>");
							
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;padding:0;'><input style='width: 130px;' name='ORDER_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:130px;padding:0;'>"+orderWaySel+"</td>");
								
								mySetChosen();//设置下拉框样式
                            	$("#stockWaySel_"+(trrCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#orderWaySel_"+(trrCount+1)+"_chosen").attr("style","width:130px;");
                            	
								trrCount++;
							}
							
						}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//根据变更单回填信息
var trrCount = 0;
function setItemInfo(){
    var ecnSn = $("#paraMapObj_CEI_ECN_SN").val();
    var dataId ='${dataId}';
    var dataAuthId ='${param.dataAuthId}';
    util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=d60734e6249a4508808b0bf7aadd4cda",
			    data: {
			        "ecnSn":ecnSn,
			        "dataId":dataId,
			        "dataAuthId":dataAuthId
			    }
			    ,
				success: function(data){
						util.closeLoading();
						if(null != data.ajaxMap){
							var itemList = data.ajaxMap.itemList;
							var proList = data.ajaxMap.proList;
							var stockList = data.ajaxMap.stockList;
							var stockWay = $("#stockWay").html();
                            var stockWayOption = stockWay.substring(stockWay.indexOf('<option'));
	                        var productWay = $("#productWay").html();
                            var productWayOption = productWay.substring(productWay.indexOf('<option'));							
                            var ecnAction = $("#ecnAction").html();
                            var actionOption = ecnAction.substring(ecnAction.indexOf('<option'));
                            var cutType = $("#cutType").html();
                            var cutTypeOption = cutType.substring(cutType.indexOf('<option'));
                            var projectStep = $("#projectStep").html();
                            var projectStepOption = projectStep.substring(projectStep.indexOf('<option'));
							for(var i=0;i<itemList.length;i++){
							    if(itemList[i].CI_ITEM_NAME==null) itemList[i].CI_ITEM_NAME="";
								if(itemList[i].CI_ITEM_SPEC==null) itemList[i].CI_ITEM_SPEC="";
					            if(itemList[i].CEID_GROUP_CODE==null) itemList[i].CEID_GROUP_CODE="";
					            if(itemList[i].CEID_NUMBER==null) itemList[i].CEID_NUMBER="";
					            if(itemList[i].CEID_UNIT==null) itemList[i].CEID_UNIT="";
					            if(itemList[i].CEID_ITEM_NUM==null) itemList[i].CEID_ITEM_NUM="";
					            if(itemList[i].CEID_CUT_CODE==null) itemList[i].CEID_CUT_CODE="";
							    var actionSel = "<select id='actionSel_"+(trrCount+1)+"' name='actionSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ actionOption +"</select>";
            					var cutTypeSel = "<select id='cutTypeSel_"+(trrCount+1)+"' name='cutTypeSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ cutTypeOption +"</select>";
            					var projectStepSel = "<select id='projectStepSel_"+(trrCount+1)+"' name='projectStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ projectStepOption +"</select>";
					            $("#addItemDetail").append("<tr id='tr1_"+i+"' ></tr>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+itemList[i].CEID_ITEM_CODE+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+itemList[i].CEID_ITEM_CODE+"<input type='hidden' name='CBD_ITEM_CODE' value='"+itemList[i].CEID_ITEM_CODE+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+itemList[i].CI_ITEM_NAME+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+itemList[i].CI_ITEM_SPEC+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+actionSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;display:none;padding:0;'>"+actionSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+projectStepSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;display:none;padding:0;'>"+projectStepSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;padding:0;'><input type='text' style='width:120px;' maxlength='50' class='_VAL_NULL input isSubmit' name='GROUP_CODE' value='"+itemList[i].CEID_GROUP_CODE+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_NUMBER+"<input type='hidden' name='CBD_POINT' value='"+itemList[i].CEID_NUMBER+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_UNIT+"<input type='hidden' name='CBD_UNITS' value='"+itemList[i].CEID_UNIT+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_ITEM_NUM+"<input type='hidden' name='CBD_ITEM_NUM' value='"+itemList[i].CEID_ITEM_NUM+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'><input type='text' style='width:110px;' maxlength='50' class='_VAL_NULL input isSubmit' name='REPLACE_TYPE' value='"+itemList[i].CEID_REPLACE_TYPE+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>"+cutTypeSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;display:none;padding:0;'>"+cutTypeSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='CUT_CODE' value='"+itemList[i].CEID_CUT_CODE+"'/></td>");
            					
            					mySetChosen();//设置下拉框样式
            					$("#actionSel_"+(trrCount+1)).val(itemList[i].CEID_ACTION);
								$("#actionSel_"+(trrCount+1)).trigger("chosen:updated");
								$("#projectStepSel_"+(trrCount+1)).val(itemList[i].CEID_PRODUCT_STEP);
								$("#projectStepSel_"+(trrCount+1)).trigger("chosen:updated");
								$("#cutTypeSel_"+(trrCount+1)).val(itemList[i].CEID_CUT_TYPE);
								$("#cutTypeSel_"+(trrCount+1)).trigger("chosen:updated");
								
            					$("#actionSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                                $("#cutTypeSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                                $("#projectStepSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
            						trrCount++;
            						
							}
							for(var i=0;i<proList.length;i++){
							    if(proList[i].TRACK_DATE==null) proList[i].TRACK_DATE="";
								if(proList[i].STOCK_DATE==null) proList[i].STOCK_DATE="";
					            if(proList[i].CEPD_SHIPMENT_NUM==null) proList[i].CEPD_SHIPMENT_NUM="";
					            if(proList[i].SHIP_DATE==null) proList[i].SHIP_DATE="";
							    var trackWaySel = "<select id='trackWaySel_"+(trrCount+1)+"' name='trackWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								var productWaySel = "<select id='productWaySel_"+(trrCount+1)+"' name='productWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								var shipWaySel = "<select id='shipWaySel_"+(trrCount+1)+"' name='shipWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr3_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:90px;text-align: center;' title='"+proList[i].CEPD_TRACK_NUM+"'>"+proList[i].CEPD_TRACK_NUM+"<input type='hidden' name='TRACKNUM' value='"+proList[i].CEPD_TRACK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='TRACK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].TRACK_DATE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;padding:0;'>"+trackWaySel+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;padding:0;display:none'></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' title='"+proList[i].CEPD_STOCK_NUM+"'>"+proList[i].CEPD_STOCK_NUM+"<input type='hidden' name='STOCKNUM' value='"+proList[i].CEPD_STOCK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='PRODUCT_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].STOCK_DATE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+productWaySel+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;padding:0;' title='"+proList[i].CEPD_SHIPMENT_NUM+"'><input type='text' style='width:90px;' maxlength='9' class=' input isSubmit' name='SHIP_NUM' value='"+proList[i].CEPD_SHIPMENT_NUM+"'/></td>");
							
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'><input style='width: 120px;' name='SHIP_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].SHIP_DATE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>"+shipWaySel+"</td>");
								
								mySetChosen();//设置下拉框样式
								$("#trackWaySel_"+(trrCount+1)).val(proList[i].CEPD_TRACK_HANDLEWAY);
								$("#trackWaySel_"+(trrCount+1)).trigger("chosen:updated");
								$("#productWaySel_"+(trrCount+1)).val(proList[i].CEPD_STOCK_HANDLEWAY);
								$("#productWaySel_"+(trrCount+1)).trigger("chosen:updated");
								$("#shipWaySel_"+(trrCount+1)).val(proList[i].CEPD_SHIPMENT_HANDLEWAY);
								$("#shipWaySel_"+(trrCount+1)).trigger("chosen:updated");
								
                            	$("#trackWaySel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                            	$("#productWaySel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
                            	$("#shipWaySel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
								trrCount++;
							}
							for(var i=0;i<stockList.length;i++){
							    if(stockList[i].CI_ITEM_NAME==null) stockList[i].CI_ITEM_NAME="";
								if(stockList[i].CI_ITEM_SPEC==null) stockList[i].CI_ITEM_SPEC="";
					            if(stockList[i].CEID_ITEMSTOCK_NUM==null) stockList[i].CEID_ITEMSTOCK_NUM="";
					            if(stockList[i].STOCK_DATE==null) stockList[i].STOCK_DATE="";
					            if(stockList[i].CEID_ORDERITEM_NUM==null) stockList[i].CEID_ORDERITEM_NUM="";
					            if(stockList[i].ORDER_DATE==null) stockList[i].ORDER_DATE="";
					            var stockWaySel = "<select id='stockWaySel_"+(trrCount+1)+"' name='stockWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								var orderWaySel = "<select id='orderWaySel_"+(trrCount+1)+"' name='orderWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+stockList[i].CEID_ITEM_CODE+"'>"+stockList[i].CEID_ITEM_CODE+"<input type='hidden' name='ITEM_CODE1' value='"+stockList[i].CEID_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+stockList[i].CI_ITEM_NAME+"'>"+stockList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+stockList[i].CI_ITEM_SPEC+"'>"+stockList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+stockList[i].CEID_ITEMSTOCK_NUM+"'>"+stockList[i].CEID_ITEMSTOCK_NUM+"<input type='hidden' name='WSI_ITEM_NUM' value='"+stockList[i].CEID_ITEMSTOCK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='STOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+stockList[i].STOCK_DATE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;'>"+stockWaySel+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;display:none;'></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:130px;padding:0;'><input type='text' style='width:130px;' maxlength='9' class=' input isSubmit' name='ORDERITEM_NUM' value='"+stockList[i].CEID_ORDERITEM_NUM+"'/></td>");
							
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;padding:0;'><input style='width: 130px;' name='ORDER_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+stockList[i].ORDER_DATE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:130px;padding:0;'>"+orderWaySel+"</td>");
								
								mySetChosen();//设置下拉框样式
								$("#stockWaySel_"+(trrCount+1)).val(stockList[i].CEID_ITEMSTOCK_HANDLEWAY);
								$("#stockWaySel_"+(trrCount+1)).trigger("chosen:updated");
								$("#orderWaySel_"+(trrCount+1)).val(stockList[i].CEID_ORDERITEM_HANDLEWAY);
								$("#orderWaySel_"+(trrCount+1)).trigger("chosen:updated");
								
                            	$("#stockWaySel_"+(trrCount+1)+"_chosen").attr("style","width:130px;");
                            	$("#orderWaySel_"+(trrCount+1)+"_chosen").attr("style","width:130px;");
                            	
								trrCount++;
							}
						}
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 tbody tr");
            					_tongLineColor(tableTrJs);
            					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536');
            					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a8536");
						var tableTrJs1 = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
						_tongLineColor(tableTrJs1);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						var tableTrJs2 = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs2);
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
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
		if(item.id!=""){
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
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
			var itemCode = $(this).val();
			$("input[name='ITEM_CODE1']").each(function(){
			    if(itemCode==$(this).val()){
			        var trid1 = $(this).parent().parent().attr("id");
			        $("#"+trid1).remove();
			    }
			})
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536');
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a8536");
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
     	function getAllItems1(){
		if($("#allSelects1").attr("checked")=="checked"){
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
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
                        var len = $("#addItemDetail tr").length;
                        if(len<=0){
                          // utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条单据明细信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加物料明细" />",0,"260","");
                           return;
                        }
                        
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=f53a34c0d62542a99b2c8e38fe62bee0&ecnSn="+$("#paraMapObj_CEI_ECN_SN").val();
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4a5db9f5df65424caa083c77fa45e44b" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4a5db9f5df65424caa083c77fa45e44b" />
	<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a8536'/>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="formId" id="formId4" value='123456'/>
	<input type="hidden" name="4a5db9f5df65424caa083c77fa45e44b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ebe624d6351e4588aee37c1db25d011c'" />
		<s:set name="_$formId_1" value="'4a5db9f5df65424caa083c77fa45e44b'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_ECR_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_SN" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_SN" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CEI_ITEM_CODE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ITEM_CODE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ITEM_CODE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="CEI_URGENT_GRADE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_URGENT_GRADE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_URGENT_GRADE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>	
        <tr style="display:none;">
            <td class="name" /><bu:uitn colNo="CEI_ECN_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECN_SN" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECN_SN" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
        </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_CHANGE_IMPLEMENT" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_CHANGE_IMPLEMENT" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_CHANGE_IMPLEMENT" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		    	
            <td class="name" /><bu:uitn colNo="CEI_DISTRIBUTE_DEP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_DISTRIBUTE_DEP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_DISTRIBUTE_DEP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
					
            <td class="name" /><bu:uitn colNo="CEI_ECR_APPLAYDATE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPLAYDATE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPLAYDATE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_ECR_APPLAYEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPLAYEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPLAYEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
					
			<td class="name" /><bu:uitn colNo="CEI_ECR_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_EXAMINEEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CEI_ECR_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPROVALEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV>
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料明细" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料库存明细" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="成品库存明细" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" data-tab="tag1">
			<div class="extend-btn" id="addDel" style="float: right;margin-top:-35px;margin-bottom:5px;">
            	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料">
            		<i class="ico ico-kl-new-add ico-small"></i>
            	</button>
            	<button type="button" onclick="delRow();" style="padding:0" title="删除">
            		<i class="ico ico-sc-new-add ico-small"></i>
            	</button>
            </div>
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a8536">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="动作" /></td >
										<td style="display:none;width:120px;">
										<dict:selectDict id="ecnAction" name="ecnAction" dictCode="ECN_ACTION" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="生产阶别" /></td >
										<td style="display:none;width:120px;">
										<dict:selectDict id="projectStep" name="projectStep" dictCode="PROJECT_STEP" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="工序" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="位号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="单位" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="数量" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="替代方式" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="切入方式" /></td >
										<td style="display:none;width:120px;">
										<dict:selectDict id="cutType" name="cutType" dictCode="CUT_TYPE" />
										</td >
										
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="切入模块编码" /></td>

									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:300px;"><!--280-->
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				
			</DIV>
		 
        	<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<!--<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects2" name="allSelect" onchange="getAllItems2();" />
										</td>-->
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="库存物料数量" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="库存统计日期" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="库存物料处理方式" /></td >
										<td style="display:none;width:120px;">
										<dict:selectDict id="stockWay" name="stockWay" dictCode="ITEMSTOCK_HANDLEWAY" />
										</td >
										
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="已下订单物料数量" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="已下订单统计日期" /></td >
										<td class="datagrid-cell" style="width:130px;"><dict:lang value="已下订单处理方式" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:300px;">
						<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addStockItem" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
		</DIV>
		<DIV id="content3" style="display:none" data-tab="tag3">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head3">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<!--<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects3" name="allSelect" onchange="getAllItems3();" />
										</td>-->
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="在制数量" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="在制统计日期" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="在制处理方式" /></td >
										<td style="display:none;width:120px;">
										<dict:selectDict id="productWay" name="productWay" dictCode="PRODUCT_HANDLEWAY" />
										</td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="在库数量" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="在库统计日期" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="在库处理方式" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="已出货数量" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="出货统计日期" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="出货处理方式" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll3" style="height:300px;">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addProductStock" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
		</DIV>
	</DIV>

</DIV>
<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:20px;width:870px;height:500px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 25px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItemInfo('formId4');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head4"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td>
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
									<td style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></td>
									<td style="width: 150px;text-align: center;"><dict:lang value="物料名称" /></td>
									<td style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></td>
									<td style="width: 110px;text-align: center;"><dict:lang value="位号" /></td>
									<td style="width: 110px;text-align: center;"><dict:lang value="单位" /></td>	
									<td style="width: 110px;text-align: center;"><dict:lang value="数量" /></td>									
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4" style="height:320px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="itemTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId4&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="4a5db9f5df65424caa083c77fa45e44b" formIndex="1" />
									
			</div>
	</form>	
	</div>

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
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

