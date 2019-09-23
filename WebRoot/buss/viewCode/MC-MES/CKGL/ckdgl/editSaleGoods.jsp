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
	//$("#tag1").addClass("current");
	$("#tag2").addClass("current");
	switchTag('tag2','content2','');
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		function popItemDiv(showId, backId) {
			$("#" + showId + ",#" + backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$("#paraMapObj_WOI_ITEM_TYPE_chosen").attr("style","width:200px;");
			addItemInfo();

		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
		//弹出物料选择界面
		function addItemInfo() {
			$("#itemCode").val("");//机种料号
			$("#itemName").val("");//面别
			$("#itemSpec").val("");//面别
			$("#paraMapObj_WOI_ITEM_TYPE").val("");//发料套数
			$("#paraMapObj_WOI_ITEM_TYPE").trigger("chosen:updated");
			var dataAuth = $("#deptLs_data_auth").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=08529f8efd764ff888e5598233580a59",
				data:{
				    "dataAuth":dataAuth
				},
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].ITEM_TYPE_NAME == null) rccList[i].ITEM_TYPE_NAME = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CUST_NAME == null) rccList[i].CUST_NAME = "";
							if(rccList[i].SUP_NAME == null) rccList[i].SUP_NAME = "";
							if(rccList[i].MIN_PACK==null) rccList[i].MIN_PACK="0";
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: center;'>" + rccList[i].SUP_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].SUP_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:162px;text-align: center;'>" + rccList[i].ITEM_TYPE_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_TYPE_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_NAME" + (i + 1) + "' value='" + rccList[i].CUST_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MIN_PACK" + (i + 1) + "' value='" + rccList[i].MIN_PACK + "'/></td>");
						}

					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103');
					defTableWidthRewrite('1d55b72cd2294215b11d41bcca95b103');

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		//div物料信息分页
		var paginationImpl = {};

		function searchOutItem(paginationImpl) {
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var itemCode = $.trim($("#itemCode").val());//物料料号
			var itemName = $.trim($("#itemName").val());//物料名称
			var itemSpec = $.trim($("#itemSpec").val());//物料规格
			var itemType = $.trim($("#paraMapObj_WOI_ITEM_TYPE").val());//物料类型
			var dataAuth = $("#deptLs_data_auth").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=8c58a0809b9844e8a629f0ae4c158aa5",
				data:{
				    "paraMap.type":1,
				    "paraMap.itemCode": itemCode,
				    "paraMap.itemName":itemName,
				    "paraMap.itemSpec": itemSpec,
				    "paraMap.itemType": itemType,
				    "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				    "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				    "dataAuth":dataAuth
				} ,
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].ITEM_TYPE_NAME == null) rccList[i].ITEM_TYPE_NAME = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CUST_NAME == null) rccList[i].CUST_NAME = "";
							if(rccList[i].SUP_NAME == null) rccList[i].SUP_NAME = "";
							if(rccList[i].MIN_PACK==null) rccList[i].MIN_PACK="0";
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:162px;text-align: center;'>" + rccList[i].SUP_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].SUP_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:162px;text-align: center;'>" + rccList[i].ITEM_TYPE_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_TYPE_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_NAME" + (i + 1) + "' value='" + rccList[i].CUST_NAME + "'/></td>");
							$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MIN_PACK" + (i + 1) + "' value='" + rccList[i].MIN_PACK + "'/></td>");
						}
					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103');
					defTableWidthRewrite('1d55b72cd2294215b11d41bcca95b103');

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
			$("#paraMap1_WOI_ITEM_TYPE_chosen").attr("style","width:200px;");
			$("#paraMap1_WOI_ITEM_TYPE_chosen").attr("style","width:200px;");
			var len = $("#addItemInfo tr").length;
			$("#itemTbody :checkbox").each(function() {
				var addItemObj=$(this);
				var addItemObjId=$(this).attr("id");
				var flagNum=0;
				if(addItemObj.attr("checked")) {
					$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#ITEM_CODE" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2)) {
							flagNum++;
						}
					});
					if(flagNum>0){
						utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料已存在，请跟换" />", 0, "260", "");
						return;
					}else{
						addConfirm(addItemObjId,len);
					}
					//mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					trrCount++;
					len = len + 1;

					var tableTrJs = $("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102');
					defTableWidthRewrite('1d55b72cd2294215b11d41bcca95b102');

				}
			})
			$("#itemTbody").empty();

			reSort("datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102");
			hideDiv(showId, backId);
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		function addConfirm(objId,len){
			var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;'>" + wmsOption + "</select>";
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/><input type='hidden' name='itemId' value=''/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>"+$("#ITEM_CODE"+objId).val()+"<input type='hidden' name='ITEM_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + $("#ITEM_NAME"+objId).val() + "</td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + $("#ITEM_SPEC"+objId).val() + "</td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 100px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#MIN_PACK"+objId).val()+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;padding:0;'><input type='text' style='width: 80px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_PLAN_NUM"+(trrCount+1)+"' name='PLAN_NUM' value='' oninput='OnInput2(event,\"CI_PLAN_NUM"+(trrCount+1)+"\")'/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;padding:0;'><input type='text' style='width: 120px;padding:0;text-align: left;' maxlength='50' class=' input isSubmit' name='CONNECT_NUM' value=''/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>" + wmsSel + "</td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;'>" + $("#CUST_NAME"+objId).val() + "<input type='hidden' name='CUST_NAME' value='" + $("#CUST_NAME"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='OUTSTOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
		}
		$(function() {
			getWmsSel();
		})
		var wmsOption;
		//获取仓库信息
		function getWmsSel() {
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00",
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
		    //先判断是否有物料明细信息
        var falg = 0;
	var delId;
	$('input[name="isSelect1"]:checkbox').each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$('input[name="isSelect1"]:checked').each(function(i){
    			if(i==0){
        			delId = $(this).val();
    			}else{
        			delId = delId + "," +$(this).val();
    			} 
		});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=6822d0d5dca54f83ae26f44c748053d7&checkId="+delId,
			    data: "",
				success: function(data){
				                
						util.closeLoading();
						if(null == data){return;}
						if(null != data){
							
							if(data.returnMsg=="addSucc"){
								utilsFp.confirmIcon(3,"","","", "<dict:lang value="有明细的物料不允许删除" />",0,"300","");
								return;
							}
							if(data.returnMsg=="addError"){
								$("#delIds").val(delId);
								//删除行
								$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 :checkbox").each(function(){
									if($(this).attr("checked")){
										var trid = $(this).parent().parent().attr("id");
			
										$("#"+trid).remove();
									}
								});
								reSort("datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102");
								var tableTrJs = $("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tbody tr");
								_tongLineColor(tableTrJs);
								clickTr('datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102');
								defTableWidthRewrite('1d55b72cd2294215b11d41bcca95b102');
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});	
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
				$("#itemCode").val("");//机种料号
				$("#itemName").val("");//面别
				$("#itemSpec").val("");//面别
				$("#paraMapObj_WOI_ITEM_TYPE").val("");//发料套数
				$("#paraMapObj_WOI_ITEM_TYPE").trigger("chosen:updated");
				$("#itemTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});
			}
		}
		function OnInput2(event,thisObj) {
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!(/^(\+|-)?\d+$/.test( newContent))){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入零或正整数" />");
				flag=true;
            }
        }
		function OnPropChanged (event) {
            if (event.propertyName.toLowerCase () == "value") {
                //alert ("The new content2: " + event.srcElement.value);
            }
        }
	</script>
