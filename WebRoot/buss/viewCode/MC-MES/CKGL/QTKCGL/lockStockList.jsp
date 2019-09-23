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
		<dict:lang value="齐套库存信息列表" />
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
		<bu:header formId ="29d173bbeb2e407e98fbdeee2354c721"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <script type="text/javascript">
        function unlockItem(){
           $.ajax({
               type: "POST",
               dataType: "json",
               url:unLockUrl, 
               data: "docStr="+docStr+"&itemCodeStr="+itemCodeStr,
               success: function(data){
                        util.closeLoading();msgPop("解锁成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
               console.log(msg);
               utilsFp.confirmIcon(3,"","","", "error:解锁失败",0,"","");
               }
           });
        }
    </script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="de0518eccd1946a99c69f1d852269f7e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="de0518eccd1946a99c69f1d852269f7e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage29d173bbeb2e407e98fbdeee2354c721" id="formPage29d173bbeb2e407e98fbdeee2354c721" value="${formPage29d173bbeb2e407e98fbdeee2354c721}"/>
		<input type="hidden" name="formId" id="formId1" value='29d173bbeb2e407e98fbdeee2354c721'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="29d173bbeb2e407e98fbdeee2354c721">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax29d173bbeb2e407e98fbdeee2354c721" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner29d173bbeb2e407e98fbdeee2354c721">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable29d173bbeb2e407e98fbdeee2354c721">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row " id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="29d173bbeb2e407e98fbdeee2354c721" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_29d173bbeb2e407e98fbdeee2354c721" onclick="_selectAjaxTableAllData(this,'29d173bbeb2e407e98fbdeee2354c721')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="DATA_AUTH" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WLD_LOCK_DOC" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T2#WLD_ITEM_CODE" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WLD_LOCK_STATUS" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T3#CI_ITEM_NAME" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T3#CI_ITEM_SPEC" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WLD_PROJECT_ID" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="T2#WLD_LOCK_NUM" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="T2#WLD_PICK_NUM" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WLD_CREATE_MAN" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WLD_CREATE_TIME" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WLD_LOCK_MAN" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WLD_LOCK_TIME" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WLD_UNLOCK_MAN" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WLD_UNLOCK_TIME" formId="29d173bbeb2e407e98fbdeee2354c721" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv29d173bbeb2e407e98fbdeee2354c721" onscroll="ajaxTableScroll(this,'29d173bbeb2e407e98fbdeee2354c721')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax29d173bbeb2e407e98fbdeee2354c721" >
		<tbody id="tbody_29d173bbeb2e407e98fbdeee2354c721" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage29d173bbeb2e407e98fbdeee2354c721==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=29d173bbeb2e407e98fbdeee2354c721&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="de0518eccd1946a99c69f1d852269f7e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="de0518eccd1946a99c69f1d852269f7e" />
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WLD_LOCK_STATUS,WLD_DOC_NUM,WLD_LOCK_STATUS\"}";
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
    
    if(formId=='29d173bbeb2e407e98fbdeee2354c721'){<%--齐套库存锁定信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_DOC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WLD_LOCK_DOC')+"' "+ms.tdEvent(formId, 'WLD_LOCK_DOC')+">")
            arrHtml.push("<span colno='WLD_LOCK_DOC' class='"+ms.uiClass(formId, 'WLD_LOCK_DOC')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_DOC')+"' "+ms.uiEvent(formId, 'WLD_LOCK_DOC')+" title='"+ms.titleAttr(formId,'WLD_LOCK_DOC','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_DOC']+"</span>")
            arrHtml.push("<input type='hidden' id='doc_"+v.ID+"' value='"+v['WLD_LOCK_DOC']+"'></td>");
            arrHtml.push("<td colno='T2#WLD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#WLD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'T2#WLD_ITEM_CODE')+">")
            arrHtml.push("<span colno='T2#WLD_ITEM_CODE' class='"+ms.uiClass(formId, 'T2#WLD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'T2#WLD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'T2#WLD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'T2#WLD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_ITEM_CODE']+"</span>")
            arrHtml.push("<input type='hidden' id='itemCode_"+v.ID+"' value='"+v['T2#WLD_ITEM_CODE']+"'></td>");
            arrHtml.push("<td colno='WLD_LOCK_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_STATUS')+"' style='display:none;width:80px;text-align:center;"+ms.tdStyle(formId, 'WLD_LOCK_STATUS')+"' "+ms.tdEvent(formId, 'WLD_LOCK_STATUS')+">")
            arrHtml.push("<span colno='WLD_LOCK_STATUS' class='"+ms.uiClass(formId, 'WLD_LOCK_STATUS')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_STATUS')+"' "+ms.uiEvent(formId, 'WLD_LOCK_STATUS')+" title='"+ms.titleAttr(formId,'WLD_LOCK_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].WLD_LOCK_STATUS+"'></td>");
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WLD_LOCK_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_LOCK_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T2#WLD_LOCK_STATUS')+"' "+ms.tdEvent(formId, 'T2#WLD_LOCK_STATUS')+">")
            arrHtml.push("<span colno='T2#WLD_LOCK_STATUS' class='"+ms.uiClass(formId, 'T2#WLD_LOCK_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#WLD_LOCK_STATUS')+"' "+ms.uiEvent(formId, 'T2#WLD_LOCK_STATUS')+" title='"+ms.titleAttr(formId,'T2#WLD_LOCK_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_LOCK_STATUS']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T3#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T3#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WLD_PROJECT_ID')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WLD_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WLD_PROJECT_ID')+">")
            arrHtml.push("<span colno='WLD_PROJECT_ID' class='"+ms.uiClass(formId, 'WLD_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'WLD_PROJECT_ID')+"' "+ms.uiEvent(formId, 'WLD_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WLD_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WLD_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WLD_LOCK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_LOCK_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'T2#WLD_LOCK_NUM')+"' "+ms.tdEvent(formId, 'T2#WLD_LOCK_NUM')+">")
            arrHtml.push("<span colno='T2#WLD_LOCK_NUM' class='"+ms.uiClass(formId, 'T2#WLD_LOCK_NUM')+"' style='"+ms.uiStyle(formId, 'T2#WLD_LOCK_NUM')+"' "+ms.uiEvent(formId, 'T2#WLD_LOCK_NUM')+" title='"+ms.titleAttr(formId,'T2#WLD_LOCK_NUM','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_LOCK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WLD_PICK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'T2#WLD_PICK_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'T2#WLD_PICK_NUM')+"' "+ms.tdEvent(formId, 'T2#WLD_PICK_NUM')+">")
            arrHtml.push("<span colno='T2#WLD_PICK_NUM' class='"+ms.uiClass(formId, 'T2#WLD_PICK_NUM')+"' style='"+ms.uiStyle(formId, 'T2#WLD_PICK_NUM')+"' "+ms.uiEvent(formId, 'T2#WLD_PICK_NUM')+" title='"+ms.titleAttr(formId,'T2#WLD_PICK_NUM','IS_TITLE_ATTR',v)+"' >"+v['T2#WLD_PICK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_CREATE_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WLD_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WLD_CREATE_MAN')+">")
            arrHtml.push("<span colno='WLD_CREATE_MAN' class='"+ms.uiClass(formId, 'WLD_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WLD_CREATE_MAN')+" title='"+ms.titleAttr(formId,'WLD_CREATE_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_CREATE_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WLD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WLD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WLD_CREATE_TIME' class='"+ms.uiClass(formId, 'WLD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WLD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WLD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WLD_LOCK_MAN')+"' "+ms.tdEvent(formId, 'WLD_LOCK_MAN')+">")
            arrHtml.push("<span colno='WLD_LOCK_MAN' class='"+ms.uiClass(formId, 'WLD_LOCK_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_MAN')+"' "+ms.uiEvent(formId, 'WLD_LOCK_MAN')+" title='"+ms.titleAttr(formId,'WLD_LOCK_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_LOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_LOCK_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WLD_LOCK_TIME')+"' "+ms.tdEvent(formId, 'WLD_LOCK_TIME')+">")
            arrHtml.push("<span colno='WLD_LOCK_TIME' class='"+ms.uiClass(formId, 'WLD_LOCK_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_LOCK_TIME')+"' "+ms.uiEvent(formId, 'WLD_LOCK_TIME')+" title='"+ms.titleAttr(formId,'WLD_LOCK_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_LOCK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_UNLOCK_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WLD_UNLOCK_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WLD_UNLOCK_MAN')+"' "+ms.tdEvent(formId, 'WLD_UNLOCK_MAN')+">")
            arrHtml.push("<span colno='WLD_UNLOCK_MAN' class='"+ms.uiClass(formId, 'WLD_UNLOCK_MAN')+"' style='"+ms.uiStyle(formId, 'WLD_UNLOCK_MAN')+"' "+ms.uiEvent(formId, 'WLD_UNLOCK_MAN')+" title='"+ms.titleAttr(formId,'WLD_UNLOCK_MAN','IS_TITLE_ATTR',v)+"' >"+v['WLD_UNLOCK_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WLD_UNLOCK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WLD_UNLOCK_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WLD_UNLOCK_TIME')+"' "+ms.tdEvent(formId, 'WLD_UNLOCK_TIME')+">")
            arrHtml.push("<span colno='WLD_UNLOCK_TIME' class='"+ms.uiClass(formId, 'WLD_UNLOCK_TIME')+"' style='"+ms.uiStyle(formId, 'WLD_UNLOCK_TIME')+"' "+ms.uiEvent(formId, 'WLD_UNLOCK_TIME')+" title='"+ms.titleAttr(formId,'WLD_UNLOCK_TIME','IS_TITLE_ATTR',v)+"' >"+v['WLD_UNLOCK_TIME']+"</span>")
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
