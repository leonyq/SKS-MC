<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	
	<style>
		.datagrid-body td input{
			background-color: transparent;
		}
	</style>
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
	$("#paraMapObj_WPI_PO_TYPE").val('DJ01');
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
	 $("#paraMapObj_WPI_PO_TYPE option").each(function(){

        if($(this).val()=="DJ01"){
            $(this).attr("selected","selected");

        }
    })
    $("#paraMapObj_WPI_PO_TYPE").trigger("chosen:updated");
		}
		if(tag=="tag2"){
				document.getElementById("tag3").style.display="";
		}
	}
$(function(){
//	$("#tag1").addClass("current");
	//$("#paraMapObj_WPI_PO_TYPE").val('DJ01');
    //$("#paraMapObj_WPI_PO_TYPE").find("option[value='DJ01']").attr("selected",true);
    
    //$("#paraMapObj_WPI_PO_TYPE").find("option[value='DJ01']").attr("selected","selected");
   // $("#paraMapObj_WPI_PO_TYPE").trigger("chosen:updated");	
  //  var obj = $("#paraMapObj_WPI_PO_TYPE");
   // alert(obj);

    
	$("#tag2").addClass("current");
	switchTag('tag2','content2','');
	//$("#tag1").addClass("current");
	//switchTag('tag1','content1','');	
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");

    //$("#paraMapObj_WPI_PO_TYPE_chosen").trigger("chosen:updated");
    
})

</script>
<script type="text/javascript">
function popItemDiv(showId,backId){
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});

			addItemInfo();
			
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
		
