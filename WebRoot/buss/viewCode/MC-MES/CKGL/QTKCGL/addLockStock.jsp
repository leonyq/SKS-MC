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
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
			    	    
		    	       <%-- <button type="button" onclick="lockStock();"><i class="ico ico-save"></i><dict:lang value="锁定1" /></button>--%>
		    	       <button type="button" onclick="lockStock();"><i class="ico ico-save"></i><dict:lang value="锁定" /></button>
			        	<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        	<button type="button" onclick="searchItemInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="29d173bbeb2e407e98fbdeee2354c721" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="projectIds" id="projectIds" value="" />
	<input type="hidden" name="itemInfos" id="itemInfos" value="" />
	<input type="hidden" name="formIds" value="29d173bbeb2e407e98fbdeee2354c721" />
	<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
	<input type="hidden" name="29d173bbeb2e407e98fbdeee2354c721" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'21f37898ada040db86da6b7b41eb7308'" />
		<s:set name="_$formId_1" value="'29d173bbeb2e407e98fbdeee2354c721'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:60px;" /><bu:uitn colNo="WLD_PROJECT_ID" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WLD_PROJECT_ID" formId="29d173bbeb2e407e98fbdeee2354c721" ><bu:ui colNo="WLD_PROJECT_ID" formId="29d173bbeb2e407e98fbdeee2354c721"  formIndex="1" /></bu:td>
		
			<td class="name"  style="width:60px;"/><bu:uitn colNo="WLD_STOCK_STATUS" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WLD_STOCK_STATUS" formId="29d173bbeb2e407e98fbdeee2354c721" ><bu:ui colNo="WLD_STOCK_STATUS" formId="29d173bbeb2e407e98fbdeee2354c721" formIndex="1" /></bu:td>
			
			<td class="name" style="width:140px;" /><bu:uitn colNo="WLD_BAD_FLAG" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<bu:td cssClass="dec"  style="width:30px;" colNo="WLD_BAD_FLAG" formId="29d173bbeb2e407e98fbdeee2354c721" ><bu:ui colNo="WLD_BAD_FLAG" formId="29d173bbeb2e407e98fbdeee2354c721" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	
	<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
		<div class="panel datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
				<div class="datagrid-header" >
					<div class="datagrid-header-inner">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:30px;"></td>
									<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="制令单号" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料料号" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="齐套状态" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料名称" />
									</td>
									<td class="datagrid-cell" style="width:150px;">
										<dict:lang value="物料规格" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="用量" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="总需求数量" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="仓库数量" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="可锁定数量" />
									</td>
									<td class="datagrid-cell" style="width:90px;">
										<dict:lang value="齐套套数" />
									</td>
									<td class="datagrid-cell" style="display:none;width:90px;">
										<dict:lang value="" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="datagrid-body datagrid-div3 scroll" style="height:352px;">
					<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
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
			<bu:jsVal formId="29d173bbeb2e407e98fbdeee2354c721" formIndex="1" />
									
			</div>
	</form>	
	</div>
    <bu:submit viewId="21f37898ada040db86da6b7b41eb7308" />
	<bu:script viewId="21f37898ada040db86da6b7b41eb7308" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	<script type="text/javascript">
		//选中行
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
		//getItemInfo();
		function getItemInfo() {
			var projectId = $("#paraMapObj_WLD_PROJECT_ID").val();
			var itemStatus = $("#paraMapObj_WLD_STOCK_STATUS").val();
	
			util.showLoading("处理中...");
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=2208a9a5900f48279ed171c1fe9bd095";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
				data: {
				    "projectId" : projectId,
				    "itemStatus" : itemStatus,
				    "paraMap.type" : 1
				    
				},
				//data: "paraMap.type=1",
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							
							var tempStatus = "";
							if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
							if(rccList[i].PM_MO_NUMBER==null)  rccList[i].PM_MO_NUMBER="";
							if(rccList[i].CBD_ITEM_CODE==null)  rccList[i].CBD_ITEM_CODE="";
							if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
							if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
							if(rccList[i].NEEDNUM==null)  rccList[i].NEEDNUM="0";
							if(rccList[i].CBD_ITEM_NUM==null)  rccList[i].CBD_ITEM_NUM="0";
							if(rccList[i].WSI_ITEM_NUM==null)  rccList[i].WSI_ITEM_NUM="0";
							if(rccList[i].GNUM==null)  rccList[i].GNUM="0";
							if(rccList[i].COMPLETE_NUM==null)  rccList[i].COMPLETE_NUM="0";
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].PM_MO_NUMBER+"' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].PM_MO_NUMBER+"'>"+rccList[i].PM_MO_NUMBER+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].CBD_ITEM_CODE+"'>"+rccList[i].CBD_ITEM_CODE+"</td>");
							if(rccList[i].ITEM_STATUS=='1') tempStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
							if(rccList[i].ITEM_STATUS=='2') tempStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' title='"+rccList[i].ITEM_STATUS+"'>"+tempStatus+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].CBD_ITEM_NUM+"'>"+rccList[i].CBD_ITEM_NUM+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].NEEDNUM+"'>"+rccList[i].NEEDNUM+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</td>");
							if(parseInt(rccList[i].GNUM)<0){
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='0'>"+0+"</td>");
							}else{
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='"+rccList[i].GNUM+"'>"+rccList[i].GNUM+"</td>");
							}
							if(parseInt(rccList[i].COMPLETE_NUM)<0){
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='0'>"+0+"</td>");
							}else{
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
							}
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
						    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;display:none;' id='status' title='"+rccList[i].ITEM_STATUS+"'>"+rccList[i].ITEM_STATUS+"</td>");
						    
						}
					}
					pageFun(data.ajaxPage, "formId2");
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

		function searchItemInfo(paginationImpl) {
            var projectId = $("#paraMapObj_WLD_PROJECT_ID").val();
            if(projectId==""){
              utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择制令单" />",0,"260","");
                   return;
            }
			var url = "${path}buss/bussModel_exeFunc.ms?funcMId=965bc396d2184eb3a5ceea21975fda5a";
			util.showLoading("处理中...");
			
			var itemStatus = $("#paraMapObj_WLD_STOCK_STATUS").val();
			var badFlag = "N";
			if($("#paraMapObj_WLD_BAD_FLAG_1").attr("checked")=="checked"){
			    badFlag = "Y";
			}
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: {
				    "paraMap.type" : 1,
				    "paraMap.projectId" : projectId,
				    "paraMap.itemStatus" : itemStatus,
				    "paraMap.badFlag" : badFlag,
				    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
				},
				
				//data: "paraMap.type=1&paraMap.projectId=" +projectId+ "&paraMap.itemStatus=" + itemStatus + "&paraMap.badFlag=" + badFlag + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data) {
					$("#addItemInfo").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							var tempStatus = "";
							if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
							if(rccList[i].PM_MO_NUMBER==null)  rccList[i].PM_MO_NUMBER="";
							if(rccList[i].CBD_ITEM_CODE==null)  rccList[i].CBD_ITEM_CODE="";
							if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
							if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
							if(rccList[i].NEEDNUM==null)  rccList[i].NEEDNUM="0";
							if(rccList[i].CBD_ITEM_NUM==null)  rccList[i].CBD_ITEM_NUM="0";
							if(rccList[i].WSI_ITEM_NUM==null)  rccList[i].WSI_ITEM_NUM="0";
							if(rccList[i].GNUM==null)  rccList[i].GNUM="0";
							if(rccList[i].COMPLETE_NUM==null)  rccList[i].COMPLETE_NUM="0";
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].PM_MO_NUMBER+"' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].PM_MO_NUMBER+"'>"+rccList[i].PM_MO_NUMBER+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].CBD_ITEM_CODE+"'>"+rccList[i].CBD_ITEM_CODE+"</td>");
							if(rccList[i].ITEM_STATUS=='1') tempStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
							if(rccList[i].ITEM_STATUS=='2') tempStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' title='"+rccList[i].ITEM_STATUS+"'>"+tempStatus+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].CBD_ITEM_NUM+"'>"+rccList[i].CBD_ITEM_NUM+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].NEEDNUM+"'>"+rccList[i].NEEDNUM+"</td>");
							$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</td>");
							if(parseInt(rccList[i].ITEM_NUM)<0){
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='0'>"+0+"</td>");
							}else{
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='"+rccList[i].GNUM+"'>"+rccList[i].GNUM+"</td>");
							}
							if(parseInt(rccList[i].COMPLETE_NUM)<0){
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='0'>"+0+"</td>");
							}else{
							    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
							}
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
							//$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
						    $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;display:none;' id='status' title='"+rccList[i].ITEM_STATUS+"'>"+rccList[i].ITEM_STATUS+"</td>");
						    
						}
					}else{
					    utilsFp.confirmIcon(3,"","","", "<dict:lang value="制令单已锁定" />",0,"260","");
                        return;
					}
					pageFun(data.ajaxPage, "formId2");
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
		
		function saveInfo(){
			var flag=false;
			var projectIds="";
			var itemInfos="";
			$("#addItemInfo :checkbox").each(function(){
				var addItemObj=$(this);
				if(addItemObj.attr("checked")) {
					flag=true;
					var index=addItemObj.parent().parent().index();
					var projectId = addItemObj.attr("id")+",";
					var itemCode=$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:eq(" + index + ")").find("td:eq(3)").text();
					var itemNum=$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:eq(" + index + ")").find("td:eq(8)").text();
					var itemInfo="";
					if(projectIds.indexOf(projectId)==-1){
					    projectIds += projectId;
					    if(itemInfos!=""){
					        itemInfo +=",";
					    }
    					itemInfo += itemCode+"/";
    					itemInfo += itemNum;
    					itemInfos+=itemInfo;
					}else{
					    itemInfo +="|";
    					itemInfo += itemCode+"/";
    					itemInfo += itemNum;
    					itemInfos+=itemInfo;
					}
				}
			});
			$("#projectIds").val(projectIds);
			$("#itemInfos").val(itemInfos);
			return flag;
		}
		function saveInfo2(){
			var flag=true;
			var projectIds="";
			$("#addItemInfo :checkbox").each(function(){
				var addItemObj=$(this);
				if(addItemObj.attr("checked")) {
				    var index=addItemObj.parent().parent().index();
				    var statusVal=$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:eq(" + index + ")").find("td:eq(12)").text();
				    if(statusVal=="2"){
				        flag=false;
				        return false;
				    }
				}
			});
			return flag;
		}
		function lockStock(){
    		    var flag=saveInfo();
                if(flag==false){
                   utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择物料信息" />",0,"260","");
                   return;
                }
                var flag2=saveInfo2();
                if(flag2==false){
                   utilsFp.confirmIcon(3,"","","", "<dict:lang value="制令单未齐套" />",0,"260","");
                   return;
                }
                document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=0754a5d1ab294b33bb0cbfdcf75500db";
                document.forms.editForm.submit();
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
		//$(function(){
			//getItemInfo();
		//})
	</script>
	<script>
		(function($){
  			$(window).on('load',function(){
   				setPopScroll('.scroll','.datagrid-header-inner');
   				
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

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
    <script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
