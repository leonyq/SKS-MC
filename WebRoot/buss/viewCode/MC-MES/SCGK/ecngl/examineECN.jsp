<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
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
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
    	$("#paraMapObj_CEI_DISTRIBUTE_DEP").attr("class","isSubmit input readonly _VAL_DATABASE");
	$("#tag1").addClass("current");
    setItemInfo();
    
})
//根据变更单回填信息
var trrCount = 0;
function setItemInfo(){
    var ecnSn = $("#paraMapObj_CEI_ECN_SN").val();
     var dataAuthId ='${param.dataAuthId}';
    util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=d60734e6249a4508808b0bf7aadd4cda",
			    data:{
			        "ecnSn":ecnSn,
			         "dataAuthId":dataAuthId
			    },
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
							    var actionSel = "<select id='actionSel_"+(trrCount+1)+"' name='actionSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ actionOption +"</select>";
            					var cutTypeSel = "<select id='cutTypeSel_"+(trrCount+1)+"' name='cutTypeSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ cutTypeOption +"</select>";
            					var projectStepSel = "<select id='projectStepSel_"+(trrCount+1)+"' name='projectStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ projectStepOption +"</select>";
					            $("#addItemDetail").append("<tr id='tr1_"+i+"' ></tr>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' disabled='disabled'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+itemList[i].CEID_ITEM_CODE+"<input type='hidden' name='CBD_ITEM_CODE' value='"+itemList[i].CEID_ITEM_CODE+"' /></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+itemList[i].CI_ITEM_NAME+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+itemList[i].CI_ITEM_SPEC+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+actionSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;display:none;padding:0;'>"+actionSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+projectStepSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;display:none;padding:0;'>"+projectStepSel+"</td>");	
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;padding:0;'><input type='text' style='width:120px;' maxlength='50' class='_VAL_NULL input isSubmit' name='GROUP_CODE' value='"+itemList[i].CEID_GROUP_CODE+"' readonly='readonly'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_NUMBER+"<input type='hidden' name='CBD_POINT' value='"+itemList[i].CEID_NUMBER+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_UNIT+"<input type='hidden' name='CBD_UNITS' value='"+itemList[i].CEID_UNIT+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;text-align: center;padding:0;'>"+itemList[i].CEID_ITEM_NUM+"<input type='hidden' name='CBD_ITEM_NUM' value='"+itemList[i].CEID_ITEM_NUM+"'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'><input type='text' style='width:110px;' maxlength='50' class='_VAL_NULL input isSubmit' name='REPLACE_TYPE' value='"+itemList[i].CEID_REPLACE_TYPE+"' readonly='readonly'/></td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>"+cutTypeSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;display:none;padding:0;'>"+cutTypeSel+"</td>");
            					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='CUT_CODE' value='"+itemList[i].CEID_CUT_CODE+"' readonly='readonly'/></td>");
            					
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
							    var trackWaySel = "<select id='trackWaySel_"+(trrCount+1)+"' name='trackWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								var productWaySel = "<select id='productWaySel_"+(trrCount+1)+"' name='productWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								var shipWaySel = "<select id='shipWaySel_"+(trrCount+1)+"' name='shipWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ productWayOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr3_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:90px;text-align: center;' title='"+proList[i].CEPD_TRACK_NUM+"'>"+proList[i].CEPD_TRACK_NUM+"<input type='hidden' name='TRACKNUM' value='"+proList[i].CEPD_TRACK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='TRACK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].TRACK_DATE+"' disabled='disabled'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;padding:0;'>"+trackWaySel+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;padding:0;display:none'></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' title='"+proList[i].CEPD_STOCK_NUM+"'>"+proList[i].CEPD_STOCK_NUM+"<input type='hidden' name='STOCKNUM' value='"+proList[i].CEPD_STOCK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='PRODUCT_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].STOCK_DATE+"' disabled='disabled'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;'>"+productWaySel+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;padding:0;' title='"+proList[i].CEPD_SHIPMENT_NUM+"'><input type='text' style='width:90px;' maxlength='9' class=' input isSubmit' name='SHIP_NUM' value='"+proList[i].CEPD_SHIPMENT_NUM+"' readonly='readonly'/></td>");
							
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;padding:0;'><input style='width: 120px;' name='SHIP_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+proList[i].SHIP_DATE+"' disabled='disabled'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:130px;padding:0;'>"+shipWaySel+"</td>");
								
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
					            var stockWaySel = "<select id='stockWaySel_"+(trrCount+1)+"' name='stockWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								var orderWaySel = "<select id='orderWaySel_"+(trrCount+1)+"' name='orderWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;' disabled='disabled'><option value=''>--请选择--</option>"+ stockWayOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+stockList[i].CEID_ITEM_CODE+"'>"+stockList[i].CEID_ITEM_CODE+"<input type='hidden' name='ITEM_CODE1' value='"+stockList[i].CEID_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+stockList[i].CI_ITEM_NAME+"'>"+stockList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+stockList[i].CI_ITEM_SPEC+"'>"+stockList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+stockList[i].CEID_ITEMSTOCK_NUM+"'>"+stockList[i].CEID_ITEMSTOCK_NUM+"<input type='hidden' name='WSI_ITEM_NUM' value='"+stockList[i].CEID_ITEMSTOCK_NUM+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'><input style='width: 120px;' name='STOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+stockList[i].STOCK_DATE+"' disabled='disabled'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;'>"+stockWaySel+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;padding:0;display:none;'></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:130px;padding:0;'><input type='text' style='width:130px;' maxlength='9' class=' input isSubmit' name='ORDERITEM_NUM' value='"+stockList[i].CEID_ORDERITEM_NUM+"' readonly='readonly'/></td>");
							
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;padding:0;'><input style='width: 130px;' name='ORDER_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+stockList[i].ORDER_DATE+"' disabled='disabled'/></td>");
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
            					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a8536");
            					//clickTr('itemDetail');	
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
                        
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=01f6fd4b0a9e40769cd2f8b8fcb2acea&ecnSn="+$("#paraMapObj_CEI_ECN_SN").val();
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
			<div class="bd">
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
	<input type="hidden" name="4a5db9f5df65424caa083c77fa45e44b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'267a3b363621406b851af295d836583f'" />
		<s:set name="_$formId_1" value="'4a5db9f5df65424caa083c77fa45e44b'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_ECR_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_SN" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_SN" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CEI_ITEM_CODE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ITEM_CODE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ITEM_CODE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="CEI_URGENT_GRADE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_URGENT_GRADE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_URGENT_GRADE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
		</tr>	
        <tr style="display:none;">
            <td class="name" /><bu:uitn colNo="CEI_ECN_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECN_SN" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECN_SN" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		
        </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_CHANGE_IMPLEMENT" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_CHANGE_IMPLEMENT" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_CHANGE_IMPLEMENT" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		    	
            <td class="name" /><bu:uitn colNo="CEI_DISTRIBUTE_DEP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_DISTRIBUTE_DEP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_DISTRIBUTE_DEP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
					
            <td class="name" /><bu:uitn colNo="CEI_ECR_APPLAYDATE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPLAYDATE" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPLAYDATE" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_ECR_APPLAYEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPLAYEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPLAYEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
					
			<td class="name" /><bu:uitn colNo="CEI_ECR_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_EXAMINEEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CEI_ECR_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECR_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECR_APPROVALEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEI_ECN_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECN_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECN_EXAMINEEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1"/></bu:td>
					
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CEI_ECN_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<bu:td cssClass="dec" colNo="CEI_ECN_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" ><bu:ui colNo="CEI_ECN_APPROVALEMP" style="width:200px;" formId="4a5db9f5df65424caa083c77fa45e44b" dataId="${dataId}" formIndex="1"/></bu:td>
		
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
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a8536">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" disabled="disabled"/>
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
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:260px;">
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
					<div class="datagrid-body datagrid-div3 scroll2" style="height:260px;">
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
					<div class="datagrid-body datagrid-div3 scroll3" style="height:260px;">
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
			<bu:jsVal formId="4a5db9f5df65424caa083c77fa45e44b" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>	

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

