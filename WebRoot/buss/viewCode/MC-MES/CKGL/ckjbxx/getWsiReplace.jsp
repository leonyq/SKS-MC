<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-库存替代料" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="682339f224ba4977a4c0b9f79a27fbdb"/>

    
     
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
                <bu:func viewId="81c17e28573f47ea969d4dfc025a68a5" />
            	<!--<form id="searchFormTop" name="searchFormTop" action="#" method="post"><div id="timeBucketId"></div></form>-->
		       
		        <div class="optn"> <button type="button" onclick="SearchDetailFun('682339f224ba4977a4c0b9f79a27fbdb');"><i class="ico ico-search-new"></i>查询</button></div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                            <jsp:param name="modelName" value="VIEW_TYPE_17" />
                            <jsp:param name="location" value="searchForm" />
                        </jsp:include> 
		                <bu:search viewId="81c17e28573f47ea969d4dfc025a68a5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage682339f224ba4977a4c0b9f79a27fbdb" id="formPage682339f224ba4977a4c0b9f79a27fbdb" value="${formPage682339f224ba4977a4c0b9f79a27fbdb}"/>
		<input type="hidden" name="formId" id="formId1" value='682339f224ba4977a4c0b9f79a27fbdb'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1 "  id="682339f224ba4977a4c0b9f79a27fbdb">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax " id="datagrid-view-ajax682339f224ba4977a4c0b9f79a27fbdb" style="overflow-x:hidden;">
		<div class="datagrid-header ">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner682339f224ba4977a4c0b9f79a27fbdb">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable682339f224ba4977a4c0b9f79a27fbdb" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="682339f224ba4977a4c0b9f79a27fbdb" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_682339f224ba4977a4c0b9f79a27fbdb" onclick="_selectAjaxTableAllData(this,'682339f224ba4977a4c0b9f79a27fbdb')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_SN" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_STOCK_FLAG" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_NAME" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_SPEC" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_REPLACE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_NAMES" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_DESC" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_LOT_NO" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_NUM" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_WH_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_DISTRICT_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_STORAGE_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_INSPECT_FLAG" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_FREEZE_FLAG" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_DOC_NUM" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_CONNECT_DOC" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_SUP_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_CUST_CODE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_FIRST_SN" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_SECOND_SN" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_THIRD_SN" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_FOURTH_SN" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_INVALID_DATE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_EXTEND_TIME" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_DULL_TIME" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_SUP_TRACE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_PRODUCE_DATE" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_RECEIVE_TIME" formId="682339f224ba4977a4c0b9f79a27fbdb" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax  scroll1" id="tableDiv682339f224ba4977a4c0b9f79a27fbdb" onscroll="ajaxTableScroll(this,'682339f224ba4977a4c0b9f79a27fbdb')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax682339f224ba4977a4c0b9f79a27fbdb" >
		<tbody id="tbody_682339f224ba4977a4c0b9f79a27fbdb" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage682339f224ba4977a4c0b9f79a27fbdb==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=682339f224ba4977a4c0b9f79a27fbdb&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="81c17e28573f47ea969d4dfc025a68a5" />
      
		<bu:script viewId="81c17e28573f47ea969d4dfc025a68a5" />
    
    
    
    
<script>
$(function(){
     
        $("#WSI_WH_CODE").attr("onchange","_selectCascadNew(this.value,'WSI_WH_CODE','9e79a02081824c0fa30f11cbb0747bac','WSI_WH_CODE','WSI_DISTRICT_CODE');getStorageCode();");
        $("#WSI_DISTRICT_CODE").attr("onchange","getStorageCode();");
    });
$("#WSI_RECEIVE_TIME_BEGIN").val(timeBeginString());
    
