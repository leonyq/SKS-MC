<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-物料追溯报表" />
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
		<bu:header formId ="2bf705be618c47afafb6a33e0d0c9376"/>

    

    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="910479bea9e64102b849ff5d3c362ce4" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="910479bea9e64102b849ff5d3c362ce4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2bf705be618c47afafb6a33e0d0c9376" id="formPage2bf705be618c47afafb6a33e0d0c9376" value="${formPage2bf705be618c47afafb6a33e0d0c9376}"/>
		<input type="hidden" name="formId" id="formId1" value='2bf705be618c47afafb6a33e0d0c9376'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2bf705be618c47afafb6a33e0d0c9376">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2bf705be618c47afafb6a33e0d0c9376" style="overflow-x:hidden;">
		<div class="datagrid-header ">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner2bf705be618c47afafb6a33e0d0c9376">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2bf705be618c47afafb6a33e0d0c9376" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="2bf705be618c47afafb6a33e0d0c9376" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2bf705be618c47afafb6a33e0d0c9376" onclick="_selectAjaxTableAllData(this,'2bf705be618c47afafb6a33e0d0c9376')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_TYPE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WIT_PROJECT_ID" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MO_NUMBER" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MODEL_CODE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_PROCESS_FACE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_AREA_ID" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_WORKSTATION_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_LOT_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_COUNT" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT_NUM" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_SUPPLIERS" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_DEVICE_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_DEVICE_SEQ" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TRUCK_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TABLE_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_LOADPOINT_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_FEEDER_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_CHANEL_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WSI_TRAY_FLAG" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_REPEAT_FLAG" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_EMP_NAME" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td class="datagrid-cell"style="width:140px;"><bu:uitn colNo="WSI_LOADTIME" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv2bf705be618c47afafb6a33e0d0c9376" onscroll="ajaxTableScroll(this,'2bf705be618c47afafb6a33e0d0c9376')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376" >
		<tbody id="tbody_2bf705be618c47afafb6a33e0d0c9376" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2bf705be618c47afafb6a33e0d0c9376==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getInfoPage&formId=2bf705be618c47afafb6a33e0d0c9376&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="910479bea9e64102b849ff5d3c362ce4" />
      
		<bu:script viewId="910479bea9e64102b849ff5d3c362ce4" />
    
    
     <script type="text/javascript">
                
                function listAjaxTable(formId){
                /*
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "/mes/buss/bussModel_listMsData.ms";
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
                    */
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
                   //if( getDealSearchMultiTimeSlotBtn())
                   $('.scroll2').mCustomScrollbar("destroy");
                     getInfo();
                     
                      setPopScroll('.scroll2','.head2');
                      $('.head2')[0].scrollLeft = 0
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
                    var url = "/mes/buss/bussModel_listMsCasData.ms?exeid=e5a8e72f4d3b4564911305406bc40129";
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
                        arrHtml.push("height:1000px;'></tr>");
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


<script>
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
    if(formId=='2bf705be618c47afafb6a33e0d0c9376'){<%--物料作业记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSI_MO_NUMBER' class='"+ms.uiClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ACTIONTYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.tdEvent(formId, 'WSI_ACTIONTYPE')+">")
            arrHtml.push("<span colno='WSI_ACTIONTYPE' class='"+ms.uiClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.uiEvent(formId, 'WSI_ACTIONTYPE')+" title='"+ms.titleAttr(formId,'WSI_ACTIONTYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ACTIONTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSI_MODEL_CODE' class='"+ms.uiClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'WSI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WSI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WSI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WSI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_AREA_ID')+"' style='"+ms.tdStyle(formId, 'WSI_AREA_ID')+"' "+ms.tdEvent(formId, 'WSI_AREA_ID')+">")
            arrHtml.push("<span colno='WSI_AREA_ID' class='"+ms.uiClass(formId, 'WSI_AREA_ID')+"' style='"+ms.uiStyle(formId, 'WSI_AREA_ID')+"' "+ms.uiEvent(formId, 'WSI_AREA_ID')+" title='"+ms.titleAttr(formId,'WSI_AREA_ID','IS_TITLE_ATTR',v)+"' >"+v['WSI_AREA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.tdStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'WSI_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='WSI_WORKSTATION_SN' class='"+ms.uiClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'WSI_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'WSI_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ONLINE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ONLINE_FLAG')+">")
            arrHtml.push("<span colno='WSI_ONLINE_FLAG' class='"+ms.uiClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ONLINE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_ONLINE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_ONLINE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WSI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WSI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT')+"' style='"+ms.tdStyle(formId, 'WSI_POINT')+"' "+ms.tdEvent(formId, 'WSI_POINT')+">")
            arrHtml.push("<span colno='WSI_POINT' class='"+ms.uiClass(formId, 'WSI_POINT')+"' style='"+ms.uiStyle(formId, 'WSI_POINT')+"' "+ms.uiEvent(formId, 'WSI_POINT')+" title='"+ms.titleAttr(formId,'WSI_POINT','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_POINT_NUM')+"' "+ms.tdEvent(formId, 'WSI_POINT_NUM')+">")
            arrHtml.push("<span colno='WSI_POINT_NUM' class='"+ms.uiClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_POINT_NUM')+"' "+ms.uiEvent(formId, 'WSI_POINT_NUM')+" title='"+ms.titleAttr(formId,'WSI_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.tdStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WSI_SUPPLIERS')+">")
            arrHtml.push("<span colno='WSI_SUPPLIERS' class='"+ms.uiClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WSI_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WSI_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO_OLD')+">")
            arrHtml.push("<span colno='WSI_LOT_NO_OLD' class='"+ms.uiClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO_OLD')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COUNT_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.tdEvent(formId, 'WSI_COUNT_OLD')+">")
            arrHtml.push("<span colno='WSI_COUNT_OLD' class='"+ms.uiClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.uiEvent(formId, 'WSI_COUNT_OLD')+" title='"+ms.titleAttr(formId,'WSI_COUNT_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_COUNT_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SN')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SN' class='"+ms.uiClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRUCK_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.tdEvent(formId, 'WSI_TRUCK_NO')+">")
            arrHtml.push("<span colno='WSI_TRUCK_NO' class='"+ms.uiClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.uiEvent(formId, 'WSI_TRUCK_NO')+" title='"+ms.titleAttr(formId,'WSI_TRUCK_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRUCK_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TABLE_NO')+"' "+ms.tdEvent(formId, 'WSI_TABLE_NO')+">")
            arrHtml.push("<span colno='WSI_TABLE_NO' class='"+ms.uiClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TABLE_NO')+"' "+ms.uiEvent(formId, 'WSI_TABLE_NO')+" title='"+ms.titleAttr(formId,'WSI_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.tdStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.tdEvent(formId, 'WSI_LOADPOINT_SN')+">")
            arrHtml.push("<span colno='WSI_LOADPOINT_SN' class='"+ms.uiClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'WSI_LOADPOINT_SN')+" title='"+ms.titleAttr(formId,'WSI_LOADPOINT_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADPOINT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.tdEvent(formId, 'WSI_FEEDER_SN')+">")
            arrHtml.push("<span colno='WSI_FEEDER_SN' class='"+ms.uiClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.uiEvent(formId, 'WSI_FEEDER_SN')+" title='"+ms.titleAttr(formId,'WSI_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FEEDER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CHANEL_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.tdStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.tdEvent(formId, 'WSI_CHANEL_NO')+">")
            arrHtml.push("<span colno='WSI_CHANEL_NO' class='"+ms.uiClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.uiEvent(formId, 'WSI_CHANEL_NO')+" title='"+ms.titleAttr(formId,'WSI_CHANEL_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.tdEvent(formId, 'WSI_TRAY_FLAG')+">")
            arrHtml.push("<span colno='WSI_TRAY_FLAG' class='"+ms.uiClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.uiEvent(formId, 'WSI_TRAY_FLAG')+" title='"+ms.titleAttr(formId,'WSI_TRAY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WSI_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_REPEAT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_REPEAT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EMP')+"' style='"+ms.tdStyle(formId, 'WSI_EMP')+"' "+ms.tdEvent(formId, 'WSI_EMP')+">")
            arrHtml.push("<span colno='WSI_EMP' class='"+ms.uiClass(formId, 'WSI_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_EMP')+"' "+ms.uiEvent(formId, 'WSI_EMP')+" title='"+ms.titleAttr(formId,'WSI_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADTIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADTIME')+"' style='"+ms.tdStyle(formId, 'WSI_LOADTIME')+"' "+ms.tdEvent(formId, 'WSI_LOADTIME')+">")
            arrHtml.push("<span colno='WSI_LOADTIME' class='"+ms.uiClass(formId, 'WSI_LOADTIME')+"' style='"+ms.uiStyle(formId, 'WSI_LOADTIME')+"' "+ms.uiEvent(formId, 'WSI_LOADTIME')+" title='"+ms.titleAttr(formId,'WSI_LOADTIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WSI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_TYPE']+"</span>")
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
    setScroll(formId);
    */
}
$(function(){

    $("#WSI_LOADTIME_BEGIN").val(timeBeginString());
    
     $("#WSI_LOADTIME_END").val(timeEndString());
      $("#WSI_DATA_TYPE").val("1");
    //getInfo();
    
})

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

function getInfo(){
    var formId = $("#formId1").val();
     var timeBegin=$("#WSI_LOADTIME_BEGIN").val();
    var timeEnd=$("#WSI_LOADTIME_END").val();
    var dataAuth= $("#DATA_AUTH").val();
    var projectId=$.trim($("#WIT_PROJECT_ID_SHOW").val());
    var moNumber=$.trim($("#WIT_MO_NUMBER_SHOW").val());
    var snRealid=$.trim($("#WSI_SN").val());
    var wsiItemSn = $.trim($("#WSI_ITEM_SN").val());
    var formId = $("#formId1").val();
 
    var wsidataType =  $('#WSI_DATA_TYPE option:selected').val();
    
    if((timeBegin==null||timeBegin=="")||(timeEnd==null||timeEnd=="")){
        utilsFp.confirmIcon(3,"","","", "请选择作业时间","","350","");
        return;
    }
    if(wsidataType==null||wsidataType==""){
        utilsFp.confirmIcon(3,"","","", "请选择数据类型","","350","");
        return;
    }
 
 
    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=325548c21fc646598a60aa4c5253253a";
    	util.showLoading("处理中...");
    $.ajax({
        type:"post",
        dataType:"json",
        data: {
            "wsiItemSn" : wsiItemSn,
            "timeBegin" : timeBegin,
            "timeEnd" : timeEnd,
            "dataAuth" : dataAuth,
            "snRealid" : snRealid,
            "moNumber" : moNumber,
            "projectId" : projectId,
            "wsidataType":wsidataType
            
        },
        url:loadItemUrl,
        success:function(data){
            util.closeLoading();
            $("#tbody_2bf705be618c47afafb6a33e0d0c9376").empty();
            if(null==data){
                return;
            }
            if(null != data.ajaxPage.dataList){
            
                    var rccList = eval(data.ajaxPage.dataList);
                    	var tempChecks;
					    var tempCheck;
						var tempFreeze;	
						console.log(data.ajaxPage.dataList);
                    for(var i=0;i<rccList.length;i++){
                    if(rccList[i].WSI_MO_NUMBER  ==null) rccList[i].WSI_MO_NUMBER ="";
                    if(rccList[i].ACTIONTYPE  ==null) rccList[i].ACTIONTYPE ="";//动作
                    if(rccList[i].ITEM_TYPE  ==null) rccList[i].ITEM_TYPE ="";//物料类型
                    if(rccList[i].WSI_MODEL_CODE  ==null) rccList[i].WSI_MODEL_CODE ="";
                    if(rccList[i].VALUE  ==null) rccList[i].VALUE ="";//加工面
                    if(rccList[i].CA_NAME  ==null) rccList[i].CA_NAME ="";//线别
                    if(rccList[i].AREA_NAME1  ==null) rccList[i].AREA_NAME1 ="";//工作中心
                  
                    if(rccList[i].WSI_ITEM_SN  ==null) rccList[i].WSI_ITEM_SN ="";//物料sn
                    if(rccList[i].WSI_ITEM_CODE  ==null) rccList[i].WSI_ITEM_CODE ="";
                    if(rccList[i].WSI_LOT_NO  ==null) rccList[i].WSI_LOT_NO ="";
                    if(rccList[i].WSI_ITEM_COUNT  ==null) rccList[i].WSI_ITEM_COUNT ="";
                    if(rccList[i].WSI_POINT  ==null) rccList[i].WSI_POINT ="";
                    if(rccList[i].WSI_POINT_NUM  ==null) rccList[i].WSI_POINT_NUM ="";
                    if(rccList[i].SUPPLIER_NAME  ==null) rccList[i].SUPPLIER_NAME ="";
                    if(rccList[i].WSI_ITEM_SN_OLD  ==null) rccList[i].WSI_ITEM_SN_OLD ="";
                    if(rccList[i].WSI_ITEM_CODE_OLD  ==null) rccList[i].WSI_ITEM_CODE_OLD ="";
                    if(rccList[i].WSI_LOT_NO_OLD  ==null) rccList[i].WSI_LOT_NO_OLD ="";
                    if(rccList[i].WSI_COUNT_OLD  ==null) rccList[i].WSI_COUNT_OLD ="";
                    if(rccList[i].WSI_DEVICE_SN  ==null) rccList[i].WSI_DEVICE_SN ="";   
                    if(rccList[i].WSI_DEVICE_SEQ  ==null) rccList[i].WSI_DEVICE_SEQ ="";
                    if(rccList[i].WSI_TRUCK_NO  ==null) rccList[i].WSI_TRUCK_NO ="";
                    if(rccList[i].WSI_TABLE_NO  ==null) rccList[i].WSI_TABLE_NO ="";
                    if(rccList[i].WSI_LOADPOINT_SN  ==null) rccList[i].WSI_LOADPOINT_SN ="";
                    if(rccList[i].WSI_FEEDER_SN  ==null) rccList[i].WSI_FEEDER_SN ="";
                    if(rccList[i].WSI_CHANEL_NO  ==null) rccList[i].WSI_CHANEL_NO ="";   
                    if(rccList[i].WSI_TRAY_FLAG=='Y') tempChecks="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_TRAY_FLAG=='N') tempChecks="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_TRAY_FLAG=='' || null==rccList[i].WSI_TRAY_FLAG || rccList[i].WSI_TRAY_FLAG==undefined) tempChecks="";
					if(rccList[i].WSI_REPEAT_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_REPEAT_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_REPEAT_FLAG=='') tempFreeze="";
					if(rccList[i].NAME  ==null) rccList[i].NAME ="";
					if(rccList[i].LOADTIME  ==null) rccList[i].LOADTIME ="";
					if(rccList[i].WT_PROJECT_ID  ==null) rccList[i].WT_PROJECT_ID ="";
                                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].DATAID+"' abbr='"+rccList[i].DATAID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].DATAID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].DATAID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					
			 					+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</span>"
			 					+"</td>"
			 					
			 					+"<td colno='WSI_ITEM_SN' class='datagrid-cell' style='width:200px;'>"
			 					+"<span colno='WSI_ITEM_SN' title='"+rccList[i].WSI_ITEM_SN+"' onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_TYPE' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_ITEM_TYPE' 	title='"+rccList[i].ITEM_TYPE+"'>"+rccList[i].ITEM_TYPE+"</span>"
			 					+"</td>"
			 				    +"<td colno='WIT_PROJECT_ID' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WT_PROJECT_ID' title='"+rccList[i].WT_PROJECT_ID+"' onclick='itemJump2(\""+rccList[i].WT_PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_PROJECT_ID+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_MO_NUMBER' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_MO_NUMBER' title='"+rccList[i].WSI_MO_NUMBER+"' onclick='itemJump3(\""+rccList[i].WSI_MO_NUMBER+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_MO_NUMBER+"</span>"
			 					+"</td>"
			 					
			 					+"<td colno='WSI_MODEL_CODE' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_MODEL_CODE' title='"+rccList[i].WSI_MODEL_CODE+"' onclick='itemJump4(\""+rccList[i].WSI_MODEL_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_MODEL_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_PROCESS_FACE' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_PROCESS_FACE' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_AREA_ID' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_AREA_ID' title='"+rccList[i].CA_NAME+"'>"+rccList[i].CA_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_WORKSTATION_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_WORKSTATION_SN' title='"+rccList[i].AREA_NAME1+"'>"+rccList[i].AREA_NAME1+"</span>"
			 					+"</td>"
			 					
			 					
			 					+"<td colno='WSI_ITEM_CODE' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_ITEM_CODE' title='"+rccList[i].WSI_ITEM_CODE+"' onclick='itemJump5(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOT_NO' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_LOT_NO' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_COUNT' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_ITEM_COUNT' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_ITEM_COUNT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_POINT' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_POINT' title='"+rccList[i].WSI_POINT+"'>"+rccList[i].WSI_POINT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_POINT_NUM' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_POINT_NUM' title='"+rccList[i].WSI_POINT_NUM+"'>"+rccList[i].WSI_POINT_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUPPLIERS' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_SUPPLIERS' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DEVICE_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_DEVICE_SN' title='"+rccList[i].WSI_DEVICE_SN+"' onclick='itemJump6(\""+rccList[i].WSI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_DEVICE_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DEVICE_SEQ' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_DEVICE_SEQ' title='"+rccList[i].WSI_DEVICE_SEQ+"'>"+rccList[i].WSI_DEVICE_SEQ+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TRUCK_NO' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_TRUCK_NO' title='"+rccList[i].WSI_TRUCK_NO+"' onclick='itemJump7(\""+rccList[i].WSI_TRUCK_NO+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_TRUCK_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TABLE_NO' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='WSI_TABLE_NO' title='"+rccList[i].WSI_TABLE_NO+"'>"+rccList[i].WSI_TABLE_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOADPOINT_SN' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='WSI_LOADPOINT_SN' title='"+rccList[i].WSI_LOADPOINT_SN+"'>"+rccList[i].WSI_LOADPOINT_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FEEDER_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_FEEDER_SN' title='"+rccList[i].WSI_FEEDER_SN+"' onclick='itemJump8(\""+rccList[i].WSI_FEEDER_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_FEEDER_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CHANEL_NO' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_CHANEL_NO' title='"+rccList[i].WSI_CHANEL_NO+"'>"+rccList[i].WSI_CHANEL_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TRAY_FLAG' class='datagrid-cell' style='width:110px;text-align:center;'>"
			 					+"<span colno='WSI_TRAY_FLAG'>"+tempChecks+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_REPEAT_FLAG' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_REPEAT_FLAG'>"+tempFreeze+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_EMP' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_EMP' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOADTIME' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_LOADTIME' title='"+rccList[i].LOADTIME+"'>"+rccList[i].LOADTIME+"</span>"
			 					+"</td></tr>";
								$("#tbody_2bf705be618c47afafb6a33e0d0c9376").append(trHtml);					
					
            }
            }           			/*
                         setNumColWidth(formId);
    						clearAllSelect();
    						setTableWidth(formId);
    						if(isFirstSetScroll == 0){setScroll();}
    						isFirstSetScroll++;*/
						pageFun(data.ajaxPage,"2bf705be618c47afafb6a33e0d0c9376");
				 
				    var tableTrJs = $("#datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376 tbody tr");
				    _tongLineColor(tableTrJs);	
				    clickTr('datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376');
				    defTableWidthRewrite("2bf705be618c47afafb6a33e0d0c9376");
        },
        error:function(msg){
            util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
    })
    
}
var paginationImpl={};
function getInfoPage(paginationImpl,url){
     var timeBegin=$("#WSI_LOADTIME_BEGIN").val();
    var timeEnd=$("#WSI_LOADTIME_END").val();
    var dataAuth= $("#DATA_AUTH").val();
    var projectId=$.trim($("#WIT_PROJECT_ID_SHOW").val());
    var moNumber=$.trim($("#WIT_MO_NUMBER_SHOW").val());
    var snRealid=$.trim($("#WSI_SN").val());
    var wsiItemSn = $.trim($("#WSI_ITEM_SN").val());
    var formId = $("#formId1").val();
    var wsidataType =  $('#WSI_DATA_TYPE option:selected').val();
  
    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
   if((timeBegin==null||timeBegin=="")||(timeEnd==null||timeEnd=="")){
        utilsFp.confirmIcon(3,"","","", "请选择作业时间","","350","");
        return;
    }
    if(wsidataType==null||wsidataType==""){
        utilsFp.confirmIcon(3,"","","", "请选择数据类型","","350","");
        return;
    }
    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=325548c21fc646598a60aa4c5253253a";
    	util.showLoading("处理中...");
    $.ajax({
        type:"post",
        dataType:"json",
        url:loadItemUrl,
        data: {
            "wsiItemSn" : wsiItemSn,
            "timeBegin" : timeBegin,
            "timeEnd" : timeEnd,
            "dataAuth" : dataAuth,
            "snRealid" : snRealid,
            "moNumber" : moNumber,
            "projectId" : projectId,
            "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
            "wsidataType":wsidataType
        },
        success:function(data){
            util.closeLoading();
            $("#tbody_2bf705be618c47afafb6a33e0d0c9376").empty();
            if(null==data){
                return;
            }
            if(null != data.ajaxPage.dataList){
            
                    var rccList = eval(data.ajaxPage.dataList);
                    	var tempChecks;
					    var tempCheck;
						var tempFreeze;	
                    for(var i=0;i<rccList.length;i++){
                    if(rccList[i].WSI_MO_NUMBER  ==null) rccList[i].WSI_MO_NUMBER ="";
                    if(rccList[i].ACTIONTYPE  ==null) rccList[i].ACTIONTYPE ="";//动作
                    if(rccList[i].ITEM_TYPE  ==null) rccList[i].ITEM_TYPE ="";//物料类型
                    if(rccList[i].WSI_MODEL_CODE  ==null) rccList[i].WSI_MODEL_CODE ="";
                    if(rccList[i].VALUE  ==null) rccList[i].VALUE ="";//加工面
                    if(rccList[i].CA_NAME  ==null) rccList[i].CA_NAME ="";//线别
                    if(rccList[i].AREA_NAME1  ==null) rccList[i].AREA_NAME1 ="";//工作中心
                    
                    if(rccList[i].WSI_ITEM_SN  ==null) rccList[i].WSI_ITEM_SN ="";//物料sn
                    if(rccList[i].WSI_ITEM_CODE  ==null) rccList[i].WSI_ITEM_CODE ="";
                    if(rccList[i].WSI_LOT_NO  ==null) rccList[i].WSI_LOT_NO ="";
                    if(rccList[i].WSI_ITEM_COUNT  ==null) rccList[i].WSI_ITEM_COUNT ="";
                    if(rccList[i].WSI_POINT  ==null) rccList[i].WSI_POINT ="";
                    if(rccList[i].WSI_POINT_NUM  ==null) rccList[i].WSI_POINT_NUM ="";
                    if(rccList[i].SUPPLIER_NAME  ==null) rccList[i].SUPPLIER_NAME ="";
                    if(rccList[i].WSI_ITEM_SN_OLD  ==null) rccList[i].WSI_ITEM_SN_OLD ="";
                    if(rccList[i].WSI_ITEM_CODE_OLD  ==null) rccList[i].WSI_ITEM_CODE_OLD ="";
                    if(rccList[i].WSI_LOT_NO_OLD  ==null) rccList[i].WSI_LOT_NO_OLD ="";
                    if(rccList[i].WSI_COUNT_OLD  ==null) rccList[i].WSI_COUNT_OLD ="";
                    if(rccList[i].WSI_DEVICE_SN  ==null) rccList[i].WSI_DEVICE_SN ="";   
                    if(rccList[i].WSI_DEVICE_SEQ  ==null) rccList[i].WSI_DEVICE_SEQ ="";
                    if(rccList[i].WSI_TRUCK_NO  ==null) rccList[i].WSI_TRUCK_NO ="";
                    if(rccList[i].WSI_TABLE_NO  ==null) rccList[i].WSI_TABLE_NO ="";
                    if(rccList[i].WSI_LOADPOINT_SN  ==null) rccList[i].WSI_LOADPOINT_SN ="";
                    if(rccList[i].WSI_FEEDER_SN  ==null) rccList[i].WSI_FEEDER_SN ="";
                    if(rccList[i].WSI_CHANEL_NO  ==null) rccList[i].WSI_CHANEL_NO ="";   
                    if(rccList[i].WSI_TRAY_FLAG=='Y') tempChecks="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_TRAY_FLAG=='N') tempChecks="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_TRAY_FLAG=='' || null==rccList[i].WSI_TRAY_FLAG || rccList[i].WSI_TRAY_FLAG==undefined) tempChecks="";
					if(rccList[i].WSI_REPEAT_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_REPEAT_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
					if(rccList[i].WSI_REPEAT_FLAG=='') tempFreeze="";
					if(rccList[i].NAME  ==null) rccList[i].NAME ="";
					if(rccList[i].LOADTIME  ==null) rccList[i].LOADTIME ="";
					if(rccList[i].WT_PROJECT_ID  ==null) rccList[i].WT_PROJECT_ID ="";
                                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].DATAID+"' abbr='"+rccList[i].DATAID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].DATAID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+((currentPage-1)*pageRecord+(i+1))+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].DATAID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 			    
			 			    	+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</span>"
			 					+"</td>"
			 				
			 					+"<td colno='WSI_ITEM_SN' class='datagrid-cell' style='width:200px;'>"
			 					+"<span colno='WSI_ITEM_SN' title='"+rccList[i].WSI_ITEM_SN+"' onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_TYPE' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_ITEM_TYPE' 	title='"+rccList[i].ITEM_TYPE+"'>"+rccList[i].ITEM_TYPE+"</span>"
			 					+"</td>"
			 				    +"<td colno='WIT_PROJECT_ID' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WT_PROJECT_ID' title='"+rccList[i].WT_PROJECT_ID+"' onclick='itemJump2(\""+rccList[i].WT_PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WT_PROJECT_ID+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_MO_NUMBER' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_MO_NUMBER' title='"+rccList[i].WSI_MO_NUMBER+"' onclick='itemJump3(\""+rccList[i].WSI_MO_NUMBER+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_MO_NUMBER+"</span>"
			 					+"</td>"
			 			    	
			 					+"<td colno='WSI_MODEL_CODE' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_MODEL_CODE' title='"+rccList[i].WSI_MODEL_CODE+"' onclick='itemJump4(\""+rccList[i].WSI_MODEL_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_MODEL_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_PROCESS_FACE' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_PROCESS_FACE' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_AREA_ID' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_AREA_ID' title='"+rccList[i].CA_NAME+"'>"+rccList[i].CA_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_WORKSTATION_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_WORKSTATION_SN' title='"+rccList[i].AREA_NAME1+"'>"+rccList[i].AREA_NAME1+"</span>"
			 					+"</td>"
			 				
			 				
			 					+"<td colno='WSI_ITEM_CODE' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_ITEM_CODE' title='"+rccList[i].WSI_ITEM_CODE+"' onclick='itemJump5(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOT_NO' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_LOT_NO' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_COUNT' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_ITEM_COUNT' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_ITEM_COUNT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_POINT' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_POINT' title='"+rccList[i].WSI_POINT+"'>"+rccList[i].WSI_POINT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_POINT_NUM' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_POINT_NUM' title='"+rccList[i].WSI_POINT_NUM+"'>"+rccList[i].WSI_POINT_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUPPLIERS' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_SUPPLIERS' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DEVICE_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_DEVICE_SN' title='"+rccList[i].WSI_DEVICE_SN+"' onclick='itemJump6(\""+rccList[i].WSI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_DEVICE_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DEVICE_SEQ' class='datagrid-cell' style='width:80px;text-align:right;'>"
			 					+"<span colno='WSI_DEVICE_SEQ' title='"+rccList[i].WSI_DEVICE_SEQ+"'>"+rccList[i].WSI_DEVICE_SEQ+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TRUCK_NO' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_TRUCK_NO' title='"+rccList[i].WSI_TRUCK_NO+"' onclick='itemJump7(\""+rccList[i].WSI_TRUCK_NO+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_TRUCK_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TABLE_NO' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='WSI_TABLE_NO' title='"+rccList[i].WSI_TABLE_NO+"'>"+rccList[i].WSI_TABLE_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOADPOINT_SN' class='datagrid-cell' style='width:100px;text-align:center;'>"
			 					+"<span colno='WSI_LOADPOINT_SN' title='"+rccList[i].WSI_LOADPOINT_SN+"'>"+rccList[i].WSI_LOADPOINT_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FEEDER_SN' class='datagrid-cell' style='width:100px;'>"
			 					+"<span colno='WSI_FEEDER_SN' title='"+rccList[i].WSI_FEEDER_SN+"' onclick='itemJump8(\""+rccList[i].WSI_FEEDER_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_FEEDER_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CHANEL_NO' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_CHANEL_NO' title='"+rccList[i].WSI_CHANEL_NO+"'>"+rccList[i].WSI_CHANEL_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TRAY_FLAG' class='datagrid-cell' style='width:110px;text-align:center;'>"
			 					+"<span colno='WSI_TRAY_FLAG'>"+tempChecks+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_REPEAT_FLAG' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_REPEAT_FLAG'>"+tempFreeze+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_EMP' class='datagrid-cell' style='width:80px;text-align:center;'>"
			 					+"<span colno='WSI_EMP' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOADTIME' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_LOADTIME' title='"+rccList[i].LOADTIME+"'>"+rccList[i].LOADTIME+"</span>"
			 					+"</td></tr>";
								$("#tbody_2bf705be618c47afafb6a33e0d0c9376").append(trHtml);					
					
            }
            }
			            			/*
                         setNumColWidth(formId);
    						clearAllSelect();
    						setTableWidth(formId);
    						if(isFirstSetScroll == 0){setScroll();}
    						isFirstSetScroll++;*/
					  pageFun(data.ajaxPage,"2bf705be618c47afafb6a33e0d0c9376");
				    var tableTrJs = $("#datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376 tbody tr");
				    _tongLineColor(tableTrJs);	
				    clickTr('datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376');
				    defTableWidthRewrite("2bf705be618c47afafb6a33e0d0c9376");
        },
        error:function(msg){
            util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
    })
    
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

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//制令单信息
function itemJump3(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump4(obj){
  winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 


//物料信息
function itemJump5(obj){
  winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//设备建档
function itemJump6(obj){
  winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
} 

//电子料车物料
function itemJump7(obj){
  winOptMethod.jump("bd93d69449f14a10ac010f112a52802d","F8090","jumpId",obj);
} 

//FEEDER建档
function itemJump8(obj){
  winOptMethod.jump("cc2ddbed4a104e41af37781fea378239","F3542","jumpId",obj);
} 


</script>
<script>(function($){
  $(window).on('load',function(){
    
   setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

