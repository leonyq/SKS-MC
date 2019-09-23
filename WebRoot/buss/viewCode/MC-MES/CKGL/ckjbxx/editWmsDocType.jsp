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
    <style>
        	.yuo{
        	    width:30px !important;
        	    
        	    
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
		if(tag=="tag2"&&loaded==1){
		    mySetChosen();//设置下拉框样式
		    loaded++;
		}
	}
	
function popModelDiv(showId,backId){
            $("#paraMapObj_WDT_ORDER_SET").val("");
            $("#paraMapObj_WDT_ORDER_SET").trigger("chosen:updated");
            $("#paraMapObj_WDO_ORDER_SN").val("");
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			
			//$("#searchDevTypeSelect").attr("class"," input isSubmit  dept_select");
			//$("#searchDevTypeSelect").attr("style","width:157px;display: none;");
			//mySetChosen(); 
			$("#paraMapObj_WDT_ORDER_SET_chosen").attr("style","width:230px;");
			addOrderInfo();
			//getModTypeSelect();
	}
function hideDiv(showId,backId){
			//$(' .chosen-container').css("width","230px");
			//var value = $("#add_type").val();
			$("#"+showId+",#"+backId).hide();
			//$("#role_list_cb").attr("checked",false);
			//$("#job_list_cb").attr("checked",false);
			
			closeDivFp(showId+"pop");
		}
		