$("#WSI_RECEIVE_TIME_END").val(timeEndString());
  function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate();
			if(date-7<=0){
			    date=1;
			}
			date =date < 10 ? "0" + date : date;
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		return year + "-" + month + "-" + date +" 23:59:59";
	}   
  function getStorageCode(){
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd",
			    data: {
			        "whCode" : $("#WSI_WH_CODE").val(),
			        "DISTRICT_CODE" : $("#WSI_DISTRICT_CODE").val()
			    },
				success: function(data){	
                        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
							$("#WSI_STORAGE_CODE").empty();
             				$("#WSI_STORAGE_CODE").append("<option value=''>--请选择--</option>");
             				$("#WSI_STORAGE_CODE").append(tempOption);
             				$("#WSI_STORAGE_CODE").trigger("chosen:updated");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}


                function init(){
                   
                    loadStockDetail();
                    
                    
                 }
var tount=0;
//库存明细信息
function loadStockDetail(){
    var timeBegin=$("#WSI_RECEIVE_TIME_BEGIN").val();
    var timeEnd=$("#WSI_RECEIVE_TIME_END").val();	

	var dataAuth = $("#DATA_AUTH").val();
	
	util.showLoading("处理中...");
	var loadDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=4d2d49f77191459b95f1a630346cfcdb";
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadDetailUrl,
			    data: {
			        "dataAuth" : dataAuth,
			        "timeBegin" : timeBegin,
			        "timeEnd" : timeEnd
			    },
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_682339f224ba4977a4c0b9f79a27fbdb").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;
							var tempCheck;
							var tempFreeze;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WSI_DOC_NUM==null) rccList[i].WSI_DOC_NUM="";
								if(rccList[i].WSI_STOCK_FLAG==null) tempType="";
							  	if(rccList[i].WSI_STOCK_FLAG==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>未入库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>在库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>备料</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==4) {tempType="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>调拨</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==5) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:60px'>盘点</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==6) {tempType="<span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px'>锁定</span>";}
								if(rccList[i].WSI_INSPECT_FLAG==null) tempCheck="";
								if(rccList[i].WSI_INSPECT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_INSPECT_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG==null) tempFreeze="";
								if(rccList[i].WSI_FREEZE_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].WSI_CONNECT_DOC==null) rccList[i].WSI_CONNECT_DOC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_FIRST_SN==null) rccList[i].WSI_FIRST_SN="";
								if(rccList[i].WSI_SECOND_SN==null) rccList[i].WSI_SECOND_SN="";
								if(rccList[i].WSI_THIRD_SN==null) rccList[i].WSI_THIRD_SN="";
								if(rccList[i].WSI_FOURTH_SN==null) rccList[i].WSI_FOURTH_SN="";
								if(rccList[i].INVALID_DATE==null) rccList[i].INVALID_DATE="";
								if(rccList[i].EXTEND_TIME==null) rccList[i].EXTEND_TIME="";
								if(rccList[i].EXTEND_TIME<0) rccList[i].EXTEND_TIME="0";
								if(rccList[i].WSI_SUP_TRACE==null) rccList[i].WSI_SUP_TRACE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].CR_ITEM_REPLACE==null) rccList[i].CR_ITEM_REPLACE="";
								if(rccList[i].CR_ITEM_NAME==null) rccList[i].CR_ITEM_NAME="";
								if(rccList[i].CR_ITEM_DESC==null) rccList[i].CR_ITEM_DESC="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].DULL_TIME==null) rccList[i].DULL_TIME="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								
								$("#tbody_682339f224ba4977a4c0b9f79a27fbdb" ).append("<tr id='tr_"+tount+"' abbr='"+rccList[i].ID+"'></tr>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' /></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+tount+"' name='682339f224ba4977a4c0b9f79a27fbdb$ID' value='"+rccList[i].ID+"' type='checkbox'  class='_selectdata'  /></td>");
                               	$("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: left;' title='"+rccList[i].WSI_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_STOCK_FLAG' class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:center;'><span colno='WSI_STOCK_FLAG'>"+tempType+"</span></td>")
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: left;' title='"+rccList[i].CR_ITEM_REPLACE+"'><span onclick='itemJump3(\""+rccList[i].CR_ITEM_REPLACE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CR_ITEM_REPLACE+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;'title='"+rccList[i].CR_ITEM_NAME+"'>"+rccList[i].CR_ITEM_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: left;' title='"+rccList[i].CR_ITEM_DESC+"'>"+rccList[i].CR_ITEM_DESC+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: left;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:80px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:90px;text-align: left;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:90px;text-align: left;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_INSPECT_FLAG' class='datagrid-cell datagrid-cell-17' style='width:70px;text-align:center;'><span colno='WSI_INSPECT_FLAG'>"+tempCheck+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_FREEZE_FLAG' class='datagrid-cell datagrid-cell-18' style='width:70px;text-align:center;'><span colno='WSI_FREEZE_FLAG'>"+tempFreeze+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:150px;text-align: left;' title='"+rccList[i].WSI_DOC_NUM+"'>"+rccList[i].WSI_DOC_NUM+"</td>");
                                
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:120px;text-align: left;' title='"+rccList[i].WSI_CONNECT_DOC+"'>"+rccList[i].WSI_CONNECT_DOC+"</td>");
								$("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:120px;text-align: left;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:120px;text-align: left;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:90px;text-align: left;' title='"+rccList[i].WSI_FIRST_SN+"'>"+rccList[i].WSI_FIRST_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-24' style='width:90px;text-align: left;' title='"+rccList[i].WSI_SECOND_SN+"'>"+rccList[i].WSI_SECOND_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-25' style='width:90px;text-align: left;' title='"+rccList[i].WSI_THIRD_SN+"'>"+rccList[i].WSI_THIRD_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-26' style='width:90px;text-align: left;' title='"+rccList[i].WSI_FOURTH_SN+"'>"+rccList[i].WSI_FOURTH_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-27' style='width:80px;text-align: right;' title='"+rccList[i].INVALID_DATE+"'>"+rccList[i].INVALID_DATE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-28' style='width:80px;text-align: right;' title='"+rccList[i].EXTEND_TIME+"'>"+rccList[i].EXTEND_TIME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-29' style='width:80px;text-align: right;' title='"+rccList[i].DULL_TIME+"'>"+rccList[i].DULL_TIME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-30' style='width:120px;text-align: left;' title='"+rccList[i].WSI_SUP_TRACE+"'>"+rccList[i].WSI_SUP_TRACE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-31' style='width:80px;text-align: center;' title='"+rccList[i].PRODUCE_DATE+"'>"+rccList[i].PRODUCE_DATE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-32' style='width:140px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
                                tount++;
							}
							
						}
						pageFun(data.ajaxPage,"682339f224ba4977a4c0b9f79a27fbdb");
				        var tableTrJs = $("#datagrid-btable-ajax682339f224ba4977a4c0b9f79a27fbdb tbody tr");
				        _tongLineColor(tableTrJs);
				        clickTr('datagrid-btable-ajax682339f224ba4977a4c0b9f79a27fbdb');
						defTableWidthRewrite('682339f224ba4977a4c0b9f79a27fbdb');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//查询分页
    	var paginationImpl={};
		function  SearchDetailFun(paginationImpl){
		
	            	$('.scroll1').mCustomScrollbar("destroy");
                     				         $(".head1").scrollLeft(0);
                      setPopScroll('.scroll1','.head1');
		        var dataAuth = $("#DATA_AUTH").val();
            	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
            	var itemName = $.trim($("#WSI_ITEM_NAME").val());
            	var itemSn = $.trim($("#WSI_ITEM_SN").val());
            	var whCode = $("#WSI_WH_CODE").val();
            	var districtCode = $("#WSI_DISTRICT_CODE").val();
            	var storageCode = $("#WSI_STORAGE_CODE").val();
            	var itemState = $("#WSI_STOCK_FLAG").val();
            	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
            	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
            	var wsiItemReplace = $("#WSI_ITEM_REPLACE_SHOW").val();
            	var formId = $("#formId1").val();
            	var timeBegin=$("#WSI_RECEIVE_TIME_BEGIN").val();
                var timeEnd=$("#WSI_RECEIVE_TIME_END").val();	
    
		    	util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			
			var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=baec7a63e4014e71aff1eee6f489a919";
			$.ajax({
				    type: "POST",
			    	dataType: "json",
			    	url: GetEmpPages,
			    	data: {
			    	    "dataAuth" : dataAuth,
			    	    "itemCode" : itemCode,
			    	    "itemName" : itemName,
			    	    "itemSn" :itemSn,
			    	    "whCode" : whCode,
			    	    "districtCode" : districtCode,
			    	    "storageCode" : storageCode,
			    	    "itemState" : itemState,
			    	    "inspectFlag" : inspectFlag,
			    	    "freezeFlag" : freezeFlag,
			    	    "wsiItemReplace" : wsiItemReplace,			
                        "timeBegin" : timeBegin,
			    	    "timeEnd" : timeEnd,
			    	    "formId" : formId,
			    	    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    	},
			    	//data: "dataAuth="+dataAuth+"&itemCode="+itemCode+"&itemName="+itemName+"&itemSn="+itemSn+"&whCode="+whCode+"&districtCode="+districtCode+"&storageCode="+storageCode+"&itemState="+itemState+"&inspectFlag="+inspectFlag+"&freezeFlag="+freezeFlag+"&wsiItemReplace="+wsiItemReplace+"&formId="+formId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	success:function(data){
            	
            $("#tbody_682339f224ba4977a4c0b9f79a27fbdb").empty();
             $("#addItemDetail").empty();
            if(null==data){
                return;
            }
            	$("#tbody_682339f224ba4977a4c0b9f79a27fbdb").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;
							var tempCheck;
							var tempFreeze;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WSI_DOC_NUM==null) rccList[i].WSI_DOC_NUM="";
								if(rccList[i].WSI_STOCK_FLAG==null) tempType="";
							  	if(rccList[i].WSI_STOCK_FLAG==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>未入库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>在库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>备料</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==4) {tempType="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>调拨</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==5) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:60px'>盘点</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==6) {tempType="<span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px'>锁定</span>";}
								if(rccList[i].WSI_INSPECT_FLAG==null) tempCheck="";
								if(rccList[i].WSI_INSPECT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_INSPECT_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG==null) tempFreeze="";
								if(rccList[i].WSI_FREEZE_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].WSI_CONNECT_DOC==null) rccList[i].WSI_CONNECT_DOC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_FIRST_SN==null) rccList[i].WSI_FIRST_SN="";
								if(rccList[i].WSI_SECOND_SN==null) rccList[i].WSI_SECOND_SN="";
								if(rccList[i].WSI_THIRD_SN==null) rccList[i].WSI_THIRD_SN="";
								if(rccList[i].WSI_FOURTH_SN==null) rccList[i].WSI_FOURTH_SN="";
								if(rccList[i].INVALID_DATE==null) rccList[i].INVALID_DATE="";
								if(rccList[i].EXTEND_TIME==null) rccList[i].EXTEND_TIME="";
								if(rccList[i].EXTEND_TIME<0) rccList[i].EXTEND_TIME="0";
								if(rccList[i].WSI_SUP_TRACE==null) rccList[i].WSI_SUP_TRACE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].CR_ITEM_REPLACE==null) rccList[i].CR_ITEM_REPLACE="";
								if(rccList[i].CR_ITEM_NAME==null) rccList[i].CR_ITEM_NAME="";
								if(rccList[i].CR_ITEM_DESC==null) rccList[i].CR_ITEM_DESC="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].DULL_TIME==null) rccList[i].DULL_TIME="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								$("#tbody_682339f224ba4977a4c0b9f79a27fbdb" ).append("<tr id='tr"+tount+"' abbr='"+rccList[i].ID+"'></tr>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' /></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+tount+"' name='682339f224ba4977a4c0b9f79a27fbdb$ID' value='"+rccList[i].ID+"' type='checkbox'  class='_selectdata'  /></td>");
                               	$("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: left;' title='"+rccList[i].WSI_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_STOCK_FLAG' class='datagrid-cell datagrid-cell-5' style='width:70px;text-align:center;'><span colno='WSI_STOCK_FLAG'>"+tempType+"</span></td>")
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;text-align: left;' title='"+rccList[i].CR_ITEM_REPLACE+"'><span onclick='itemJump3(\""+rccList[i].CR_ITEM_REPLACE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CR_ITEM_REPLACE+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;'title='"+rccList[i].CR_ITEM_NAME+"'>"+rccList[i].CR_ITEM_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: left;' title='"+rccList[i].CR_ITEM_DESC+"'>"+rccList[i].CR_ITEM_DESC+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: left;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:80px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:90px;text-align: left;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:90px;text-align: left;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_INSPECT_FLAG' class='datagrid-cell datagrid-cell-17' style='width:70px;text-align:center;'><span colno='WSI_INSPECT_FLAG'>"+tempCheck+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td colno='WSI_FREEZE_FLAG' class='datagrid-cell datagrid-cell-18' style='width:70px;text-align:center;'><span colno='WSI_FREEZE_FLAG'>"+tempFreeze+"</span></td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:150px;text-align: left;' title='"+rccList[i].WSI_DOC_NUM+"'>"+rccList[i].WSI_DOC_NUM+"</td>");
                                
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:120px;text-align: left;' title='"+rccList[i].WSI_CONNECT_DOC+"'>"+rccList[i].WSI_CONNECT_DOC+"</td>");
								$("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:120px;text-align: left;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-22' style='width:120px;text-align: left;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-23' style='width:90px;text-align: left;' title='"+rccList[i].WSI_FIRST_SN+"'>"+rccList[i].WSI_FIRST_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-24' style='width:90px;text-align: left;' title='"+rccList[i].WSI_SECOND_SN+"'>"+rccList[i].WSI_SECOND_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-25' style='width:90px;text-align: left;' title='"+rccList[i].WSI_THIRD_SN+"'>"+rccList[i].WSI_THIRD_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-26' style='width:90px;text-align: left;' title='"+rccList[i].WSI_FOURTH_SN+"'>"+rccList[i].WSI_FOURTH_SN+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-27' style='width:80px;text-align: right;' title='"+rccList[i].INVALID_DATE+"'>"+rccList[i].INVALID_DATE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-28' style='width:80px;text-align: right;' title='"+rccList[i].EXTEND_TIME+"'>"+rccList[i].EXTEND_TIME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-29' style='width:80px;text-align: right;' title='"+rccList[i].DULL_TIME+"'>"+rccList[i].DULL_TIME+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-30' style='width:120px;text-align: left;' title='"+rccList[i].WSI_SUP_TRACE+"'>"+rccList[i].WSI_SUP_TRACE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-31' style='width:80px;text-align: center;' title='"+rccList[i].PRODUCE_DATE+"'>"+rccList[i].PRODUCE_DATE+"</td>");
                                $("#tbody_682339f224ba4977a4c0b9f79a27fbdb tr:last").append("<td class='datagrid-cell datagrid-cell-32' style='width:140px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
                                tount++;
							}
							
						}
						pageFun(data.ajaxPage,"682339f224ba4977a4c0b9f79a27fbdb");
				        var tableTrJs = $("#datagrid-btable-ajax682339f224ba4977a4c0b9f79a27fbdb tbody tr");
				        _tongLineColor(tableTrJs);
				        clickTr('datagrid-btable-ajax682339f224ba4977a4c0b9f79a27fbdb');

						defTableWidthRewrite('682339f224ba4977a4c0b9f79a27fbdb');
					},
			    	error:function(msg){
			    	    util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    	    
			    	}
            });
    	}


    	function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
    }
    
