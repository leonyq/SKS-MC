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
		<dict:lang value="免检管理列表" />
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
		<bu:header formId ="d6969731daf649c0acf934e37c0a4f1f"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd" >
		<bu:func viewId="44772eab61d14b238bb3ed3e6ab4e49b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="44772eab61d14b238bb3ed3e6ab4e49b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged6969731daf649c0acf934e37c0a4f1f" id="formPaged6969731daf649c0acf934e37c0a4f1f" value="${formPaged6969731daf649c0acf934e37c0a4f1f}"/>
		<input type="hidden" name="formId" id="formId1" value='d6969731daf649c0acf934e37c0a4f1f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d6969731daf649c0acf934e37c0a4f1f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd6969731daf649c0acf934e37c0a4f1f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-innerd6969731daf649c0acf934e37c0a4f1f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled6969731daf649c0acf934e37c0a4f1f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d6969731daf649c0acf934e37c0a4f1f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d6969731daf649c0acf934e37c0a4f1f" onclick="_selectAjaxTableAllData(this,'d6969731daf649c0acf934e37c0a4f1f')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center"><bu:uitn colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_SUP_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDivd6969731daf649c0acf934e37c0a4f1f" onscroll="ajaxTableScroll(this,'d6969731daf649c0acf934e37c0a4f1f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd6969731daf649c0acf934e37c0a4f1f">
		<tbody id="tbody_d6969731daf649c0acf934e37c0a4f1f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged6969731daf649c0acf934e37c0a4f1f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d6969731daf649c0acf934e37c0a4f1f&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="44772eab61d14b238bb3ed3e6ab4e49b" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="44772eab61d14b238bb3ed3e6ab4e49b" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include> -->
   <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms";
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
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='d6969731daf649c0acf934e37c0a4f1f'){<%--免检管理信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QEI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'QEI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QEI_ITEM_CODE')+">")
            arrHtml.push("<span colno='QEI_ITEM_CODE' class='"+ms.uiClass(formId, 'QEI_ITEM_CODE')+"' onclick='itemJump1(\""+v['QEI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QEI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QEI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QEI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QEI_VALID_FLAG')+"' style='text-align:center;"+ms.tdStyle(formId, 'QEI_VALID_FLAG')+"' "+ms.tdEvent(formId, 'QEI_VALID_FLAG')+">")
            arrHtml.push("<span colno='QEI_VALID_FLAG' class='"+ms.uiClass(formId, 'QEI_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'QEI_VALID_FLAG')+"' "+ms.uiEvent(formId, 'QEI_VALID_FLAG')+" title='"+ms.titleAttr(formId,'QEI_VALID_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QEI_VALID_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QEI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'QEI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QEI_ITEM_NAME')+">")
            arrHtml.push("<span colno='QEI_ITEM_NAME' class='"+ms.uiClass(formId, 'QEI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QEI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QEI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QEI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QEI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QEI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'QEI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QEI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QEI_ITEM_SPEC' class='"+ms.uiClass(formId, 'QEI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QEI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QEI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'QEI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QEI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_SUP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QEI_SUP_NAME')+"' style='text-align:center;"+ms.tdStyle(formId, 'QEI_SUP_NAME')+"' "+ms.tdEvent(formId, 'QEI_SUP_NAME')+">")
            arrHtml.push("<span colno='QEI_SUP_NAME' class='"+ms.uiClass(formId, 'QEI_SUP_NAME')+"' style='"+ms.uiStyle(formId, 'QEI_SUP_NAME')+"' "+ms.uiEvent(formId, 'QEI_SUP_NAME')+" title='"+ms.titleAttr(formId,'QEI_SUP_NAME','IS_TITLE_ATTR',v)+"' >"+v['QEI_SUP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_START_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QEI_START_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'QEI_START_TIME')+"' "+ms.tdEvent(formId, 'QEI_START_TIME')+">")
            arrHtml.push("<span colno='QEI_START_TIME' class='"+ms.uiClass(formId, 'QEI_START_TIME')+"' style='"+ms.uiStyle(formId, 'QEI_START_TIME')+"' "+ms.uiEvent(formId, 'QEI_START_TIME')+" title='"+ms.titleAttr(formId,'QEI_START_TIME','IS_TITLE_ATTR',v)+"' >"+v['QEI_START_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QEI_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QEI_END_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'QEI_END_TIME')+"' "+ms.tdEvent(formId, 'QEI_END_TIME')+">")
            arrHtml.push("<span colno='QEI_END_TIME' class='"+ms.uiClass(formId, 'QEI_END_TIME')+"' style='"+ms.uiStyle(formId, 'QEI_END_TIME')+"' "+ms.uiEvent(formId, 'QEI_END_TIME')+" title='"+ms.titleAttr(formId,'QEI_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['QEI_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
     //   setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
   // if(isFirstSetScroll == 0){setScroll();}
   // isFirstSetScroll++;
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
