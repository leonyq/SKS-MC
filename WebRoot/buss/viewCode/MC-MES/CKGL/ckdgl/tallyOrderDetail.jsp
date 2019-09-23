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
	<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		function popItemDiv(showId, backId) {
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
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
			$("#paraMapObj_WOD_ITEM_TYPE").val("");//发料套数
			$("#paraMapObj_WOD_ITEM_TYPE").trigger("chosen:updated");
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url:  "buss/bussModel_exeFunc.ms?funcMId=08529f8efd764ff888e5598233580a59",
				data: "",
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
							$("#itemTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].SUP_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].SUP_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_TYPE_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_TYPE_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_NAME" + (i + 1) + "' value='" + rccList[i].CUST_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MIN_PACK" + (i + 1) + "' value='" + rccList[i].MIN_PACK + "'/></td>");
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

		function searchOutItem(paginationImpl) {
		    var searchOutInfo = "${path}buss/bussModel_exeFunc.ms?funcMId=8c58a0809b9844e8a629f0ae4c158aa5";
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var itemCode = $.trim($("#itemCode").val());//物料料号
			var itemName = $.trim($("#itemName").val());//物料名称
			var itemSpec = $.trim($("#itemSpec").val());//物料规格
			var itemType = $.trim($("#paraMapObj_WOI_ITEM_TYPE").val());//物料类型
			
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=8c58a0809b9844e8a629f0ae4c158aa5",
				data: {
			        "paraMap.type" : "1",
			        "paraMap.itemCode" : itemCode,
			        "paraMap.itemName" : itemName,
			        "paraMap.itemSpec" : itemSpec,
			        "paraMap.itemType" : itemType,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			
				
				
				
	
				//"paraMap.type=1&paraMap.itemCode=" + itemCode + "&paraMap.itemName=" + itemName + "&paraMap.itemSpec=" + itemSpec + "&paraMap.itemType=" + itemType  + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
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
							$("#itemTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:162px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:162px;text-align: center;'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].SUP_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].SUP_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:162px;text-align: center;'>" + rccList[i].ITEM_TYPE_NAME + "<input type='hidden' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].ITEM_TYPE_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_CODE" + (i + 1) + "' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='CUST_NAME" + (i + 1) + "' value='" + rccList[i].CUST_NAME + "'/></td>");
							$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:202.5px;text-align: right;display:none'><input type='hidden' id='MIN_PACK" + (i + 1) + "' value='" + rccList[i].MIN_PACK + "'/></td>");
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
				var flagNum=0;
				if(addItemObj.attr("checked")) {
					$("#itemInfo tr").each(function() {
						var itemObj=$(this);
						var tempItemCode1 = itemObj.find("td:eq(2)").text();
						var tempItemCode2=$("#ITEM_CODE" + addItemObj.attr("id")).val();
						if($.trim(tempItemCode1) == $.trim(tempItemCode2)) {
							flagNum++;
						}
					});
					if(flagNum>0){
						utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料已存在，请跟换" />", 0, "260", "");
					}else{
						addConfirm(addItemObjId,len);
					}
					mySetChosen(); //设置下拉框样式
					$("#wmsSel_" + (trrCount+1) + "_chosen").attr("style", "width:120px;");
					//$(".chosen-container").css("width","100%;");
					trrCount++;
					len = len + 1;

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
		function addConfirm(objId,len){
			var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;'>" + wmsOption + "</select>";
			$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>"+$("#ITEM_CODE"+objId).val()+"<input type='hidden' name='ITEM_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + $("#ITEM_NAME"+objId).val() + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + $("#ITEM_SPEC"+objId).val() + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 100px;padding:0;text-align: right;' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+$("#MIN_PACK"+objId).val()+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;padding:0;'><input type='text' style='width: 80px;padding:0;text-align: right;' class=' input isSubmit' id='CI_PLAN_NUM"+(trrCount+1)+"' name='PLAN_NUM' value='' oninput='OnInput2(event,\"CI_PLAN_NUM"+(trrCount+1)+"\")'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;padding:0;'><input type='text' style='width: 120px;padding:0;text-align: left;' class=' input isSubmit' name='CONNECT_NUM' value=''/></td>");
			/*$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_" + (trrCount + 1) + "' name='PLAN_NUM' value=''/></td>");*/
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>" + wmsSel + "</td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;'>" + $("#CUST_NAME"+objId).val() + "<input type='hidden' name='CUST_NAME' value='" + $("#CUST_NAME"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + $("#CUST_CODE"+objId).val() + "'/></td>");
			$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:130px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='OUTSTOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
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

					$("#" + trid).remove();flag=true;
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
				$("#itemCode").val("");//机种料号
				$("#itemName").val("");//面别
				$("#itemSpec").val("");//面别
				$("#paraMapObj_WOD_ITEM_TYPE").val("");//发料套数
				$("#paraMapObj_WOD_ITEM_TYPE").trigger("chosen:updated");
				$("#itemTbody :checkbox").each(function(){
					$(this).attr("checked",false);
				});
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
	</script>
</head>

<body style="background-color: white;">
	<div class="edit">
		<form id="detailForm" name="detailForm" action="#" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
		<div class="hd" style="display: none;">

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
			<button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>

	</div>
	<div class="bd">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_18" />
			<jsp:param name="location" value="detailForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="747171193cf444a784fe3b339285e612" type="edit" />
		<div class="mod">
			<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
			<table class="basic-table" id="myTable">
				<input type="hidden" name="formIds" value="747171193cf444a784fe3b339285e612" />
				<input type="hidden" name="747171193cf444a784fe3b339285e612" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'1734995425f849f588b17cdba8346e30'" />
				<s:set name="_$formId_1" value="'747171193cf444a784fe3b339285e612'" />
				<s:set name="_$type" value="'detail'" />
				<tr>
					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="WOI_DOC_NUM" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="WOI_DOC_NUM" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="WOI_DOC_NUM" style="width:210px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T5#WDT_TYPE_NAME" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T5#WDT_TYPE_NAME" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T5#WDT_TYPE_NAME" style="width:210px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" style="width:210px;" colNo="T2#WOD_DISPATCH_SN" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:210px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="T8#SUPPLIER_NAME" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T8#SUPPLIER_NAME" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T8#SUPPLIER_NAME" style="width:200px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>
				
					<td class="name" />
					<bu:uitn colNo="T2#WOD_OUTSTOCK_DATE" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_OUTSTOCK_DATE" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T2#WOD_OUTSTOCK_DATE" style="width:200px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" />
					<bu:uitn colNo="T2#WOD_URGENT_FLAG" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_URGENT_FLAG" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T2#WOD_URGENT_FLAG" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
                <tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_STATUS" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_STATUS" formId="747171193cf444a784fe3b339285e612">
						<bu:ui colNo="T2#WOD_STATUS" style="width:200px;" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_MEMO" formId="747171193cf444a784fe3b339285e612" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_MEMO" formId="747171193cf444a784fe3b339285e612" style="height:80px;" colspan="5">
						<bu:ui colNo="T2#WOD_MEMO" style="width:100%;height:100%" formId="747171193cf444a784fe3b339285e612" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
			</table>
			<div class="mod-hd">
				<h3 class="tit"><dict:lang value="单据明细" /></h3>
			</div>
			<div class="extend-btn" id="addDel" style="display:none;float: right;margin-top:5px;margin-bottom:5px;">
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
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:1000px;">
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
												<!--<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="销售单号" />
												</td>-->
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="仓库" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="客户" />
												</td>
												<td class="datagrid-cell">
													<dict:lang value="出库日期" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:150px;">
								<table class="dlist-table table-line" style="width:1000px;table-layout:fixed;" id="itemInfo">
									<tbody id="addItemInfo">
									</tbody>
								</table>
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
					<bu:td cssClass="dec" colNo="WOD_ITEM_TYPE" formId="747171193cf444a784fe3b339285e612" >
						<bu:ui colNo="WOD_ITEM_TYPE" formId="747171193cf444a784fe3b339285e612" value="%{WOD_ITEM_TYPE}" formIndex="1" />
					</bu:td>
				</tr>
			</table>
			<div style="width:870px;height:30px;">
				<table width="870px" class="dlist-table table-line ">
					<thead>
						<tr>
							<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb" onchange="getAllItem();" /></th>
							<th style="width: 162px;text-align: center;">
								<dict:lang value="物料料号" />
							</th>
							<th style="width: 162px;text-align: center;">
								<dict:lang value="物料名称" />
							</th>
							<th style="width: 162px;text-align: center;">
								<dict:lang value="物料规格" />
							</th>
							<th style="width: 162px;text-align: center;">
								<dict:lang value="供应商" />
							</th>
							<th style="width: 162px;text-align: center;">
								<dict:lang value="物料类型" />
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
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOutItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
	
	<bu:jsVal formId="747171193cf444a784fe3b339285e612" formIndex="1" />

	</div>
	</form>
	</div>
	<bu:submit viewId="1734995425f849f588b17cdba8346e30" />
	<bu:script viewId="1734995425f849f588b17cdba8346e30" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			//$("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
			$("#docNum").val($("#paraMapObj_WOI_DOC_NUM").val());
		  	getWmsSel();
			getItem();
		})
		
		var wmsOption;
		//获取仓库信息
		function getWmsSel() {
	
			$.ajax({
				type: "POST",
				dataType: "json",
				url:  "buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00",
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
		
		//根据入库单号获取对应物料信息
		function getItem(){ 
	 
		//console.log(itemUrl);
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url:   "buss/bussModel_exeFunc.ms?funcMId=3c4ff53029cc4d08acd181f05659fe76",//+"&docNum="+$("#paraMapObj_WOI_DOC_NUM").val(),
		    	data: {
			        "docNum":$("#paraMapObj_WOI_DOC_NUM").val(),
			    },
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
							var wmsSel = "<select id='wmsSel_" + (trrCount + 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;width:120px;' disabled='disabled'>" + wmsOption + "</select>";
							$("#itemInfo tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i+ 1) + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>"+rccList[i].ITEM_CODE+"<input type='hidden' name='ITEM_CODE' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + rccList[i].ITEM_NAME + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + rccList[i].ITEM_SPEC + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 100px;padding:0;text-align: right;background-color:white;border:1px solid #ccc;' disabled='disabled' class=' input isSubmit' id='CI_MIN_PACK"+(trrCount+1)+"' name='MIN_PACK' value='"+rccList[i].MIN_PACK+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(trrCount+1)+"\")'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;padding:0;'><input type='text' style='width: 80px;padding:0;text-align: right;background-color:white;border:1px solid #ccc;' disabled='disabled' class=' input isSubmit' id='CI_PLAN_NUM"+(trrCount+1)+"' name='PLAN_NUM' value='"+rccList[i].PLAN_NUM+"' oninput='OnInput2(event,\"CI_PLAN_NUM"+(trrCount+1)+"\")'/></td>");
							//$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;padding:0;'><input type='text' style='width: 120px;padding:0;text-align: left;' class=' input isSubmit' name='CONNECT_NUM' value='"+rccList[i].CONNECT_NUM+"'/></td>");
							/*$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;' class=' input isSubmit' id='PLAN_NUM_" + (trrCount + 1) + "' name='PLAN_NUM' value=''/></td>");*/
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;padding:0;'>" + wmsSel + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: left;'>" + rccList[i].SUP_NAME + "<input type='hidden' name='SUP_NAME' value='" + rccList[i].SUP_NAME + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: center;display:none;'><input type='hidden' name='CUST_CODE' value='" + rccList[i].CUST_CODE + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' disabled='disabled' value='" + rccList[i].OUTSTOCK_DATE + "' name='OUTSTOCK_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})'/></td>");
							mySetChosen();//设置下拉框样式
							$("#wmsSel_"+(trrCount+1)).val(rccList[i].WH_CODE);
							$("#wmsSel_"+(trrCount+1)).trigger("chosen:updated");
							$("#wmsSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
							trrCount++;
						}	
					
						var tableTrJs = $("#itemInfo tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('itemInfo');
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
				tempVal = $("#CI_PLAN_NUM_"+i).val();
				if(tempVal==null) continue;
				if(tempVal!=""){ 
					tempId = document.getElementById("CI_PLAN_NUM_"+i);
					tempFlag1 = checkNum(tempVal,tempId);
				}
				if(tempFlag1=="0")
				return "0";
			}
			
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
	        
	
	    
	 </script>
	 <script>
	    (function($){
            $(window).on('load',function(){
            setPopScroll('.scroll','.datagrid-header-inner');
    	  })
        })(jQuery)
     </script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_18" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>