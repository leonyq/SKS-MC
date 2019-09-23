<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:481px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="89d3363bb50f4d9abd364d9fe2acdc9a" type="edit" />
		<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="89d3363bb50f4d9abd364d9fe2acdc9a" />
	<input type="hidden" name="89d3363bb50f4d9abd364d9fe2acdc9a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'77549aa28488446aa8dc33636b045328'" />
		<s:set name="_$formId_1" value="'89d3363bb50f4d9abd364d9fe2acdc9a'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_ITEM_CODE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_CODE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_ITEM_CODE" disabled="disabled" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_ITEM_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_ITEM_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_ITEM_SPEC" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_SPEC" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_ITEM_SPEC" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
		
		<!--
		    <td class="name" style="width: 70px;"/><span class="dot">*</span><bu:uitn colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><bu:uitn colNo="CO_PRODUCT_STEP" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PRODUCT_STEP" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_PRODUCT_STEP" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
		-->
		</tr>
		
		<tr>
            <td class="name" style="width: 70px;"/><bu:uitn colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" ><bu:ui colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="检查项目" /></h3>
			</div>
			<!--<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>-->
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="项目编码" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="项目名称" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="项目类型" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="生产阶别" />
												</td>
												<!--<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="默认标识" />
												</td>-->
												<td class="datagrid-cell" style="width:267px;">
													<dict:lang value="影响因素" />
												</td>
												<td class="datagrid-cell" style="width:100px;display:none;">
													<dict:lang value="" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:300px;">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" > <!--table-layout:fixed;-->
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
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:50px;top:10px;width:870px;height:390px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择明细信息" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchOutItem('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<table class="basic-table">
				<tr>
				    <td class="name" style="width: 80px;text-align: right;"/>
					<dict:lang value="项目编码" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="CO_PROJECT_CODE" id="SREACH_PRO_CODE" style="width:200px;" formId="89d3363bb50f4d9abd364d9fe2acdc9a" value="%{CO_PROJECT_CODE}" formIndex="1" /></td>
					
					<td class="name" style="width: 60px;text-align: right;"/>
					<dict:lang value="项目名称" />
					</td>
					<td class="dec" style="width: 200px;"><bu:ui colNo="CO_PROJECT_NAME" id="SREACH_PRO_NAME"  style="width:200px;" formId="89d3363bb50f4d9abd364d9fe2acdc9a" value="%{CO_PROJECT_NAME}" formIndex="1" /></td>
					
				</tr>
			</table>
			<div style="height:30px;"  class="datagrid-header-inner1">
				<table style="width:870px;" class="dlist-table table-line ">
					<thead>
						<tr>
							<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox"  id="item_list_cb" onchange="getAllItem2();" /></th>
							<th style="width: 150px;text-align: center;">
								<dict:lang value="项目编码" />
							</th>
							<th style="width: 150px;text-align: center;">
								<dict:lang value="项目名称" />
							</th>
							<th style="width: 120px;text-align: center;">
								<dict:lang value="项目类型" />
							</th>
							<th style="width: 80px;text-align: center;">
								<dict:lang value="默认标识" />
							</th>
							<th style="text-align: center;">
								<dict:lang value="影响因素" />
							</th>
						</tr>
					</thead>
				</table>
			</div>
			<div style="height:280px;"  class="scroll1">
				<table style="table-layout:fixed;width:868px;" class="dlist-table table-line " id="itemTable">
					<tbody id="itemTbody">
					</tbody>

				</table>

			</div>
			<div style="background-color: white;margin-top:20px;" id="pageDiv">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOutItem&formId=formId1&showLoading=0" />
			</div>
		</div>

	</div>
		</div>
			<bu:jsVal formId="89d3363bb50f4d9abd364d9fe2acdc9a" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
        var trrCount = 0;
        $(function(){
            //$("#paraMapObj_CO_ITEM_CODE").attr("disabled",true);
            $("#SREACH_PRO_NAME").removeAttr("disabled");
        })
        //全选
		function getAllItem() {
		//console.log($("#allSelects").attr("checked"));
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		function getAllItem2() {
			if($("#item_list_cb").attr("checked") == "checked") {
				$("#itemTbody :checkbox").attr("checked", true);
			} else {
				$("#itemTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
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
		
    	function searchOutItem(paginationImpl){
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=6bb8855d3e354d7c9baba03c563ae42d&formId=%{formId}";
        	SearchOutItemInfo(paginationImpl,url);
        }
        
    	function getItem(){ 
		//console.log(itemUrl);
		var templateName=$("#paraMapObj_CO_TEMPLATE_NAME").val();
		var dataId ='${dataId}';
		console.log(dataId);
		console.log(templateName);
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=6fd0aa7fc9a84dc99b18894c33f8a376";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data: {
		    	    "templateName":templateName,
		    	    "dataId":dataId
		    	},
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					console.log(data);
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].CO_PROJECT_CODE==null) rccList[i].CO_PROJECT_CODE="";
							if(rccList[i].CO_PROJECT_NAME==null) rccList[i].CO_PROJECT_NAME="";
							if(rccList[i].CO_PROJECT_TYPE==null) rccList[i].CO_PROJECT_TYPE="";
							if(rccList[i].PROJECT_TYPE_NAME==null) rccList[i].PROJECT_TYPE_NAME="";
							if(rccList[i].CO_DEFAULT==null) rccList[i].CO_DEFAULT="N";
							if(rccList[i].CO_AFFECT_INFO==null) rccList[i].CO_AFFECT_INFO="";
							if(rccList[i].AFFECT_INFO_NAME==null) rccList[i].AFFECT_INFO_NAME="";
							if(rccList[i].CO_STATE==null) rccList[i].CO_STATE="";
							if(rccList[i].PRODUCT_STEP==null) rccList[i].PRODUCT_STEP="";
							var tempFlag="";
							if(rccList[i].CO_DEFAULT=='Y') tempFlag="<img src='plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CO_DEFAULT=='N') tempFlag="<img src='plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							
						    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].CO_PROJECT_CODE+"'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].CO_PROJECT_CODE+"'>" + rccList[i].CO_PROJECT_CODE + "<input type='hidden' name='PROJECT_CODE' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].CO_PROJECT_NAME+"' >" + rccList[i].CO_PROJECT_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].PROJECT_TYPE_NAME+"'>" + rccList[i].PROJECT_TYPE_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].PRODUCT_STEP+"'>" + rccList[i].PRODUCT_STEP + "</td>");
        					//$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;' >" + tempFlag + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:267px;text-align: left;' title='"+rccList[i].CO_AFFECT_INFO+"'>" + rccList[i].CO_AFFECT_INFO + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;display:none;' ><input type='hidden' name='CO_STATE' value='"+rccList[i].CO_STATE+"'></td>");
    		
						}	
					
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				
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
   setPopScroll('.scroll','.datagrid-header-inner');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
   getItem();	
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