</head>

<body>
	<div class="edit">
		<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
		<div class="hd">

			<!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
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
			<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>

	</div>
	<div class="bd" style="height:534px;">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_11" />
			<jsp:param name="location" value="editForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1d55b72cd2294215b11d41bcca95b1c9" type="edit" />
		<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
				<!--		<DIV class="hd">   -->
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
                        				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料信息">
                        					<i class="ico ico-kl-new-add ico-small"></i>
                        				</button>
                        				<button type="button" onclick="delRow();" style="padding:0" title="删除">
                        					<i class="ico ico-sc-new-add ico-small"></i>
                        				</button>
                        			</div>						
                                </LI>
							</UL>
				<!--		</DIV>  -->
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<table class="basic-table">
			        <input type="hidden" id="docNum" name="docNum" value="" />
			        <input type="hidden" id="delIds" name="delIds" value="" />
				<input type="hidden" name="formIds" value="1d55b72cd2294215b11d41bcca95b1c9" />
				<input type="hidden" name="formId" id="formId2" value='1d55b72cd2294215b11d41bcca95b102'/>
				<input type="hidden" name="formId" id="formId3" value='1d55b72cd2294215b11d41bcca95b103'/>
				<input type="hidden" name="1d55b72cd2294215b11d41bcca95b1c9" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'13f2b16d7c494b0e95c573e76dd92a40'" />
				<s:set name="_$formId_1" value="'1d55b72cd2294215b11d41bcca95b1c9'" />
				<s:set name="_$type" value="'edit'" />
				<tr>
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="WOI_DOC_NUM" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="WOI_DOC_NUM" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="WOI_DOC_NUM" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="T2#WOD_DOC_TYPE" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_DOC_TYPE" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#WOD_DOC_TYPE" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" />
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" style="width:200px;" colNo="T2#WOD_DISPATCH_SN" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_CUST_CODE" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_CUST_CODE" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#WOD_CUST_CODE" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" /><span class="dot">*</span>
					<bu:uitn colNo="T2#WOD_OUTSTOCK_DATE" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_OUTSTOCK_DATE" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#WOD_OUTSTOCK_DATE" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" />
					<bu:uitn colNo="T2#WOD_URGENT_FLAG" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_URGENT_FLAG" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#WOD_URGENT_FLAG" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>

                 <tr>
                 	<td class="name" />
					<bu:uitn colNo="T2#LOGISTICS_ID" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#LOGISTICS_ID" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#LOGISTICS_ID" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

                 	<td class="name" />
					<bu:uitn colNo="T2#CUST_ADDRESS" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#CUST_ADDRESS" formId="1d55b72cd2294215b11d41bcca95b1c9">
						<bu:ui colNo="T2#CUST_ADDRESS" style="width:200px;" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

                 </tr>
                 


				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_MEMO" formId="1d55b72cd2294215b11d41bcca95b1c9" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_MEMO" formId="1d55b72cd2294215b11d41bcca95b1c9" style="height:80px;" colspan="5">
						<bu:ui colNo="T2#WOD_MEMO" style="width:100%;height:100%" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
			</table>
			</div>
			<DIV id="content2" style="display:none" data-tab="tag2">
				
			
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner head1" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htable1d55b72cd2294215b11d41bcca95b102" >
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
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="标准包装数量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="计划数量" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="销售单号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="仓库" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="客户" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="出库日期" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll1" style="height:380px;">
								<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;"  id="datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102">
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
			<dict:lang value="选择物料" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 80px);">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="resetInfo('formId1');"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
				<button type="button" onclick="searchOutItem('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<table class="basic-table">
				<tr>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="物料料号" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="物料名称" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="itemName" name="itemName" class=" input isSubmit isaddSubmit" /></td>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="物料规格" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="itemSpec" name="itemSpec" class=" input isSubmit isaddSubmit" /></td>
				</tr>
				<tr>
					<td class="name" style="width: 70px;text-align: right;"/>
					<dict:lang value="物料类型" />
					</td>
					<bu:td cssClass="dec" colNo="WOI_ITEM_TYPE" formId="1d55b72cd2294215b11d41bcca95b1c9" >
						<bu:ui colNo="WOI_ITEM_TYPE" formId="1d55b72cd2294215b11d41bcca95b1c9" dataId="${dataId}" formIndex="1" />
					</bu:td>
				</tr>
			</table>
			<div class="panel datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="height:330px;">
			<div class="datagrid-header" style="">
    			<div style="height:30px;" class="datagrid-header-inner head2">
    				<table  class="datagrid-htable fixedTable " id="datagrid-htable1d55b72cd2294215b11d41bcca95b103">
    					<tbody>
    						<tr class="datagrid-header-row datagrid-title-ajax">
    							<td style="width: 30px;text-align: center;"></td>
    							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb" onchange="getAllItem();" /></td>
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
    								<dict:lang value="供应商" />
    							</td>
    							<td style="width: 162px;text-align: center;">
    								<dict:lang value="物料类型" />
    							</td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    							<td style="display:none;width: 202.5px;text-align: center;"></td>
    						</tr>
    					</tbody>
    				</table>
    			</div>
			</div>
			<div style="height:380px;"  class="scroll2">
				<table style="table-layout:fixed;" class="datagrid-htable fixedTable dlist-table table-line " id="datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b103">
					<tbody id="itemTbody">
					</tbody>

				</table>

			</div>
			</div>
			</div>
			<div style="background-color: white;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOutItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
	
	<bu:jsVal formId="1d55b72cd2294215b11d41bcca95b1c9" formIndex="1" />

	</div>
	</form>
	</div>
	<bu:submit viewId="13f2b16d7c494b0e95c573e76dd92a40" />
	<bu:script viewId="13f2b16d7c494b0e95c573e76dd92a40" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
	
	<script>

		function disable(){
	    document.getElementById("paraMapObj_T2#CUST_ADDRESS").disabled="";
	}
	window.onload=disable;
	</script>
	<script type="text/javascript">

	
	
		$(function() {
			//$("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
			$("#docNum").val($("#paraMapObj_WOI_DOC_NUM").val());
		  	getWmsSel();
			getItem();
		})
		
		
		//根据入库单号获取对应物料信息
		function getItem(){ 
		//console.log(itemUrl);
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=3c4ff53029cc4d08acd181f05659fe76";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl+"&docNum="+$("#paraMapObj_WOI_DOC_NUM").val(),
		    	data: "",
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].ITEM_CODE == null) rccList[i].ITEM_CODE = "";
							if(rccList[i].ITEM_NAME == null) rccList[i].ITEM_NAME = "";
							if(rccList[i].ITEM_SPEC == null) rccList[i].ITEM_SPEC = "";
							if(rccList[i].ITEM_TYPE_NAME == null) rccList[i].ITEM_TYPE_NAME = "";
							if(rccList[i].CUST_CODE == null) rccList[i].CUST_CODE = "";
							if(rccList[i].CUST_NAME == null) rccList[i].CUST_NAME = "";
							if(rccList[i].SUP_NAME == null) rccList[i].SUP_NAME = "";
							if(rccList[i].MIN_PACK==null) rccList[i].MIN_PACK="";
							if(rccList[i].WH_CODE==null) rccList[i].WH_CODE="";
							if(rccList[i].PLAN_NUM==null) rccList[i].PLAN_NUM="";
							if(rccList[i].CONNECT_NUM==null) rccList[i].CONNECT_NUM="";
							if(rccList[i].OUTSTOCK_DATE==null) rccList[i].OUTSTOCK_DATE="";
							var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;'>" + wmsOption + "</select>";
						
						    var themps="<tr id='trr" + (trrCount + 1) + "' >"
						              +"<td  style='width:30px;text-align: center;'>" + (i + 1) + "</td>"
						              +"<td  style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/><input type='hidden' name='itemId' value='"+rccList[i].ID+"'/></td>"
						              +"<td  style='width:120px;text-align: center;'>"+rccList[i].ITEM_CODE+"<input type='hidden' name='ITEM_CODE' value='" + rccList[i].ITEM_CODE + "'/></td>"
						              +"<td  style='width:120px;text-align: center;'>" + rccList[i].ITEM_NAME + "</td>"
						              +"<td  style='width:120px;text-align: center;'>" + rccList[i].ITEM_SPEC + "</td>"
						              +"<td  style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 100px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+rccList[i].MIN_PACK+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>"
						              +"<td  style='width:80px;text-align: center;padding:0;'><input type='text' style='width: 80px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_PLAN_NUM"+(trrCount+1)+"' name='PLAN_NUM' value='"+rccList[i].PLAN_NUM+"' oninput='OnInput2(event,\"CI_PLAN_NUM"+(trrCount+1)+"\")'/></td>"
						              +"<td  style='width:120px;text-align: center;padding:0;'><input type='text' style='width: 120px;padding:0;text-align: left;' maxlength='50' class=' input isSubmit' name='CONNECT_NUM' value='"+rccList[i].CONNECT_NUM+"'/></td>"
						              +"<td  style='width:120px;padding:0;'>" + wmsSel + "</td>"
						              +"<td  style='width:100px;text-align: left;'>" + rccList[i].CUST_NAME + "<input type='hidden' name='CUST_NAME' value='" + rccList[i].CUST_NAME + "'/></td>"
						              +"<td  style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + rccList[i].CUST_CODE + "'/></td>"
						              +"<td  style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' value='" + rccList[i].OUTSTOCK_DATE + "' name='OUTSTOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>"
						              
						$("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102").append(themps);
						//	mySetChosen();//设置下拉框样式
							$("#wmsSel_"+(trrCount+1)).val(rccList[i].WH_CODE);
							$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
							$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
							trrCount++;
						}	
					
						var tableTrJs = $("#datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax1d55b72cd2294215b11d41bcca95b102');
						defTableWidthRewrite('1d55b72cd2294215b11d41bcca95b102');
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
		function checkVal1(){  //计划数量
			var tempVal;
			var tempId;
			var tempFlag1;
			for(var i=1;i<=trrCount;i++){
				tempVal = $("#CI_PLAN_NUM"+i).val();
				if(tempVal==null) continue;
				if(tempVal==""){ 
					tempId = document.getElementById("CI_PLAN_NUM"+i);
					_alertValMsg(tempId,"<dict:lang value="该项不能为空" />");
				        return "0";
				}
				
			}
			return "1";
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
		function checkNum(tempVal,tempId){
			if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0){
				_alertValMsg(tempId,"<dict:lang value="该项必须为正整数" />");
				return "0";  
			}else 
			return "1"; 
		}
	</script>
	</script>
	<!-- js初始化方法 -->
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
	        
	function editInfo(){
                       
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
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请添加单据信息")}",0,"260","");
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加单据信息" />",0,"260","");
                           return;
                        }
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=9e4f3ec880ca494aa99d1219ff5f156b";
                        document.forms.editForm.submit();
}
	    
	 </script>
	 <script>
	    (function($){
            $(window).on('load',function(){
            setPopScroll('.scroll1','.head1');
            setPopScroll('.scroll2','.head2');
    	  })
        })(jQuery)
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