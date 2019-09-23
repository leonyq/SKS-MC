<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <style>
	    	.scroll tr:nth-of-type(2n){
	    	    background-color:#f0f4fd;
	    	}
	</style>
    <!-- 产品静态资源 -->
<script type="text/javascript">
	    var trrCount = 0;
		function popItemDiv(showId, backId) {
		    $("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
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
	</script>
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
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="01cd879dda5346a48b383622571bc6c2" type="edit" />
		<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="01cd879dda5346a48b383622571bc6c2" />
	<input type="hidden" name="01cd879dda5346a48b383622571bc6c2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'bf66f1d8a271460a86ee8b6265fb5e13'" />
		<s:set name="_$formId_1" value="'01cd879dda5346a48b383622571bc6c2'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width: 70px;"/><span class="dot">*</span><bu:uitn colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_CODE" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_CODE" readonly="readonly" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><span class="dot">*</span><bu:uitn colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_NAME" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width: 70px;"/><span class="dot">*</span><bu:uitn colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PROJECT_TYPE" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_AFFECT_INFO" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_PRODUCT_STEP" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="display:none;"/><bu:uitn colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec"  style="display:none;" colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_DEFAULT" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" ><bu:ui colNo="CO_REMARK" formId="01cd879dda5346a48b383622571bc6c2" dataId="${dataId}" formIndex="1"  style="width:100%; height:80px;"/></bu:td>
		</tr>
		
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="指示单项目责任人" /></h3>
				<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>
			</div>
			
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner">
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="部门" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="确认人" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="审核人" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:230px;">
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
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:300px;top:118px;width:400px;height:180px;">
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
			</div>

			<table class="basic-table">
				<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui style="width:230px;" id="CO_DEPT_ID" colNo="CO_DEPT_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_DEPT_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui colNo="CO_CONFIRM_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_CONFIRM_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CO_CHECK_ID" formId="02a4fef35fc845d5b563b1502e4760c0" /></td>
        			<bu:td  colNo="CO_CHECK_ID" cssClass="dec" formId="02a4fef35fc845d5b563b1502e4760c0" ><bu:ui colNo="CO_CHECK_ID" formId="02a4fef35fc845d5b563b1502e4760c0" value="%{CO_CHECK_ID}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<input type="hidden" name="DEPT_ID" id="DEPT_ID" value="" />
        			<input type="hidden" name="CONFIRM_EMP" id="CONFIRM_EMP" value="" />
        			<input type="hidden" name="CHECK_EMP" id="CHECK_EMP" value="" />
        		</tr>
			</table>
		</div>

	</div>
		</div>	
			
			<bu:jsVal formId="01cd879dda5346a48b383622571bc6c2" formIndex="1" />		<div style="padding:1px;"></div>

		
<script>
function initEditDataLs(){
getEditRows("02a4fef35fc845d5b563b1502e4760c0","2","01cd879dda5346a48b383622571bc6c2","","b066c434655c40229de8b7a8921b9c1b","");
$('table').find('tbody tr:eq(0)').click();
}
</script>

									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    <script type="text/javascript">	
        	 
        $(function(){
           		
        });
        //重置    
        function resetForm(){
            $("#editForm")[0].reset();
            $(".dept_select").trigger("chosen:updated");
		    getItem();	
        }

	    function delRow() {
		    var flag=false;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");

					$("#" + trid).remove();flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加明细信息" />", 0, "260", "");
				return;
			}
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		var trrCount=0;
		function addItemList(showId, backId) {
		    if($("#CO_DEPT_ID").val()==""){
	            _alertValMsg($("#CO_DEPT_ID_SHOW"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMapObj_CO_CONFIRM_ID").val()==""){
	            _alertValMsg($("#paraMapObj_CO_CONFIRM_ID_SHOW"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMapObj_CO_CHECK_ID").val()==""){
	            _alertValMsg($("#paraMapObj_CO_CHECK_ID_SHOW"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
    	    var deptId=$.trim($("#CO_DEPT_ID").val());
    	    var confirmEmp=$.trim($("#paraMapObj_CO_CONFIRM_ID").val());
    	    var checkEmp=$.trim($("#paraMapObj_CO_CHECK_ID").val());
    	    
    	    var deptStr=$.trim($("#DEPT_ID").val());
    	    var confirmEmpStr=$.trim($("#CONFIRM_EMP").val());
    	    var checkEmpStr=$.trim($("#CHECK_EMP").val());
    	    
		    var trs = $("#addItemInfo tr");
		    for(var j=0;j<trs.length;j++){
		         var oldDeptId=$.trim($("#addItemInfo tr:eq(" + j + ")").find("td:eq(2) input").val());
		         var oldConfirmEmp=$.trim($("#addItemInfo tr:eq(" + j + ")").find("td:eq(3)").text());
		         var oldCheckEmp=$.trim($("#addItemInfo tr:eq(" + j + ")").find("td:eq(4)").text());
		         
		         if(deptId==oldDeptId){
		             utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="	确认部门已存在，请更换" />", 0, "260", "");
                     return;
		         }
		    }
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_" + trrCount + "' ></tr>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (trrCount+1) + "</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input id='" + (trrCount + 1) + "' type='checkbox' name='isSelect1'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + deptStr + "<input type='hidden'	 name='DEPT_ID_VAL' id='DEPT_ID" + (trrCount + 1) + "' value='" + deptId + "'/></td>");	
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + confirmEmpStr + "<input type='hidden'	 name='CONFIRM_EMP_VAL' id='CONFIRM_EMP" + (trrCount + 1) + "' value='" + confirmEmp + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + checkEmpStr + "<input type='hidden'	 name='CHECK_EMP_VAL' id='CHECK_EMP" + (trrCount + 1) + "' value='" + checkEmp + "'/></td>");
			trrCount++;
			util.closeLoading();
			$("#CO_DEPT_ID_SHOW").val("");
	        $("#paraMapObj_CO_CONFIRM_ID_SHOW").val("");
	        $("#paraMapObj_CO_CHECK_ID_SHOW").val("");
	        $("#CO_DEPT_ID").val("");
	        $("#paraMapObj_CO_CONFIRM_ID").val("");
	        $("#paraMapObj_CO_CHECK_ID").val("");
			
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			hideDiv(showId, backId);
			
		}
		function editInfo(){
		    if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            } 
            if($("#paraMapObj_CO_PROJECT_CODE").val()==""){
	            _alertValMsg($("#paraMapObj_CO_PROJECT_CODE"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMapObj_CO_PROJECT_NAME").val()==""){
	            _alertValMsg($("#paraMapObj_CO_PROJECT_NAME"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMapObj_CO_PROJECT_TYPE").val()==""){
	            _alertValMsg($("#paraMapObj_CO_PROJECT_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
    	    var tableLength = $("#addItemInfo tr").length;
    	    //console.log(tableLength);
    	    if(tableLength==0){
    	        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加明细信息" />", 0, "260", "");
				return;
    	    }
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6cccb97fde4f405da9ae626585f5e100";
            document.forms.editForm.submit();
    	}
    	getItem();	
    	function getItem(){ 
		//console.log(itemUrl);
		var infoId=$("input[name='dataId']").val();
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=87be9b3fcab44c23a935c37bb6134507";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data: {
		    	  "infoId":infoId  
		    	},
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].DEPT_ID_VAL==null) rccList[i].DEPT_ID_VAL="";
							if(rccList[i].CONFIRM_ID_VAL==null) rccList[i].CONFIRM_ID_VAL="";
							if(rccList[i].CHECK_ID_VAL==null) rccList[i].CHECK_ID_VAL="";
							if(rccList[i].DEPT_NAME==null) rccList[i].DEPT_NAME="";
							if(rccList[i].CONFIRM_NAME==null) rccList[i].CONFIRM_NAME="";
							if(rccList[i].CHECK_NAME==null) rccList[i].CHECK_NAME="";
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/><input type='hidden' name='itemId' value='"+rccList[i].ID+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].DEPT_NAME + "<input type='hidden'	 name='DEPT_ID_VAL' id='DEPT_ID" + (i + 1) + "' value='" + rccList[i].DEPT_ID_VAL + "'/></td>");	
                			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].CONFIRM_NAME + "<input type='hidden'	 name='CONFIRM_EMP_VAL' id='CONFIRM_EMP" + (i + 1) + "' value='" + rccList[i].CONFIRM_ID_VAL + "'/></td>");
                			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].CHECK_NAME + "<input type='hidden'	 name='CHECK_EMP_VAL' id='CHECK_EMP" + (i + 1) + "' value='" + rccList[i].CHECK_ID_VAL + "'/></td>");
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
  })
})(jQuery)</script>

    
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
