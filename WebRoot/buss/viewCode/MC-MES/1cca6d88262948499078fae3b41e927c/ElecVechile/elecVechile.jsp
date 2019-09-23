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
		<dict:lang value="电子料站" />
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
		<bu:header formId ="d9ea51e4ac084f0b8b227807c5b6539d"/>

    
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
	  <bu:func viewId="2168596ab39a42fab6b43fafbed16bdd" />   
		    	<!--    <form id="searchFormTop" name="searchFormTop" action="#" method="post"><div id="timeBucketId"></div></form>		
                <div class="optn">  <form id="funForm" name="funForm" action="/N2/buss/bussModel.ms" method="post" target="submitFrame">
                    <input type="hidden" name="exeid" value="2168596ab39a42fab6b43fafbed16bdd">
                    <table class="func_table">
                        <tbody>
                        <tr>
                          <td width="100%" align="right">
                            <button type="button" id="afcd929e035d4709be3f7a91bd26f1ec" value="" onclick="addAjax()" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
                            <button type="button" id="00962a22b5ff4a5f8d394ddc10ef59d8" value="" onclick="ajaxEdit()" sytle="" class="botton_img_add"><i class="ico ico-xg "></i>修改</button>
                            <button type="button" id="9c5d516fdc7149dcbde989d5753e8908" value="" onclick="delInfo()" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
                            <button type="button" id="1a99f37d147b483a95a3aa42217acd72" value="" onclick="showDetail()" sytle="" class="botton_img_add"><i class="ico ico-show-detail "></i>查看</button>
                            <button type="button" class="botton_img_add" onclick="query(this)"><i class="ico ico-search-new"></i>查询</button>		
                          </td>
                        </tr>
                      </tbody>					
                    </table>
                    </form>
                </div>
                -->
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2168596ab39a42fab6b43fafbed16bdd" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged9ea51e4ac084f0b8b227807c5b6539d" id="formPaged9ea51e4ac084f0b8b227807c5b6539d" value="${formPaged9ea51e4ac084f0b8b227807c5b6539d}"/>
		<input type="hidden" name="formId" id="formId1" value='d9ea51e4ac084f0b8b227807c5b6539d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="iframeid" name="iframeid" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d9ea51e4ac084f0b8b227807c5b6539d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd9ea51e4ac084f0b8b227807c5b6539d" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd9ea51e4ac084f0b8b227807c5b6539d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled9ea51e4ac084f0b8b227807c5b6539d">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d9ea51e4ac084f0b8b227807c5b6539d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d9ea51e4ac084f0b8b227807c5b6539d" onclick="_selectAjaxTableAllData(this,'d9ea51e4ac084f0b8b227807c5b6539d')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WEC_STATUS" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd9ea51e4ac084f0b8b227807c5b6539d" onscroll="ajaxTableScroll(this,'d9ea51e4ac084f0b8b227807c5b6539d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd9ea51e4ac084f0b8b227807c5b6539d">
		<tbody id="tbody_d9ea51e4ac084f0b8b227807c5b6539d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged9ea51e4ac084f0b8b227807c5b6539d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d9ea51e4ac084f0b8b227807c5b6539d&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2168596ab39a42fab6b43fafbed16bdd" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2168596ab39a42fab6b43fafbed16bdd" />
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
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WEC_STATUS\"}";
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
    if(formId=='d9ea51e4ac084f0b8b227807c5b6539d'){<%--FM-仓库电子周转料车信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style=' width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_SN' class='datagrid-cell "+ms.tdClass(formId, 'WEC_SN')+"' style='width:200px;"+ms.tdStyle(formId, 'WEC_SN')+"' "+ms.tdEvent(formId, 'WEC_SN')+">")
            arrHtml.push("<span colno='WEC_SN' class='"+ms.uiClass(formId, 'WEC_SN')+"' onclick='itemJump1(\""+v['WEC_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WEC_SN')+" title='"+ms.titleAttr(formId,'WEC_SN','IS_TITLE_ATTR',v)+"' >"+v['WEC_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WEC_STATUS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WEC_STATUS')+"' "+ms.tdEvent(formId, 'WEC_STATUS')+">")
            arrHtml.push("<span colno='WEC_STATUS' class='"+ms.uiClass(formId, 'WEC_STATUS')+"' style='"+ms.uiStyle(formId, 'WEC_STATUS')+"' "+ms.uiEvent(formId, 'WEC_STATUS')+" title='"+ms.titleAttr(formId,'WEC_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WEC_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='id"+v.ID+"' name='WEC_STATUS' value='"+uiRaw[i].WEC_STATUS+"' /></td>");
            arrHtml.push("<td colno='WEC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WEC_NAME')+"' style='width:200px;"+ms.tdStyle(formId, 'WEC_NAME')+"' "+ms.tdEvent(formId, 'WEC_NAME')+">")
            arrHtml.push("<span colno='WEC_NAME' class='"+ms.uiClass(formId, 'WEC_NAME')+"' style='"+ms.uiStyle(formId, 'WEC_NAME')+"' "+ms.uiEvent(formId, 'WEC_NAME')+" title='"+ms.titleAttr(formId,'WEC_NAME','IS_TITLE_ATTR',v)+"' >"+v['WEC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_SHELF_IP' class='datagrid-cell "+ms.tdClass(formId, 'WEC_SHELF_IP')+"' style='width:200px;"+ms.tdStyle(formId, 'WEC_SHELF_IP')+"' "+ms.tdEvent(formId, 'WEC_SHELF_IP')+">")
            arrHtml.push("<span colno='WEC_SHELF_IP' class='"+ms.uiClass(formId, 'WEC_SHELF_IP')+"' style='"+ms.uiStyle(formId, 'WEC_SHELF_IP')+"' "+ms.uiEvent(formId, 'WEC_SHELF_IP')+" title='"+ms.titleAttr(formId,'WEC_SHELF_IP','IS_TITLE_ATTR',v)+"' >"+v['WEC_SHELF_IP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WEC_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WEC_DATE')+"' "+ms.tdEvent(formId, 'WEC_DATE')+">")
            arrHtml.push("<span colno='WEC_DATE' class='"+ms.uiClass(formId, 'WEC_DATE')+"' style='"+ms.uiStyle(formId, 'WEC_DATE')+"' "+ms.uiEvent(formId, 'WEC_DATE')+" title='"+ms.titleAttr(formId,'WEC_DATE','IS_TITLE_ATTR',v)+"' >"+v['WEC_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_DEPT' class='datagrid-cell "+ms.tdClass(formId, 'WEC_DEPT')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'WEC_DEPT')+"' "+ms.tdEvent(formId, 'WEC_DEPT')+">")
            arrHtml.push("<span colno='WEC_DEPT' class='"+ms.uiClass(formId, 'WEC_DEPT')+"' style='"+ms.uiStyle(formId, 'WEC_DEPT')+"' "+ms.uiEvent(formId, 'WEC_DEPT')+" title='"+ms.titleAttr(formId,'WEC_DEPT','IS_TITLE_ATTR',v)+"' >"+v['WEC_DEPT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEC_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WEC_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WEC_EMP')+"' "+ms.tdEvent(formId, 'WEC_EMP')+">")
            arrHtml.push("<span colno='WEC_EMP' class='"+ms.uiClass(formId, 'WEC_EMP')+"' style='"+ms.uiStyle(formId, 'WEC_EMP')+"' "+ms.uiEvent(formId, 'WEC_EMP')+" title='"+ms.titleAttr(formId,'WEC_EMP','IS_TITLE_ATTR',v)+"' >"+v['WEC_EMP']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WEC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WEC_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'WEC_MEMO')+"' "+ms.tdEvent(formId, 'WEC_MEMO')+">")
            arrHtml.push("<span colno='WEC_MEMO' class='"+ms.uiClass(formId, 'WEC_MEMO')+"' style='"+ms.uiStyle(formId, 'WEC_MEMO')+"' "+ms.uiEvent(formId, 'WEC_MEMO')+" title='"+ms.titleAttr(formId,'WEC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WEC_MEMO']+"</span>")
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

//电子料车物料
function itemJump1(obj){
      winOptMethod.jump("bd93d69449f14a10ac010f112a52802d","F8090","jumpId",obj);
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
