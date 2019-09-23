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
	<!-- head里面 -->
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
	                <table class="basic-table">
	                	
	                	<input type="hidden" name="formIds" value="d67504b364614451ae814526364a482c" />
						<input type="hidden" name="d67504b364614451ae814526364a482c" value="paraMap1@" />
						<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
						<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
							<s:set name="_$viewId" value="'b0e8b75911734e09814bb5029ccbfd47'" />
							<s:set name="_$formId_1" value="'d67504b364614451ae814526364a482c'" />
							<s:set name="_$type" value="'add'" />
						
					</table>
                </div>
			    <div class="optn">
			        <button type="button" onclick="addInfo();"><i class="ico ico-save"></i><dict:lang value="冻结当前" /></button>
			        <button type="button" onclick="addInfoAll();"><i class="ico ico-save"></i><dict:lang value="冻结所有" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        <button type="button" onclick="searchItemInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 520px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d67504b364614451ae814526364a482c" type="add" />
	<table class="basic-table" >
		<input type="hidden" name="type" id="type" value="1" />
		<input type="hidden" name="itemSns" id="itemSns" value="" />
	<input type="hidden" name="formIds" value="d67504b364614451ae814526364a482c" />
	<input type="hidden" name="d67504b364614451ae814526364a482c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b0e8b75911734e09814bb5029ccbfd47'" />
		<s:set name="_$formId_1" value="'d67504b364614451ae814526364a482c'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" />
			<bu:uitn colNo="WSI_PRODUCE_DATE" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WSI_PRODUCE_DATE" formId="d67504b364614451ae814526364a482c" colspan='4'>
    			<bu:ui colNo="WSI_PRODUCE_DATE" style="width: 200px;" formId="d67504b364614451ae814526364a482c" value="%{WSI_PRODUCE_DATE}" formIndex="1" id="productStartDate" />~<bu:ui colNo="WSI_PRODUCE_DATE" style="width: 200px;" formId="d67504b364614451ae814526364a482c" value="%{WSI_PRODUCE_DATE}" formIndex="1" id="productEndDate" />
	        </bu:td>
		</tr>
	<tr>
			<td class="name" />
			<dict:lang value="入库日期" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_FREEZE_TIME" formId="d67504b364614451ae814526364a482c" colspan='4'>
    			<bu:ui colNo="WFI_FREEZE_TIME" style="width: 200px;" formId="d67504b364614451ae814526364a482c" value="%{WFI_FREEZE_TIME}" formIndex="1" id="startDate" />~<bu:ui colNo="WFI_FREEZE_TIME" style="width: 200px;" formId="d67504b364614451ae814526364a482c" value="%{WFI_FREEZE_TIME}" formIndex="1" id="endDate" />
	        </bu:td>
	</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="WFI_SN" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_SN" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_SN" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WSD_DOC_NUM}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="WFI_ITEM_CODE" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_ITEM_CODE" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_ITEM_CODE" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WSD_DOC_TYPE}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="WFI_WH_CODE" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WFI_WH_CODE" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_WH_CODE" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WAD_SCARP_TYPE}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="WFI_CUST_CODE" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_CUST_CODE" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_CUST_CODE" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WSD_DOC_NUM}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="WFI_SUP_CODE" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_SUP_CODE" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_SUP_CODE" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WSD_DOC_TYPE}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="WFI_LOT" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WFI_LOT" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WFI_LOT" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WAD_SCARP_TYPE}" formIndex="1" /></bu:td>
	
		</tr>
	<tr>
			<td class="name" />
			<bu:uitn colNo="WSI_CONNECT_DOC" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WSI_CONNECT_DOC" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="WSI_CONNECT_DOC" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{WSI_CONNECT_DOC}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="QII_INSPECT_SN" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="QII_INSPECT_SN" formId="d67504b364614451ae814526364a482c">
				<bu:ui colNo="QII_INSPECT_SN" style="width:200px;" formId="d67504b364614451ae814526364a482c" value="%{QII_INSPECT_SN}" formIndex="1" /></bu:td>
	
		</tr>
		

		<tr>
			<td class="name" />
			<bu:uitn colNo="WFI_FREEZE_MEMO" formId="d67504b364614451ae814526364a482c" />
			</td>
			<bu:td cssClass="dec" colNo="WFI_FREEZE_MEMO" formId="d67504b364614451ae814526364a482c" style="height:80px;" colspan="5">
				<bu:ui colNo="WFI_FREEZE_MEMO" style="width:100%;height:100%" formId="d67504b364614451ae814526364a482c" value="%{WAD_SCARP_REASON}" formIndex="1" /></bu:td>
	
		</tr>
	</table>
