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
		<dict:lang value="VM-8D报告" />
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
		<bu:header formId ="0affca5a6d75419ab073cd608cc5e1e2"/>

    
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
		<bu:func viewId="0507e840244b41b6ace88e178870a178" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0507e840244b41b6ace88e178870a178" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0affca5a6d75419ab073cd608cc5e1e2" id="formPage0affca5a6d75419ab073cd608cc5e1e2" value="${formPage0affca5a6d75419ab073cd608cc5e1e2}"/>
		<input type="hidden" name="formId" id="formId1" value='0affca5a6d75419ab073cd608cc5e1e2'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0affca5a6d75419ab073cd608cc5e1e2">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0affca5a6d75419ab073cd608cc5e1e2" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0affca5a6d75419ab073cd608cc5e1e2">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0affca5a6d75419ab073cd608cc5e1e2" style="min-width:2730px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0affca5a6d75419ab073cd608cc5e1e2" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0affca5a6d75419ab073cd608cc5e1e2" onclick="_selectAjaxTableAllData(this,'0affca5a6d75419ab073cd608cc5e1e2')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_SN" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CPR_STATUS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_NAME" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CPR_HAPPEN_TIME" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_HAPPEN_ADDRESS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CPR_HAPPEN_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_HAPPEN_PROBLEM" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_HAPPEN_INFLUENCE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_GROUP_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_TEMPORARY_BASIS" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CPR_TEMPORARY_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CPR_TEMPORARY_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_IMPROVE_MEASURE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CPR_IMPROVE_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CPR_IMPROVE_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CPR_CONFIRM_RESULT" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_EFFECT_CONFIRM" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CPR_CONFIRM_EMP" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CPR_CONFIRM_DATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPR_STANDARDIZE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CPR_CONGRATULATE" formId="0affca5a6d75419ab073cd608cc5e1e2" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0affca5a6d75419ab073cd608cc5e1e2" onscroll="ajaxTableScroll(this,'0affca5a6d75419ab073cd608cc5e1e2')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0affca5a6d75419ab073cd608cc5e1e2" style="min-width:2730px;">
		<tbody id="tbody_0affca5a6d75419ab073cd608cc5e1e2" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0affca5a6d75419ab073cd608cc5e1e2==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0affca5a6d75419ab073cd608cc5e1e2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0507e840244b41b6ace88e178870a178" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0507e840244b41b6ace88e178870a178" />
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CPR_STATUS\"}";
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
   	//checkboxAll("joblist");
}
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    console.log(uiTxt+"---------------------------"+uiRaw);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0affca5a6d75419ab073cd608cc5e1e2'){<%--FM-8D报告--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_SN' class='datagrid-cell "+ms.tdClass(formId, 'CPR_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_SN')+"' "+ms.tdEvent(formId, 'CPR_SN')+">")
            arrHtml.push("<span colno='CPR_SN' class='"+ms.uiClass(formId, 'CPR_SN')+"' style='"+ms.uiStyle(formId, 'CPR_SN')+"' "+ms.uiEvent(formId, 'CPR_SN')+" title='"+ms.titleAttr(formId,'CPR_SN','IS_TITLE_ATTR',v)+"' >"+v['CPR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CPR_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CPR_STATUS')+"' "+ms.tdEvent(formId, 'CPR_STATUS')+">")
            arrHtml.push("<span colno='CPR_STATUS' class='"+ms.uiClass(formId, 'CPR_STATUS')+"' style='"+ms.uiStyle(formId, 'CPR_STATUS')+"' "+ms.uiEvent(formId, 'CPR_STATUS')+" title='"+ms.titleAttr(formId,'CPR_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CPR_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CPR_STATUS+"'></td>");
            arrHtml.push("<td colno='CPR_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CPR_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_NAME')+"' "+ms.tdEvent(formId, 'CPR_NAME')+">")
            arrHtml.push("<span colno='CPR_NAME' class='"+ms.uiClass(formId, 'CPR_NAME')+"' style='"+ms.uiStyle(formId, 'CPR_NAME')+"' "+ms.uiEvent(formId, 'CPR_NAME')+" title='"+ms.titleAttr(formId,'CPR_NAME','IS_TITLE_ATTR',v)+"' >"+v['CPR_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_HAPPEN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CPR_HAPPEN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CPR_HAPPEN_TIME')+"' "+ms.tdEvent(formId, 'CPR_HAPPEN_TIME')+">")
            arrHtml.push("<span colno='CPR_HAPPEN_TIME' class='"+ms.uiClass(formId, 'CPR_HAPPEN_TIME')+"' style='"+ms.uiStyle(formId, 'CPR_HAPPEN_TIME')+"' "+ms.uiEvent(formId, 'CPR_HAPPEN_TIME')+" title='"+ms.titleAttr(formId,'CPR_HAPPEN_TIME','IS_TITLE_ATTR',v)+"' >"+v['CPR_HAPPEN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_HAPPEN_ADDRESS' class='datagrid-cell "+ms.tdClass(formId, 'CPR_HAPPEN_ADDRESS')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_HAPPEN_ADDRESS')+"' "+ms.tdEvent(formId, 'CPR_HAPPEN_ADDRESS')+">")
            arrHtml.push("<span colno='CPR_HAPPEN_ADDRESS' class='"+ms.uiClass(formId, 'CPR_HAPPEN_ADDRESS')+"' style='"+ms.uiStyle(formId, 'CPR_HAPPEN_ADDRESS')+"' "+ms.uiEvent(formId, 'CPR_HAPPEN_ADDRESS')+" title='"+ms.titleAttr(formId,'CPR_HAPPEN_ADDRESS','IS_TITLE_ATTR',v)+"' >"+v['CPR_HAPPEN_ADDRESS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_HAPPEN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPR_HAPPEN_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CPR_HAPPEN_EMP')+"' "+ms.tdEvent(formId, 'CPR_HAPPEN_EMP')+">")
            arrHtml.push("<span colno='CPR_HAPPEN_EMP' class='"+ms.uiClass(formId, 'CPR_HAPPEN_EMP')+"' style='"+ms.uiStyle(formId, 'CPR_HAPPEN_EMP')+"' "+ms.uiEvent(formId, 'CPR_HAPPEN_EMP')+" title='"+ms.titleAttr(formId,'CPR_HAPPEN_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPR_HAPPEN_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_HAPPEN_PROBLEM' class='datagrid-cell "+ms.tdClass(formId, 'CPR_HAPPEN_PROBLEM')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_HAPPEN_PROBLEM')+"' "+ms.tdEvent(formId, 'CPR_HAPPEN_PROBLEM')+">")
            arrHtml.push("<span colno='CPR_HAPPEN_PROBLEM' class='"+ms.uiClass(formId, 'CPR_HAPPEN_PROBLEM')+"' style='height:30px;"+ms.uiStyle(formId, 'CPR_HAPPEN_PROBLEM')+"' "+ms.uiEvent(formId, 'CPR_HAPPEN_PROBLEM')+" title='"+ms.titleAttr(formId,'CPR_HAPPEN_PROBLEM','IS_TITLE_ATTR',v)+"' >"+v['CPR_HAPPEN_PROBLEM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_HAPPEN_INFLUENCE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_HAPPEN_INFLUENCE')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_HAPPEN_INFLUENCE')+"' "+ms.tdEvent(formId, 'CPR_HAPPEN_INFLUENCE')+">")
            arrHtml.push("<span colno='CPR_HAPPEN_INFLUENCE' class='"+ms.uiClass(formId, 'CPR_HAPPEN_INFLUENCE')+"' style='"+ms.uiStyle(formId, 'CPR_HAPPEN_INFLUENCE')+"' "+ms.uiEvent(formId, 'CPR_HAPPEN_INFLUENCE')+" title='"+ms.titleAttr(formId,'CPR_HAPPEN_INFLUENCE','IS_TITLE_ATTR',v)+"' >"+v['CPR_HAPPEN_INFLUENCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_GROUP_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPR_GROUP_EMP')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_GROUP_EMP')+"' "+ms.tdEvent(formId, 'CPR_GROUP_EMP')+">")
            arrHtml.push("<span colno='CPR_GROUP_EMP' class='"+ms.uiClass(formId, 'CPR_GROUP_EMP')+"' style='"+ms.uiStyle(formId, 'CPR_GROUP_EMP')+"' "+ms.uiEvent(formId, 'CPR_GROUP_EMP')+" title='"+ms.titleAttr(formId,'CPR_GROUP_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPR_GROUP_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_TEMPORARY_BASIS' class='datagrid-cell "+ms.tdClass(formId, 'CPR_TEMPORARY_BASIS')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_TEMPORARY_BASIS')+"' "+ms.tdEvent(formId, 'CPR_TEMPORARY_BASIS')+">")
            arrHtml.push("<span colno='CPR_TEMPORARY_BASIS' class='"+ms.uiClass(formId, 'CPR_TEMPORARY_BASIS')+"' style='"+ms.uiStyle(formId, 'CPR_TEMPORARY_BASIS')+"' "+ms.uiEvent(formId, 'CPR_TEMPORARY_BASIS')+" title='"+ms.titleAttr(formId,'CPR_TEMPORARY_BASIS','IS_TITLE_ATTR',v)+"' >"+v['CPR_TEMPORARY_BASIS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_TEMPORARY_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPR_TEMPORARY_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CPR_TEMPORARY_EMP')+"' "+ms.tdEvent(formId, 'CPR_TEMPORARY_EMP')+">")
            arrHtml.push("<span colno='CPR_TEMPORARY_EMP' class='"+ms.uiClass(formId, 'CPR_TEMPORARY_EMP')+"' style='"+ms.uiStyle(formId, 'CPR_TEMPORARY_EMP')+"' "+ms.uiEvent(formId, 'CPR_TEMPORARY_EMP')+" title='"+ms.titleAttr(formId,'CPR_TEMPORARY_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPR_TEMPORARY_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_TEMPORARY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_TEMPORARY_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CPR_TEMPORARY_DATE')+"' "+ms.tdEvent(formId, 'CPR_TEMPORARY_DATE')+">")
            arrHtml.push("<span colno='CPR_TEMPORARY_DATE' class='"+ms.uiClass(formId, 'CPR_TEMPORARY_DATE')+"' style='"+ms.uiStyle(formId, 'CPR_TEMPORARY_DATE')+"' "+ms.uiEvent(formId, 'CPR_TEMPORARY_DATE')+" title='"+ms.titleAttr(formId,'CPR_TEMPORARY_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPR_TEMPORARY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_IMPROVE_MEASURE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_IMPROVE_MEASURE')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_IMPROVE_MEASURE')+"' "+ms.tdEvent(formId, 'CPR_IMPROVE_MEASURE')+">")
            arrHtml.push("<span colno='CPR_IMPROVE_MEASURE' class='"+ms.uiClass(formId, 'CPR_IMPROVE_MEASURE')+"' style='"+ms.uiStyle(formId, 'CPR_IMPROVE_MEASURE')+"' "+ms.uiEvent(formId, 'CPR_IMPROVE_MEASURE')+" title='"+ms.titleAttr(formId,'CPR_IMPROVE_MEASURE','IS_TITLE_ATTR',v)+"' >"+v['CPR_IMPROVE_MEASURE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_IMPROVE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPR_IMPROVE_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CPR_IMPROVE_EMP')+"' "+ms.tdEvent(formId, 'CPR_IMPROVE_EMP')+">")
            arrHtml.push("<span colno='CPR_IMPROVE_EMP' class='"+ms.uiClass(formId, 'CPR_IMPROVE_EMP')+"' style='"+ms.uiStyle(formId, 'CPR_IMPROVE_EMP')+"' "+ms.uiEvent(formId, 'CPR_IMPROVE_EMP')+" title='"+ms.titleAttr(formId,'CPR_IMPROVE_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPR_IMPROVE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_IMPROVE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_IMPROVE_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CPR_IMPROVE_DATE')+"' "+ms.tdEvent(formId, 'CPR_IMPROVE_DATE')+">")
            arrHtml.push("<span colno='CPR_IMPROVE_DATE' class='"+ms.uiClass(formId, 'CPR_IMPROVE_DATE')+"' style='"+ms.uiStyle(formId, 'CPR_IMPROVE_DATE')+"' "+ms.uiEvent(formId, 'CPR_IMPROVE_DATE')+" title='"+ms.titleAttr(formId,'CPR_IMPROVE_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPR_IMPROVE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_CONFIRM_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'CPR_CONFIRM_RESULT')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CPR_CONFIRM_RESULT')+"' "+ms.tdEvent(formId, 'CPR_CONFIRM_RESULT')+">")
            arrHtml.push("<span colno='CPR_CONFIRM_RESULT' class='"+ms.uiClass(formId, 'CPR_CONFIRM_RESULT')+"' style='"+ms.uiStyle(formId, 'CPR_CONFIRM_RESULT')+"' "+ms.uiEvent(formId, 'CPR_CONFIRM_RESULT')+" title='"+ms.titleAttr(formId,'CPR_CONFIRM_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CPR_CONFIRM_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_EFFECT_CONFIRM' class='datagrid-cell "+ms.tdClass(formId, 'CPR_EFFECT_CONFIRM')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_EFFECT_CONFIRM')+"' "+ms.tdEvent(formId, 'CPR_EFFECT_CONFIRM')+">")
            arrHtml.push("<span colno='CPR_EFFECT_CONFIRM' class='"+ms.uiClass(formId, 'CPR_EFFECT_CONFIRM')+"' style='"+ms.uiStyle(formId, 'CPR_EFFECT_CONFIRM')+"' "+ms.uiEvent(formId, 'CPR_EFFECT_CONFIRM')+" title='"+ms.titleAttr(formId,'CPR_EFFECT_CONFIRM','IS_TITLE_ATTR',v)+"' >"+v['CPR_EFFECT_CONFIRM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_CONFIRM_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPR_CONFIRM_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CPR_CONFIRM_EMP')+"' "+ms.tdEvent(formId, 'CPR_CONFIRM_EMP')+">")
            arrHtml.push("<span colno='CPR_CONFIRM_EMP' class='"+ms.uiClass(formId, 'CPR_CONFIRM_EMP')+"' style='"+ms.uiStyle(formId, 'CPR_CONFIRM_EMP')+"' "+ms.uiEvent(formId, 'CPR_CONFIRM_EMP')+" title='"+ms.titleAttr(formId,'CPR_CONFIRM_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPR_CONFIRM_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_CONFIRM_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_CONFIRM_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CPR_CONFIRM_DATE')+"' "+ms.tdEvent(formId, 'CPR_CONFIRM_DATE')+">")
            arrHtml.push("<span colno='CPR_CONFIRM_DATE' class='"+ms.uiClass(formId, 'CPR_CONFIRM_DATE')+"' style='"+ms.uiStyle(formId, 'CPR_CONFIRM_DATE')+"' "+ms.uiEvent(formId, 'CPR_CONFIRM_DATE')+" title='"+ms.titleAttr(formId,'CPR_CONFIRM_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPR_CONFIRM_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_STANDARDIZE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_STANDARDIZE')+"' style='width:150px;"+ms.tdStyle(formId, 'CPR_STANDARDIZE')+"' "+ms.tdEvent(formId, 'CPR_STANDARDIZE')+">")
            arrHtml.push("<span colno='CPR_STANDARDIZE' class='"+ms.uiClass(formId, 'CPR_STANDARDIZE')+"' style='"+ms.uiStyle(formId, 'CPR_STANDARDIZE')+"' "+ms.uiEvent(formId, 'CPR_STANDARDIZE')+" title='"+ms.titleAttr(formId,'CPR_STANDARDIZE','IS_TITLE_ATTR',v)+"' >"+v['CPR_STANDARDIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPR_CONGRATULATE' class='datagrid-cell "+ms.tdClass(formId, 'CPR_CONGRATULATE')+"' style='width:200px;"+ms.tdEvent(formId, 'CPR_CONGRATULATE')+">")
            arrHtml.push("<span colno='CPR_CONGRATULATE' class='"+ms.uiClass(formId, 'CPR_CONGRATULATE')+"' style='"+ms.uiStyle(formId, 'CPR_CONGRATULATE')+"' "+ms.uiEvent(formId, 'CPR_CONGRATULATE')+" title='"+ms.titleAttr(formId,'CPR_CONGRATULATE','IS_TITLE_ATTR',v)+"' >"+v['CPR_CONGRATULATE']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
