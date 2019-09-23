<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_18" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<style type="text/css">
	#myTable .input {
		width:210px !important;
	}
</style>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="修改" />
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
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		function popItemDiv(showId, backId) {
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();

			addItemInfo();

		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}

		function popPoInfoDiv(showId, backId) {
			
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
			addPoInfo();

		}

		function hideDiv1(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
		//弹出料站表选择界面
		function addItemInfo() {
			$("#formId1_WOI_MODEL_CODE_SHOW").val("");//机种料号
			$("#formId1_WOI_PRO_FACE").val("");//面别
			$("#formId1_WOI_PRO_FACE").trigger("chosen:updated");
			$("#formId1_itemNum1").val("");//发料套数
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=8cd649ead303401d884df9d7f54a03bf",
				data: "",
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							$("#itemTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:202.5px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: right;padding-right:20px;' id='WOI_PLAN_NUM" + (i + 1) + "'></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CI_MIN_PACK + "'/></td>");
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
		//div料站信息分页
		var paginationImpl = {};

		function searchOutItem(paginationImpl) {
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var modelCode = $.trim($("#formId1_WOI_MODEL_CODE").val());//机种料号
			var proFace = $.trim($("#formId1_WOI_PRO_FACE").val());//面别
			if(modelCode!=""||proFace!="-1"){
				if(modelCode==""){
					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择机种料号 " />", 0, "260", "");
					return;
				}else{
					if(proFace=="-1"){
						utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择面别 " />", 0, "260", "");
						return;
					}
				}
			}
			var itemNum1 = $("#formId1_itemNum1").val();//发料套数
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=151a46a40d7e4c979a793cc39561c65a",
				data: "paraMap.type=1&paraMap.modelCode=" + modelCode + "&paraMap.proFace=" + proFace  + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							var tempNum="";
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(null!=itemNum1&&itemNum1!=""){
								tempNum=parseInt(itemNum1)*parseInt(rccList[i].CMD_POINT_NUM)+"";
							}
							$("#itemTable tbody:last").append("<tr id='tr1_" + ((currentPage - 1) * pageRecord + (i + 1)) + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:202.5px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: right;padding-right:20px;' id='WOI_PLAN_NUM" + (i + 1) + "'>"+tempNum+"</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CI_MIN_PACK + "'/></td>");
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
		//弹出div制令单选择界面
		function addPoInfo() {
			$("#formId2_WOI_MO_NUM_SHOW").val("");//制令单号
			$("#formId2_itemNum2").val("");//发料套数
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=6677deae497c44eab5edae052e8e88eb",
				data: "",
				success: function(data) {
					$("#poInfoTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							$("#poInfoTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:202.5px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: right;padding-right:20px;' id='WOI_PLAN_NUM" + (i + 1) + "'></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CI_MIN_PACK + "'/></td>");
						}

					}
					pageFun(data.ajaxPage, "formId2");
					var tableTrJs = $("#poInfoTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('poInfoTable');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		//div制令单信息分页
		var paginationImpl = {};

		function searchPoInfo(paginationImpl) {
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var moNum = $.trim($("#formId2_WOI_MO_NUM").val());//制令单
			var itemNum1 = $("#formId2_itemNum2").val();//发料套数
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=5854f273961c47b99bb249cd62d5ee49",
				data: "paraMap.type=1&paraMap.moNum=" + moNum  + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data) {
					$("#poInfoTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							var tempNum="";
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(null!=itemNum1&&itemNum1!=""){
								tempNum=parseInt(itemNum1)*parseInt(rccList[i].CMD_POINT_NUM)+"";
							}
							$("#poInfoTable tbody:last").append("<tr id='tr1_" + ((currentPage - 1) * pageRecord + (i + 1)) + "' ></tr>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:202.5px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:202.5px;text-align: right;padding-right:20px;' id='WOI_PLAN_NUM" + (i + 1) + "'>"+tempNum+"</td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#poInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CI_MIN_PACK + "'/></td>");
						}

					}
					pageFun(data.ajaxPage, "formId2");
					var tableTrJs = $("#poInfoTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('poInfoTable');

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
			if($("#formId1_itemNum1").val()==""){
				_alertValMsg($("#formId1_itemNum1"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			var len = $("#addItemInfo tr").length;
			$("#itemTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				if($("#WOI_PLAN_NUM" + addItemObj.attr("id")).text()!=""){
					planNum=$("#WOI_PLAN_NUM" + addItemObj.attr("id")).text();
				}
				var changeObj;
				if(addItemObj.attr("checked")) {
					$("#itemInfo tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2)) {
							planNum=parseInt(itemObj.find("td:eq(6)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
					});
					if(flagNum>0){
					    changeObj.find("td:eq(6)").text(planNum+"");
					    changeObj.find("td:eq(7) input").text(planNum+"");
					}else{
						var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>" + wmsOption + "</select>";
						$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+addItemObj.attr("id")).val()+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;'>" + planNum + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' value='" + planNum + "'/></td>");
						/*$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_" + (trrCount + 1) + "' name='PLAN_NUM' value=''/></td>");*/
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					}
					mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;

					var tableTrJs = $("#itemInfo tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('itemInfo');

				}
			})
			$("#itemTbody").empty();

			reSort("itemInfo");
			hideDiv(showId, backId);
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		//保存在制令单界面选择的信息
		function addPoInfoList(showId, backId) {
			if(checkInfoFlag("#poInfoTbody :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			if($("#formId2_itemNum2").val()==""){
				_alertValMsg($("#formId2_itemNum2"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			var len = $("#addItemInfo tr").length;
			$("#poInfoTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				if($("#WOI_PLAN_NUM" + addItemObj.attr("id")).text()!=""){
					planNum=$("#WOI_PLAN_NUM" + addItemObj.attr("id")).text();
				}
				var changeObj;
				if(addItemObj.attr("checked")) {
					$("#itemInfo tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2)) {
							planNum=parseInt(itemObj.find("td:eq(6)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
					});
					if(flagNum>0){
					    changeObj.find("td:eq(6)").text(planNum+"");
					    changeObj.find("td:eq(7) input").text(planNum+"");
					}else{
						var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>" + wmsOption + "</select>";
						$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#CI_MIN_PACK"+addItemObj.attr("id")).val()+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;'>" + planNum + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' value='" + planNum + "'/></td>");
						/*$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_" + (trrCount + 1) + "' name='PLAN_NUM' value=''/></td>");*/
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					}
					mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;
					var tableTrJs = $("#poInfoTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('poInfoTable');
					clickTr('itemInfo');

				}
			})
			$("#poInfoTbody").empty();

			reSort("itemInfo");
			hideDiv(showId, backId);
			//trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		var wmsOption;
		
		//获取仓库信息
		function getWmsSel() {
		    var dataAuth=$("#dataAuth").val();
		    var jsondata={"type":"showDetail","dataAuth":dataAuth};
		    console.log(dataAuth);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00",
				data: jsondata,
				success: function(data) {
					wmsOption = "<option value=''>--请选择--</option>";
					if(null == data) { return; }
					if(null != data.ajaxList) {
					    console.log(data.ajaxString);
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							wmsOption = wmsOption + "<option value='" + rccList[i].WA_AREA_SN + "'>" + rccList[i].WA_AREA_NAME + "</option>";
						}
					}
					getItem();

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
			var flag=false;
			$("#itemInfo :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");

					$("#" + trid).remove();
					
					flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择单据明细" />", 0, "260", "");
				return;
			}
			reSort("itemInfo");
			var tableTrJs = $("#itemInfo tbody tr");
			_tongLineColor(tableTrJs);
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
		//重置
		function resetInfo(formId){
			if(formId=="formId1"){
				var obj1="#formId1_WOI_MODEL_CODE_SHOW";
				var obj2="#formId1_WOI_PRO_FACE";
				var obj3="#formId1_itemNum1";
				$(obj1).val("");
				$(obj2).val("");
				$(obj3).val("");
				$("#itemTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});
			}else{
				var obj1="#formId2_WOI_MO_NUM_SHOW";
				var obj2="#formId2_itemNum2";
				$(obj2).val("");
				$(obj2).val("");
				$("#poInfoTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});
			}
		}
		//改变计划数量
		function OnInput(event,thisObj) {
		    var flag=false; 
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!/^-?\d*$/.test(newContent)){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入数字" />");
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
					$("#itemTbody tr:eq(" + i + ")").find("td:eq(5)").text(tempPlanNum);
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
					$("#poInfoTbody tr:eq(" + i + ")").find("td:eq(5)").text(tempPlanNum);
				}
			}
        }
		function OnInput2(event,thisObj) {
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!/^-?\d*$/.test(newContent)){
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
					/*var trLength=$("#poInfoTbody tr").length+1;
					for(var i=0;i<trLength;i++){
						var index=i+1;
						var tempNumId="#T2_CMD_POINT_NUM"+index;
						var tempPlanNum=parseInt(objVal)*parseInt($(tempNumId).val());
						$("#poInfoTbody tr:eq(" + i + ")").find("td:eq(6)").text(tempPlanNum);
					}*/
				}
			}
		}
	</script>
</head>

<body style="background-color: white;">
	<div class="edit">
		<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
		<div class="hd" style="display: none;">
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
		    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
    					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
    					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
		    </div>

		</div>
	<div class="bd" style="height:550px;">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_18" />
			<jsp:param name="location" value="editForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="bb156a44e6e242a885b3fde9386fd567" type="edit" />
		<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
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
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<table class="basic-table" id="myTable">
				<input type="hidden" id="docNum" name="docNum" value="" />
				<input type="hidden" name="formIds" value="bb156a44e6e242a885b3fde9386fd567" />
				<input type="hidden" name="formId" id="formId2" value='bb156a44e6e242a885b3fde9386fd502'/>
				<input type="hidden" name="bb156a44e6e242a885b3fde9386fd567" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<input type="hidden" name="dataAuth" id="dataAuth" value="${param.dataAuth}" />
				<s:set name="_$viewId" value="'894e251b081c48a69b7ce6033c957dc9'" />
				<s:set name="_$formId_1" value="'bb156a44e6e242a885b3fde9386fd567'" />
				<s:set name="_$type" value="'detail'" />
				<tr>
					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="WOI_DOC_NUM" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					<bu:td cssClass="dec" colNo="WOI_DOC_NUM" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="WOI_DOC_NUM" style="width:210px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T5#WDT_TYPE_NAME" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					<bu:td cssClass="dec" colNo="T5#WDT_TYPE_NAME" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="T5#WDT_TYPE_NAME" style="width:210px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					<bu:td cssClass="dec"  colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:210px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
				<tr>
					<td class="name" /><bu:uitn colNo="T2#WOD_OUTSTOCK_DATE" formId="bb156a44e6e242a885b3fde9386fd567" /></td>
					<bu:td cssClass="dec" colNo="T2#WOD_OUTSTOCK_DATE" formId="bb156a44e6e242a885b3fde9386fd567">
					<bu:ui colNo="T2#WOD_OUTSTOCK_DATE" style="width:210px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" /><bu:uitn colNo="T2#WOD_URGENT_FLAG" formId="bb156a44e6e242a885b3fde9386fd567" /></td>
			        <bu:td cssClass="dec" colNo="T2#WOD_URGENT_FLAG" formId="bb156a44e6e242a885b3fde9386fd567" >
			        <bu:ui colNo="T2#WOD_URGENT_FLAG" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" />
			        <bu:uitn colNo="T2#WOD_ERP_FLAG" formId="bb156a44e6e242a885b3fde9386fd567" />
			        <bu:ui colNo="T2#WOD_ERP_FLAG" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" />
			        </bu:td>
					
					
                    
                    <td class="name" />
					<bu:uitn colNo="T2#WOD_STATUS" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_STATUS" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="T2#WOD_STATUS" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>

				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_MEMO" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_MEMO" formId="bb156a44e6e242a885b3fde9386fd567" style="height:80px;" colspan="5">
						<bu:ui colNo="T2#WOD_MEMO" style="width:100%;height:100%" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>
                    					
                    <bu:td cssClass="dec" colNo="T2#WOD_PICK_TYPE" formId="bb156a44e6e242a885b3fde9386fd567" style="display:none;">
						<bu:ui colNo="T2#WOD_PICK_TYPE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
			</table>
			</div>
		<DIV id="content2" style="display:none" data-tab="tag2">
			<div class="extend-btn" id="addDel" style="display: none; float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择料站表">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="popPoInfoDiv('addPoInfo','backPoInfo');" style="padding:0;" title="选择制令单"><!--popPoInfoDiv('addPoInfo','backPoInfo');-->
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" style="width:100%;">
									<table class="datagrid-htable fixedTable  " id="datagrid-htablebb156a44e6e242a885b3fde9386fd502">
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
													<dict:lang value="项次" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="用量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="计划数量" />
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
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:430px;">
								<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502">
									<tbody id="addItemInfo">
										
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
		<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:870px;height:410px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择料站表" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId1');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<button type="button" onclick="searchOutItem('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<table class="basic-table">
				<tr>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="机种料号" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_MODEL_CODE" id="formId1_WOI_MODEL_CODE"  style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MODEL_CODE}" formIndex="1" /></td>
					<td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="面别" />&nbsp;
					</td>
					<td style="width: 205px;" />
						<select style="width:200px;" class="isSubmit input " id="formId1_WOI_PRO_FACE" name="WOI_PRO_FACE" >
						    <option value="-1">--请选择--</option>
						    <option value="0">单面</option>
						    <option value="1">正面</option>
						    <option value="2">反面</option>
						    <option value="3">阴阳面</option>
						</select>
					</td>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="发料套数" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text" placeholder="请输入发料套数" style="width: 200px;" id="formId1_itemNum1" name="itemNum1" class=" input isSubmit isaddSubmit" oninput="OnInput(event,'formId1_itemNum1')" onpropertychange="OnPropChanged(event)"/></td>
				</tr>
			</table>
			<div style="width:870px;height:30px;">
				<table width="870px" class="dlist-table table-line ">
					<thead>
						<tr>
							<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb" onchange="getAllItem();" /></th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料料号" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料名称" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料规格" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="计划数量" />
							</th>
						</tr>
					</thead>
				</table>
			</div>
			<div style="width:870px;height:310px;overflow-y: auto;overflow-x: hidden;">
				<table width="870px" style="table-layout:fixed" class="dlist-table table-line " id="itemTable">
					<tbody id="itemTbody">
					</tbody>

				</table>

			</div>
			<div style="background-color: white;margin-top:20px;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOutItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
	<div id="backPoInfo" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addPoInfo" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:870px;height:410px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择制令单" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPoInfo','backPoInfo');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<div class="optn optn_div">

				<!--<span class="txt" title="等于">开单时间</span>

				<input id="beginTime" name="" value="" style="width:200px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">

				<span class="txt">~</span>
				<input id="endTime" name="" value="" style="width:200px;margin-right:145px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">-->

				<button type="button" onclick="addPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addPoInfo','backPoInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId2');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<button type="button" onclick="searchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<table class="basic-table">
				<tr>
					<td class="name" />
					<dict:lang value="工单号" />
					</td>
					<td class="dec"><bu:ui colNo="WOI_MO_NUM" id="formId2_WOI_MO_NUM" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM}" formIndex="1" /></td>
					<td class="name" />
					<dict:lang value="发料套数" />
					</td>
					<td class="dec"><input type="text" style="width: 200px;" id="formId2_itemNum2" placeholder="请输入发料套数" name="itemNum2" class=" input isSubmit isaddSubmit" oninput="OnInput(event,'formId2_itemNum2')" onpropertychange="OnPropChanged(event)"/></td>
				</tr>
			</table>
			<div style="width:870px;height:30px;">
				<table width="870px" class="dlist-table table-line ">
					<thead>
						<tr>
							<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb" onchange="getAllPo();" /></th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料料号" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料名称" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="物料规格" />
							</th>
							<th style="width: 202.5px;text-align: center;">
								<dict:lang value="计划数量" />
							</th>
						</tr>
					</thead>
				</table>
			</div>
			<div style="width:870px;height:310px;overflow-y: auto;overflow-x: hidden;">
				<table width="870px" style="table-layout:fixed" class="dlist-table table-line " id="poInfoTable">
					<tbody id="poInfoTbody">
					</tbody>

				</table>

			</div>
			<div style="background-color: white;margin-top:20px;" id="pageDiv1">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPoInfo&formId=formId2&showLoading=0" />
			</div>
		</div>

	</div>
	<bu:jsVal formId="bb156a44e6e242a885b3fde9386fd567" formIndex="1" />

	</div>
	</form>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			//$("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
			$("#paraMap1_WOI_PRO_FACE_chosen").css("width","200px");
			$("#docNum").val($("#paraMapObj_WOI_DOC_NUM").val());
		  	getWmsSel();
			getItem();
		})
		
		
		//根据入库单号获取对应物料信息
		function getItem(){ 
		//console.log(itemUrl);
		    var pickType=$.trim(document.getElementById("paraMapObj_T2#WOD_PICK_TYPE").value);
		    
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: "buss/bussModel_exeFunc.ms?funcMId=180ceb236daf4bd2bf0ea90a133b7ee0"+"&docNum="+$("#paraMapObj_WOI_DOC_NUM").val()	+"&pickType="+pickType,
		    	data: "",
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
							if(rccList[i].ITEM_SPEC==null) rccList[i].ITEM_SPEC="";
							if(rccList[i].PLAN_NUM==null) rccList[i].PLAN_NUM="";
							if(rccList[i].MIN_PACK==null) rccList[i].MIN_PACK="";
							if(rccList[i].MO_NUMBER==null) rccList[i].MO_NUMBER="";
							if(rccList[i].MO_NUM==null) rccList[i].MO_NUM="";
							if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
							if(rccList[i].POINT_NUM==null) rccList[i].POINT_NUM="";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							if(rccList[i].WOI_REQUEST_NUM==null) rccList[i].WOI_REQUEST_NUM="0";
							if(rccList[i].WOI_EXCEED_NUM==null) rccList[i].WOI_EXCEED_NUM="0";
							var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData' style='width:120px;' disabled='disabled'>" + wmsOption + "</select>";
						
							var temp="<tr id='trr" + (trrCount + 1) + "' >"
							    	+"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>"
							    	+"<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+rccList[i].ITEM_CODE+"'>" + rccList[i].ITEM_CODE + "<input type='hidden' name='ITEM_CODE' value='" + rccList[i].ITEM_CODE + "'/></td>"
							    	+"<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+rccList[i].ITEM_NAME+"'>" + rccList[i].ITEM_NAME + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+rccList[i].ITEM_SPEC+"'>" + rccList[i].ITEM_SPEC + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-14' style='width:120px;text-align: center;' title='"+rccList[i].MO_NUM+"'>" + rccList[i].MO_NUM + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' title='"+rccList[i].ITEM_SEQ+"'>" + rccList[i].ITEM_SEQ + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+rccList[i].POINT_NUM+"'>" + rccList[i].POINT_NUM + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+rccList[i].PLAN_NUM+"'>" + rccList[i].PLAN_NUM + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' class=' input isSubmit' disabled='disabled' ' value='"+rccList[i].WOI_REQUEST_NUM+"'/></td>"
							    	+"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>" + rccList[i].WSI_ITEM_NUM + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' title='"+rccList[i].MEI_ITEM_COUNT+"'>" + rccList[i].MEI_ITEM_COUNT + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-14' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;'  class=' input isSubmit' disabled='disabled' '  value='"+rccList[i].WOI_EXCEED_NUM+"'/></td>"
							    	
							    	+"<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>"
							    	+"<td class='datagrid-cell datagrid-cell-13' style='width:150px;text-align: center;padding:0;'><input style='width:110px;padding:0;' disabled='disabled' name='DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].DELIVERY_DATE+"'/></td>"
							    	
							    	+"<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' value='" + rccList[i].PLAN_NUM + "'/></td>"
							    	+"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + rccList[i].MO_NUMBER + "'/></td>"
							    	+"</tr>"
							$("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502").append(temp);
							
							
							
							
							$("#wmsSel_"+(trrCount+1)).val(rccList[i].WH_CODE);
						//	$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
						//	$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
							trrCount++;
						}	
					
						var tableTrJs = $("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502');
						defTableWidthRewrite('bb156a44e6e242a885b3fde9386fd502');
					}
				
				},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    }
			});
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
		/*function checkVal(){  //标准包装数量   
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
			
		}*/
	</script>
	</script>
	<!-- js初始化方法 -->
	 <script type="text/javascript">
                 var parentWindow;
                    $(function(){
                         parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                         $('.dialog-bd',parent.document).css('background-color','#fff');
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
                
        
            
         </script>
<script>
	    (function($){
            $(window).on('load',function(){
            //setPopScroll('.scroll','.datagrid-header-inner');
             setPopScroll('.datagrid-body','.datagrid-header-inner');
    	  })
        })(jQuery)
     </script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
