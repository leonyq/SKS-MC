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
		<dict:lang value="齐套库存信息列表" />
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
		<bu:header formId ="299b2d5563264d7aa1ab23a363cd81cc"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f700d600e39f4fe2a6fd01c2e8366b63" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f700d600e39f4fe2a6fd01c2e8366b63" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage299b2d5563264d7aa1ab23a363cd81cc" id="formPage299b2d5563264d7aa1ab23a363cd81cc" value="${formPage299b2d5563264d7aa1ab23a363cd81cc}"/>
		<input type="hidden" name="formId" id="formId1" value='299b2d5563264d7aa1ab23a363cd81cc'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="299b2d5563264d7aa1ab23a363cd81cc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax299b2d5563264d7aa1ab23a363cd81cc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner299b2d5563264d7aa1ab23a363cd81cc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable299b2d5563264d7aa1ab23a363cd81cc">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="299b2d5563264d7aa1ab23a363cd81cc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_299b2d5563264d7aa1ab23a363cd81cc" onclick="_selectAjaxTableAllData(this,'299b2d5563264d7aa1ab23a363cd81cc')" style="cursor: pointer;"title="全选"/></span></td>
		    <!--<td class="datagrid-cell" style="width:150px;" ><dict:lang value="组织机构" /></td >-->
		    <td class="datagrid-cell"  style="width:90px;"><dict:lang value="工单号" /></td >
			<td class="datagrid-cell"  style="width:90px;"><dict:lang value="物料料号" /></td >
			<td class="datagrid-cell" style="width:90px;"><dict:lang value="物料名称" /></td >
			<td class="datagrid-cell" style="width:90px;"><dict:lang value="物料规格" /></td >
			<td class="datagrid-cell" style="width:90px;" id="whCode"><dict:lang value="点数" /></td >
			<td class="datagrid-cell" style="width:90px;" id="whCode"><dict:lang value="总需求数量" /></td >
			<td class="datagrid-cell" style="width:90px;" id="itemLot"><dict:lang value="仓库数量" /></td >
			<td class="datagrid-cell" style="width:90px;" id="supCode"><dict:lang value="齐套状态" /></td >
			<td class="datagrid-cell" style="width:90px;" id="custCode"><dict:lang value="齐套套数" /></td >
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv299b2d5563264d7aa1ab23a363cd81cc" onscroll="ajaxTableScroll(this,'299b2d5563264d7aa1ab23a363cd81cc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc">
		<tbody id="tbody_299b2d5563264d7aa1ab23a363cd81cc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage299b2d5563264d7aa1ab23a363cd81cc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=299b2d5563264d7aa1ab23a363cd81cc&showLoading=0" />
			</div>
		</c:if>
		
		<!--<div class="panel1 datagrid datagrid-div1">
			<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
				<div class="datagrid-header" style="">
					<div class="datagrid-header-inner head"  id="" >
						<table  class="datagrid-htable fixedTable  " id="itemDetail1"  style="min-width:900px;">
							<tbody>
							<tr class="thcolor">
								<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
								<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();"/></td >
				
								<td class="datagrid-cell" style="width:150px;" ><dict:lang value="组织机构" /></td >
								<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
								<td class="datagrid-cell" ><dict:lang value="物料名称" /></td >
								<td class="datagrid-cell" ><dict:lang value="物料规格" /></td >
								<td class="datagrid-cell" style="width:90px;" id="whCode"><dict:lang value="总需求数量" /></td >
								<td class="datagrid-cell" style="width:90px;" id="itemLot"><dict:lang value="仓库数量" /></td >
								<td class="datagrid-cell" style="width:90px;" id="supCode"><dict:lang value="状态" /></td >
								<td class="datagrid-cell" style="width:90px;" id="custCode"><dict:lang value="齐套套数" /></td >
							</tr>
							</tbody>		
						</table>
					</div>
				</div>
				<div class="datagrid-body1 datagrid-div3 scroll">
					<table class="dlist-table table-line " style="table-layout: fixed;width:100%;min-width:900px;"  id="itemDetail" >
						<tbody id="addItemDetail" >
						</tbody>
					</table>
				</div>
					
			</div>
		</div>
		<div style="background-color: white;" id="pageDiv">
         			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
        </div>-->

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f700d600e39f4fe2a6fd01c2e8366b63" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f700d600e39f4fe2a6fd01c2e8366b63" />
		
		<script type="text/javascript">    
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }
                
                
                function isPage(formId){
                    var isPageVal =  $("#formPage"+formId).val();
                    if(isPageVal =="1"){    
                       return true;
                    }
                    return false;
                }
                
                
                function query(thisObj){
                    var formId = $("#formId1").val();
                    loadItem();
                    //listAjaxTable(formId);
                }
                
                
                function clearChildTable(){
                    $(".isChilds").empty();
                    getFormIdInitChildPage();
                }
                
               
               function setTableWidth(formId){
                    /**
                    *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
                    var height = $("#tableDiv"+formId).height();
                    var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
                    if(scrollHeight-height>0){
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
                    }else{
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
                    }
                    *
                    */
                }
            
                
                function alertInfo(msg){
                    //utilsFp.alert(msg);
                    utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    
                }
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                function reloadPg(msg,title,width,height,time){
                    msgPop(msg,"",title,width,height,time);
                }
                
                
                function listChildAjaxTable(formId,paramList){
                    var data = {
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
                    };
                    if(isPage(formId)){
                        data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
                        data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    if(paramList != null && paramList != ""){
                        data["paramList"] = paramList;
                    }
                    if($("#DATA_AUTH").length>0){
                    	data["DATA_AUTH"] = $("#DATA_AUTH").val();
                    }
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=9b3fc18c9332439ab757650666f022af";
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:data,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);    
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                        },
                        error: function(msg){
                            utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                        }
                    });
                }
                
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr  style='width: ");
                        arrHtml.push(tableWidth+"px");
                        arrHtml.push(";");
                        arrHtml.push("height:1000px;'");
                        $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
                   }else{
                        $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
                   }
               }
                
                
                function initChildPage(formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = 1;
                    ajaxPage.pageRecord = 20;
                    ajaxPage.totalRecord = 0;
                    ajaxPage.totalPage = 1;
                    ajaxPage.first = true;
                    ajaxPage.last = true;
                    pageFun(ajaxPage,formId);
                }
                
                
                
                function initPage(page,formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = parseInt(page.currentPage);
                    ajaxPage.pageRecord = parseInt(page.pageRecord);
                    ajaxPage.totalPage = parseInt(page.totalPage);
                    ajaxPage.totalRecord = parseInt(page.totalRecord);
                    ajaxPage.first = page.first;
                    ajaxPage.last = page.last;
                    pageFun(ajaxPage,formId);
                };
                
                
                function firstLoadThisPage(formId){
                    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
                        return true;
                    }
                    return false;
                }
                
                
                function getFormIdInitChildPage(){
                    var tableCount = $("#tableCount").val();
                    for ( var i = 2; i <= tableCount; i++) {
                        var formId = $("#formId"+i).val();
                        if(isPage(formId)){
                           initChildPage(formId);
                        }
                    }
                }
                
                
                function initTableWidth(){
                    var width = $(window).width() - 2;
                    $(".datagrid-htable,.datagrid-btable").width(width);
                }
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    loadFirstItem();
                    //initTableWidth();
                    //listAjaxTable($("#formId1").val());
                    
                 }
                
                //点击行寄选中该行
        		function clickTr(tableId){
        			$("#"+tableId+" tr").unbind("click");
        			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
            			$("#"+tableId+" tr").on("click",function(e){
            			//var trId = $(this).attr("id");
            			var trObj = $(this);
            			var checkObj=trObj.children().first().next().find(":checkbox");
            			if (checkObj.attr("checked")) {
            				checkObj.attr("checked",false);
            				trObj.css("background-color","");
            			}else{
            				$("#"+tableId+" input[type='checkbox']").each(function(){
            					if ($(this).attr("checked")) {
            						$(this).attr("checked",false);
            						$(this).parents("tr").css("background-color","");
            					}
            				});
            				checkObj.attr("checked",true);
            				trObj.css("background-color","#a0c8e5");
            			}
            		});
                }
	
                $(function(){
                    var colNo = $("#relColVals").val();
                    var subRelColIds = $("#subRelColIds").val();
                    var subFormIds = $("#subFormIds").val();
                    if(subRelColIds!="null"){
                        var formId1 = $("#formId1").val();
                        $(".isParents tr").live("click",function(){
                            var _this = $(this);
                            var relColVals = "";
                            var abbr = _this.attr("abbr");
                            var arrColNo = colNo.split(",");
                            $(arrColNo).each(function(i,v){
                                relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
                            });
                            setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
                        });
                    };
                });
                
                function getRelColVal(arr,obj,colNo){
                      if(colNo){
                       var arrColNo = colNo.split(",");
                          $(arrColNo).each(function(i,v){
                             if(v!="ID"){
                               arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
                             }
                          });
                      }
                }
            var isFirstSetScroll = 0;

