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
		<dict:lang value="VM-物料管控" />
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
		<bu:header formId ="465bfc3dfbec493d8bf3eab7cd53bef4"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <style>
        .datagrid-header,.datagrid-body{
		    width:100% !important;
	    }
    </style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
				    
				    <div class="optn"><button onclick="addAjaxs();"style="margin-right:297px;"><i class="ico ico-kl" ></i><dict:lang value="新增" /></button></div>
				   <div class="optn"><button onclick="ajaxEdits();"style="margin-right:222px;"><i class="ico ico-xg" ></i><dict:lang value="修改" /></button></div>
				    <div class="optn"><button onclick="ajaxDels();"style="margin-right:147px;"><i class="ico ico-sc" ></i><dict:lang value="删除" /></button></div>
				    <div class="optn"><button onclick="importItem();"style="margin-right:75px;"><i class="ico ico-lead" ></i><dict:lang value="导入" /></button></div>
				   <div class="optn"> <button type="button" onclick="SearchDetailFun('formId4');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button></div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="b2a9defd739b4cf4a88fbb9d31949eb4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" style="height:calc(100% - 78px);">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage465bfc3dfbec493d8bf3eab7cd53bef4" id="formPage465bfc3dfbec493d8bf3eab7cd53bef4" value="${formPage465bfc3dfbec493d8bf3eab7cd53bef4}"/>
		<input type="hidden" name="formId" id="formId1" value='465bfc3dfbec493d8bf3eab7cd53bef4'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="WIC_CTRL_EMPS" name="WIC_CTRL_EMPS" value=''/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<input type="hidden" id="itemIds" name="itemIds" value=''/>
		<input type="hidden" id="authVal" name="authVal" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="465bfc3dfbec493d8bf3eab7cd53bef4" style="float:left;width:40%;">
		<div class="datagrid-div datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax465bfc3dfbec493d8bf3eab7cd53bef4" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner465bfc3dfbec493d8bf3eab7cd53bef4" >
		<table class="fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234" style="table-layout:fixed;">
		<s:set name="_$type" value="'view'" />
		
		<tbody class="isParentsTitle" id="isTbody" >
			<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="465bfc3dfbec493d8bf3eab7cd53bef4" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_465bfc3dfbec493d8bf3eab7cd53bef4" onclick="_selectAjaxTableAllData(this,'465bfc3dfbec493d8bf3eab7cd53bef4')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn  colNo="DATA_AUTH" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="WIC_CTRL_EMP" id="emps"  formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			<td class="datagrid-cell" style="width:100px;" ><bu:uitn  colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
				
		</bu:tr>
		</tbody>
		</table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv465bfc3dfbec493d8bf3eab7cd53bef4" >
		<table class="datagrid-btable2 fixedTable dblClick" id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" style="width:100%;table-layout:fixed;">
		<tbody id="tbody_465bfc3dfbec493d8bf3eab7cd53bef4" class="isParents" >
		</tbody>
		</table>		</div>
		</div>
		
		<c:if test="${formPage465bfc3dfbec493d8bf3eab7cd53bef4==1}">			<div class="center" >
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=formId4&showLoading=0" />
			</div>
		</c:if>
		</div>
        <!---->
			
				<div class="panel-ajax datagrid datagrid-div1" style=" float:right;width:calc(60% - 10px);"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell"  style="width:150px;"><dict:lang value="标准包数量" /></td >
										<td class="datagrid-cell"  style="width:150px;"><dict:lang value="物料类别" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
						
					</div>
				
				    <div style="background-color: white;margin-top:0px;" id="" >
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                    </div>
                  </div>               		
			</div><!---->
		
		<DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="overflow-x:hidden;">
							<div class="datagrid-header-inner head"  id="" >
								<table  class="datagrid-htable fixedTable  " id="secondItemDetail1" >
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
						
										<td class="datagrid-cell" style="width:107.27px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:107.27px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:107.27px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:107.27px;" ><dict:lang value="标准包数量" /></td >
										<td class="datagrid-cell"  ><dict:lang value="物料类别" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="dlist-table table-line " style="width:1980px;table-layout: fixed;"  id="secondItemDetail" >
								<tbody id="addSecondItemDetail" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId3&showLoading=0" />
                                 		</div>
			</DIV>

	</DIV>

