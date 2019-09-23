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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		function popItemDiv(showId, backId) {
		
			$("#itemWhCode_chosen").attr("style","width:200px;");
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
			addItemInfo();

		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
		//弹出物料选择界面
		function addItemInfo() {
			$("#itemSN").val("");//物料SN
			$("#itemCode").val("");//物料料号
			$("#itemWhCode").val("");//仓库
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6954&funcMId=31f832aeb5374d6eb587bda81bf53ec1",
				data: "",
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_SN == null) rccList[i].ITEM_SN = "";
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].WH_CODE == null) rccList[i].WH_CODE = "";
							if(rccList[i].WH_CODE_NAME == null) rccList[i].WH_CODE_NAME = "";
							if(rccList[i].ITEM_NUM == null) rccList[i].ITEM_NUM = "";
							$("#itemTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SN + "<input type='hidden' id='ITEM_SN" + (i + 1) + "' value='" + rccList[i].ITEM_SN + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: left;'>" + rccList[i].WH_CODE_NAME + "<input type='hidden' id='WH_CODE_NAME" + (i + 1) + "' value='" + rccList[i].WH_CODE_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;'>" + rccList[i].ITEM_NUM + "<input type='hidden' id='ITEM_NUM" + (i + 1) + "' value='" + rccList[i].ITEM_NUM + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:162px;text-align: center;'>" + rccList[i].WH_CODE + "<input type='hidden' id='WH_CODE" + (i + 1) + "' value='" + rccList[i].WH_CODE + "'/></td>");
						}

					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#itemTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('itemTable');

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
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			
			var itemSN = $.trim($("#itemSN").val());//物料料号
			var itemCode = $.trim($("#itemCode").val());//物料名称
			var itemWhCode = $.trim($("#itemWhCode").val());//物料规格
			
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F6955&funcMId=1e8500fa425b4ca7a70c7f28f1921545",
				data: "paraMap.type=1&paraMap.itemSN=" + itemSN + "&paraMap.itemCode=" + itemCode + "&paraMap.itemWhCode=" + itemWhCode + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_SN == null) rccList[i].ITEM_SN = "";
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].WH_CODE == null) rccList[i].WH_CODE = "";
							if(rccList[i].WH_CODE_NAME == null) rccList[i].WH_CODE_NAME = "";
							if(rccList[i].ITEM_NUM == null) rccList[i].ITEM_NUM = "";
							$("#itemTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;'>" + rccList[i].ITEM_SN + "<input type='hidden' id='ITEM_SN" + (i + 1) + "' value='" + rccList[i].ITEM_SN + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: left;'>" + rccList[i].WH_CODE_NAME + "<input type='hidden' id='WH_CODE_NAME" + (i + 1) + "' value='" + rccList[i].WH_CODE_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;'>" + rccList[i].ITEM_NUM + "<input type='hidden' id='ITEM_NUM" + (i + 1) + "' value='" + rccList[i].ITEM_NUM + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:162px;text-align: center;'>" + rccList[i].WH_CODE + "<input type='hidden' id='WH_CODE" + (i + 1) + "' value='" + rccList[i].WH_CODE + "'/></td>");
						}
					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#itemTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('itemTable');

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
			if(checkInfoFlag("#itemTbody :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			$("#paraMap1_WOD_ITEM_TYPE_chosen").attr("style","width:200px;");
			$("#paraMap1_WOD_ITEM_TYPE_chosen").attr("style","width:200px;");
			var len = $("#addItemInfo tr").length;
			$("#itemTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var addItemObjId=$(this).attr("id");
				if(addItemObj.attr("checked")) {
					addConfirm(addItemObjId,len);
					trrCount++;
					len = len + 1;

					//var tableTrJs = $("#itemInfo tbody tr");
					//_tongLineColor(tableTrJs);
					//clickTr('itemInfo');

				}
			})
			$("#itemTbody").empty();

			reSort("itemInfo");
			hideDiv(showId, backId);
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		function addConfirm(objId,len){
			$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:147px;text-align: left;'>"+$("#ITEM_SN"+objId).val()+"<input type='hidden' name='ITEM_SN' value='" + $("#ITEM_SN"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;'>"+$("#WH_CODE_NAME"+objId).val()+"<input type='hidden' name='WH_CODE_NAME' value='" + $("#WH_CODE_NAME"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;'>"+$("#ITEM_NUM"+objId).val()+"<input type='hidden' name='ITEM_NUM' value='" + $("#ITEM_NUM"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:147px;text-align: left;'>"+$("#ITEM_CODE"+objId).val()+"<input type='hidden' name='ITEM_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:147px;text-align: left;'>" + $("#ITEM_NAME"+objId).val() + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;'>" + $("#ITEM_SPEC"+objId).val() + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:150px;text-align: left;'>"+$("#WH_CODE"+objId).val()+"<input type='hidden' name='WH_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			var tableTrJs = $("#itemInfo tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('itemInfo');
		}
		$(function() {
			
		})

		function delRow() {
		    var flag=false;
			$("#itemInfo :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");

					$("#" + trid).remove();flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择单据明细" />", 0, "260", "");
				return;
			}
			reSort("itemInfo");
			var tableTrJs = $("#itemInfo tbody tr");
			//_tongLineColor(tableTrJs);
			clickTr('itemInfo');
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
	</script>
