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
	
})

</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  
	<!-- head里面 -->
<script type="text/javascript">
function popItemDiv(showId,backId){
            $("#itemCode").val("");	
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			
			addItemInfo();
			
}
function hideDiv(showId,backId){
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
			    url: "buss/bussModel_exeFunc.ms?funcMId=10fa4e9c1bf54521bb2908f556188e03",
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
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+rccList[i].ID+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403');
							defTableWidthRewrite('d54714a3d9544526bafb6519e416c403');
						
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
			    url: "buss/bussModel_exeFunc.ms?funcMId=dacc93bddbed4920963eccd4afcf0d25",
			    data: {
			        "paraMap.type" : 1,
			        "paraMap.itemCode" : itemCode,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
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
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+rccList[i].ID+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403');
							defTableWidthRewrite('d54714a3d9544526bafb6519e416c403');
						
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
			        if (!$("#trr"+$(this).attr("id")).length) {
					var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class='_VAL_NULL input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>"+ wmsOption +"</select>";
					var outSel = "<select id='outSel_"+(trrCount+1)+"' name='outSelect' class='_VAL_NULL input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>"+ wmsOption +"</select>";
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='PLAN_NUM' value=''/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK_"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;padding:0;'>"+wmsSel+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>"+outSel+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:140px;text-align: center;padding:0;'><input style='width: 100%;padding:0;' name='ALLOT_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					
					
					mySetChosen();//设置下拉框样式
					$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
					$("#outSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
					//$(".chosen-container").css("width","100%;");
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
$(function(){
	getWmsSel();
})
var wmsOption;
//获取仓库信息
function getWmsSel(){
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625",
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
		<bu:set name="paraMapObj" value="${dataId}" formId="d54714a3d9544526bafb6519e416c4a4" type="add" />
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
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
	
	<input type="hidden" name="formIds" value="d54714a3d9544526bafb6519e416c4a4" />
	<input type="hidden" name="formId" id="formId3" value='d54714a3d9544526bafb6519e416c403'/>
	<input type="hidden" name="d54714a3d9544526bafb6519e416c4a4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8d77a3c4570c4e4db99ab2d882ba5669'" />
		<s:set name="_$formId_1" value="'d54714a3d9544526bafb6519e416c4a4'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="WAD_DOC_NUM" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_DOC_NUM" formId="d54714a3d9544526bafb6519e416c4a4" ><bu:ui colNo="WAD_DOC_NUM" style="width:200px;" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_DOC_NUM}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WAD_DOC_TYPE" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_DOC_TYPE" formId="d54714a3d9544526bafb6519e416c4a4" ><bu:ui colNo="WAD_DOC_TYPE" style="width:200px;" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_DOC_TYPE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WAD_DISPATCH_SN" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WAD_DISPATCH_SN" formId="d54714a3d9544526bafb6519e416c4a4" ><bu:ui colNo="WAD_DISPATCH_SN" style="width:200px;" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_DISPATCH_SN" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WAD_ALLOT_DATE" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_ALLOT_DATE" formId="d54714a3d9544526bafb6519e416c4a4" ><bu:ui colNo="WAD_ALLOT_DATE" style="width:200px;" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_ALLOT_DATE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WAD_CREATE_MAN" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_CREATE_MAN" formId="d54714a3d9544526bafb6519e416c4a4" ><bu:ui colNo="WAD_CREATE_MAN" style="width:200px;" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_CREATE_MAN}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WAD_URGENT_FLAG" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_URGENT_FLAG" formId="d54714a3d9544526bafb6519e416c4a4" >
			<bu:ui colNo="WAD_URGENT_FLAG" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_URGENT_FLAG}" formIndex="1" />
			<bu:uitn colNo="WAD_OUTSTOCK_FLAG" formId="d54714a3d9544526bafb6519e416c4a4" />
			<bu:ui colNo="WAD_OUTSTOCK_FLAG" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_OUTSTOCK_FLAG}" formIndex="1" />
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WAD_MEMO" formId="d54714a3d9544526bafb6519e416c4a4" /></td>
			<bu:td cssClass="dec" colNo="WAD_MEMO" formId="d54714a3d9544526bafb6519e416c4a4" style="height:80px;" colspan="5"><bu:ui colNo="WAD_MEMO" style="width:100%;height:100%" formId="d54714a3d9544526bafb6519e416c4a4" value="%{WAD_MEMO}" formIndex="1" /></bu:td>
			
		</tr>
	</table>
	</div>
	<DIV id="content2" style="display:none" data-tab="tag2">
        
        
		
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz   " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="标准包装数量" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="调入仓库" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="调出仓库" /></td>
										<td class="datagrid-cell" style="width:140px;"><dict:lang value="调拨日期" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:400px;">
							<table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234">
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
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:66px;left:90px;top:20px;width:870px;height:520px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
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
    						<div class="datagrid-header" style="width:100%;">
    							<div class="datagrid-header-inner head2" style="width:100%;" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable  " id="datagrid-htabled54714a3d9544526bafb6519e416c403" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td style="width: 30px;text-align: center;"></td>
                							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></td>
                							<td style="width: 180px;text-align: center;"><dict:lang value="物料名称" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="供应商" /></td>
                							<td style="width: 150px;text-align: center;"><dict:lang value="物料类型" /></td>		
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll2"   style="height:340px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajaxd54714a3d9544526bafb6519e416c403" >
    								<tbody id="itemTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    				
			    	<!--<div style="width:870px;">  
			    	<table  width="870px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></th>
							<th style="width: 180px;text-align: center;"><dict:lang value="物料名称" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="物料规格" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="供应商" /></th>
							<th style="text-align: center;"><dict:lang value="物料类型" /></th>	
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:870px;height:calc(100% - 136px);overflow-y: auto;overflow-x: hidden;" class="scroll">  
    			    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="itemTable">
    			    	    <tbody id="itemTbody">
    		                </tbody>
    				    </table>
				    </div>	-->			


				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="d54714a3d9544526bafb6519e416c4a4" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="8d77a3c4570c4e4db99ab2d882ba5669" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
<script type="text/javascript">
$(function(){
        $("#paraMap1_WAD_DOC_TYPE").val('DJ16');
        //var a =<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}' />'';
       // var a ='${dataMap.name}';
      console.log('${dataMap}');
       console.log("name::"+$("#curUser").val());
        $("#paraMap1_WAD_CREATE_MAN").val($("#curUser").val());
})
function checkVal1(){  //计划数量
	var tempVal;
	var tempId;
	var tempFlag1;
	var tempNullFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#PLAN_NUM_"+i).val();
		if(tempVal==null) continue;
		if(tempVal==""){
			tempId = document.getElementById("PLAN_NUM_"+i);
			tempNullFlag1= checkIsNull(tempId);
		}
		if(tempVal!=""){ 
			tempId = document.getElementById("PLAN_NUM_"+i);
			tempFlag1 = checkNum1(tempVal,tempId);
		}
		if(tempFlag1=="0"||tempNullFlag1=="0")
		return "0";
	}
	
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
function checkIsNull(tempId){
	_alertValMsg(tempId,"<dict:lang value="该项不能为空" />");
	return "0";  
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


function addCal(){      
                        var tempFlag1 = checkVal1();
                    if(tempFlag1=="0"){
                         return ;
                    }
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
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                          // utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条单据明细信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条单据明细信息" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                         console.log($("#paraMap1_WAD_OUTSTOCK_FLAG_1").val());

                       document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=ff8ae14e1f354e90b07b8f30a612c061";
                       document.forms.addForm.submit();
                        
}


</script>
	 <script>(function($){
  $(window).on('load',function(){
  //  setPopScroll('.datagrid-body','.datagrid-header-inner');
     setPopScroll('.scroll1','.head1');
     setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->

