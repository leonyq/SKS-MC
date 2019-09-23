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
		<dict:lang value="品质检验单列表" />
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
		<bu:header formId ="339caba30f6c4d78957a3815da1d1fdf"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <script type="text/javascript">
        function examineItem(){
           $.ajax({
               type: "POST",
               dataType: "json",
               url:examineUrl, 
               data: "dataId="+dataId+"&res="+resStr+"&doc="+docStr+"&insnStr="+insnStr,
               success: function(data){
                        util.closeLoading();msgPop("审核成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
                   //console.log(msg);
                   utilsFp.confirmIcon(3,"","","", "error:审核失败",0,"","");
                   //utilsFp.confirmIcon(3,"","","",msg,0,"","");
                   console.log(msg);
               }
           });
        }
        function rejectItem(){
           $.ajax({
               type: "POST",
               dataType: "json",
               url:rejectUrl, 
               data: "dataId="+dataId+"&res="+resStr+"&doc="+docStr+"&insnStr="+insnStr+"&itemNumStr="+itemNumStr+"&itemCodeStr="+itemCodeStr,
               success: function(data){
                        util.closeLoading();msgPop("批退成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
               utilsFp.confirmIcon(3,"","","", "error:批退失败",0,"","");
               console.log(msg);
               //alert(request.ResponseText);
               }
           });
        }
        function revokeItem(){
           var jsondata={"dataId":dataId,"inspectSn":inspectSn};
           $.ajax({
               type: "POST",
               dataType: "json",
               url:revokeUrl,
               data: jsondata,//"dataId="+dataId+"&inspectSn="+inspectSn,
               success: function(data){
               //console.log(data.ajaxString);
                        util.closeLoading();msgPop("撤销成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
               //console.log(msg);
               utilsFp.confirmIcon(3,"","","", "error:撤销失败",0,"","");
               //alert(request.ResponseText);
               }
           });
        }
        function delItem(){
           $.ajax({
               type: "POST",
               dataType: "json",
               url:delUrl,
               data: "dataId="+dataId+"&inspectSn="+inspectSn,
               success: function(data){
                        util.closeLoading();msgPop("删除成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
               utilsFp.confirmIcon(3,"","","", "error:删除失败",0,"","");
               //alert(request.ResponseText);
               }
           });
        }
     
</script>
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="a3cf2236970a4e94af8d770cc998a738" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a3cf2236970a4e94af8d770cc998a738" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage339caba30f6c4d78957a3815da1d1fdf" id="formPage339caba30f6c4d78957a3815da1d1fdf" value="${formPage339caba30f6c4d78957a3815da1d1fdf}"/>
		<input type="hidden" name="formId" id="formId1" value='339caba30f6c4d78957a3815da1d1fdf'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="339caba30f6c4d78957a3815da1d1fdf">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax339caba30f6c4d78957a3815da1d1fdf" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner339caba30f6c4d78957a3815da1d1fdf">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable339caba30f6c4d78957a3815da1d1fdf" style="min-width:2670px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="339caba30f6c4d78957a3815da1d1fdf" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_339caba30f6c4d78957a3815da1d1fdf" onclick="_selectAjaxTableAllData(this,'339caba30f6c4d78957a3815da1d1fdf')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_TEST_STEP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_INSPECT_SN" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="QII_SAMPLE_TYPE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="QII_URGENT_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="QII_INSEPCT_GRADE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="QII_LIST_FLAG" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="QII_INSEPCT_RESULT" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_ITEM_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_ITEM_NAME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_ITEM_SPEC" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="QII_CUST_CODE" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_SEND_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_TARGET_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_ACTUAL_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_ERROR_NUM" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_CONNECT_DOC" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_SEND_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_SEND_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_INSEPCT_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_INSEPCT_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_REVIEW_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_REVIEW_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="QII_CANCEL_EMP" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="QII_CANCEL_TIME" formId="339caba30f6c4d78957a3815da1d1fdf" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv339caba30f6c4d78957a3815da1d1fdf" onscroll="ajaxTableScroll(this,'339caba30f6c4d78957a3815da1d1fdf')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax339caba30f6c4d78957a3815da1d1fdf" style="min-width:2670px;">
		<tbody id="tbody_339caba30f6c4d78957a3815da1d1fdf" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage339caba30f6c4d78957a3815da1d1fdf==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=339caba30f6c4d78957a3815da1d1fdf&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="a3cf2236970a4e94af8d770cc998a738" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a3cf2236970a4e94af8d770cc998a738" />
    
    <!--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
<script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CQI_DOC_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,QII_LIST_FLAG,QII_INSEPCT_RESULT,QII_INSPECT_SN,QII_ITEM_CODE,QII_SEND_NUM\"}";
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
    if(formId=='339caba30f6c4d78957a3815da1d1fdf'){<%--品质检验单信息--%>
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
            arrHtml.push("<td colno='QII_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QII_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_TEST_STEP')+"' "+ms.tdEvent(formId, 'QII_TEST_STEP')+">")
            arrHtml.push("<span colno='QII_TEST_STEP' class='"+ms.uiClass(formId, 'QII_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QII_TEST_STEP')+"' "+ms.uiEvent(formId, 'QII_TEST_STEP')+" title='"+ms.titleAttr(formId,'QII_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QII_TEST_STEP']+"</span>")
            arrHtml.push("<input type='hidden' id='QII_TEST_STEP_"+v.ID+"' value='"+v['QII_TEST_STEP']+"'></td>");
            arrHtml.push("<td colno='QII_INSPECT_SN' class='datagrid-cell "+ms.tdClass(formId, 'QII_INSPECT_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QII_INSPECT_SN')+"' "+ms.tdEvent(formId, 'QII_INSPECT_SN')+">")
            arrHtml.push("<span colno='QII_INSPECT_SN' class='"+ms.uiClass(formId, 'QII_INSPECT_SN')+"' onclick='itemJump1(\""+v['QII_INSPECT_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QII_INSPECT_SN')+" title='"+ms.titleAttr(formId,'QII_INSPECT_SN','IS_TITLE_ATTR',v)+"' >"+v['QII_INSPECT_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='QII_INSPECT_SN_"+v.ID+"' value='"+uiRaw[i].QII_INSPECT_SN+"'></td>");
            arrHtml.push("<input type='hidden' id='insn_"+v.ID+"' value='"+v['QII_INSPECT_SN']+"'></td>");
            arrHtml.push("<td colno='QII_SAMPLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QII_SAMPLE_TYPE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'QII_SAMPLE_TYPE')+"' "+ms.tdEvent(formId, 'QII_SAMPLE_TYPE')+">")
            arrHtml.push("<span colno='QII_SAMPLE_TYPE' class='"+ms.uiClass(formId, 'QII_SAMPLE_TYPE')+"' style='"+ms.uiStyle(formId, 'QII_SAMPLE_TYPE')+"' "+ms.uiEvent(formId, 'QII_SAMPLE_TYPE')+" title='"+ms.titleAttr(formId,'QII_SAMPLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QII_SAMPLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QII_URGENT_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QII_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'QII_URGENT_FLAG')+">")
            arrHtml.push("<span colno='QII_URGENT_FLAG' class='"+ms.uiClass(formId, 'QII_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'QII_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'QII_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'QII_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QII_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='QII_INSEPCT_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QII_INSEPCT_GRADE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QII_INSEPCT_GRADE')+"' "+ms.tdEvent(formId, 'QII_INSEPCT_GRADE')+">")
            arrHtml.push("<span colno='QII_INSEPCT_GRADE' class='"+ms.uiClass(formId, 'QII_INSEPCT_GRADE')+"' style='"+ms.uiStyle(formId, 'QII_INSEPCT_GRADE')+"' "+ms.uiEvent(formId, 'QII_INSEPCT_GRADE')+" title='"+ms.titleAttr(formId,'QII_INSEPCT_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QII_INSEPCT_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_LIST_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QII_LIST_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QII_LIST_FLAG')+"' "+ms.tdEvent(formId, 'QII_LIST_FLAG')+">")
            arrHtml.push("<span colno='QII_LIST_FLAG' class='"+ms.uiClass(formId, 'QII_LIST_FLAG')+"' style='"+ms.uiStyle(formId, 'QII_LIST_FLAG')+"' "+ms.uiEvent(formId, 'QII_LIST_FLAG')+" title='"+ms.titleAttr(formId,'QII_LIST_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QII_LIST_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].QII_LIST_FLAG+"'></td>");
            arrHtml.push("<td colno='QII_INSEPCT_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'QII_INSEPCT_RESULT')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QII_INSEPCT_RESULT')+"' "+ms.tdEvent(formId, 'QII_INSEPCT_RESULT')+">")
            arrHtml.push("<span colno='QII_INSEPCT_RESULT' class='"+ms.uiClass(formId, 'QII_INSEPCT_RESULT')+"' style='"+ms.uiStyle(formId, 'QII_INSEPCT_RESULT')+"' "+ms.uiEvent(formId, 'QII_INSEPCT_RESULT')+" title='"+ms.titleAttr(formId,'QII_INSEPCT_RESULT','IS_TITLE_ATTR',v)+"' >"+v['QII_INSEPCT_RESULT']+"</span>")
            arrHtml.push("<input type='hidden' id='result_"+v.ID+"' value='"+uiRaw[i].QII_INSEPCT_RESULT+"'></td>");
            arrHtml.push("<td colno='QII_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'QII_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QII_ITEM_CODE')+">")
            arrHtml.push("<span colno='QII_ITEM_CODE' class='"+ms.uiClass(formId, 'QII_ITEM_CODE')+"' onclick='itemJump2(\""+v['QII_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QII_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QII_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_CODE']+"</span>")
            arrHtml.push("<input type='hidden' id='itemCode_"+v.ID+"' value='"+v['QII_ITEM_CODE']+"'></td>");
            arrHtml.push("<td colno='QII_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QII_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QII_ITEM_NAME')+">")
            arrHtml.push("<span colno='QII_ITEM_NAME' class='"+ms.uiClass(formId, 'QII_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QII_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QII_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QII_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'QII_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QII_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QII_ITEM_SPEC' class='"+ms.uiClass(formId, 'QII_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QII_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QII_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'QII_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            if(v['T2#CUSTOMER']!=""&&v['T2#CUSTOMER']!=null){
            	arrHtml.push("<td colno='T2#CUSTOMER' class='datagrid-cell "+ms.tdClass(formId, 'T2#CUSTOMER')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#CUSTOMER')+"' "+ms.tdEvent(formId, 'T2#CUSTOMER')+">")
            	arrHtml.push("<span colno='T2#CUSTOMER' class='"+ms.uiClass(formId, 'T2#CUSTOMER')+"' style='"+ms.uiStyle(formId, 'T2#CUSTOMER')+"' "+ms.uiEvent(formId, 'T2#CUSTOMER')+" title='"+ms.titleAttr(formId,'T2#CUSTOMER','IS_TITLE_ATTR',v)+"' >"+v['T2#CUSTOMER']+"</span>")
            	arrHtml.push("</td>");
            }else if(v['T3#SUPPLIER_NAME']!=""&&v['T3#SUPPLIER_NAME']!=null){
            	arrHtml.push("<td colno='T3#SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#SUPPLIER_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'T3#SUPPLIER_NAME')+">")
            	arrHtml.push("<span colno='T3#SUPPLIER_NAME' class='"+ms.uiClass(formId, 'T3#SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'T3#SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'T3#SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#SUPPLIER_NAME']+"</span>")
            	arrHtml.push("</td>");
            }else{
                if(v['QII_CUST_CODE']=="" || v['QII_CUST_CODE']=="null" || v['QII_CUST_CODE']==null){
                    arrHtml.push("<td colno='QII_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QII_CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'QII_CUST_CODE')+"' "+ms.tdEvent(formId, 'QII_CUST_CODE')+">")
                	arrHtml.push("<span colno='QII_CUST_CODE' class='"+ms.uiClass(formId, 'QII_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'QII_CUST_CODE')+"' "+ms.uiEvent(formId, 'QII_CUST_CODE')+" title='"+ms.titleAttr(formId,'QII_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+""+"</span>")
                	arrHtml.push("</td>");
                }else{
                	arrHtml.push("<td colno='QII_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QII_CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'QII_CUST_CODE')+"' "+ms.tdEvent(formId, 'QII_CUST_CODE')+">")
                	arrHtml.push("<span colno='QII_CUST_CODE' class='"+ms.uiClass(formId, 'QII_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'QII_CUST_CODE')+"' "+ms.uiEvent(formId, 'QII_CUST_CODE')+" title='"+ms.titleAttr(formId,'QII_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['QII_CUST_CODE']+"</span>")
                	arrHtml.push("</td>");
            	}
            }
            arrHtml.push("<td colno='QII_SEND_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QII_SEND_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QII_SEND_NUM')+"' "+ms.tdEvent(formId, 'QII_SEND_NUM')+">")
            arrHtml.push("<span colno='QII_SEND_NUM' class='"+ms.uiClass(formId, 'QII_SEND_NUM')+"' style='"+ms.uiStyle(formId, 'QII_SEND_NUM')+"' "+ms.uiEvent(formId, 'QII_SEND_NUM')+" title='"+ms.titleAttr(formId,'QII_SEND_NUM','IS_TITLE_ATTR',v)+"' >"+v['QII_SEND_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='itemNum_"+v.ID+"' value='"+v['QII_SEND_NUM']+"'></td>");
            arrHtml.push("<td colno='QII_TARGET_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QII_TARGET_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QII_TARGET_NUM')+"' "+ms.tdEvent(formId, 'QII_TARGET_NUM')+">")
            arrHtml.push("<span colno='QII_TARGET_NUM' class='"+ms.uiClass(formId, 'QII_TARGET_NUM')+"' style='"+ms.uiStyle(formId, 'QII_TARGET_NUM')+"' "+ms.uiEvent(formId, 'QII_TARGET_NUM')+" title='"+ms.titleAttr(formId,'QII_TARGET_NUM','IS_TITLE_ATTR',v)+"' >"+v['QII_TARGET_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_ACTUAL_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QII_ACTUAL_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QII_ACTUAL_NUM')+"' "+ms.tdEvent(formId, 'QII_ACTUAL_NUM')+">")
            arrHtml.push("<span colno='QII_ACTUAL_NUM' class='"+ms.uiClass(formId, 'QII_ACTUAL_NUM')+"' style='"+ms.uiStyle(formId, 'QII_ACTUAL_NUM')+"' "+ms.uiEvent(formId, 'QII_ACTUAL_NUM')+" title='"+ms.titleAttr(formId,'QII_ACTUAL_NUM','IS_TITLE_ATTR',v)+"' >"+v['QII_ACTUAL_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QII_ERROR_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QII_ERROR_NUM')+"' "+ms.tdEvent(formId, 'QII_ERROR_NUM')+">")
            arrHtml.push("<span colno='QII_ERROR_NUM' class='"+ms.uiClass(formId, 'QII_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'QII_ERROR_NUM')+"' "+ms.uiEvent(formId, 'QII_ERROR_NUM')+" title='"+ms.titleAttr(formId,'QII_ERROR_NUM','IS_TITLE_ATTR',v)+"' >"+v['QII_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'QII_CONNECT_DOC')+"' style='width:150px;"+ms.tdStyle(formId, 'QII_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'QII_CONNECT_DOC')+">")
            arrHtml.push("<span colno='QII_CONNECT_DOC' class='"+ms.uiClass(formId, 'QII_CONNECT_DOC')+"' onclick='itemJump3(\""+v['QII_CONNECT_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QII_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'QII_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['QII_CONNECT_DOC']+"</span>")
            arrHtml.push("<input type='hidden' id='doc_"+v.ID+"' value='"+v['QII_CONNECT_DOC']+"'></td>");
            //arrHtml.push("</td>");
            
            arrHtml.push("<td colno='QII_SEND_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QII_SEND_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_SEND_EMP')+"' "+ms.tdEvent(formId, 'QII_SEND_EMP')+">")
            arrHtml.push("<span colno='QII_SEND_EMP' class='"+ms.uiClass(formId, 'QII_SEND_EMP')+"' style='"+ms.uiStyle(formId, 'QII_SEND_EMP')+"' "+ms.uiEvent(formId, 'QII_SEND_EMP')+" title='"+ms.titleAttr(formId,'QII_SEND_EMP','IS_TITLE_ATTR',v)+"' >"+v['QII_SEND_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_SEND_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QII_SEND_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QII_SEND_TIME')+"' "+ms.tdEvent(formId, 'QII_SEND_TIME')+">")
            arrHtml.push("<span colno='QII_SEND_TIME' class='"+ms.uiClass(formId, 'QII_SEND_TIME')+"' style='"+ms.uiStyle(formId, 'QII_SEND_TIME')+"' "+ms.uiEvent(formId, 'QII_SEND_TIME')+" title='"+ms.titleAttr(formId,'QII_SEND_TIME','IS_TITLE_ATTR',v)+"' >"+v['QII_SEND_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_INSEPCT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QII_INSEPCT_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_INSEPCT_EMP')+"' "+ms.tdEvent(formId, 'QII_INSEPCT_EMP')+">")
            arrHtml.push("<span colno='QII_INSEPCT_EMP' class='"+ms.uiClass(formId, 'QII_INSEPCT_EMP')+"' style='"+ms.uiStyle(formId, 'QII_INSEPCT_EMP')+"' "+ms.uiEvent(formId, 'QII_INSEPCT_EMP')+" title='"+ms.titleAttr(formId,'QII_SEND_TIME','IS_TITLE_ATTR',v)+"' >"+v['QII_INSEPCT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_INSEPCT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QII_INSEPCT_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QII_INSEPCT_TIME')+"' "+ms.tdEvent(formId, 'QII_INSEPCT_TIME')+">")
            arrHtml.push("<span colno='QII_INSEPCT_TIME' class='"+ms.uiClass(formId, 'QII_INSEPCT_TIME')+"' style='"+ms.uiStyle(formId, 'QII_INSEPCT_TIME')+"' "+ms.uiEvent(formId, 'QII_INSEPCT_TIME')+" title='"+ms.titleAttr(formId,'QII_INSEPCT_TIME','IS_TITLE_ATTR',v)+"' >"+v['QII_INSEPCT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_REVIEW_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QII_REVIEW_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_REVIEW_EMP')+"' "+ms.tdEvent(formId, 'QII_REVIEW_EMP')+">")
            arrHtml.push("<span colno='QII_REVIEW_EMP' class='"+ms.uiClass(formId, 'QII_REVIEW_EMP')+"' style='"+ms.uiStyle(formId, 'QII_REVIEW_EMP')+"' "+ms.uiEvent(formId, 'QII_REVIEW_EMP')+" title='"+ms.titleAttr(formId,'QII_REVIEW_EMP','IS_TITLE_ATTR',v)+"' >"+v['QII_REVIEW_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_REVIEW_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QII_REVIEW_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QII_REVIEW_TIME')+"' "+ms.tdEvent(formId, 'QII_REVIEW_TIME')+">")
            arrHtml.push("<span colno='QII_REVIEW_TIME' class='"+ms.uiClass(formId, 'QII_REVIEW_TIME')+"' style='"+ms.uiStyle(formId, 'QII_REVIEW_TIME')+"' "+ms.uiEvent(formId, 'QII_REVIEW_TIME')+" title='"+ms.titleAttr(formId,'QII_REVIEW_TIME','IS_TITLE_ATTR',v)+"' >"+v['QII_REVIEW_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_CANCEL_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QII_CANCEL_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_CANCEL_EMP')+"' "+ms.tdEvent(formId, 'QII_CANCEL_EMP')+">")
            arrHtml.push("<span colno='QII_CANCEL_EMP' class='"+ms.uiClass(formId, 'QII_CANCEL_EMP')+"' style='"+ms.uiStyle(formId, 'QII_CANCEL_EMP')+"' "+ms.uiEvent(formId, 'QII_CANCEL_EMP')+" title='"+ms.titleAttr(formId,'QII_CANCEL_EMP','IS_TITLE_ATTR',v)+"' >"+v['QII_CANCEL_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_CANCEL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QII_CANCEL_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QII_CANCEL_TIME')+"' "+ms.tdEvent(formId, 'QII_CANCEL_TIME')+">")
            arrHtml.push("<span colno='QII_CANCEL_TIME' class='"+ms.uiClass(formId, 'QII_CANCEL_TIME')+"' style='"+ms.uiStyle(formId, 'QII_CANCEL_TIME')+"' "+ms.uiEvent(formId, 'QII_CANCEL_TIME')+" title='"+ms.titleAttr(formId,'QII_CANCEL_TIME','IS_TITLE_ATTR',v)+"' >"+v['QII_CANCEL_TIME']+"</span>")
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
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//品质检验单
function itemJump1(obj){
      winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//仓库单据信息
function itemJump3(obj){
    winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
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
