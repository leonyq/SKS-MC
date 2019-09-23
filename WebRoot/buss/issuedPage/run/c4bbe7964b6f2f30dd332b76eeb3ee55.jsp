<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-物料追溯报表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="ff22f995cd064055b2658fb26776340b"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div style="height:calc(100%  - 10px);background-color:#fff;border:1px solid #eaeaea;box-sizing:border-box;">
        <div class="block1 optn" style="float:left;width:30%;height:100%;position: relative;">
            <input type="text" class="input" id="itemSn" placeholder="请输入物料SN,按Enter键或点击查询" style="margin-left:70px;margin-top:10px;height:28px;line-height:28px;">
            <input type="hidden" id="oneLot">
            <input type="hidden" id="jumpId" value="${param.jumpId}">
            <input type="hidden" name="formId" id="formId2" value='1111'/>
            <input type="hidden" name="formId" id="formId4" value='2222'/>
            <input type="hidden" name="formId" id="formId3" value='3333'/>
            <input type="hidden" name="formId" id="formId5" value='4444'/>
            <button type="button" onclick="queryItem();" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
            <div class="mod" style="height:calc(100% - 38px);">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="同批次物料" /></h3>	
                </div>
                <div class="panel datagrid datagrid-div1" style="height:calc(100% - 70px);">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:100%;">
						<div class="datagrid-header" style="width:100%">
							<div class="datagrid-header-inner head" id="" style="width:100%;">
								<table  class="datagrid-htable fixedTable " id="datagrid-htable1111" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="状态" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:calc(100% - 32px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax1111" >
								<tbody id="addlotItem" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="background-color: white;" >
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchLotItem&formId=formId2&showLoading=0" />
                </div>
                
            </div>
        </div>
		<div class="block2" style="width:68%;float:right;height:100%;">
		    <div class="mod" style="height:100%;">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="基本信息" /></h3>	
                </div>
                <table style="width: 100%;line-height:35px;">
                	<tr >
                	<td ><div class="name" ><dict:lang value="物料料号" /></div></td><td><div class="dec"><input readonly  id="itemCode" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="物料名称" /></div></td><td><div class="dec"><input readonly id="itemName" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="物料规格" /></div></td><td><div class="dec"><input readonly id="itemSpec" class="input coc" style="width:200px;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="供应商" /></div></td><td><div class="dec"><input readonly id="supCode" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="批次" /></div></td><td><div class="dec"><input readonly id="itemLot" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="数量" /></div></td><td><div class="dec"><input readonly id="itemNum" class="input coc" style="width:200px;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="物料状态" /></div></td><td><div class="dec"><input readonly id="itemStatus" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="品质状态" /></div></td><td><div class="dec"><input readonly id="qualityStatus" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="生产日期" /></div></td><td><div class="dec"><input readonly id="produceDate" class="input coc" style="width:200px;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="保质期" /></div></td><td><div class="dec"><input readonly id="invalidDate" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="入库时间" /></div></td><td><div class="dec"><input readonly id="receiveTime" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="追溯信息" /></div></td><td><div class="dec"><input readonly id="supTrace" class="input coc" style="width:200px;"></div></td>
                	
                	</tr> 	
                </table>    
                
            <div class="js-tab" style="height:calc(100% - 180px)">
            <DIV id="container" style="padding:0 2px;box-sizing: border-box;height:100%;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="履历" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="产品" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="质量" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
						<DIV class="content1" id="content" style="margin-top: 15px;height:calc(100% - 45px)">
			<DIV id="content1" style="height:100%;" data-tab="tag1">
				<div class="panel datagrid datagrid-div1" style="height:100%;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1" style="height:100%;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1" style="width:100%;" id="datagrid-header-inner2">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable2222">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="作业类型" /></td >
										<td class="datagrid-cell" style="width:250px;"><dict:lang value="单据号" /></td >
										<td class="datagrid-cell" style="width:130px;"><dict:lang value="单据类型" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="作业时间" /></td >
										<td class="datagrid-cell"style="width:70px;"><dict:lang value="作业人员" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax2222" >
								<tbody id="addItemLog" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
			</DIV>
		 
        	<DIV id="content2" style="display:none;height:100%;" data-tab="tag2">
				<div class="panel datagrid datagrid-div1"  style="height:calc(100% - 30px);">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:100%;" >
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head2" style="width:100%;">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable3333" style="">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="产品SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="制令单号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="工单号" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="机种" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="机种名称" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="机种规格" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;" id="datagrid-btable-ajax3333"  >
								<tbody id="addProductInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
			<div style="background-color: white;" >
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchProductInfo&formId=formId3&showLoading=0" />
                </div>
		</DIV>
		<DIV id="content3" style="display:none;height:100%;" data-tab="tag3">
				<div class="panel datagrid datagrid-div1" style="height:100%;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="height:100%;" >
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head3" style="width:100%;">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable4444" style="">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="检验单号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="检验阶别" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="检验类型" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="检验结果" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="供应商/客户" /></td >
										<td class="datagrid-cell" style="width:90px;"><dict:lang value="送检人" /></td >
										<td class="datagrid-cell" style="width:140px;"><dict:lang value="送检时间" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll3" style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax4444" >
								<tbody id="addQualityInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
		</DIV>
		 				

	</DIV>
	</div>

             </div>
		</div>
    </div>
    <bu:script viewId="0b0276d9a6e3422592e30a48ad93b418" /> 
    <bu:submit viewId="0b0276d9a6e3422592e30a48ad93b418" />
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
		var itemSn = $.trim($("#itemSn").val());
		if(itemSn!=""){
    		if(tag=="tag1"){
    			getItemLogInfo(itemSn);
    		}
    		if(tag=="tag2"){
    			getProductInfo(itemSn);
    		}
    		if(tag=="tag3"){
    			getQualityInfo(itemSn);
    		}
		}
	}
