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
		<dict:lang value="仓库报废物料列表" />
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
		<bu:header formId ="a0614fd913404e73a7141ce9ff13e439"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <style>
    	.tempClass{
    		
    	}
    </style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="aa4218ea5d87487e93e7d23a4ff9afb5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="aa4218ea5d87487e93e7d23a4ff9afb5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea0614fd913404e73a7141ce9ff13e439" id="formPagea0614fd913404e73a7141ce9ff13e439" value="${formPagea0614fd913404e73a7141ce9ff13e439}"/>
		<input type="hidden" name="formId" id="formId1" value='a0614fd913404e73a7141ce9ff13e439'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='fa0425422fe446a194d41fa62e623f32'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='1aad990f8a774aeaa80d6b02a13a12ef'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a0614fd913404e73a7141ce9ff13e439">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa0614fd913404e73a7141ce9ff13e439" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera0614fd913404e73a7141ce9ff13e439">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea0614fd913404e73a7141ce9ff13e439" style="min-width: 1570px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a0614fd913404e73a7141ce9ff13e439" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a0614fd913404e73a7141ce9ff13e439" onclick="_selectAjaxTableAllData(this,'a0614fd913404e73a7141ce9ff13e439')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width: 100px;"><bu:uitn colNo="DATA_AUTH" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WSD_DOC_NUM" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="T2#WSD_ITEM_SN" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="T2#WSD_ITEM_CODE" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 80px;"><bu:uitn colNo="T2#WSD_SCARP_NUM" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="T3#CI_ITEM_NAME" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="T3#CI_ITEM_SPEC" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 100px;"><bu:uitn colNo="WAD_WH_CODE" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 100px;"><bu:uitn colNo="WAD_SCARP_TYPE" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 80px;"><bu:uitn colNo="WAD_CREATE_MAN" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell" style="width: 150px;"><bu:uitn colNo="WAD_CREATE_TIME" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
			<td class="datagrid-cell"style="width: 150px;"><bu:uitn colNo="WAD_SCARP_REASON" formId="a0614fd913404e73a7141ce9ff13e439" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva0614fd913404e73a7141ce9ff13e439" onscroll="ajaxTableScroll(this,'a0614fd913404e73a7141ce9ff13e439')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa0614fd913404e73a7141ce9ff13e439" style="min-width: 1570px;">
		<tbody id="tbody_a0614fd913404e73a7141ce9ff13e439" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea0614fd913404e73a7141ce9ff13e439==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=a0614fd913404e73a7141ce9ff13e439&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='WSD_DOC_NUM'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="aa4218ea5d87487e93e7d23a4ff9afb5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="aa4218ea5d87487e93e7d23a4ff9afb5" />
    
    <!--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
<script type="text/javascript">
				function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ10');
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
            
                
                /*function alertInfo(msg){
                    utilsFp.alert(msg);
                }*/
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                //function reloadPg(msg,title,width,height,time){
                    //msgPop(msg,"",title,width,height,time);
                //}
                
                
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
                        	console.log("dataChild:"+data);
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
<script type="text/javascript">
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
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='a0614fd913404e73a7141ce9ff13e439'){<%--仓库物料报废信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"'  abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSD_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSD_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSD_DOC_NUM')+">")
            arrHtml.push("<span colno='WSD_DOC_NUM' class='"+ms.uiClass(formId, 'WSD_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSD_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSD_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSD_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSD_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WSD_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'T2#WSD_ITEM_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#WSD_ITEM_SN')+"' "+ms.tdEvent(formId, 'T2#WSD_ITEM_SN')+">")
            arrHtml.push("<span colno='T2#WSD_ITEM_SN' class='"+ms.uiClass(formId, 'T2#WSD_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'T2#WSD_ITEM_SN')+"' "+ms.uiEvent(formId, 'T2#WSD_ITEM_SN')+" title='"+ms.titleAttr(formId,'T2#WSD_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['T2#WSD_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WSD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WSD_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#WSD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'T2#WSD_ITEM_CODE')+">")
            arrHtml.push("<span colno='T2#WSD_ITEM_CODE' class='"+ms.uiClass(formId, 'T2#WSD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'T2#WSD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'T2#WSD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'T2#WSD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#WSD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WSD_SCARP_NUM' class='datagrid-cell "+ms.tdClass(formId, 'T2#WSD_SCARP_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'T2#WSD_SCARP_NUM')+"' "+ms.tdEvent(formId, 'T2#WSD_SCARP_NUM')+">")
            arrHtml.push("<span colno='T2#WSD_SCARP_NUM' class='"+ms.uiClass(formId, 'T2#WSD_SCARP_NUM')+"' style='"+ms.uiStyle(formId, 'T2#WSD_SCARP_NUM')+"' "+ms.uiEvent(formId, 'T2#WSD_SCARP_NUM')+" title='"+ms.titleAttr(formId,'T2#WSD_SCARP_NUM','IS_TITLE_ATTR',v)+"' >"+v['T2#WSD_SCARP_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T3#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T3#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WAD_WH_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WAD_WH_CODE')+"' "+ms.tdEvent(formId, 'WAD_WH_CODE')+">")
            arrHtml.push("<span colno='WAD_WH_CODE' class='"+ms.uiClass(formId, 'WAD_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WAD_WH_CODE')+"' "+ms.uiEvent(formId, 'WAD_WH_CODE')+" title='"+ms.titleAttr(formId,'WAD_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WAD_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_SCARP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WAD_SCARP_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WAD_SCARP_TYPE')+"' "+ms.tdEvent(formId, 'WAD_SCARP_TYPE')+">")
            arrHtml.push("<span colno='WAD_SCARP_TYPE' class='"+ms.uiClass(formId, 'WAD_SCARP_TYPE')+"' style='"+ms.uiStyle(formId, 'WAD_SCARP_TYPE')+"' "+ms.uiEvent(formId, 'WAD_SCARP_TYPE')+" title='"+ms.titleAttr(formId,'WAD_SCARP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WAD_SCARP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WAD_CREATE_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WAD_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WAD_CREATE_MAN')+">")
            arrHtml.push("<span colno='WAD_CREATE_MAN' class='"+ms.uiClass(formId, 'WAD_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WAD_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WAD_CREATE_MAN')+" title='"+ms.titleAttr(formId,'WAD_CREATE_MAN','IS_TITLE_ATTR',v)+"' >"+v['WAD_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WAD_CREATE_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WAD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WAD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WAD_CREATE_TIME' class='"+ms.uiClass(formId, 'WAD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WAD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WAD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WAD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WAD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_SCARP_REASON' class='datagrid-cell "+ms.tdClass(formId, 'WAD_SCARP_REASON')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WAD_SCARP_REASON')+"' "+ms.tdEvent(formId, 'WAD_SCARP_REASON')+">")
            arrHtml.push("<span colno='WAD_SCARP_REASON' class='"+ms.uiClass(formId, 'WAD_SCARP_REASON')+"' style='"+ms.uiStyle(formId, 'WAD_SCARP_REASON')+"' "+ms.uiEvent(formId, 'WAD_SCARP_REASON')+" title='"+ms.titleAttr(formId,'WAD_SCARP_REASON','IS_TITLE_ATTR',v)+"' >"+v['WAD_SCARP_REASON']+"</span>")
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
function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
}

$(function(){
	initHeight();
	$("#WSD_ITEM_CODE").addClass("tempClass");
	$("#WSD_ITEM_SN").addClass("tempClass");
})

$(window).resize(function(){
	initHeight();
})
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)
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
