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
    var t1 = window.setTimeout(setDocTypeVal,500);
    function setDocTypeVal(){
      $("#paraMap1_WSD_DOC_TYPE").val("DJ18");
	    $("#paraMap1_WSD_DOC_TYPE").trigger("chosen:updated");  
	    if($("#paraMap1_WSD_DOC_TYPE").val()=="DJ18"){
        window.clearTimeout(t1);
    }
    }
    
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
	
});

</script>
	<!-- head里面 -->
	<script type="text/javascript">
		var trrCount = 0;
		function popItemDiv(showId, backId) {
		
			$("#itemWhCode_chosen").attr("style","width:200px;");
			$("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable({cancel:'.dialog-bd-div'});
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
			$("#conCode").val("");//关联单号
			$("#itemWhCode").trigger("chosen:updated");
			util.showLoading("处理中...");
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=31f832aeb5374d6eb587bda81bf53ec1";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
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
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + rccList[i].ID + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SN+"'>" + rccList[i].ITEM_SN + "<input type='hidden' id='ITEM_SN" + rccList[i].ID + "' value='" + rccList[i].ITEM_SN + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: left;' title='"+rccList[i].WH_CODE_NAME+"'>" + rccList[i].WH_CODE_NAME + "<input type='hidden' id='WH_CODE_NAME" + rccList[i].ID + "' value='" + rccList[i].WH_CODE_NAME + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>" + rccList[i].ITEM_NUM + "<input type='hidden' id='ITEM_NUM" + rccList[i].ID + "' value='" + rccList[i].ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + rccList[i].ID + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + rccList[i].ID + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + rccList[i].ID + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:150px;text-align: center;' title='"+rccList[i].WH_CODE+"'>" + rccList[i].WH_CODE + "<input type='hidden' id='WH_CODE" + rccList[i].ID + "' value='" + rccList[i].WH_CODE + "'/></td>");
						}

					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403');
					defTableWidthRewrite('a0614fd913404e73a7141ce9ff13e403');

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
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			
			var itemSN = $.trim($("#itemSN").val());//物料料号
			var itemCode = $.trim($("#itemCode").val());//物料名称
			var itemWhCode = $.trim($("#itemWhCode").val());//物料规格
			var conCode = $.trim($("#conCode").val());//关联单号
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data: {
				    "paraMap.type" : 1,
				    "paraMap.itemSN" : itemSN,
				    "paraMap.itemCode" : itemCode,
				    "paraMap.itemWhCode" : itemWhCode,
				    "paraMap.conCode" : conCode,
				    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
				},
				//data: "paraMap.type=1&paraMap.itemSN=" + itemSN + "&paraMap.itemCode=" + itemCode + "&paraMap.itemWhCode=" + itemWhCode +"&paraMap.conCode=" + conCode + "&page.currentPage=" + _GLO_FORM_PAGE_MAP[paginationImpl].currentPage + "&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
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
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + rccList[i].ID + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SN+"'>" + rccList[i].ITEM_SN + "<input type='hidden' id='ITEM_SN" + rccList[i].ID + "' value='" + rccList[i].ITEM_SN + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:110px;text-align: left;' title='"+rccList[i].WH_CODE_NAME+"'>" + rccList[i].WH_CODE_NAME + "<input type='hidden' id='WH_CODE_NAME" + rccList[i].ID + "' value='" + rccList[i].WH_CODE_NAME + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>" + rccList[i].ITEM_NUM + "<input type='hidden' id='ITEM_NUM" + rccList[i].ID + "' value='" + rccList[i].ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>" + rccList[i].ITEM_CODE + "<input type='hidden' id='ITEM_CODE" + rccList[i].ID + "' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>" + rccList[i].ITEM_NAME + "<input type='hidden' id='ITEM_NAME" + rccList[i].ID + "' value='" + rccList[i].ITEM_NAME + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>" + rccList[i].ITEM_SPEC + "<input type='hidden' id='ITEM_SPEC" + rccList[i].ID + "' value='" + rccList[i].ITEM_SPEC + "'/></td>");
							$("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:150px;text-align: center;' title='"+rccList[i].WH_CODE+"'>" + rccList[i].WH_CODE + "<input type='hidden' id='WH_CODE" + rccList[i].ID + "' value='" + rccList[i].WH_CODE + "'/></td>");
						}
					}
					pageFun(data.ajaxPage, "formId1");
					var tableTrJs = $("#datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403');
					defTableWidthRewrite('a0614fd913404e73a7141ce9ff13e403');

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
				    if (!$("#trr"+addItemObjId).length) {
    					addConfirm(addItemObjId,len);
    					trrCount++;
    					len = len + 1;
                    }
					//var tableTrJs = $("#itemInfo tbody tr");
					//_tongLineColor(tableTrJs);
					//clickTr('itemInfo');

				}
			})
			$("#itemTbody").empty();

			reSort("datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234");
			hideDiv(showId, backId);
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
		}
		function addConfirm(objId,len){
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='trr" + objId + "' ></tr>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:147px;text-align: left;' title='"+$("#ITEM_SN"+objId).val()+"'>"+$("#ITEM_SN"+objId).val()+"<input type='hidden' name='ITEM_SN' value='" + $("#ITEM_SN"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+$("#WH_CODE_NAME"+objId).val()+"'>"+$("#WH_CODE_NAME"+objId).val()+"<input type='hidden' name='WH_CODE_NAME' value='" + $("#WH_CODE_NAME"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: right;' title='"+$("#ITEM_NUM"+objId).val()+"'>"+$("#ITEM_NUM"+objId).val()+"<input type='hidden' name='ITEM_NUM' value='" + $("#ITEM_NUM"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:147px;text-align: left;' title='"+$("#ITEM_CODE"+objId).val()+"'>"+$("#ITEM_CODE"+objId).val()+"<input type='hidden' name='ITEM_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:147px;text-align: left;' title='"+$("#ITEM_NAME"+objId).val()+"'>" + $("#ITEM_NAME"+objId).val() + "</td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:147px;text-align: left;' title='"+$("#ITEM_SPEC"+objId).val()+"'>" + $("#ITEM_SPEC"+objId).val() + "</td>");
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='display:none;width:150px;text-align: left;' title='"+$("#WH_CODE"+objId).val()+"'>"+$("#WH_CODE"+objId).val()+"<input type='hidden' name='WH_CODE' value='" + $("#ITEM_CODE"+objId).val() + "'/></td>");
			var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
				defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff1234");
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
			    </div>
			   
			</div>
			<div class="bd" style="height:564px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="a0614fd913404e73a7141ce9ff13e439" type="add" />
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff9b4a'/>
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
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
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;">
                        				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择物料信息">
                        					<i class="ico ico-kl-new-add ico-small"></i>
                        				</button>
                        				<button type="button" onclick="delRow();" style="padding:0" title="删除">
                        					<i class="ico ico-sc-new-add ico-small"></i>
                        				</button>
                        			</div>					
                                </LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="a0614fd913404e73a7141ce9ff13e439" />
	<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
	<input type="hidden" name="formId" id="formId3" value='a0614fd913404e73a7141ce9ff13e403'/>
	<input type="hidden" name="a0614fd913404e73a7141ce9ff13e439" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<s:set name="_$viewId" value="'51f778919202444f8bcfc2dd47de3598'" />
	<s:set name="_$formId_1" value="'a0614fd913404e73a7141ce9ff13e439'" />
	<s:set name="_$type" value="'add'" />
	<tr>
		<td class="name" /><span class="dot">*</span>
		<bu:uitn colNo="WSD_DOC_NUM" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WSD_DOC_NUM" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WSD_DOC_NUM" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WSD_DOC_NUM}" formIndex="1" /></bu:td>

		<td class="name" /><span class="dot">*</span>
		<bu:uitn colNo="WSD_DOC_TYPE" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WSD_DOC_TYPE" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WSD_DOC_TYPE" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WSD_DOC_TYPE}" formIndex="1" /></bu:td>

		<td class="name" />
		<bu:uitn colNo="WAD_SCARP_TYPE" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" style="width:200px;" colNo="WAD_SCARP_TYPE" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WAD_SCARP_TYPE" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WAD_SCARP_TYPE}" formIndex="1" /></bu:td>

	</tr>
	<tr>
		<td class="name" />
		<bu:uitn colNo="WAD_WH_CODE" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WAD_WH_CODE" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WAD_WH_CODE" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WAD_WH_CODE}" formIndex="1" /></bu:td>
	
		<td class="name" />
		<bu:uitn colNo="WSD_DUTY_DEPT" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WSD_DUTY_DEPT" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WSD_DUTY_DEPT" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WSD_DUTY_DEPT}" formIndex="1" /></bu:td>
		
		<td class="name" />
		<bu:uitn colNo="WSD_DUTY_EMP" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WSD_DUTY_EMP" formId="a0614fd913404e73a7141ce9ff13e439">
			<bu:ui colNo="WSD_DUTY_EMP" style="width:200px;" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WSD_DUTY_EMP}" formIndex="1" /></bu:td>

	</tr>
	<tr>
		<td class="name" />
		<bu:uitn colNo="WAD_SCARP_REASON" formId="a0614fd913404e73a7141ce9ff13e439" />
		</td>
		<bu:td cssClass="dec" colNo="WAD_SCARP_REASON" formId="a0614fd913404e73a7141ce9ff13e439" style="height:80px;" colspan="5">
			<bu:ui colNo="WAD_SCARP_REASON" style="width:100%;height:100%" formId="a0614fd913404e73a7141ce9ff13e439" value="%{WAD_SCARP_REASON}" formIndex="1" /></bu:td>

	</tr>
	</table>
	
	</div>
	 	<DIV id="content2" style="display:none" data-tab="tag2">      
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" >
								<div class="datagrid-header-inner 	head1" >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234" >
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax thcolor">
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
												<td class="datagrid-cell" style="display:none;width:150px;">
													<dict:lang value="物料规格" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll1" style="height:400px;">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
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
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:66px; left:90px;top:10px;width:870px;height:490px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择仓库物料" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
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
				<tr>
				    <td class="name" style="width: 100px;text-align: right;"/>
					<dict:lang value="关联单号" />
					</td>
					<td class="dec" style="width: 205px;"><input type="text"  style="width: 200px;" id="conCode" name="conCode" class=" input isSubmit isaddSubmit"/></td>
				</tr>
			</table>
			
			<div class="panel datagrid datagrid-div1">
				<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
					<div class="datagrid-header" style="width:100%;">
						<div class="datagrid-header-inner head2" style="width:100%;" id="datagrid-header-inner1">
							<table  class="datagrid-htable fixedTable  " id="datagrid-htablea0614fd913404e73a7141ce9ff13e403" >
								<tbody>
								<tr class="datagrid-header-row datagrid-title-ajax">
									<td style="width: 30px;text-align: center;"></td>
        							<td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb" onchange="getAllItem();" /></td>
        							<td class="datagrid-cell" style="width:150px;">
        								<dict:lang value="物料SN" />
        							</td>
        							<td class="datagrid-cell" style="width:110px;">
        								<dict:lang value="仓库" />
        							</td>
        							<td class="datagrid-cell" style="width:100px;">
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
        							<td class="datagrid-cell" style="display:none;width:150px;">
        								<dict:lang value="物料规格" />
        							</td>
								</tr>
								</tbody>		
							</table>
						</div>
					</div>
					<div class="datagrid-body datagrid-div3 scroll2"   style="height:310px;">
						<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e403" >
							<tbody id="itemTbody" >
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--<div style="height:30px;" class="datagrid-header-inner1">
				<table style="width:870px;" class="dlist-table table-line ">
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
			<div style="height: calc(100% - 145px);"  class="scroll1">
				<table style="table-layout:fixed;width:868px;" class="dlist-table table-line " id="itemTable">
					<tbody id="itemTbody">
					</tbody>

				</table>

			</div>-->
			
			
			<div style="background-color: white;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
	
			<bu:jsVal formId="a0614fd913404e73a7141ce9ff13e439" formIndex="1" />		<div style="padding:1px;"></div>

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
								<bu:addSub formid="a0614fd913404e73a7141ce9ff13e439" formIndex="2"  selfformid="1aad990f8a774aeaa80d6b02a13a12ef" hidecol=""  viewid="" />
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
	<bu:submit viewId="51f778919202444f8bcfc2dd47de3598" />
	<bu:script viewId="51f778919202444f8bcfc2dd47de3598" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			 $("#paraMap1_WSD_DOC_TYPE").val("DJ18");
			 $("#paraMap1_WSD_DOC_TYPE").trigger("chosen:updated");
			 $("#paraMap1_WSD_DOC_TYPE").attr("disabled",true);
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
		function delRow() {
		    var flag=false;
			$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");
                    var itemsn = $("#" + trid).find("td:eq(2)").text().trim();
                    itemSns.remove(itemsn);
					$("#" + trid).remove();flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择单据明细" />", 0, "260", "");
				return;
			}
			reSort("datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234");
			var tableTrJs = $("#itemdatagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234Info tbody tr");
			//_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234');
			
			defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff1234');
		}
		//重新排序
		function reSort(objid) {

			var i = 1;
			$("#" + objid + " tbody tr").each(function() {

				$(this).find("td").eq(0).text(i);

				i++;
			});
		}
		
		
		function searchItem(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1e8500fa425b4ca7a70c7f28f1921545&formId=%{formId}";

	SearchItemInfo(paginationImpl,url);
}

var itemSns = new Map();

function addInfo(){      
           var flag = true;             
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
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请添加单据明细信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加单据明细信息" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        $("#addItemInfo tr").each(function(){
                            var itemSn = $(this).find("td").eq(2).text().trim();
                            if(itemSns.get(itemSn)!=null){
                                console.log(itemSns.get(itemSn));
                                flag = false;
                                return;
                            }
                        });
                        if(flag){
                            $("#addItemInfo tr").each(function(){
                                var itemSn = $(this).find("td").eq(2).text().trim();
                                itemSns.put(itemSn,itemSn);
                            });
                            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5a5269e33677482c8ca5b4d619d9645e";
                            document.forms.addForm.submit();
                        }else{
                            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="单据明细的存在已经报废的物料SN，不能重复报废 " />", 0, "260", "");
                        }
                        
                        
}

	</script>
	<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll1','.head1');
   setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