</DIV>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b2a9defd739b4cf4a88fbb9d31949eb4" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b2a9defd739b4cf4a88fbb9d31949eb4" />
   <!---
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    --->
    <script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>

    <bu:submit viewId="b2a9defd739b4cf4a88fbb9d31949eb4" />
    <bu:script viewId="b2a9defd739b4cf4a88fbb9d31949eb4" />
  <script type="text/javascript">
                
                function listAjaxTable(formId){
                       	
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mc/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                   	SearchDetailFun("formId4");
                   	
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=b2a9defd739b4cf4a88fbb9d31949eb4";
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
                    createTable();
                    
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
<script>
    

    	$(function(){
    	    createTable();
    	})
    	 
function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){
    	/* document.forms.search_form.submit();
    	util.showTopLoading(); */
    	query("formId4");
    	if ("0" == isCloseWin || undefined == isCloseWin) {
      		top.$(".dialog-close").click();
    	}
    	checkboxAll("joblist");
}




    	
    	
var thCount=0;

function createTable(){
//var createTables = "${path}buss/bussModel_exeFunc.ms?funcMId=bcf05dc427294db98098819856698fbc";
    	var createTables = "${path}buss/bussModel_exeFunc.ms?funcMId=1d868d02358a4e96b9310e456abb5032";
    	var url=createTables;

    			var WIC_CTRL_EMP = $(document.getElementById('WIC_CTRL_EMP')).val();
    			var WIC_ITEM_CODE = $(document.getElementById('WIC_ITEM_CODE_SHOW')).val();
    			var CI_ITEM_SPEC = $(document.getElementById('T2#CI_ITEM_SPEC')).val();
    			var CI_ITEM_GENRE = $(document.getElementById('T2#CI_ITEM_GENRE')).val();
    			var CI_ITEM_NAME = $(document.getElementById('T2#CI_ITEM_NAME')).val();
    		    var dataAuth = $("#DATA_AUTH").val();
    $.ajax({
        type:"POST",
        dataType:"json",
        url:createTables,
        data:{
			    	    "WIC_CTRL_EMP":WIC_CTRL_EMP,
			    	    "WIC_ITEM_CODE":WIC_ITEM_CODE,
			    	    "CI_ITEM_SPEC":CI_ITEM_SPEC,
			    	    "CI_ITEM_GENRE":CI_ITEM_GENRE,
			    	    "CI_ITEM_NAME":CI_ITEM_NAME,
			    	    "dataAuth":dataAuth,
			    	   
			    	},
        success:function(data){
            	
            $("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4").empty();
            if(null==data){
                return;
            }
            if(null!=data.ajaxPage.dataList){

                var list =eval(data.ajaxPage.dataList);
               
                for(var i=0;i<list.length;i++){
                    	    if(list[i].LOGIN_NAME ==null) list[i].LOGIN_NAME="";
							if(list[i].NAMES ==null) list[i].NAMES="";
							if(list[i].NAME ==null) list[i].NAME="";
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4").append("<tr style='height:30px;' onclick=\"showItemDetail('"+list[i].LOGIN_NAME+"','"+list[i].AUTH_VAL+"');\" id='tr1_"+i+"'></tr>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:200px;' title='"+list[i].DATA_AUTH+"'>"+list[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH+"' /></td>");
							//$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:100px;text-align: center;'>"+list[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH+"'/></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:30px;text-align: center;'><input id='"+i+"' type='checkbox' name='isSelect3' class='_selectdata' onclick=\"showItemDetail('"+list[i].LOGIN_NAME+"','"+list[i].AUTH_VAL+"');\"value='"+list[i].LOGIN_NAME+"'  /></td>");
							//$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+list[i].NAMES+"<input type='hidden' id='NAMES"+(thCount+1)+"' class='authval' value='"+list[i].AUTH_VAL+"'/></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: center;' title='"+list[i].NAMES+"'>"+list[i].NAMES+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].AUTH_VAL+"' /></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: center;'>"+list[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+(thCount+1)+"' name='WIC_CTRL_EMP_NAME' value='"+list[i].LOGIN_NAME+"'/></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;'>"+list[i].NAME+"<input type='hidden' id='NAME"+(thCount+1)+"' value='"+list[i].NAME+"'/></td>");
							
							thCount++;
                }
                pageFun(data.ajaxPage,"formId4");
				var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				_tongLineColor(tableTrJs);	
				clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				
            }
        },
        error:function(msg){
            
           utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
    });
    
    
}

//查询分页
    	var paginationImpl={};
		function  SearchDetailFun(paginationImpl,url){
		      
		    	//util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			var WIC_CTRL_EMP = $(document.getElementById('WIC_CTRL_EMP')).val();
    			var WIC_ITEM_CODE = $(document.getElementById('WIC_ITEM_CODE_SHOW')).val();
    			var CI_ITEM_SPEC = $(document.getElementById('T2#CI_ITEM_SPEC')).val();
    			var CI_ITEM_GENRE = $(document.getElementById('T2#CI_ITEM_GENRE')).val();
    			var CI_ITEM_NAME = $(document.getElementById('T2#CI_ITEM_NAME')).val();
    		    var dataAuth = $("#DATA_AUTH").val();
    		  
			var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=1d868d02358a4e96b9310e456abb5032";
			$.ajax({
				    type: "POST",
			    	dataType: "json",
			    	url: GetEmpPages,
			    	data:{
			    	    "WIC_CTRL_EMP":WIC_CTRL_EMP,
			    	    "WIC_ITEM_CODE":WIC_ITEM_CODE,
			    	    "CI_ITEM_SPEC":CI_ITEM_SPEC,
			    	    "CI_ITEM_GENRE":CI_ITEM_GENRE,
			    	    "CI_ITEM_NAME":CI_ITEM_NAME,
			    	    "dataAuth":dataAuth,
			    	    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	},
			    	//data: "WIC_CTRL_EMP="+WIC_CTRL_EMP+"&WIC_ITEM_CODE="+WIC_ITEM_CODE+"&CI_ITEM_SPEC="+CI_ITEM_SPEC+"&CI_ITEM_GENRE="+CI_ITEM_GENRE+"&CI_ITEM_NAME="+CI_ITEM_NAME+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	success:function(data){
            	
            $("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4").empty();
             $("#addItemDetail").empty();
            if(null==data){
                return;
            }
             
            if(null!=data.ajaxPage.dataList){
                var list =eval(data.ajaxPage.dataList);
                
                for(var i=0;i<list.length;i++){
                    	    if(list[i].LOGIN_NAME ==null) list[i].LOGIN_NAME="";
							if(list[i].NAMES ==null) list[i].NAMES="";
							if(list[i].NAME ==null) list[i].NAME="";
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4").append("<tr style='height:30px;' onclick=\"showItemDetail('"+list[i].LOGIN_NAME+"','"+list[i].AUTH_VAL+"');\" id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"'></tr>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+i+"' type='checkbox' name='isSelect3' class='_selectdata' onclick=\"showItemDetail('"+list[i].LOGIN_NAME+"','"+list[i].AUTH_VAL+"');\" value='"+list[i].LOGIN_NAME+"'  /></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+list[i].NAMES+"<input type='hidden' id='NAMES"+(thCount+1)+"' class='authval'  value='"+list[i].AUTH_VAL+"'/></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;text-align: center;'>"+list[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+(thCount+1)+"' value='"+list[i].LOGIN_NAME+"'/></td>");
							$("#tbody_465bfc3dfbec493d8bf3eab7cd53bef4 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: center;'>"+list[i].NAME+"<input type='hidden' id='NAME"+(thCount+1)+"' value='"+list[i].NAME+"'/></td>");
							
							thCount++;
                }
               
                var itemIds = list[0].LOGIN_NAME;
                var authVal = list[0].AUTH_VAL;
				 $("#itemIds").val(list[0].LOGIN_NAME);
				  $("#authVal").val(authVal);
    	    	$("#WIC_CTRL_EMPS").val(list[0].LOGIN_NAME);
                showItemDetail(itemIds,authVal);
				
            }
            pageFun(data.ajaxPage,"formId4");
				var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				_tongLineColor(tableTrJs);	
				clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				
        },
			    	error:function(msg){
			    	    util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    	    
			    	}
            });
    	}
    	
    	
    

