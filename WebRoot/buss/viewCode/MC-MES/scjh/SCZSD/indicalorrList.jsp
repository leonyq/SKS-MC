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
		<dict:lang value="生产指示单列表" />
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
		<bu:header formId ="0bb32b8e54d2487c9e4c61a1c91f2b8a"/>

    
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
		<bu:func viewId="a0bc17dce11b401296e9c3a1eb9e3d17" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a0bc17dce11b401296e9c3a1eb9e3d17" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0bb32b8e54d2487c9e4c61a1c91f2b8a" id="formPage0bb32b8e54d2487c9e4c61a1c91f2b8a" value="${formPage0bb32b8e54d2487c9e4c61a1c91f2b8a}"/>
		<input type="hidden" name="formId" id="formId1" value='0bb32b8e54d2487c9e4c61a1c91f2b8a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0bb32b8e54d2487c9e4c61a1c91f2b8a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0bb32b8e54d2487c9e4c61a1c91f2b8a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0bb32b8e54d2487c9e4c61a1c91f2b8a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0bb32b8e54d2487c9e4c61a1c91f2b8a" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0bb32b8e54d2487c9e4c61a1c91f2b8a" onclick="_selectAjaxTableAllData(this,'0bb32b8e54d2487c9e4c61a1c91f2b8a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_INDICATORR_SN" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CO_STATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CO_TEMPLATE_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CO_MEMO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="T2#PM_SCHEDULE_DATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0bb32b8e54d2487c9e4c61a1c91f2b8a" onscroll="ajaxTableScroll(this,'0bb32b8e54d2487c9e4c61a1c91f2b8a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0bb32b8e54d2487c9e4c61a1c91f2b8a" style="">
		<tbody id="tbody_0bb32b8e54d2487c9e4c61a1c91f2b8a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0bb32b8e54d2487c9e4c61a1c91f2b8a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0bb32b8e54d2487c9e4c61a1c91f2b8a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="a0bc17dce11b401296e9c3a1eb9e3d17" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a0bc17dce11b401296e9c3a1eb9e3d17" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