<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>	
	<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
		<div class="panel datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
				<div class="datagrid-header" >
					<div class="datagrid-header-inner">
						<table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz   " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234">
							<tbody>
								<tr class="datagrid-header-row thcolor">
								    <td style='display:none;width:150px;text-align: left;'>
								        <input type="hidden" >
								    </td>
									<td class="datagrid-cell" style="width:30px;"></td>
									<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料/产品SN" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="仓库" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="物料数量" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料料号" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料名称" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料规格" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="物料批次" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="客户" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="供应商" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="datagrid-body datagrid-div3 scroll" style="height:220px;">
					<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234">
						<tbody id="addItemInfo">
						</tbody>
					</table>
				</div>
				
			</div>
			<div style="background-color: white;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&type=1&formId=formId1&showLoading=0" />
			</div>
		</div>
	</div>
			<bu:jsVal formId="d67504b364614451ae814526364a482c" formIndex="1" />
				
			</div>
		 </form>
	</div>
	
	<bu:submit viewId="b0e8b75911734e09814bb5029ccbfd47" />
	<bu:script viewId="b0e8b75911734e09814bb5029ccbfd47" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
	<script type="text/javascript">
	
	$(function(){
	    $('#paraMap1_WSI_CONNECT_DOC').attr('disabled',false);
	    $('#paraMap1_QII_INSPECT_SN').attr('disabled',false);
	})
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
					$("#" + trId).css("background-color", "#d3eafc");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#d3eafc");
				}
			});
		}
		
		function getItemInfo() {
			util.showLoading("处理中...");
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=d7a9100d491d4ed4a1969470fdb43ba1";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
				data: {
				    "flag" : "empty",
				    "paraMap.type" : 1
				},
				//data: "paraMap.type=1",
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_SN == null) rccList[i].ITEM_SN = "";
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].ITEM_LOT == null) rccList[i].ITEM_LOT = "";
							if(rccList[i].WH_NAME == null) rccList[i].WH_NAME = "";
							if(rccList[i].ITEM_NUM == null) rccList[i].ITEM_NUM = "";
							if(rccList[i].CUST_NAME == null) rccList[i].CUST_NAME = "";
							if(rccList[i].SUP_NAME == null) rccList[i].SUP_NAME = "";
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='display:none;width:150px;text-align: left;'><input type='hidden' id='itemIds' value='" + rccList[i].ID + "'/></td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:30px;text-align: center;'><input id='" + rccList[i].ITEM_SN + "' type='checkbox' name='isSelect1'/></td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SN + "<input type='hidden' id='ITEM_SN' value='" + rccList[i].ITEM_SN + "'/></td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: left;'>" + rccList[i].WH_NAME + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;'>" + rccList[i].ITEM_NUM + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;'>" + rccList[i].ITEM_CODE + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;'>" + rccList[i].ITEM_NAME + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SPEC + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;'>" + rccList[i].ITEM_LOT + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: left;'>" + rccList[i].CUST_NAME + "</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:100px;text-align: left;'>" + rccList[i].SUP_NAME + "</td>");
						}

					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
					defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		//div物料信息分页
		var paginationImpl = {};

		function SearchItemInfo(paginationImpl, url) {
			util.showLoading("处理中...");
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			
			var startDate = $.trim($("#startDate").val());//入库开始时间
			var endDate = $.trim($("#endDate").val());//入库结束时间
			var itemSN = $.trim($("#paraMap1_WFI_SN").val());//物料SN
			var itemCode = $.trim($("#paraMap1_WFI_ITEM_CODE").val());//物料料号
			var whCode = $.trim($("#paraMap1_WFI_WH_CODE").val());//仓库
			var custCode = $.trim($("#paraMap1_WFI_CUST_CODE").val());//客户
			var supCode = $.trim($("#paraMap1_WFI_SUP_CODE").val());//供应商
			var lotNo = $.trim($("#paraMap1_WFI_LOT").val());//批次
			var productStartDate = $.trim($('#productStartDate').val());//生产开始时间
			var productEndDate = $.trim($('#productEndDate').val());//生产结束时间
			var connectDoc = $.trim($('#paraMap1_WSI_CONNECT_DOC').val());//关联单号
			var inspectSn = $.trim($('#paraMap1_QII_INSPECT_SN').val());//检验单号
			
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: {
				    "paraMap.type" : 1,
				    "paraMap.startDate" : startDate,
				    "paraMap.endDate" : endDate,
				    "paraMap.itemSN" : itemSN,
				    "paraMap.itemCode" : itemCode,
				    "paraMap.whCode" : whCode,
				    "paraMap.custCode" : custCode,
				    "paraMap.supCode" : supCode,
				    "paraMap.lotNo" : lotNo,
				    "paraMap.productStartDate" : productStartDate,
				    "paraMap.productEndDate" : productEndDate,
				    "paraMap.connectDoc" : connectDoc,
				    "paraMap.inspectSn" : inspectSn,
				    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
				},
				/*data: "paraMap.type=1&paraMap.startDate=" +startDate+ "&paraMap.endDate=" + endDate+ "&paraMap.itemSN=" + itemSN
				    + "&paraMap.itemCode=" + itemCode+ "&paraMap.whCode=" + whCode+ "&paraMap.custCode=" + custCode + "&paraMap.supCode=" + supCode	
                    + "&paraMap.lotNo=" + lotNo + "&paraMap.productStartDate=" + productStartDate  + "&paraMap.productEndDate=" + productEndDate + "&paraMap.connectDoc=" + connectDoc + "&paraMap.inspectSn=" + inspectSn					
                    + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,*/
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_SN == null) rccList[i].ITEM_SN = "";
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].ITEM_LOT == null) rccList[i].ITEM_LOT = "";
							if(rccList[i].WH_NAME == null) rccList[i].WH_NAME = "";
							if(rccList[i].ITEM_NUM == null) rccList[i].ITEM_NUM = "";
							if(rccList[i].CUST_NAME == null) rccList[i].CUST_NAME = "";
							if(rccList[i].SUP_NAME == null) rccList[i].SUP_NAME = "";
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='display:none;width:150px;text-align: left;'><input type='hidden' id='itemIds' value='" + rccList[i].ID + "'/></td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:30px;text-align: center;'><input id='" + rccList[i].ITEM_SN + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SN + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: left;'>" + rccList[i].WH_NAME + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;'>" + rccList[i].ITEM_NUM + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;'>" + rccList[i].ITEM_CODE + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;'>" + rccList[i].ITEM_NAME + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SPEC + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;'>" + rccList[i].ITEM_LOT + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: left;'>" + rccList[i].CUST_NAME + "</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:100px;text-align: left;'>" + rccList[i].SUP_NAME + "</td>");
						}
					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
						defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		
		function checkInfoFlag(checkBoxId){
			var flag=false;
			$(checkBoxId).each(function(){
				if($(this).attr("checked")){
				
					flag=true;
				}
			});
			return flag;
		}
		
		//保存在料站表界面选择的信息
		function addItemList(showId, backId) {
			if(checkInfoFlag("#addItemInfo :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
		}
		//全选
		function getAllItem() {
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
	</script>
	<script type="text/javascript">
		$(function(){
			getItemInfo();
		})
		
		function saveInfo(){
			var flag=false;
			var itemSns="";
			$("#addItemInfo :checkbox").each(function(){
				var addItemObj=$(this);
				if(addItemObj.attr("checked")) {
					flag=true;
					var itemSn = addItemObj.attr("id");
					itemSns += itemSn + ",";
				}
			});
			$("#itemSns").val(itemSns);
			console.log("itemSns=="+itemSns);
			return flag;
		}
		
		function saveInfoAll(){
		    var itemSns="";
			var flag=false;
			var len = $("#addItemInfo tr").length;
			if(len<= 0){
			return flag;}
			var startDate = $.trim($("#startDate").val());//入库开始时间
			var endDate = $.trim($("#endDate").val());//入库结束时间
			var itemSN = $.trim($("#paraMap1_WFI_SN").val());//物料SN
			var itemCode = $.trim($("#paraMap1_WFI_ITEM_CODE").val());//物料料号
			var whCode = $.trim($("#paraMap1_WFI_WH_CODE").val());//仓库
			var custCode = $.trim($("#paraMap1_WFI_CUST_CODE").val());//客户
			var supCode = $.trim($("#paraMap1_WFI_SUP_CODE").val());//供应商
			var lotNo = $.trim($("#paraMap1_WFI_LOT").val());//批次
			var productStartDate = $.trim($('#productStartDate').val());//生产开始时间
			var productEndDate = $.trim($('#productEndDate').val());//生产结束时间
			var connectDoc = $.trim($('#paraMap1_WSI_CONNECT_DOC').val());//关联单号
			var inspectSn = $.trim($('#paraMap1_QII_INSPECT_SN').val());//检验单号
			$.ajax({
			    url:"${path}buss/bussModel_exeFunc.ms?funcMId=99b05aee202c4af68849ad67661b7df0",
			    data:{
			        "type":"1",
				    "paraMap.startDate" : startDate,
				    "paraMap.endDate" : endDate,
				    "paraMap.itemSN" : itemSN,
				    "paraMap.itemCode" : itemCode,
				    "paraMap.whCode" : whCode,
				    "paraMap.custCode" : custCode,
				    "paraMap.supCode" : supCode,
				    "paraMap.lotNo" : lotNo,
				    "paraMap.productStartDate" : productStartDate,
				    "paraMap.productEndDate" : productEndDate,
				    "paraMap.connectDoc" : connectDoc,
				    "paraMap.inspectSn" : inspectSn,
			    },
			    type:"POST",
			    async: false,
			    success:function(data){
			        var list = data.ajaxPage.dataList;
			        if(list!=null&&list!=""){
			            flag = true;
			            for(var i=0;i<list.length;i++){
			                var itemSn = list[i].ITEM_SN;
			                itemSns += itemSn + ",";
			            }
			        }
			        $("#itemSns").val(itemSns);
			        console.log(itemSns);
			    },
			    error:function(msg){
			        util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
			    }
			});
			
			return flag;
		}
		
		function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=36eb52a12488495b9ede0040b658a2f9&formId=%{formId}";

	SearchItemInfo(paginationImpl,url);
}

function addInfo(){      
                        
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
                        var flag=saveInfo();
                        
                        //var len = $("#addItemInfo tr").length;
                        if(flag==false){
                          
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择物料信息" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=832aa2694233472e90a9618d0f806ebb";
                        document.forms.addForm.submit();
                        
}
function addInfoAll(){      
                        
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
                        var flag=saveInfoAll();
                        
                        //var len = $("#addItemInfo tr").length;
                        if(flag==false){
                         
                           utilsFp.confirmIcon(1,"","","", "<dict:lang value="请先查询数据" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
			var itemSns =  $("#itemSns").val();
			console.log(itemSns);
			document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=832aa2694233472e90a9618d0f806ebb";
            document.forms.addForm.submit();

                        
                        
}
$(function(){
    $("#productStartDate").val(timeBeginString());
    $("#productEndDate").val(timeEndString());
});
function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-30);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date;
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date;
    		}
function getEndDay(date1){
             //构造当前日期对象
           var date = new Date();
           var year = date.getFullYear();
            //获取当前月份
           var mouth = date.getMonth();
           var days;
           if (mouth == 2) {
               days = year %4 == 0 ? 29: 28;
           }else if(mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 ||mouth == 8 ||mouth == 8 ||mouth == 12){
               days = 31;
           }else{
               days = 30;
           }
           return Number(days)+Number(date1)-30;
        }
		
	</script>
	<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
	<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	</script>
	 <!--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>-->

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