var trCount=0;
//弹出div指令内容
function addOrderInfo(){
		util.showLoading("处理中...");
		var typeSn=$("#paraMapObj_WDT_TYPE_SN").val();
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=05d55983cfb745d9aff549726ff2011a",//VM-单据配置中心-新增 操作功能 加载指令信息
			    data: {
			        "type":"2",
			        "WDT_TYPE_SN":typeSn
			    },
				success: function(data){
				                 $("#orderTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].TCL_CODE==null) rccList[i].TCL_CODE="";
								if(rccList[i].TCL_NAME==null) rccList[i].TCL_NAME="";
								var code=rccList[i].TCS_CODE+rccList[i].TCL_CODE;
								$("#orderTable tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='TCS_CODE"+code+"' value='"+rccList[i].TCS_CODE+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+code+"' type='checkbox' name='isSelect1'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:220px;text-align: center;'>"+rccList[i].TCL_CODE+"<input type='hidden' id='TCL_CODE"+code+"' value='"+rccList[i].TCL_CODE+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:220px;text-align: center;'>"+rccList[i].TCL_NAME+"<input type='hidden' id='TCL_NAME"+code+"' value='"+rccList[i].TCL_NAME+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;'>"+rccList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+code+"' value='"+rccList[i].TCS_NAME+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#orderTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('orderTable');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//div指令内容分页
var paginationImpl = {};
function searchOrderInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=91f902675c6441abbbc6245a89cd6d75";//VM-单据配置中心-新增 操作功能 指令信息分页
	SearchOrderInfo(paginationImpl,url);
}
function SearchOrderInfo(paginationImpl,url){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var orderSet = $("#paraMapObj_WDT_ORDER_SET").val();
        var orderSn = $("#paraMapObj_WDO_ORDER_SN").val();
        var WDT_TYPE_SN = $("#paraMapObj_WDT_TYPE_SN").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			       "paraMap.type":"1",
			       "paraMap.WDT_TYPE_SN":WDT_TYPE_SN,
			       "paraMap.orderSet":orderSet,
			       "paraMap.orderSn":orderSn,
			       "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			       "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    }, 
			    //"paraMap.WDT_TYPE_SN="+WDT_TYPE_SN+"&paraMap.type=2&paraMap.orderSet="+orderSet+"&paraMap.orderSn="+orderSn+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#orderTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].TCL_CODE==null) rccList[i].TCL_CODE="";
								if(rccList[i].TCL_NAME==null) rccList[i].TCL_NAME="";
								var code=rccList[i].TCS_CODE+rccList[i].TCL_CODE;
								$("#orderTable tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"<input type='hidden' id='TCS_CODE"+code+"' value='"+rccList[i].TCS_CODE+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+code+"' type='checkbox' name='isSelect1'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:220px;text-align: center;'>"+rccList[i].TCL_CODE+"<input type='hidden' id='TCL_CODE"+code+"' value='"+rccList[i].TCL_CODE+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:220px;text-align: center;'>"+rccList[i].TCL_NAME+"<input type='hidden' id='TCL_NAME"+code+"' value='"+rccList[i].TCL_NAME+"'/></td>");
								$("#orderTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;'>"+rccList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+code+"' value='"+rccList[i].TCS_NAME+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#orderTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('orderTable');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//保存选择的指令
function addOrderList(showId,backId){
	var len = $("#addOrderSet tr").length;
	$("#orderTbody :checkbox").each(function(){
			if($(this).attr("checked")){
				if (!$("#trr"+$(this).attr("id")).length) { //验证是否有重复的
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'>"+$("#TCL_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='TCL_CODE' value='"+$("#TCL_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: center;'>"+$("#TCL_NAME"+$(this).attr("id")).val()+"<input type='hidden' name='TCS_CODE' value='"+$("#TCS_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:110px;text-align: center;'>"+$("#TCS_NAME"+$(this).attr("id")).val()+"</td>");
						len = len+1;
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				}
			}
	})
	$("#orderTbody").empty();
	//document.getElementById(showId).style.display = 'none';
	//document.getElementById(backId).style.display = 'none';
	hideDiv(showId,backId);
	trCount=0;
	$("#model_list_cb").attr("checked",false);
}
function delRow(){
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
     	function getAllModel(){
		if($("#model_list_cb").attr("checked")=="checked"){
			$("#orderTbody :checkbox").attr("checked",true);
		}else{
			$("#orderTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}   
	       //全选2
     	function getAllModels(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	//全选3
     	function getAllModels1(){
		if($("#allSelect1").attr("checked")=="checked"){
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
//添加行
var ttCount=0;
function addMyRow(){
	var len = $("#addDispatchType tr").length;
	var isCheckOpt = $("#isCheck").html();
	var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
	var isCheckSel = "<select id='isCheckSel_"+(ttCount+1)+"' name='isCheckSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
	var isHandSel = "<select id='isHandSel_"+(ttCount+1)+"' name='isHandSelect' class=' input isSubmit _VAL_OjbsData dept_select' onchange='changeHandType("+(ttCount+1)+");' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
	var isERPSel = "<select id='isERPSel_"+(ttCount+1)+"' name='isERPSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
	var checkSt = $("#checkSt").html();
	var testStepOption = checkSt.substring(checkSt.indexOf('<option'));
	var testStepSel = "<select id='testStepSel_"+(ttCount+1)+"' name='testStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ testStepOption +"</select>";
	var checkTy = $("#checkTy").html();
	var sampleOption = checkTy.substring(checkTy.indexOf('<option'));
	var sampleSel = "<select id='sampleSel_"+(ttCount+1)+"' name='sampleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ sampleOption +"</select>";
	var handWay = $("#handWay").html();
	var handWayOption = handWay.substring(handWay.indexOf('<option'));
	var handWaySel = "<select id='handWaySel_"+(ttCount+1)+"' name='handWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ handWayOption +"</select>";
	var createRule = $("#createRule").html();
	var createRuleOption = createRule.substring(createRule.indexOf('<option'));
	var createRuleSel = "<select id='createRule_"+(ttCount+1)+"' name='createRuleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ createRuleOption +"</select>";
	
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tbody:last").append("<tr id='"+(ttCount+1)+"'></tr>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align:center;'>"+(len+1)+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align:center;'><input type='checkbox'/></td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='WDO_DISPATCH_SN'/></td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='WDO_DISPATCH_NAME'/></td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%' maxlength='50' class=' input isSubmit' name='WDO_DISPATCH_PREFIX'/></td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+isCheckSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;'>"+isCheckSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td id='testStep_"+(ttCount+1)+"' class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+testStepSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;'>"+isCheckSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;padding:0;'>"+sampleSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='display:none;'>"+isCheckSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>"+isHandSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td id='handSel_"+(ttCount+1)+"' class='datagrid-cell datagrid-cell-10' style='width:120px;padding:0;'>"+handWaySel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='display:none;'>"+isCheckSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+isERPSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:240px;padding:0;'>"+createRuleSel+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='display:none;'>"+isCheckSel+"</td>");
	
	mySetChosen();//设置下拉框样式
	$("#isCheckSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#isHandSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#isERPSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#testStepSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#sampleSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#handWaySel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
	$("#createRuleSel_"+(ttCount+1)+"_chosen").attr("style","width:240px;");
	ttCount++;
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
}
//删除行
function delMyRow(){
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');	
}
//根据类型编码带出相关信息
function getOrderInfo(){
	util.showLoading("处理中...");
	        var wdo_type_sn=$("#paraMapObj_WDT_TYPE_SN").val();
	        var dataId = "${dataId}";
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7367c4b827184d68832a757db764573b",//VM-单据配置中心-修改 操作功能 修改页面加载关联的指令
			    data:{
			        "wdo_type_sn":wdo_type_sn,
			        "dataId":dataId
			    },
			    //data: "",
				success: function(data){
				                 //$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var orderList =data.ajaxMap.orderList;
							var typeList =data.ajaxMap.typeList;
						
							for(var i=0;i<orderList.length;i++){
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:110px;text-align: center;'>"+orderList[i].TCL_CODE+"<input type='hidden' name='TCL_CODE' value='"+orderList[i].TCL_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: center;'>"+orderList[i].TCL_NAME+"<input type='hidden' name='TCS_CODE' value='"+orderList[i].TCS_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:110px;text-align: center;'>"+orderList[i].TCS_NAME+"</td>");
							}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							for(var i=0;i<typeList.length;i++){
							    var isCheckOpt = $("#isCheck").html();
                            	var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
                            	var isCheckSel = "<select id='isCheckSel_"+(ttCount+1)+"' name='isCheckSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var isHandSel = "<select id='isHandSel_"+(ttCount+1)+"' name='isHandSelect' class=' input isSubmit _VAL_OjbsData dept_select' onchange='changeHandType("+(ttCount+1)+");' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var isERPSel = "<select id='isERPSel_"+(ttCount+1)+"' name='isERPSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                            	var checkSt = $("#checkSt").html();
                            	var testStepOption = checkSt.substring(checkSt.indexOf('<option'));
                            	var testStepSel = "<select id='testStepSel_"+(ttCount+1)+"' name='testStepSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ testStepOption +"</select>";
                            	var checkTy = $("#checkTy").html();
                            	var sampleOption = checkTy.substring(checkTy.indexOf('<option'));
                            	var sampleSel = "<select id='sampleSel_"+(ttCount+1)+"' name='sampleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ sampleOption +"</select>";
                            	var handWay = $("#handWay").html();
                            	var handWayOption = handWay.substring(handWay.indexOf('<option'));
                            	if(typeList[i].WDO_HANDOVER_FLAG=='Y'){
                            	    var handWaySel = "<select id='handWaySel_"+(ttCount+1)+"' name='handWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ handWayOption +"</select>";
                            	}else{
                            	    var handWaySel = "<select id='handWaySel_"+(ttCount+1)+"' name='handWaySelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option></select>";
                            	}
                            	var createRule = $("#createRule").html();
	                            var createRuleOption = createRule.substring(createRule.indexOf('<option'));
	                            var createRuleSel = "<select id='createRule_"+(ttCount+1)+"' name='createRuleSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ createRuleOption +"</select>";
	
								if(typeList[i].WDO_DISPATCH_PREFIX==null) typeList[i].WDO_DISPATCH_PREFIX="";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1 yuo' style='text-align: center;width:30px;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:30px;'><input type='checkbox'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='WDO_DISPATCH_SN' value='"+typeList[i].WDO_DISPATCH_SN+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class='_VAL_NULL input isSubmit' name='WDO_DISPATCH_NAME' value='"+typeList[i].WDO_DISPATCH_NAME+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align:center;padding:0;'><input type='text' style='width:100%;' maxlength='50' class=' input isSubmit' name='WDO_DISPATCH_PREFIX' value='"+typeList[i].WDO_DISPATCH_PREFIX+"'/></td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;padding:0;'>"+isCheckSel+"</td>");
							    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td id='testStep_"+(ttCount+1)+"' class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+testStepSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;padding:0;'>"+sampleSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>"+isHandSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td id='handSel_"+(ttCount+1)+"' class='datagrid-cell datagrid-cell-10' style='width:120px;padding:0;'>"+handWaySel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='display:none;'>"+isCheckSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+isERPSel+"</td>");
                            	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='padding:0;'>"+createRuleSel+"</td>");
                                $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678  tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='display:none;'>"+isCheckSel+"</td>");														
                                mySetChosen();//设置下拉框样式
                            	$("#isCheckSel_"+(ttCount+1)).val(typeList[i].WDO_SAMPLE_FLAG);
								$("#isCheckSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#testStepSel_"+(ttCount+1)).val(typeList[i].WDO_TEST_STEP);
								$("#testStepSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#sampleSel_"+(ttCount+1)).val(typeList[i].WDO_SAMPLE_TYPE);
								$("#sampleSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#isHandSel_"+(ttCount+1)).val(typeList[i].WDO_HANDOVER_FLAG);
								$("#isHandSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#handWaySel_"+(ttCount+1)).val(typeList[i].WDO_HANDOVER_WAYS);
								$("#handWaySel_"+(ttCount+1)).trigger("chosen:updated");
								$("#isERPSel_"+(ttCount+1)).val(typeList[i].WDO_UPLOAD_FLAG);
								$("#isERPSel_"+(ttCount+1)).trigger("chosen:updated");
								$("#createRule_"+(ttCount+1)).val(typeList[i].WDT_CREATE_RULE);
								$("#createRule_"+(ttCount+1)).trigger("chosen:updated");
								
                            	$("#isCheckSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#isHandSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#isERPSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#testStepSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#sampleSel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#handWaySel_"+(ttCount+1)+"_chosen").attr("style","width:100%;");
                            	$("#createRuleSel_"+(ttCount+1)+"_chosen").attr("style","width:240px;");
							    ttCount++;
							}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						}
						
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
</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
    <style>
    .acss{
        width:30px!important;
    }
    </style>
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
        					<!--<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ef1235107cca42518c74d9cac446da3f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="WDT_TYPE_SN" name="WDT_TYPE_SN" value="" />
	<input type="hidden" name="formIds" value="ef1235107cca42518c74d9cac446da3f" />
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="ef1235107cca42518c74d9cac446da3f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'50d56b12f36c4160ab35c65a3bd758f1'" />
		<s:set name="_$formId_1" value="'ef1235107cca42518c74d9cac446da3f'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" >
			<bu:ui colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_HANDOVER_FLAG" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_HANDOVER_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			
			</bu:td>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" >
			<bu:ui colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_EXCESS_PICK" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_EXCESS_PICK" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="WDT_PDA_FLAG" formId="ef1235107cca42518c74d9cac446da3f" />
			<bu:ui colNo="WDT_PDA_FLAG" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" />
			
			</bu:td>
		
			<td class="name" /><bu:uitn colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_HANDOVER_WAYS" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<bu:td cssClass="dec" colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			
	</table>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV >
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="指令信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="收发类型" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" data-tab="tag1">
		<div class="extend-btn" id="addDel" style="float: right;margin-top:-39px;">
	<button type="button" onclick="popModelDiv('addModel','backModel');" style="padding:0;" title="新增">
		<i class="ico ico-kl-new-add ico-small"></i>
	</button>
	<button type="button" onclick="delRow();" style="padding:0" title="删除">
		<i class="ico ico-sc-new-add ico-small"></i>
	</button>
		</div>
        	<div class="mod" >
			<div class="mod-bd">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
						
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令代码" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令名称" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="指令集名称" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scorl1"   style="height:170px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addOrderSet" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			
			
					<div class="extend-btn" style="float: right;margin-top: -39px;">
						<button type="button"    onclick="addMyRow();" style="padding:0;" title="<dict:lang value="新增" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="delMyRow();" style="padding:0;"   title="<dict:lang value="删除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			
			<div class="mod" >
			<div class="mod-bd">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="overflow-x:hidden;"  >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2" id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz datagrid-btable" id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell acss" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="allSelect1" onchange="getAllModels1();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型代码" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="收发类型前缀" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="是否送检" /></td >
										<td style="display:none;">
										<dict:selectDict id="isCheck" name="isCheck" dictCode="YOrN" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="检测阶别" /></td >
										<td style="display:none;">
										<dict:selectDict id="checkSt" name="checkSt" dictCode="QTI_TEST_STEP" />
										</td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="检测类型" /></td >
										<td style="display:none;">
										<dict:selectDict id="checkTy" name="checkTy" dictCode="SAMPLE_TYPE" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="是否交接" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="交接方式" /></td >
										<td style="display:none;">
										<dict:selectDict id="handWay" name="handWay" dictCode="HANDOVER_WAYS" />
										</td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="ERP同步标志" /></td >
										
										<td class="datagrid-cell" style="width:240px;" ><dict:lang value="生成规则" /></td >
										<td style="display:none;">
										<bu:ui colNo="WDT_CREATE_RULE" style="width:240px;"  id="createRule" name="createRule" formId="ef1235107cca42518c74d9cac446da3f" value="%{WDT_CREATE_RULE}" formIndex="1" />
										</td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scorl2"   style="height:170px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addDispatchType" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>		
		 				</DIV>
		 				

						</DIV>

	</DIV>
</div>
	</div>	
			<div id="backModel" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addModel" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:770px;height:480px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择指令" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addModel','backModel');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addOrderList('addModel','backModel');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addModel','backModel');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchOrderInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><bu:uitn colNo="WDT_ORDER_SET" formId="ef1235107cca42518c74d9cac446da3f" /></td>
					<bu:td cssClass="dec" colNo="WDT_ORDER_SET" formId="ef1235107cca42518c74d9cac446da3f" ><bu:ui colNo="WDT_ORDER_SET" formId="ef1235107cca42518c74d9cac446da3f" value="%{WDT_ORDER_SET}" formIndex="1" /></bu:td>
			    		<td class="name" /><bu:uitn colNo="WDO_ORDER_SN" formId="3f44458ddae84ef7b214f230a8a4d7d9" /></td>
					<bu:td cssClass="dec" colNo="WDO_ORDER_SN" formId="3f44458ddae84ef7b214f230a8a4d7d9" ><bu:ui colNo="WDO_ORDER_SN" formId="3f44458ddae84ef7b214f230a8a4d7d9" value="%{WDO_ORDER_SN}" formIndex="1" /></bu:td>
			    	
			    	</tr>
			    	</table>
			    	<div style="width:770px;">  
			    	<table  width="770px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="model_list_cb"  onchange="getAllModel();" /></th>
							<th style="width: 220px;text-align: center;"><dict:lang value="指令代码" /></th>
							<th style="width: 220px;text-align: center;"><dict:lang value="指令名称" /></th>
							<th style="text-align: center;"><dict:lang value="指令集名称" /></th>
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:770px;height:calc(100% - 140px);overflow-y: auto;overflow-x: hidden;" class="scroll">  
			    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="orderTable">
			    	<tbody id="orderTbody">
		                </tbody>
				
				</table>

				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOrderInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

</div>
			<bu:jsVal formId="ef1235107cca42518c74d9cac446da3f" formIndex="1" />	
						
			</div>
	</form>	
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<bu:script viewId="50d56b12f36c4160ab35c65a3bd758f1" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	$("#tag1").addClass("current");
	$("#paraMapObj_WDT_SAMPLE_FLAG_1").attr("onchange","changeInfo();");
	$("#paraMapObj_WDT_OPERATE_TYPE").attr("onchange","changeCheckState();");
	$("#WDT_TYPE_SN").val($("#paraMapObj_WDT_TYPE_SN").val());
	$("#paraMapObj_WDT_HANDOVER_FLAG_1").attr("onchange","changehandOverWay();");
	getOrderInfo();
	changeCheckState();
	changeInfo();
	changehandOverWay();
})
//根据复选框选中状态改变检验阶别和检验类型
function changeInfo(){
	
	if($("#paraMapObj_WDT_SAMPLE_FLAG_1").attr("checked") == "checked"){
        	$("#paraMapObj_WDT_TEST_STEP").removeAttr("disabled");
        	$("#paraMapObj_WDT_TEST_STEP").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData dept_select");
        	$("#paraMapObj_WDT_SAMPLE_TYPE").removeAttr("disabled");
        	$("#paraMapObj_WDT_TEST_STEP").trigger("chosen:updated");
        	$("#paraMapObj_WDT_SAMPLE_TYPE").trigger("chosen:updated");
        	
    	}else{
    		
    		$("#paraMapObj_WDT_SAMPLE_FLAG_1").removeAttr("checked");
    		$("#paraMapObj_WDT_TEST_STEP").val("");
    		
    		$("#paraMapObj_WDT_SAMPLE_TYPE").val("");
    		$("#paraMapObj_WDT_TEST_STEP").attr("class"," input isSubmit  _VAL_OjbsData readonly dept_select");
        	$("#paraMapObj_WDT_TEST_STEP").attr("disabled","disabled");
        	$("#paraMapObj_WDT_SAMPLE_TYPE").attr("disabled","disabled");
        	$("#paraMapObj_WDT_TEST_STEP").trigger("chosen:updated");
        	$("#paraMapObj_WDT_SAMPLE_TYPE").trigger("chosen:updated");
    	}
    	
}
//根据出/入库类型改变超收标志，超发标志
function changeCheckState(){
	if($("#paraMapObj_WDT_OPERATE_TYPE").val()==1){  //为入库时超收标志允许勾选，超发标志不允许勾选
		$("#paraMapObj_WDT_EXCESS_RECEIVE_1").removeAttr("disabled");
		$("#paraMapObj_WDT_EXCESS_PICK_1").attr("disabled","disabled");
	}
	if($("#paraMapObj_WDT_OPERATE_TYPE").val()==2){  //为出库类型时，超收标志不允许勾选，超发标志允许勾选
		$("#paraMapObj_WDT_EXCESS_PICK_1").removeAttr("disabled");
		$("#paraMapObj_WDT_EXCESS_RECEIVE_1").attr("disabled","disabled");
	}
	if($("#paraMapObj_WDT_OPERATE_TYPE").val()==""){  //为空
		$("#paraMapObj_WDT_EXCESS_PICK_1").attr("disabled","disabled");
		$("#paraMapObj_WDT_EXCESS_RECEIVE_1").attr("disabled","disabled");
	}
}
function changehandOverWay(){
    if($("#paraMapObj_WDT_HANDOVER_FLAG_1").attr("checked") == "checked"){
    	$("#paraMapObj_WDT_HANDOVER_WAYS").removeAttr("disabled");
    	$("#paraMapObj_WDT_HANDOVER_WAYS").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData dept_select");
    	$("#paraMapObj_WDT_HANDOVER_WAYS").trigger("chosen:updated");
	}else{
		$("#paraMapObj_WDT_HANDOVER_WAYS").val("");
    	$("#paraMapObj_WDT_HANDOVER_WAYS").attr("disabled","disabled");
    	$("#paraMapObj_WDT_HANDOVER_WAYS").attr("class"," input isSubmit  _VAL_OjbsData readonly dept_select");
    	$("#paraMapObj_WDT_HANDOVER_WAYS").trigger("chosen:updated");
	}
}

//根据下拉框选中状态改变交接方式
function changeHandType(tempCount){
    if($("#isHandSel_"+tempCount).val()=="Y"){
        var handWay = $("#handWay").html();
	    var handWayOption = handWay.substring(handWay.indexOf('<option'));
	    $("#handWaySel_"+tempCount).empty();
        $("#handWaySel_"+tempCount).append("<option value=''>--请选择--</option>");
	    $("#handWaySel_"+tempCount).append(handWayOption);
        $("#handWaySel_"+tempCount).trigger("chosen:updated");
    }else{
    		/*$("#handWaySel_"+tempCount).val("");

        	$("#handWaySel_"+tempCount).attr("disabled","disabled");
        	$("#handWaySel_"+tempCount).attr("class"," input isSubmit  _VAL_OjbsData readonly dept_select");*/
        	$("#handWaySel_"+tempCount).empty();
            $("#handWaySel_"+tempCount).append("<option value=''>--请选择--</option>");
        	$("#handWaySel_"+tempCount).trigger("chosen:updated");
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
             var isCheck="";
            var testStep="";
            var isHand="";
            var handWay="";
            var flag=0;
            var test="";
            var handY="";
            for (var i=0;i<ttCount;i++)
            {
                 isCheck="#isCheckSel_"+(i+1);
                 testStep="#testStepSel_"+(i+1);
                 test="#testStep_"+(i+1);
                if(($(isCheck).val()=="Y") && ($(testStep).val()=="")){ 
                    _alertValMsg($(test),"<dict:lang value="该项不能为空" />");
                    return ;
                }
                 isHand="#isHandSel_"+(i+1);
                 handWay="#handWaySel_"+(i+1);
                 handY="#handSel_"+(i+1);
                if(($(isHand).val()=="Y") && ($(handWay).val()=="")){
                    _alertValMsg($(handY),"<dict:lang value="该项不能为空" />");
                    return ;
                }
            }
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=de5a5e6733844cdd96c5de6e04587a37";
  document.forms.editForm.submit();
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
</script>

	<!-- js初始化方法 -->
	 
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scorl1','.head1');
    setPopScroll('.scorl2','.head2');
    setPopScroll('.scroll')
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

