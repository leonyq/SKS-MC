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
		<dict:lang value="备品建档列表" />
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
		<bu:header formId ="ad49e8673c8d474d9f926b899bed9a9d"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
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
		if(tag=="tag2"){
			showTotalItem();
		}
	}
$(function(){
	$("#tag1").addClass("current");
	
})
</script>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="3ba296cba3a544729ccd331795ef6c17" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3ba296cba3a544729ccd331795ef6c17" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post"  style="height:calc(100% - 78px);">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagead49e8673c8d474d9f926b899bed9a9d" id="formPagead49e8673c8d474d9f926b899bed9a9d" value="${formPagead49e8673c8d474d9f926b899bed9a9d}"/>
		<input type="hidden" name="formId" id="formId1" value='ad49e8673c8d474d9f926b899bed9a9d'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		
		<div class="js-tab">
			<DIV id="container" style="box-sizing: border-box;">
				<DIV class="hd">
					<UL class="tab-list tab" style="padding-left:12px;">
						
						<LI id="tag1"><A class=""
							onclick="switchTag('tag1','content1','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="库存明细" /></SPAN> </A>
						</LI>
						<LI id="tag2"><A class=""
							onclick="switchTag('tag2','content2','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="库存汇总" /></SPAN> </A>
						</LI>
					</UL>
				</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
				<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
					<!--table1-->
					<div class="panel-ajax datagrid datagrid-div1"  id="ad49e8673c8d474d9f926b899bed9a9d">
            		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxad49e8673c8d474d9f926b899bed9a9d" style="">
            		<div class="datagrid-header">
            		<div class="datagrid-header-inner itemD" id="datagrid-header-innerad49e8673c8d474d9f926b899bed9a9d">
            		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablead49e8673c8d474d9f926b899bed9a9d">
            		<s:set name="_$type" value="'view'" />
            		<tbody class="isParentsTitle">
            		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ad49e8673c8d474d9f926b899bed9a9d" i18n="1"/></td>
            			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ad49e8673c8d474d9f926b899bed9a9d" onclick="_selectAjaxTableAllData(this,'ad49e8673c8d474d9f926b899bed9a9d')" style="cursor: pointer;"title="全选"/></span></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_PRODUCE_DATE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_RECEIVE_TIME" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_RECEIVE_EMP" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_MEMO" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
            		</bu:tr>
            		</tbody>
            		</bu:table>
            		</div>
            		</div>
            		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll0" id="tableDivad49e8673c8d474d9f926b899bed9a9d" onscroll="ajaxTableScroll(this,'ad49e8673c8d474d9f926b899bed9a9d')">
            		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxad49e8673c8d474d9f926b899bed9a9d">
            		<tbody id="tbody_ad49e8673c8d474d9f926b899bed9a9d" class="isParents" >
            		</tbody>
            		</table>		</div>
            		</div>
            		</div>
            		<c:if test="${formPagead49e8673c8d474d9f926b899bed9a9d==1}">			<div class="center">
            			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ad49e8673c8d474d9f926b899bed9a9d&showLoading=0" />
            			</div>
            		</c:if>
						
				</DIV>
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<!--table2-->
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner totalItem" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
										<td class="datagrid-cell"  style="width:200px;"><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="安全库存" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="批量库存" /></td >
										<td class="datagrid-cell"  style="width:180px;"><dict:lang value="个体库存" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1 ">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
						</div>
				</div>
						<div style="background-color: white;" id="pageDiv">
                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchTotalItem&formId=formId2&showLoading=0" />
                 			</div>	
					
			</DIV>	
		</div>
		
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3ba296cba3a544729ccd331795ef6c17" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3ba296cba3a544729ccd331795ef6c17" />
    