var trCount=0;
//弹出div指令内容
function addItemInfo(){

		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=0778a1dc5ed84bfd964128ca58ea89e6",//VM-采购单管理-新增 操作功能 加载物料信息
			    data: "",
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' onchange='checkbox()' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:220px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//div指令内容分页
var paginationImpl = {};
function searchItemInfo(paginationImpl){
        var url = "buss/bussModel_exeFunc.ms?funcMId=e71c421b44794817acfa36f1eee4fdc0";//VM-采购单管理-新增 操作功能 物料信息分页
	SearchItemInfo(paginationImpl,url);
}
function SearchItemInfo(paginationImpl,url){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $("#itemCode").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
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
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' onchange='checkbox()' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:220px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						
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
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' onchange='checkbox()' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;' class=' input isSubmit' maxlength='10' id='WPD_ITEM_SEQ_"+(trrCount+1)+"' name='WPD_ITEM_SEQ' value='0'/></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' class='_VAL_NULL input isSubmit' style='width: 90px;padding:0;' maxlength='10' id='WPD_PLAN_NUM_"+(trrCount+1)+"' name='WPD_PLAN_NUM'  /></td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;padding:0;'><input style='width: 130px;padding:0;' name='WPD_DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					
					$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:200px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' maxlength='500' style='padding:0;' name='WPI_MEMO'/></td>");
						len = len+1;
						trrCount++;
					var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
						defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
				
			}
	})
	$("#itemTbody").empty();
	
	hideDiv(showId,backId);
	trCount=0;
	$("#item_list_cb").attr("checked",false);
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
  //全选1
     	function getAllItems(){
		if($("#allSelect").attr("checked")=="checked"){
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
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="editForm" />
	</jsp:include>

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
			<div class="bd" style=" height: 534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="a39678821c4642cf851dcaee08fe4d16" type="edit" />
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
		<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
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
									href="javascript:void(0);"> <SPAN><dict:lang value="物料信息" /></SPAN> </A>
								</LI>								
                                <LI id="tag3" style="display:none;margin-left: 470px;">
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
                                	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="新增">
                                		<i class="ico ico-kl-new-add ico-small"></i>
                                	</button>
                                	<button type="button" onclick="delRow();" style="padding:0" title="删除">
                                		<i class="ico ico-sc-new-add ico-small"></i>
                                	</button>
                            <!--		</div>		 -->						
                                </LI>    
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" id="poNo" name="poNo" value="" />
	<input type="hidden" name="formIds" value="a39678821c4642cf851dcaee08fe4d16" />
	<input type="hidden" name="a39678821c4642cf851dcaee08fe4d16" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ec83a2eefb8841329e95469489f301c7'" />
		<s:set name="_$formId_1" value="'a39678821c4642cf851dcaee08fe4d16'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<bu:td cssClass="dec" colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" ><bu:ui colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WPI_PO_TYPE" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WPI_PO_TYPE" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_PO_TYPE" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none;">
			
			<td class="name" /><dict:lang value="单据类型" /></td>
			<td class="dec" style="width:230px;"><input type="text" id="PO_TYPE" class=" input isSubmit  readonly isaddSubmit" disabled="disabled"/></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPI_RECEIVE_TIME" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" colNo="WPI_RECEIVE_TIME" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_RECEIVE_TIME" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPI_SUP_CODE" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" colNo="WPI_SUP_CODE" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_SUP_CODE" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1"  readonly="readonly" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPI_MEMO" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" colNo="WPI_MEMO" formId="a39678821c4642cf851dcaee08fe4d16" style="height:80px;" colspan="3"><bu:ui colNo="WPI_MEMO" style="width:100%;height:100%;" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			
	</table>
	</div>
<DIV id="content2" style="display:none" data-tab="tag2">
        
      
        
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;height:500px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItems();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="交货日期" /></td >
										
										<td class="datagrid-cell " style="width:200px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:390px;">
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
    </div>	
	</div>	 	
	<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:66px;top:0px;width:670px;height:555px;">
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
				<button type="button" onclick="searchItemInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
			    	<div style="width:670px;">  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width: 30px;text-align: center;"></td>
										<td class="datagrid-cell" style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
										<td class="datagrid-cell" style="width: 150px;text-align: center;"><dict:lang value="物料料号" /></td>
										<td class="datagrid-cell" style="width: 200px;text-align: center;"><dict:lang value="物料名称" /></td>
										<td class="datagrid-cell" style="width: 220px;text-align: center;"><dict:lang value="物料规格" /></td>	
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="width:670px;height:380px;;overflow-y: auto;overflow-x: hidden;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="itemTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId3&showLoading=0" />
                                 </div>		
				</div>
				

	    </div>
			<bu:jsVal formId="a39678821c4642cf851dcaee08fe4d16" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="ec83a2eefb8841329e95469489f301c7" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">
$(function(){

    //$("#paraMapObj_WPI_PO_TYPE").find("option[value='DJ01']").attr("selected",true);
    //$("#paraMapObj_WPI_PO_TYPE").val('DJ01');
    //$("#paraMapObj_WPI_PO_TYPE_chosen").val('DJ01');
    //$("#paraMapObj_WPI_PO_TYPE").trigger("chosen:updated");	
    //$("#paraMapObj_WPI_PO_TYPE_chosen").trigger("chosen:updated");
		//$("#PO_TYPE").val($("#paraMapObj_WPI_PO_TYPE").val());
	$("#poNo").val($("#paraMapObj_WPD_PO").val());
	getItemByPo();
})
//根据采购单号获取对应的物料信息
function getItemByPo(){
//$("#paraMapObj_WPI_PO_TYPE").val('DJ01');
//$("#paraMapObj_WPI_PO_TYPE").find("option[value='DJ01']").attr("selected",true);
$("#paraMapObj_WPI_PO_TYPE").val('DJ01');
var itemInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=94f670ac56df4694b52ed2b141648910";//VM-采购单管理-修改 操作功能 修改页面加载物料信息
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: itemInfoUrl,
			    data: {
			        "wpi_po" : $("#paraMapObj_WPD_PO").val()
			    },
				success: function(data){
				                 $("#addItemInfo").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							$("#paraMapObj_WPI_RECEIVE_TIME").val(data.ajaxMap.WPI_RECEIVE_TIME);
							$("#paraMapObj_WPI_SUP_CODE").val(data.ajaxMap.WPI_SUP_CODE);
							$("#paraMapObj_WPI_SUP_CODE_SHOW").val(data.ajaxMap.SUPPLIER_NAME);
							$("#paraMapObj_WPI_MEMO").val(data.ajaxMap.WPI_MEMO);
						}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
								if(rccList[i].WPD_PLAN_NUM==null) rccList[i].WPD_PLAN_NUM="";
								if(rccList[i].WPD_MEMO==null) rccList[i].WPD_MEMO="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr_"+(trrCount+1)+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' onchange='checkbox()' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WPD_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' value='"+rccList[i].WPD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;' class=' input isSubmit' id='WPD_ITEM_SEQ_"+(trrCount+1)+"' maxlength='10' name='WPD_ITEM_SEQ' value='"+rccList[i].WPD_ITEM_SEQ+"'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' class='_VAL_NULL input isSubmit' style='width: 90px;padding:0;' id='WPD_PLAN_NUM_"+(trrCount+1)+"' maxlength='10' name='WPD_PLAN_NUM' value='"+rccList[i].WPD_PLAN_NUM+"' /></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;padding:0;'><input style='width: 130px;padding:0;' name='WPD_DELIVERY_DATE' value='"+rccList[i].DELIVERY_DATE+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:200px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' style='padding:0;' maxlength='500' name='WPI_MEMO' value='"+rccList[i].WPD_MEMO+"'/></td>");
								trrCount++;
							}
							
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
								defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
function checkVal1(){
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#WPD_ITEM_SEQ_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("WPD_ITEM_SEQ_"+i);
			tempFlag1 = checkNum1(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}
function checkVal2(){
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#WPD_PLAN_NUM_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("WPD_PLAN_NUM_"+i);
			tempFlag1 = checkNum(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}
function checkNum1(tempVal,tempId){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0){
		_alertValMsg(tempId,"<dict:lang value="该项必须为0或正整数" />");
		return "0";  
	}else 
	return "1"; 
}
function checkNum(tempVal,tempId){
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
function checkbox(){
    $("#addItemInfo :checkbox").each(function(){
        flag = true;
        if(this.checked==false){
            flag = false;
            return
        }
    });
    $("#allSelect").attr("checked",flag);
}
</script>
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
                    function editCal(){
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
                         //  utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条物料信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条物料信息" />",0,"260","");
                           return;
                        }
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=4c3885634b4546e0a2d437ef75840a2a";
  document.forms.editForm.submit();
}
                    
            
                
             </script>
<script>(function($){
  $(window).on('load',function(){
   // setPopScroll('.datagrid-body','.datagrid-header-inner');
    setPopScroll('.scroll','.datagrid-header-inner');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

