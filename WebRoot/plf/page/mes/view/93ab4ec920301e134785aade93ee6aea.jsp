<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-辅料制具料号-列表" />
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
		<bu:header formId ="e09e1f47e824490d80ba2717d25498d3"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8d8dfef2f0e140e88073f6cdad4b431d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="8d8dfef2f0e140e88073f6cdad4b431d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPagee09e1f47e824490d80ba2717d25498d3" id="formPagee09e1f47e824490d80ba2717d25498d3" value="${formPagee09e1f47e824490d80ba2717d25498d3}"/>
		<input type="hidden" name="formId" id="formId1" value='e09e1f47e824490d80ba2717d25498d3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e09e1f47e824490d80ba2717d25498d3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe09e1f47e824490d80ba2717d25498d3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere09e1f47e824490d80ba2717d25498d3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee09e1f47e824490d80ba2717d25498d3" style="width:2130px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="e09e1f47e824490d80ba2717d25498d3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e09e1f47e824490d80ba2717d25498d3" onclick="_selectAjaxTableAllData(this,'e09e1f47e824490d80ba2717d25498d3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="ASSISTANTTOOLNO" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="ASSISTANTTOOLNAME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="ASSISTANTTOOLTYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="ASSISTANTLEASTCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="TIN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="TIN_OPEN_DISCARD_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="ASSISTANTTOOLCOUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="TIN_BACK_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="TIN_DURING_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="BARD_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="MAX_USE_COUNT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="LEAD_FLAG" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="ASSISTANTMODEL" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="FIX_MT_TYPE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="FIX_MT_CYCLE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="FIX_CLCLE_UNIT" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell"  style="width:110px;"><bu:uitn colNo="FIX_MT_REMIND" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="TIN_BAR_RULE" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="TIN_USE_TIME" formId="e09e1f47e824490d80ba2717d25498d3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive09e1f47e824490d80ba2717d25498d3" onscroll="ajaxTableScroll(this,'e09e1f47e824490d80ba2717d25498d3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe09e1f47e824490d80ba2717d25498d3" style="width:2110px;">
		<tbody id="tbody_e09e1f47e824490d80ba2717d25498d3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee09e1f47e824490d80ba2717d25498d3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e09e1f47e824490d80ba2717d25498d3&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8d8dfef2f0e140e88073f6cdad4b431d" />
		<bu:script viewId="8d8dfef2f0e140e88073f6cdad4b431d" />
    <script type="text/javascript">
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
        var url = "${path}buss/bussModel_listMsData.ms";
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
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    <%--判断是否分页--%>
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    <%--查询--%>
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }
    
    <%--清空表格--%>
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
   <%--当出现滚动条时动态设置表格宽度 --%>
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
    
    <%--清空全选 --%>
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }
    
    <%--子列表 --%>
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
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
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
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    <%-- 数据为空时设置横向滚动条 --%>
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
    
    <%-- 初始化子分页 --%>
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
    
    
    <%-- 初始化分页插件 --%>
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
    
    <%-- 判断是否首次异步访问 --%>
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    <%-- 初始化子表单 --%>
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
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
                    var childVal = $("tr[abbr='"+abbr+"']").find("input[type='hidden']").val();
                    relColVals += childVal+",";
                });
                setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
            });
        };
    });
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
    if(formId=='e09e1f47e824490d80ba2717d25498d3'){<%--辅料制具料号信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLNO' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLNO')+"' style='width:110px;"+ms.tdStyle(formId, 'ASSISTANTTOOLNO')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLNO')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLNO' class='"+ms.uiClass(formId, 'ASSISTANTTOOLNO')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLNO')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLNO')+" >"+v['ASSISTANTTOOLNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLNAME' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLNAME')+"' style='width:110px;"+ms.tdStyle(formId, 'ASSISTANTTOOLNAME')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLNAME')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLNAME' class='"+ms.uiClass(formId, 'ASSISTANTTOOLNAME')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLNAME')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLNAME')+" >"+v['ASSISTANTTOOLNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLSPEC' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLSPEC')+"' style='width:90px;"+ms.tdStyle(formId, 'ASSISTANTTOOLSPEC')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLSPEC')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLSPEC' class='"+ms.uiClass(formId, 'ASSISTANTTOOLSPEC')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLSPEC')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLSPEC')+" >"+v['ASSISTANTTOOLSPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLTYPE' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLTYPE')+"' style='width:110px;"+ms.tdStyle(formId, 'ASSISTANTTOOLTYPE')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLTYPE')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLTYPE' class='"+ms.uiClass(formId, 'ASSISTANTTOOLTYPE')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLTYPE')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLTYPE')+" >"+v['ASSISTANTTOOLTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTLEASTCOUNT' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTLEASTCOUNT')+"' style='width:90px;"+ms.tdStyle(formId, 'ASSISTANTLEASTCOUNT')+"' "+ms.tdEvent(formId, 'ASSISTANTLEASTCOUNT')+">")
            arrHtml.push("<span colno='ASSISTANTLEASTCOUNT' class='"+ms.uiClass(formId, 'ASSISTANTLEASTCOUNT')+"' style='"+ms.uiStyle(formId, 'ASSISTANTLEASTCOUNT')+"' "+ms.uiEvent(formId, 'ASSISTANTLEASTCOUNT')+" >"+v['ASSISTANTLEASTCOUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_DISCARD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIN_DISCARD_TIME')+"' style='width:90px;"+ms.tdStyle(formId, 'TIN_DISCARD_TIME')+"' "+ms.tdEvent(formId, 'TIN_DISCARD_TIME')+">")
            arrHtml.push("<span colno='TIN_DISCARD_TIME' class='"+ms.uiClass(formId, 'TIN_DISCARD_TIME')+"' style='"+ms.uiStyle(formId, 'TIN_DISCARD_TIME')+"' "+ms.uiEvent(formId, 'TIN_DISCARD_TIME')+" >"+v['TIN_DISCARD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_OPEN_DISCARD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIN_OPEN_DISCARD_TIME')+"' style='width:130px;"+ms.tdStyle(formId, 'TIN_OPEN_DISCARD_TIME')+"' "+ms.tdEvent(formId, 'TIN_OPEN_DISCARD_TIME')+">")
            arrHtml.push("<span colno='TIN_OPEN_DISCARD_TIME' class='"+ms.uiClass(formId, 'TIN_OPEN_DISCARD_TIME')+"' style='"+ms.uiStyle(formId, 'TIN_OPEN_DISCARD_TIME')+"' "+ms.uiEvent(formId, 'TIN_OPEN_DISCARD_TIME')+" >"+v['TIN_DISCARD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTTOOLCOUNT' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTTOOLCOUNT')+"' style='width:90px;"+ms.tdStyle(formId, 'ASSISTANTTOOLCOUNT')+"' "+ms.tdEvent(formId, 'ASSISTANTTOOLCOUNT')+">")
            arrHtml.push("<span colno='ASSISTANTTOOLCOUNT' class='"+ms.uiClass(formId, 'ASSISTANTTOOLCOUNT')+"' style='"+ms.uiStyle(formId, 'ASSISTANTTOOLCOUNT')+"' "+ms.uiEvent(formId, 'ASSISTANTTOOLCOUNT')+" >"+v['ASSISTANTTOOLCOUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_BACK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIN_BACK_TIME')+"' style='width:110px;"+ms.tdStyle(formId, 'TIN_BACK_TIME')+"' "+ms.tdEvent(formId, 'TIN_BACK_TIME')+">")
            arrHtml.push("<span colno='TIN_BACK_TIME' class='"+ms.uiClass(formId, 'TIN_BACK_TIME')+"' style='"+ms.uiStyle(formId, 'TIN_BACK_TIME')+"' "+ms.uiEvent(formId, 'TIN_BACK_TIME')+" >"+v['TIN_BACK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_DURING_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIN_DURING_TIME')+"' style='width:110px;"+ms.tdStyle(formId, 'TIN_DURING_TIME')+"' "+ms.tdEvent(formId, 'TIN_DURING_TIME')+">")
            arrHtml.push("<span colno='TIN_DURING_TIME' class='"+ms.uiClass(formId, 'TIN_DURING_TIME')+"' style='"+ms.uiStyle(formId, 'TIN_DURING_TIME')+"' "+ms.uiEvent(formId, 'TIN_DURING_TIME')+" >"+v['TIN_DURING_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BARD_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'BARD_COUNT')+"' style='width:90px;"+ms.tdStyle(formId, 'BARD_COUNT')+"' "+ms.tdEvent(formId, 'BARD_COUNT')+">")
            arrHtml.push("<span colno='BARD_COUNT' class='"+ms.uiClass(formId, 'BARD_COUNT')+"' style='"+ms.uiStyle(formId, 'BARD_COUNT')+"' "+ms.uiEvent(formId, 'BARD_COUNT')+" >"+v['BARD_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MAX_USE_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'MAX_USE_COUNT')+"' style='width:100px;"+ms.tdStyle(formId, 'MAX_USE_COUNT')+"' "+ms.tdEvent(formId, 'MAX_USE_COUNT')+">")
            arrHtml.push("<span colno='MAX_USE_COUNT' class='"+ms.uiClass(formId, 'MAX_USE_COUNT')+"' style='"+ms.uiStyle(formId, 'MAX_USE_COUNT')+"' "+ms.uiEvent(formId, 'MAX_USE_COUNT')+" >"+v['MAX_USE_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LEAD_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'LEAD_FLAG')+"' style='width:90px;"+ms.tdStyle(formId, 'LEAD_FLAG')+"' "+ms.tdEvent(formId, 'LEAD_FLAG')+">")
            arrHtml.push("<span colno='LEAD_FLAG' class='"+ms.uiClass(formId, 'LEAD_FLAG')+"' style='"+ms.uiStyle(formId, 'LEAD_FLAG')+"' "+ms.uiEvent(formId, 'LEAD_FLAG')+" >"+v['LEAD_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSISTANTMODEL' class='datagrid-cell "+ms.tdClass(formId, 'ASSISTANTMODEL')+"' style='width:90px;"+ms.tdStyle(formId, 'ASSISTANTMODEL')+"' "+ms.tdEvent(formId, 'ASSISTANTMODEL')+">")
            arrHtml.push("<span colno='ASSISTANTMODEL' class='"+ms.uiClass(formId, 'ASSISTANTMODEL')+"' style='"+ms.uiStyle(formId, 'ASSISTANTMODEL')+"' "+ms.uiEvent(formId, 'ASSISTANTMODEL')+" >"+v['ASSISTANTMODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FIX_MT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'FIX_MT_TYPE')+"' style='width:100px;"+ms.tdStyle(formId, 'FIX_MT_TYPE')+"' "+ms.tdEvent(formId, 'FIX_MT_TYPE')+">")
            arrHtml.push("<span colno='FIX_MT_TYPE' class='"+ms.uiClass(formId, 'FIX_MT_TYPE')+"' style='"+ms.uiStyle(formId, 'FIX_MT_TYPE')+"' "+ms.uiEvent(formId, 'FIX_MT_TYPE')+" >"+v['FIX_MT_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FIX_MT_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'FIX_MT_CYCLE')+"' style='width:120px;"+ms.tdStyle(formId, 'FIX_MT_CYCLE')+"' "+ms.tdEvent(formId, 'FIX_MT_CYCLE')+">")
            arrHtml.push("<span colno='FIX_MT_CYCLE' class='"+ms.uiClass(formId, 'FIX_MT_CYCLE')+"' style='"+ms.uiStyle(formId, 'FIX_MT_CYCLE')+"' "+ms.uiEvent(formId, 'FIX_MT_CYCLE')+" >"+v['FIX_MT_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FIX_CLCLE_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'FIX_CLCLE_UNIT')+"' style='width:100px;"+ms.tdStyle(formId, 'FIX_CLCLE_UNIT')+"' "+ms.tdEvent(formId, 'FIX_CLCLE_UNIT')+">")
            arrHtml.push("<span colno='FIX_CLCLE_UNIT' class='"+ms.uiClass(formId, 'FIX_CLCLE_UNIT')+"' style='"+ms.uiStyle(formId, 'FIX_CLCLE_UNIT')+"' "+ms.uiEvent(formId, 'FIX_CLCLE_UNIT')+" >"+v['FIX_CLCLE_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FIX_MT_REMIND' class='datagrid-cell "+ms.tdClass(formId, 'FIX_MT_REMIND')+"' style='width:110px;"+ms.tdStyle(formId, 'FIX_MT_REMIND')+"' "+ms.tdEvent(formId, 'FIX_MT_REMIND')+">")
            arrHtml.push("<span colno='FIX_MT_REMIND' class='"+ms.uiClass(formId, 'FIX_MT_REMIND')+"' style='"+ms.uiStyle(formId, 'FIX_MT_REMIND')+"' "+ms.uiEvent(formId, 'FIX_MT_REMIND')+" >"+v['FIX_MT_REMIND']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_BAR_RULE' class='datagrid-cell "+ms.tdClass(formId, 'TIN_BAR_RULE')+"' style='width:90px;"+ms.tdStyle(formId, 'TIN_BAR_RULE')+"' "+ms.tdEvent(formId, 'TIN_BAR_RULE')+">")
            arrHtml.push("<span colno='TIN_BAR_RULE' class='"+ms.uiClass(formId, 'TIN_BAR_RULE')+"' style='"+ms.uiStyle(formId, 'TIN_BAR_RULE')+"' "+ms.uiEvent(formId, 'TIN_BAR_RULE')+" >"+v['TIN_BAR_RULE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIN_USE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIN_USE_TIME')+"' style='"+ms.tdStyle(formId, 'TIN_USE_TIME')+"' "+ms.tdEvent(formId, 'TIN_USE_TIME')+">")
            arrHtml.push("<span colno='TIN_USE_TIME' class='"+ms.uiClass(formId, 'TIN_USE_TIME')+"' style='"+ms.uiStyle(formId, 'TIN_USE_TIME')+"' "+ms.uiEvent(formId, 'TIN_USE_TIME')+" >"+v['TIN_USE_TIME']+"</span>")
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
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