<script type="text/javascript">
				function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    //var url = "/mes/buss/bussModel_listMsData.ms";
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
                    listAjaxTable(formId);
                    showTotalItem();
                    //searchTotalItem();
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
                    utilsFp.confirmIcon(1,"","","", msg,"","260","145");
                }
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                //function reloadPg(msg,title,width,height,time){
                    //msgPop(msg,"",title,width,height,time);
                //}
                
                
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=db26ac43455245b8a8c60f8d3cc69ac9";
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
                    initTableWidth();
                    $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ15');
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WSI_ITEM_SN").val(jumpId);
                  
                  }    
                    listAjaxTable($("#formId1").val());
                    
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
            
</script>
<script type="text/javascript">
	//点击入库信息获取物料信息
	function showTotalItem(){  
		//var itemCode = $("#ITEM_CODE_"+itemId).val();
		var startTime=$("#CREATE_TIME_BEGIN").val();
		var endTime=$("#CREATE_TIME_END").val();
		var dataAuth=$("#DATA_AUTH").val();
		var itemSn=$("#WSI_ITEM_SN").val();
		var itemCode=$("#WSI_ITEM_CODE").val();
		var itemName=$(document.getElementById('T2#CI_ITEM_NAME')).val();
		
		util.showLoading("处理中...");
		$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=e58d82f700bd4be691ce4277b7f8ebb6"+"&startTime="+startTime
				    +"&endTime="+endTime+"&dataAuth="+dataAuth+"&itemSn="+itemSn+"&itemCode="+itemCode+"&itemName="+itemName,
				    data: {
			        "dataAuth":dataAuth
			        },
					success: function(data){
							util.closeLoading();
							$("#addItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								
								var tempFlag="";
								for(var i = 0;i < rccList.length; i++){
							    	if(rccList[i].DATA_AUTH_NAME==null)  rccList[i].DATA_AUTH_NAME="";
									if(rccList[i].WST_ITEM_CODE==null)  rccList[i].WST_ITEM_CODE="";
									if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
									if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
									if(rccList[i].WST_SAFETY_NUM==null)  rccList[i].WST_SAFETY_NUM="";
									if(rccList[i].WST_STOCK_NUM==null)  rccList[i].WST_STOCK_NUM="";
									if(rccList[i].WST_LOT_NUM==null)  rccList[i].WST_LOT_NUM="";
									if(rccList[i].WST_SINGLE_NUM==null)  rccList[i].WST_SINGLE_NUM="";
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DATA_AUTH_NAME+"'>"+rccList[i].DATA_AUTH_NAME+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:180px;text-align: left;' title='"+rccList[i].WST_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WST_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WST_ITEM_CODE+"</span></td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:180px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:180px;text-align: right;' title='"+rccList[i].WST_SAFETY_NUM+"'>"+rccList[i].WST_SAFETY_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:180px;text-align: right;' title='"+rccList[i].WST_STOCK_NUM+"'>"+rccList[i].WST_STOCK_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:180px;text-align: right;' title='"+rccList[i].WST_LOT_NUM+"'>"+rccList[i].WST_LOT_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:180px;text-align: right;' title='"+rccList[i].WST_SINGLE_NUM+"'>"+rccList[i].WST_SINGLE_NUM+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId2");
								var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
								_tongLineColor(tableTrJs);
								clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						}
						,
					error: function(msg){
							util.closeLoading();
							//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	//物料信息分页
	var paginationImpl = {};
	function SearchTotalItem(paginationImpl,url){
	    var startTime=$("#CREATE_TIME_BEGIN").val();
		var endTime=$("#CREATE_TIME_END").val();
		var dataAuth=$("#DATA_AUTH").val();
		var itemSn=$("#WSI_ITEM_SN").val();
		var itemCode=$("#WSI_ITEM_CODE").val();
		var itemName=$(document.getElementById('T2#CI_ITEM_NAME')).val();
		
		var isFirstLoad = firstLoadThisPage(paginationImpl);
	    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
	    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	    	var itemId = $("#itemId").val();
	    	util.showLoading("处理中...");
	    	$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=352ee017ac424ac49d8fbc8f36d7994f",
				    data:{
				       "paraMap.type":"1",
				       "paraMap.startTime":startTime,
				       "paraMap.endTime":endTime,
				       "paraMap.dataAuth":dataAuth,
				       "paraMap.itemSn":itemSn,
				       "paraMap.itemCode":itemCode,
				       "paraMap.itemName":itemName,
				       "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
				       "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				       "dataAuth":dataAuth
				    },
					success: function(data){
							util.closeLoading();
							console.log(data);
							$("#addItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								for(var i = 0;i < rccList.length; i++){
							    	if(rccList[i].DATA_AUTH_NAME==null)  rccList[i].DATA_AUTH_NAME="";
									if(rccList[i].WST_ITEM_CODE==null)  rccList[i].WST_ITEM_CODE="";
									if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
									if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
									if(rccList[i].WST_SAFETY_NUM==null)  rccList[i].WST_SAFETY_NUM="";
									if(rccList[i].WST_STOCK_NUM==null)  rccList[i].WST_STOCK_NUM="";
									if(rccList[i].WST_LOT_NUM==null)  rccList[i].WST_LOT_NUM="";
									if(rccList[i].WST_SINGLE_NUM==null)  rccList[i].WST_SINGLE_NUM="";
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DATA_AUTH_NAME+"'>"+rccList[i].DATA_AUTH_NAME+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:180px;text-align: left;' title='"+rccList[i].WST_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WST_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WST_ITEM_CODE+"</span></td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:180px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:180px;text-align: right;' title='"+rccList[i].WST_SAFETY_NUM+"'>"+rccList[i].WST_SAFETY_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:180px;text-align: right;' title='"+rccList[i].WST_STOCK_NUM+"'>"+rccList[i].WST_STOCK_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:180px;text-align: right;' title='"+rccList[i].WST_LOT_NUM+"'>"+rccList[i].WST_LOT_NUM+"</td>");
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:180px;text-align: right;' title='"+rccList[i].WST_SINGLE_NUM+"'>"+rccList[i].WST_SINGLE_NUM+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId2");
								var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
								_tongLineColor(tableTrJs);
								clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						}
						,
					error: function(msg){
							util.closeLoading();
							//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
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
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var checkBox=$(this);
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
				  checkBox.attr("checked",false);
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
				  checkBox.attr("checked",true);
			  }
		  });
		}

</script>    
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	checkboxAll("joblist");
}


<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='ad49e8673c8d474d9f926b899bed9a9d'){<%--备品库存明细信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='width:200px; "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='width:200px;"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' onclick='itemJump1(\""+v['WSI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='display:none;"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            //arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T2#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CI_ITEM_NAME']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NAME')+"' style='width:200px;"+ms.tdEvent(formId, 'WSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSI_ITEM_NAME' class='"+ms.uiClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SPEC')+"' style='width:200px; "+ms.tdEvent(formId, 'WSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WSI_ITEM_NUM' class='"+ms.uiClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PRODUCE_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WSI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WSI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WSI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WSI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_TIME')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_RECEIVE_EMP')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_EMP')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_EMP' class='"+ms.uiClass(formId, 'WSI_RECEIVE_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_EMP')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_EMP')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MEMO')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'WSI_MEMO')+"' "+ms.tdEvent(formId, 'WSI_MEMO')+">")
            arrHtml.push("<span colno='WSI_MEMO' class='"+ms.uiClass(formId, 'WSI_MEMO')+"' style='"+ms.uiStyle(formId, 'WSI_MEMO')+"' "+ms.uiEvent(formId, 'WSI_MEMO')+" title='"+ms.titleAttr(formId,'WSI_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WSI_MEMO']+"</span>")
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
var paginationImpl = {};
function searchTotalItem(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=bef7e3e81a4a400db34d65b2ebdad5e4";
        //console.log(url);
	SearchTotalItem(paginationImpl,url);
}
function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45) - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
}

$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})
 //帮助
			function help_mc(exeid){
				//alert(exeid);
				top.window.open("/N2/sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID="+exeid,"_blank");
				
			}



</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.totalItem');
    setPopScroll('.scroll0','.itemD');
    $(".emptyDiv").remove();
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