<script type="text/javascript">
				function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ10');
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CO_STATE\"}";
                    //var url = "/mes/buss/bussModel_listMsData.ms";
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
                    utilsFp.confirmIcon(1,"","","", msg,"","260","145");
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=db26ac43455245b8a8c60f8d3cc69ac9";
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
                    $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ10');
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
  	console.log(isCloseWin);
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
    if(formId=='0bb32b8e54d2487c9e4c61a1c91f2b8a'){<%--指示单信息--%>
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
            arrHtml.push("<td colno='CO_INDICATORR_SN' class='datagrid-cell "+ms.tdClass(formId, 'CO_INDICATORR_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.tdEvent(formId, 'CO_INDICATORR_SN')+">")
            arrHtml.push("<span colno='CO_INDICATORR_SN' class='"+ms.uiClass(formId, 'CO_INDICATORR_SN')+"' style='"+ms.uiStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.uiEvent(formId, 'CO_INDICATORR_SN')+" title='"+ms.titleAttr(formId,'CO_INDICATORR_SN','IS_TITLE_ATTR',v)+"' >"+v['CO_INDICATORR_SN']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_MO_NUMBER')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CO_MO_NUMBER')+">")
            //arrHtml.push("<span colno='CO_MO_NUMBER' class='"+ms.uiClass(formId, 'CO_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_MO_NUMBER')+"' "+ms.uiEvent(formId, 'CO_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CO_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_MO_NUMBER']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='T2#PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#PM_MODEL_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'T2#PM_MODEL_CODE')+">")
            //arrHtml.push("<span colno='T2#PM_MODEL_CODE' class='"+ms.uiClass(formId, 'T2#PM_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'T2#PM_MODEL_CODE')+"' "+ms.uiEvent(formId, 'T2#PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'T2#PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#PM_MODEL_CODE']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_STATE' class='datagrid-cell "+ms.tdClass(formId, 'CO_STATE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CO_STATE')+"' "+ms.tdEvent(formId, 'CO_STATE')+">")
            arrHtml.push("<span colno='CO_STATE' class='"+ms.uiClass(formId, 'CO_STATE')+"' style='"+ms.uiStyle(formId, 'CO_STATE')+"' "+ms.uiEvent(formId, 'CO_STATE')+" title='"+ms.titleAttr(formId,'CO_STATE','IS_TITLE_ATTR',v)+"' >"+v['CO_STATE']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CO_STATE+"'></td>");
            arrHtml.push("<td colno='CO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_MODEL_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CO_MODEL_CODE')+">")
            arrHtml.push("<span colno='CO_MODEL_CODE' class='"+ms.uiClass(formId, 'CO_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CO_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CO_ITEM_NAME')+">")
            arrHtml.push("<span colno='CO_ITEM_NAME' class='"+ms.uiClass(formId, 'CO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CO_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CO_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CO_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CO_ITEM_SPEC' class='"+ms.uiClass(formId, 'CO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CO_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CO_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_TEMPLATE_NAME')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.tdEvent(formId, 'CO_TEMPLATE_NAME')+">")
            arrHtml.push("<span colno='CO_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CO_TEMPLATE_NAME')+"' onclick='itemJump1(\""+v['CO_TEMPLATE_NAME']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CO_TEMPLATE_NAME')+" title='"+ms.titleAttr(formId,'CO_TEMPLATE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_TEMPLATE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ARCHIVAL_FILE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.tdEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+">")
            arrHtml.push("<span colno='CO_ARCHIVAL_FILE_NUMBER' class='"+ms.uiClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.uiEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+" title='"+ms.titleAttr(formId,'CO_ARCHIVAL_FILE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_ARCHIVAL_FILE_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CO_MEMO')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'CO_MEMO')+"' "+ms.tdEvent(formId, 'CO_MEMO')+">")
            arrHtml.push("<span colno='CO_MEMO' class='"+ms.uiClass(formId, 'CO_MEMO')+"' style='"+ms.uiStyle(formId, 'CO_MEMO')+"' "+ms.uiEvent(formId, 'CO_MEMO')+" title='"+ms.titleAttr(formId,'CO_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CO_MEMO']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='T3#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_NAME')+">")
            //arrHtml.push("<span colno='T3#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T3#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_NAME']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='T3#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_SPEC')+">")
            //arrHtml.push("<span colno='T3#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T3#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_SPEC']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='T2#PM_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'T2#PM_PRODUCT_STEP')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'T2#PM_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'T2#PM_PRODUCT_STEP')+">")
            //arrHtml.push("<span colno='T2#PM_PRODUCT_STEP' class='"+ms.uiClass(formId, 'T2#PM_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'T2#PM_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'T2#PM_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'T2#PM_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['T2#PM_PRODUCT_STEP']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='T2#PM_TARGET_QTY' class='datagrid-cell "+ms.tdClass(formId, 'T2#PM_TARGET_QTY')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'T2#PM_TARGET_QTY')+"' "+ms.tdEvent(formId, 'T2#PM_TARGET_QTY')+">")
            //arrHtml.push("<span colno='T2#PM_TARGET_QTY' class='"+ms.uiClass(formId, 'T2#PM_TARGET_QTY')+"' style='"+ms.uiStyle(formId, 'T2#PM_TARGET_QTY')+"' "+ms.uiEvent(formId, 'T2#PM_TARGET_QTY')+" title='"+ms.titleAttr(formId,'T2#PM_TARGET_QTY','IS_TITLE_ATTR',v)+"' >"+v['T2#PM_TARGET_QTY']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_SECTION_NO' class='datagrid-cell "+ms.tdClass(formId, 'CO_SECTION_NO')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'CO_SECTION_NO')+"' "+ms.tdEvent(formId, 'CO_SECTION_NO')+">")
            //arrHtml.push("<span colno='CO_SECTION_NO' class='"+ms.uiClass(formId, 'CO_SECTION_NO')+"' style='"+ms.uiStyle(formId, 'CO_SECTION_NO')+"' "+ms.uiEvent(formId, 'CO_SECTION_NO')+" title='"+ms.titleAttr(formId,'CO_SECTION_NO','IS_TITLE_ATTR',v)+"' >"+v['CO_SECTION_NO']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_ARCHIVAL_FILE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.tdEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+">")
            //arrHtml.push("<span colno='CO_ARCHIVAL_FILE_NUMBER' class='"+ms.uiClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.uiEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+" title='"+ms.titleAttr(formId,'CO_ARCHIVAL_FILE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_ARCHIVAL_FILE_NUMBER']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PM_SCHEDULE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'T2#PM_SCHEDULE_DATE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'T2#PM_SCHEDULE_DATE')+"' "+ms.tdEvent(formId, 'T2#PM_SCHEDULE_DATE')+">")
            arrHtml.push("<span colno='T2#PM_SCHEDULE_DATE' class='"+ms.uiClass(formId, 'T2#PM_SCHEDULE_DATE')+"' style='"+ms.uiStyle(formId, 'T2#PM_SCHEDULE_DATE')+"' "+ms.uiEvent(formId, 'T2#PM_SCHEDULE_DATE')+" title='"+ms.titleAttr(formId,'T2#PM_SCHEDULE_DATE','IS_TITLE_ATTR',v)+"' >"+v['T2#PM_SCHEDULE_DATE']+"</span>")
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

//模板项目配置
function itemJump1(obj){
      winOptMethod.jump("7d42142c72c148d6966ea4bc5f8fa27a","F10910","jumpId",obj);
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