$(function(){
    $("#tag1").addClass("current");
    var itemSn = $("#jumpId").val();  
      if(itemSn!=""){
          clickTr(itemSn);
      }
})
//查询方法
function queryItem(){
    var itemSn = $.trim($("#itemSn").val());
    if(itemSn==""){
        utilsFp.confirmIcon(3,"","","", "请输入物料SN",0,"300","");  
        return;
    }else{
        getItemSnInfo(itemSn);
        if($("#tag1").attr("class")=="current"){
            getItemLogInfo(itemSn);
        }
        if($("#tag2").attr("class")=="current"){
            getProductInfo(itemSn);
        }
        if($("#tag3").attr("class")=="current"){
            getQualityInfo(itemSn);
        }
    }
}
//输入物料SN 按回车键
	$("#itemSn").keydown(function(event){
	    if(event.keyCode == 13){
	        queryItem();
	    }
	});
//双击事件
function clickTr(itemSn){
    $("#itemSn").val(itemSn);
    getItemSnInfo(itemSn);
        if($("#tag1").attr("class")=="current"){
            getItemLogInfo(itemSn);
        }
        if($("#tag2").attr("class")=="current"){
            getProductInfo(itemSn);
        }
        if($("#tag3").attr("class")=="current"){
            getQualityInfo(itemSn);
        }
}
//跳转检验单
function docJump0(obj){
    docJump(obj);
}
//跳转到产品信息页面
function proJump(obj){
  var formId = $("#formId1").val();
  
  var url = "${path}buss/bussModel.ms?exeid=aec0089e4d69487cbe28b4b70b1ffa21&FUNC_CODE=F10630&formId="+formId+"&iframeId="+_currentFrame+"&proSn="+obj;
  showPopWinFp(url, 800, 400,null,"<dict:lang value="产品追溯报表" />",obj,1);
}

