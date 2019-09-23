<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="巡检方案信息" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="9e2c713356a048c8a99bf86defe6cb1e"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="72d232f6a3074d2fb655247cafa0b434" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="72d232f6a3074d2fb655247cafa0b434" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage9e2c713356a048c8a99bf86defe6cb1e" id="formPage9e2c713356a048c8a99bf86defe6cb1e" value="${formPage9e2c713356a048c8a99bf86defe6cb1e}"/>
		<input type="hidden" name="formId" id="formId1" value='9e2c713356a048c8a99bf86defe6cb1e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9e2c713356a048c8a99bf86defe6cb1e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9e2c713356a048c8a99bf86defe6cb1e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner9e2c713356a048c8a99bf86defe6cb1e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9e2c713356a048c8a99bf86defe6cb1e" style="min-width:1258px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9e2c713356a048c8a99bf86defe6cb1e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9e2c713356a048c8a99bf86defe6cb1e" onclick="_selectAjaxTableAllData(this,'9e2c713356a048c8a99bf86defe6cb1e')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QI_DEFAULT_FALG" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDiv9e2c713356a048c8a99bf86defe6cb1e" onscroll="ajaxTableScroll(this,'9e2c713356a048c8a99bf86defe6cb1e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9e2c713356a048c8a99bf86defe6cb1e" style="min-width:1258px;">
		<tbody id="tbody_9e2c713356a048c8a99bf86defe6cb1e" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9e2c713356a048c8a99bf86defe6cb1e==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9e2c713356a048c8a99bf86defe6cb1e&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="72d232f6a3074d2fb655247cafa0b434" />
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="72d232f6a3074d2fb655247cafa0b434" />
<!--	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include> -->
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                                console.log(ms);
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
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
                    });
                }
                
                //打印
                function listAjaxTable_print(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsDataPrint.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    //util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                        	
                           
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                
                                createTableModel_print(ms,formId);
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
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
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
                  // if( getDealSearchMultiTimeSlotBtn())
                  try{
                    chkMsSaveMarkUtils.saveConfig();
                      
                  }catch(err){
                      
                  }
                $('.scroll1').mCustomScrollbar("destroy");
                 listAjaxTable(formId);	
                 setPopScroll('.scroll1','.head1');
                        $('.head1')[0].scrollLeft = 0
                     //listAjaxTable_print(formId);
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=adfc3cdd94ca4caa860c7dfbcbbceb83";
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
                        if(msg.readyState!=0){
				             utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                         }
                        }
                    });
                }
                
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr  style='width: ");
                        arrHtml.push(tableWidth+"px");
                        arrHtml.push(";");
                        arrHtml.push("height:1000px;'></tr>");
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
                    //var width = $(window).width() - 2;
                    //$(".datagrid-body-ajax >.datagrid-htable,.datagrid-body-ajax >.datagrid-btable").width(width);
                }
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
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
    
    
function reloadPg(msg,title,width,height,time,isCloseWin){
    msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
  }


function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
    util.showTopLoading(); */
    query("formId1");
    if ("0" == isCloseWin) {
      top.$(".dialog-close").click();
    }
    //checkboxAll("joblist");
    
  }
    
</script>
<script>
var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='9e2c713356a048c8a99bf86defe6cb1e'){<%--巡检方案--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
           // arrHtml.push("</td>"); 
           arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QI_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QI_NAME')+"' "+ms.tdEvent(formId, 'QI_NAME')+">")
            arrHtml.push("<span colno='QI_NAME' class='"+ms.uiClass(formId, 'QI_NAME')+"' style='"+ms.uiStyle(formId, 'QI_NAME')+"' "+ms.uiEvent(formId, 'QI_NAME')+" >"+v['QI_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QI_TYPE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QI_TYPE')+"' "+ms.tdEvent(formId, 'QI_TYPE')+">")
            arrHtml.push("<span colno='QI_TYPE' class='"+ms.uiClass(formId, 'QI_TYPE')+"' style='"+ms.uiStyle(formId, 'QI_TYPE')+"' "+ms.uiEvent(formId, 'QI_TYPE')+" >"+v['QI_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_DEFAULT_FALG' class='datagrid-cell "+ms.tdClass(formId, 'QI_DEFAULT_FALG')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QI_DEFAULT_FALG')+"' "+ms.tdEvent(formId, 'QI_DEFAULT_FALG')+">")
            arrHtml.push("<span colno='QI_DEFAULT_FALG' class='"+ms.uiClass(formId, 'QI_DEFAULT_FALG')+"' style='"+ms.uiStyle(formId, 'QI_DEFAULT_FALG')+"' "+ms.uiEvent(formId, 'QI_DEFAULT_FALG')+" >"+v['QI_DEFAULT_FALG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_ADVANCE_ALARM' class='datagrid-cell "+ms.tdClass(formId, 'QI_ADVANCE_ALARM')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'QI_ADVANCE_ALARM')+"' "+ms.tdEvent(formId, 'QI_ADVANCE_ALARM')+">")
            arrHtml.push("<span colno='QI_ADVANCE_ALARM' class='"+ms.uiClass(formId, 'QI_ADVANCE_ALARM')+"' style='"+ms.uiStyle(formId, 'QI_ADVANCE_ALARM')+"' "+ms.uiEvent(formId, 'QI_ADVANCE_ALARM')+" >"+v['QI_ADVANCE_ALARM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'QI_MODEL')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QI_MODEL')+"' "+ms.tdEvent(formId, 'QI_MODEL')+">")
            arrHtml.push("<span colno='QI_MODEL' class='"+ms.uiClass(formId, 'QI_MODEL')+"' style='"+ms.uiStyle(formId, 'QI_MODEL')+"' "+ms.uiEvent(formId, 'QI_MODEL')+" >"+v['QI_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QI_INPUT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QI_INPUT_TIME')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'QI_INPUT_TIME')+"' "+ms.tdEvent(formId, 'QI_INPUT_TIME')+">")
            arrHtml.push("<span colno='QI_INPUT_TIME' class='"+ms.uiClass(formId, 'QI_INPUT_TIME')+"' style='"+ms.uiStyle(formId, 'QI_INPUT_TIME')+"' "+ms.uiEvent(formId, 'QI_INPUT_TIME')+" >"+v['QI_INPUT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
       // setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
  //  if(isFirstSetScroll == 0){
  //  	isFirstSetScroll =1;
  //  	setScroll();
  //  }
}
</script>
<script>(function($){
  $(window).on('load',function(){
    
   setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>