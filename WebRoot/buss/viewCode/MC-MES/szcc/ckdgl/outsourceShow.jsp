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
	<title>
		<dict:lang value="查看" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
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
		/*
		if(tag=="tag1"){
			listAjaxTable("2f1adeb396c4403b8fea545ec6317938");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
		*/
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
	<!-- 产品静态资源 -->
<style type="text/css">

	.chosen-container {/*不响应事件*/
    pointer-events: none;
		}
</style>
	<!-- head里面 -->
	<script type="text/javascript">
		
		var listEmptyFlag="";
		var listEmptyFlag2="";
		var typeFlag="";

//制作弹出选择页面，分页查询
    function popItemDiv(showId,backId){
    	
    	   pjid=$("#paraMap1_WOD_PRODUCE_ID");
    	   console.log(pjid);
    	   pjid = pjid.val();
    	   console.log(pjid);
            if(""==pjid||'null'==pjid||undefined==pjid) {
    	 		_alertValMsg($("#paraMap1_WOD_PRODUCE_ID_SHOW"), "<dict:lang value='请先选择工单' />");
    	 		
    	 	}else{    	 		
            $("#itemCode").val("");	
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({ handle: '#mmz_dialog-hd'});
			//addItemInfo();
			searchItemInfo('formId1');
    	 	}
}
    
    
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}

