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
		<dict:lang value="VM-无效生产时间" />
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
		<bu:header formId ="6209be18186f43ba92fa495365a68c02"/>

    
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
		<bu:func viewId="02caf54b993447509d4297774f5fc643" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="02caf54b993447509d4297774f5fc643" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6209be18186f43ba92fa495365a68c02" id="formPage6209be18186f43ba92fa495365a68c02" value="${formPage6209be18186f43ba92fa495365a68c02}"/>
		<input type="hidden" name="formId" id="formId1" value='6209be18186f43ba92fa495365a68c02'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="iframeid" name="iframeid" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1 "  id="6209be18186f43ba92fa495365a68c02">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6209be18186f43ba92fa495365a68c02" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2 " id="datagrid-header-inner6209be18186f43ba92fa495365a68c02">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6209be18186f43ba92fa495365a68c02" > 
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6209be18186f43ba92fa495365a68c02" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6209be18186f43ba92fa495365a68c02" onclick="_selectAjaxTableAllData(this,'6209be18186f43ba92fa495365a68c02')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="CSI_AREA_SN" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="CSI_PROJECT_ID" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="CSI_MO_NUMBER" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_TYPE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_STATUS" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_BEGIN_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_END_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_STOP_TIMES" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_RECORD_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_RECORD_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_MAINTENANCE_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_MAINTENANCE_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_MAINTENANCE" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_EXAMINE_RESULT" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CSI_EXAMINE_EMP" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_EXAMINE_TIME" formId="6209be18186f43ba92fa495365a68c02" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CSI_EXAMINE_REASON" formId="6209be18186f43ba92fa495365a68c02" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv6209be18186f43ba92fa495365a68c02" onscroll="ajaxTableScroll(this,'6209be18186f43ba92fa495365a68c02')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6209be18186f43ba92fa495365a68c02" >
		<tbody id="tbody_6209be18186f43ba92fa495365a68c02" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6209be18186f43ba92fa495365a68c02==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6209be18186f43ba92fa495365a68c02&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="02caf54b993447509d4297774f5fc643" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="02caf54b993447509d4297774f5fc643" />
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
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CSI_STATUS,CSI_TYPE\"}";
                    //var url = "/N2/buss/bussModel_listMsData.ms";
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=2168596ab39a42fab6b43fafbed16bdd";
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
                    //initTableWidth();
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

