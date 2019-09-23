<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="工序信息" />
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
		<bu:header formId ="f4bff8054eec43dd9b7ffe75eb0f03ac"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b074327f728643948b734bce9a5f7fc9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="b074327f728643948b734bce9a5f7fc9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPagef4bff8054eec43dd9b7ffe75eb0f03ac" id="formPagef4bff8054eec43dd9b7ffe75eb0f03ac" value="${formPagef4bff8054eec43dd9b7ffe75eb0f03ac}"/>
		<input type="hidden" name="formId" id="formId1" value='f4bff8054eec43dd9b7ffe75eb0f03ac'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f4bff8054eec43dd9b7ffe75eb0f03ac">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf4bff8054eec43dd9b7ffe75eb0f03ac" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef4bff8054eec43dd9b7ffe75eb0f03ac">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="f4bff8054eec43dd9b7ffe75eb0f03ac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f4bff8054eec43dd9b7ffe75eb0f03ac" onclick="_selectAjaxTableAllData(this,'f4bff8054eec43dd9b7ffe75eb0f03ac')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf4bff8054eec43dd9b7ffe75eb0f03ac" onscroll="ajaxTableScroll(this,'f4bff8054eec43dd9b7ffe75eb0f03ac')" style="overflow-x:hidden;">
		<table class="datagrid-btable fixedTable query-list dblClick"  id="datagrid-btable-ajaxf4bff8054eec43dd9b7ffe75eb0f03ac" style="table-layout:fixed;">
		<tbody id="tbody_f4bff8054eec43dd9b7ffe75eb0f03ac" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef4bff8054eec43dd9b7ffe75eb0f03ac==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f4bff8054eec43dd9b7ffe75eb0f03ac&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b074327f728643948b734bce9a5f7fc9" />
		<bu:script viewId="b074327f728643948b734bce9a5f7fc9" />
    <script type="text/javascript">
    
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms";
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
            data:$("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(currentPage>20){
                        setTableHeight(formId);
                    }
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
    
    // 清空表格
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
    function setTableHeight(){
        $(".datagrid-htable").css("width",$(".datagrid-header").width()-20+'px');
        $(".datagrid-btable").css("width",$(".datagrid-header").width()-20+'px');
    }
    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    // 清空全选
    function clearAllSelect(){
    	$(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }
    
    // 子列表
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
    
    // 初始化子分页
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
    
    
    // 初始化分页插件
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
    
    // 判断是否首次异步访问
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    // 初始化子表单
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
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='f4bff8054eec43dd9b7ffe75eb0f03ac'){<%--工序信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrHtml.push("<td colno='GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_CODE')+"' style='"+ms.tdStyle(formId, 'GROUP_CODE')+"' "+ms.tdEvent(formId, 'GROUP_CODE')+">")
                arrHtml.push("<span colno='GROUP_CODE' class='"+ms.uiClass(formId, 'GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'GROUP_CODE')+"' "+ms.uiEvent(formId, 'GROUP_CODE')+" >"+v['GROUP_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='GROUP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_NAME')+"' style='"+ms.tdStyle(formId, 'GROUP_NAME')+"' "+ms.tdEvent(formId, 'GROUP_NAME')+">")
                arrHtml.push("<span colno='GROUP_NAME' class='"+ms.uiClass(formId, 'GROUP_NAME')+"' style='"+ms.uiStyle(formId, 'GROUP_NAME')+"' "+ms.uiEvent(formId, 'GROUP_NAME')+" >"+v['GROUP_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'VALID_FLAG')+"' style='"+ms.tdStyle(formId, 'VALID_FLAG')+"' "+ms.tdEvent(formId, 'VALID_FLAG')+">")
                arrHtml.push("<span colno='VALID_FLAG' class='"+ms.uiClass(formId, 'VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'VALID_FLAG')+"' "+ms.uiEvent(formId, 'VALID_FLAG')+" >"+v['VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MS_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MS_CODE')+"' style='"+ms.tdStyle(formId, 'MS_CODE')+"' "+ms.tdEvent(formId, 'MS_CODE')+">")
                arrHtml.push("<span colno='MS_CODE' class='"+ms.uiClass(formId, 'MS_CODE')+"' style='"+ms.uiStyle(formId, 'MS_CODE')+"' "+ms.uiEvent(formId, 'MS_CODE')+" >"+v['MS_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='GROUP_DESC' class='datagrid-cell "+ms.tdClass(formId, 'GROUP_DESC')+"' style='"+ms.tdStyle(formId, 'GROUP_DESC')+"' "+ms.tdEvent(formId, 'GROUP_DESC')+">")
                arrHtml.push("<span colno='GROUP_DESC' class='"+ms.uiClass(formId, 'GROUP_DESC')+"' style='"+ms.uiStyle(formId, 'GROUP_DESC')+"' "+ms.uiEvent(formId, 'GROUP_DESC')+" >"+v['GROUP_DESC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