/*$(function(){

	loadFirstItem();
})	*/
var loadCollectUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=8718d9e2cd3742a0bf23d460408f0159";
//页面刷新时加载库存汇总信息
function loadFirstItem(){
	var dataAuth = $("#DATA_AUTH").val();
	var projectId = $("#WSI_PROJECT_ID_SHOW").val();
	var itemCode = $.trim($("#WSI_ITEM_CODE").val());
	var itemStatus = $("#WSI_COMPLETE_STATUS").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: loadCollectUrl+"&dataAuth="+dataAuth+"&itemCode="+itemCode+"&projectId="+projectId+"&itemStatus="+itemStatus,
		data: "",
		success: function(data){
						util.closeLoading();
						$("#tbody_299b2d5563264d7aa1ab23a363cd81cc").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    var tempStatus = "";
								if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].PROJECT_ID==null)  rccList[i].PROJECT_ID="";
								if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
								if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
								if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
								if(rccList[i].TOTAL_NUM==null)  rccList[i].TOTAL_NUM="0";
								if(rccList[i].ITEM_NUM==null)  rccList[i].ITEM_NUM="0";
								if(rccList[i].COMPLETE_NUM==null)  rccList[i].COMPLETE_NUM="0";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: left;' title='"+rccList[i].PROJECT_ID+"'><span onclick='itemJump1(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].CBD_ITEM_NUM+"'>"+rccList[i].CBD_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].TOTAL_NUM+"'>"+rccList[i].TOTAL_NUM+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
								if(rccList[i].ITEM_STATUS=='1') tempStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
								if(rccList[i].ITEM_STATUS=='2') tempStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: center;' title='"+rccList[i].ITEM_STATUS+"'>"+tempStatus+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"299b2d5563264d7aa1ab23a363cd81cc");
							var tableTrJs = $("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//加载库存汇总信息
function loadItem(){
	var dataAuth = $("#DATA_AUTH").val();
	var projectId = $("#WSI_PROJECT_ID_SHOW").val();
	var itemCode = $.trim($("#WSI_ITEM_CODE").val());
	var itemStatus = $("#WSI_COMPLETE_STATUS").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: loadCollectUrl+"&dataAuth="+dataAuth+"&itemCode="+itemCode+"&projectId="+projectId+"&itemStatus="+itemStatus,
		data: "",
		success: function(data){
						util.closeLoading();
						$("#tbody_299b2d5563264d7aa1ab23a363cd81cc").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								var tempStatus = "";
								if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].PROJECT_ID==null)  rccList[i].PROJECT_ID="";
								if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
								if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
								if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
								if(rccList[i].TOTAL_NUM==null)  rccList[i].TOTAL_NUM="0";
								if(rccList[i].ITEM_NUM==null)  rccList[i].ITEM_NUM="0";
								if(rccList[i].COMPLETE_NUM==null)  rccList[i].COMPLETE_NUM="0";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: left;' title='"+rccList[i].PROJECT_ID+"'><span onclick='itemJump1(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].CBD_ITEM_NUM+"'>"+rccList[i].CBD_ITEM_NUM+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].TOTAL_NUM+"'>"+rccList[i].TOTAL_NUM+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
								if(rccList[i].ITEM_STATUS=='1') tempStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
								if(rccList[i].ITEM_STATUS=='2') tempStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: center;' title='"+rccList[i].ITEM_STATUS+"'>"+tempStatus+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"299b2d5563264d7aa1ab23a363cd81cc");
							var tableTrJs = $("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//库存汇总信息分页
var paginationImpl = {};
function SearchItemInfo(paginationImpl,url){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
	var dataAuth = $("#DATA_AUTH").val();
	var projectId = $("#WSI_PROJECT_ID_SHOW").val();
	var itemCode = $.trim($("#WSI_ITEM_CODE").val());
	var itemStatus = $("#WSI_COMPLETE_STATUS").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: url,
		data: "paraMap.dataAuth="+dataAuth+"&paraMap.itemCode="+itemCode+"&paraMap.projectId="+projectId+"&paraMap.itemStatus="+itemStatus+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
						util.closeLoading();
						$("#tbody_299b2d5563264d7aa1ab23a363cd81cc").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								var tempStatus = "";
								if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].PROJECT_ID==null)  rccList[i].PROJECT_ID="";
								if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
								if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
								if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
								if(rccList[i].TOTAL_NUM==null)  rccList[i].TOTAL_NUM="0";
								if(rccList[i].ITEM_NUM==null)  rccList[i].ITEM_NUM="0";
								if(rccList[i].COMPLETE_NUM==null)  rccList[i].COMPLETE_NUM="0";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: left;' title='"+rccList[i].PROJECT_ID+"'><span onclick='itemJump1(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].TOTAL_NUM+"'>"+rccList[i].TOTAL_NUM+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
								if(rccList[i].ITEM_STATUS=='1') tempStatus="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'><dict:lang value='齐套' /></span>";
								if(rccList[i].ITEM_STATUS=='2') tempStatus="<span class='state' style='background-color:#e69138;color:#FFFFFF;width:45px'><dict:lang value='未齐套' /></span>";
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: center;' title='"+rccList[i].ITEM_STATUS+"'>"+tempStatus+"</td>");
								$("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].COMPLETE_NUM+"'>"+rccList[i].COMPLETE_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"299b2d5563264d7aa1ab23a363cd81cc");
							var tableTrJs = $("#datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax299b2d5563264d7aa1ab23a363cd81cc');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
</script>
    
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='299b2d5563264d7aa1ab23a363cd81cc'){<%--齐套库存信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
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
}
function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 195 - 15  - 10) - 60);
	$('.datagrid-body1').css('height','calc(100% - 60px)');//32
	$('.datagrid-body').css('height','calc(100% - 32px)');//32
	$('.panel1').height($(window).height() - 56 - 195 - 15 - 70);
}

function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=b4b443eef8d74d5a86616384f68bfc79";
	SearchItemInfo(paginationImpl,url);
}

//$(function(){
	//initHeight();
//})

//$(window).resize(function(){
	//initHeight();
//})

$(function(){
$("#ddea14a4f3c948d9b7e744dd175f4351").attr("style","display:none;");
})
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>
//工单信息
function itemJump1(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//物料信息
function itemJump2(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    //setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
