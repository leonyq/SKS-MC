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
		<dict:lang value="复检超期" />
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
		<bu:header formId ="0b6208aca3fe40d5bc66a4c230c32d31"/>

    
  
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="1026b6fd3e924b5794c52fb1c1e0b504" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="1026b6fd3e924b5794c52fb1c1e0b504" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0b6208aca3fe40d5bc66a4c230c32d31" id="formPage0b6208aca3fe40d5bc66a4c230c32d31" value="${formPage0b6208aca3fe40d5bc66a4c230c32d31}"/>
		<input type="hidden" name="formId" id="formId1" value='0b6208aca3fe40d5bc66a4c230c32d31'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0b6208aca3fe40d5bc66a4c230c32d31">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0b6208aca3fe40d5bc66a4c230c32d31" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0b6208aca3fe40d5bc66a4c230c32d31">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0b6208aca3fe40d5bc66a4c230c32d31">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0b6208aca3fe40d5bc66a4c230c32d31" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0b6208aca3fe40d5bc66a4c230c32d31" onclick="_selectAjaxTableAllData(this,'0b6208aca3fe40d5bc66a4c230c32d31')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;text-align:center" ><dict:lang value="组织机构" /></td >
			<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料/产品SN" /></td >
			<td class="datagrid-cell" style="width:130px;" ><dict:lang value="状态" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
			<td class="datagrid-cell" style="width:80px;" ><dict:lang value="物料数量" /></td >
			<td class="datagrid-cell" style="width:80px;" ><dict:lang value="复检周期" /></td >
			<td class="datagrid-cell" style="width:140px;" ><dict:lang value="复检到期时间" /></td >
			<td class="datagrid-cell" style="width:140px;" ><dict:lang value="检验时间" /></td >
			<td class="datagrid-cell" style="width:100px;" ><dict:lang value="检验提醒天数" /></td >
			<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料批次" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
			<td class="datagrid-cell" style="width:140px;"><dict:lang value="入库时间" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0b6208aca3fe40d5bc66a4c230c32d31" onscroll="ajaxTableScroll(this,'0b6208aca3fe40d5bc66a4c230c32d31')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31" >
		<tbody id="tbody_0b6208aca3fe40d5bc66a4c230c32d31" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0b6208aca3fe40d5bc66a4c230c32d31==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=formId2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1026b6fd3e924b5794c52fb1c1e0b504" />
      
      
		<bu:script viewId="1026b6fd3e924b5794c52fb1c1e0b504" />
    
   
   
    
    
    
 <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mc/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WOM_STATUS\"}";
                    //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIP_STATUS\"}";
                   
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
                   // listAjaxTable(formId);
                    SearchDetailFun("formId2");
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=f85054104955457dba9cbbdab514e3f9";
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
/*
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0b6208aca3fe40d5bc66a4c230c32d31'){<%--仓库库存信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STOCK_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.tdEvent(formId, 'WSI_STOCK_FLAG')+">")
            arrHtml.push("<span colno='WSI_STOCK_FLAG' class='"+ms.uiClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.uiEvent(formId, 'WSI_STOCK_FLAG')+" title='"+ms.titleAttr(formId,'WSI_STOCK_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_STOCK_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSI_ITEM_NAME' class='"+ms.uiClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WSI_ITEM_NUM' class='"+ms.uiClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_WH_CODE')+"' "+ms.tdEvent(formId, 'WSI_WH_CODE')+">")
            arrHtml.push("<span colno='WSI_WH_CODE' class='"+ms.uiClass(formId, 'WSI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_WH_CODE')+"' "+ms.uiEvent(formId, 'WSI_WH_CODE')+" title='"+ms.titleAttr(formId,'WSI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WSI_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WSI_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WSI_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WSI_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WSI_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WSI_STORAGE_CODE' class='"+ms.uiClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WSI_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WSI_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INSPECT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_INSPECT_FLAG')+">")
            arrHtml.push("<span colno='WSI_INSPECT_FLAG' class='"+ms.uiClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_INSPECT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_INSPECT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_INSPECT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FREEZE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_FREEZE_FLAG')+">")
            arrHtml.push("<span colno='WSI_FREEZE_FLAG' class='"+ms.uiClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_FREEZE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_FREEZE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_FREEZE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSI_DOC_NUM')+">")
            arrHtml.push("<span colno='WSI_DOC_NUM' class='"+ms.uiClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.tdStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WSI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WSI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WSI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WSI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WSI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WSI_SUP_CODE')+">")
            arrHtml.push("<span colno='WSI_SUP_CODE' class='"+ms.uiClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WSI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WSI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WSI_CUST_CODE')+">")
            arrHtml.push("<span colno='WSI_CUST_CODE' class='"+ms.uiClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WSI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WSI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FIRST_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FIRST_SN')+"' "+ms.tdEvent(formId, 'WSI_FIRST_SN')+">")
            arrHtml.push("<span colno='WSI_FIRST_SN' class='"+ms.uiClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FIRST_SN')+"' "+ms.uiEvent(formId, 'WSI_FIRST_SN')+" title='"+ms.titleAttr(formId,'WSI_FIRST_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FIRST_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SECOND_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.tdStyle(formId, 'WSI_SECOND_SN')+"' "+ms.tdEvent(formId, 'WSI_SECOND_SN')+">")
            arrHtml.push("<span colno='WSI_SECOND_SN' class='"+ms.uiClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.uiStyle(formId, 'WSI_SECOND_SN')+"' "+ms.uiEvent(formId, 'WSI_SECOND_SN')+" title='"+ms.titleAttr(formId,'WSI_SECOND_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_SECOND_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_THIRD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.tdStyle(formId, 'WSI_THIRD_SN')+"' "+ms.tdEvent(formId, 'WSI_THIRD_SN')+">")
            arrHtml.push("<span colno='WSI_THIRD_SN' class='"+ms.uiClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.uiStyle(formId, 'WSI_THIRD_SN')+"' "+ms.uiEvent(formId, 'WSI_THIRD_SN')+" title='"+ms.titleAttr(formId,'WSI_THIRD_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_THIRD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FOURTH_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.tdEvent(formId, 'WSI_FOURTH_SN')+">")
            arrHtml.push("<span colno='WSI_FOURTH_SN' class='"+ms.uiClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.uiEvent(formId, 'WSI_FOURTH_SN')+" title='"+ms.titleAttr(formId,'WSI_FOURTH_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FOURTH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INVALID_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.tdEvent(formId, 'WSI_INVALID_DATE')+">")
            arrHtml.push("<span colno='WSI_INVALID_DATE' class='"+ms.uiClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.uiEvent(formId, 'WSI_INVALID_DATE')+" title='"+ms.titleAttr(formId,'WSI_INVALID_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_INVALID_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EXTEND_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.tdEvent(formId, 'WSI_EXTEND_TIME')+">")
            arrHtml.push("<span colno='WSI_EXTEND_TIME' class='"+ms.uiClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.uiEvent(formId, 'WSI_EXTEND_TIME')+" title='"+ms.titleAttr(formId,'WSI_EXTEND_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_EXTEND_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DULL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_DULL_TIME')+"' "+ms.tdEvent(formId, 'WSI_DULL_TIME')+">")
            arrHtml.push("<span colno='WSI_DULL_TIME' class='"+ms.uiClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_DULL_TIME')+"' "+ms.uiEvent(formId, 'WSI_DULL_TIME')+" title='"+ms.titleAttr(formId,'WSI_DULL_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_DULL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_TRACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.tdEvent(formId, 'WSI_SUP_TRACE')+">")
            arrHtml.push("<span colno='WSI_SUP_TRACE' class='"+ms.uiClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.uiEvent(formId, 'WSI_SUP_TRACE')+" title='"+ms.titleAttr(formId,'WSI_SUP_TRACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_TRACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WSI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WSI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WSI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WSI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_TIME')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_TIME']+"</span>")
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
    */
}

