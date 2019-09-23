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
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0ba4f69d14b442ec95bba6ace4d8247d" type="edit" />
	<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0ba4f69d14b442ec95bba6ace4d8247d" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" id="prefixInd" name="0ba4f69d14b442ec95bba6ace4d8247d" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a700acacf7ad40f1b552855e8bcc4ab5'" />
		<s:set name="_$formId_1" value="'0ba4f69d14b442ec95bba6ace4d8247d'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_INDICATORR_SN" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_INDICATORR_SN" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_INDICATORR_SN" disabled="disabled" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_MODEL_CODE" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_MODEL_CODE" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_MODEL_CODE"  disabled="disabled" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_TEMPLATE_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_TEMPLATE_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_TEMPLATE_NAME"  disabled="disabled" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ITEM_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_ITEM_NAME" disabled="disabled" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ITEM_SPEC" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_SPEC" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_ITEM_SPEC" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_STATE" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_STATE" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_STATE"  formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_MEMO" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CO_MEMO" formId="0ba4f69d14b442ec95bba6ace4d8247d" ><bu:ui colNo="CO_MEMO" style="height:80px;width:100%" formId="0ba4f69d14b442ec95bba6ace4d8247d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="明细信息" /></h3>
			</div>
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner"  >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="检查项目" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="修改时间" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="状态" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="部门" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="确认人" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="确认时间" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="审核人" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="审核时间" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="影响因素" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:170px;">
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
		</div>
			<bu:jsVal formId="0ba4f69d14b442ec95bba6ace4d8247d" formIndex="1" />
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
        $(function(){
            
        })
        var trrCount=0;
        sreachItemInfo();
        function sreachItemInfo(){
            var indicatorId=$("input[name='dataId']").val();
            var modelCode=$.trim($("#paraMapObj_CO_MODEL_CODE").val());
            var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=76d0b348eb7e4c57b4666325acaac326";
			//util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data: {
		    	 "indicatorId":indicatorId,
		    	 "modelCode":modelCode
		    	},
				success: function(data){
		        	$("#addItemInfo").empty();
					//util.closeLoading();
					//console.log(data);
					var stateFlag=true;
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].ID==null) rccList[i].ID="";
							if(rccList[i].CO_PROJECT_CODE==null) rccList[i].CO_PROJECT_CODE="";
							if(rccList[i].CO_PROJECT_NAME==null) rccList[i].CO_PROJECT_NAME="";
							if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
							if(rccList[i].CO_STATE==null) rccList[i].CO_STATE="1";
							if(rccList[i].CO_DEPT_ID==null) rccList[i].CO_DEPT_ID="";
							if(rccList[i].CO_DEPT_NAME==null) rccList[i].CO_DEPT_NAME="";
							if(rccList[i].CO_CONFIRM_ID==null) rccList[i].CO_CONFIRM_ID="";
							if(rccList[i].CO_CONFIRM_NAME==null) rccList[i].CO_CONFIRM_NAME="";
							if(rccList[i].CO_CONFIRM_TIME==null) rccList[i].CO_CONFIRM_TIME="";
							if(rccList[i].CO_CHECK_ID==null) rccList[i].CO_CHECK_ID="";
							if(rccList[i].CO_CHECK_NAME==null) rccList[i].CO_CHECK_NAME="";
							if(rccList[i].CO_CHECK_TIME==null) rccList[i].CO_CHECK_TIME="";
							if(rccList[i].CO_AFFECT_INFO==null) rccList[i].CO_AFFECT_INFO="";
							if(rccList[i].AFFECT_INFO_NAME==null) rccList[i].AFFECT_INFO_NAME="";
							var tempFlag="";
							if(rccList[i].CO_STATE=='1'){ tempFlag="<span class='state' style='background-color:#ff9900;color:#FFFFFF;width:45px'>未确认</span>";}
							else if(rccList[i].CO_STATE=='2') {tempFlag="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>已确认</span>";}
							else if(rccList[i].CO_STATE=='3') {tempFlag="<span class='state' style='background-color:#4a86e8;color:#FFFFFF;width:45px'>已审核</span>";}
							var coState=rccList[i].CO_STATE;
							
							if(coState=="" || coState=="1"){
							    stateFlag=false;
							}
							var tempTime1=(rccList[i].CO_CONFIRM_TIME).replace("T", " ");
							var tempTime2=(rccList[i].CO_CHECK_TIME).replace("T", " ");
							var tempTime3=(rccList[i].EDIT_TIME).replace("T", " ");
						    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (i + 1) + "' ></tr>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' name='INFO_ID' id='INFO_ID"+(trrCount+1)+"' value='"+rccList[i].ID+"'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+(trrCount+1)+"' name='isSelect1'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+rccList[i].CO_PROJECT_NAME+"'>" + rccList[i].CO_PROJECT_NAME + "<input type='hidden' name='PROJECT_CODE' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+tempTime3+"' >" + tempTime3 + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:80px;text-align: center;' >" + tempFlag + "<input type='hidden' name='CO_STATE' value='" + rccList[i].CO_STATE + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;' title='"+rccList[i].CO_DEPT_NAME+"'>" + rccList[i].CO_DEPT_NAME + "<input type='hidden' name='DEPT_ID' value='" + rccList[i].CO_DEPT_ID + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;' title='"+rccList[i].CO_CONFIRM_NAME+"'>" + rccList[i].CO_CONFIRM_NAME + "<input type='hidden' name='CONFIRM_ID' id='CONFIRM_ID"+(trrCount+1)+"' value='" + rccList[i].CO_CONFIRM_ID + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: center;' title='"+tempTime1+"'>" + tempTime1 + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: center;' title='"+rccList[i].CO_CHECK_NAME+"'>" + rccList[i].CO_CHECK_NAME + "<input type='hidden' name='CHECK_ID' id='CHECK_ID"+(trrCount+1)+"' value='" + rccList[i].CO_CHECK_ID + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: center;' title='"+tempTime2+"'>" + tempTime2 + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: left;' title='"+rccList[i].AFFECT_INFO_NAME+"'>" + rccList[i].AFFECT_INFO_NAME + "<input type='hidden' name='AFFECT_INFO' value='" + rccList[i].CO_AFFECT_INFO + "'/></td>");
    		                trrCount++;
						}	
					    	
                        if(stateFlag==true){
                            //全部确认 已审核
                            $("#paraMap1_CO_STATE_chosen").removeAttr("disabled");
						    $("#paraMap1_CO_STATE").find("option[value='2']").attr("selected",true);
						    $("#paraMap1_CO_STATE").trigger("chosen:updated");
						    $("#paraMap1_CO_STATE_chosen").attr("disabled",true);
						    $("#state").val("2");
                        }else{
                            //待审核
                            $("#paraMap1_CO_STATE_chosen").removeAttr("disabled");
						    $("#paraMap1_CO_STATE").find("option[value='1']").attr("selected",true);
						    $("#paraMap1_CO_STATE").trigger("chosen:updated");
						    $("#paraMap1_CO_STATE_chosen").attr("disabled",true);
						    $("#state").val("1");
                        }
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('addItemInfo');
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				
				},
				error: function(msg){
					//util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    }
			});
        }
        function clearItemInfo(){
            $("#addItemInfo").empty();
        }
        //全选
		function getAllItem() {
		console.log($("#allSelects").attr("checked"));
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
		function checkInfoFlag(checkBoxId){
			var flag=false;
			$(checkBoxId).each(function(){
				if($(this).attr("checked")){
				
					flag=true;
				}
			});
			return flag;
		}
		
    </script>
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
