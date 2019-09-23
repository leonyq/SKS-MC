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
		<dict:lang value="VM-ECN管理" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <!--ss-->
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="4a5db9f5df65424caa083c77fa45e44b"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
       <script src="${path}plf/js/echarts/echarts.js"></script>
  <script src="${path}plf/js/highcharts/highcharts.js"></script>
  <script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="9fd9ae226e9b48eeb8bc1ce65ed6acd9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9fd9ae226e9b48eeb8bc1ce65ed6acd9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4a5db9f5df65424caa083c77fa45e44b" id="formPage4a5db9f5df65424caa083c77fa45e44b" value="${formPage4a5db9f5df65424caa083c77fa45e44b}"/>
		<input type="hidden" name="formId" id="formId1" value='4a5db9f5df65424caa083c77fa45e44b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4a5db9f5df65424caa083c77fa45e44b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4a5db9f5df65424caa083c77fa45e44b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4a5db9f5df65424caa083c77fa45e44b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4a5db9f5df65424caa083c77fa45e44b" style="min-width:1810px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4a5db9f5df65424caa083c77fa45e44b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4a5db9f5df65424caa083c77fa45e44b" onclick="_selectAjaxTableAllData(this,'4a5db9f5df65424caa083c77fa45e44b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CEI_ECR_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CEI_ECN_SN" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CEI_ECN_TYPE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CEI_ITEM_CODE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_URGENT_GRADE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_CHANGE_IMPLEMENT" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CEI_DISTRIBUTE_DEP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CEI_ECR_APPLAYDATE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECR_APPLAYEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECR_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECR_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECN_CREATEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CEI_ECN_CREATEDATE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECN_EXAMINEEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CEI_ECN_APPROVALEMP" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CEI_ECN_EXAMINEDATE" formId="4a5db9f5df65424caa083c77fa45e44b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4a5db9f5df65424caa083c77fa45e44b" onscroll="ajaxTableScroll(this,'4a5db9f5df65424caa083c77fa45e44b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4a5db9f5df65424caa083c77fa45e44b" style="min-width:1810px;">
		<tbody id="tbody_4a5db9f5df65424caa083c77fa45e44b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4a5db9f5df65424caa083c77fa45e44b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4a5db9f5df65424caa083c77fa45e44b&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9fd9ae226e9b48eeb8bc1ce65ed6acd9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9fd9ae226e9b48eeb8bc1ce65ed6acd9" />
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CEI_ECN_TYPE\"}";
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
    if(formId=='4a5db9f5df65424caa083c77fa45e44b'){<%--FM-ECN信息表--%>
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
            arrHtml.push("<td colno='CEI_ECR_SN' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECR_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CEI_ECR_SN')+"' "+ms.tdEvent(formId, 'CEI_ECR_SN')+">")
            arrHtml.push("<span colno='CEI_ECR_SN' class='"+ms.uiClass(formId, 'CEI_ECR_SN')+"' style='"+ms.uiStyle(formId, 'CEI_ECR_SN')+"' "+ms.uiEvent(formId, 'CEI_ECR_SN')+" title='"+ms.titleAttr(formId,'CEI_ECR_SN','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CEI_ECN_SN')+"' "+ms.tdEvent(formId, 'CEI_ECN_SN')+">")
            arrHtml.push("<span colno='CEI_ECN_SN' class='"+ms.uiClass(formId, 'CEI_ECN_SN')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_SN')+"' "+ms.uiEvent(formId, 'CEI_ECN_SN')+" title='"+ms.titleAttr(formId,'CEI_ECN_SN','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_TYPE')+"' "+ms.tdEvent(formId, 'CEI_ECN_TYPE')+">")
            arrHtml.push("<span colno='CEI_ECN_TYPE' class='"+ms.uiClass(formId, 'CEI_ECN_TYPE')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_TYPE')+"' "+ms.uiEvent(formId, 'CEI_ECN_TYPE')+" title='"+ms.titleAttr(formId,'CEI_ECN_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_TYPE']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CEI_ECN_TYPE+"'></td>");
            arrHtml.push("<td colno='CEI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CEI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CEI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CEI_ITEM_CODE' class='"+ms.uiClass(formId, 'CEI_ITEM_CODE')+"' onclick='itemJump1(\""+v['CEI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CEI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CEI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CEI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_URGENT_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_URGENT_GRADE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_URGENT_GRADE')+"' "+ms.tdEvent(formId, 'CEI_URGENT_GRADE')+">")
            arrHtml.push("<span colno='CEI_URGENT_GRADE'  class='"+ms.uiClass(formId, 'CEI_URGENT_GRADE')+"' style='"+ms.uiStyle(formId, 'CEI_URGENT_GRADE')+"' "+ms.uiEvent(formId, 'CEI_URGENT_GRADE')+" title='"+ms.titleAttr(formId,'CEI_URGENT_GRADE','IS_TITLE_ATTR',v)+"' >"+v['CEI_URGENT_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_CHANGE_IMPLEMENT' class='datagrid-cell "+ms.tdClass(formId, 'CEI_CHANGE_IMPLEMENT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_CHANGE_IMPLEMENT')+"' "+ms.tdEvent(formId, 'CEI_CHANGE_IMPLEMENT')+">")
            arrHtml.push("<span colno='CEI_CHANGE_IMPLEMENT' class='"+ms.uiClass(formId, 'CEI_CHANGE_IMPLEMENT')+"' style='"+ms.uiStyle(formId, 'CEI_CHANGE_IMPLEMENT')+"' "+ms.uiEvent(formId, 'CEI_CHANGE_IMPLEMENT')+" title='"+ms.titleAttr(formId,'CEI_CHANGE_IMPLEMENT','IS_TITLE_ATTR',v)+"' >"+v['CEI_CHANGE_IMPLEMENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_DISTRIBUTE_DEP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_DISTRIBUTE_DEP')+"' style='width:120px;"+ms.tdStyle(formId, 'CEI_DISTRIBUTE_DEP')+"' "+ms.tdEvent(formId, 'CEI_DISTRIBUTE_DEP')+">")
            arrHtml.push("<span colno='CEI_DISTRIBUTE_DEP' class='"+ms.uiClass(formId, 'CEI_DISTRIBUTE_DEP')+"' style='"+ms.uiStyle(formId, 'CEI_DISTRIBUTE_DEP')+"' "+ms.uiEvent(formId, 'CEI_DISTRIBUTE_DEP')+" title='"+ms.titleAttr(formId,'CEI_DISTRIBUTE_DEP','IS_TITLE_ATTR',v)+"' >"+v['CEI_DISTRIBUTE_DEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECR_APPLAYDATE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECR_APPLAYDATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECR_APPLAYDATE')+"' "+ms.tdEvent(formId, 'CEI_ECR_APPLAYDATE')+">")
            arrHtml.push("<span colno='CEI_ECR_APPLAYDATE' class='"+ms.uiClass(formId, 'CEI_ECR_APPLAYDATE')+"' style='"+ms.uiStyle(formId, 'CEI_ECR_APPLAYDATE')+"' "+ms.uiEvent(formId, 'CEI_ECR_APPLAYDATE')+" title='"+ms.titleAttr(formId,'CEI_ECR_APPLAYDATE','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECR_APPLAYDATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECR_APPLAYEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECR_APPLAYEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECR_APPLAYEMP')+"' "+ms.tdEvent(formId, 'CEI_ECR_APPLAYEMP')+">")
            arrHtml.push("<span colno='CEI_ECR_APPLAYEMP' class='"+ms.uiClass(formId, 'CEI_ECR_APPLAYEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECR_APPLAYEMP')+"' "+ms.uiEvent(formId, 'CEI_ECR_APPLAYEMP')+" title='"+ms.titleAttr(formId,'CEI_ECR_APPLAYEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECR_APPLAYEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECR_EXAMINEEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECR_EXAMINEEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECR_EXAMINEEMP')+"' "+ms.tdEvent(formId, 'CEI_ECR_EXAMINEEMP')+">")
            arrHtml.push("<span colno='CEI_ECR_EXAMINEEMP' class='"+ms.uiClass(formId, 'CEI_ECR_EXAMINEEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECR_EXAMINEEMP')+"' "+ms.uiEvent(formId, 'CEI_ECR_EXAMINEEMP')+" title='"+ms.titleAttr(formId,'CEI_ECR_EXAMINEEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECR_EXAMINEEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECR_APPROVALEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECR_APPROVALEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECR_APPROVALEMP')+"' "+ms.tdEvent(formId, 'CEI_ECR_APPROVALEMP')+">")
            arrHtml.push("<span colno='CEI_ECR_APPROVALEMP' class='"+ms.uiClass(formId, 'CEI_ECR_APPROVALEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECR_APPROVALEMP')+"' "+ms.uiEvent(formId, 'CEI_ECR_APPROVALEMP')+" title='"+ms.titleAttr(formId,'CEI_ECR_APPROVALEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECR_APPROVALEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_CREATEEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_CREATEEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_CREATEEMP')+"' "+ms.tdEvent(formId, 'CEI_ECN_CREATEEMP')+">")
            arrHtml.push("<span colno='CEI_ECN_CREATEEMP' class='"+ms.uiClass(formId, 'CEI_ECN_CREATEEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_CREATEEMP')+"' "+ms.uiEvent(formId, 'CEI_ECN_CREATEEMP')+" title='"+ms.titleAttr(formId,'CEI_ECN_CREATEEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_CREATEEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_CREATEDATE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_CREATEDATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_CREATEDATE')+"' "+ms.tdEvent(formId, 'CEI_ECN_CREATEDATE')+">")
            arrHtml.push("<span colno='CEI_ECN_CREATEDATE' class='"+ms.uiClass(formId, 'CEI_ECN_CREATEDATE')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_CREATEDATE')+"' "+ms.uiEvent(formId, 'CEI_ECN_CREATEDATE')+" title='"+ms.titleAttr(formId,'CEI_ECN_CREATEDATE','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_CREATEDATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_EXAMINEEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_EXAMINEEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_EXAMINEEMP')+"' "+ms.tdEvent(formId, 'CEI_ECN_EXAMINEEMP')+">")
            arrHtml.push("<span colno='CEI_ECN_EXAMINEEMP' class='"+ms.uiClass(formId, 'CEI_ECN_EXAMINEEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_EXAMINEEMP')+"' "+ms.uiEvent(formId, 'CEI_ECN_EXAMINEEMP')+" title='"+ms.titleAttr(formId,'CEI_ECN_EXAMINEEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_EXAMINEEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_APPROVALEMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_APPROVALEMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_APPROVALEMP')+"' "+ms.tdEvent(formId, 'CEI_ECN_APPROVALEMP')+">")
            arrHtml.push("<span colno='CEI_ECN_APPROVALEMP' class='"+ms.uiClass(formId, 'CEI_ECN_APPROVALEMP')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_APPROVALEMP')+"' "+ms.uiEvent(formId, 'CEI_ECN_APPROVALEMP')+" title='"+ms.titleAttr(formId,'CEI_ECN_APPROVALEMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_APPROVALEMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_ECN_EXAMINEDATE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_ECN_EXAMINEDATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CEI_ECN_EXAMINEDATE')+"' "+ms.tdEvent(formId, 'CEI_ECN_EXAMINEDATE')+">")
            arrHtml.push("<span colno='CEI_ECN_EXAMINEDATE' class='"+ms.uiClass(formId, 'CEI_ECN_EXAMINEDATE')+"' style='"+ms.uiStyle(formId, 'CEI_ECN_EXAMINEDATE')+"' "+ms.uiEvent(formId, 'CEI_ECN_EXAMINEDATE')+" title='"+ms.titleAttr(formId,'CEI_ECN_EXAMINEDATE','IS_TITLE_ATTR',v)+"' >"+v['CEI_ECN_EXAMINEDATE']+"</span>")
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

//BOM管理
function itemJump1(obj){
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
