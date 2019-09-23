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
		<dict:lang value="VM-时序备料" />
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
		<bu:header formId ="dc22be86e17d468fa1b1daffaab81702"/>

    
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
		<bu:func viewId="f85054104955457dba9cbbdab514e3f9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f85054104955457dba9cbbdab514e3f9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagedc22be86e17d468fa1b1daffaab81702" id="formPagedc22be86e17d468fa1b1daffaab81702" value="${formPagedc22be86e17d468fa1b1daffaab81702}"/>
		<input type="hidden" name="formId" id="formId1" value='dc22be86e17d468fa1b1daffaab81702'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="iframeid" name="iframeid" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="dc22be86e17d468fa1b1daffaab81702">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxdc22be86e17d468fa1b1daffaab81702" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerdc22be86e17d468fa1b1daffaab81702">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabledc22be86e17d468fa1b1daffaab81702" style="min-width:2200px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="dc22be86e17d468fa1b1daffaab81702" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_dc22be86e17d468fa1b1daffaab81702" onclick="_selectAjaxTableAllData(this,'dc22be86e17d468fa1b1daffaab81702')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell " style="width:140px;"><bu:uitn colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell " style="width:140px;"><bu:uitn colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WOM_OPERATE_EMP" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivdc22be86e17d468fa1b1daffaab81702" onscroll="ajaxTableScroll(this,'dc22be86e17d468fa1b1daffaab81702')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxdc22be86e17d468fa1b1daffaab81702" style="min-width:2200px;">
		<tbody id="tbody_dc22be86e17d468fa1b1daffaab81702" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagedc22be86e17d468fa1b1daffaab81702==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=dc22be86e17d468fa1b1daffaab81702&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f85054104955457dba9cbbdab514e3f9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f85054104955457dba9cbbdab514e3f9" />
    <!--
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include> -->
      
              <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mc/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WOM_STATUS\"}";
                    //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIP_STATUS\"}";
                   
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=f85054104955457dba9cbbdab514e3f9";
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
      /* document.forms.search_form.submit();
      util.showTopLoading(); */
      query("formId1");
      if ("0" == isCloseWin || undefined == isCloseWin) {
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
    if(formId=='dc22be86e17d468fa1b1daffaab81702'){<%--FM-仓库时序备料--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");           
            arrHtml.push("<td colno='WOM_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WOM_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WOM_MO_NUMBER')+">")
            arrHtml.push("<span colno='WOM_MO_NUMBER' class='"+ms.uiClass(formId, 'WOM_MO_NUMBER')+"' onclick='itemJump1(\""+v['WOM_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WOM_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WOM_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WOM_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WOM_STATUS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WOM_STATUS')+"' "+ms.tdEvent(formId, 'WOM_STATUS')+">")
            arrHtml.push("<span colno='WOM_STATUS' class='"+ms.uiClass(formId, 'WOM_STATUS')+"' style='"+ms.uiStyle(formId, 'WOM_STATUS')+"' "+ms.uiEvent(formId, 'WOM_STATUS')+" title='"+ms.titleAttr(formId,'WOM_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WOM_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='id"+v.ID+"' name='WOM_STATUS' value='"+uiRaw[i].WOM_STATUS+"' /></td>");
            arrHtml.push("<td colno='WOM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WOM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WOM_MODEL_CODE')+">")
            arrHtml.push("<span colno='WOM_MODEL_CODE' class='"+ms.uiClass(formId, 'WOM_MODEL_CODE')+"' onclick='itemJump2(\""+v['WOM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WOM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WOM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WOM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_MODEL_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MODEL_STANDARD')+"' style='width:150px;"+ms.tdStyle(formId, 'WOM_MODEL_STANDARD')+"' "+ms.tdEvent(formId, 'WOM_MODEL_STANDARD')+">")
            arrHtml.push("<span colno='WOM_MODEL_STANDARD' class='"+ms.uiClass(formId, 'WOM_MODEL_STANDARD')+"' style='"+ms.uiStyle(formId, 'WOM_MODEL_STANDARD')+"' "+ms.uiEvent(formId, 'WOM_MODEL_STANDARD')+" title='"+ms.titleAttr(formId,'WOM_MODEL_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['WOM_MODEL_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MODEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WOM_MODEL_NAME')+"' "+ms.tdEvent(formId, 'WOM_MODEL_NAME')+">")
            arrHtml.push("<span colno='WOM_MODEL_NAME' class='"+ms.uiClass(formId, 'WOM_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'WOM_MODEL_NAME')+"' "+ms.uiEvent(formId, 'WOM_MODEL_NAME')+" title='"+ms.titleAttr(formId,'WOM_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['WOM_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WOM_PROCESS_FACE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WOM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WOM_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WOM_PROCESS_FACE' class='"+ms.uiClass(formId, 'WOM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WOM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WOM_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WOM_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WOM_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_PREPARA_INTERVAL' class='datagrid-cell "+ms.tdClass(formId, 'WOM_PREPARA_INTERVAL')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'WOM_PREPARA_INTERVAL')+"' "+ms.tdEvent(formId, 'WOM_PREPARA_INTERVAL')+">")
            arrHtml.push("<span colno='WOM_PREPARA_INTERVAL' class='"+ms.uiClass(formId, 'WOM_PREPARA_INTERVAL')+"' style='"+ms.uiStyle(formId, 'WOM_PREPARA_INTERVAL')+"' "+ms.uiEvent(formId, 'WOM_PREPARA_INTERVAL')+" title='"+ms.titleAttr(formId,'WOM_PREPARA_INTERVAL','IS_TITLE_ATTR',v)+"' >"+v['WOM_PREPARA_INTERVAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_STANDARD_HOURS' class='datagrid-cell "+ms.tdClass(formId, 'WOM_STANDARD_HOURS')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WOM_STANDARD_HOURS')+"' "+ms.tdEvent(formId, 'WOM_STANDARD_HOURS')+">")
            arrHtml.push("<span colno='WOM_STANDARD_HOURS' class='"+ms.uiClass(formId, 'WOM_STANDARD_HOURS')+"' style='"+ms.uiStyle(formId, 'WOM_STANDARD_HOURS')+"' "+ms.uiEvent(formId, 'WOM_STANDARD_HOURS')+" title='"+ms.titleAttr(formId,'WOM_STANDARD_HOURS','IS_TITLE_ATTR',v)+"' >"+v['WOM_STANDARD_HOURS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_MO_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MO_NUM')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WOM_MO_NUM')+"' "+ms.tdEvent(formId, 'WOM_MO_NUM')+">")
            arrHtml.push("<span colno='WOM_MO_NUM' class='"+ms.uiClass(formId, 'WOM_MO_NUM')+"' style='"+ms.uiStyle(formId, 'WOM_MO_NUM')+"' "+ms.uiEvent(formId, 'WOM_MO_NUM')+" title='"+ms.titleAttr(formId,'WOM_MO_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOM_MO_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_OUT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOM_OUT_NUM')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WOM_OUT_NUM')+"' "+ms.tdEvent(formId, 'WOM_OUT_NUM')+">")
            arrHtml.push("<span colno='WOM_OUT_NUM' class='"+ms.uiClass(formId, 'WOM_OUT_NUM')+"' style='"+ms.uiStyle(formId, 'WOM_OUT_NUM')+"' "+ms.uiEvent(formId, 'WOM_OUT_NUM')+" title='"+ms.titleAttr(formId,'WOM_OUT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOM_OUT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_CURRENT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOM_CURRENT_NUM')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WOM_CURRENT_NUM')+"' "+ms.tdEvent(formId, 'WOM_CURRENT_NUM')+">")
            arrHtml.push("<span colno='WOM_CURRENT_NUM' class='"+ms.uiClass(formId, 'WOM_CURRENT_NUM')+"' style='"+ms.uiStyle(formId, 'WOM_CURRENT_NUM')+"' "+ms.uiEvent(formId, 'WOM_CURRENT_NUM')+" title='"+ms.titleAttr(formId,'WOM_CURRENT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOM_CURRENT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_NEXT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOM_NEXT_NUM')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WOM_NEXT_NUM')+"' "+ms.tdEvent(formId, 'WOM_NEXT_NUM')+">")
            arrHtml.push("<span colno='WOM_NEXT_NUM' class='"+ms.uiClass(formId, 'WOM_NEXT_NUM')+"' style='"+ms.uiStyle(formId, 'WOM_NEXT_NUM')+"' "+ms.uiEvent(formId, 'WOM_NEXT_NUM')+" title='"+ms.titleAttr(formId,'WOM_NEXT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOM_NEXT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_NEXT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WOM_NEXT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WOM_NEXT_TIME')+"' "+ms.tdEvent(formId, 'WOM_NEXT_TIME')+">")
            arrHtml.push("<span colno='WOM_NEXT_TIME' class='"+ms.uiClass(formId, 'WOM_NEXT_TIME')+"' style='"+ms.uiStyle(formId, 'WOM_NEXT_TIME')+"' "+ms.uiEvent(formId, 'WOM_NEXT_TIME')+" title='"+ms.titleAttr(formId,'WOM_NEXT_TIME','IS_TITLE_ATTR',v)+"' >"+v['WOM_NEXT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_OPERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WOM_OPERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WOM_OPERATE_TIME')+"' "+ms.tdEvent(formId, 'WOM_OPERATE_TIME')+">")
            arrHtml.push("<span colno='WOM_OPERATE_TIME' class='"+ms.uiClass(formId, 'WOM_OPERATE_TIME')+"' style='"+ms.uiStyle(formId, 'WOM_OPERATE_TIME')+"' "+ms.uiEvent(formId, 'WOM_OPERATE_TIME')+" title='"+ms.titleAttr(formId,'WOM_OPERATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WOM_OPERATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_OPERATE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WOM_OPERATE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WOM_OPERATE_EMP')+"' "+ms.tdEvent(formId, 'WOM_OPERATE_EMP')+">")
            arrHtml.push("<span colno='WOM_OPERATE_EMP' class='"+ms.uiClass(formId, 'WOM_OPERATE_EMP')+"' style='"+ms.uiStyle(formId, 'WOM_OPERATE_EMP')+"' "+ms.uiEvent(formId, 'WOM_OPERATE_EMP')+" title='"+ms.titleAttr(formId,'WOM_OPERATE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WOM_OPERATE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOM_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WOM_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'WOM_MEMO')+"' "+ms.tdEvent(formId, 'WOM_MEMO')+">")
            arrHtml.push("<span colno='WOM_MEMO' class='"+ms.uiClass(formId, 'WOM_MEMO')+"' style='"+ms.uiStyle(formId, 'WOM_MEMO')+"' "+ms.uiEvent(formId, 'WOM_MEMO')+" title='"+ms.titleAttr(formId,'WOM_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WOM_MEMO']+"</span>")
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
$(function(){
    $("#iframeid").val(window.name);
})
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//BOM管理
function itemJump2(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
