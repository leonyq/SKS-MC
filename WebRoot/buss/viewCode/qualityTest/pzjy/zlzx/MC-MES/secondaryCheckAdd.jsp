<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
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
			        <button type="button" onclick="addInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        <button type="button" onclick="searchItemInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="eb13d75bea1f47be9f506048e71bd60d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="eb13d75bea1f47be9f506048e71bd60d" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="eb13d75bea1f47be9f506048e71bd60d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="itemSn" id="itemSn" value="" />
	<input type="hidden" name="inspectSn" id="inspectSn" value="" />
		<s:set name="_$viewId" value="'3c91b5b823204237bd1865b44f569d3b'" />
		<s:set name="_$formId_1" value="'eb13d75bea1f47be9f506048e71bd60d'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" />
			<dict:lang value="检验单号" /></div>
			</td>
			<bu:td cssClass="dec" colNo="QSC_INSPECT_NEWSN" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_INSPECT_NEWSN" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_INSPECT_NEWSN}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="QSC_ITEM_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" />
			</td>
			<bu:td cssClass="dec" colNo="QSC_ITEM_CODE" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_ITEM_CODE" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_ITEM_CODE}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="QSC_ITEM_SN" formId="eb13d75bea1f47be9f506048e71bd60d" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="QSC_ITEM_SN" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_ITEM_SN" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_ITEM_SN}" formIndex="1" /></bu:td>
	
		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="QSC_SUPPLIER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" />
			</td>
			<bu:td cssClass="dec" colNo="QSC_SUPPLIER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_SUPPLIER_CODE" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_SUPPLIER_CODE}" formIndex="1" /></bu:td>
	
			<td class="name" />
			<bu:uitn colNo="QSC_CUSTOMER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" />
			</td>
			<bu:td cssClass="dec" colNo="QSC_CUSTOMER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_CUSTOMER_CODE" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_CUSTOMER_CODE}" formIndex="1" /></bu:td>
	
	
	        <td class="name" />
			<bu:uitn colNo="QSC_STATE" formId="eb13d75bea1f47be9f506048e71bd60d" />
			</td>
			<bu:td cssClass="dec" colNo="QSC_STATE" formId="eb13d75bea1f47be9f506048e71bd60d">
				<bu:ui colNo="QSC_STATE" style="width:200px;" formId="eb13d75bea1f47be9f506048e71bd60d" value="%{QSC_STATE}" formIndex="1" /></bu:td>
	
		</tr>
		
		
	</table>
	
	<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
		<div class="panel datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="overflow-x:hidden;border:0;">
				<div class="datagrid-header">
					<div class="datagrid-header-inner head2" >
						<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:150px;display:none;">
										<!--<dict:lang value="检验单号" />-->
									</td>
									<td class="datagrid-cell" style="width:30px;"></td>
									<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
									</td>
										<td class="datagrid-cell" style="width:150px;display:none;">
										<!--<dict:lang value="检验单号" />-->
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="检验单号" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料SN" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="状态" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="检验结果" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料料号" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="物料数量" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="检验数量" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="损耗数量" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="不良数量" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="供应商" />
									</td>
									<td class="datagrid-cell" style="width:100px;">
										<dict:lang value="客户" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="所属单据" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="检验时间" />
									</td>
									<td class="datagrid-cell" style="width:80px;">
										<dict:lang value="检验人" />
									</td>
									<td class="datagrid-cell" style="width:80px;display:none;">
									<!--	<dict:lang value="检验单号" />-->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="datagrid-body datagrid-div3 scroll2" style="height:370px;">
					<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
						<tbody id="addItemInfo">
						</tbody>
					</table>
				</div>
				
			</div>
			<div style="background-color: white;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&type=1&formId=formId2&showLoading=0" />
			</div>
		</div>
	</div>
			<bu:jsVal formId="eb13d75bea1f47be9f506048e71bd60d" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	
	$(function(){
	    $('#paraMap1_QSC_ITEM_SN').attr('disabled',false);
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
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=886ae28d06ea44178f69e7910f85b702";//VM-二次送检新增 操作功能 加载检验母本信息
			var dataAuth=$("#deptLs_data_auth").val();
			var jsondata = { "flag":"empty","paraMap.type": "1","dataAuth":dataAuth};
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
				data: jsondata,
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].QIP_INSPECT_SN == null) rccList[i].QIP_INSPECT_SN = "";
							if(rccList[i].QIP_SN == null) rccList[i].QIP_SN = "";
							if(rccList[i].QIP_TEST_RESULT == null) rccList[i].QIP_TEST_RESULT = "";
							if(rccList[i].QIP_DOC_NUM == null) rccList[i].QIP_DOC_NUM = "";
							if(rccList[i].QIP_ITEM_NUM == null) rccList[i].QIP_ITEM_NUM = "0";
							if(rccList[i].QIP_TEST_NUM == null) rccList[i].QIP_TEST_NUM = "0";
							if(rccList[i].QIP_SCARP_NUM == null) rccList[i].QIP_SCARP_NUM = "0";
							if(rccList[i].QIP_ERROR_NUM == null) rccList[i].QIP_ERROR_NUM = "0";
							if(rccList[i].QIP_ITEM_CODE == null) rccList[i].QIP_ITEM_CODE = "";
							if(rccList[i].QIP_TEST_TIME == null){ rccList[i].QIP_TEST_TIME = "";}
							else{rccList[i].QIP_TEST_TIME=(rccList[i].QIP_TEST_TIME).replace("T"," ");}
							if(rccList[i].NAME == null) rccList[i].NAME = "";
							if(rccList[i].QII_LIST_FLAG == null) rccList[i].QII_LIST_FLAG = "";
							if(rccList[i].QII_CUST_CODE == null) rccList[i].QII_CUST_CODE = "";
							if(rccList[i].CUSTOMER == null) rccList[i].CUSTOMER = "";
							if(rccList[i].SUPPLIER_NAME == null) rccList[i].SUPPLIER_NAME = "";
							var tempResult="";
							if(rccList[i].QIP_TEST_RESULT=='') tempResult="<span></span>";
		 				    if(rccList[i].QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>OK</span>";
							if(rccList[i].QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>NG</span>";
							var tempResult2="";
							if(rccList[i].QII_LIST_FLAG=='') tempResult2="<span></span>";
		 				    if(rccList[i].QII_LIST_FLAG=='4') tempResult2="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>已审核</span>";
							if(rccList[i].QII_LIST_FLAG=='5') tempResult2="<span class='state' style='background-color:#4350f2;color:#FFFFFF;width:60px'>已撤销</span>";
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='display:none;width:150px;text-align: left;'><input type='hidden' id='itemIds' value=''/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:30px;text-align: center;' ><input id='"+(i + 1)+"' type='checkbox' name='isSelect1' value='" + rccList[i].QIP_INSPECT_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;display:none;text-align: center;' ></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].QIP_INSPECT_SN+"'>" + rccList[i].QIP_INSPECT_SN + "<input type='hidden' id='QIP_INSPECT_SN"+(i + 1)+"' value='" + rccList[i].QIP_INSPECT_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].QIP_SN+"'>" + rccList[i].QIP_SN + "<input type='hidden'   id='QIP_SN"+(i + 1)+"' value='" + rccList[i].QIP_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;' >" + tempResult2 + "<input type='hidden' id='QII_LIST_FLAG' value='" + rccList[i].QII_LIST_FLAG + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>" + tempResult + "<input type='hidden' id='QIP_TEST_RESULT' value='" + rccList[i].QIP_TEST_RESULT + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].QIP_ITEM_CODE+"'>" + rccList[i].QIP_ITEM_CODE + "<input type='hidden'  id='QIP_ITEM_CODE"+(i + 1)+"' value='" + rccList[i].QIP_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: right;'>" + rccList[i].QIP_ITEM_NUM + "<input type='hidden' id='QIP_ITEM_NUM' value='" + rccList[i].QIP_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: right;'>" + rccList[i].QIP_TEST_NUM + "<input type='hidden' id='QIP_TEST_NUM' value='" + rccList[i].QIP_TEST_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:80px;text-align: right;'>" + rccList[i].QIP_SCARP_NUM + "<input type='hidden' id='QIP_SCARP_NUM' value='" + rccList[i].QIP_SCARP_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;'>" + rccList[i].QIP_ERROR_NUM + "<input type='hidden' id='QIP_ERROR_NUM' value='" + rccList[i].QIP_ERROR_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:100px;text-align: left;' title='"+rccList[i].SUPPLIER_NAME+"'>" + rccList[i].SUPPLIER_NAME + "<input type='hidden' id='SUPPLIER_NAME' value='" + rccList[i].SUPPLIER_NAME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: left;' title='"+rccList[i].CUSTOMER+"'>" + rccList[i].CUSTOMER + "<input type='hidden' id='CUSTOMER' value='" + rccList[i].CUSTOMER + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;text-align: left;' title='"+rccList[i].QIP_DOC_NUM+"'>" + rccList[i].QIP_DOC_NUM + "<input type='hidden' id='QIP_DOC_NUM' value='" + rccList[i].QIP_DOC_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;text-align: center;'>" + rccList[i].QIP_TEST_TIME + "<input type='hidden' id='QIP_TEST_TIME' value='" + rccList[i].QIP_TEST_TIME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:80px;text-align: center;'>" + rccList[i].NAME + "<input type='hidden' id='NAME' value='" + rccList[i].NAME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:80px;text-align: left;display:none;'>" + rccList[i].QII_CUST_CODE + "<input type='hidden' id='QII_CUST_CODE"+(i+1)+"' value='" + rccList[i].QII_CUST_CODE + "'/></td>");
							
						}

					}
					pageFun(data.ajaxPage, "formId2");
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					//clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");

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
			
			var inspectSn = $.trim($("#paraMap1_QSC_INSPECT_NEWSN").val());//
			var itemCode = $.trim($("#paraMap1_QSC_ITEM_CODE").val());//入库结束时间
			var itemSn = $.trim($("#paraMap1_QSC_ITEM_SN").val());//物料SN
			var supCode = $.trim($("#paraMap1_QSC_SUPPLIER_CODE").val());//物料料号
			var custCode = $.trim($("#paraMap1_QSC_CUSTOMER_CODE").val());//仓库
			var state = $.trim($("#paraMap1_QSC_STATE").val());//仓库
			var dataAuth=$("#deptLs_data_auth").val();
			var jsondata = { "paraMap.type": "1", "paraMap.dataAuth": dataAuth, "paraMap.inspectSn":inspectSn,"paraMap.itemCode":itemCode,"paraMap.itemSn":itemSn,"paraMap.supCode":supCode,"paraMap.custCode":custCode,"paraMap.state":state,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				//data: "paraMap.type=1&paraMap.inspectSn=" +inspectSn+ "&paraMap.itemCode=" + itemCode+ "&paraMap.itemSn=" + itemSn
				//    + "&paraMap.supCode=" + supCode+ "&paraMap.custCode=" + custCode + "&paraMap.state=" + state + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				data:jsondata,
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						console.log(rccList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].QIP_INSPECT_SN == null) rccList[i].QIP_INSPECT_SN = "";
							if(rccList[i].QIP_SN == null) rccList[i].QIP_SN = "";
							if(rccList[i].QIP_TEST_RESULT == null) rccList[i].QIP_TEST_RESULT = "";
							if(rccList[i].QIP_DOC_NUM == null) rccList[i].QIP_DOC_NUM = "";
							if(rccList[i].QIP_ITEM_NUM == null) rccList[i].QIP_ITEM_NUM = "0";
							if(rccList[i].QIP_TEST_NUM == null) rccList[i].QIP_TEST_NUM = "0";
							if(rccList[i].QIP_SCARP_NUM == null) rccList[i].QIP_SCARP_NUM = "0";
							if(rccList[i].QIP_ERROR_NUM == null) rccList[i].QIP_ERROR_NUM = "0";
							if(rccList[i].QIP_ITEM_CODE == null) rccList[i].QIP_ITEM_CODE = "";
							if(rccList[i].QIP_TEST_TIME == null){ rccList[i].QIP_TEST_TIME = "";}
							else{rccList[i].QIP_TEST_TIME=(rccList[i].QIP_TEST_TIME).replace("T"," ");}
							if(rccList[i].NAME == null) rccList[i].NAME = "";
							if(rccList[i].QII_LIST_FLAG == null) rccList[i].QII_LIST_FLAG = "";
							if(rccList[i].QII_CUST_CODE == null) rccList[i].QII_CUST_CODE = "";
							if(rccList[i].CUSTOMER == null) rccList[i].CUSTOMER = "";
							if(rccList[i].SUPPLIER_NAME == null) rccList[i].SUPPLIER_NAME = "";
							var tempResult="";
							if(rccList[i].QIP_TEST_RESULT=='') tempResult="<span></span>";
		 				    if(rccList[i].QIP_TEST_RESULT=='1') tempResult="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>OK</span>";
							if(rccList[i].QIP_TEST_RESULT=='2') tempResult="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>NG</span>";
							var tempResult2="";
							if(rccList[i].QII_LIST_FLAG=='') tempResult2="<span></span>";
		 				    if(rccList[i].QII_LIST_FLAG=='4') tempResult2="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>已审核</span>";
							if(rccList[i].QII_LIST_FLAG=='5') tempResult2="<span class='state' style='background-color:#4350f2;color:#FFFFFF;width:60px'>已撤销</span>";
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='display:none;width:150px;text-align: left;'><input type='hidden' id='itemIds' value=''/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:30px;text-align: center;' ><input id='"+((currentPage - 1) * pageRecord + (i + 1))+"' type='checkbox' name='isSelect1' value='" + rccList[i].QIP_INSPECT_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;display:none;text-align: center;' ></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].QIP_INSPECT_SN+"'>" + rccList[i].QIP_INSPECT_SN + "<input type='hidden' id='QIP_INSPECT_SN"+((currentPage - 1) * pageRecord + (i + 1))+"' value='" + rccList[i].QIP_INSPECT_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].QIP_SN+"'>" + rccList[i].QIP_SN + "<input type='hidden'  id='QIP_SN"+(i + 1)+"' value='" + rccList[i].QIP_SN + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;' >" + tempResult2 + "<input type='hidden' id='QII_LIST_FLAG' value='" + rccList[i].QII_LIST_FLAG + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;'>" + tempResult + "<input type='hidden' id='QIP_TEST_RESULT' value='" + rccList[i].QIP_TEST_RESULT + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].QIP_ITEM_CODE+"'>" + rccList[i].QIP_ITEM_CODE + "<input type='hidden'  id='QIP_ITEM_CODE"+(i + 1)+"' value='" + rccList[i].QIP_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: right;'>" + rccList[i].QIP_ITEM_NUM + "<input type='hidden' id='QIP_ITEM_NUM' value='" + rccList[i].QIP_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: right;'>" + rccList[i].QIP_TEST_NUM + "<input type='hidden' id='QIP_TEST_NUM' value='" + rccList[i].QIP_TEST_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:80px;text-align: right;'>" + rccList[i].QIP_SCARP_NUM + "<input type='hidden' id='QIP_SCARP_NUM' value='" + rccList[i].QIP_SCARP_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: right;'>" + rccList[i].QIP_ERROR_NUM + "<input type='hidden' id='QIP_ERROR_NUM' value='" + rccList[i].QIP_ERROR_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:100px;text-align: left;' title='"+rccList[i].SUPPLIER_NAME+"'>" + rccList[i].SUPPLIER_NAME + "<input type='hidden' id='SUPPLIER_NAME' value='" + rccList[i].SUPPLIER_NAME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: left;' title='"+rccList[i].CUSTOMER+"'>" + rccList[i].CUSTOMER + "<input type='hidden' id='CUSTOMER' value='" + rccList[i].CUSTOMER + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;text-align: left;' title='"+rccList[i].QIP_DOC_NUM+"'>" + rccList[i].QIP_DOC_NUM + "<input type='hidden' id='QIP_DOC_NUM' value='" + rccList[i].QIP_DOC_NUM + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;text-align: center;'>" + rccList[i].QIP_TEST_TIME + "<input type='hidden' id='QIP_TEST_TIME' value='" + rccList[i].QIP_TEST_TIME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:80px;text-align: center;'>" + rccList[i].NAME + "<input type='hidden' id='NAME' value='" + rccList[i].NAME + "'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:80px;text-align: left;display:none;'>" + rccList[i].QII_CUST_CODE + "<input type='hidden' id='QII_CUST_CODE"+((currentPage - 1) * pageRecord + (i + 1))+"' value='" + rccList[i].QII_CUST_CODE + "'/></td>");
							
						}
					}
					pageFun(data.ajaxPage, "formId2");
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
				//	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");

				},
				error: function(msg) {
					util.closeLoading();
					console.log(msg);
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
			var flag="false";
			var flag1="false";
			var itemSn="";
			var custOrSupCode="";
			var itemCode="";
			var inspectSn="";
			$("#addItemInfo :checkbox").each(function(){
				var addItemObj=$(this);
				if(addItemObj.attr("checked")) {
					flag1="true";
					var index = addItemObj.attr("id");
					var tempCustOrSupCode=$("#QII_CUST_CODE"+index).val();
					var tempItemCode=$("#QIP_ITEM_CODE"+index).val();
					
					if(itemCode==""){
						itemCode=$("#QIP_ITEM_CODE"+index).val();
					}else{
						if(itemCode!=tempItemCode){
							flag="itemCodeFalse";
							return false;
						}
					}
					
					if(custOrSupCode==""){
						custOrSupCode=$("#QII_CUST_CODE"+index).val();
					}else{
						if(custOrSupCode!=tempCustOrSupCode){
							flag="CustOrSupFalse";
							return false;
						}
					}
					
					var tempSn=$("#QIP_SN"+index).val();
					var tempInspectSn=$("#QIP_INSPECT_SN"+index).val();
					if(itemSn.indexOf(tempSn)==-1){
					    itemSn += tempSn + ",";
					    inspectSn += tempInspectSn + ",";
					}
				}
			});
			
			$("#itemSn").val(itemSn);
			$("#inspectSn").val(inspectSn);
			if(flag1=="true"){
				if(flag!="CustOrSupFalse"&&flag!="itemCodeFalse"){
					flag="true";
				}
			}
			return flag;
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
            
            if(flag=="false"){
              
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="请勾选样本信息" />",0,"260","");
               return;
            }
            if(flag=="itemCodeFalse"){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="样本料号不一致" />",0,"260","");
               return;
            }
            if(flag=="CustOrSupFalse"){
              
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="样本所属供应商/客户不一致" />",0,"260","");
               return;
            }
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=11161b3afee54717830a70b27c20d3f1";
            document.forms.addForm.submit();
                        
	}
	function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=b102269998624f41a439d6b20c9e8418&formId=%{formId}";//VM-二次送检新增 操作功能 检验母本信息分页
	    SearchItemInfo(paginationImpl,url);
    }
		
</script>
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll2','.head2');
  })
})(jQuery)
</script>
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
</body>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
 	 <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="jsLoading" />
</jsp:include>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
