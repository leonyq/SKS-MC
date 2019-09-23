<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="二级tab测试-zm" />
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
		<bu:header formId ="d4548e7767164027a4b60622c3cb5148"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="e52fed31c20b42b98e94dbaaaa7acea8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="e52fed31c20b42b98e94dbaaaa7acea8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPaged4548e7767164027a4b60622c3cb5148" id="formPaged4548e7767164027a4b60622c3cb5148" value="${formPaged4548e7767164027a4b60622c3cb5148}"/>
		<input type="hidden" name="formId" id="formId1" value='d4548e7767164027a4b60622c3cb5148'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='7c40fe9c50a245a98d8c6d30f3376c6b,58a744575c084bd299a2beb5b7185afb,e5b8cf8f28a9479485d5b3529cbf8ebd'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='a7943526d22e42d8bb779d55ef0b0f93,73d56e9b50c340719c4b3688177ceac4,f4a260f7946d4aeebfbe49b03646153e'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d4548e7767164027a4b60622c3cb5148">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd4548e7767164027a4b60622c3cb5148" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd4548e7767164027a4b60622c3cb5148">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled4548e7767164027a4b60622c3cb5148">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d4548e7767164027a4b60622c3cb5148" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d4548e7767164027a4b60622c3cb5148" onclick="_selectAjaxTableAllData(this,'d4548e7767164027a4b60622c3cb5148')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="d4548e7767164027a4b60622c3cb5148" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="d4548e7767164027a4b60622c3cb5148" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="d4548e7767164027a4b60622c3cb5148" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="d4548e7767164027a4b60622c3cb5148" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST5" formId="d4548e7767164027a4b60622c3cb5148" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd4548e7767164027a4b60622c3cb5148" onscroll="ajaxTableScroll(this,'d4548e7767164027a4b60622c3cb5148')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd4548e7767164027a4b60622c3cb5148">
		<tbody id="tbody_d4548e7767164027a4b60622c3cb5148" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged4548e7767164027a4b60622c3cb5148==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d4548e7767164027a4b60622c3cb5148&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPagea7943526d22e42d8bb779d55ef0b0f93" id="formPagea7943526d22e42d8bb779d55ef0b0f93" value="${formPagea7943526d22e42d8bb779d55ef0b0f93}"/>
		<input type="hidden" name="formId" id="formId2" value='a7943526d22e42d8bb779d55ef0b0f93'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a7943526d22e42d8bb779d55ef0b0f93">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa7943526d22e42d8bb779d55ef0b0f93" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera7943526d22e42d8bb779d55ef0b0f93">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea7943526d22e42d8bb779d55ef0b0f93">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a7943526d22e42d8bb779d55ef0b0f93" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a7943526d22e42d8bb779d55ef0b0f93" onclick="_selectAjaxTableAllData(this,'a7943526d22e42d8bb779d55ef0b0f93')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="a7943526d22e42d8bb779d55ef0b0f93" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="a7943526d22e42d8bb779d55ef0b0f93" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="a7943526d22e42d8bb779d55ef0b0f93" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="a7943526d22e42d8bb779d55ef0b0f93" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST5" formId="a7943526d22e42d8bb779d55ef0b0f93" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva7943526d22e42d8bb779d55ef0b0f93" onscroll="ajaxTableScroll(this,'a7943526d22e42d8bb779d55ef0b0f93')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa7943526d22e42d8bb779d55ef0b0f93">
		<tbody id="tbody_a7943526d22e42d8bb779d55ef0b0f93" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea7943526d22e42d8bb779d55ef0b0f93==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=a7943526d22e42d8bb779d55ef0b0f93&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage73d56e9b50c340719c4b3688177ceac4" id="formPage73d56e9b50c340719c4b3688177ceac4" value="${formPage73d56e9b50c340719c4b3688177ceac4}"/>
		<input type="hidden" name="formId" id="formId3" value='73d56e9b50c340719c4b3688177ceac4'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="73d56e9b50c340719c4b3688177ceac4">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax73d56e9b50c340719c4b3688177ceac4" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner73d56e9b50c340719c4b3688177ceac4">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable73d56e9b50c340719c4b3688177ceac4">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="73d56e9b50c340719c4b3688177ceac4" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_73d56e9b50c340719c4b3688177ceac4" onclick="_selectAjaxTableAllData(this,'73d56e9b50c340719c4b3688177ceac4')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="73d56e9b50c340719c4b3688177ceac4" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="73d56e9b50c340719c4b3688177ceac4" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="73d56e9b50c340719c4b3688177ceac4" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="73d56e9b50c340719c4b3688177ceac4" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST5" formId="73d56e9b50c340719c4b3688177ceac4" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv73d56e9b50c340719c4b3688177ceac4" onscroll="ajaxTableScroll(this,'73d56e9b50c340719c4b3688177ceac4')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax73d56e9b50c340719c4b3688177ceac4">
		<tbody id="tbody_73d56e9b50c340719c4b3688177ceac4" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage73d56e9b50c340719c4b3688177ceac4==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=73d56e9b50c340719c4b3688177ceac4&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPagef4a260f7946d4aeebfbe49b03646153e" id="formPagef4a260f7946d4aeebfbe49b03646153e" value="${formPagef4a260f7946d4aeebfbe49b03646153e}"/>
		<input type="hidden" name="formId" id="formId4" value='f4a260f7946d4aeebfbe49b03646153e'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f4a260f7946d4aeebfbe49b03646153e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf4a260f7946d4aeebfbe49b03646153e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerf4a260f7946d4aeebfbe49b03646153e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef4a260f7946d4aeebfbe49b03646153e">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="f4a260f7946d4aeebfbe49b03646153e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f4a260f7946d4aeebfbe49b03646153e" onclick="_selectAjaxTableAllData(this,'f4a260f7946d4aeebfbe49b03646153e')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST1" formId="f4a260f7946d4aeebfbe49b03646153e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST2" formId="f4a260f7946d4aeebfbe49b03646153e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST3" formId="f4a260f7946d4aeebfbe49b03646153e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST4" formId="f4a260f7946d4aeebfbe49b03646153e" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEST5" formId="f4a260f7946d4aeebfbe49b03646153e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf4a260f7946d4aeebfbe49b03646153e" onscroll="ajaxTableScroll(this,'f4a260f7946d4aeebfbe49b03646153e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxf4a260f7946d4aeebfbe49b03646153e">
		<tbody id="tbody_f4a260f7946d4aeebfbe49b03646153e" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef4a260f7946d4aeebfbe49b03646153e==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=f4a260f7946d4aeebfbe49b03646153e&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID,ID,ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='4' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e52fed31c20b42b98e94dbaaaa7acea8" />
		<bu:script viewId="e52fed31c20b42b98e94dbaaaa7acea8" />
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
    
    <%-- 初始化表格宽度 --%>
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
    if(formId=='d4548e7767164027a4b60622c3cb5148'){<%--二级tab主表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST4' class='datagrid-cell "+ms.tdClass(formId, 'TEST4')+"' style='"+ms.tdStyle(formId, 'TEST4')+"' "+ms.tdEvent(formId, 'TEST4')+">")
            arrHtml.push("<span colno='TEST4' class='"+ms.uiClass(formId, 'TEST4')+"' style='"+ms.uiStyle(formId, 'TEST4')+"' "+ms.uiEvent(formId, 'TEST4')+" >"+v['TEST4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST5' class='datagrid-cell "+ms.tdClass(formId, 'TEST5')+"' style='"+ms.tdStyle(formId, 'TEST5')+"' "+ms.tdEvent(formId, 'TEST5')+">")
            arrHtml.push("<span colno='TEST5' class='"+ms.uiClass(formId, 'TEST5')+"' style='"+ms.uiStyle(formId, 'TEST5')+"' "+ms.uiEvent(formId, 'TEST5')+" >"+v['TEST5']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='a7943526d22e42d8bb779d55ef0b0f93'){<%--二级tab子表1--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST4' class='datagrid-cell "+ms.tdClass(formId, 'TEST4')+"' style='"+ms.tdStyle(formId, 'TEST4')+"' "+ms.tdEvent(formId, 'TEST4')+">")
            arrHtml.push("<span colno='TEST4' class='"+ms.uiClass(formId, 'TEST4')+"' style='"+ms.uiStyle(formId, 'TEST4')+"' "+ms.uiEvent(formId, 'TEST4')+" >"+v['TEST4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST5' class='datagrid-cell "+ms.tdClass(formId, 'TEST5')+"' style='"+ms.tdStyle(formId, 'TEST5')+"' "+ms.tdEvent(formId, 'TEST5')+">")
            arrHtml.push("<span colno='TEST5' class='"+ms.uiClass(formId, 'TEST5')+"' style='"+ms.uiStyle(formId, 'TEST5')+"' "+ms.uiEvent(formId, 'TEST5')+" >"+v['TEST5']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='73d56e9b50c340719c4b3688177ceac4'){<%--二级tab子表2--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST4' class='datagrid-cell "+ms.tdClass(formId, 'TEST4')+"' style='"+ms.tdStyle(formId, 'TEST4')+"' "+ms.tdEvent(formId, 'TEST4')+">")
            arrHtml.push("<span colno='TEST4' class='"+ms.uiClass(formId, 'TEST4')+"' style='"+ms.uiStyle(formId, 'TEST4')+"' "+ms.uiEvent(formId, 'TEST4')+" >"+v['TEST4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST5' class='datagrid-cell "+ms.tdClass(formId, 'TEST5')+"' style='"+ms.tdStyle(formId, 'TEST5')+"' "+ms.tdEvent(formId, 'TEST5')+">")
            arrHtml.push("<span colno='TEST5' class='"+ms.uiClass(formId, 'TEST5')+"' style='"+ms.uiStyle(formId, 'TEST5')+"' "+ms.uiEvent(formId, 'TEST5')+" >"+v['TEST5']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='f4a260f7946d4aeebfbe49b03646153e'){<%--二级tab子表3--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST1' class='datagrid-cell "+ms.tdClass(formId, 'TEST1')+"' style='"+ms.tdStyle(formId, 'TEST1')+"' "+ms.tdEvent(formId, 'TEST1')+">")
            arrHtml.push("<span colno='TEST1' class='"+ms.uiClass(formId, 'TEST1')+"' style='"+ms.uiStyle(formId, 'TEST1')+"' "+ms.uiEvent(formId, 'TEST1')+" >"+v['TEST1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST2' class='datagrid-cell "+ms.tdClass(formId, 'TEST2')+"' style='"+ms.tdStyle(formId, 'TEST2')+"' "+ms.tdEvent(formId, 'TEST2')+">")
            arrHtml.push("<span colno='TEST2' class='"+ms.uiClass(formId, 'TEST2')+"' style='"+ms.uiStyle(formId, 'TEST2')+"' "+ms.uiEvent(formId, 'TEST2')+" >"+v['TEST2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST3' class='datagrid-cell "+ms.tdClass(formId, 'TEST3')+"' style='"+ms.tdStyle(formId, 'TEST3')+"' "+ms.tdEvent(formId, 'TEST3')+">")
            arrHtml.push("<span colno='TEST3' class='"+ms.uiClass(formId, 'TEST3')+"' style='"+ms.uiStyle(formId, 'TEST3')+"' "+ms.uiEvent(formId, 'TEST3')+" >"+v['TEST3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST4' class='datagrid-cell "+ms.tdClass(formId, 'TEST4')+"' style='"+ms.tdStyle(formId, 'TEST4')+"' "+ms.tdEvent(formId, 'TEST4')+">")
            arrHtml.push("<span colno='TEST4' class='"+ms.uiClass(formId, 'TEST4')+"' style='"+ms.uiStyle(formId, 'TEST4')+"' "+ms.uiEvent(formId, 'TEST4')+" >"+v['TEST4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEST5' class='datagrid-cell "+ms.tdClass(formId, 'TEST5')+"' style='"+ms.tdStyle(formId, 'TEST5')+"' "+ms.tdEvent(formId, 'TEST5')+">")
            arrHtml.push("<span colno='TEST5' class='"+ms.uiClass(formId, 'TEST5')+"' style='"+ms.uiStyle(formId, 'TEST5')+"' "+ms.uiEvent(formId, 'TEST5')+" >"+v['TEST5']+"</span>")
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
