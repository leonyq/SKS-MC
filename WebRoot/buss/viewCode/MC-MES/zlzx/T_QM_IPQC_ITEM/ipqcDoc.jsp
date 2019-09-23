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
		<dict:lang value="VM-IPQC单据信息" />
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
		<bu:header formId ="0900df53f0aa452cb6dd0703012fdaef"/>

    
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
		<bu:func viewId="8a169d9501c4458093a59624669e67e2" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8a169d9501c4458093a59624669e67e2" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0900df53f0aa452cb6dd0703012fdaef" id="formPage0900df53f0aa452cb6dd0703012fdaef" value="${formPage0900df53f0aa452cb6dd0703012fdaef}"/>
		<input type="hidden" name="formId" id="formId1" value='0900df53f0aa452cb6dd0703012fdaef'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0900df53f0aa452cb6dd0703012fdaef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0900df53f0aa452cb6dd0703012fdaef" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0900df53f0aa452cb6dd0703012fdaef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0900df53f0aa452cb6dd0703012fdaef">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0900df53f0aa452cb6dd0703012fdaef" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0900df53f0aa452cb6dd0703012fdaef" onclick="_selectAjaxTableAllData(this,'0900df53f0aa452cb6dd0703012fdaef')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QID_STATUS" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QID_CONFIRM_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QID_CONFIRM_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0900df53f0aa452cb6dd0703012fdaef" onscroll="ajaxTableScroll(this,'0900df53f0aa452cb6dd0703012fdaef')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0900df53f0aa452cb6dd0703012fdaef">
		<tbody id="tbody_0900df53f0aa452cb6dd0703012fdaef" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0900df53f0aa452cb6dd0703012fdaef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0900df53f0aa452cb6dd0703012fdaef&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8a169d9501c4458093a59624669e67e2" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8a169d9501c4458093a59624669e67e2" />
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
                    //var url = "/N2/buss/bussModel_listMsData.ms";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,QID_STATUS\"}";
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
                    var url = "/N2/buss/bussModel_listMsCasData.ms?exeid=8a169d9501c4458093a59624669e67e2";
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
    if(formId=='0900df53f0aa452cb6dd0703012fdaef'){<%--FM-IPQC单据信息--%>
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
            arrHtml.push("<td colno='QID_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QID_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QID_DOC_NUM')+"' "+ms.tdEvent(formId, 'QID_DOC_NUM')+">")
            arrHtml.push("<span colno='QID_DOC_NUM' class='"+ms.uiClass(formId, 'QID_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'QID_DOC_NUM')+"' "+ms.uiEvent(formId, 'QID_DOC_NUM')+" title='"+ms.titleAttr(formId,'QID_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['QID_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QID_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'QID_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QID_STATUS')+"' "+ms.tdEvent(formId, 'QID_STATUS')+">")
            arrHtml.push("<span colno='QID_STATUS' class='"+ms.uiClass(formId, 'QID_STATUS')+"' style='"+ms.uiStyle(formId, 'QID_STATUS')+"' "+ms.uiEvent(formId, 'QID_STATUS')+" title='"+ms.titleAttr(formId,'QID_STATUS','IS_TITLE_ATTR',v)+"' >"+v['QID_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='qidStatus"+v.ID+"' name='QID_STATUS' value='"+uiRaw[i].QID_STATUS+"' /></td>");
            arrHtml.push("<td colno='QID_COMMENT' class='datagrid-cell "+ms.tdClass(formId, 'QID_COMMENT')+"' style='width:200px;"+ms.tdStyle(formId, 'QID_COMMENT')+"' "+ms.tdEvent(formId, 'QID_COMMENT')+">")
            arrHtml.push("<span colno='QID_COMMENT' class='"+ms.uiClass(formId, 'QID_COMMENT')+"' style='"+ms.uiStyle(formId, 'QID_COMMENT')+"' "+ms.uiEvent(formId, 'QID_COMMENT')+" title='"+ms.titleAttr(formId,'QID_COMMENT','IS_TITLE_ATTR',v)+"' >"+v['QID_COMMENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QID_RECORD_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QID_RECORD_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QID_RECORD_EMP')+"' "+ms.tdEvent(formId, 'QID_RECORD_EMP')+">")
            arrHtml.push("<span colno='QID_RECORD_EMP' class='"+ms.uiClass(formId, 'QID_RECORD_EMP')+"' style='"+ms.uiStyle(formId, 'QID_RECORD_EMP')+"' "+ms.uiEvent(formId, 'QID_RECORD_EMP')+" title='"+ms.titleAttr(formId,'QID_RECORD_EMP','IS_TITLE_ATTR',v)+"' >"+v['QID_RECORD_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QID_RECORD_DATE' class='datagrid-cell "+ms.tdClass(formId, 'QID_RECORD_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QID_RECORD_DATE')+"' "+ms.tdEvent(formId, 'QID_RECORD_DATE')+">")
            arrHtml.push("<span colno='QID_RECORD_DATE' class='"+ms.uiClass(formId, 'QID_RECORD_DATE')+"' style='"+ms.uiStyle(formId, 'QID_RECORD_DATE')+"' "+ms.uiEvent(formId, 'QID_RECORD_DATE')+" title='"+ms.titleAttr(formId,'QID_RECORD_DATE','IS_TITLE_ATTR',v)+"' >"+v['QID_RECORD_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QID_CONFIRM_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QID_CONFIRM_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QID_CONFIRM_EMP')+"' "+ms.tdEvent(formId, 'QID_CONFIRM_EMP')+">")
            arrHtml.push("<span colno='QID_CONFIRM_EMP' class='"+ms.uiClass(formId, 'QID_CONFIRM_EMP')+"' style='"+ms.uiStyle(formId, 'QID_CONFIRM_EMP')+"' "+ms.uiEvent(formId, 'QID_CONFIRM_EMP')+" title='"+ms.titleAttr(formId,'QID_CONFIRM_EMP','IS_TITLE_ATTR',v)+"' >"+v['QID_CONFIRM_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QID_CONFIRM_DATE' class='datagrid-cell "+ms.tdClass(formId, 'QID_CONFIRM_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QID_CONFIRM_DATE')+"' "+ms.tdEvent(formId, 'QID_CONFIRM_DATE')+">")
            arrHtml.push("<span colno='QID_CONFIRM_DATE' class='"+ms.uiClass(formId, 'QID_CONFIRM_DATE')+"' style='"+ms.uiStyle(formId, 'QID_CONFIRM_DATE')+"' "+ms.uiEvent(formId, 'QID_CONFIRM_DATE')+" title='"+ms.titleAttr(formId,'QID_CONFIRM_DATE','IS_TITLE_ATTR',v)+"' >"+v['QID_CONFIRM_DATE']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
