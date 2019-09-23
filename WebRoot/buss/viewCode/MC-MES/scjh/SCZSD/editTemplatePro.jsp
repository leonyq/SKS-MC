<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <!-- 产品静态资源 -->
<script type="text/javascript">
	    
		function popItemDiv(showId, backId) {
		    $("#" + showId + ",#" + backId).show();
			$("#"+showId).draggable({cancel:'.datagrid-div1'});
			addItemInfo();
		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
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
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请至少选择一条数据" />", 0, "260", "");
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
		
		
		
		
		//弹出料站表选择界面
		function addItemInfo() {
		    $("#paraMap1_CO_PROJECT_CODE").val("");//项目编码
		    $("#paraMap1_CO_PROJECT_NAME").val("");//项目名称
			
			$("#itemTbody").empty();
			util.showLoading("处理中...");
			var getOutItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=52632e7bf20e428ba491d9b307c5c3c7&formId=%{formId}";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getOutItemUrl,
				data: "",
				success: function(data) {
				    
					$("#itemTbody").empty();
					util.closeLoading();
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CO_PROJECT_CODE == null) rccList[i].CO_PROJECT_CODE = "";
							if(rccList[i].CO_PROJECT_NAME == null) rccList[i].CO_PROJECT_NAME = "";
							if(rccList[i].CO_PROJECT_TYPE == null) rccList[i].CO_PROJECT_TYPE = "";
							if(rccList[i].PROJECT_TYPE_NAME == null) rccList[i].PROJECT_TYPE_NAME = "";
							if(rccList[i].CO_DEFAULT == null) rccList[i].CO_DEFAULT = "";
							if(rccList[i].CO_AFFECT_INFO == null) rccList[i].CO_AFFECT_INFO = "";	
							//if(rccList[i].PRODUCT_STEP == "null") rccList[i].PRODUCT_STEP = "";	
                            var tempFlag="";
							if(rccList[i].CO_DEFAULT=='Y') tempFlag="<img src='plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CO_DEFAULT=='N') tempFlag="<img src='plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							$("#datagrid-btable-ajax456789 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;'>" + rccList[i].CO_PROJECT_CODE + "<input type='hidden' id='CO_PROJECT_CODE" + (i + 1) + "' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;'>" + rccList[i].CO_PROJECT_NAME + "<input type='hidden' id='CO_PROJECT_NAME" + (i + 1) + "' value='" + rccList[i].CO_PROJECT_NAME + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;'>" + rccList[i].PROJECT_TYPE_NAME + "<input type='hidden' id='PROJECT_TYPE_NAME" + (i + 1) + "' value='" + rccList[i].PROJECT_TYPE_NAME + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: left;'>" + (rccList[i].PRODUCT_STEP==null?"":rccList[i].PRODUCT_STEP) + "<input type='hidden' id='PRODUCT_STEP" + (i + 1) + "' value='" + (rccList[i].PRODUCT_STEP==null?"":rccList[i].PRODUCT_STEP) + "'/></td>");
							
							//$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;'>" + tempFlag + "</td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' >" + rccList[i].CO_AFFECT_INFO + "<input type='hidden' id='CO_AFFECT_INFO" + (i + 1) + "' value='" + rccList[i].CO_AFFECT_INFO + "'/></td>");
							
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align: right;display:none'><input type='hidden' id='CO_DEFAULT" + (i + 1) + "' value='" + rccList[i].CO_DEFAULT + "'/></td>");
					
						}
                        
					}
					pageFun(data.ajaxPage, "formId3");
					var tableTrJs = $("#datagrid-btable-ajax456789 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax456789');
					defTableWidthRewrite("456789");

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
			
		}
		//div料站信息分页
		var paginationImpl = {};

		function SearchOutItemInfo(paginationImpl, url) {
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var itemCode=$.trim($("#SREACH_PRO_CODE").val());//项目编码
		    var proName=$.trim($("#SREACH_PRO_NAME").val());//项目名称
		    console.log(itemCode);
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: url,
				data:{
				  "paraMap.type":"1",
				  "paraMap.itemCode":itemCode,
				  "paraMap.proName":proName,
				  "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				  "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
				},
				success: function(data) {
					$("#itemTbody").empty();
					util.closeLoading();
					console.log(data);
					if(null != data.ajaxPage.dataList) {
						var rccList = eval(data.ajaxPage.dataList);//console.log(rccList);
						for(var i = 0; i < rccList.length; i++) {
							if(rccList[i].CO_PROJECT_CODE == null) rccList[i].CO_PROJECT_CODE = "";
							if(rccList[i].CO_PROJECT_NAME == null) rccList[i].CO_PROJECT_NAME = "";
							if(rccList[i].CO_PROJECT_TYPE == null) rccList[i].CO_PROJECT_TYPE = "";
							if(rccList[i].PROJECT_TYPE_NAME == null) rccList[i].PROJECT_TYPE_NAME = "";
							if(rccList[i].CO_DEFAULT == null) rccList[i].CO_DEFAULT = "";
							if(rccList[i].CO_AFFECT_INFO == null) rccList[i].CO_AFFECT_INFO = "";
							//if(rccList[i].PRODUCT_STEP == "null") rccList[i].PRODUCT_STEP = "";	
                            var tempFlag="";
							if(rccList[i].CO_DEFAULT=='Y') tempFlag="<img src='plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CO_DEFAULT=='N') tempFlag="<img src='plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							$("#datagrid-btable-ajax456789 tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "<input type='hidden' id='WSI_ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;'>" + rccList[i].CO_PROJECT_CODE + "<input type='hidden' id='CO_PROJECT_CODE" + (i + 1) + "' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;'>" + rccList[i].CO_PROJECT_NAME + "<input type='hidden' id='CO_PROJECT_NAME" + (i + 1) + "' value='" + rccList[i].CO_PROJECT_NAME + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;'>" + rccList[i].PROJECT_TYPE_NAME + "<input type='hidden' id='PROJECT_TYPE_NAME" + (i + 1) + "' value='" + rccList[i].PROJECT_TYPE_NAME + "'/></td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: left;'>" + (rccList[i].PRODUCT_STEP==null?"":rccList[i].PRODUCT_STEP) + "<input type='hidden' id='PRODUCT_STEP" + (i + 1) + "' value='" + (rccList[i].PRODUCT_STEP==null?"":rccList[i].PRODUCT_STEP) + "'/></td>");
							
							//$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;'>" + tempFlag + "</td>");
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' >" + rccList[i].CO_AFFECT_INFO + "<input type='hidden' id='CO_AFFECT_INFO" + (i + 1) + "' value='" + rccList[i].CO_AFFECT_INFO + "'/></td>");
							
							$("#datagrid-btable-ajax456789 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align: right;display:none'><input type='hidden' id='CO_DEFAULT" + (i + 1) + "' value='" + rccList[i].CO_DEFAULT + "'/></td>");
						    
						}

					}
					pageFun(data.ajaxPage, "formId3");
					var tableTrJs = $("#datagrid-btable-ajax456789 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax456789');
					defTableWidthRewrite("456789");

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
		}
		
		//保存选择的信息
		function addItemList(showId, backId) {
			var len = $("#addItemInfo tr").length;
			var flag=true;
			$("#itemTbody :checkbox").each(function() {
				var addItemObj=$(this);
				if(addItemObj.attr("checked")) {
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").each(function() {
						var itemObj=$(this);
						var tempProCode1 = itemObj.find("td:eq(2)").text();
						var tempProCode2=$("#CO_PROJECT_CODE" + addItemObj.attr("id")).val();
						if($.trim(tempProCode1) == $.trim(tempProCode2)) {
							utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="检查项目已存在" />", 0, "260", "");
							flag=false;
					        return;
						}
					});
				    
				    if(flag==true){
                        var tempFlag="";
    					if(($("#CO_DEFAULT" + addItemObj.attr("id")).val())=='Y') tempFlag="<img src='plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
    					if(($("#CO_DEFAULT" + addItemObj.attr("id")).val())=='N') tempFlag="<img src='plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (trrCount + 1) + "' ></tr>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (len + 1) + "</td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+$("#CO_PROJECT_CODE" + addItemObj.attr("id")).val()+"'>" + $("#CO_PROJECT_CODE" + addItemObj.attr("id")).val() + "<input type='hidden' name='PROJECT_CODE' value='" + $("#CO_PROJECT_CODE" + addItemObj.attr("id")).val() + "'/></td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+$("#CO_PROJECT_NAME" + addItemObj.attr("id")).val()+"' >" + $("#CO_PROJECT_NAME" + addItemObj.attr("id")).val() + "</td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+$("#PROJECT_TYPE_NAME" + addItemObj.attr("id")).val()+"'>" + $("#PROJECT_TYPE_NAME" + addItemObj.attr("id")).val() + "</td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: left;' title='"+$("#PRODUCT_STEP" + addItemObj.attr("id")).val()+"'>" + $("#PRODUCT_STEP" + addItemObj.attr("id")).val() + "</td>");
    					//$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;' >" + tempFlag + "</td>");
    					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+$("#CO_AFFECT_INFO" + addItemObj.attr("id")).val()+"'>" + $("#CO_AFFECT_INFO" + addItemObj.attr("id")).val() + "</td>");
    		
    					len = len + 1;
    					trrCount++;
    
    					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
    					_tongLineColor(tableTrJs);
    					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
    					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                    }
				}
			})
			

			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			hideDiv(showId, backId);
			trCount = 0;
			$("#item_list_cb").attr("checked", false);
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
        					<button type="button" onclick="resetInfo();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b23d17c37f2a4922a978579833073e98" type="edit" />
	<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b23d17c37f2a4922a978579833073e98" />
	<input type="hidden" id="prefixInd" name="b23d17c37f2a4922a978579833073e98" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a887509a9a9148f38d79889b3150b11d'" />
		<s:set name="_$formId_1" value="'b23d17c37f2a4922a978579833073e98'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width: 20px;" /><span class="dot">*</span><bu:uitn colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<bu:td cssClass="dec"  style="width: 200px;" colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" ><bu:ui colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='456789'/>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="检查项目" /></h3>
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
								<div class="datagrid-header-inner" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="项目编码" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="项目名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="项目类型" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="生产阶别" />
												</td>
												<!--<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="默认标识" />
												</td>-->
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="影响因素" />
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
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:40px;top:30px;width:718px;height:450px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择明细信息" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div datagrid-div1" style="width:100%;height:calc(100% - 37px);">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchOutItem('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
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
				<div class="panel-ajax1 datagrid " style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head3"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable456789">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td>
									<td style="width: 30px;text-align: center;"><input type="checkbox"  id="item_list_cb" onchange="getAllItem2();" /></td>
									<td style="width: 120px;text-align: center;">
										<dict:lang value="项目编码" />
									</td>
									<td style="width: 120px;text-align: center;">
										<dict:lang value="项目名称" />
									</td>
									<td style="width: 120px;text-align: center;">
										<dict:lang value="项目类型" />
									</td>
									<td style="width: 120px;text-align: center;">
										<dict:lang value="生产阶别" />
									</td>
									<!--
									<th style="width: 80px;text-align: center;">
										<dict:lang value="默认标识" />
									</th>-->
									<td style="width:120px;text-align: center;">
										<dict:lang value="影响因素" />
									</td>						
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="height:240px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax456789" >
								<tbody id="itemTbody" >
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
		</div>
			<bu:jsVal formId="b23d17c37f2a4922a978579833073e98" formIndex="1" />
									
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
        var trrCount = 0;
        $(function(){
            $("#SREACH_PRO_NAME").removeAttr("disabled");
            $("#paraMapObj_CTP_TEMPLATE_NAME").attr("readonly","readonly");
        })
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
		
		function editInfo(){
		    if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            } 
		    
    	    var tableLength = $("#addItemInfo tr").length;
    	    //console.log(tableLength);
    	    if(tableLength==0){
    	        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加检查项目" />", 0, "260", "");
				return;
    	    }
    	    var trs = $("#addItemInfo tr");
    	    var flag=false;
    	    var tempProjectStep=$.trim($("#addItemInfo tr:eq(0)").find("td:eq(5)").text());
    	    for(var i = 0; i < trs.length; i++) {
    	        var projectStep = $.trim($("#addItemInfo tr:eq(" + i + ")").find("td:eq(5)").text());
    	        if(tempProjectStep!=projectStep){
    	            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="检查项目生产阶别不一致" />", 0, "260", "");
				    return;
    	        }
    	    }
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3750f8681ff54a8ca31552d8c49bbaeb";
            document.forms.editForm.submit();
    	}
    	function searchOutItem(paginationImpl){
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=6bb8855d3e354d7c9baba03c563ae42d&formId=%{formId}";
        	SearchOutItemInfo(paginationImpl,url);
        }
        function resetInfo(){
            getItem();	
        }
        getItem();	
    	function getItem(){ 
		//console.log(itemUrl);
		var templateName=$("#paraMapObj_CTP_TEMPLATE_NAME").val();
		var dataId ='${dataId}';
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=6fd0aa7fc9a84dc99b18894c33f8a376";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data:{
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
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+rccList[i].CO_PROJECT_CODE+"'>" + rccList[i].CO_PROJECT_CODE + "<input type='hidden' name='PROJECT_CODE' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+rccList[i].CO_PROJECT_NAME+"' >" + rccList[i].CO_PROJECT_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+rccList[i].PROJECT_TYPE_NAME+"'>" + rccList[i].PROJECT_TYPE_NAME + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:120px;text-align: left;' title='"+rccList[i].PRODUCT_STEP+"'>" + rccList[i].PRODUCT_STEP + "</td>");
        					//$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: center;' >" + tempFlag + "</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+rccList[i].CO_AFFECT_INFO+"'>" + rccList[i].CO_AFFECT_INFO + "</td>");
        				//	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;display:none;' ><input type='hidden' name='CO_STATE' value='"+rccList[i].CO_STATE+"'></td>");
    		                trrCount++;
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
   setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
