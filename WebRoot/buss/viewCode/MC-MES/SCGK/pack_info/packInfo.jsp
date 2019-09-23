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
		<dict:lang value="包装策略信息" />
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
		<bu:header formId ="080ce545617f4ff5949b1f52484c48ee"/>

    

    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="949869d3f43e4d02ba3da1124cd9fa7f" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="949869d3f43e4d02ba3da1124cd9fa7f" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage080ce545617f4ff5949b1f52484c48ee" id="formPage080ce545617f4ff5949b1f52484c48ee" value="${formPage080ce545617f4ff5949b1f52484c48ee}"/>
		<input type="hidden" name="formId" id="formId1" value='080ce545617f4ff5949b1f52484c48ee'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='124b7bbcbf274e5785002e633437ce20'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='4c1b1d56bcd8473885dea36a3d2f5c5a'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="080ce545617f4ff5949b1f52484c48ee">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax080ce545617f4ff5949b1f52484c48ee" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner080ce545617f4ff5949b1f52484c48ee">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable080ce545617f4ff5949b1f52484c48ee">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="080ce545617f4ff5949b1f52484c48ee" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_080ce545617f4ff5949b1f52484c48ee" onclick="_selectAjaxTableAllData(this,'080ce545617f4ff5949b1f52484c48ee')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="PTI_TIME" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center"><bu:uitn colNo="PTI_EMP" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<!--<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" /></td>-->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDiv080ce545617f4ff5949b1f52484c48ee" onscroll="ajaxTableScroll(this,'080ce545617f4ff5949b1f52484c48ee')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax080ce545617f4ff5949b1f52484c48ee">
		<tbody id="tbody_080ce545617f4ff5949b1f52484c48ee" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage080ce545617f4ff5949b1f52484c48ee==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=080ce545617f4ff5949b1f52484c48ee&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage4c1b1d56bcd8473885dea36a3d2f5c5a" id="formPage4c1b1d56bcd8473885dea36a3d2f5c5a" value="${formPage4c1b1d56bcd8473885dea36a3d2f5c5a}"/>
		<input type="hidden" name="formId" id="formId2" value='4c1b1d56bcd8473885dea36a3d2f5c5a'/>
		<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;"  id="4c1b1d56bcd8473885dea36a3d2f5c5a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4c1b1d56bcd8473885dea36a3d2f5c5a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner4c1b1d56bcd8473885dea36a3d2f5c5a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4c1b1d56bcd8473885dea36a3d2f5c5a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4c1b1d56bcd8473885dea36a3d2f5c5a" i18n="1"/></td>
		<!--	<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4c1b1d56bcd8473885dea36a3d2f5c5a" onclick="_selectAjaxTableAllData(this,'4c1b1d56bcd8473885dea36a3d2f5c5a')" style="cursor: pointer;"title="全选"/></span></td>-->
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LEVEL" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LEVEL_NAME" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_CAPACITY" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LABLE_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LABLE_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LABLE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LABLE_ADDRESS" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_IS_ONLINE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LIST_PRINT" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LIST_TEMPLATE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_LIST_ADDRESS2" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_TITLE_FLAG" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PTD_CREATE_RULE" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="PTD_MEMO" formId="4c1b1d56bcd8473885dea36a3d2f5c5a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv4c1b1d56bcd8473885dea36a3d2f5c5a" onscroll="ajaxTableScroll(this,'4c1b1d56bcd8473885dea36a3d2f5c5a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4c1b1d56bcd8473885dea36a3d2f5c5a">
		<tbody id="tbody_4c1b1d56bcd8473885dea36a3d2f5c5a" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4c1b1d56bcd8473885dea36a3d2f5c5a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=4c1b1d56bcd8473885dea36a3d2f5c5a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='PTI_SN'/>
		<input type="hidden" id="arrId" name="arrId" value='id'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="949869d3f43e4d02ba3da1124cd9fa7f" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="949869d3f43e4d02ba3da1124cd9fa7f" />
    
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                    listAjaxTable(formId);	
                    
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
                var dataAuth = null;
                function selectedTr(thisObj){
                    $.each($(thisObj).find("td"),function(ele,i){
                        if($(this).attr("colno")=="DATA_AUTH"){
                           dataAuth = $(this).find("input[type='hidden']").val();
                        }
                    });
                }
                if(dataAuth==null||dataAuth==""){
                    dataAuth="";
                }
                function listChildAjaxTable(formId,paramList){
                    var data = {
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr,
                        "DATA_AUTH":    dataAuth
                    };
                    if(isPage(formId)){
                        data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
                        data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    if(paramList != null && paramList != ""){
                        data["paramList"] = paramList;
                    }
                    
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=949869d3f43e4d02ba3da1124cd9fa7f";
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
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#PTI_SN").val(jumpId);
                  
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
                                ids = $("tr[abbr='"+abbr+"']").find("input[name='ID']").val();
                               
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
<%--生成异步表格--%>
 var ids;
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
   
    if(formId=='080ce545617f4ff5949b1f52484c48ee'){<%--包装策略信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+" onclick='selectedTr(this)' >");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:30px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='PTI_SN' class='datagrid-cell "+ms.tdClass(formId, 'PTI_SN')+"' style='"+ms.tdStyle(formId, 'PTI_SN')+"' "+ms.tdEvent(formId, 'PTI_SN')+">")
            arrHtml.push("<span colno='PTI_SN' class='"+ms.uiClass(formId, 'PTI_SN')+"' onclick='itemJump1(\""+v['PTI_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PTI_SN')+" title='"+ms.titleAttr(formId,'PTI_SN','IS_TITLE_ATTR',v)+"' >"+v['PTI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTI_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PTI_NAME')+"' style='"+ms.tdStyle(formId, 'PTI_NAME')+"' "+ms.tdEvent(formId, 'PTI_NAME')+">")
            arrHtml.push("<span colno='PTI_NAME' class='"+ms.uiClass(formId, 'PTI_NAME')+"' style='"+ms.uiStyle(formId, 'PTI_NAME')+"' "+ms.uiEvent(formId, 'PTI_NAME')+" title='"+ms.titleAttr(formId,'PTI_NAME','IS_TITLE_ATTR',v)+"' >"+v['PTI_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'PTI_MEMO')+"' style='"+ms.tdStyle(formId, 'PTI_MEMO')+"' "+ms.tdEvent(formId, 'PTI_MEMO')+">")
            arrHtml.push("<span colno='PTI_MEMO' class='"+ms.uiClass(formId, 'PTI_MEMO')+"' style='"+ms.uiStyle(formId, 'PTI_MEMO')+"' "+ms.uiEvent(formId, 'PTI_MEMO')+" title='"+ms.titleAttr(formId,'PTI_MEMO','IS_TITLE_ATTR',v)+"' >"+v['PTI_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTI_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PTI_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'PTI_TIME')+"' "+ms.tdEvent(formId, 'PTI_TIME')+">")
            arrHtml.push("<span colno='PTI_TIME' class='"+ms.uiClass(formId, 'PTI_TIME')+"' style='"+ms.uiStyle(formId, 'PTI_TIME')+"' "+ms.uiEvent(formId, 'PTI_TIME')+" title='"+ms.titleAttr(formId,'PTI_TIME','IS_TITLE_ATTR',v)+"' >"+v['PTI_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PTI_EMP')+"' style='text-align:center;"+ms.tdStyle(formId, 'PTI_EMP')+"' "+ms.tdEvent(formId, 'PTI_EMP')+">")
            arrHtml.push("<span colno='PTI_EMP' class='"+ms.uiClass(formId, 'PTI_EMP')+"' style='"+ms.uiStyle(formId, 'PTI_EMP')+"' "+ms.uiEvent(formId, 'PTI_EMP')+" title='"+ms.titleAttr(formId,'PTI_EMP','IS_TITLE_ATTR',v)+"' >"+v['PTI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTI_MIX_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'PTI_MIX_FLAG')+"' style='text-align:center;"+ms.tdStyle(formId, 'PTI_MIX_FLAG')+"' "+ms.tdEvent(formId, 'PTI_MIX_FLAG')+">")
            arrHtml.push("<span colno='PTI_MIX_FLAG' class='"+ms.uiClass(formId, 'PTI_MIX_FLAG')+"' style='"+ms.uiStyle(formId, 'PTI_MIX_FLAG')+"' "+ms.uiEvent(formId, 'PTI_MIX_FLAG')+" title='"+ms.titleAttr(formId,'PTI_MIX_FLAG','IS_TITLE_ATTR',v)+"' >"+v['PTI_MIX_FLAG']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='PTI_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'PTI_DEFAULT_FLAG')+"' style='text-align:center;"+ms.tdStyle(formId, 'PTI_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'PTI_DEFAULT_FLAG')+">")
            //arrHtml.push("<span colno='PTI_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'PTI_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'PTI_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'PTI_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'PTI_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['PTI_DEFAULT_FLAG']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='PTI_ROUTE_CHECK' class='datagrid-cell "+ms.tdClass(formId, 'PTI_ROUTE_CHECK')+"' style='text-align:center;"+ms.tdStyle(formId, 'PTI_ROUTE_CHECK')+"' "+ms.tdEvent(formId, 'PTI_ROUTE_CHECK')+">")
            //arrHtml.push("<span colno='PTI_ROUTE_CHECK' class='"+ms.uiClass(formId, 'PTI_ROUTE_CHECK')+"' style='"+ms.uiStyle(formId, 'PTI_ROUTE_CHECK')+"' "+ms.uiEvent(formId, 'PTI_ROUTE_CHECK')+" title='"+ms.titleAttr(formId,'PTI_ROUTE_CHECK','IS_TITLE_ATTR',v)+"' >"+v['PTI_ROUTE_CHECK']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='4c1b1d56bcd8473885dea36a3d2f5c5a'){<%--包装策略明细--%>
        $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
           // arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
           // arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LEVEL' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LEVEL')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LEVEL')+"' "+ms.tdEvent(formId, 'PTD_LEVEL')+">")
            arrHtml.push("<span colno='PTD_LEVEL' class='"+ms.uiClass(formId, 'PTD_LEVEL')+"' style='"+ms.uiStyle(formId, 'PTD_LEVEL')+"' "+ms.uiEvent(formId, 'PTD_LEVEL')+" title='"+ms.titleAttr(formId,'PTD_LEVEL','IS_TITLE_ATTR',v)+"' >"+v['PTD_LEVEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LEVEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LEVEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LEVEL_NAME')+"' "+ms.tdEvent(formId, 'PTD_LEVEL_NAME')+">")
            arrHtml.push("<span colno='PTD_LEVEL_NAME' class='"+ms.uiClass(formId, 'PTD_LEVEL_NAME')+"' style='"+ms.uiStyle(formId, 'PTD_LEVEL_NAME')+"' "+ms.uiEvent(formId, 'PTD_LEVEL_NAME')+" title='"+ms.titleAttr(formId,'PTD_LEVEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['PTD_LEVEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_CAPACITY' class='datagrid-cell "+ms.tdClass(formId, 'PTD_CAPACITY')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_CAPACITY')+"' "+ms.tdEvent(formId, 'PTD_CAPACITY')+">")
            arrHtml.push("<span colno='PTD_CAPACITY' class='"+ms.uiClass(formId, 'PTD_CAPACITY')+"' style='"+ms.uiStyle(formId, 'PTD_CAPACITY')+"' "+ms.uiEvent(formId, 'PTD_CAPACITY')+" title='"+ms.titleAttr(formId,'PTD_CAPACITY','IS_TITLE_ATTR',v)+"' >"+v['PTD_CAPACITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LABLE_PRINT' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LABLE_PRINT')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PTD_LABLE_PRINT')+"' "+ms.tdEvent(formId, 'PTD_LABLE_PRINT')+">")
            arrHtml.push("<span colno='PTD_LABLE_PRINT' class='"+ms.uiClass(formId, 'PTD_LABLE_PRINT')+"' style='"+ms.uiStyle(formId, 'PTD_LABLE_PRINT')+"' "+ms.uiEvent(formId, 'PTD_LABLE_PRINT')+" title='"+ms.titleAttr(formId,'PTD_LABLE_PRINT','IS_TITLE_ATTR',v)+"' >"+v['PTD_LABLE_PRINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LABLE_TEMPLATE' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LABLE_TEMPLATE')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LABLE_TEMPLATE')+"' "+ms.tdEvent(formId, 'PTD_LABLE_TEMPLATE')+">")
            arrHtml.push("<span colno='PTD_LABLE_TEMPLATE' class='"+ms.uiClass(formId, 'PTD_LABLE_TEMPLATE')+"' style='"+ms.uiStyle(formId, 'PTD_LABLE_TEMPLATE')+"' "+ms.uiEvent(formId, 'PTD_LABLE_TEMPLATE')+" title='"+ms.titleAttr(formId,'PTD_LABLE_TEMPLATE','IS_TITLE_ATTR',v)+"' >"+v['PTD_LABLE_TEMPLATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LABLE_RULE' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LABLE_RULE')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LABLE_RULE')+"' "+ms.tdEvent(formId, 'PTD_LABLE_RULE')+">")
            arrHtml.push("<span colno='PTD_LABLE_RULE' class='"+ms.uiClass(formId, 'PTD_LABLE_RULE')+"' style='"+ms.uiStyle(formId, 'PTD_LABLE_RULE')+"' "+ms.uiEvent(formId, 'PTD_LABLE_RULE')+" title='"+ms.titleAttr(formId,'PTD_LABLE_RULE','IS_TITLE_ATTR',v)+"' >"+v['PTD_LABLE_RULE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LABLE_ADDRESS' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LABLE_ADDRESS')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LABLE_ADDRESS')+"' "+ms.tdEvent(formId, 'PTD_LABLE_ADDRESS')+">")
            arrHtml.push("<span colno='PTD_LABLE_ADDRESS' class='"+ms.uiClass(formId, 'PTD_LABLE_ADDRESS')+"' style='"+ms.uiStyle(formId, 'PTD_LABLE_ADDRESS')+"' "+ms.uiEvent(formId, 'PTD_LABLE_ADDRESS')+" title='"+ms.titleAttr(formId,'PTD_LABLE_ADDRESS','IS_TITLE_ATTR',v)+"' >"+v['PTD_LABLE_ADDRESS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_IS_ONLINE' class='datagrid-cell "+ms.tdClass(formId, 'PTD_IS_ONLINE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PTD_IS_ONLINE')+"' "+ms.tdEvent(formId, 'PTD_IS_ONLINE')+">")
            arrHtml.push("<span colno='PTD_IS_ONLINE' class='"+ms.uiClass(formId, 'PTD_IS_ONLINE')+"' style='"+ms.uiStyle(formId, 'PTD_IS_ONLINE')+"' "+ms.uiEvent(formId, 'PTD_IS_ONLINE')+" title='"+ms.titleAttr(formId,'PTD_IS_ONLINE','PTD_IS_ONLINE',v)+"' >"+v['PTD_IS_ONLINE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LIST_PRINT' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LIST_PRINT')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PTD_LIST_PRINT')+"' "+ms.tdEvent(formId, 'PTD_LIST_PRINT')+">")
            arrHtml.push("<span colno='PTD_LIST_PRINT' class='"+ms.uiClass(formId, 'PTD_LIST_PRINT')+"' style='"+ms.uiStyle(formId, 'PTD_LIST_PRINT')+"' "+ms.uiEvent(formId, 'PTD_LIST_PRINT')+" title='"+ms.titleAttr(formId,'PTD_LIST_PRINT','IS_TITLE_ATTR',v)+"' >"+v['PTD_LIST_PRINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LIST_TEMPLATE' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LIST_TEMPLATE')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LIST_TEMPLATE')+"' "+ms.tdEvent(formId, 'PTD_LIST_TEMPLATE')+">")
            arrHtml.push("<span colno='PTD_LIST_TEMPLATE' class='"+ms.uiClass(formId, 'PTD_LIST_TEMPLATE')+"' style='"+ms.uiStyle(formId, 'PTD_LIST_TEMPLATE')+"' "+ms.uiEvent(formId, 'PTD_LIST_TEMPLATE')+" title='"+ms.titleAttr(formId,'PTD_LIST_TEMPLATE','IS_TITLE_ATTR',v)+"' >"+v['PTD_LIST_TEMPLATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_LIST_ADDRESS2' class='datagrid-cell "+ms.tdClass(formId, 'PTD_LIST_ADDRESS2')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_LIST_ADDRESS2')+"' "+ms.tdEvent(formId, 'PTD_LIST_ADDRESS2')+">")
            arrHtml.push("<span colno='PTD_LIST_ADDRESS2' class='"+ms.uiClass(formId, 'PTD_LIST_ADDRESS2')+"' style='"+ms.uiStyle(formId, 'PTD_LIST_ADDRESS2')+"' "+ms.uiEvent(formId, 'PTD_LIST_ADDRESS2')+" title='"+ms.titleAttr(formId,'PTD_LIST_ADDRESS2','IS_TITLE_ATTR',v)+"' >"+v['PTD_LIST_ADDRESS2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_TITLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'PTD_TITLE_FLAG')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PTD_TITLE_FLAG')+"' "+ms.tdEvent(formId, 'PTD_TITLE_FLAG')+">")
            arrHtml.push("<span colno='PTD_TITLE_FLAG' class='"+ms.uiClass(formId, 'PTD_TITLE_FLAG')+"' style='"+ms.uiStyle(formId, 'PTD_TITLE_FLAG')+"' "+ms.uiEvent(formId, 'PTD_TITLE_FLAG')+" title='"+ms.titleAttr(formId,'PTD_TITLE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['PTD_TITLE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_CREATE_RULE' class='datagrid-cell "+ms.tdClass(formId, 'PTD_CREATE_RULE')+"' style='width:150px;"+ms.tdStyle(formId, 'PTD_CREATE_RULE')+"' "+ms.tdEvent(formId, 'PTD_CREATE_RULE')+">")
            arrHtml.push("<span colno='PTD_CREATE_RULE' class='"+ms.uiClass(formId, 'PTD_CREATE_RULE')+"' style='"+ms.uiStyle(formId, 'PTD_CREATE_RULE')+"' "+ms.uiEvent(formId, 'PTD_CREATE_RULE')+" title='"+ms.titleAttr(formId,'PTD_CREATE_RULE','IS_TITLE_ATTR',v)+"' >"+v['PTD_CREATE_RULE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'PTD_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'PTD_MEMO')+"' "+ms.tdEvent(formId, 'PTD_MEMO')+">")
            arrHtml.push("<span colno='PTD_MEMO' class='"+ms.uiClass(formId, 'PTD_MEMO')+"' style='"+ms.uiStyle(formId, 'PTD_MEMO')+"' "+ms.uiEvent(formId, 'PTD_MEMO')+" title='"+ms.titleAttr(formId,'PTD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['PTD_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        setPopScroll('.scroll2','.head2');
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    //setScroll();
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//包装策略配置
function itemJump1(obj){
      winOptMethod.jump("973e8a131cf843499373c80f42c00b02","F7350","jumpId",obj);
}  

</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
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