var orgList = [];
var rccList =[];
//div物料信息分页
var paginationImpl = {};
var projectId = "";
var fqcCount =0;
function searchItemInfo(paginationImpl){
	var existCode ="";
	var codes = "";
	$("#addItemInfo tr").each(function(i,obj){
		existCode = existCode + $(obj).attr("data")+",";
		codes = codes + $(obj).attr("code")+",";
	});
/*  if(projectId ==""){
  	utilsFp.alert("请先选择工单号");
  	return;
  };*/
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $.trim($("#itemCode").val());
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=6e4ac494cab141c2a135cff4b7578d5f",//4eaae601d1b04db9ab2a02bf30534196
			    data: 
			     {
                "paraMap.itemCode" : itemCode,
                "page.currentPage" : currentPage,
                "page.pageRecord" : pageRecord,
                "paraMap.projectId" : projectId,
                "paraMap.existCode" : existCode,
                "paraMap.codes" : codes
                },

			    //"paraMap.itemCode="+itemCode+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord
			    //+"&paraMap.projectId="+projectId+"&paraMap.existCode="+existCode+"&paraMap.codes="+codes,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						
						if(null!=data.ajaxPage&&null!= data.ajaxPage.dataList){
							 
							 rccList = data.ajaxPage.dataList;//
							for(var i=0;i<rccList.length;i++){

								$("#itemTable tbody:last").append("<tr id='tr_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");//t.CEC_CODE   ,t.CEC_NAME,t.CEC_DESC
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' data='"+((currentPage-1)*pageRecord+(i+1))+"' name='isSelect1'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+nullToEmpty(rccList[i].CBD_ITEM_CODE)+"'>"+nullToEmpty(rccList[i].CBD_ITEM_CODE)+"<input type='hidden' id='CBD_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_CODE+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+nullToEmpty(rccList[i].CBD_ITEM_NAME)+"'>"+nullToEmpty(rccList[i].CBD_ITEM_NAME)+"<input type='hidden' id='CEC_NAME"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_NAME+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+nullToEmpty(rccList[i].CBD_ITEM_SPEC)+"'>"+nullToEmpty(rccList[i].CBD_ITEM_SPEC)+"<input type='hidden' id='CEC_DESC"+rccList[i].ID+"' value='"+rccList[i].CBD_ITEM_SPEC+"'/></td>");
							}
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#itemTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('itemTable');
					},
				error: function(msg){
						console.log(msg);
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function mmz_getItemList(pId){//获取初始物料信息
	orgList.splice(0,orgList.length);
	util.showLoading("处理中...");
	var existCode = "";
	projectId = pId;
	var itemCode='';
	 $.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: "${path}buss/bussModel_exeFunc.ms?funcMId=6e4ac494cab141c2a135cff4b7578d5f&projectId="+projectId,
	    data:  
	     {
        "paraMap.itemCode" : itemCode,
        "paraMap.existCode" : existCode,
        "paraMap.projectId" : projectId
        },
	   // "paraMap.itemCode="+itemCode+"&paraMap.existCode="+existCode+"&paraMap.projectId=" + projectId,
		success: function(data){
				console.log(123);
				console.log(data);
				util.closeLoading();
				$("#addItemInfo").empty();
				if(data.ajaxMap.ET_FQC_COUNTS){
					fqcCount = data.ajaxMap.ET_FQC_COUNTS; 
					
				}
				if(data.ajaxPage.dataList!= null && data.ajaxPage.dataList!= ""){
				   //utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");
				   orgList = data.ajaxPage.dataList;
				   mmz_showItem();						
				}
			},
		error: function(msg){
		        	console.log(msg);
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});
}
//保存选择的物料
function addItemList(showId,backId){//g1
	orgList.splice(0,orgList.length);//清空数组
	var len = $("#addItemInfo tr").length;
	var i = 0;    
	$("#itemTbody :checkbox").each(function(){	
			if($(this).attr("checked")){
				orgList[i++] =	rccList[$(this).attr("data")-1]; //存储回填物料信息行
			}
	
	})	
	 mmz_showItem();
		//重置弹出层
       	$("#itemTbody").empty();
     	hideDiv(showId,backId);
	    $("#item_list_cb").attr("checked",false);
}

function  mmz_getNum($obj){
	if(!$obj){
		return 0;
	}
	if('null'==$obj.val()||''==$obj.val()){
		return 0 ;
	}
	return parseInt($obj.val());
}
 var trrCount = 0;
 
    function mmz_showItem(){    	
        var len = $("#addItemInfo tr").length;//当前的物料行数
        for(var i = 0 ; i < orgList.length ;i++){
        	//console.log(orgList[0].CBD_ITEM_CODE);
        	if(orgList[i].WSI_ITEM_NUM==null) orgList[i].WSI_ITEM_NUM="";
        var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData' style='width:120px;' disabled='disabled' >" + wmsOption + "</select>";
					/*	$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' data='"+orgList[i].ID+"'  code='"+orgList[i].CBD_ITEM_CODE+"' ></tr>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + " </td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' value='"+orgList[i].ID+"' name='isSelect1'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+orgList[i].CBD_ITEM_CODE+"'>" + orgList[i].CBD_ITEM_CODE + "<input type='hidden' name='CBD_ITEM_CODE' id='CBD_ITEM_CODE"+(trrCount + 1)+"' value='" + orgList[i].CBD_ITEM_CODE + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+nullToEmpty(orgList[i].CBD_ITEM_NAME)+"'>" + nullToEmpty(orgList[i].CBD_ITEM_NAME) + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+nullToEmpty(orgList[i].CBD_ITEM_SPEC)+"'>" + nullToEmpty(orgList[i].CBD_ITEM_SPEC) + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;text-align: center;' title='"+"委外出库"+"'>" + "委外出库" + "</td>");
						//$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+addItemObj.attr("id")).val()+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+orgList[i].CBD_ITEM_NUM+"'>" + orgList[i].CBD_ITEM_NUM + "<input type='hidden' name='CBD_ITEM_NUM' id='CBD_ITEM_NUM"+(trrCount + 1)+"' value='"+orgList[i].CBD_ITEM_NUM + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='' >" + parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT'))  + "<input type='hidden' name='etnum' id='etnum"+(trrCount + 1)+"' value='"+parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT')) + "'/></td>");
						
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' '  onfocus='getOldVal(this);' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT')) +"'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+orgList[i].WSI_ITEM_NUM+"'>" + orgList[i].WSI_ITEM_NUM + "<input type='hidden' name='WSI_ITEM_NUM' id='WSI_ITEM_NUM"+(trrCount + 1)+"' value='"+orgList[i].WSI_ITEM_NUM + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' >"+orgList[i].WOS_ITEM_RN+"<input type='hidden' name='WOS_ITEM_N' id='WOS_ITEM_N"+(trrCount + 1)+"' value='" + orgList[i].WOS_ITEM_N + "' />"
						+"<input type='hidden' name='WOS_ITEM_RN' id='WOS_ITEM_RN"+(trrCount + 1)+"' value='" + orgList[i].WOS_ITEM_RN + "' />"
						+"<input type='hidden' name='OUTPUT_RATE' id='OUTPUT_RATE"+(trrCount + 1)+"' value='" + nullToOne(orgList[i].OUTPUT_RATE) + "' />"
						+"<input type='hidden' name='DOC_ITEM_ID' id='DOC_ITEM_ID"+(trrCount + 1)+"' value='" + orgList[i].ID + "'/>"
						//WOS_REQUEST_NUM  WOS_ITEM_RN WSI_ITEM_NUM WSI_ITEM_NUM REQUEST_NUM PLAN_NUM OUTPUT_RATE
						+"</td>");//value='" + "#MEI_ITEM_COUNT" + "'
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' onfocus='getOldVal(this);' name='WOS_REQUEST_NUM' id='WOS_REQUEST_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='"+nullToZero(et_rn[orgList[i].CBD_ITEM_CODE])+"'/></td>");//#f01 当次使用超发量 orgList[i].ET_ITEM_USERNUM
						/*$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='PLAN_NUM_" + (trrCount + 1) + "' name='PLAN_NUM' value=''/></td>");*/
					/*	$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_PROCESS_FACE' value='0'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + orgList[i].CUST_CODE + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' value='"+nullToEmpty(orgList[i].WOI_DELIVERY_DATE)+"' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
                   */
                   
                    var temps= "<tr id='trr" + (trrCount + 1) + "' data='"+orgList[i].ID+"'  code='"+orgList[i].CBD_ITEM_CODE+"' >"
                                +"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + " </td>"
                                +"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' value='"+orgList[i].ID+"' name='isSelect1'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+orgList[i].CBD_ITEM_CODE+"'>" + orgList[i].CBD_ITEM_CODE + "<input type='hidden' name='CBD_ITEM_CODE' id='CBD_ITEM_CODE"+(trrCount + 1)+"' value='" + orgList[i].CBD_ITEM_CODE + "'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+nullToEmpty(orgList[i].CBD_ITEM_NAME)+"'>" + nullToEmpty(orgList[i].CBD_ITEM_NAME) + "</td>"
                                +"<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+nullToEmpty(orgList[i].CBD_ITEM_SPEC)+"'>" + nullToEmpty(orgList[i].CBD_ITEM_SPEC) + "</td>"
                                +"<td class='datagrid-cell datagrid-cell-14' style='width:120px;text-align: center;' title='"+"委外出库"+"'>" + "委外出库" + "</td>"
                                +"<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+nullToOne(orgList[i].CBD_ITEM_NUM)+"'>" + nullToOne(orgList[i].CBD_ITEM_NUM) + "<input type='hidden' name='CBD_ITEM_NUM' id='CBD_ITEM_NUM"+(trrCount + 1)+"' value='"+nullToOne(orgList[i].CBD_ITEM_NUM) + "'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='' >" + parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT'))  + "<input type='hidden' name='etnum' id='etnum"+(trrCount + 1)+"' value='"+parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT')) + "'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' '  onfocus='getOldVal(this);' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+parseInt(orgList[i].CBD_ITEM_NUM) * mmz_getNum($('#ET_FQC_COUNT')) +"'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+nullToZero(orgList[i].WSI_ITEM_NUM)+"'>" +nullToZero( orgList[i].WSI_ITEM_NUM) + "<input type='hidden' name='WSI_ITEM_NUM' id='WSI_ITEM_NUM"+(trrCount + 1)+"' value='"+nullToZero(orgList[i].WSI_ITEM_NUM) + "'/></td>"
                                +"<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' >"+nullToZero(et_rn[orgList[i].CBD_ITEM_CODE])+"<input type='hidden' name='WOS_ITEM_RN' id='WOS_ITEM_RN"+(trrCount + 1)+"' value='" + nullToZero(et_rn[orgList[i].CBD_ITEM_CODE]) + "' />"
        						+"<input type='hidden' name='WOS_ITEM_RN' id='WOS_ITEM_N"+(trrCount + 1)+"' value='" + orgList[i].WOS_ITEM_N + "' />"
        						+"<input type='hidden' name='OUTPUT_RATE' id='OUTPUT_RATE"+(trrCount + 1)+"' value='" + nullToOne(orgList[i].OUTPUT_RATE) + "' />"
        						+"<input type='hidden' name='DOC_ITEM_ID' id='DOC_ITEM_ID"+(trrCount + 1)+"' value='" + orgList[i].ID + "'/>"
        						//WOS_REQUEST_NUM  WOS_ITEM_RN WSI_ITEM_NUM WSI_ITEM_NUM REQUEST_NUM PLAN_NUM OUTPUT_RATE
        						+"</td>"
	                            +"<td class='datagrid-cell datagrid-cell-16' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' onfocus='getOldVal(this);' name='WOS_REQUEST_NUM' id='WOS_REQUEST_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='"+nullToZero(et_rn[orgList[i].CBD_ITEM_CODE])+"'/></td>"
								+"<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>"
	                            +"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_PROCESS_FACE' value='0'/></td>"
	                            +"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + orgList[i].CUST_CODE + "'/></td>"
	                            +"<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' value='"+nullToEmpty(orgList[i].WOI_DELIVERY_DATE)+"' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>"
                         $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002").append(temps);
                                		//lens+=temps;
                   		if(orgList[i].WOI_WH_CODE){
                   			$("#wmsSel_"+(trrCount+1)).val(orgList[i].WOI_WH_CODE);
							$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");                   			
                   		}
							$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
							trrCount++;
						$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
						//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;
					//console.log('haha',nullToZero(et_rn[orgList[i].CBD_ITEM_CODE]),nullToZero(et_rn['15252']));
        }

					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da002');
					
    }
    
		
		/**
		 * 初始基础信息
		 */
		var initMap={};//初始信息
		function m$(m){//传id转jq
			return $("#"+m);
		}
		//存储基础信息栏的标签和值
		var sour = {};
		//存委外库存余量相对值
		var et_rn = {};
		//初始化基础信息
		$(function() {
		sour.ckd=m$("paraMap1_WOD_DOC_NUM");//出库单
		sour.gys=m$("paraMap1_WOD_SUP_CODE");//供应商
		sour.gyss=m$("paraMap1_WOD_SUP_CODE_SHOW");//供应商显示
		sour.cksj=m$("paraMap1_WOD_OUTSTOCK_DATE");//出库时间
		sour.jjbz=m$("paraMap1_WOD_URGENT_FLAG_1");//紧急标志
		sour.ck=m$("paraMap1_WOI_WH_CODE");//仓库
		sour.gdh=m$("paraMap1_WOD_PRODUCE_ID");//工单
		sour.gdhs=m$("paraMap1_WOD_PRODUCE_ID_SHOW");//工单显示
		sour.wwsl=m$("ET_FQC_COUNT");//委外 数量
		sour.jz=m$("paraMap1_WOD_ITEM_CODE");//机种code
		sour.jzm=m$("paraMap1_WOD_ITEM_NAME");//物料名
		sour.jhs=m$("paraMap1_WOD_PLAN_NUM");//计划数
		
			//$("#paraMap1_WOD_PRO_FACE_chosen").css("width","200px");
			$("#paraMap1_WOD_DOC_TYPE option[value='委外出库单']").attr("selected",true);//设置委外出库单被选中
			$("#paraMap1_WOD_DOC_TYPE").trigger("chosen:updated");
			$("#paraMap1_WOD_DOC_TYPE").attr("disabled","ture");
			$("#formId1_WOD_PRO_FACE_SHOW").attr("disabled","ture");
			$("#formId1_WOD_PRO_FACE").hide();
			$("#paraMap1_WOD_OUTSTOCK_DATE").removeAttr("readonly");//设置可编辑


        	var a ="${param.docItemId}";
			var b ="${param.docNum}";
			var v ="${param.projectId}";

			$.ajax({
				type: "POST",
				async: false,
				dataType: "json",
				url: "${path}buss/bussModel_exeFunc.ms?funcMId=10371a4de21f48d490decee2d23ce9a9",
				data:  {
                 "paraMap.itemCode" : "${param.docItemId}",
        		"paraMap.docNum" : "${param.docNum}",
        		"paraMap.projectId" : "${param.projectId}"	
                									
                
                 },
				//"paraMap.docItemId=${param.docItemId}&paraMap.docNum=${param.docNum}&paraMap.projectId=${param.projectId}",
				success: function(data) {
					//console.log(data);
					getWmsSel();//初始化仓库信息
					$("#paraMap1_WOD_PICK_TYPE option[value='']").remove();
					$("#paraMap1_WOD_PICK_TYPE").trigger("chosen:updated");
					util.closeLoading();
					$("#addItemInfo").empty();
					if(data.ajaxMap.ET_FQC_COUNTS) {
						fqcCount = data.ajaxMap.ET_FQC_COUNTS;
					}
					if(data.ajaxMap.initMap){
					 initMap=data.ajaxMap.initMap;
					 //console.log(initMap);
					 sour.ckd.val(initMap.WOD_DOC_NUM);
					 $("#MMZ_DOCNUM").val(initMap.WOD_DOC_NUM);
					 sour.gys.val(initMap.WOD_SUP_CODE);
					 sour.gyss.val(initMap.SUPPLIER_NAME);
					 sour.gyss.attr("disabled","true");
					 sour.gyss.css("background-color","#F5F5F5");
					 sour.cksj.val(initMap.WOD_OUTSTOCK_DATE);
					 if(initMap.WOD_URGENT_FLAG=='Y'){
					 	sour.jjbz[0].checked=true;//val();					 	
					 }
					 sour.gdh.val(initMap.ET_CONECT_PROJECT_ID);
					 projectId=initMap.ET_CONECT_PROJECT_ID;
					 sour.gdhs.val(initMap.ET_CONECT_PROJECT_ID);
					 sour.gdhs.attr("disabled","true");
					 sour.gdhs.css("background-color","#F5F5F5");
					 sour.wwsl.val(initMap.ET_FQC_COUNT);
					 sour.jhs.val(initMap.PRODUCT_COUNT);
					 sour.jhs.css("background-color","#F5F5F5");
					 sour.jz.val(initMap.PRODUCT_MATERIAL);
					 sour.jz.css("background-color","#F5F5F5");
					 sour.jzm.val(initMap.CI_ITEM_NAME);
					 sour.jzm.css("background-color","#F5F5F5");

					}
					if(data.ajaxList != null && data.ajaxList != "") {
						//utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");
						orgList = data.ajaxList;
						console.log(orgList);
						orgList.forEach(function(obj,i){
						    
 							 et_rn[obj.CBD_ITEM_CODE] = nullToZero(obj.WOS_ITEM_RN) + nullToZero(obj.ET_ITEM_USERNUM);
						    
						});
						/*if(!undefined||!null){ //测试未定义
							//console.log(orgList[0].asda,orgList[0].asda==undefined,orgList[0].asda==null,orgList[0].asda=='null',orgList[0].asda=='undefined',typeof orgList[0].asda=='undefined');							
						}*/
						console.log(et_rn);
						
						mmz_showItem();
					}
				},
				error: function(msg) {
					console.log(msg);
					util.closeLoading();
					utilsFp.alert("error:" + msg);
				}
			});

		})
		var wmsOption;
		//获取仓库信息
		function getWmsSel() {
		var dataAuth = "${param.dataAuth}";
		var getWmsSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00";
			$.ajax({
				type: "POST",
				dataType: "json",
				async:false,
				url: getWmsSelUrl,
				data: {
				    "type": "showDetail",
				    "dataAuth": dataAuth
				},
				success: function(data) {
					//console.log(data.ajaxMap.samplList);
					wmsOption = "<option value=''>--请选择--</option>";
					if(null == data) { return; }
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							wmsOption = wmsOption + "<option value='" + rccList[i].WA_AREA_SN + "'>" + rccList[i].WA_AREA_NAME + "</option>";
						}
					}
					

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
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


function delRow() {
			//先判断是否有物料明细信息
        var falg = 0;
	var delId ="";
	$('input[name="isSelect1"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect1"]:checked').each(function(i){
    	delId = delId +$(this).val()+ ",";
    			 
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	util.showLoading("处理中...");
	var checkDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=0b01f0337aa94f4984430965185add53";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: checkDetailUrl+"&checkId="+delId,
			    data: 
			     {
                "checkId" : delId,
                },

				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="有明细的物料不允许删除" />",0,"300","");
								return;
							}
							if(data.returnMsg=="addError"){
								$("#delIds").val($("#delIds").val()+delId);//累加
								console.log($("#delIds").val());
								//删除行
								$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 :checkbox").each(function(){
									if($(this).attr("checked")){
										var trid = $(this).parent().parent().attr("id");
										$("#"+trid).remove();
									}
								});
								reSort("datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002");
								var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody tr");
								_tongLineColor(tableTrJs);
								clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');	
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		
		
		
		
		//重新排序
		function reSort(objid) {

			var i = 1;
			$("#" + objid + " tbody tr").each(function() {

				$(this).find("td").eq(0).text(i);

				i++;
			});
		}
		//全选
		function getAllItem() {
			if($("#item_list_cb").attr("checked") == "checked") {
				$("#itemTbody :checkbox").attr("checked", true);
			} else {
				$("#itemTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		//全选1
		function getAllPo() {
			if($("#po_list_cb").attr("checked") == "checked") {
				$("#poInfoTbody :checkbox").attr("checked", true);
			} else {
				$("#poInfoTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		//全选2
		function getAllItems() {
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
	
		//改变委外套数
		function OnInput(event,thisObj) {
		    var flag=false; 
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!(/^(\+|-)?\d+$/.test( newContent))){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入零或正整数" />");
				flag=true;
            }
            if(objId=="#formId1_itemNum1"){
				var trLength=$("#itemTbody tr").length+1;
				for(var i=0;i<trLength;i++){
					var index=i+1;
					var tempNumId="#T1_CMD_POINT_NUM"+index;
					var tempPlanNum=parseInt(newContent)*parseInt($(tempNumId).val());
					if(newContent==""||flag==true){
		            	tempPlanNum="";
		            }
					$("#itemTbody tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
				}
			}else{
				var trLength=$("#poInfoTbody tr").length+1;
				for(var i=0;i<trLength;i++){
					var index=i+1;
					var tempNumId="#T1_CMD_POINT_NUM"+index;
					var tempPlanNum=parseInt(newContent)*parseInt($(tempNumId).val());
					if(newContent==""||flag==true){
		            	tempPlanNum="";
		            }
					$("#poInfoTbody tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
				}
			}
        }
		function OnInput2(event,thisObj) {
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!(/^(\+|-)?\d+$/.test( newContent))){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入数字" />");
				flag=true;
            }
        }
		function OnPropChanged (event) {
            if (event.propertyName.toLowerCase () == "value") {
                //alert ("The new content2: " + event.srcElement.value);
            }
        }
		function changePlanNum(event,thisObj){
			if(event.keyCode==13){
				var objId="#"+thisObj;
				var objVal=$(objId).val();
				if(objVal==""){
					objVal="0";
				}
				if(objId=="#formId1_itemNum1"){
					var trLength=$("#itemTbody tr").length+1;
					for(var i=0;i<trLength;i++){
						var index=i+1;
						var tempNumId="#T1_CMD_POINT_NUM"+index;
						var tempPlanNum=parseInt(objVal)*parseInt($(tempNumId).val());
						$("#itemTbody tr:eq(" + i + ")").find("td:eq(5)").text(tempPlanNum);
					}
				}else{
					var trLength=$("#poInfoTbody tr").length+1;
					for(var i=0;i<trLength;i++){
						var index=i+1;
						var tempNumId="#T2_CMD_POINT_NUM"+index;
						var tempPlanNum=parseInt(objVal)*parseInt($(tempNumId).val());
						$("#poInfoTbody tr:eq(" + i + ")").find("td:eq(6)").text(tempPlanNum);
					}
				}
			}
		}
		
		function pickType(){
		    $("#addItemInfo").empty();
		    var pickType = $("#paraMap1_WOD_PICK_TYPE").val();
		    if("1" == pickType){
		        $("#item").hide();
		        $("#info").show();
		    }else if("2" == pickType){
		        $("#info").hide();
		        $("#item").show();
		    }
		}
		
	</script>
</head>

<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
	
	<div class="bd" style="height:570px;"><!--内容层-->

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_10" />
			<jsp:param name="location" value="addForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b1001c913da94c22b6e93cf7148da0d6" type="add" />
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
							</UL>
					<!--	</DIV>  -->
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<table class="basic-table">
				<input type="hidden" name="formIds" value="b1001c913da94c22b6e93cf7148da0d6" />
				<input type="hidden" name="formId" id="formId2" value='b1001c913da94c22b6e93cf7148da002'/>
				<input type="hidden" name="b1001c913da94c22b6e93cf7148da0d6" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="MMZ_DOCNUM" id="MMZ_DOCNUM" value="" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<input type="hidden" name="moNum" id="moNum" value="" />
				<input type="hidden" name="outNum" id="outNum" value="" />
				<input type="hidden" name="delIds" id="delIds" value="" />
				<s:set name="_$viewId" value="'628d1922b4774c78a3f32c6d58a70653'" />
				<s:set name="_$formId_1" value="'b1001c913da94c22b6e93cf7148da0d6'" />
				<s:set name="_$type" value="'add'" />
				<tr>
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_DOC_NUM" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_DOC_NUM" formId="b1001c913da94c22b6e93cf7148da0d6"><!--出库单号-->
						<bu:ui colNo="WOD_DOC_NUM" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_DOC_NUM}" formIndex="1" /></bu:td>

					<td class="name" /><span class="dot">*</span><!--单据类型-->
					<bu:uitn colNo="WOD_DOC_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_DOC_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_DOC_TYPE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_DOC_TYPE}" formIndex="1" /></bu:td>
				
				<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_SUP_CODE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_SUP_CODE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_SUP_CODE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_SUP_CODE}" formIndex="1" /></bu:td>
	
				<%--
					<td class="name" />
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					    <bu:td cssClass="dec" style="width:200px;" colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{T2#WOD_DISPATCH_SN}" formIndex="1" /></bu:td>
				--%>
		
				</tr>
				<tr>
					<td class="name" /><span class="dot">*</span><!--出库时间--><%--
					<bu:uitn colNo="WOD_OUTSTOCK_DATE" formId="b1001c913da94c22b6e93cf7148da0d6" />
						--%>
						<dict:lang value="委外申请时间" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_OUTSTOCK_DATE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_OUTSTOCK_DATE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_OUTSTOCK_DATE}" formIndex="1" onchange="changeTime();"/></bu:td>

					<td class="name" /><!--紧急标志-->
					<bu:uitn colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					    <bu:td cssClass="dec" colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_URGENT_FLAG}" formIndex="1" /></bu:td>
						
                    
                <!--	<td class="name" />
					<bu:uitn colNo="WOI_WH_CODE" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					    <bu:td cssClass="dec" colNo="WOI_WH_CODE" formId="bb156a44e6e242a885b3fde9386fd567" >
						<bu:ui colNo="WOI_WH_CODE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_WH_CODE}" formIndex="1" /></bu:td>-->
              

				
				      							
                    <td class="name" /><%-- 工单新增 --%>
            			<bu:uitn colNo="WOD_PRODUCE_ID" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
				     <bu:td cssClass="dec" colNo="WOD_PRODUCE_ID" formId="b1001c913da94c22b6e93cf7148da0d6" >
						<bu:ui colNo="WOD_PRODUCE_ID" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_PRODUCE_ID}" formIndex="1" />
				     </bu:td>
				     
				     </tr>

                <tr>
						
                    <td class="name" /><%-- 机种新增 --%>
            			<bu:uitn colNo="WOD_ITEM_CODE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
				     <bu:td cssClass="dec" colNo="WOD_ITEM_CODE" formId="b1001c913da94c22b6e93cf7148da0d6" >
						<bu:ui colNo="WOD_ITEM_CODE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_ITEM_CODE}" formIndex="1" />
				     </bu:td>
                    <td class="name" /><%-- 名称新增 --%>
            			<bu:uitn colNo="WOD_ITEM_NAME" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
				     <bu:td cssClass="dec" colNo="WOD_ITEM_NAME" formId="b1001c913da94c22b6e93cf7148da0d6" >
						<bu:ui colNo="WOD_ITEM_NAME" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_ITEM_NAME}" formIndex="1" />
				     </bu:td>

				     
				
              		 <td class="name" /><%-- 名称新增  委外套数--%>
            			<bu:uitn colNo="WOD_PLAN_NUM" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
              	  <bu:td cssClass="dec" colNo="WOD_PLAN_NUM" formId="b1001c913da94c22b6e93cf7148da0d6" >
						<bu:ui colNo="WOD_PLAN_NUM" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_PLAN_NUM}" formIndex="1" />
				   </bu:td>
				   </tr>				
              	<tr>
				<%--
			--%>
			    <td class="name" ><span class="dot">*</span><dict:lang value="委外套数" /><!---->
			    </td>
				<td class="dec" ><input type="text" class=" input isSubmit " id="ET_FQC_COUNT" name="ET_FQC_COUNT" oninput="mmz_iniReqNum()" style="width:200px;" />
				</td>
			
				     <td></td>
				     <td></td>

              	
					
				</tr>
				<tr>
				    <td class="name" />
					<bu:uitn colNo="WOD_MEMO" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					    <bu:td cssClass="dec" colNo="WOD_MEMO" formId="b1001c913da94c22b6e93cf7148da0d6" style="height:80px;" colspan="5">
						<bu:ui colNo="WOD_MEMO" style="width:100%;height:100%" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_MEMO}" formIndex="1" /></bu:td>

				</tr>
			<tr style="display:none">
								
				<%--
                --%>
				 <!--备料类型  影藏-->
				   <td class="name" />
					<bu:uitn colNo="WOD_PICK_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>	
					    <bu:td cssClass="dec" style="width:200px;" colNo="WOD_PICK_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_PICK_TYPE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_PICK_TYPE}" formIndex="1" onchange="pickType();"/></bu:td>
                <td class="name" ><span class="dot">*</span><dict:lang value="收发类型" />
			      </td>
				<td class="dec" ><input type="text" class=" input isSubmit " id="MMZ_WOD_DISPATCH_SN" name="MMZ_WOD_DISPATCH_SN" value="ETCK" style="width:200px;" />
				</td>
	
			</tr> <!--备料类型  影藏-->
			
			</table> <!--一级表单结束-->
			
			</div>
		<DIV id="content2" style="display:none" data-tab="tag2">
			
			<div class="mod"><%-- 物料清单页面 --%>
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htableb1001c913da94c22b6e93cf7148da002" >
										<tbody>
											<tr class="datagrid-header-row datagrid-title-ajax">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料料号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料规格" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="制令单号" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="用量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="委外套数" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="需求数量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="库存数量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="超发数量" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="使用超发数量" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="仓库" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="出库日期" />
												</td>
	                                            <td style="display:none;width: 	150px;text-align: center;"></td>
												<td style="display:none;width: 	150px;text-align: center;"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:	240px;">
								<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002">
									<tbody id="addItemInfo">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div><%-- 物料清单页面 --%>
		</div><!--content-->
		</div>
					</div>

	<bu:jsVal formId="b1001c913da94c22b6e93cf7148da0d6" formIndex="1" />

	</div><!--内容层-->
	</form>
	</div>
	
	<bu:submit viewId="628d1922b4774c78a3f32c6d58a70653" />
	<bu:script viewId="628d1922b4774c78a3f32c6d58a70653" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	<!--弹出层-->
	
<!--选择物料页面-->
<!--隔离布-->
<div id="backItem" class="dialog-mask" style="z-index:1029px;width:100%;height:100%;" /></div>
<!-- 弹出选择物料 -->
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:570px;height:320px;">
			<div class="dialog-hd" id="mmz_dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:131%;">
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
			    	<div style="width:570px;height:35px;">  
			    	<table  width="570px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料名称" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></th>
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:570px;height:310px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="570px" style="table-layout:fixed" class="dlist-table table-line " id="itemTable">
			    		<tbody id="itemTbody">
		            	</tbody>
				
				</table>

					</div>
				<div style="background-color: white;margin-top:20px;width:570px;height:42px;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
	</div>
	
	<script type="text/javascript">
		

		//仓库选择改变时
		$("#paraMap1_WOI_WH_CODE").change(function(){
    	    var whCode=$(this).val();
    	    
    	    for(var i=1;i<=trrCount;i++){
    	        $("#wmsSel_"+i).find("option[value='"+whCode+"']").attr("selected",true);
				$("#wmsSel_"+i).trigger("chosen:updated");
			}
    	});
    	//时间改变时候
    	function changeTime(){
    		
    	    var delivertTime=$("#paraMap1_WOD_OUTSTOCK_DATE").val();
    	//    alert(delivertTime);
    	    for(var i=1;i<=trrCount;i++){
    	        $("#DELIVERY_TIME"+i).val(delivertTime);
			}
    	}
    	
    	//存输入框原值
    	var oldVal = 0;
    	function getOldVal(obj){
    		oldVal = obj.value;
    	}
    	
    	var requestNum=0;
    	function checkRequsetNum(event,index){ //WOS_REQUEST_NUM  WOS_ITEM_RN WSI_ITEM_NUM CBD_ITEM_NUM REQUEST_NUM PLAN_NUM OUTPUT_RATE
    	    var newContent=event.target.value;
    	 if(!/^(\+)?\d*$/.test(newContent)){// !/^(\+)?\d+\.?\d*$/ 正数   和法验证
				$("#REQUEST_NUM"+index).val(oldVal);         
				_alertValMsg($("#REQUEST_NUM"+index), "<dict:lang value='该项只能输入自然数' />");
				return;		
           }
    	 
    	console.log($("#OUTPUT_RATE"+index)[0].value); 
    	 if($("#OUTPUT_RATE"+index)[0].value=='null'){
    	 	$("#OUTPUT_RATE"+index)[0].value=1;
    	 }
    	// alert($("#OUTPUT_RATE"+index).val());
    	 var max2 = parseInt($("#PLAN_NUM"+index).val())*parseInt($("#CBD_ITEM_NUM"+index).val())*(2/parseInt($("#OUTPUT_RATE"+index).val()));
			
		  if((parseInt(newContent)-max2)>0){
		  	$("#REQUEST_NUM"+index).val(oldVal);         
			_alertValMsg($("#REQUEST_NUM"+index), "<dict:lang value='超出最大应配量两倍' />");
		  }
  
    	}
  
    	//委外库存使用数量输入验证  //WOS_REQUEST_NUM  WOS_ITEM_RN WSI_ITEM_NUM CBD_ITEM_NUM REQUEST_NUM PLAN_NUM OUTPUT_RATE
    	function checkExceedNum(event,index){//onfocus='getOldVal(this);'
    	   var newContent=event.target.value;
    	 if(!/^(\+)?\d*$/.test(newContent)){
				$("#WOS_REQUEST_NUM"+index).val(oldVal);         
				_alertValMsg($("#WOS_REQUEST_NUM"+index), "<dict:lang value="该项只能输入自然数" />");
				return;
				
            }
    	 	
    	
    	 	if((parseInt(newContent)-parseInt($("#WOS_ITEM_RN"+index).val()))>0){
    	 		$("#WOS_REQUEST_NUM"+index).val(oldVal);
    	 		_alertValMsg($("#WOS_REQUEST_NUM"+index), "<dict:lang value="使用委外库存量不应大于委外库存余量" />");
    	 	}
    	 	var reval = parseInt(nullToZero($("#REQUEST_NUM"+index).val()))-parseInt(nullToZero($("#WOS_REQUEST_NUM"+index).val()));
    	 	if(reval < 0){
    	 		reval = 0;    	 		
    	 	}
    	 	$("#REQUEST_NUM"+index).val(reval);
      	  
    	}
    	
    	//初始化物料数量
    	 function mmz_iniReqNum(){//fqcCount 
    	 	var et_num = $("#ET_FQC_COUNT");
    	 	if(""==et_num.val()) {
    	 		_alertValMsg($(et_num), "<dict:lang value="委外套数不能为空" />");
    	 		mmz_syn();
    	 		return;
    	 	}
    	 	var newContent = et_num.val();
    	 	 if(!/^(\+)?\d*$/.test(newContent)){
				$(et_num).val("");         
				_alertValMsg($(et_num), "<dict:lang value="该项只能输入自然数" />");
				return;
            }
    	 	 var no1 = parseInt($("#paraMap1_WOD_PLAN_NUM").val());
    	 	 var no2 = parseInt(newContent);
    	 	 var no3 = parseInt(fqcCount);
    	 	if((no2+no3)>no1){
    	 	 et_num.val("");         
				_alertValMsg(et_num, "当前已开单数目"+fqcCount+"，总开单数必须小于委外套数");
				return;	
    	 	 }
    	 	mmz_syn();//同步数量
    	 	//$("#addItemInfo tr")
    	//    alert(delivertTime);
    	  
    	 }
    	function  mmz_syn(){//同步数量
    		  for(var i=1;i<=trrCount;i++){//CBD_ITEM_NUM / OUTPUT_RATE
    		  	var newContent = mmz_getNum($("#ET_FQC_COUNT"));
    	    	if($("#REQUEST_NUM"+i)[0]){
    	    		var d = $("#OUTPUT_RATE"+i).val();
    	    		if (d=='null'){
    	    			$("#OUTPUT_RATE"+i).val(1);
    	    			d= 1;
    	    		} 
    	    		$("#REQUEST_NUM"+i).val(parseInt(newContent)*parseInt($("#CBD_ITEM_NUM"+i).val())/d);
    	    		$("#etnum"+i).val(parseInt(newContent)*parseInt($("#CBD_ITEM_NUM"+i).val())/d);
    	    		//console.log($("#etnum"+i).prev());
    	    		$("#etnum"+i).parent()[0].firstChild.nodeValue=(parseInt(newContent)*parseInt($("#CBD_ITEM_NUM"+i).val())/d);
    	    	}
			}
    	}
    	 
    	
		//点击行寄选中该行
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").prop("checked", false);
					$("#" + trId).css("background-color", "");
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).prop("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").prop("checked", true);
					$("#" + trId).css("background-color", "#a0c8e5");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}
		
		function checkVal2(){  //仓库
			var tempVal;
			var tempId;
			var tempFlag1;
			for(var i=1;i<=trrCount;i++){
				tempVal = $("#wmsSel_"+i).val();
				if(tempVal==null) continue;
				if(tempVal==""){ 
					tempId = document.getElementById("wmsSel_"+i);
					//_alertValMsg(tempId,"<dict:lang value="该项不能为空" />");
				    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择仓库" />",0,"260","");
				        return "0";  
				}
				
			}
			return "1";
		}
		
	


