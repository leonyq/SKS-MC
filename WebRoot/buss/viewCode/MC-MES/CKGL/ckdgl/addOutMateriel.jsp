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
		<dict:lang value="新增" />
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
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		var listEmptyFlag="";
		var listEmptyFlag2="";
		var listEmptyFlag3="";
		var typeFlag="";
		function popItemDiv(showId, backId) {
		    typeFlag="1";
			$("#" + showId + ",#" + backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
            listEmptyFlag		 = "true";
			addItemInfo();
		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}

		function popPoInfoDiv(showId, backId) {
			typeFlag="2";
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable({cancel:'.dialog-bd-div'});
			listEmptyFlag2		 = "true";
			addPoInfo();

		}

		function hideDiv1(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
		
		function popBomInfoDiv(showId, backId) {
		    typeFlag="3";
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable({cancel:'.dialog-bd-div'});
            listEmptyFlag3		 = "true";
			addBomInfo();
		}
		//弹出料站表选择界面
		function addItemInfo() {
		    $("#formId1_WOD_MO_NUM_SHOW").val("");//制令单
		    $("#formId1_WOD_MO_NUM_SHOW").val("");//制令单
			$("#formId1_WOD_PRO_FACE_chosen").css("width","200");
			$("#formId1_WOD_PRO_FACE").val("");//面别
			$("#formId1_WOD_PROJECT_ID").val("");//工单号
			$("#formId1_WOD_MODEL_CODE").val("");//机种料号
			$("#WOI_MO_PLANNUM2").val("");
			$("#WOI_MO_PLANNUM1").val("");
			$("#WOI_CUM_NUM1").val("");
			$("#formId1_WOD_PRO_FACE").trigger("chosen:updated");
			$("#formId1_itemNum1").val("");//发料套数
			$("#itemTbody").empty();
			util.showLoading("处理中...");
			var getOutItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=8cd649ead303401d884df9d7f54a03bf&formId=%{formId}&type=empty";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getOutItemUrl,
				data: "",
				success: function(data) {
				    
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:202.5px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:202.5px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;' ><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' ' id='WOD_PLAN_NUM" + (i + 1) + "'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						}
                        if(listEmptyFlag == "true"){
                            $("#itemTbody").empty();
                        }else{
                            listEmptyFlag="false";
                        }
					}
					pageFun(data.ajaxPage, "formId3");
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003');
                    defTableWidthRewrite('b1001c913da94c22b6e93cf7148da003');
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
			
		}
		//div料站信息分页
		var paginationImpl = {};

		function SearchOutItemInfo(url) {
		    listEmptyFlag="false";
		
			var modelCode = $.trim($("#formId1_WOD_MODEL_CODE").val());//机种料号
			var proFace = $.trim($("#formId1_WOD_PRO_FACE").val());//面别
			var moNum = $.trim($("#formId1_WOD_MO_NUM").val());//制令单
			if(moNum!=""||proFace!="-1"){
				if(moNum==""){
					//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择制令单号" />", 0, "260", "");
					//return;
					moNum="-1";
				}else{
					if(proFace=="-1" || proFace==""){
						utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="制令单未维护面别" />", 0, "260", "");
						proFace="empty";
						return;
						//proFace="-1";
					}
				}
			}
			var itemNum1 = $("#formId1_itemNum1").val();//发料套数
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: "paraMap.type=1" + "&paraMap.proFace=" + proFace + "&paraMap.moNum=" + moNum ,
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
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							if(null!=itemNum1&&itemNum1!=""){
								tempNum=parseInt(itemNum1)*parseInt(rccList[i].CMD_POINT_NUM)+"";
							}
							$("#itemTbody").append("<tr id='tr1_" + (i + 1)+ "' ><input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></tr>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:162px;text-align: right;'>" + rccList[i].CMD_POINT_NUM + "</td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;' ><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' ' id='WOD_PLAN_NUM" + (i + 1) + "' value='"+tempNum+"'/></td>");
							
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						    
						}

					}
					//addAllItemInfo(modelCode,proFace,moNum);
					pageFun(data.ajaxPage, "formId3");
					var tableTrJs = $("#itemTbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003');
				    defTableWidthRewrite('b1001c913da94c22b6e93cf7148da003');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		
		//弹出div制令单选择界面
		function addPoInfo() {
	
		var getMoNumUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=6677deae497c44eab5edae052e8e88eb&formId=%{formId}&type=empty";
			$("#formId2_WOD_MO_NUM_SHOW").val("");//制令单号
			$("#formId2_itemNum2").val("");//发料套数
			$("#formId2_WOD_PROJECT_ID").val("");//工单号
			$("#formId2_WOD_MODEL_CODE").val("");//机种料号
			$("#WOI_MO_PLANNUM2").val("");
			$("#WOI_CUM_NUM2").val("");
			
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getMoNumUrl,
				data: "",
				success: function(data) {
					$("#poInfoTbody").empty();
					util.closeLoading();
					
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tbody:last").append("<tr onclick='clickTr()' id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;'>" + rccList[i].CMD_POINT_NUM + "<input type='hidden' id='CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:162px;text-align: right;'><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' '  id='WOD_PLAN_NUM" + (i + 1) + "'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						}
                        if(listEmptyFlag2 == "true"){
                            $("#poInfoTbody").empty();
                        }else{
                            listEmptyFlag2="false";
                        }
					}
				//	pageFun(data.ajaxPage,"formId4");
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tbody tr");
					_tongLineColor(tableTrJs);
					//clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da004');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		
		function clickTr(){
		    return false;
		}
		
		//div制令单信息分页
		var paginationImpl = {};

		function SearchPoInfo(url) {	
            listEmptyFlag2="false";
			var moNum = $.trim($("#formId2_WOD_MO_NUM_SHOW").val());//制令单
			var itemNum1 = $("#formId2_itemNum2").val();//发料套数
			if(moNum==""){
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择制令单号" />", 0, "260", "");
				//return;
				moNum="-1";
			}
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: "paraMap.type=1&paraMap.moNum=" + moNum ,
				success: function(data) {
					$("#poInfoTbody").empty();
					util.closeLoading();
					;
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
					
						for(var i = 0; i < rccList.length; i++) {
							var tempNum="";
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							if(null!=itemNum1&&itemNum1!=""){
								tempNum=parseInt(itemNum1)*parseInt(rccList[i].CMD_POINT_NUM)+"";
							}
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tbody:last").append("<tr id='tr1_" +  (i + 1) + "' ></tr>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;'>" + rccList[i].CMD_POINT_NUM + "<input type='hidden' id='CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:162px;text-align: right;' ><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' ' id='WOD_PLAN_NUM" + (i + 1) + "'  value='"+tempNum+"'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						    
						    //console.log("查看得知：：："+rccList[i].MEI_ITEM_COUNT);
						}

					}
				//	addAllPoInfo(moNum);
				//	pageFun(data.ajaxPage,"formId4");
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004 tbody tr");
					_tongLineColor(tableTrJs);
				//	clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da004');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		//机种BOM
		//弹出div机种BOM选择界面
		function addBomInfo() {
		var getMoNumUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=3492c6e771864c7b9a69836309b6c68f&formId=%{formId}&type=empty";
			$("#formId3_WOI_BOM_CODE_SHOW").val("");//制令单号
			$("#formId3_itemNum3").val("");//发料套数
			$("#formId3_WOI_BOM_NAME").val("");//工单号
			$("#formId3_WOI_BOM_SPEC").val("");//机种料号
			
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getMoNumUrl,
				data: "",
				success: function(data) {
					$("#bomInfoTbody").empty();
					util.closeLoading();
					
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:162px;text-align: right;'>" + rccList[i].CMD_POINT_NUM + "<input type='hidden' id='CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							//$("#bomInfoTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: right;padding-right:20px;' id='WOD_PLAN_NUM" + (i + 1) + "'></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;'><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' '  id='WOD_PLAN_NUM" + (i + 1) + "'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						}
                        if(listEmptyFlag3 == "true"){
                            $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005").empty();
                        }else{
                            listEmptyFlag3="false";
                        }
					}
				//	pageFun(data.ajaxPage, "formId5");
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da005');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		
		//div制令单信息分页
		var paginationImpl = {};

		function SearchBomInfo(url) {	
            listEmptyFlag3="false";
			var bomCode = $.trim($("#formId3_WOI_BOM_CODE").val());//机种BOM
			var itemNum1 = $("#formId3_itemNum3").val();//发料套数
			if(bomCode==""){
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择制令单号" />", 0, "260", "");
				//return;
				bomCode="-1";
			}
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: "paraMap.type=1&paraMap.bomCode=" + bomCode ,
				success: function(data) {
					$("#bomInfoTbody").empty();
					util.closeLoading();
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
					
						for(var i = 0; i < rccList.length; i++) {
							var tempNum="";
							if(rccList[i].CMD_ITEM_CODE == null) rccList[i].CMD_ITEM_CODE = "";
							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
							if(rccList[i].CMD_POINT_NUM == null) rccList[i].CMD_POINT_NUM = "0";
							if(rccList[i].PROJECT_ID == null) rccList[i].PROJECT_ID = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
							if(rccList[i].WSI_ITEM_NUM==null) rccList[i].WSI_ITEM_NUM="0";
							if(null!=itemNum1&&itemNum1!=""){
								tempNum=parseInt(itemNum1)*parseInt(rccList[i].CMD_POINT_NUM)+"";
							}
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tbody:last").append("<tr id='tr1_" +  (i + 1) + "' ></tr>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' checked='checked' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].CMD_ITEM_CODE + "<input type='hidden' id='CMD_ITEM_CODE" + (i + 1) + "' value='" + rccList[i].CMD_ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' id='CI_ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' id='CI_ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:162px;text-align: right;'>" + rccList[i].CMD_POINT_NUM + "<input type='hidden' id='CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: right;' ><input style='padding:0;width:152px;' name='WOD_PLAN_NUM' class=' input isSubmit' ' id='WOD_PLAN_NUM" + (i + 1) + "'  value='"+tempNum+"'/></td>");
							
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='T1_CMD_POINT_NUM" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='PROJECT_ID" + (i + 1) + "' value='" + rccList[i].PROJECT_ID + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CI_MIN_PACK" + (i + 1) + "' value='" + rccList[i].CMD_POINT_NUM + "'/></td>");
						
						    $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MEI_ITEM_COUNT" + (i + 1) + "' value='" + rccList[i].MEI_ITEM_COUNT + "'/></td>");
						    
						    //console.log("查看得知：：："+rccList[i].MEI_ITEM_COUNT);
						}

					}
				//	addAllPoInfo(moNum);
					//pageFun(data.ajaxPage, "formId5");
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da005');

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
		    if(listEmptyFlag==	"true"){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请输入制令单号查询" />", 0, "260", "");
				return;
			}
			if(checkInfoFlag("#itemTbody :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息" />", 0, "260", "");
				return;
			}
			//////////////////////////////////////
			//if($("#formId1_itemNum1").val()==""){
			//	_alertValMsg($("#formId1_itemNum1"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
			//	return;
			//}
			var len = $("#addItemInfo tr").length;
			var hideFlag="true";				
            var temps;
			$("#itemTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				var itemSeq=1;
				
				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()!=""){
					planNum=$("#WOD_PLAN_NUM" + addItemObj.attr("id")).val();
				}
				var changeObj;
				if(addItemObj.attr("checked")) {
				    if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()==""){
				        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为空" />", 0, "260", "");
					    return false;
    				}else
    				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()=="0"){
    				    hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为0" />", 0, "260", "");
					    return false;
    				}else if(!(/^(\+|-)?\d+$/.test( $("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()))){
    				    hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量只能为正整数" />", 0, "260", "");
					    return false;
    				}else{
    				    hideFlag="true";
    				}
					$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						
						var docNum1=itemObj.find("td:eq(5)").text();
						var docNum2=$("#PROJECT_ID" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) == $.trim(docNum2)) {
							planNum=parseInt(itemObj.find("td:eq(8)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) != $.trim(docNum2)) {
                            itemSeq++;
                        }
					});
					if(flagNum>0){
					    changeObj.find("td:eq(8)").text(planNum+"");
					    changeObj.find("td:eq(9) input").text(planNum+"");
					    changeObj.find("td:eq(9) input").val(planNum+"");
					    changeObj.find("td:eq(14) input").val(planNum+"");
					}else{
						var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;'>" + wmsOption + "</select>";
						
							var tempHtmls = "<tr	id='trr"+(trrCount+1)+"' >"
								            +"<td  style='width:30px;text-align: center;'>" + (len + 1) + "</td>"
                             		        +"<td  style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-1' style='width:120px;text-align: center;' title='"+$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val()+"'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-2' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_NAME" + addItemObj.attr("id")).val()+"' >" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_SPEC" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+$("#PROJECT_ID" + addItemObj.attr("id")).val()+"'>" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-19' style='width:80px;text-align: right;' title='"+itemSeq+"'><input type='text' class='input isSubmit' style='width:70px;' name='ITEM_SEQ' value='" + itemSeq + "'/></td>"
					                        +"<td class='datagrid-cell datagrid-cell-5' style='width:80px;text-align: right;' title='"+$("#CI_MIN_PACK" + addItemObj.attr("id")).val()+"'>" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val()  + "<input type='hidden' name='MIN_PACK' id='MIN_PACK"+(trrCount + 1)+"' value='" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+planNum+"'>" + planNum + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' ' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: right;' title='"+$("#WSI_ITEM_NUM" + addItemObj.attr("id")).val()+"'>" + $("#WSI_ITEM_NUM" + addItemObj.attr("id")).val() + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: right;' >"+$("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val()+"<input type='hidden' name='EXCEED_NUM' id='EXCEED_NUM"+(trrCount + 1)+"' value='" + $("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val() + "' /></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' name='EXCEED_USE_NUM' id='EXCEED_USE_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='0'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>" + wmsSel + "</td>"
                             			    +"<td class='datagrid-cell datagrid-cell-18' style='width:150px;text-align: center;padding:0;'><input style='width:150px;padding:0;' name='DELIVERY_DATE'  id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>"
            			                    											
                                            +"<td class='datagrid-cell datagrid-cell-14' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_PROCESS_FACE' value='" + $("#formId1_WOD_PRO_FACE").val() + "'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-15' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_CURRENT_NUM' value='" + $("#formId1_itemNum1").val() + "'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-16' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/></td>"
                             			    +"<td class='datagrid-cell datagrid-cell-17' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/></td>"					
                                            +"<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: right;width:70px;display:none;' ><input style='padding:0;width:70px;' name='REQUEST_NUM_TWO' class=' input isSubmit' ' id='REQUEST_NUM_TWO"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>"											
                                            +"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' id='PLAN_NUM"+(trrCount + 1)+"' value='" + planNum + "'/></td>"

            			temps+=	tempHtmls;		        
						
					}
				//	mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;

					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da002');

				}
			})
			
                $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002").append(temps);
		//	reSort("itemInfo");
			//hideDiv(showId, backId);
			if(hideFlag=="true"){	
                $("#itemTbody").empty();
                hideDiv(showId, backId);
            }
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		//保存在制令单界面选择的信息
		function addPoInfoList(showId, backId) {
		    if(listEmptyFlag2==	"true"){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请输入制令单号查询" />", 0, "260", "");
				return;
			}
			if(checkInfoFlag("#poInfoTbody :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			/////////////////////////////////////////////
			//if($("#formId2_itemNum2").val()==""){
			//	_alertValMsg($("#formId2_itemNum2"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
			//	return;
			//}
			var len = $("#addItemInfo tr").length;
			var hideFlag="true";
				var temp;
			$("#poInfoTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				var itemSeq=1;
				
				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()!=""){
					planNum=$("#WOD_PLAN_NUM" + addItemObj.attr("id")).val();
				}
				var changeObj;
				if(addItemObj.attr("checked")) {
				    if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()==""){
				        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为空" />", 0, "260", "");
					    return false;
    				}else
    				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()=="0"){	
                        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为0" />", 0, "260", "");
					    return false;
    				}else if(!(/^(\+|-)?\d+$/.test( $("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()))){
    				    hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量只能为正整数" />", 0, "260", "");
					    return false;
    				}else{
    				    hideFlag="true";
    				}
    			
					$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						
						var docNum1=itemObj.find("td:eq(5)").text();
						var docNum2=$("#PROJECT_ID" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) == $.trim(docNum2)) {
						
							planNum=parseInt(itemObj.find("td:eq(8)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) != $.trim(docNum2)) {
						    itemSeq++;
						}
					});
					if(flagNum>0){
					    changeObj.find("td:eq(8)").text(planNum+"");
					    changeObj.find("td:eq(9) input").text(planNum+"");
					    changeObj.find("td:eq(9) input").val(planNum+"");
					    //changeObj.find("td:eq(14) input").val(planNum+"");
					}else{
					        	var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData' style='width:120px;'>" + wmsOption + "</select>";
					    	
                       
						var tempHtml = "<tr	id='trr"+(trrCount+1)+"' >"
								            +"<td  style='width:30px;text-align: center;'>" + (len + 1) + "</td>"
                             		        +"<td  style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>"
                             				+"<td class='datagrid-cell datagrid-cell-1' style='width:120px;text-align: center;' title='"+$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val()+"'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' id='ITEM_CODE"+(trrCount + 1)+"' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>"
								            +"<td class='datagrid-cell datagrid-cell-2' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_NAME" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>"
				                            +"<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_SPEC" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>"
						                    + "<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+$("#PROJECT_ID" + addItemObj.attr("id")).val()+"'>" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "</td>"
						                    +"<td class='datagrid-cell datagrid-cell-19' style='width:80px;text-align: right;' title='"+itemSeq+"'><input type='text' class='input isSubmit' style='width:70px;' name='ITEM_SEQ' value='" + itemSeq + "'/></td>"
						                    +"<td class='datagrid-cell datagrid-cell-5' style='width:80px;text-align: right;' title='"+$("#CI_MIN_PACK" + addItemObj.attr("id")).val()+"'>" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "<input type='hidden' name='MIN_PACK' id='MIN_PACK"+(trrCount + 1)+"' value='" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+planNum+"'>" + planNum + "</td>"
            						        +"<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' ' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: right;' title='"+$("#WSI_ITEM_NUM" + addItemObj.attr("id")).val()+"'>" + $("#WSI_ITEM_NUM" + addItemObj.attr("id")).val() + "</td>"
            						        +"<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: right;' >"+$("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val()+"<input type='hidden' name='EXCEED_NUM' id='EXCEED_NUM"+(trrCount + 1)+"' value='" + $("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val() + "' /></td>"
            						        +"<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' name='EXCEED_USE_NUM' id='EXCEED_USE_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='0'/></td></td>"
            						        +"<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>" + wmsSel + "</td>"
            						        +"<td class='datagrid-cell datagrid-cell-18' style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>"
            																															
                                            +"<td class='datagrid-cell datagrid-cell-14' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_PROCESS_FACE' value='0'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-15' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_CURRENT_NUM' value='" + $("#formId2_itemNum2").val() + "'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-16' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-17' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/></td>"								
                                            +"<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: right;display:none;width:70px;' ><input style='padding:0;width:70px;' name='REQUEST_NUM_TWO' class=' input isSubmit' ' id='REQUEST_NUM_TWO"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>"						
                                            +"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' id='PLAN_NUM"+(trrCount + 1)+"' value='" + planNum + "'/></td></td>"
                        temp+=	tempHtml;		        
						
					}
				//	mySetChosen(); //设置下拉框样式
					//$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;
				}
			})
			
			$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002").append(temp);
            //	var tableTrJs = $("#poInfoTable tbody tr");
				//	_tongLineColor(tableTrJs);
			//		clickTr('poInfoTable');
				//	clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
				//	defTableWidthRewrite('b1001c913da94c22b6e93cf7148da002');
			//reSort("itemInfo");
            if(hideFlag=="true"){
                $("#poInfoTbody").empty();
                hideDiv(showId, backId);
            }
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		//保存在BOM界面选择的信息
		function addBomInfoList(showId, backId) {
		    if(listEmptyFlag3==	"true"){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请输入机种BOM查询" />", 0, "260", "");
				return;
			}
			if(checkInfoFlag("#bomInfoTbody :checkbox")==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
				return;
			}
			/////////////////////////////////////////////
			//if($("#formId2_itemNum2").val()==""){
			//	_alertValMsg($("#formId2_itemNum2"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
			//	return;
			//}
			var len = $("#addItemInfo tr").length;
			var hideFlag="true";
				var temp;
			$("#bomInfoTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				var itemSeq=1;
				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()!=""){
					planNum=$("#WOD_PLAN_NUM" + addItemObj.attr("id")).val();
				}
				var changeObj;
				if(addItemObj.attr("checked")) {
				    if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()==""){
				        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为空" />", 0, "260", "");
					    return false;
    				}else
    				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()=="0"){	
                        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为0" />", 0, "260", "");
					    return false;
    				}else if(!(/^(\+|-)?\d+$/.test( $("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()))){
    				    hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量只能为正整数" />", 0, "260", "");
					    return false;
    				}else{
    				    hideFlag="true";
    				}
    			
					$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						
						var docNum1=itemObj.find("td:eq(5)").text();
						var docNum2=$("#PROJECT_ID" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) == $.trim(docNum2)) {
						
							planNum=parseInt(itemObj.find("td:eq(8)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) != $.trim(docNum2)) {
                            itemSeq++;
                        }
					});
					if(flagNum>0){
					    changeObj.find("td:eq(8)").text(planNum+"");
					    changeObj.find("td:eq(9) input").text(planNum+"");
					    changeObj.find("td:eq(9) input").val(planNum+"");
					    changeObj.find("td:eq(14) input").val(planNum+"");
					}else{
					    var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData' style='width:120px;'>" + wmsOption + "</select>";
						var tempHtml = "<tr	id='trr"+(trrCount+1)+"' >"
								            +"<td style='width:30px;text-align: center;'>" + (len + 1) + "</td>"
                             		        +"<td style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>"
                             				+"<td class='datagrid-cell datagrid-cell-1' style='width:120px;text-align: center;' title='"+$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val()+"'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' id='ITEM_CODE"+(trrCount + 1)+"' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>"
								            +"<td class='datagrid-cell datagrid-cell-2' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_NAME" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>"
				                            +"<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_SPEC" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>"
						                    + "<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+$("#PROJECT_ID" + addItemObj.attr("id")).val()+"'>" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "</td>"
						                    +"<td class='datagrid-cell datagrid-cell-19' style='width:80px;text-align: right;' title='"+itemSeq+"'><input type='text' class='input isSubmit' style='width:70px;' name='ITEM_SEQ' value='" + itemSeq + "'/></td>"						
                                            +"<td class='datagrid-cell datagrid-cell-5' style='width:80px;text-align: right;' title='"+$("#CI_MIN_PACK" + addItemObj.attr("id")).val()+"'>" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "<input type='hidden' name='MIN_PACK' id='MIN_PACK"+(trrCount + 1)+"' value='" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+planNum+"'>" + planNum + "</td>"
            						        +"<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' ' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/><input style='padding:0;width:70px;display:none;' name='REQUEST_NUM_TWO' class=' input isSubmit' ' id='REQUEST_NUM_TWO"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: right;' title='"+$("#WSI_ITEM_NUM" + addItemObj.attr("id")).val()+"'>" + $("#WSI_ITEM_NUM" + addItemObj.attr("id")).val() + "</td>"
            						        +"<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: right;' >"+$("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val()+"<input type='hidden' name='EXCEED_NUM' id='EXCEED_NUM"+(trrCount + 1)+"' value='" + $("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val() + "' /></td>"
            						        +"<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' name='EXCEED_USE_NUM' id='EXCEED_USE_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='0'/></td></td>"
            						        +"<td class='datagrid-cell datagrid-cell-13' style='width:120px;padding:0;'>" + wmsSel + "<input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/><input type='hidden' name='WOI_PROCESS_FACE' value='0'/><input type='hidden' name='WOI_CURRENT_NUM' value='" + $("#formId2_itemNum2").val() + "'/></td>"
            						        +"<td class='datagrid-cell datagrid-cell-18' style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>"
            			                    							
                                            +"<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' id='PLAN_NUM"+(trrCount + 1)+"' value='" + planNum + "'/></td></td>"
                                            +"<td class='datagrid-cell datagrid-cell-19' style='width:150px;text-align: right;display:none;'></td>"
                                            +"<td class='datagrid-cell datagrid-cell-20' style='width:150px;text-align: right;display:none;'></td>"
                                            +"<td class='datagrid-cell datagrid-cell-21' style='width:150px;text-align: right;display:none;'></td>"
                                            +"<td class='datagrid-cell datagrid-cell-22' style='width:150px;text-align: right;display:none;'></td>"
                                            +"<td class='datagrid-cell datagrid-cell-23' style='width:150px;text-align: right;display:none;'></td>"
										temp+=	tempHtml;		        
						
					}
				//	mySetChosen(); //设置下拉框样式
				//	$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;
                    
					var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
					clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
					defTableWidthRewrite('b1001c913da94c22b6e93cf7148da002');

				}
			})
			$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002").append(temp);

			//reSort("itemInfo");
            if(hideFlag=="true"){
                $("#bomInfoTbody").empty();
                hideDiv(showId, backId);
            }
			trCount = 0;
			$("#bom_list_cb").attr("checked", false);
		}
		
		//保存所有在制令单界面选择的信息
		function addAllPoInfoList(showId, backId) {
		    //if(listEmptyFlag2==	"true"){
			//	utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请输入制令单号查询" />", 0, "260", "");
			//	return;
			//}
			//if(checkInfoFlag("#poInfoTbody :checkbox")==false){
			//	utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
			//	return;
			//}
			/////////////////////////////////////////////
			//if($("#formId2_itemNum2").val()==""){
			//	_alertValMsg($("#formId2_itemNum2"), "<dict:lang value="该项不能为空" />");
				//utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择物料信息 " />", 0, "260", "");
			//	return;
			//}
			var len = $("#addItemInfo tr").length;
			var hideFlag="true";
			$("#poInfoTbodyHidden :checkbox").each(function() {
				var addItemObj=$(this);
				var flagNum=0;
				var planNum="0";
				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()!=""){
					planNum=$("#WOD_PLAN_NUM" + addItemObj.attr("id")).val();
				}
				var changeObj;
				if(true) {
				    if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()==""){
				        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为空" />", 0, "260", "");
					    return false;
    				}else
    				if($("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()=="0"){	
                        hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不能为0" />", 0, "260", "");
					    return false;
    				}else if(!(/^(\+|-)?\d+$/.test( $("#WOD_PLAN_NUM" + addItemObj.attr("id")).val()))){
    				    hideFlag="false";
    					utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量只能为正整数" />", 0, "260", "");
					    return false;
    				}else{
    				    hideFlag="true";
    				}
					$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val();
						
						var docNum1=itemObj.find("td:eq(5)").text();
						var docNum2=$("#PROJECT_ID" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2) && $.trim(docNum1) == $.trim(docNum2)) {
						
							planNum=parseInt(itemObj.find("td:eq(7)").text())+parseInt(planNum);
							flagNum++;
							changeObj=itemObj;
							//itemObj.find("td:eq(5)").text(planNum+"");
						}
					});
					if(flagNum>0){
					    changeObj.find("td:eq(7)").text(planNum+"");
					    changeObj.find("td:eq(8) input").text(planNum+"");
					    changeObj.find("td:eq(8) input").val(planNum+"");
					}else{
						var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>" + wmsOption + "</select>";
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;' title='"+$("#CMD_ITEM_CODE" + addItemObj.attr("id")).val()+"'>" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='ITEM_CODE' id='ITEM_CODE"+(trrCount + 1)+"' value='" + $("#CMD_ITEM_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_NAME" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_NAME" + addItemObj.attr("id")).val() + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_SPEC" + addItemObj.attr("id")).val()+"'>" + $("#CI_ITEM_SPEC" + addItemObj.attr("id")).val() + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;text-align: center;' title='"+$("#PROJECT_ID" + addItemObj.attr("id")).val()+"'>" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+$("#CI_MIN_PACK" + addItemObj.attr("id")).val()+"'>" + $("#CI_MIN_PACK" + addItemObj.attr("id")).val() + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+planNum+"'>" + planNum + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:80px;text-align: right;' ><input style='padding:0;width:70px;' name='REQUEST_NUM' class=' input isSubmit' ' id='REQUEST_NUM"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:80px;text-align: right;display:none;' ><input style='padding:0;width:70px;' name='REQUEST_NUM_TWO' class=' input isSubmit' ' id='REQUEST_NUM_TWO"+(trrCount + 1)+"' oninput='checkRequsetNum(event,"+(trrCount + 1)+")' value='"+planNum+"'/></td>");
						
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+$("#WSI_ITEM_NUM" + addItemObj.attr("id")).val()+"'>" + $("#WSI_ITEM_NUM" + addItemObj.attr("id")).val() + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:80px;text-align: right;' >"+$("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val()+"<input type='hidden' name='EXCEED_NUM' id='EXCEED_NUM"+(trrCount + 1)+"' value='" + $("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val() + "' /></td>");//value='" + $("#MEI_ITEM_COUNT" + addItemObj.attr("id")).val() + "' 
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:100px;text-align: right;' ><input style='padding:0;width:90px;' name='EXCEED_USE_NUM' id='EXCEED_USE_NUM"+(trrCount + 1)+"' class=' input isSubmit' ' oninput='checkExceedNum(event,"+(trrCount + 1)+")'  value='0'/></td>");
						
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' id='PLAN_NUM"+(trrCount + 1)+"' value='" + planNum + "'/></td>");
						
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_PROCESS_FACE' value='0'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='WOI_CURRENT_NUM' value='" + $("#formId2_itemNum2").val() + "'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + $("#PROJECT_ID" + addItemObj.attr("id")).val() + "'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE" + addItemObj.attr("id")).val() + "'/></td>");
						$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' name='DELIVERY_DATE' id='DELIVERY_TIME"+(trrCount + 1)+"' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
					}
					mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					len = len + 1;
					trrCount++;

				//	var tableTrJs = $("#poInfoTable tbody tr");
				//	_tongLineColor(tableTrJs);
				//	clickTr('poInfoTable');
				//	clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');

				}
			})
			

			reSort("datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002");
            if(hideFlag=="true"){
                $("#poInfoTbody").empty();
                hideDiv(showId, backId);
            }
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		$(function() {
			getWmsSel();
			$("#paraMap1_WOD_PICK_TYPE option[value='']").remove();
			$("#paraMap1_WOD_PICK_TYPE").trigger("chosen:updated");
		})
		var wmsOption;
		//获取仓库信息
		function getWmsSel() {
		var getWmsSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getWmsSelUrl,
				data: "",
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
		        var flag=false;
			$("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");

					$("#" + trid).remove();flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择单据明细" />", 0, "260", "");
				return;
			}
			reSort("datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002");
			var tableTrJs = $("#datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002');
			defTableWidthRewrite('b1001c913da94c22b6e93cf7148da002');
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
		function getAllBom() {
			if($("#bom_list_cb").attr("checked") == "checked") {
				$("#bomInfoTbody :checkbox").attr("checked", true);
			} else {
				$("#bomInfoTbody :checkbox").each(function() {
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
			if(formId=="formId3"){
				var obj1="#formId3_WOD_MO_NUM_SHOW";
				var obj2="#formId3_WOD_PROJECT_ID";
				var obj3="#formId3_WOD_MODEL_CODE";
				var obj4="#formId1_itemNum1";
				$(obj1).val("");
				$(obj2).val("");
				$(obj3).val("");
				$(obj4).val("");
				$("#itemTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});
				$("#formId3_WOD_PRO_FACE").find("option[value='-1']").attr("selected",true);
			    $("#formId3_WOD_PRO_FACE").trigger("chosen:updated");
			    listEmptyFlag		 = "true";
			    addItemInfo();
			    $("#itemTbodyHidden").empty();
			}else if(formId=="formId4"){
				var obj1="#formId4_WOD_MO_NUM_SHOW";
				var obj2="#formId4_WOD_PROJECT_ID";
				var obj3="#formId4_WOD_MODEL_CODE";
				var obj4="#formId2_itemNum2";
				$(obj1).val("");
				$(obj2).val("");
				$(obj3).val("");
				$(obj4).val("");
				$("#poInfoTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});	
                listEmptyFlag2		 = "true";
			    addPoInfo();
			    $("#poInfoTbodyHidden").empty();
			}else if(formId=="formId5"){
			    var obj1="#formId5_WOI_BOM_CODE_SHOW";
			    var obj2="#formId5_WOI_BOM_NAME";
				var obj3="#formId5_WOI_BOM_SPEC";
				var obj4="#formId3_itemNum3";
				$(obj1).val("");
				$(obj2).val("");
				$(obj3).val("");
				$(obj4).val("");
				listEmptyFlag3		 = "true";
				addBomInfo();
			    $("#bomInfoTbodyHidden").empty();
			}
		}
		//改变计划数量
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
					$("#itemTbodyHidden tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
				}
			}else if(objId=="#formId2_itemNum2"){
				var trLength=$("#poInfoTbody tr").length+1;
				for(var i=0;i<trLength;i++){
					var index=i+1;
					var tempNumId="#T1_CMD_POINT_NUM"+index;
					var tempPlanNum=parseInt(newContent)*parseInt($(tempNumId).val());
					if(newContent==""||flag==true){
		            	tempPlanNum="";
		            }
					$("#poInfoTbody tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
					$("#poInfoTbodyHidden tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
				}
			}else if(objId=="#formId3_itemNum3"){
				var trLength=$("#bomInfoTbody tr").length+1;
				for(var i=0;i<trLength;i++){
					var index=i+1;
					var tempNumId="#T1_CMD_POINT_NUM"+index;
					var tempPlanNum=parseInt(newContent)*parseInt($(tempNumId).val());
					if(newContent==""||flag==true){
		            	tempPlanNum="";
		            }
					$("#bomInfoTbody tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
					$("#bomInfoTbodyHidden tr:eq(" + i + ")").find("td:eq(6) input").val(tempPlanNum);
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
		
		function pickType(){
		    $("#addItemInfo").empty();
		    var pickType = $("#paraMap1_WOD_PICK_TYPE").val();
		    if("1" == pickType){
		        $("#item").hide();
		        $("#bom").hide();
		        $("#info").show();
		    }else if("2" == pickType){
		        $("#info").hide();
		        $("#bom").hide();
		        $("#item").show();
		    }else if("3" == pickType){
		        $("#info").hide();
		        $("#bom").show();
		        $("#item").hide();
		    }
		}
	</script>
</head>

<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
		<div class="hd">

			<!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			<div style="margin-left:10px;">
				<div class="save-close" <dict:lang value="关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;" />
			<s:if test="${isDataAuth == '1'}">
				<span class="dot">*</span>
				<dict:lang value="组织机构" />
				<s:if test="${fn:length(deptLs)==1}">
					<s:select list="deptLs" listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
				</s:if>
				<s:else>
					<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
				</s:else>
			</s:if>
		</div>
		<div class="optn">
			<button type="button" onclick="addInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>

	</div>
	<div class="bd" style="height:534px;">

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
								<LI id="tag3" style="display:none;margin-left:875px;">
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
                        				<button type="button" id="item" onclick="popItemDiv('addItem','backItem');" style="padding:0;display: none;" title="选择料站表">
                        					<i class="ico ico-kl-new-add ico-small"></i>
                        				</button>
                        				<button type="button" id="info" onclick="popPoInfoDiv('addPoInfo','backPoInfo');" style="padding:0;" title="选择制令单"><!--popPoInfoDiv('addPoInfo','backPoInfo');-->
                        					<i class="ico ico-kl-new-add ico-small"></i>
                        				</button>
                        				<button type="button" id="bom" onclick="popBomInfoDiv('addBomInfo','backBomInfo');" style="padding:0;display: none;" title="选择机种BOM"><!--popBomInfoDiv('addPoInfo','backPoInfo');-->
                        					<i class="ico ico-kl-new-add ico-small"></i>
                        				</button>
                        				<button type="button" onclick="delRow();" style="padding:0" title="删除">
                        					<i class="ico ico-sc-new-add ico-small"></i>
                        				</button>
                        			
                        			</div>						
                                </LI>
							</UL>
					<!--	</DIV>  -->
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<table class="basic-table">
				<input type="hidden" name="formIds" value="b1001c913da94c22b6e93cf7148da0d6" />
				<input type="hidden" name="formId" id="formId2" value='b1001c913da94c22b6e93cf7148da002'/>
				<input type="hidden" name="formId" id="formId3" value='b1001c913da94c22b6e93cf7148da003'/>
				<input type="hidden" name="formId" id="formId4" value='b1001c913da94c22b6e93cf7148da004'/>
				<input type="hidden" name="formId" id="formId5" value='b1001c913da94c22b6e93cf7148da005'/>
				<input type="hidden" name="b1001c913da94c22b6e93cf7148da0d6" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<input type="hidden" name="moNum" id="moNum" value="" />
				<input type="hidden" name="outNum" id="outNum" value="" />
				<s:set name="_$viewId" value="'3004dfd7cf5945ddaeabd56ef6882dd2'" />
				<s:set name="_$formId_1" value="'b1001c913da94c22b6e93cf7148da0d6'" />
				<s:set name="_$type" value="'add'" />
				<tr>
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_DOC_NUM" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_DOC_NUM" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_DOC_NUM" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_DOC_NUM}" formIndex="1" /></bu:td>

					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_DOC_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_DOC_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_DOC_TYPE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_DOC_TYPE}" formIndex="1" disabled="disabled"/></bu:td>

					<td class="name" />
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					    <bu:td cssClass="dec" style="width:200px;" colNo="T2#WOD_DISPATCH_SN" formId="bb156a44e6e242a885b3fde9386fd567">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{T2#WOD_DISPATCH_SN}" formIndex="1" /></bu:td>


				</tr>
				<tr>
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_OUTSTOCK_DATE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					<bu:td cssClass="dec" colNo="WOD_OUTSTOCK_DATE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_OUTSTOCK_DATE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_OUTSTOCK_DATE}" formIndex="1" onchange="changeTime();"/></bu:td>

					<td class="name" />
					<bu:uitn colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					    <bu:td cssClass="dec" colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_URGENT_FLAG" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_URGENT_FLAG}" formIndex="1" /></bu:td>
						
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOD_PICK_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>	
					    <bu:td cssClass="dec" style="width:200px;" colNo="WOD_PICK_TYPE" formId="b1001c913da94c22b6e93cf7148da0d6">
						<bu:ui colNo="WOD_PICK_TYPE" style="width:200px;" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_PICK_TYPE}" formIndex="1" onchange="pickType();"/></bu:td>


				</tr>

                <tr>
					<td class="name" />
					<bu:uitn colNo="WOI_WH_CODE" formId="bb156a44e6e242a885b3fde9386fd567" />
					</td>
					    <bu:td cssClass="dec" colNo="WOI_WH_CODE" formId="bb156a44e6e242a885b3fde9386fd567" >
						<bu:ui colNo="WOI_WH_CODE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_WH_CODE}" formIndex="1" /></bu:td>

                
				</tr>				

				<tr>
					<td class="name" />
					<bu:uitn colNo="WOD_MEMO" formId="b1001c913da94c22b6e93cf7148da0d6" />
					</td>
					    <bu:td cssClass="dec" colNo="WOD_MEMO" formId="b1001c913da94c22b6e93cf7148da0d6" style="height:80px;" colspan="5">
						<bu:ui colNo="WOD_MEMO" style="width:100%;height:100%" formId="b1001c913da94c22b6e93cf7148da0d6" value="%{WOD_MEMO}" formIndex="1" /></bu:td>

				</tr>
			</table>
			</div>
		
			<DIV id="content2" style="display:none" data-tab="tag2">
				
		
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner head" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htableb1001c913da94c22b6e93cf7148da002">
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
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
												<td class="datagrid-cell" style="display:none;width:150px;"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:385px;">
								<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da002">
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
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:150px;left:16px;top:10px;width:870px;height:560px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择料站表" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 70px);">
			<div class="optn optn_div">
			    <!--<button type="button" onclick="addAllItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存所有"/></button>
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存当前"/></button>-->
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId3');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<!--<button type="button" onclick="searchOutItem('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>-->
			</div>

			<table class="basic-table">
				<tr>
				    <td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="制令单号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_MO_NUM" id="formId1_WOD_MO_NUM" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM}" formIndex="1" /></td>
					
					<td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="工单号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_PROJECT_ID" id="formId1_WOD_PROJECT_ID"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_PROJECT_ID}" formIndex="1" /></td>
					
					<td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="机种料号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_MODEL_CODE" id="formId1_WOD_MODEL_CODE"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MODEL_CODE}" formIndex="1" /></td>
				</tr>
				<tr>
				    <td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="面别" />&nbsp;
					</td>
					<td class="dec"><bu:ui colNo="WOI_PROCESS_FACE" id="formId1_WOD_PRO_FACE" name="WOD_PRO_FACE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" formIndex="1"/>
					<bu:ui colNo="WOI_PROCESS_FACE" id="formId1_WOD_PRO_FACE_SHOW" name="WOD_PRO_FACE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" formIndex="1"  /></td>
					<!--<td style="width: 200px;" />
						<select style="width:200px;" class="isSubmit input " id="formId1_WOD_PRO_FACE" name="WOD_PRO_FACE" >
						    <option value="-1">--<dict:lang value="请选择" />--</option>
						    <option value="0"><dict:lang value="单面" /></option>
						    <option value="1"><dict:lang value="正面" /></option>
						    <option value="2"><dict:lang value="反面" /></option>
						    <option value="3"><dict:lang value="阴阳面" /></option>
						</select>
					</td>	-->

				    <td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="计划数量" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_MO_PLANNUM" id="WOI_MO_PLANNUM1" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM2}" formIndex="1" /></td>
					
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="累计发料套数" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_CUM_NUM" id="WOI_CUM_NUM1" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_PROJECT_ID}" formIndex="1" /></td>	

				</tr>
				<tr>
				    <td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="当前发料套数" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text" placeholder="请输入发料套数" style="width: 200px;" id="formId1_itemNum1" name="itemNum1" class=" input isSubmit isaddSubmit" oninput="OnInput(event,'formId1_itemNum1')" onpropertychange="OnPropChanged(event)"/></td>
				</tr>
			</table>
			<div class="panel datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
			<div class="datagrid-header" style="">
    			<div  class="datagrid-header-inner">
    				<table class="datagrid-htable fixedTable " id="datagrid-htableb1001c913da94c22b6e93cf7148da003">
    					<tbody>
    						<tr  class="datagrid-header-row datagrid-title-ajax">
    							<td style="width: 30px;text-align: center;"></td>
    							<td style="width: 30px;text-align: center;"><input type="checkbox" checked="checked" id="item_list_cb" onchange="getAllItem();" /></td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="物料料号" />
    							</td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="物料名称" />
    							</td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="物料规格" />
    							</td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="用量" />
    							</td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="计划数量" />
    							</td>
    							
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    						</tr>
    					</tbody>
    				</table>
    			</div>
    		</div>
	    			
			<div style="height:350px;"  class="datagrid-body datagrid-div3 scroll1">
				<table style="table-layout:fixed;width:100%;" class="datagrid-htable fixedTable dlist-table table-line " id="datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da003">
					<tbody id="itemTbody">
					</tbody>

				</table>

			</div>
			</div>		
            </div>
			<div style="background-color: white;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOutItem&formId=formId3&showLoading=0" />
			</div>
		</div>

	</div>
	<div id="backPoInfo" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addPoInfo" style="display:none;z-index:1030;margin-left:150px;left:16px;top:10px;width:870px;height:560px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择制令单" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPoInfo','backPoInfo');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 70px);">
			<div class="optn optn_div">

				<!--<span class="txt" title="等于">开单时间</span>

				<input id="beginTime" name="" value="" style="width:200px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">

				<span class="txt">~</span>
				<input id="endTime" name="" value="" style="width:200px;margin-right:145px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">-->

                <!--<button type="button" onclick="addAllPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存所有"/></button>
				<button type="button" onclick="addPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存当前"/></button>-->
				<button type="button" onclick="addPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addPoInfo','backPoInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId4');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<!--<button type="button" onclick="searchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>-->
			</div>

			<table class="basic-table">
				<tr>
				    <td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="制令单号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_MO_NUM2" id="formId2_WOD_MO_NUM" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM2}" formIndex="1" /></td>
					
					<td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="工单号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_PROJECT_ID" id="formId2_WOD_PROJECT_ID"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_PROJECT_ID}" formIndex="1" /></td>
					
					<td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="机种料号" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_MODEL_CODE" id="formId2_WOD_MODEL_CODE"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MODEL_CODE}" formIndex="1" /></td>
				</tr>
				<tr>
				    <td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="计划数量" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_MO_PLANNUM" id="WOI_MO_PLANNUM2" style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM2}" formIndex="1" /></td>
					
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="累计发料套数" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_CUM_NUM" id="WOI_CUM_NUM2" style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_PROJECT_ID}" formIndex="1" /></td>	

                    <td class="name" />
					<dict:lang value="当前发料套数" />
					</td>
					<td class="dec"><input type="text" style="width: 200px;" id="formId2_itemNum2" placeholder="请输入发料套数" name="itemNum2" class=" input isSubmit isaddSubmit" oninput="OnInput(event,'formId2_itemNum2')" onpropertychange="OnPropChanged(event)"/></td>
				</tr>
			</table>	
            <div class="panel datagrid datagrid-div1">
    			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
        			<div class="datagrid-header" style="">
            			<div  class="datagrid-header-inner	head2">
            				<table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb1001c913da94c22b6e93cf7148da004">
            					<tbody>
            						<tr   class="datagrid-header-row thcolor">
            							<td style="width: 30px;text-align: center;"></td>
            							<td style="width: 30px;text-align: center;"><input type="checkbox" checked="checked" id="po_list_cb" onchange="getAllPo();" /></td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料料号" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料名称" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料规格" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="用量" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="计划数量" />
            							</td>
            							
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            						</td>
            					</tbody>
            				</table>
            			</div>
            		</div>
        			<div style="height:320px;" class="datagrid-body datagrid-div3 scroll2">
        				<table  class="datagrid-btable fixedTable dblClick " id="datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da004">
        					<tbody id="poInfoTbody">
        					</tbody>
        
        				</table>
        			</div>
    			</div>
    		</div>
			<div style="background-color: white;" id="pageDiv1">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPoInfo&formId=formId4&showLoading=0" />
			</div>
		</div>

	</div>
	<!-- 机种BOM -->
	<div id="backBomInfo" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addBomInfo" style="display:none;z-index:1030;margin-left:150px;left:16px;top:10px;width:870px;height:560px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择机种BOM" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addBomInfo','backBomInfo');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 70px);">
			<div class="optn optn_div">

				<!--<span class="txt" title="等于">开单时间</span>

				<input id="beginTime" name="" value="" style="width:200px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})" readonly="readOnly">

				<span class="txt">~</span>
				<input id="endTime" name="" value="" style="width:200px;margin-right:145px;" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 23:59:59'})" readonly="readOnly">-->

                <!--<button type="button" onclick="addAllPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存所有"/></button>
				<button type="button" onclick="addPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存当前"/></button>-->
				<button type="button" onclick="addBomInfoList('addBomInfo','backBomInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addBomInfo','backBomInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId5');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<!--<button type="button" onclick="searchPoInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>-->
			</div>

			<table class="basic-table">
				<tr>
				    <td class="name" style="width: 90px;text-align: right;"/>
					<dict:lang value="机种BOM" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_BOM_CODE" id="formId3_WOI_BOM_CODE" style="width:200px;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_BOM_CODE}" formIndex="1" /></td>
					
					<td class="name" style="width: 90px;text-align: right;"/>
					<dict:lang value="机种名称" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_BOM_NAME" id="formId3_WOI_BOM_NAME"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_BOM_NAME}" formIndex="1" /></td>
					
					<td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="机种规格" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="WOI_BOM_SPEC" id="formId3_WOI_BOM_SPEC"  style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_BOM_SPEC}" formIndex="1" /></td>
				</tr>
				<tr>
				    <!--<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="计划数量" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_MO_PLANNUM" id="WOI_MO_PLANNUM2" style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_MO_NUM2}" formIndex="1" /></td>
					-->
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="累计发料套数" />
					</td>
					<td class="dec" style="width: 205px;"><bu:ui colNo="WOI_CUM_NUM" id="WOI_CUM_NUM2" style="width:200px;disabled:disabled;" formId="bb156a44e6e242a885b3fde9386fd567" value="%{WOI_PROJECT_ID}" formIndex="1" /></td>	

                    <td class="name" />
					<dict:lang value="当前发料套数" />
					</td>
					<td class="dec"><input type="text" style="width: 200px;" id="formId3_itemNum3" placeholder="请输入发料套数" name="itemNum2" class=" input isSubmit isaddSubmit" oninput="OnInput(event,'formId3_itemNum3')" onpropertychange="OnPropChanged(event)"/></td>
				</tr>
			</table>
			<div class="panel datagrid datagrid-div1">
    			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
        			<div class="datagrid-header" style="">
            			<div  class="datagrid-header-inner head3">
            				<table  class="datagrid-htable fixedTable"  id="datagrid-htableb1001c913da94c22b6e93cf7148da005">
            					<tbody>
            						<tr  class="datagrid-header-row datagrid-title-ajax">
            							<td style="width: 30px;text-align: center;"></td>
            							<td style="width: 30px;text-align: center;"><input type="checkbox" checked="checked" id="bom_list_cb" onchange="getAllBom();" /></td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料料号" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料名称" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="物料规格" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="用量" />
            							</td>
            							<td style="width: 162px;text-align: center;">
            								<dict:lang value="计划数量" />
            							</td>						
                                        <td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            							<td style="display:none;width: 202.5px;text-align: center;"></td>
            						</tr>
            					</tbody>
            				</table>
            			</div>
		            </div>
        			<div style="height:350px;" class="scroll3">
        				<table style="table-layout:fixed;width:100%;" class="datagrid-htable fixedTable dlist-table table-line " id="datagrid-btable-ajaxb1001c913da94c22b6e93cf7148da005">
        					<tbody id="bomInfoTbody">
        					</tbody>
        
        				</table>
        				
        			</div>
        	    </div>
        	</div>
			<div style="background-color: white;" id="pageDiv1">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchBomInfo&formId=formId5&showLoading=0" />
			</div>
		</div>

	</div>
	<bu:jsVal formId="b1001c913da94c22b6e93cf7148da0d6" formIndex="1" />

	</div>
	</form>
	</div>
	<bu:submit viewId="3004dfd7cf5945ddaeabd56ef6882dd2" />
	<bu:script viewId="3004dfd7cf5945ddaeabd56ef6882dd2" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<script type="text/javascript">
		$(function() {
			//$("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
			$("#paraMap1_WOD_PRO_FACE_chosen").css("width","200px");
			$("#paraMap1_WOD_DOC_TYPE option[value='生产领料单']").attr("selected",true);
			$("#paraMap1_WOD_DOC_TYPE").trigger("chosen:updated");
			$("#paraMap1_WOD_DOC_TYPE").attr("disabled","ture");
			$("#formId1_WOD_PRO_FACE_SHOW").attr("disabled","ture");
			$("#formId1_WOD_PRO_FACE").hide();
			$("#paraMap1_WOD_OUTSTOCK_DATE").removeAttr("readonly");
		})
		$("#paraMap1_WOI_WH_CODE").change(function(){
    	    var whCode=$(this).val();
    	    
    	    for(var i=1;i<=trrCount;i++){
    	        $("#wmsSel_"+i).find("option[value='"+whCode+"']").attr("selected",true);
				$("#wmsSel_"+i).trigger("chosen:updated");
			}
    	});
    	function changeTime(){
    	    var delivertTime=$("#paraMap1_WOD_OUTSTOCK_DATE").val();
    	    for(var i=1;i<=trrCount;i++){
    	        $("#DELIVERY_TIME"+i).val(delivertTime);
			}
    	}
    	var requestNum=0;
    	function checkRequsetNum(event,index){
    	    var newContent=event.target.value;
            var requestNumId="#REQUEST_NUM"+index;
            var requestNumId2="#REQUEST_NUM_TWO"+index;
            var planNumId="#PLAN_NUM"+index;
            requestNum=parseInt($(requestNumId).val());
            var planNum=parseInt($(planNumId).val());
            if(!/^(\+)?\d*\.?\d*$/.test(newContent)){
				$(requestNumId).val("");          
				_alertValMsg($(requestNumId), "<dict:lang value="该项只能输入正整数" />");
            }
            if(newContent==""){
				$(requestNumId).val("");          
				_alertValMsg($(requestNumId), "<dict:lang value="该项不能为空" />");
            }
            $(requestNumId2).val(newContent);
            //if(requestNum>planNum){
                //$(requestNumId).val("");          
				//_alertValMsg($(requestNumId), "<dict:lang value="需求数量不能大于计划量" />");
            //}
    	}
    	function checkExceedNum(event,index){
    	    var newContent=event.target.value;
            var exceedNumId="#EXCEED_NUM"+index;
            var exceedUseNumId="#EXCEED_USE_NUM"+index;
            var requestNumId="#REQUEST_NUM"+index;
            var requestNumId2="#REQUEST_NUM_TWO"+index;
            var planNumId="#PLAN_NUM"+index;
            var exceedNum=parseInt($(exceedNumId).val());
            var exceedUseNum=parseInt($(exceedUseNumId).val());
            var planNum=parseInt($(planNumId).val());
            var requestNum2=parseInt($(requestNumId2).val());
            var oldPlanNum=0;
            if(requestNum2!=planNum){
                oldPlanNum=requestNum2;
            }else{
                oldPlanNum=planNum;
            }
            var tempNum=0;
            var flag=true;
            if(!/^(\+)?\d*\.?\d*$/.test(newContent)){
				$(exceedUseNumId).val("");         
				_alertValMsg($(exceedUseNumId), "<dict:lang value="该项只能输入正整数" />");
				flag=false;
				$(requestNumId).val(oldPlanNum);
            }
            if(newContent==""){
				$(exceedUseNumId).val("");          
				_alertValMsg($(exceedUseNumId), "<dict:lang value="该项不能为空" />");
				flag=false;
				$(requestNumId).val(oldPlanNum);
            }
            if(exceedUseNum>exceedNum){
                $(exceedUseNumId).val("");          
				_alertValMsg($(exceedUseNumId), "<dict:lang value="使用超发数量不能大于超发数量" />");
				flag=false;
				$(requestNumId).val(oldPlanNum);
            }
            if(flag==true){
                if(exceedUseNum>=oldPlanNum){
                    $(requestNumId).val("0");
                }else if(newContent==""){
                    $(requestNumId).val(oldPlanNum);
                }else{
                    tempNum=oldPlanNum-exceedUseNum;
                   
                    $(requestNumId).val(tempNum);
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
		
		
		function searchOutItem(){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=151a46a40d7e4c979a793cc39561c65a&formId=%{formId}";

	SearchOutItemInfo(url);
}

function searchPoInfo(){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=5854f273961c47b99bb249cd62d5ee49";
        
	SearchPoInfo(url);
}
function searchBomInfo(){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=7d262f2426904a859142a4521772f0ef";
        
	SearchBomInfo(url);
}
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
 				 if($("#paraMap1_WOD_PICK_TYPE").val()==0){
				         
				_alertValMsg($("#paraMap1_WOD_PICK_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
                  // utilsFp.confirmIcon(3,"","","", "<dict:lang value="备料类型不能为空" />",0,"260","");
                    return;
            }
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请添加单据明细信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加单据明细信息" />",0,"260","");
                           return;
                        }
   			
                
                var tempFlag=false;
                for(var i=0;i<len;i++){
                    var itemObj=$("#addItemInfo").find("tr").eq(i);
                    var itemCode=itemObj.find("td:eq(2)").text();
                    var itemSeq = itemObj.find("td:eq(6)").find("input[name='ITEM_SEQ']").val();
                    for(var j=i+1;j<len;j++){
                        var itemObj2=$("#addItemInfo").find("tr").eq(j);
                        var tempitemSeq = itemObj2.find("td:eq(6)").find("input[name='ITEM_SEQ']").val();
                        var tempitemCode = itemObj2.find("td:eq(2)").text();
                        if(itemCode==tempitemCode && itemSeq==tempitemSeq){
                            tempFlag=true;
                        }
                    }
                }
                
                if(tempFlag==true){
                    utilsFp.confirmIcon(3,"","","", "<dict:lang value="项次不能重复,请更换" />",0,"260","");
               		 return;
                }
				
		
            /*
            for(var i=1;i<=trrCount;i++){
                var itemCodeId="#ITEM_CODE"+i;	//物料料号	
                var exceedNumId="#EXCEED_NUM"+i;    //超发数量
                var itemCode=$.trim($(itemCodeId).val());
                var exceedNum=parseInt($(exceedNumId).val());
                var	 tempNum=0; 
                for(var j=1;j<=trrCount;j++){
                    
                    var tempItemCodeId="#ITEM_CODE"+j;
                    var tempItemCode=$.trim($(tempItemCodeId).val());
                    if(itemCode==tempItemCode){
                        var tempExceedUseNumId="#EXCEED_USE_NUM"+j;
                        var tempExceedUseNum=parseInt($(tempExceedUseNumId).val());
                        tempNum+=tempExceedUseNum;
                    }
                    if(tempNum>exceedNum){
                        utilsFp.confirmIcon(3,"","","", "<dict:lang value="同一个物料的使用超发数量不能大于该物料的超发数量" />",0,"260","");
                       	return;
                    }
                }
			}
            */
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
            			if(typeFlag=="1"){
            			    $("#moNum").val($("#formId1_WOD_MO_NUM").val());
            			    $("#outNum").val($("#formId1_itemNum1").val());
            			}else if(typeFlag=="2"){
            			    $("#moNum").val($("#formId2_WOD_MO_NUM").val());
            			    $("#outNum").val($("#formId2_itemNum2").val());
            			}
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=d988643053e24739b3053b27980ce9e7";
                        document.forms.addForm.submit();
                        
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
