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
		<dict:lang value="VM-产品冻结信息" />
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
		<bu:header formId ="3497f5c022944fd492507df10f51ab9a"/>

    
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
		<bu:func viewId="36ecef5df4094b3ba8c4328cea93f5ad" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="36ecef5df4094b3ba8c4328cea93f5ad" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage3497f5c022944fd492507df10f51ab9a" id="formPage3497f5c022944fd492507df10f51ab9a" value="${formPage3497f5c022944fd492507df10f51ab9a}"/>
		<input type="hidden" name="formId" id="formId1" value='3497f5c022944fd492507df10f51ab9a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="3497f5c022944fd492507df10f51ab9a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax3497f5c022944fd492507df10f51ab9a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner3497f5c022944fd492507df10f51ab9a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable3497f5c022944fd492507df10f51ab9a" style="min-width:1550px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="3497f5c022944fd492507df10f51ab9a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_3497f5c022944fd492507df10f51ab9a" onclick="_selectAjaxTableAllData(this,'3497f5c022944fd492507df10f51ab9a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WFI_SN" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WFI_FREEZE_FLAG" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_ERROR_DOC" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_MO_NUMBER" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WFI_AREA_SN" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WFI_MODEL_CODE" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="MODEL_CODE_NAME" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WFI_INSPECT_SN" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WFI_NUM" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WFI_FREEZE_EMP" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WFI_FREEZE_TIME" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WFI_THAW_EMP" formId="3497f5c022944fd492507df10f51ab9a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WFI_THAW_TIME" formId="3497f5c022944fd492507df10f51ab9a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv3497f5c022944fd492507df10f51ab9a" onscroll="ajaxTableScroll(this,'3497f5c022944fd492507df10f51ab9a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax3497f5c022944fd492507df10f51ab9a" style="min-width:1550px;">
		<tbody id="tbody_3497f5c022944fd492507df10f51ab9a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage3497f5c022944fd492507df10f51ab9a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=3497f5c022944fd492507df10f51ab9a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="36ecef5df4094b3ba8c4328cea93f5ad" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="36ecef5df4094b3ba8c4328cea93f5ad" />
    <!--
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    -->
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WFI_FREEZE_FLAG\"}";
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
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WFI_ERROR_DOC").val(jumpId);
                  
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
 
<script>
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
    if(formId=='3497f5c022944fd492507df10f51ab9a'){<%--FM-产品冻结信息--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WFI_SN' class='datagrid-cell "+ms.tdClass(formId, 'WFI_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WFI_SN')+"' "+ms.tdEvent(formId, 'WFI_SN')+">")
            arrHtml.push("<span colno='WFI_SN' class='"+ms.uiClass(formId, 'WFI_SN')+"' onclick='itemJump1(\""+v['WFI_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_SN')+" title='"+ms.titleAttr(formId,'WFI_SN','IS_TITLE_ATTR',v)+"' >"+v['WFI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_FLAG')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_FLAG')+">")
            arrHtml.push("<span colno='WFI_FREEZE_FLAG' class='"+ms.uiClass(formId, 'WFI_FREEZE_FLAG')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_FLAG')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_FLAG')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].WFI_FREEZE_FLAG+"'></td>");
            arrHtml.push("<td colno='WFI_ERROR_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WFI_ERROR_DOC')+"' style='width:150px;"+ms.tdStyle(formId, 'WFI_ERROR_DOC')+"' "+ms.tdEvent(formId, 'WFI_ERROR_DOC')+">")
            arrHtml.push("<span colno='WFI_ERROR_DOC' class='"+ms.uiClass(formId, 'WFI_ERROR_DOC')+"' onclick='itemJump2(\""+v['WFI_ERROR_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_ERROR_DOC')+" title='"+ms.titleAttr(formId,'WFI_ERROR_DOC','IS_TITLE_ATTR',v)+"' >"+v['WFI_ERROR_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WFI_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WFI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WFI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WFI_MO_NUMBER' class='"+ms.uiClass(formId, 'WFI_MO_NUMBER')+"' onclick='itemJump3(\""+v['WFI_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WFI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WFI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'WFI_AREA_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WFI_AREA_SN')+"' "+ms.tdEvent(formId, 'WFI_AREA_SN')+">")
            arrHtml.push("<span colno='WFI_AREA_SN' class='"+ms.uiClass(formId, 'WFI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'WFI_AREA_SN')+"' "+ms.uiEvent(formId, 'WFI_AREA_SN')+" title='"+ms.titleAttr(formId,'WFI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['WFI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WFI_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WFI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WFI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WFI_MODEL_CODE' class='"+ms.uiClass(formId, 'WFI_MODEL_CODE')+"' onclick='itemJump4(\""+v['WFI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WFI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WFI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WFI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'MODEL_CODE_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'MODEL_CODE_NAME')+"' "+ms.tdEvent(formId, 'MODEL_CODE_NAME')+">")
            arrHtml.push("<span colno='MODEL_CODE_NAME' class='"+ms.uiClass(formId, 'MODEL_CODE_NAME')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE_NAME')+"' "+ms.uiEvent(formId, 'MODEL_CODE_NAME')+" title='"+ms.titleAttr(formId,'MODEL_CODE_NAME','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_INSPECT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WFI_INSPECT_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WFI_INSPECT_SN')+"' "+ms.tdEvent(formId, 'WFI_INSPECT_SN')+">")
            arrHtml.push("<span colno='WFI_INSPECT_SN' class='"+ms.uiClass(formId, 'WFI_INSPECT_SN')+"' style='"+ms.uiStyle(formId, 'WFI_INSPECT_SN')+"' "+ms.uiEvent(formId, 'WFI_INSPECT_SN')+" title='"+ms.titleAttr(formId,'WFI_INSPECT_SN','IS_TITLE_ATTR',v)+"' >"+v['WFI_INSPECT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WFI_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WFI_NUM')+"' "+ms.tdEvent(formId, 'WFI_NUM')+">")
            arrHtml.push("<span colno='WFI_NUM' class='"+ms.uiClass(formId, 'WFI_NUM')+"' style='"+ms.uiStyle(formId, 'WFI_NUM')+"' "+ms.uiEvent(formId, 'WFI_NUM')+" title='"+ms.titleAttr(formId,'WFI_NUM','IS_TITLE_ATTR',v)+"' >"+v['WFI_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_EMP')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_EMP')+">")
            arrHtml.push("<span colno='WFI_FREEZE_EMP' class='"+ms.uiClass(formId, 'WFI_FREEZE_EMP')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_EMP')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_EMP')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_FREEZE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WFI_FREEZE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WFI_FREEZE_TIME')+"' "+ms.tdEvent(formId, 'WFI_FREEZE_TIME')+">")
            arrHtml.push("<span colno='WFI_FREEZE_TIME' class='"+ms.uiClass(formId, 'WFI_FREEZE_TIME')+"' style='"+ms.uiStyle(formId, 'WFI_FREEZE_TIME')+"' "+ms.uiEvent(formId, 'WFI_FREEZE_TIME')+" title='"+ms.titleAttr(formId,'WFI_FREEZE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WFI_FREEZE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_THAW_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WFI_THAW_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WFI_THAW_EMP')+"' "+ms.tdEvent(formId, 'WFI_THAW_EMP')+">")
            arrHtml.push("<span colno='WFI_THAW_EMP' class='"+ms.uiClass(formId, 'WFI_THAW_EMP')+"' style='"+ms.uiStyle(formId, 'WFI_THAW_EMP')+"' "+ms.uiEvent(formId, 'WFI_THAW_EMP')+" title='"+ms.titleAttr(formId,'WFI_THAW_EMP','IS_TITLE_ATTR',v)+"' >"+v['WFI_THAW_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WFI_THAW_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WFI_THAW_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WFI_THAW_TIME')+"' "+ms.tdEvent(formId, 'WFI_THAW_TIME')+">")
            arrHtml.push("<span colno='WFI_THAW_TIME' class='"+ms.uiClass(formId, 'WFI_THAW_TIME')+"' style='"+ms.uiStyle(formId, 'WFI_THAW_TIME')+"' "+ms.uiEvent(formId, 'WFI_THAW_TIME')+" title='"+ms.titleAttr(formId,'WFI_THAW_TIME','IS_TITLE_ATTR',v)+"' >"+v['WFI_THAW_TIME']+"</span>")
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
}

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

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//品质异常单
function itemJump2(obj){
    winOptMethod.jump("dda8049c4aa940c2bd6dbc6246dce6d1","F6247","jumpId",obj);
} 

//制令单信息
function itemJump3(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump4(obj){
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
