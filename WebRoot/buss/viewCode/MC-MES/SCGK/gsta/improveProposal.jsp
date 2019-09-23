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
		<dict:lang value="VM-改善提案" />
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
		<bu:header formId ="ff8f5a5bddcf4021aa945e5a217e6552"/>

    
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
		<bu:func viewId="49180ede06d749f3b6401f5341cad8e5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="49180ede06d749f3b6401f5341cad8e5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageff8f5a5bddcf4021aa945e5a217e6552" id="formPageff8f5a5bddcf4021aa945e5a217e6552" value="${formPageff8f5a5bddcf4021aa945e5a217e6552}"/>
		<input type="hidden" name="formId" id="formId1" value='ff8f5a5bddcf4021aa945e5a217e6552'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ff8f5a5bddcf4021aa945e5a217e6552">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxff8f5a5bddcf4021aa945e5a217e6552" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerff8f5a5bddcf4021aa945e5a217e6552">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff8f5a5bddcf4021aa945e5a217e6552" style="min-width:2660px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff8f5a5bddcf4021aa945e5a217e6552" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ff8f5a5bddcf4021aa945e5a217e6552" onclick="_selectAjaxTableAllData(this,'ff8f5a5bddcf4021aa945e5a217e6552')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CIP_SN" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CIP_STATUS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CIP_NAME" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CIP_DEPT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CIP_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_CURRENT_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_BAD_TYPE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_BAD_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_IMPROVE_METHODS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_EXCEPT_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_IMPLEMENT_CONFIRM" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_CONFIRM_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CIP_CONFIRM_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_REVIEW_RESULT" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_REVIEW_REASON" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_REVIEW_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CIP_REVIEW_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CIP_BENEFIT_ANALYSIS" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CIP_ANALYSIS_EMP" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CIP_ANALYSIS_DATE" formId="ff8f5a5bddcf4021aa945e5a217e6552" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivff8f5a5bddcf4021aa945e5a217e6552" onscroll="ajaxTableScroll(this,'ff8f5a5bddcf4021aa945e5a217e6552')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff8f5a5bddcf4021aa945e5a217e6552" style="min-width:2660px;">
		<tbody id="tbody_ff8f5a5bddcf4021aa945e5a217e6552" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageff8f5a5bddcf4021aa945e5a217e6552==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff8f5a5bddcf4021aa945e5a217e6552&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="49180ede06d749f3b6401f5341cad8e5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="49180ede06d749f3b6401f5341cad8e5" />
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIP_STATUS\"}";
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
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='ff8f5a5bddcf4021aa945e5a217e6552'){<%--FM-改善提案信息--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_SN' class='datagrid-cell "+ms.tdClass(formId, 'CIP_SN')+"' style='width:180px;"+ms.tdStyle(formId, 'CIP_SN')+"' "+ms.tdEvent(formId, 'CIP_SN')+">")
            arrHtml.push("<span colno='CIP_SN' class='"+ms.uiClass(formId, 'CIP_SN')+"' style='"+ms.uiStyle(formId, 'CIP_SN')+"' "+ms.uiEvent(formId, 'CIP_SN')+" title='"+ms.titleAttr(formId,'CIP_SN','IS_TITLE_ATTR',v)+"' >"+v['CIP_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CIP_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CIP_STATUS')+"' "+ms.tdEvent(formId, 'CIP_STATUS')+">")
            arrHtml.push("<span colno='CIP_STATUS' class='"+ms.uiClass(formId, 'CIP_STATUS')+"' style='"+ms.uiStyle(formId, 'CIP_STATUS')+"' "+ms.uiEvent(formId, 'CIP_STATUS')+" title='"+ms.titleAttr(formId,'CIP_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CIP_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CIP_STATUS+"'></td>");
            arrHtml.push("<td colno='CIP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CIP_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CIP_NAME')+"' "+ms.tdEvent(formId, 'CIP_NAME')+">")
            arrHtml.push("<span colno='CIP_NAME' class='"+ms.uiClass(formId, 'CIP_NAME')+"' style='"+ms.uiStyle(formId, 'CIP_NAME')+"' "+ms.uiEvent(formId, 'CIP_NAME')+" title='"+ms.titleAttr(formId,'CIP_NAME','IS_TITLE_ATTR',v)+"' >"+v['CIP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_DEPT' class='datagrid-cell "+ms.tdClass(formId, 'CIP_DEPT')+"' style='width:120px;"+ms.tdStyle(formId, 'CIP_DEPT')+"' "+ms.tdEvent(formId, 'CIP_DEPT')+">")
            arrHtml.push("<span colno='CIP_DEPT' class='"+ms.uiClass(formId, 'CIP_DEPT')+"' style='"+ms.uiStyle(formId, 'CIP_DEPT')+"' "+ms.uiEvent(formId, 'CIP_DEPT')+" title='"+ms.titleAttr(formId,'CIP_DEPT','IS_TITLE_ATTR',v)+"' >"+v['CIP_DEPT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CIP_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_EMP')+"' "+ms.tdEvent(formId, 'CIP_EMP')+">")
            arrHtml.push("<span colno='CIP_EMP' class='"+ms.uiClass(formId, 'CIP_EMP')+"' style='"+ms.uiStyle(formId, 'CIP_EMP')+"' "+ms.uiEvent(formId, 'CIP_EMP')+" title='"+ms.titleAttr(formId,'CIP_EMP','IS_TITLE_ATTR',v)+"' >"+v['CIP_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CIP_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CIP_DATE')+"' "+ms.tdEvent(formId, 'CIP_DATE')+">")
            arrHtml.push("<span colno='CIP_DATE' class='"+ms.uiClass(formId, 'CIP_DATE')+"' style='"+ms.uiStyle(formId, 'CIP_DATE')+"' "+ms.uiEvent(formId, 'CIP_DATE')+" title='"+ms.titleAttr(formId,'CIP_DATE','IS_TITLE_ATTR',v)+"' >"+v['CIP_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_CURRENT_METHODS' class='datagrid-cell "+ms.tdClass(formId, 'CIP_CURRENT_METHODS')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_CURRENT_METHODS')+"' "+ms.tdEvent(formId, 'CIP_CURRENT_METHODS')+">")
            arrHtml.push("<span colno='CIP_CURRENT_METHODS' class='"+ms.uiClass(formId, 'CIP_CURRENT_METHODS')+"' style='"+ms.uiStyle(formId, 'CIP_CURRENT_METHODS')+"' "+ms.uiEvent(formId, 'CIP_CURRENT_METHODS')+" title='"+ms.titleAttr(formId,'CIP_CURRENT_METHODS','IS_TITLE_ATTR',v)+"' >"+v['CIP_CURRENT_METHODS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_BAD_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CIP_BAD_TYPE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_BAD_TYPE')+"' "+ms.tdEvent(formId, 'CIP_BAD_TYPE')+">")
            arrHtml.push("<span colno='CIP_BAD_TYPE' class='"+ms.uiClass(formId, 'CIP_BAD_TYPE')+"' style='"+ms.uiStyle(formId, 'CIP_BAD_TYPE')+"' "+ms.uiEvent(formId, 'CIP_BAD_TYPE')+" title='"+ms.titleAttr(formId,'CIP_BAD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CIP_BAD_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_BAD_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CIP_BAD_REASON')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_BAD_REASON')+"' "+ms.tdEvent(formId, 'CIP_BAD_REASON')+">")
            arrHtml.push("<span colno='CIP_BAD_REASON' class='"+ms.uiClass(formId, 'CIP_BAD_REASON')+"' style='"+ms.uiStyle(formId, 'CIP_BAD_REASON')+"' "+ms.uiEvent(formId, 'CIP_BAD_REASON')+" title='"+ms.titleAttr(formId,'CIP_BAD_REASON','IS_TITLE_ATTR',v)+"' >"+v['CIP_BAD_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_IMPROVE_METHODS' class='datagrid-cell "+ms.tdClass(formId, 'CIP_IMPROVE_METHODS')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_IMPROVE_METHODS')+"' "+ms.tdEvent(formId, 'CIP_IMPROVE_METHODS')+">")
            arrHtml.push("<span colno='CIP_IMPROVE_METHODS' class='"+ms.uiClass(formId, 'CIP_IMPROVE_METHODS')+"' style='"+ms.uiStyle(formId, 'CIP_IMPROVE_METHODS')+"' "+ms.uiEvent(formId, 'CIP_IMPROVE_METHODS')+" title='"+ms.titleAttr(formId,'CIP_IMPROVE_METHODS','IS_TITLE_ATTR',v)+"' >"+v['CIP_IMPROVE_METHODS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_EXCEPT_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'CIP_EXCEPT_RESULT')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_EXCEPT_RESULT')+"' "+ms.tdEvent(formId, 'CIP_EXCEPT_RESULT')+">")
            arrHtml.push("<span colno='CIP_EXCEPT_RESULT' class='"+ms.uiClass(formId, 'CIP_EXCEPT_RESULT')+"' style='"+ms.uiStyle(formId, 'CIP_EXCEPT_RESULT')+"' "+ms.uiEvent(formId, 'CIP_EXCEPT_RESULT')+" title='"+ms.titleAttr(formId,'CIP_EXCEPT_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CIP_EXCEPT_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_IMPLEMENT_CONFIRM' class='datagrid-cell "+ms.tdClass(formId, 'CIP_IMPLEMENT_CONFIRM')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_IMPLEMENT_CONFIRM')+"' "+ms.tdEvent(formId, 'CIP_IMPLEMENT_CONFIRM')+">")
            arrHtml.push("<span colno='CIP_IMPLEMENT_CONFIRM' class='"+ms.uiClass(formId, 'CIP_IMPLEMENT_CONFIRM')+"' style='"+ms.uiStyle(formId, 'CIP_IMPLEMENT_CONFIRM')+"' "+ms.uiEvent(formId, 'CIP_IMPLEMENT_CONFIRM')+" title='"+ms.titleAttr(formId,'CIP_IMPLEMENT_CONFIRM','IS_TITLE_ATTR',v)+"' >"+v['CIP_IMPLEMENT_CONFIRM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_CONFIRM_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CIP_CONFIRM_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_CONFIRM_EMP')+"' "+ms.tdEvent(formId, 'CIP_CONFIRM_EMP')+">")
            arrHtml.push("<span colno='CIP_CONFIRM_EMP' class='"+ms.uiClass(formId, 'CIP_CONFIRM_EMP')+"' style='"+ms.uiStyle(formId, 'CIP_CONFIRM_EMP')+"' "+ms.uiEvent(formId, 'CIP_CONFIRM_EMP')+" title='"+ms.titleAttr(formId,'CIP_CONFIRM_EMP','IS_TITLE_ATTR',v)+"' >"+v['CIP_CONFIRM_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_CONFIRM_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CIP_CONFIRM_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CIP_CONFIRM_DATE')+"' "+ms.tdEvent(formId, 'CIP_CONFIRM_DATE')+">")
            arrHtml.push("<span colno='CIP_CONFIRM_DATE' class='"+ms.uiClass(formId, 'CIP_CONFIRM_DATE')+"' style='"+ms.uiStyle(formId, 'CIP_CONFIRM_DATE')+"' "+ms.uiEvent(formId, 'CIP_CONFIRM_DATE')+" title='"+ms.titleAttr(formId,'CIP_CONFIRM_DATE','IS_TITLE_ATTR',v)+"' >"+v['CIP_CONFIRM_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_REVIEW_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'CIP_REVIEW_RESULT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_REVIEW_RESULT')+"' "+ms.tdEvent(formId, 'CIP_REVIEW_RESULT')+">")
            arrHtml.push("<span colno='CIP_REVIEW_RESULT' class='"+ms.uiClass(formId, 'CIP_REVIEW_RESULT')+"' style='"+ms.uiStyle(formId, 'CIP_REVIEW_RESULT')+"' "+ms.uiEvent(formId, 'CIP_REVIEW_RESULT')+" title='"+ms.titleAttr(formId,'CIP_REVIEW_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CIP_REVIEW_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_REVIEW_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CIP_REVIEW_REASON')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_REVIEW_REASON')+"' "+ms.tdEvent(formId, 'CIP_REVIEW_REASON')+">")
            arrHtml.push("<span colno='CIP_REVIEW_REASON' class='"+ms.uiClass(formId, 'CIP_REVIEW_REASON')+"' style='"+ms.uiStyle(formId, 'CIP_REVIEW_REASON')+"' "+ms.uiEvent(formId, 'CIP_REVIEW_REASON')+" title='"+ms.titleAttr(formId,'CIP_REVIEW_REASON','IS_TITLE_ATTR',v)+"' >"+v['CIP_REVIEW_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_REVIEW_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CIP_REVIEW_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_REVIEW_EMP')+"' "+ms.tdEvent(formId, 'CIP_REVIEW_EMP')+">")
            arrHtml.push("<span colno='CIP_REVIEW_EMP' class='"+ms.uiClass(formId, 'CIP_REVIEW_EMP')+"' style='"+ms.uiStyle(formId, 'CIP_REVIEW_EMP')+"' "+ms.uiEvent(formId, 'CIP_REVIEW_EMP')+" title='"+ms.titleAttr(formId,'CIP_REVIEW_EMP','IS_TITLE_ATTR',v)+"' >"+v['CIP_REVIEW_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_REVIEW_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CIP_REVIEW_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CIP_REVIEW_DATE')+"' "+ms.tdEvent(formId, 'CIP_REVIEW_DATE')+">")
            arrHtml.push("<span colno='CIP_REVIEW_DATE' class='"+ms.uiClass(formId, 'CIP_REVIEW_DATE')+"' style='"+ms.uiStyle(formId, 'CIP_REVIEW_DATE')+"' "+ms.uiEvent(formId, 'CIP_REVIEW_DATE')+" title='"+ms.titleAttr(formId,'CIP_REVIEW_DATE','IS_TITLE_ATTR',v)+"' >"+v['CIP_REVIEW_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_BENEFIT_ANALYSIS' class='datagrid-cell "+ms.tdClass(formId, 'CIP_BENEFIT_ANALYSIS')+"' style='width:150px;"+ms.tdStyle(formId, 'CIP_BENEFIT_ANALYSIS')+"' "+ms.tdEvent(formId, 'CIP_BENEFIT_ANALYSIS')+">")
            arrHtml.push("<span colno='CIP_BENEFIT_ANALYSIS' class='"+ms.uiClass(formId, 'CIP_BENEFIT_ANALYSIS')+"' style='"+ms.uiStyle(formId, 'CIP_BENEFIT_ANALYSIS')+"' "+ms.uiEvent(formId, 'CIP_BENEFIT_ANALYSIS')+" title='"+ms.titleAttr(formId,'CIP_BENEFIT_ANALYSIS','IS_TITLE_ATTR',v)+"' >"+v['CIP_BENEFIT_ANALYSIS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_ANALYSIS_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CIP_ANALYSIS_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CIP_ANALYSIS_EMP')+"' "+ms.tdEvent(formId, 'CIP_ANALYSIS_EMP')+">")
            arrHtml.push("<span colno='CIP_ANALYSIS_EMP' class='"+ms.uiClass(formId, 'CIP_ANALYSIS_EMP')+"' style='"+ms.uiStyle(formId, 'CIP_ANALYSIS_EMP')+"' "+ms.uiEvent(formId, 'CIP_ANALYSIS_EMP')+" title='"+ms.titleAttr(formId,'CIP_ANALYSIS_EMP','IS_TITLE_ATTR',v)+"' >"+v['CIP_ANALYSIS_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIP_ANALYSIS_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CIP_ANALYSIS_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CIP_ANALYSIS_DATE')+"' "+ms.tdEvent(formId, 'CIP_ANALYSIS_DATE')+">")
            arrHtml.push("<span colno='CIP_ANALYSIS_DATE' class='"+ms.uiClass(formId, 'CIP_ANALYSIS_DATE')+"' style='"+ms.uiStyle(formId, 'CIP_ANALYSIS_DATE')+"' "+ms.uiEvent(formId, 'CIP_ANALYSIS_DATE')+" title='"+ms.titleAttr(formId,'CIP_ANALYSIS_DATE','IS_TITLE_ATTR',v)+"' >"+v['CIP_ANALYSIS_DATE']+"</span>")
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