<%--生成异步表格--%>
function createTableModel(ms,formId){
/*
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='682339f224ba4977a4c0b9f79a27fbdb'){<%--FM-库存替代料--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_REPLACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_REPLACE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_REPLACE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_REPLACE')+">")
            arrHtml.push("<span colno='WSI_ITEM_REPLACE' class='"+ms.uiClass(formId, 'WSI_ITEM_REPLACE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_REPLACE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_REPLACE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_REPLACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_REPLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NAMES' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NAMES')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NAMES')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NAMES')+">")
            arrHtml.push("<span colno='WSI_ITEM_NAMES' class='"+ms.uiClass(formId, 'WSI_ITEM_NAMES')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NAMES')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NAMES')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NAMES','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NAMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_DESC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_DESC')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_DESC')+"' "+ms.tdEvent(formId, 'WSI_ITEM_DESC')+">")
            arrHtml.push("<span colno='WSI_ITEM_DESC' class='"+ms.uiClass(formId, 'WSI_ITEM_DESC')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_DESC')+"' "+ms.uiEvent(formId, 'WSI_ITEM_DESC')+" title='"+ms.titleAttr(formId,'WSI_ITEM_DESC','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LIGHT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LIGHT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_LIGHT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_LIGHT_FLAG')+">")
            arrHtml.push("<span colno='WSI_LIGHT_FLAG' class='"+ms.uiClass(formId, 'WSI_LIGHT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_LIGHT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_LIGHT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_LIGHT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_LIGHT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'WSI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WSI_PROJECT_ID')+">")
            arrHtml.push("<span colno='WSI_PROJECT_ID' class='"+ms.uiClass(formId, 'WSI_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'WSI_PROJECT_ID')+"' "+ms.uiEvent(formId, 'WSI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WSI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WSI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COMPLETE_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COMPLETE_STATUS')+"' style='"+ms.tdStyle(formId, 'WSI_COMPLETE_STATUS')+"' "+ms.tdEvent(formId, 'WSI_COMPLETE_STATUS')+">")
            arrHtml.push("<span colno='WSI_COMPLETE_STATUS' class='"+ms.uiClass(formId, 'WSI_COMPLETE_STATUS')+"' style='"+ms.uiStyle(formId, 'WSI_COMPLETE_STATUS')+"' "+ms.uiEvent(formId, 'WSI_COMPLETE_STATUS')+" title='"+ms.titleAttr(formId,'WSI_COMPLETE_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WSI_COMPLETE_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EXTEND_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.tdEvent(formId, 'WSI_EXTEND_TIME')+">")
            arrHtml.push("<span colno='WSI_EXTEND_TIME' class='"+ms.uiClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.uiEvent(formId, 'WSI_EXTEND_TIME')+" title='"+ms.titleAttr(formId,'WSI_EXTEND_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_EXTEND_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DULL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_DULL_TIME')+"' "+ms.tdEvent(formId, 'WSI_DULL_TIME')+">")
            arrHtml.push("<span colno='WSI_DULL_TIME' class='"+ms.uiClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_DULL_TIME')+"' "+ms.uiEvent(formId, 'WSI_DULL_TIME')+" title='"+ms.titleAttr(formId,'WSI_DULL_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_DULL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SECOND_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.tdStyle(formId, 'WSI_SECOND_SN')+"' "+ms.tdEvent(formId, 'WSI_SECOND_SN')+">")
            arrHtml.push("<span colno='WSI_SECOND_SN' class='"+ms.uiClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.uiStyle(formId, 'WSI_SECOND_SN')+"' "+ms.uiEvent(formId, 'WSI_SECOND_SN')+" title='"+ms.titleAttr(formId,'WSI_SECOND_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_SECOND_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_THIRD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.tdStyle(formId, 'WSI_THIRD_SN')+"' "+ms.tdEvent(formId, 'WSI_THIRD_SN')+">")
            arrHtml.push("<span colno='WSI_THIRD_SN' class='"+ms.uiClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.uiStyle(formId, 'WSI_THIRD_SN')+"' "+ms.uiEvent(formId, 'WSI_THIRD_SN')+" title='"+ms.titleAttr(formId,'WSI_THIRD_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_THIRD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FOURTH_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.tdEvent(formId, 'WSI_FOURTH_SN')+">")
            arrHtml.push("<span colno='WSI_FOURTH_SN' class='"+ms.uiClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.uiEvent(formId, 'WSI_FOURTH_SN')+" title='"+ms.titleAttr(formId,'WSI_FOURTH_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FOURTH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSI_DOC_NUM')+">")
            arrHtml.push("<span colno='WSI_DOC_NUM' class='"+ms.uiClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WSI_ITEM_NUM' class='"+ms.uiClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSI_ITEM_NAME' class='"+ms.uiClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WSI_SUP_CODE')+">")
            arrHtml.push("<span colno='WSI_SUP_CODE' class='"+ms.uiClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WSI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WSI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WSI_CUST_CODE')+">")
            arrHtml.push("<span colno='WSI_CUST_CODE' class='"+ms.uiClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WSI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WSI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INVALID_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.tdEvent(formId, 'WSI_INVALID_DATE')+">")
            arrHtml.push("<span colno='WSI_INVALID_DATE' class='"+ms.uiClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.uiEvent(formId, 'WSI_INVALID_DATE')+" title='"+ms.titleAttr(formId,'WSI_INVALID_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_INVALID_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_WH_CODE')+"' "+ms.tdEvent(formId, 'WSI_WH_CODE')+">")
            arrHtml.push("<span colno='WSI_WH_CODE' class='"+ms.uiClass(formId, 'WSI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_WH_CODE')+"' "+ms.uiEvent(formId, 'WSI_WH_CODE')+" title='"+ms.titleAttr(formId,'WSI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WSI_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WSI_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WSI_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WSI_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WSI_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WSI_STORAGE_CODE' class='"+ms.uiClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WSI_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WSI_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STOCK_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.tdEvent(formId, 'WSI_STOCK_FLAG')+">")
            arrHtml.push("<span colno='WSI_STOCK_FLAG' class='"+ms.uiClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.uiEvent(formId, 'WSI_STOCK_FLAG')+" title='"+ms.titleAttr(formId,'WSI_STOCK_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_STOCK_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ITEM_FLAG')+">")
            arrHtml.push("<span colno='WSI_ITEM_FLAG' class='"+ms.uiClass(formId, 'WSI_ITEM_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ITEM_FLAG')+" title='"+ms.titleAttr(formId,'WSI_ITEM_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INSPECT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_INSPECT_FLAG')+">")
            arrHtml.push("<span colno='WSI_INSPECT_FLAG' class='"+ms.uiClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_INSPECT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_INSPECT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_INSPECT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FREEZE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_FREEZE_FLAG')+">")
            arrHtml.push("<span colno='WSI_FREEZE_FLAG' class='"+ms.uiClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_FREEZE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_FREEZE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_FREEZE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RETURN_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RETURN_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_RETURN_FLAG')+"' "+ms.tdEvent(formId, 'WSI_RETURN_FLAG')+">")
            arrHtml.push("<span colno='WSI_RETURN_FLAG' class='"+ms.uiClass(formId, 'WSI_RETURN_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_RETURN_FLAG')+"' "+ms.uiEvent(formId, 'WSI_RETURN_FLAG')+" title='"+ms.titleAttr(formId,'WSI_RETURN_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_RETURN_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SCARP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SCARP_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_SCARP_FLAG')+"' "+ms.tdEvent(formId, 'WSI_SCARP_FLAG')+">")
            arrHtml.push("<span colno='WSI_SCARP_FLAG' class='"+ms.uiClass(formId, 'WSI_SCARP_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_SCARP_FLAG')+"' "+ms.uiEvent(formId, 'WSI_SCARP_FLAG')+" title='"+ms.titleAttr(formId,'WSI_SCARP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_SCARP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_VMI_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_VMI_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_VMI_FLAG')+"' "+ms.tdEvent(formId, 'WSI_VMI_FLAG')+">")
            arrHtml.push("<span colno='WSI_VMI_FLAG' class='"+ms.uiClass(formId, 'WSI_VMI_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_VMI_FLAG')+"' "+ms.uiEvent(formId, 'WSI_VMI_FLAG')+" title='"+ms.titleAttr(formId,'WSI_VMI_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_VMI_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_TRACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.tdEvent(formId, 'WSI_SUP_TRACE')+">")
            arrHtml.push("<span colno='WSI_SUP_TRACE' class='"+ms.uiClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.uiEvent(formId, 'WSI_SUP_TRACE')+" title='"+ms.titleAttr(formId,'WSI_SUP_TRACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_TRACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WSI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WSI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WSI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WSI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_TIME')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_EMP')+"' style='"+ms.tdStyle(formId, 'WSI_RECEIVE_EMP')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_EMP')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_EMP' class='"+ms.uiClass(formId, 'WSI_RECEIVE_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_EMP')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_EMP')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CONTAINER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CONTAINER_SN')+"' style='"+ms.tdStyle(formId, 'WSI_CONTAINER_SN')+"' "+ms.tdEvent(formId, 'WSI_CONTAINER_SN')+">")
            arrHtml.push("<span colno='WSI_CONTAINER_SN' class='"+ms.uiClass(formId, 'WSI_CONTAINER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_CONTAINER_SN')+"' "+ms.uiEvent(formId, 'WSI_CONTAINER_SN')+" title='"+ms.titleAttr(formId,'WSI_CONTAINER_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_CONTAINER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.tdStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WSI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WSI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WSI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WSI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WSI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SALE_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SALE_DOC')+"' style='"+ms.tdStyle(formId, 'WSI_SALE_DOC')+"' "+ms.tdEvent(formId, 'WSI_SALE_DOC')+">")
            arrHtml.push("<span colno='WSI_SALE_DOC' class='"+ms.uiClass(formId, 'WSI_SALE_DOC')+"' style='"+ms.uiStyle(formId, 'WSI_SALE_DOC')+"' "+ms.uiEvent(formId, 'WSI_SALE_DOC')+" title='"+ms.titleAttr(formId,'WSI_SALE_DOC','IS_TITLE_ATTR',v)+"' >"+v['WSI_SALE_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TEST_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TEST_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_TEST_TIME')+"' "+ms.tdEvent(formId, 'WSI_TEST_TIME')+">")
            arrHtml.push("<span colno='WSI_TEST_TIME' class='"+ms.uiClass(formId, 'WSI_TEST_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_TEST_TIME')+"' "+ms.uiEvent(formId, 'WSI_TEST_TIME')+" title='"+ms.titleAttr(formId,'WSI_TEST_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_TEST_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FIRST_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FIRST_SN')+"' "+ms.tdEvent(formId, 'WSI_FIRST_SN')+">")
            arrHtml.push("<span colno='WSI_FIRST_SN' class='"+ms.uiClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FIRST_SN')+"' "+ms.uiEvent(formId, 'WSI_FIRST_SN')+" title='"+ms.titleAttr(formId,'WSI_FIRST_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FIRST_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
    */
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//替代料信息
function itemJump2(obj){
    winOptMethod.jump("dca0305cd0a248e080de8204f1e5fb9e","F3799","jumpId",obj);
} 

//替代料信息
function itemJump3(obj){
    winOptMethod.jump("dca0305cd0a248e080de8204f1e5fb9e","F3799","jumpId2",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
    	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