</script>
<script "text/javascript">
$(function(){
    getInfo();
})
//获取信息
function getInfo(){
    	var dataAuth=$("#DATA_AUTH").val();
    var	 url="${path}buss/bussModel_exeFunc.ms?funcMId=4083c09629b44f8c99ba55afe4b4606e"; 
    util.showLoading("处理中...");
    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
        data: {
            "dataAuth" : dataAuth
        },
        success:function(data){
            util.closeLoading();
            $("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").empty();
            if(null==data){
                return;
            }
            
            if(null!=data.ajaxPage.dataList){
                var rccList = eval(data.ajaxPage.dataList);
                var outFlag="";
                for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].WSI_SUP_CODE==null) rccList[i].WSI_SUP_CODE="";
								if(rccList[i].WSI_CUST_CODE==null) rccList[i].WSI_CUST_CODE="";
								if(rccList[i].WSI_WH_CODE==null) rccList[i].WSI_WH_CODE="";
								if(rccList[i].WSI_DISTRICT_CODE==null) rccList[i].WSI_DISTRICT_CODE="";
								if(rccList[i].WSI_STORAGE_CODE==null) rccList[i].WSI_STORAGE_CODE="";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								if(rccList[i].DEPT_NAME==null) rccList[i].DEPT_NAME="";
								if(rccList[i].OUTTIME==null) outFlag="";
								if(rccList[i].OUTTIME=='超期') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='正常') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='预警') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='3') outFlag="";
								if(rccList[i].CI_REMIND_DAYS==null) rccList[i].CI_REMIND_DAYS="";
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"<input type='hidden' id='DATA_AUTH"+rccList[i].ID+"' value='"+rccList[i].DEPT_NAME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: left;' title='"+rccList[i].WSI_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span><input type='hidden' id='WSI_ITEM_SN"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_SN+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;text-align: center;'>"+outFlag+"<input type='hidden' id='OUTTIME"+rccList[i].ID+"' value='"+rccList[i].OUTTIME+"'/><input type='hidden' id='WSI_WH_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_WH_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:110px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"<input type='hidden' id='WH_NAME"+rccList[i].ID+"' value='"+rccList[i].WH_NAME+"'/><input type='hidden' id='WSI_DISTRICT_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_DISTRICT_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"<input type='hidden' id='WSI_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_NUM+"'/><input type='hidden' id='WSI_STORAGE_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_STORAGE_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"<input type='hidden' id='CI_RECHECK_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_RECHECK_DAYS+"'/></td>");
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:140px;text-align: center;' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"<input type='hidden' id='RECHECKOUT"+rccList[i].ID+"' value='"+rccList[i].RECHECKOUT+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align: center;' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"<input type='hidden' id='TEST_TIME"+rccList[i].ID+"' value='"+rccList[i].TEST_TIME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: right;' title='"+rccList[i].CI_REMIND_DAYS+"'>"+rccList[i].CI_REMIND_DAYS+"<input type='hidden' id='CI_REMIND_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_REMIND_DAYS+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: left;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span><input type='hidden' id='WSI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"<input type='hidden' id='WSI_LOT_NO"+rccList[i].ID+"' value='"+rccList[i].WSI_LOT_NO+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"<input type='hidden' id='CUSTOMER"+rccList[i].ID+"' value='"+rccList[i].CUSTOMER+"'/><input type='hidden' id='WSI_CUST_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_CUST_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+rccList[i].ID+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='WSI_SUP_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_SUP_CODE+"'/></td>");
	
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:140px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"<input type='hidden' id='RECEIVE_TIME"+rccList[i].ID+"' value='"+rccList[i].RECEIVE_TIME+"'/></td>");
								
							}
							
						}
						    pageFun(data.ajaxPage,"formId2");
							//var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31 tbody tr");
								var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31  tr");
							_tongLineColor(tableTrJs);
						//	clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31');
						defTableWidthRewrite("0b6208aca3fe40d5bc66a4c230c32d31");
                        setPopScroll('.scorl1','.head1');
            
        },
        error:function(msg){
                util.closeLoading();
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
        
    })
}
//查询分页
    	var paginationImpl={};
		function  SearchDetailFun(paginationImpl,url){
		       
		    	util.showLoading("处理中...");
		    	
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			
    			var dataAuth=$("#DATA_AUTH").val();
    			var WSI_ITEM_SN = $(document.getElementById('WSI_ITEM_SN')).val();
    			var WSI_ITEM_CODE = $(document.getElementById('WSI_ITEM_CODE_SHOW')).val();
    			var WSI_WH_CODE = $(document.getElementById('WSI_WH_CODE')).val();
    			var WSI_DISTRICT_CODE = $(document.getElementById('WSI_DISTRICT_CODE')).val();
    			var WSI_STORAGE_CODE = $(document.getElementById('WSI_STORAGE_CODE')).val();
    			
    			var WSI_RECEIVE_TIME_BEGIN= $(document.getElementById('WSI_RECEIVE_TIME_BEGIN')).val();
    			var WSI_RECEIVE_TIME_END= $(document.getElementById('WSI_RECEIVE_TIME_END')).val();
    			
    			var WSI_RECHECKOUT_BEGIN= $(document.getElementById('WSI_RECHECKOUT_BEGIN')).val();
    			var WSI_RECHECKOUT_END= $(document.getElementById('WSI_RECHECKOUT_END')).val();
    			
			var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=bbee9889a0e84d74b8ba27b56d326676";
			$.ajax({
				    type: "POST",
			    	dataType: "json",
			    	url: GetEmpPages,
			    	data: {
			    	    "WSI_RECHECKOUT_END" : WSI_RECHECKOUT_END,
			    	    "WSI_RECHECKOUT_BEGIN" : WSI_RECHECKOUT_BEGIN,
			    	    "WSI_RECEIVE_TIME_END" : WSI_RECEIVE_TIME_END,
			    	    "WSI_RECEIVE_TIME_BEGIN" : WSI_RECEIVE_TIME_BEGIN,
			    	    "dataAuth" : dataAuth,
			    	    "WSI_ITEM_SN" : WSI_ITEM_SN,
			    	    "WSI_ITEM_CODE" : WSI_ITEM_CODE,
			    	    "WSI_WH_CODE" : WSI_WH_CODE,
			    	    "WSI_DISTRICT_CODE" : WSI_DISTRICT_CODE,
			    	    "WSI_STORAGE_CODE" : WSI_STORAGE_CODE,
			    	    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    	},
			    	//data:"WSI_RECHECKOUT_END="+WSI_RECHECKOUT_END+"&WSI_RECHECKOUT_BEGIN="+WSI_RECHECKOUT_BEGIN+"&WSI_RECEIVE_TIME_END="+WSI_RECEIVE_TIME_END+"&WSI_RECEIVE_TIME_BEGIN="+WSI_RECEIVE_TIME_BEGIN+"&DATA_AUTH="+DATA_AUTH+"&WSI_ITEM_SN="+WSI_ITEM_SN+"&WSI_ITEM_CODE="+WSI_ITEM_CODE+"&WSI_WH_CODE="+WSI_WH_CODE+"&WSI_DISTRICT_CODE="+WSI_DISTRICT_CODE+"&WSI_STORAGE_CODE="+WSI_STORAGE_CODE+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	success:function(data){
            	util.closeLoading();
             $("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").empty();
            if(null==data){
                return;
            }
           
            if(null!=data.ajaxPage.dataList){
                var rccList = eval(data.ajaxPage.dataList);
                var outFlag="";
                for(var i=0;i<rccList.length;i++){
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].RECEIVE_TIME==null) rccList[i].RECEIVE_TIME="";
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].WSI_SUP_CODE==null) rccList[i].WSI_SUP_CODE="";
								if(rccList[i].WSI_CUST_CODE==null) rccList[i].WSI_CUST_CODE="";
								if(rccList[i].WSI_WH_CODE==null) rccList[i].WSI_WH_CODE="";
								if(rccList[i].WSI_DISTRICT_CODE==null) rccList[i].WSI_DISTRICT_CODE="";
								if(rccList[i].WSI_STORAGE_CODE==null) rccList[i].WSI_STORAGE_CODE="";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								if(rccList[i].DEPT_NAME==null) rccList[i].DEPT_NAME="";
								if(rccList[i].OUTTIME==null) outFlag="";
								if(rccList[i].OUTTIME=='超期') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='正常') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='预警') outFlag="<span colno='WMI_STATUS' class='' style='width:5px;' ></span><span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px;text-align:center;'>"+rccList[i].OUTTIME+"</span>";
								if(rccList[i].OUTTIME=='3') outFlag="";
								if(rccList[i].CI_REMIND_DAYS==null) rccList[i].CI_REMIND_DAYS="";
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"<input type='hidden' id='DATA_AUTH"+rccList[i].ID+"' value='"+rccList[i].DEPT_NAME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: left;' title='"+rccList[i].WSI_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span><input type='hidden' id='WSI_ITEM_SN"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_SN+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;text-align: center;'>"+outFlag+"<input type='hidden' id='OUTTIME"+rccList[i].ID+"' value='"+rccList[i].OUTTIME+"'/><input type='hidden' id='WSI_WH_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_WH_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:110px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"<input type='hidden' id='WH_NAME"+rccList[i].ID+"' value='"+rccList[i].WH_NAME+"'/><input type='hidden' id='WSI_DISTRICT_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_DISTRICT_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"<input type='hidden' id='WSI_ITEM_NUM"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_NUM+"'/><input type='hidden' id='WSI_STORAGE_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_STORAGE_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"<input type='hidden' id='CI_RECHECK_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_RECHECK_DAYS+"'/></td>");
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:140px;text-align: center;' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"<input type='hidden' id='RECHECKOUT"+rccList[i].ID+"' value='"+rccList[i].RECHECKOUT+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:140px;text-align: center;' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"<input type='hidden' id='TEST_TIME"+rccList[i].ID+"' value='"+rccList[i].TEST_TIME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:100px;text-align: right;' title='"+rccList[i].CI_REMIND_DAYS+"'>"+rccList[i].CI_REMIND_DAYS+"<input type='hidden' id='CI_REMIND_DAYS"+rccList[i].ID+"' value='"+rccList[i].CI_REMIND_DAYS+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:150px;text-align: right;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump2(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span><input type='hidden' id='WSI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_ITEM_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:120px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:120px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:120px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"<input type='hidden' id='WSI_LOT_NO"+rccList[i].ID+"' value='"+rccList[i].WSI_LOT_NO+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"<input type='hidden' id='CUSTOMER"+rccList[i].ID+"' value='"+rccList[i].CUSTOMER+"'/><input type='hidden' id='WSI_CUST_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_CUST_CODE+"'/></td>");
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"<input type='hidden' id='SUPPLIER_NAME"+rccList[i].ID+"' value='"+rccList[i].SUPPLIER_NAME+"'/><input type='hidden' id='WSI_SUP_CODE"+rccList[i].ID+"' value='"+rccList[i].WSI_SUP_CODE+"'/></td>");
	
								
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:140px;text-align: center;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"<input type='hidden' id='RECEIVE_TIME"+rccList[i].ID+"' value='"+rccList[i].RECEIVE_TIME+"'/></td>");
								
							}
							
						}
						    pageFun(data.ajaxPage,"formId2");
						//	var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31 tbody tr");
							var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31  tr");
							_tongLineColor(tableTrJs);
						//	clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31');
						defTableWidthRewrite("0b6208aca3fe40d5bc66a4c230c32d31");
                        setPopScroll('.scorl1','.head1');
				
        },
			    	error:function(msg){
			    	    util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    	    
			    	}
            });
    	}

//点击行寄选中该行
function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>
//物料追溯
function itemJump1(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//物料信息
function itemJump2(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    //setPopScroll('.scorl1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

