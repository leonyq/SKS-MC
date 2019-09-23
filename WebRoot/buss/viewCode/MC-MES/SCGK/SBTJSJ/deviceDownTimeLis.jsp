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
		<dict:lang value="设备停机时间列表" />
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
		<bu:header formId ="c5b9c9cc6c8445029a1854920fc91303"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f504a34136654aa0a5cf911c4e5773a5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f504a34136654aa0a5cf911c4e5773a5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec5b9c9cc6c8445029a1854920fc91303" id="formPagec5b9c9cc6c8445029a1854920fc91303" value="${formPagec5b9c9cc6c8445029a1854920fc91303}"/>
		<input type="hidden" name="formId" id="formId1" value='c5b9c9cc6c8445029a1854920fc91303'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c5b9c9cc6c8445029a1854920fc91303">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc5b9c9cc6c8445029a1854920fc91303" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc5b9c9cc6c8445029a1854920fc91303">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec5b9c9cc6c8445029a1854920fc91303" style="min-width:1600px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c5b9c9cc6c8445029a1854920fc91303" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c5b9c9cc6c8445029a1854920fc91303" onclick="_selectAjaxTableAllData(this,'c5b9c9cc6c8445029a1854920fc91303')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CDD_STATUS" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#CD_DEVICE_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#CA_NAME" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDD_START_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDD_END_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;" style="width:30px;"><bu:uitn colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc5b9c9cc6c8445029a1854920fc91303" onscroll="ajaxTableScroll(this,'c5b9c9cc6c8445029a1854920fc91303')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc5b9c9cc6c8445029a1854920fc91303" style="min-width:1600px;">
		<tbody id="tbody_c5b9c9cc6c8445029a1854920fc91303" class="isParents" >
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec5b9c9cc6c8445029a1854920fc91303==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c5b9c9cc6c8445029a1854920fc91303&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f504a34136654aa0a5cf911c4e5773a5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f504a34136654aa0a5cf911c4e5773a5" />
    
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CDD_STATUS\"}";
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
                    utilsFp.alert(msg);
                }
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=dda8049c4aa940c2bd6dbc6246dce6d1";
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
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='c5b9c9cc6c8445029a1854920fc91303'){<%--设备停机时间--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='CDD_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDD_DEVICE_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'CDD_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDD_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDD_DEVICE_SN' class='"+ms.uiClass(formId, 'CDD_DEVICE_SN')+"' onclick='itemJump1(\""+v['CDD_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CDD_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDD_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDD_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CDD_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CDD_STATUS')+"' "+ms.tdEvent(formId, 'CDD_STATUS')+">")
            arrHtml.push("<span colno='CDD_STATUS' class='"+ms.uiClass(formId, 'CDD_STATUS')+"' style='"+ms.uiStyle(formId, 'CDD_STATUS')+"' "+ms.uiEvent(formId, 'CDD_STATUS')+" title='"+ms.titleAttr(formId,'CDD_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CDD_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='CDD_STATUS_"+v.ID+"' value='"+uiRaw[i].CDD_STATUS+"'></td>");
            arrHtml.push("<td colno='CD_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CD_DEVICE_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'CD_DEVICE_NAME')+">")
            arrHtml.push("<span colno='CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CD_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'CD_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CD_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T2#VALUE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'T2#VALUE')+"' "+ms.tdEvent(formId, 'T2#VALUE')+">")
            arrHtml.push("<span colno='T2#VALUE' class='"+ms.uiClass(formId, 'T2#VALUE')+"' style='"+ms.uiStyle(formId, 'T2#VALUE')+"' "+ms.uiEvent(formId, 'T2#VALUE')+" title='"+ms.titleAttr(formId,'T2#VALUE','IS_TITLE_ATTR',v)+"' >"+v['T2#VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CA_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'T2#CA_NAME')+"' "+ms.tdEvent(formId, 'T2#CA_NAME')+">")
            arrHtml.push("<span colno='T2#CA_NAME' class='"+ms.uiClass(formId, 'T2#CA_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CA_NAME')+"' "+ms.uiEvent(formId, 'T2#CA_NAME')+" title='"+ms.titleAttr(formId,'T2#CA_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_STOP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDD_STOP_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CDD_STOP_TYPE')+"' "+ms.tdEvent(formId, 'CDD_STOP_TYPE')+">")
            arrHtml.push("<span colno='CDD_STOP_TYPE' class='"+ms.uiClass(formId, 'CDD_STOP_TYPE')+"' style='"+ms.uiStyle(formId, 'CDD_STOP_TYPE')+"' "+ms.uiEvent(formId, 'CDD_STOP_TYPE')+" title='"+ms.titleAttr(formId,'CDD_STOP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDD_STOP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_START_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDD_START_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDD_START_TIME')+"' "+ms.tdEvent(formId, 'CDD_START_TIME')+">")
            arrHtml.push("<span colno='CDD_START_TIME' class='"+ms.uiClass(formId, 'CDD_START_TIME')+"' style='"+ms.uiStyle(formId, 'CDD_START_TIME')+"' "+ms.uiEvent(formId, 'CDD_START_TIME')+" title='"+ms.titleAttr(formId,'CDD_START_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDD_START_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDD_END_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDD_END_TIME')+"' "+ms.tdEvent(formId, 'CDD_END_TIME')+">")
            arrHtml.push("<span colno='CDD_END_TIME' class='"+ms.uiClass(formId, 'CDD_END_TIME')+"' style='"+ms.uiStyle(formId, 'CDD_END_TIME')+"' "+ms.uiEvent(formId, 'CDD_END_TIME')+" title='"+ms.titleAttr(formId,'CDD_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDD_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_STOP_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CDD_STOP_REASON')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CDD_STOP_REASON')+"' "+ms.tdEvent(formId, 'CDD_STOP_REASON')+">")
            arrHtml.push("<span colno='CDD_STOP_REASON' class='"+ms.uiClass(formId, 'CDD_STOP_REASON')+"' style='"+ms.uiStyle(formId, 'CDD_STOP_REASON')+"' "+ms.uiEvent(formId, 'CDD_STOP_REASON')+" title='"+ms.titleAttr(formId,'CDD_STOP_REASON','IS_TITLE_ATTR',v)+"' >"+v['CDD_STOP_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_TEMPORARY_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'CDD_TEMPORARY_METHOD')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CDD_TEMPORARY_METHOD')+"' "+ms.tdEvent(formId, 'CDD_TEMPORARY_METHOD')+">")
            arrHtml.push("<span colno='CDD_TEMPORARY_METHOD' class='"+ms.uiClass(formId, 'CDD_TEMPORARY_METHOD')+"' style='"+ms.uiStyle(formId, 'CDD_TEMPORARY_METHOD')+"' "+ms.uiEvent(formId, 'CDD_TEMPORARY_METHOD')+" title='"+ms.titleAttr(formId,'CDD_TEMPORARY_METHOD','IS_TITLE_ATTR',v)+"' >"+v['CDD_TEMPORARY_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_LONGTERM_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'CDD_LONGTERM_METHOD')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CDD_LONGTERM_METHOD')+"' "+ms.tdEvent(formId, 'CDD_LONGTERM_METHOD')+">")
            arrHtml.push("<span colno='CDD_LONGTERM_METHOD' class='"+ms.uiClass(formId, 'CDD_LONGTERM_METHOD')+"' style='"+ms.uiStyle(formId, 'CDD_LONGTERM_METHOD')+"' "+ms.uiEvent(formId, 'CDD_LONGTERM_METHOD')+" title='"+ms.titleAttr(formId,'CDD_LONGTERM_METHOD','IS_TITLE_ATTR',v)+"' >"+v['CDD_LONGTERM_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CDD_MEMO')+"' style='width:150px;"+ms.tdStyle(formId, 'CDD_MEMO')+"' "+ms.tdEvent(formId, 'CDD_MEMO')+">")
            arrHtml.push("<span colno='CDD_MEMO' class='"+ms.uiClass(formId, 'CDD_MEMO')+"' style='"+ms.uiStyle(formId, 'CDD_MEMO')+"' "+ms.uiEvent(formId, 'CDD_MEMO')+" title='"+ms.titleAttr(formId,'CDD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CDD_MEMO']+"</span>")
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

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  



</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