$(function(){
    
    $("#iframeid").val(window.name);
    //$(document.getElementById('VR_FLAG')).closest('.group').attr("style","display:none;");
    
})
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
    if(formId=='6209be18186f43ba92fa495365a68c02'){<%--FM-无效生产时间--%>
         // $('.scroll2').mCustomScrollbar("destroy");
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
            arrHtml.push("<td colno='CSI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CSI_AREA_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'CSI_AREA_SN')+"' "+ms.tdEvent(formId, 'CSI_AREA_SN')+">")
            arrHtml.push("<span colno='CSI_AREA_SN' class='"+ms.uiClass(formId, 'CSI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CSI_AREA_SN')+"' "+ms.uiEvent(formId, 'CSI_AREA_SN')+" title='"+ms.titleAttr(formId,'CSI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CSI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CSI_PROJECT_ID')+"' style='width:120px;"+ms.tdStyle(formId, 'CSI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'CSI_PROJECT_ID')+">")
            arrHtml.push("<span colno='CSI_PROJECT_ID' class='"+ms.uiClass(formId, 'CSI_PROJECT_ID')+"' onclick='itemJump1(\""+v['CSI_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CSI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'CSI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['CSI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CSI_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'CSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='CSI_MO_NUMBER' class='"+ms.uiClass(formId, 'CSI_MO_NUMBER')+"' onclick='itemJump2(\""+v['CSI_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CSI_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_TYPE')+"' "+ms.tdEvent(formId, 'CSI_TYPE')+">")
            arrHtml.push("<span colno='CSI_TYPE' class='"+ms.uiClass(formId, 'CSI_TYPE')+"' style='"+ms.uiStyle(formId, 'CSI_TYPE')+"' "+ms.uiEvent(formId, 'CSI_TYPE')+" title='"+ms.titleAttr(formId,'CSI_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CSI_TYPE']+"</span>")
            arrHtml.push("<input type='hidden' id='CSI_TYPE"+v.ID+"' value='"+uiRaw[i].CSI_TYPE+"' /></td>");
            arrHtml.push("<td colno='CSI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CSI_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_STATUS')+"' "+ms.tdEvent(formId, 'CSI_STATUS')+">")
            arrHtml.push("<span colno='CSI_STATUS' class='"+ms.uiClass(formId, 'CSI_STATUS')+"' style='"+ms.uiStyle(formId, 'CSI_STATUS')+"' "+ms.uiEvent(formId, 'CSI_STATUS')+" title='"+ms.titleAttr(formId,'CSI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CSI_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='id"+v.ID+"' name='CSI_STATUS' value='"+uiRaw[i].CSI_STATUS+"' /></td>");
            arrHtml.push("<td colno='CSI_BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_BEGIN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CSI_BEGIN_TIME')+"' "+ms.tdEvent(formId, 'CSI_BEGIN_TIME')+">")
            arrHtml.push("<span colno='CSI_BEGIN_TIME' class='"+ms.uiClass(formId, 'CSI_BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'CSI_BEGIN_TIME')+"' "+ms.uiEvent(formId, 'CSI_BEGIN_TIME')+" title='"+ms.titleAttr(formId,'CSI_BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['CSI_BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_END_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CSI_END_TIME')+"' "+ms.tdEvent(formId, 'CSI_END_TIME')+">")
            arrHtml.push("<span colno='CSI_END_TIME' class='"+ms.uiClass(formId, 'CSI_END_TIME')+"' style='"+ms.uiStyle(formId, 'CSI_END_TIME')+"' "+ms.uiEvent(formId, 'CSI_END_TIME')+" title='"+ms.titleAttr(formId,'CSI_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['CSI_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_STOP_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'CSI_STOP_TIMES')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'CSI_STOP_TIMES')+"' "+ms.tdEvent(formId, 'CSI_STOP_TIMES')+">")
            arrHtml.push("<span colno='CSI_STOP_TIMES' class='"+ms.uiClass(formId, 'CSI_STOP_TIMES')+"' style='"+ms.uiStyle(formId, 'CSI_STOP_TIMES')+"' "+ms.uiEvent(formId, 'CSI_STOP_TIMES')+" title='"+ms.titleAttr(formId,'CSI_STOP_TIMES','IS_TITLE_ATTR',v)+"' >"+v['CSI_STOP_TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_RECORD_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CSI_RECORD_EMP')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_RECORD_EMP')+"' "+ms.tdEvent(formId, 'CSI_RECORD_EMP')+">")
            arrHtml.push("<span colno='CSI_RECORD_EMP' class='"+ms.uiClass(formId, 'CSI_RECORD_EMP')+"' style='"+ms.uiStyle(formId, 'CSI_RECORD_EMP')+"' "+ms.uiEvent(formId, 'CSI_RECORD_EMP')+" title='"+ms.titleAttr(formId,'CSI_RECORD_EMP','IS_TITLE_ATTR',v)+"' >"+v['CSI_RECORD_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_RECORD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_RECORD_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CSI_RECORD_TIME')+"' "+ms.tdEvent(formId, 'CSI_RECORD_TIME')+">")
            arrHtml.push("<span colno='CSI_RECORD_TIME' class='"+ms.uiClass(formId, 'CSI_RECORD_TIME')+"' style='"+ms.uiStyle(formId, 'CSI_RECORD_TIME')+"' "+ms.uiEvent(formId, 'CSI_RECORD_TIME')+" title='"+ms.titleAttr(formId,'CSI_RECORD_TIME','IS_TITLE_ATTR',v)+"' >"+v['CSI_RECORD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_MAINTENANCE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CSI_MAINTENANCE_EMP')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_MAINTENANCE_EMP')+"' "+ms.tdEvent(formId, 'CSI_MAINTENANCE_EMP')+">")
            arrHtml.push("<span colno='CSI_MAINTENANCE_EMP' class='"+ms.uiClass(formId, 'CSI_MAINTENANCE_EMP')+"' style='"+ms.uiStyle(formId, 'CSI_MAINTENANCE_EMP')+"' "+ms.uiEvent(formId, 'CSI_MAINTENANCE_EMP')+" title='"+ms.titleAttr(formId,'CSI_MAINTENANCE_EMP','IS_TITLE_ATTR',v)+"' >"+v['CSI_MAINTENANCE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_MAINTENANCE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_MAINTENANCE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CSI_MAINTENANCE_TIME')+"' "+ms.tdEvent(formId, 'CSI_MAINTENANCE_TIME')+">")
            arrHtml.push("<span colno='CSI_MAINTENANCE_TIME' class='"+ms.uiClass(formId, 'CSI_MAINTENANCE_TIME')+"' style='"+ms.uiStyle(formId, 'CSI_MAINTENANCE_TIME')+"' "+ms.uiEvent(formId, 'CSI_MAINTENANCE_TIME')+" title='"+ms.titleAttr(formId,'CSI_MAINTENANCE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CSI_MAINTENANCE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_MAINTENANCE' class='datagrid-cell "+ms.tdClass(formId, 'CSI_MAINTENANCE')+"' style='width:140px;"+ms.tdStyle(formId, 'CSI_MAINTENANCE')+"' "+ms.tdEvent(formId, 'CSI_MAINTENANCE')+">")
            arrHtml.push("<span colno='CSI_MAINTENANCE' class='"+ms.uiClass(formId, 'CSI_MAINTENANCE')+"' style='"+ms.uiStyle(formId, 'CSI_MAINTENANCE')+"' "+ms.uiEvent(formId, 'CSI_MAINTENANCE')+" title='"+ms.titleAttr(formId,'CSI_MAINTENANCE','IS_TITLE_ATTR',v)+"' >"+v['CSI_MAINTENANCE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CSI_EXAMINE_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'CSI_EXAMINE_RESULT')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_EXAMINE_RESULT')+"' "+ms.tdEvent(formId, 'CSI_EXAMINE_RESULT')+">")
            arrHtml.push("<span colno='CSI_EXAMINE_RESULT' class='"+ms.uiClass(formId, 'CSI_EXAMINE_RESULT')+"' style='"+ms.uiStyle(formId, 'CSI_EXAMINE_RESULT')+"' "+ms.uiEvent(formId, 'CSI_EXAMINE_RESULT')+" title='"+ms.titleAttr(formId,'CSI_EXAMINE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CSI_EXAMINE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_EXAMINE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CSI_EXAMINE_EMP')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CSI_EXAMINE_EMP')+"' "+ms.tdEvent(formId, 'CSI_EXAMINE_EMP')+">")
            arrHtml.push("<span colno='CSI_EXAMINE_EMP' class='"+ms.uiClass(formId, 'CSI_EXAMINE_EMP')+"' style='"+ms.uiStyle(formId, 'CSI_EXAMINE_EMP')+"' "+ms.uiEvent(formId, 'CSI_EXAMINE_EMP')+" title='"+ms.titleAttr(formId,'CSI_EXAMINE_EMP','IS_TITLE_ATTR',v)+"' >"+v['CSI_EXAMINE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_EXAMINE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CSI_EXAMINE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CSI_EXAMINE_TIME')+"' "+ms.tdEvent(formId, 'CSI_EXAMINE_TIME')+">")
            arrHtml.push("<span colno='CSI_EXAMINE_TIME' class='"+ms.uiClass(formId, 'CSI_EXAMINE_TIME')+"' style='"+ms.uiStyle(formId, 'CSI_EXAMINE_TIME')+"' "+ms.uiEvent(formId, 'CSI_EXAMINE_TIME')+" title='"+ms.titleAttr(formId,'CSI_EXAMINE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CSI_EXAMINE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CSI_EXAMINE_REASON' class='datagrid-cell "+ms.tdClass(formId, 'CSI_EXAMINE_REASON')+"' style='width:140px;"+ms.tdStyle(formId, 'CSI_EXAMINE_REASON')+"' "+ms.tdEvent(formId, 'CSI_EXAMINE_REASON')+">")
            arrHtml.push("<span colno='CSI_EXAMINE_REASON' class='"+ms.uiClass(formId, 'CSI_EXAMINE_REASON')+"' style='"+ms.uiStyle(formId, 'CSI_EXAMINE_REASON')+"' "+ms.uiEvent(formId, 'CSI_EXAMINE_REASON')+" title='"+ms.titleAttr(formId,'CSI_EXAMINE_REASON','IS_TITLE_ATTR',v)+"' >"+v['CSI_EXAMINE_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
    //setPopScroll('.scroll2','.head2');
    $(".head2").scrollLeft(0);
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//工单信息
function itemJump1(obj){
      winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