//主页面保存
function addInfo(){     
                    var tempFlag2 = checkVal2();
                    if(tempFlag2=="0"){
                         return ;
                    }
                        
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
			if(isEmpty($("#paraMap1_WOD_SUP_CODE"))){
					_alertValMsg($("#paraMap1_WOD_SUP_CODE_SHOW"), "<dict:lang value='供应商为空' />");
					return;
			}
                var len = $("#addItemInfo tr").length;
                      if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请添加单据明细信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加单据明细信息" />",0,"260","");
                           return;
                        }
            
             if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){//将是否关闭窗口加入 addfrom
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
            	
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=1123a2c40419428688f69450a2677ccf";
                        document.forms.addForm.submit();
                        
}


							
    window.setTimeout(mmzBind,500);
    function mmzBind(){//初始后调整
    $("#mCSB_1").parent().css("height","380px");
    $("input").attr("disabled","true");
    $("a").addClass("disabled");;
	}
   
  
     	//空处理		
	function nullToEmpty(str){
	 if(str){
	 	if(str==null||str=='null'){
	   	return '';
	 	}
	 	return str;
	 }else{
	 	return "";
	 }
	}
	
	function nullToOne(str){
		if(str){
			if(str==null||str=='null'){
	   			return 1;
	 			}
	 	  return str;
		}else{
			return 1;
		}
	}
   
   function nullToZero(str){
   	if(str){
	 if(str==null||str=='null'){
	    return 0;
	  }
	 return str;
	}else{
		return 0;
	}
	}
   
    
		
		function isEmpty(obj){
			if('null'==obj.val()||""==obj.val()){
				return true;
			}
			  return false;
		}
		function mmz_alertMsg($obj,msg){
			_alertValMsg($obj, msg);
		}
		
		
	</script>
	<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
 })
})(jQuery)</script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_10" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>