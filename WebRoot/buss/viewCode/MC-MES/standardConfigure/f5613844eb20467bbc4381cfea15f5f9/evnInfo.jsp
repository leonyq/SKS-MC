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
		<dict:lang value="环境信息表" />
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
		<bu:header formId ="5b459044dfc845bd98cf173f26aab70a"/>

    
  
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f06e99be655e483c90aa677ea981c913" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f06e99be655e483c90aa677ea981c913" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage5b459044dfc845bd98cf173f26aab70a" id="formPage5b459044dfc845bd98cf173f26aab70a" value="${formPage5b459044dfc845bd98cf173f26aab70a}"/>
		<input type="hidden" name="formId" id="formId1" value='5b459044dfc845bd98cf173f26aab70a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="5b459044dfc845bd98cf173f26aab70a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax5b459044dfc845bd98cf173f26aab70a" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner5b459044dfc845bd98cf173f26aab70a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable5b459044dfc845bd98cf173f26aab70a" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="5b459044dfc845bd98cf173f26aab70a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_5b459044dfc845bd98cf173f26aab70a" onclick="_selectAjaxTableAllData(this,'5b459044dfc845bd98cf173f26aab70a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:210px;"><bu:uitn colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:220px;"><bu:uitn colNo="T2#WA_AREA_NAME" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:360px;"><bu:uitn colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CEI_RECORD_EMP" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CEI_RECORD_TIME" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDiv5b459044dfc845bd98cf173f26aab70a" onscroll="ajaxTableScroll(this,'5b459044dfc845bd98cf173f26aab70a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax5b459044dfc845bd98cf173f26aab70a" >
		<tbody id="tbody_5b459044dfc845bd98cf173f26aab70a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage5b459044dfc845bd98cf173f26aab70a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=5b459044dfc845bd98cf173f26aab70a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f06e99be655e483c90aa677ea981c913" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f06e99be655e483c90aa677ea981c913" />
    

    
              <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}/buss/bussModel_listMsData.ms";
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
                  // if( getDealSearchMultiTimeSlotBtn())
                 //  $('.scroll1').mCustomScrollbar("destroy");
                 //    setPopScroll('.scroll1','.head1');
                     listAjaxTable(formId);
                 //      $('.scroll1').mCustomScrollbar("destroy");
                 //     setPopScroll('.scroll1','.head1');
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
                    var url = "${path}/buss/bussModel_listMsCasData.ms?exeid=f06e99be655e483c90aa677ea981c913";
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
                    $('.scroll1').mCustomScrollbar("destroy");
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = parseInt(page.currentPage);
                    ajaxPage.pageRecord = parseInt(page.pageRecord);
                    ajaxPage.totalPage = parseInt(page.totalPage);
                    ajaxPage.totalRecord = parseInt(page.totalRecord);
                    ajaxPage.first = page.first;
                    ajaxPage.last = page.last;
                    pageFun(ajaxPage,formId);
                    setPopScroll('.scroll1','.head1');
           
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
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='5b459044dfc845bd98cf173f26aab70a'){<%--环境信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);   
           arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CEI_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CEI_TYPE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'CEI_TYPE')+"' "+ms.tdEvent(formId, 'CEI_TYPE')+">")
            arrHtml.push("<span colno='CEI_TYPE' class='"+ms.uiClass(formId, 'CEI_TYPE')+"' style='"+ms.uiStyle(formId, 'CEI_TYPE')+"' "+ms.uiEvent(formId, 'CEI_TYPE')+" title='"+ms.titleAttr(formId,'CEI_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CEI_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CEI_AREA_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CEI_AREA_SN')+"' "+ms.tdEvent(formId, 'CEI_AREA_SN')+">")
            arrHtml.push("<span colno='CEI_AREA_SN' class='"+ms.uiClass(formId, 'CEI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CEI_AREA_SN')+"' "+ms.uiEvent(formId, 'CEI_AREA_SN')+" title='"+ms.titleAttr(formId,'CEI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CEI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WA_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WA_AREA_NAME')+"' style='width:220px;"+ms.tdStyle(formId, 'T2#WA_AREA_NAME')+"' "+ms.tdEvent(formId, 'T2#WA_AREA_NAME')+">")
            arrHtml.push("<span colno='T2#WA_AREA_NAME' class='"+ms.uiClass(formId, 'T2#WA_AREA_NAME')+"' style='"+ms.uiStyle(formId, 'T2#WA_AREA_NAME')+"' "+ms.uiEvent(formId, 'T2#WA_AREA_NAME')+" title='"+ms.titleAttr(formId,'T2#WA_AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#WA_AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_RECORD_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'CEI_RECORD_CONTENT')+"' style='width:360px;padding:3px 5px;"+ms.tdStyle(formId, 'CEI_RECORD_CONTENT')+"' "+ms.tdEvent(formId, 'CEI_RECORD_CONTENT')+">")
            arrHtml.push("<span colno='CEI_RECORD_CONTENT' class='"+ms.uiClass(formId, 'CEI_RECORD_CONTENT')+"' style='height:20px;"+ms.uiStyle(formId, 'CEI_RECORD_CONTENT')+"' "+ms.uiEvent(formId, 'CEI_RECORD_CONTENT')+" title='"+ms.titleAttr(formId,'CEI_RECORD_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['CEI_RECORD_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_RECORD_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CEI_RECORD_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CEI_RECORD_EMP')+"' "+ms.tdEvent(formId, 'CEI_RECORD_EMP')+">")
            arrHtml.push("<span colno='CEI_RECORD_EMP' class='"+ms.uiClass(formId, 'CEI_RECORD_EMP')+"' style='"+ms.uiStyle(formId, 'CEI_RECORD_EMP')+"' "+ms.uiEvent(formId, 'CEI_RECORD_EMP')+" title='"+ms.titleAttr(formId,'CEI_RECORD_EMP','IS_TITLE_ATTR',v)+"' >"+v['CEI_RECORD_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CEI_RECORD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CEI_RECORD_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CEI_RECORD_TIME')+"' "+ms.tdEvent(formId, 'CEI_RECORD_TIME')+">")
            arrHtml.push("<span colno='CEI_RECORD_TIME' class='"+ms.uiClass(formId, 'CEI_RECORD_TIME')+"' style='"+ms.uiStyle(formId, 'CEI_RECORD_TIME')+"' "+ms.uiEvent(formId, 'CEI_RECORD_TIME')+" title='"+ms.titleAttr(formId,'CEI_RECORD_TIME','IS_TITLE_ATTR',v)+"' >"+v['CEI_RECORD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
      //  setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setTableWidth(formId);
     setNumColWidth(formId);
    clearAllSelect();
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    //	setScroll();
    }
    $(".head1").scrollLeft(0);
}
</script>
<script>(function($){
  $(window).on('load',function(){
    
   setPopScroll('.scroll1','.head1');
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
