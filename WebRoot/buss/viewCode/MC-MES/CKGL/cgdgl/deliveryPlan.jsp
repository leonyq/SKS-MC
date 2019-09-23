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
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="a39678821c4642cf851dcaee08fe4d16" type="edit" />
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
							</UL>
					<!--	</DIV> -->
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" id="itemArr" name="itemArr" value="" />
	<input type="hidden" id="poNo" name="poNo" value="" />
	<input type="hidden" id="supCode" name="supCode" value="" />
	<input type="hidden" id="wpiMemo" name="wpiMemo" value="" />
	<input type="hidden" name="formIds" value="a39678821c4642cf851dcaee08fe4d16" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="a39678821c4642cf851dcaee08fe4d16" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'0ef6dbcf696e41be91e6a9da3b81ed81'" />
		<s:set name="_$formId_1" value="'a39678821c4642cf851dcaee08fe4d16'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" /></td>
			<bu:td cssClass="dec" colNo="WPD_PO" formId="f961ef99b03c4536a66dc8f3ddcca076" ><bu:ui colNo="WPD_PO" style="width:200px;" formId="f961ef99b03c4536a66dc8f3ddcca076" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WPI_PO_TYPE" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec"  colNo="WPI_PO_TYPE" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_PO_TYPE" style="width:200px;" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPI_RECEIVE_TIME" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WPI_RECEIVE_TIME" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_RECEIVE_TIME" style="width:200px;" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" /></bu:td>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPI_SUP_CODE" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" colNo="WPI_SUP_CODE" formId="a39678821c4642cf851dcaee08fe4d16" ><bu:ui colNo="WPI_SUP_CODE" style="width:200px;" formId="a39678821c4642cf851dcaee08fe4d16" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
		    
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPI_MEMO" formId="a39678821c4642cf851dcaee08fe4d16" /></td>
			<bu:td cssClass="dec" colNo="WPI_MEMO" formId="a39678821c4642cf851dcaee08fe4d16" style="height:80px;" colspan="5"><bu:ui colNo="WPI_MEMO" style="width:100%;height:100%;" formId="a39678821c4642cf851dcaee08fe4d16"  dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
	</table>
	 </div>
	<DIV id="content2" style="display:none" data-tab="tag2">
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItems();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="计划数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="接收数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="已下达数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="下达数量" /></td >
					                    <td class="datagrid-cell" style="width:120px;" ><dict:lang value="仓库" /></td >
					                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="赠品数量" /></td >
					                    <td class="datagrid-cell" style="width:130px;" ><dict:lang value="交货日期" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										
										
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:330px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
	</div>
			<bu:jsVal formId="a39678821c4642cf851dcaee08fe4d16" formIndex="1" />

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
<script type="text/javascript">
$(function(){
    $("#paraMapObj_WPI_PO_TYPE").val('DJ01');
    $("#paraMapObj_WPI_PO_TYPE").trigger("chosen:updated");
    
	$("#paraMapObj_WPI_MEMO").attr("class","isSubmit readonly  _VAL_DATABASE");
	

	
	getWmsSel();
	
})
//根据采购单号获取对应的物料信息
var trrCount = 0;
function getItemByPo(){
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
								if(rccList[i].WPD_RECEIVE_NUM==null) rccList[i].WPD_RECEIVE_NUM=0;
								if(rccList[i].ALREADY_NUM==null) rccList[i].ALREADY_NUM=0;
								if(rccList[i].WPD_MEMO==null) rccList[i].WPD_MEMO="";
								var wmsSel = "<select id='wmsSel_"+(trrCount+1)+"' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;'>"+ wmsOption +"</select>";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr_"+(trrCount+1)+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' value='"+(trrCount+1)+"' onchange='checkbox()' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WPD_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' value='"+rccList[i].WPD_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;'>"+rccList[i].WPD_ITEM_SEQ+"<input type='hidden' name='WPD_ITEM_SEQ' value='"+rccList[i].WPD_ITEM_SEQ+"'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+rccList[i].WPD_PLAN_NUM+"<input type='hidden' name='WPD_PLAN_NUM' value='"+rccList[i].WPD_PLAN_NUM+"' /></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+rccList[i].WPD_RECEIVE_NUM+"<input type='hidden' name='WPD_RECEIVE_NUM' value='"+rccList[i].WPD_RECEIVE_NUM+"' /></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>"+rccList[i].ALREADY_NUM+"<input type='hidden' name='ALREADY_NUM' value='"+rccList[i].ALREADY_NUM+"' /</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' class='_VAL_NULL input isSubmit' style='width: 90px;padding:0;' id='ISSUED_NUM_"+(trrCount+1)+"' maxlength='9' name='ISSUED_NUM' value='"+(rccList[i].WPD_PLAN_NUM-rccList[i].ALREADY_NUM)+"' /></td>");
		                        $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>"+wmsSel+"</td>");
		                        $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;padding:0;'><input type='text' class=' input isSubmit' style='width: 90px;padding:0;' id='GIFT_NUM_"+(trrCount+1)+"' name='GIFT_NUM' value='0' /></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;padding:0;'><input style='width: 130px;padding:0;' name='WPD_DELIVERY_DATE' value='"+rccList[i].DELIVERY_DATE+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:200px;text-align: center;'>"+rccList[i].WPD_MEMO+"<input type='hidden' name='WPI_MEMO' value='"+rccList[i].WPD_MEMO+"'/></td>");
								//mySetChosen();//设置下拉框样式
					            //$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
								trrCount++;
							}
							
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
var wmsOption;
//获取仓库信息
function getWmsSel(){
    var getWmsSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625";//VM-采购入库管理-新增 操作功能 加载仓库信息
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getWmsSelUrl,
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
						getItemByPo();
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
/*
function checkVal1(){
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#ISSUED_NUM_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("ISSUED_NUM_"+i);
			tempFlag1 = checkNum(tempVal,tempId);
		}
		if(tempFlag1=="0")
		return "0";
	}
	
}
function checkVal2(){  //赠品数量
	var tempVal;
	var tempId;
	var tempFlag1;
	for(var i=1;i<=trrCount;i++){
		tempVal = $("#GIFT_NUM_"+i).val();
		if(tempVal==null) continue;
		if(tempVal!=""){
			tempId = document.getElementById("GIFT_NUM_"+i);
			tempFlag1 = checkNum1(tempVal,tempId);
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
}*/
function getAllItems(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
} 
function checkbox(){
    var flag = true;
    $("#addItemInfo :checkbox").each(function(){
        if(this.checked==false){
            flag = false;
            return;
        }
    });
    $("#allSelect").attr("checked",flag);
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
function editCal(){
                        						/*
                        var tempFlag1 = checkVal1();
                    if(tempFlag1=="0"){
                         return ;
                    }
                    var tempFlag2 = checkVal2();
                    if(tempFlag2=="0"){
                         return ;
                    }
                    */
                    
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
                    
            var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			return false;
			} 
		});
		if(falg==0){
		    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请勾选物料信息" />",0,"260","");
		    return ;
		}
		
		
		
		//拼接json数据
		var tempFl = 0;
		var itemArrs = new Array();
		$('input[name="isSelect1"]:checked').each(function(i,item){
		    var objStr = $(item).parents("tr").find("td");
		    var planNum = objStr.find("input[name='WPD_PLAN_NUM']").val();
		    var alreaNum = objStr.find("input[name='ALREADY_NUM']").val();
		    var issuedNum = objStr.find("input[name='ISSUED_NUM']").val();
		     var wmsSelects = objStr.find("select[name='wmsSelect']").val();
		     
		   if(!(/^[0-9]*[1-9][0-9]*$/.test( issuedNum )) || issuedNum <= 0){
		          utilsFp.confirmIcon(3,"","","", "<dict:lang value="下达数量必须为正整数" />",0,"260","");
		          tempFl = 1;
		        return 	false;
		    } 
		   
		    if(issuedNum>(planNum-alreaNum)){
		        utilsFp.confirmIcon(3,"","","", "<dict:lang value="下达数量需小于等于计划数量减去已下达数量" />",0,"260","");
		        tempFl = 1;
		        return 	false;
		    }
		    if(null==wmsSelects || wmsSelects==""){
		          utilsFp.confirmIcon(3,"","","", "<dict:lang value="勾选的仓库不能为空" />",0,"260","");
		          tempFl = 1;
		        return 	false;
		    }
		    var itemArr = [];
            /*itemArr.CI_ITEM_CODE=objStr.find("input[name='CI_ITEM_CODE']").val();
            itemArr.WPD_ITEM_SEQ=objStr.find("input[name='WPD_ITEM_SEQ']").val();
            itemArr.WPD_PLAN_NUM=planNum;
            itemArr.issuedNum=issuedNum;
            itemArr.wmsSelect=objStr.find("select[name='wmsSelect']").val();
            itemArr.GIFT_NUM=objStr.find("input[name='GIFT_NUM']").val();
            itemArr.WPD_DELIVERY_DATE=objStr.find("input[name='WPD_DELIVERY_DATE']").val();
            itemArr.WPI_MEMO=objStr.find("input[name='WPI_MEMO']").val();*/
            itemArr.push({
                CI_ITEM_CODE: objStr.find("input[name='CI_ITEM_CODE']").val()
            });
            itemArr.push({
                WPD_ITEM_SEQ: objStr.find("input[name='WPD_ITEM_SEQ']").val()
            });
            itemArr.push({
                WPD_PLAN_NUM: planNum
            });
            itemArr.push({
                issuedNum: issuedNum
            });
            itemArr.push({
                wmsSelect: objStr.find("select[name='wmsSelect']").val()
            });
            itemArr.push({
                GIFT_NUM: objStr.find("input[name='GIFT_NUM']").val()
            });
            itemArr.push({
                WPD_DELIVERY_DATE: objStr.find("input[name='WPD_DELIVERY_DATE']").val()
            });
            itemArr.push({
                WPI_MEMO: objStr.find("input[name='WPI_MEMO']").val()
            });
            itemArrs.push(itemArr);
        });
         $("#itemArr").val(JSON.stringify(itemArrs));
         $("#poNo").val($("#paraMapObj_WPD_PO").val());
         $("#supCode").val($("#paraMapObj_WPI_SUP_CODE").val());
         $("#wpiMemo").val($("#paraMapObj_WPI_MEMO").val());
         
         if(tempFl==0){
             document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=c04dbc65b3c845dd8bef8f071d3959d5";
                document.forms.editForm.submit();
         }
  
}
</script>
	<!-- js初始化方法 -->
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