//查询物料sn基本信息
function getItemSnInfo(itemSn){
    util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=402843938c1d464ea45f485f8b089b00",
			    data: {
			        "itemSn" : itemSn
			    },
				success: function(data){
				        $(".coc").val("");
						util.closeLoading();
						console.log(data);
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].INVALID_DATE==null) rccList[i].INVALID_DATE="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].STOCK_FLAG==null) rccList[i].STOCK_FLAG="未在库";
								if(rccList[i].WSI_ITEM_FLAG=="1") rccList[i].WSI_ITEM_FLAG="良品";
								if(rccList[i].WSI_ITEM_FLAG=="2") rccList[i].WSI_ITEM_FLAG="不良品";
								$("#itemCode").val(rccList[i].WMI_ITEM_CODE);
								$("#itemName").val(rccList[i].CI_ITEM_NAME);
								$("#itemSpec").val(rccList[i].CI_ITEM_SPEC);
								$("#supCode").val(rccList[i].SUPPLIER_NAME);
								$("#itemLot").val(rccList[i].WMI_LOT_NO);
								$("#itemNum").val(rccList[i].WMI_SN_NUM);
								$("#itemStatus").val(rccList[i].STOCK_FLAG);
								$("#qualityStatus").val(rccList[i].WSI_ITEM_FLAG);
								$("#produceDate").val(rccList[i].PRODUCE_DATE);
								$("#invalidDate").val(rccList[i].INVALID_DATE);
								$("#receiveTime").val(rccList[i].RECEIVE_TIME);
								$("#supTrace").val(rccList[i].WSI_SUP_TRACE);
								$("#oneLot").val(rccList[i].WMI_LOT_NO);
							}
							if(rccList.length==0){
							    $("#oneLot").val("");
							}
							oneLotItem($("#oneLot").val());
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//查询同批次物料
function oneLotItem(itemLot){
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=31fc13a1dc034f4a99c6d8aabf0ec043",
			    data: {
			        "itemLot" : itemLot
			    },
				success: function(data){
				                 $("#addlotItem").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].STOCK_FLAG==null) rccList[i].STOCK_FLAG="未在库";
								$("#datagrid-btable-ajax1111 tbody:last").append("<tr id='tr1_"+i+"' ondblclick=\"clickTr('"+rccList[i].WMI_ITEM_SN+"')\"></tr>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WMI_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;'>"+rccList[i].STOCK_FLAG+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax1111 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("1111");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//同批次物料分页
var paginationImpl = {};
function searchLotItem(paginationImpl){
    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    util.showLoading("处理中...");
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=31fc13a1dc034f4a99c6d8aabf0ec043",
			    data: {
			        "itemLot" : $("#oneLot").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				                 $("#addlotItem").empty();
				                 util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].STOCK_FLAG==null) rccList[i].STOCK_FLAG="未在库";
								$("#datagrid-btable-ajax1111 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ondblclick=\"clickTr('"+rccList[i].WMI_ITEM_SN+"')\"></tr>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WMI_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;'>"+rccList[i].STOCK_FLAG+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax1111 tbody tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite("1111");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取履历信息
function getItemLogInfo(itemSn){ 
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=54440e73dca0428799b6405a8c85b578",
			    data: {
			        "itemSn" : itemSn,
			        "type" : "logType"
			    },
				success: function(data){
				                 $("#addItemLog").empty();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].WTI_DOC_NUM==null) rccList[i].WTI_DOC_NUM="";
							    if(rccList[i].WDT_TYPE_NAME==null) rccList[i].WDT_TYPE_NAME="";
							    if(rccList[i].OPERATE_TIME==null) rccList[i].OPERATE_TIME="";
							    if(rccList[i].NAME==null) rccList[i].NAME="";
								$("#datagrid-btable-ajax2222 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'>"+rccList[i].WTI_OPERATE_TYPE+"</td>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'>"+rccList[i].WTI_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].WDT_TYPE_NAME+"</td>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].OPERATE_TIME+"</td>");
								$("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
							}
							
						}
							var tableTrJs = $("#datagrid-btable-ajax2222 tbody tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite("2222");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取产品信息
function getProductInfo(itemSn){
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=54440e73dca0428799b6405a8c85b578",
			    data: {
			        "itemSn" : itemSn,
			        "type" : "product"
			    },
				success: function(data){
				                 $("#addProductInfo").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
							    if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
							    
								$("#datagrid-btable-ajax3333 tbody:last").append("<tr id='tr1_"+i+"' ondblclick=\"proJump('"+rccList[i].WIT_SN+"')\"></tr>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WIT_SN+"</span></td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;' title='"+rccList[i].WIT_MO_NUMBER+"'>"+rccList[i].WIT_MO_NUMBER+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].PM_PROJECT_ID+"'>"+rccList[i].PM_PROJECT_ID+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].WIT_MODEL_CODE+"'>"+rccList[i].WIT_MODEL_CODE+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax3333 tbody tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite("3333");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//产品信息分页
function searchProductInfo(paginationImpl){
    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemSn = $.trim($("#itemSn").val());
    util.showLoading("处理中...");
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=54440e73dca0428799b6405a8c85b578",
			    data: {
			        "itemSn" : itemSn,
			        "type" : "product",
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				        util.closeLoading();
				                 $("#addProductInfo").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
							    if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
							    
								$("#datagrid-btable-ajax3333 tbody:last").append("<tr id='tr1_"+i+"' ondblclick=\"proJump('"+rccList[i].WIT_SN+"')\"></tr>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WIT_SN+"</span></td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;' title='"+rccList[i].WIT_MO_NUMBER+"'>"+rccList[i].WIT_MO_NUMBER+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].PM_PROJECT_ID+"'>"+rccList[i].PM_PROJECT_ID+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].WIT_MODEL_CODE+"'>"+rccList[i].WIT_MODEL_CODE+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							}
							
						}
						    pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax3333 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("3333");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取质量信息
function getQualityInfo(itemSn){
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=54440e73dca0428799b6405a8c85b578",
			    data: {
			        "itemSn" : itemSn,
			        "type" : "quality"
			    },
				success: function(data){
				                 $("#addQualityInfo").empty();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].INSEPCT_RESULT==null) rccList[i].INSEPCT_RESULT="";
							    if(rccList[i].NAME==null) rccList[i].NAME="";
							    if(rccList[i].SEND_TIME==null) rccList[i].SEND_TIME="";
							    if(rccList[i].SAMPLE_TYPE==null) rccList[i].SAMPLE_TYPE="";
								$("#datagrid-btable-ajax4444 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ondblclick=\"docJump0('"+rccList[i].QII_INSPECT_SN+"')\" ></tr>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;' title='"+rccList[i].QII_INSPECT_SN+"'><span style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].QII_INSPECT_SN+"</span></td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;'>"+rccList[i].TEST_STEP+"</td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;' title='"+rccList[i].SAMPLE_TYPE+"'>"+rccList[i].SAMPLE_TYPE+"</td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;'>"+rccList[i].LIST_FLAG+"</td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;'>"+rccList[i].INSEPCT_RESULT+"</td>");
								if(rccList[i].CUSTOMER==null&&rccList[i].SUPPLIER_NAME==null){
								    $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;'></td>");
								}else if(rccList[i].CUSTOMER!=null&&rccList[i].SUPPLIER_NAME==null){
								    $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
								}else if(rccList[i].CUSTOMER==null&&rccList[i].SUPPLIER_NAME!=null){
								    $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								}
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;' title='"+rccList[i].SEND_TIME+"'>"+rccList[i].SEND_TIME+"</td>");
							}
							
						}
							var tableTrJs = $("#datagrid-btable-ajax4444 tbody tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite("4444");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