<%--生成异步表格--%>
function createTableModel(ms,formId){
    
}
</script>
    
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>	
    	<script type="text/javascript">
    	    	var tsCount=0;
    	    	
    	    function showItemDetail(itemIds,authVal){
    	    	    $("#itemIds").val(itemIds);
    	    	    $("#authVal").val(authVal);
    	    	   $("#WIC_CTRL_EMPS").val(itemIds);
    	    	   var CheckDetail= "${path}buss/bussModel_exeFunc.ms?funcMId=e4db471e8f1f4fb08b32c571645e9ef4";
    	    	     $.ajax({
    	    	             type: "POST",
			                dataType: "json",
			                url: CheckDetail,
			                data:{
			                    "itemId":itemIds,"dataAuth":authVal
			                },
			                //data: "itemId="+itemIds,
    	    	            success:function(data){
    	    	            
    	    	                $("#addItemDetail").empty();
    	    	                if(null==data){
    	    	                    return;
    	    	                }
    	    	                if(null!=data.ajaxPage.dataList)
    	    	                    var list = eval(data.ajaxPage.dataList);
    	    	                   var htmp;     
    	    	      for(var i=0;i<list.length;i++){
    	    	          
                           
                           if(list[i].CI_ITEM_NAME==null)list[i].CI_ITEM_NAME="";
                           if(list[i].CI_ITEM_SPEC==null)list[i].CI_ITEM_SPEC="";
                           if(list[i].CI_ITEM_GENRE==null)list[i].CI_ITEM_GENRE="";
                           if(list[i].CI_MIN_PACK==null)list[i].CI_MIN_PACK="";
                           if(list[i].CI_ITEM_CODE==null)list[i].CI_ITEM_CODE="";
                           /*
                            $("#addItemDetail ").append("<tr id='trr"+(i+1)+"' ></tr>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_CODE+"'>"+list[i].CI_ITEM_CODE+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: right;' >"+list[i].CI_MIN_PACK+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_GENRE+"'>"+list[i].CI_ITEM_GENRE+"</td>");
							
							tsCount++;
							*/
							var temps="<tr id='trr"+(tsCount+1)+"' >"
								         +"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-2' style='text-align: center;' title='"+list[i].CI_ITEM_CODE+"'>"+list[i].CI_ITEM_CODE+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-4' style='text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-5' style='text-align: right;' >"+list[i].CI_MIN_PACK+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-6' style='text-align: center;' title='"+list[i].CI_ITEM_GENRE+"'>"+list[i].CI_ITEM_GENRE+"</td>"
								         
							    htmp+=temps;
							tsCount++;
                       }
                       pageFun(data.ajaxPage,"formId2");
                       var tableTrJs = $("#addItemDetail tr");
						_tongLineColor(tableTrJs);
                      defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    	    	                        
    	    	                   
    	    	            },
    	    	            error:function(msg){
    	    	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	    	        }
    	    	        });
    	    	        
	        }
	        
	         
	        
	        var  paginationImpl={};
    function searchItemInfo(paginationImpl,url){
            		
        	var isFirstLoad = firstLoadThisPage(paginationImpl);
    		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var WIC_CTRL_EMP = $("#itemIds").val();
            var WIC_CTRL_AUTH = $("#authVal").val();
            var dataAuth = $("#DATA_AUTH").val();
            var GetSuppliesPages ="${path}buss/bussModel_exeFunc.ms?funcMId=5c0f10bdc9c5481f8d39783391024fa2";
            $.ajax({
                type:"post",
                dataType:"json",
                url:GetSuppliesPages,
                data:{
                    "WIC_CTRL_EMP":WIC_CTRL_EMP,
                    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
                    "dataAuth":WIC_CTRL_AUTH
                },
                //data:"WIC_CTRL_EMP="+WIC_CTRL_EMP+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
                success:function(data){
                    	
                     $("#addItemDetail").empty();
    	    	                if(null==data){
    	    	                    return;
    	    	                }
    	    	                if(null!=data.ajaxPage.dataList)
    	    	                    var list = eval(data.ajaxPage.dataList);
    	    	                    
    	    	      for(var i=0;i<list.length;i++){
    	    	          if(list[i].CI_ITEM_NAME==null)list[i].CI_ITEM_NAME="";
                           if(list[i].CI_ITEM_SPEC==null)list[i].CI_ITEM_SPEC="";
                           if(list[i].CI_ITEM_GENRE==null)list[i].CI_ITEM_GENRE="";
                           if(list[i].CI_MIN_PACK==null)list[i].CI_MIN_PACK="";
                           if(list[i].CI_ITEM_CODE==null)list[i].CI_ITEM_CODE="";
                           
                            $("#addItemDetail ").append("<tr id='trr"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_CODE+"'>"+list[i].CI_ITEM_CODE+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: right;' >"+list[i].CI_MIN_PACK+"</td>");
							$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+list[i].CI_ITEM_GENRE+"'>"+list[i].CI_ITEM_GENRE+"</td>");
							
							tsCount++;
                       }
                       pageFun(data.ajaxPage,"formId2");
                       var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                }
            });
    }
    function getExcelWindow(){
        
    };
	         //选择点击的行				
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
   
    	function getAllModels(){
            		
        if($("#allSelect").attr("checked")=="checked"){
			$("#addItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
        
        
    }
    
    
 

    	</script>
    	
    	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>