</head>
<body style="overflow: hidden;">
	<div class="edit">
		<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
			        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd"  style="height:550px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   <jsp:param name="location" value="editForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1aad990f8a774aeaa80d6b02a13a12ef" type="edit" />
	<div class="mod">
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="基本信息" /></h3>
	</div>
	<table class="basic-table" >
		<input type="hidden" id="docNum" name="docNum" value="" />
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="1aad990f8a774aeaa80d6b02a13a12ef" />
	<input type="hidden" name="1aad990f8a774aeaa80d6b02a13a12ef" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<s:set name="_$viewId" value="'29ed4a24dd3f4225b561c144f83e69c9'" />
	<s:set name="_$formId_1" value="'1aad990f8a774aeaa80d6b02a13a12ef'" />
	<s:set name="_$type" value="'edit'" />
	<tr>
		<td class="name" /><span class="dot">*</span>
		<bu:uitn colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" colNo="WSD_DOC_NUM" formId="1aad990f8a774aeaa80d6b02a13a12ef">
			<bu:ui colNo="WSD_DOC_NUM" style="width:200px;" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>

		<td class="name" /><span class="dot">*</span>
		<bu:uitn colNo="T2#WSD_DOC_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" colNo="T2#WSD_DOC_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef">
			<bu:ui colNo="T2#WSD_DOC_TYPE" style="width:200px;" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>

		<td class="name" />
		<bu:uitn colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" style="width:200px;" colNo="T2#WAD_SCARP_TYPE" formId="1aad990f8a774aeaa80d6b02a13a12ef">
			<bu:ui colNo="T2#WAD_SCARP_TYPE" style="width:200px;" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>

	</tr>
	<tr>
		<td class="name" />
		<bu:uitn colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" colNo="T2#WAD_WH_CODE" formId="1aad990f8a774aeaa80d6b02a13a12ef">
			<bu:ui colNo="T2#WAD_WH_CODE" style="width:200px;" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>
	
		<td class="name" />
		<bu:uitn colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" colNo="T2#WAD_CREATE_MAN" formId="1aad990f8a774aeaa80d6b02a13a12ef">
			<bu:ui colNo="T2#WAD_CREATE_MAN" style="width:200px;" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>

	</tr>
	<tr>
		<td class="name" />
		<bu:uitn colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" />
		</td>
		<bu:td cssClass="dec" colNo="T2#WAD_SCARP_REASON" formId="1aad990f8a774aeaa80d6b02a13a12ef" style="height:80px;" colspan="5">
			<bu:ui colNo="T2#WAD_SCARP_REASON" style="width:100%;height:100%" formId="1aad990f8a774aeaa80d6b02a13a12ef" dataId="${dataId}" formIndex="1" /></bu:td>

	</tr>
	</table>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="单据明细" /></h3>
			</div>
			<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料信息">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="width:858px;">
								<div class="datagrid-header-inner" style="width:100%;" id="datagrid-header-inner1">
									<table class="datagrid-htable fixedTable  " id="datagrid-htable" width="850px;">
										<tbody>
											<tr class="datagrid-header-row datagrid-title-ajax">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
												</td>
												<td class="datagrid-cell" style="width:147px;">
													<dict:lang value="物料SN" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="仓库" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="物料数量" />
												</td>
												<td class="datagrid-cell" style="width:147px;">
													<dict:lang value="物料料号" />
												</td>
												<td class="datagrid-cell" style="width:147px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:147px;">
													<dict:lang value="物料规格" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3" style="height:150px;width:858px;overflow-y: auto;overflow-x: hidden;">
								<table class="dlist-table table-line" style="width:858px;table-layout:fixed;" id="itemInfo">
									<tbody id="addItemInfo">
										<c:forEach items="${dataList}" var="item" varStatus="status">
											<tr id="${item.ID}" name="${item.ID}">
												<td  class='datagrid-cell datagrid-cell-1' style='width:30px;text-align:center;'>
													${status.count}
												</td>															      
												<td class='datagrid-cell datagrid-cell-2' style='text-align:center;width:30px;'>
													<input type='checkbox' name='isSelect1'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-3' style='width:147px;text-align:left;'>
													${item.ITEM_SN}<input type='hidden' name='ITEM_SN' value='${item.ITEM_SN}'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-4' style='width:120px;text-align:left;'>
													${item.WH_CODE_NAME}<input type='hidden' name='WH_CODE_NAME' value='${item.WH_CODE_NAME}'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-5' style='width:100px;text-align:right;'>
													${item.ITEM_NUM}<input type='hidden' name='ITEM_NUM' value='${item.ITEM_NUM}'/>
												</td>
												<td class='datagrid-cell datagrid-cell-6' style='width:147px;text-align:left;'>
													${item.ITEM_CODE}<input type='hidden' name='ITEM_CODE' value='${item.ITEM_CODE}'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-7' style='width:147px;text-align:left;'>
													${item.ITEM_NAME}<input type='hidden' name='ITEM_NAME' value='${item.ITEM_NAME}'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-8' style='width:147px;text-align:left;'>
													${item.ITEM_SPEC}<input type='hidden' name='ITEM_SPEC' value='${item.ITEM_SPEC}'/>
												</td>
												<td  class='datagrid-cell datagrid-cell-9' style='width:167px;text-align:left;'>
													${item.WH_CODE}<input type='hidden' name='WH_CODE' value='${item.WH_CODE}'/>
												</td>
											</tr>
						</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:870px;height:410px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择仓库物料" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItem('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<table class="basic-table">
				<tr>
					<td class="name" style="width: 100px;text-align: right;"/>
					<dict:lang value="物料/容器SN" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="itemSN" name="itemSN" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="物料料号" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit" /></td>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="仓库" />
					</td>
					<bu:td cssClass="dec" colNo="WAD_WH_CODE" formId="a0614fd913404e73a7141ce9ff13e439" >
						<bu:ui colNo="WAD_WH_CODE" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WAD_WH_CODE}" formIndex="1" id="itemWhCode" />
					</bu:td>
				</tr>
			</table>
			<div style="width:870px;height:30px;">
				<table width="870px" class="dlist-table table-line ">
					<thead>
						<tr>
							<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb" onchange="getAllItem();" /></th>
							<th class="datagrid-cell" style="width:150px;">
								<dict:lang value="物料SN" />
							</th>
							<th class="datagrid-cell" style="width:110px;">
								<dict:lang value="仓库" />
							</th>
							<th class="datagrid-cell" style="width:100px;">
								<dict:lang value="物料数量" />
							</th>
							<th class="datagrid-cell" style="width:150px;">
								<dict:lang value="物料料号" />
							</th>
							<th class="datagrid-cell" style="width:150px;">
								<dict:lang value="物料名称" />
							</th>
							<th class="datagrid-cell" style="width:149px;">
								<dict:lang value="物料规格" />
							</th>
						</tr>
					</thead>
				</table>
			</div>
			<div style="width:870px;height:280px;overflow-y: auto;overflow-x: hidden;">
				<table width="870px" style="table-layout:fixed" class="dlist-table table-line " id="itemTable">
					<tbody id="itemTbody">

					</tbody>

				</table>

			</div>
			<div style="background-color: white;margin-top:20px;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
	
			<bu:jsVal formId="1aad990f8a774aeaa80d6b02a13a12ef" formIndex="1" />		<div style="padding:1px;"></div>

		<!--<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="仓库报废单明细信息" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('1aad990f8a774aeaa80d6b02a13a12ef','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1aad990f8a774aeaa80d6b02a13a12ef','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner1aad990f8a774aeaa80d6b02a13a12ef">
								<bu:addSub formid="1aad990f8a774aeaa80d6b02a13a12ef" formIndex="2"  selfformid="1aad990f8a774aeaa80d6b02a13a12ef" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'1aad990f8a774aeaa80d6b02a13a12ef')" >
							<table class="glxb-table fixedTable" style="width:100%" id="addTable_1aad990f8a774aeaa80d6b02a13a12ef" >
								<tbody id="tbody_1aad990f8a774aeaa80d6b02a13a12ef" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>-->

				
			</div>
		 </form>
	</div>
	<bu:submit viewId="29ed4a24dd3f4225b561c144f83e69c9" />
	<bu:script viewId="29ed4a24dd3f4225b561c144f83e69c9" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			 $("#paraMapObj_WAD_CREATE_MAN_SHOW").css("border-color","#ccc");
			 $("#docNum").val($("#paraMapObj_WSD_DOC_NUM").val());
			 var tableTrJs = $("#itemInfo tbody tr");
			 _tongLineColor(tableTrJs);
			 clickTr('itemInfo');
		});
		
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
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
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
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
