<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <title>
        <dict:lang value="VM-PCB板关联"/>
    </title>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
        <jsp:param name="msData" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp" %>
    <bu:header formId="f8f38593803b49eda68064fc7a5b0169"/>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;">
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="5ebf76ff0e4e42efbd5717e76a1a6ebd"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>
                    <bu:search viewId="5ebf76ff0e4e42efbd5717e76a1a6ebd"/>
                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPagef8f38593803b49eda68064fc7a5b0169" id="formPagef8f38593803b49eda68064fc7a5b0169" value="${formPagef8f38593803b49eda68064fc7a5b0169}"/>
                <input type="hidden" name="formId" id="formId1" value='f8f38593803b49eda68064fc7a5b0169'/>

                <input type="hidden" id="subRelColIds" name="subRelColIds" value='c3cb120a7bb649e89bfeac8963810534'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='1e386669daf84b4c8c5cd1e7a15e700f'/>
                <input type="hidden" id="pcbaId" name="pcbaId" value=''/>
                <div class="panel-ajax datagrid datagrid-div1" id="f8f38593803b49eda68064fc7a5b0169">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf8f38593803b49eda68064fc7a5b0169" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner head1" id="datagrid-header-innerf8f38593803b49eda68064fc7a5b0169">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef8f38593803b49eda68064fc7a5b0169">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="f8f38593803b49eda68064fc7a5b0169" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_f8f38593803b49eda68064fc7a5b0169" onclick="_selectAjaxTableAllData(this,'f8f38593803b49eda68064fc7a5b0169')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td class="datagrid-cell" style="width:200px">
                                            <bu:uitn colNo="DATA_AUTH" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:170px">
                                            <bu:uitn colNo="WPI_PCB_SN" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <!--<td class="datagrid-cell"><bu:uitn colNo="SPLIT_GROUP_ID" formId="f8f38593803b49eda68064fc7a5b0169"/></td>-->
                                        <td class="datagrid-cell" style="width:130px">
                                            <bu:uitn colNo="WPI_ITEM_CODE" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:150px">
                                            <bu:uitn colNo="WPI_ITEM_NAME" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:90px">
                                            <bu:uitn colNo="WPI_ITEM_SPEC" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:80px">
                                            <bu:uitn colNo="WPI_ITEM_COUNT" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:90px">
                                            <bu:uitn colNo="WPI_ITEM_SUPPLIERS" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:170px">
                                            <bu:uitn colNo="WPI_MO_NUMBER" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:70px">
                                            <bu:uitn colNo="WPI_LOT_NUMBER" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:70px">
                                            <bu:uitn colNo="WPI_ITEM_MARK_CODE" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:70px">
                                            <bu:uitn colNo="WPI_TRACE_FLAG" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:80px">
                                            <bu:uitn colNo="WPI_EMP" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                        <td class="datagrid-cell" style="width:140px">
                                            <bu:uitn colNo="WPI_TIME" formId="f8f38593803b49eda68064fc7a5b0169"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDivf8f38593803b49eda68064fc7a5b0169" onscroll="ajaxTableScroll(this,'f8f38593803b49eda68064fc7a5b0169')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxf8f38593803b49eda68064fc7a5b0169">
                                <tbody id="tbody_f8f38593803b49eda68064fc7a5b0169" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPagef8f38593803b49eda68064fc7a5b0169==1}">
                <div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f8f38593803b49eda68064fc7a5b0169&showLoading=0"/>
                </div>
                </c:if>
                <div class="panel-ajax datagrid datagrid-div1" id="1e386669daf84b4c8c5cd1e7a15e700f" style="margin-top:10px;">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1e386669daf84b4c8c5cd1e7a15e700f" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner head2" id="datagrid-header-inner1e386669daf84b4c8c5cd1e7a15e700f">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1e386669daf84b4c8c5cd1e7a15e700f">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="1e386669daf84b4c8c5cd1e7a15e700f" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_1e386669daf84b4c8c5cd1e7a15e700f" onclick="_selectAjaxTableAllData(this,'1e386669daf84b4c8c5cd1e7a15e700f')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="OLD_SN" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="NEW_SN" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <!--<td class="datagrid-cell"><bu:uitn colNo="SPLIT_GROUP_ID" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>-->
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="MO_NUMBER" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="LINK_NUM" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="SPLIT_FLAG" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="SPLIT_EMP" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                        <td class="datagrid-cell">
                                            <bu:uitn colNo="SPLIT_TIME" formId="1e386669daf84b4c8c5cd1e7a15e700f"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv1e386669daf84b4c8c5cd1e7a15e700f" onscroll="ajaxTableScroll(this,'1e386669daf84b4c8c5cd1e7a15e700f')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f">
                                <tbody id="tbody_1e386669daf84b4c8c5cd1e7a15e700f" class="isChilds"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage1e386669daf84b4c8c5cd1e7a15e700f==1}">
                <div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listPcbaTablePage&formId=1e386669daf84b4c8c5cd1e7a15e700f&showLoading=0"/>
                </div>
                </c:if>
        </div>

        <input type="hidden" name="formPage1e386669daf84b4c8c5cd1e7a15e700f" id="formPage1e386669daf84b4c8c5cd1e7a15e700f" value="${formPage1e386669daf84b4c8c5cd1e7a15e700f}"/>
        <input type="hidden" name="formId" id="formId2" value='1e386669daf84b4c8c5cd1e7a15e700f'/>

    </div>

    <input type="hidden" id="relColVals" name="relColVals" value='SPLIT_GROUP_ID'/>
    <input type="hidden" name="tableCount" id="tableCount" value='2'/>

    </form>
</div>
</div></div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:submit viewId="5ebf76ff0e4e42efbd5717e76a1a6ebd"/> <bu:script viewId="5ebf76ff0e4e42efbd5717e76a1a6ebd"/>

<script type="text/javascript">

    function listAjaxTable(formId) {
        var currentPage = "";
        var pageRecord = "";
        var isFirstLoad;
        //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
        var url = "${path}/buss/bussModel_listMsData.ms";
        var searchParams = $("#searchForm").serialize() + "&" + $("#searchFormTop").serialize();
        if (isPage(formId)) {
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: searchParams + "&page.currentPage=" + currentPage + "&page.pageRecord=" + pageRecord,
            success: function (data) {
                if (data.RES) {
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms, formId);
                    if (isPage(formId)) {
                        initPage(page, formId);
                    }
                } else {
                    utilsFp.confirmIcon(3, "", "", "", data.RES_MSG, "", "260", "145");
                }
                clearChildTable();
                util.closeLoading();
            },
            error: function (msg) {
                util.closeLoading();
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }


    function isPage(formId) {
        var isPageVal = $("#formPage" + formId).val();
        if (isPageVal == "1") {
            return true;
        }
        return false;
    }


    function query(thisObj) {

        var formId = $("#formId1").val();
        // if( getDealSearchMultiTimeSlotBtn())
        if ($.trim($("#PCBA_SN").val()) == "" && $.trim($("#NEW_SN").val()) == "") {

            //重设滚动条
            $('.scroll2').mCustomScrollbar("destroy");
            setPopScroll('.scroll2', '.head2');

            listAjaxTable(formId);
            // getInfoPage(formId);
        } else {
            $('.scroll1').mCustomScrollbar("destroy");
            getInfoPage(formId);
            setPopScroll('.scroll1', '.head1');
        }

    }


    function clearChildTable() {
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }


    function setTableWidth(formId) {
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


    function alertInfo(msg) {
        //utilsFp.alert(msg);
        utilsFp.confirmIcon(3, "", "", "", msg, "", "350", "");

    }


    function clearAllSelect() {
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked", false);
    }

    function reloadPg(msg, title, width, height, time) {
        msgPop(msg, "", title, width, height, time);
    }


    function listChildAjaxTable(formId, paramList) {
        // $("#pcbaId").val(_GLO_FORM_PAGE_MAP[formId].relColVal);

        //   listPcbaTable($("#pcbaId").val());
        /*
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
   var url = "
        ${path}/buss/bussModel_listMsCasData.ms?exeid=5ebf76ff0e4e42efbd5717e76a1a6ebd";
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
                    */
    }


    function setCrossWiseScroll(formId, arrHtml) {
        if (arrHtml.length == 0) {
            var tableWidth = $("#datagrid-btable-ajax" + formId).width();
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth + "px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'></tr>");
            $("#tableDiv" + formId).css({"overflow-y": "hidden", "overflow-x": "auto"});
        } else {
            $("#tableDiv" + formId).css({"overflow-y": "auto", "overflow-x": "auto"});
        }
    }


    function initChildPage(formId) {
        var ajaxPage = new Object();
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage, formId);
    }


    function initPage(page, formId) {
        var ajaxPage = new Object();
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage, formId);
    };


    function firstLoadThisPage(formId) {
        if (typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) == "undefined") {
            return true;
        }
        return false;
    }


    function getFormIdInitChildPage() {
        var tableCount = $("#tableCount").val();
        for (var i = 2; i <= tableCount; i++) {
            var formId = $("#formId" + i).val();
            if (isPage(formId)) {
                initChildPage(formId);
            }
        }
    }


    function initTableWidth() {
        var width = $(window).width() - 2;
        $(".datagrid-htable,.datagrid-btable").width(width);
    }


    function init() {
        if ($(".leftTable-ajax").length > 0) {
            $(".leftTable-ajax").show();
        }
        ;
        getFormIdInitChildPage();
        initTableWidth();
        $("#WPI_TIME_BEGIN").val(timeBeginString());

        $("#WPI_TIME_END").val(timeEndString());
        listAjaxTable($("#formId1").val());

    }

    function timeBeginString() {
        var datetime = new Date();
        //datetime.setDate(datetime.getDate()-360);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        date = date < 10 ? "0" + date : date;
        if (0 >= date && date <= 7) {
            //  console.log(getEndDay());
            date = getEndDay(date);
            month = datetime.getMonth() < 10 ? "0" + (datetime.getMonth()) : datetime.getMonth();
        }
        return year + "-" + (month - 1) + "-" + date + " 00:00:00";
    }

    function timeEndString() {
        var datetime = new Date();
        //datetime.setDate(datetime.getDate()+360);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;

        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();

        return year + "-" + month + "-" + date + " 23:59:59";
    }

    function getEndDay(date1) {
        //构造当前日期对象
        var date = new Date();
        var year = date.getFullYear();
        //获取当前月份
        var mouth = date.getMonth();
        var days;
        if (mouth == 2) {
            days = year % 4 == 0 ? 29 : 28;
        } else if (mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 || mouth == 8 || mouth == 8 || mouth == 12) {
            days = 31;
        } else {
            days = 30;
        }
        return Number(days) + Number(date1) - 7;
    }

    $(function () {
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if (subRelColIds != "null") {
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click", function () {
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function (i, v) {
                    relColVals += $("tr[abbr='" + abbr + "']").find("input[name='" + v + "']").val() + ",";
                });
                setSubData(formId1, subFormIds, subRelColIds, relColVals, "", "", true);
            });
        }
        ;
    });

    function getRelColVal(arr, obj, colNo) {
        if (colNo) {
            var arrColNo = colNo.split(",");
            $(arrColNo).each(function (i, v) {
                if (v != "ID") {
                    arr.push("<input type='hidden' name='" + v + "' value='" + obj[v] + "' />");
                }
            });
        }
    }

    var isFirstSetScroll = 0;
</script>

<script>
    <%--生成异步表格--%>

    function createTableModel(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == 'f8f38593803b49eda68064fc7a5b0169') {<%--FM-PCB关联--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' onclick=\"listPcbaTable('" + v.ID + "');\"  id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell " + ms.tdClass(formId, 'DATA_AUTH') + "'   style='width:200px;text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "'>" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_PCB_SN' class='datagrid-cell " + ms.tdClass(formId, 'WPI_PCB_SN') + "'   style='width:170px;text-align:left;" + ms.tdStyle(formId, 'WPI_PCB_SN') + "' " + ms.tdEvent(formId, 'WPI_PCB_SN') + ">")
                arrHtml.push("<span colno='WPI_PCB_SN' class='" + ms.uiClass(formId, 'WPI_PCB_SN') + "' onclick='itemJump1(\"" + v['WPI_PCB_SN'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'WPI_PCB_SN') + " title='" + ms.titleAttr(formId, 'WPI_PCB_SN', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_PCB_SN'] + "</span>")
                arrHtml.push("</td>");
                /*arrHtml.push("<td colno='SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
                arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" >"+v['SPLIT_GROUP_ID']+"</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("<td colno='WPI_ITEM_CODE' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_CODE') + "' style='width:130px;text-align:left;" + ms.tdStyle(formId, 'WPI_ITEM_CODE') + "' " + ms.tdEvent(formId, 'WPI_ITEM_CODE') + ">")
                arrHtml.push("<span colno='WPI_ITEM_CODE' class='" + ms.uiClass(formId, 'WPI_ITEM_CODE') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_CODE') + "' " + ms.uiEvent(formId, 'WPI_ITEM_CODE') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_CODE', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_CODE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_ITEM_NAME' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_NAME') + "' style='width:150px;text-align:left;" + ms.tdStyle(formId, 'WPI_ITEM_NAME') + "' " + ms.tdEvent(formId, 'WPI_ITEM_NAME') + ">")
                arrHtml.push("<span colno='WPI_ITEM_NAME' class='" + ms.uiClass(formId, 'WPI_ITEM_NAME') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_NAME') + "' " + ms.uiEvent(formId, 'WPI_ITEM_NAME') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_NAME', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_NAME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_ITEM_SPEC' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_SPEC') + "' style='width:80px;text-align:left;" + ms.tdStyle(formId, 'WPI_ITEM_SPEC') + "' " + ms.tdEvent(formId, 'WPI_ITEM_SPEC') + ">")
                arrHtml.push("<span colno='WPI_ITEM_SPEC' class='" + ms.uiClass(formId, 'WPI_ITEM_SPEC') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_SPEC') + "' " + ms.uiEvent(formId, 'WPI_ITEM_SPEC') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_SPEC', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_SPEC'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_ITEM_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'WPI_ITEM_COUNT') + "' " + ms.tdEvent(formId, 'WPI_ITEM_COUNT') + ">")
                arrHtml.push("<span colno='WPI_ITEM_COUNT' class='" + ms.uiClass(formId, 'WPI_ITEM_COUNT') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_COUNT') + "' " + ms.uiEvent(formId, 'WPI_ITEM_COUNT') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_COUNT', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_ITEM_SUPPLIERS' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_SUPPLIERS') + "' style='width:90px;" + ms.tdStyle(formId, 'WPI_ITEM_SUPPLIERS') + "' " + ms.tdEvent(formId, 'WPI_ITEM_SUPPLIERS') + ">")
                arrHtml.push("<span colno='WPI_ITEM_SUPPLIERS' class='" + ms.uiClass(formId, 'WPI_ITEM_SUPPLIERS') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_SUPPLIERS') + "' " + ms.uiEvent(formId, 'WPI_ITEM_SUPPLIERS') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_SUPPLIERS', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_SUPPLIERS'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_MO_NUMBER' class='datagrid-cell " + ms.tdClass(formId, 'WPI_MO_NUMBER') + "' style='width:170px;" + ms.tdStyle(formId, 'WPI_MO_NUMBER') + "' " + ms.tdEvent(formId, 'WPI_MO_NUMBER') + ">")
                arrHtml.push("<span colno='WPI_MO_NUMBER' class='" + ms.uiClass(formId, 'WPI_MO_NUMBER') + "' onclick='itemJump2(\"" + v['WPI_MO_NUMBER'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'WPI_MO_NUMBER') + " title='" + ms.titleAttr(formId, 'WPI_MO_NUMBER', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_MO_NUMBER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_LOT_NUMBER' class='datagrid-cell " + ms.tdClass(formId, 'WPI_LOT_NUMBER') + "' style='width:70px;" + ms.tdStyle(formId, 'WPI_LOT_NUMBER') + "' " + ms.tdEvent(formId, 'WPI_LOT_NUMBER') + ">")
                arrHtml.push("<span colno='WPI_LOT_NUMBER' class='" + ms.uiClass(formId, 'WPI_LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'WPI_LOT_NUMBER') + "' " + ms.uiEvent(formId, 'WPI_LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'WPI_LOT_NUMBER', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_LOT_NUMBER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_ITEM_MARK_CODE' class='datagrid-cell " + ms.tdClass(formId, 'WPI_ITEM_MARK_CODE') + "' style='width:70px;" + ms.tdStyle(formId, 'WPI_ITEM_MARK_CODE') + "' " + ms.tdEvent(formId, 'WPI_ITEM_MARK_CODE') + ">")
                arrHtml.push("<span colno='WPI_ITEM_MARK_CODE' class='" + ms.uiClass(formId, 'WPI_ITEM_MARK_CODE') + "' style='" + ms.uiStyle(formId, 'WPI_ITEM_MARK_CODE') + "' " + ms.uiEvent(formId, 'WPI_ITEM_MARK_CODE') + " title='" + ms.titleAttr(formId, 'WPI_ITEM_MARK_CODE', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_ITEM_MARK_CODE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_TRACE_FLAG' class='datagrid-cell " + ms.tdClass(formId, 'WPI_TRACE_FLAG') + "' style='width:70px;" + ms.tdStyle(formId, 'WPI_TRACE_FLAG') + "' " + ms.tdEvent(formId, 'WPI_TRACE_FLAG') + ">")
                arrHtml.push("<span colno='WPI_TRACE_FLAG' class='" + ms.uiClass(formId, 'WPI_TRACE_FLAG') + "' style='" + ms.uiStyle(formId, 'WPI_TRACE_FLAG') + "' " + ms.uiEvent(formId, 'WPI_TRACE_FLAG') + " title='" + ms.titleAttr(formId, 'WPI_TRACE_FLAG', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_TRACE_FLAG'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_EMP' class='datagrid-cell " + ms.tdClass(formId, 'WPI_EMP') + "' style='width:80px;text-align:left;" + ms.tdStyle(formId, 'WPI_EMP') + "' " + ms.tdEvent(formId, 'WPI_EMP') + ">")
                arrHtml.push("<span colno='WPI_EMP' class='" + ms.uiClass(formId, 'WPI_EMP') + "' style='" + ms.uiStyle(formId, 'WPI_EMP') + "' " + ms.uiEvent(formId, 'WPI_EMP') + " title='" + ms.titleAttr(formId, 'WPI_EMP', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_EMP'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WPI_TIME' class='datagrid-cell " + ms.tdClass(formId, 'WPI_TIME') + "' style='width:140px;text-align:left;" + ms.tdStyle(formId, 'WPI_TIME') + "' " + ms.tdEvent(formId, 'WPI_TIME') + ">")
                arrHtml.push("<span colno='WPI_TIME' class='" + ms.uiClass(formId, 'WPI_TIME') + "' style='" + ms.uiStyle(formId, 'WPI_TIME') + "' " + ms.uiEvent(formId, 'WPI_TIME') + " title='" + ms.titleAttr(formId, 'WPI_TIME', 'IS_TITLE_ATTR', v) + "'>" + v['WPI_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        if (formId == '1e386669daf84b4c8c5cd1e7a15e700f') {<%--FM-产品关联信息--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='OLD_SN' class='datagrid-cell " + ms.tdClass(formId, 'OLD_SN') + "' style='" + ms.tdStyle(formId, 'OLD_SN') + "' " + ms.tdEvent(formId, 'OLD_SN') + ">")
                arrHtml.push("<span colno='OLD_SN' class='" + ms.uiClass(formId, 'OLD_SN') + "' style='" + ms.uiStyle(formId, 'OLD_SN') + "' " + ms.uiEvent(formId, 'OLD_SN') + " title='" + ms.titleAttr(formId, 'OLD_SN', 'IS_TITLE_ATTR', v) + "'>" + v['OLD_SN'] + "</span>")
                arrHtml.push("</td>");
                /*arrHtml.push("<td colno='SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
                arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" >"+v['SPLIT_GROUP_ID']+"</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell " + ms.tdClass(formId, 'MO_NUMBER') + "' style='" + ms.tdStyle(formId, 'MO_NUMBER') + "' " + ms.tdEvent(formId, 'MO_NUMBER') + ">")
                arrHtml.push("<span colno='MO_NUMBER' class='" + ms.uiClass(formId, 'MO_NUMBER') + "' style='" + ms.uiStyle(formId, 'MO_NUMBER') + "' " + ms.uiEvent(formId, 'MO_NUMBER') + " title='" + ms.titleAttr(formId, 'MO_NUMBER', 'IS_TITLE_ATTR', v) + "'>" + v['MO_NUMBER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LINK_NUM' class='datagrid-cell " + ms.tdClass(formId, 'LINK_NUM') + "' style='text-align:right;" + ms.tdStyle(formId, 'LINK_NUM') + "' " + ms.tdEvent(formId, 'LINK_NUM') + ">")
                arrHtml.push("<span colno='LINK_NUM' class='" + ms.uiClass(formId, 'LINK_NUM') + "' style='" + ms.uiStyle(formId, 'LINK_NUM') + "' " + ms.uiEvent(formId, 'LINK_NUM') + " title='" + ms.titleAttr(formId, 'LINK_NUM', 'IS_TITLE_ATTR', v) + "'>" + v['LINK_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SPLIT_FLAG' class='datagrid-cell " + ms.tdClass(formId, 'SPLIT_FLAG') + "' style='text-align: center;" + ms.tdStyle(formId, 'SPLIT_FLAG') + "' " + ms.tdEvent(formId, 'SPLIT_FLAG') + ">")
                arrHtml.push("<span colno='SPLIT_FLAG' class='" + ms.uiClass(formId, 'SPLIT_FLAG') + "' style='" + ms.uiStyle(formId, 'SPLIT_FLAG') + "' " + ms.uiEvent(formId, 'SPLIT_FLAG') + " title='" + ms.titleAttr(formId, 'SPLIT_FLAG', 'IS_TITLE_ATTR', v) + "'>" + v['SPLIT_FLAG'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SPLIT_EMP' class='datagrid-cell " + ms.tdClass(formId, 'SPLIT_EMP') + "' style='text-align:center;" + ms.tdStyle(formId, 'SPLIT_EMP') + "' " + ms.tdEvent(formId, 'SPLIT_EMP') + ">")
                arrHtml.push("<span colno='SPLIT_EMP' class='" + ms.uiClass(formId, 'SPLIT_EMP') + "' style='" + ms.uiStyle(formId, 'SPLIT_EMP') + "' " + ms.uiEvent(formId, 'SPLIT_EMP') + " title='" + ms.titleAttr(formId, 'SPLIT_EMP', 'IS_TITLE_ATTR', v) + "'>" + v['SPLIT_EMP'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SPLIT_TIME' class='datagrid-cell " + ms.tdClass(formId, 'SPLIT_TIME') + "' style='text-align:center;" + ms.tdStyle(formId, 'SPLIT_TIME') + "' " + ms.tdEvent(formId, 'SPLIT_TIME') + ">")
                arrHtml.push("<span colno='SPLIT_TIME' class='" + ms.uiClass(formId, 'SPLIT_TIME') + "' style='" + ms.uiStyle(formId, 'SPLIT_TIME') + "' " + ms.uiEvent(formId, 'SPLIT_TIME') + " title='" + ms.titleAttr(formId, 'SPLIT_TIME', 'IS_TITLE_ATTR', v) + "'>" + v['SPLIT_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);

    }

    $(function () {
        $("#16a075cdd641485aa84c1ee092374a85").attr("style", "display:none;");
    })
    var paginationImpl = {};

    function getInfoPage(paginationImpl, url) {

        var isFirstLoad = firstLoadThisPage(paginationImpl);
        var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        var WPI_PCB_SN = $.trim($("#WPI_PCB_SN_SHOW").val());
        var WPI_ITEM_CODE = $.trim($("#WPI_ITEM_CODE_SHOW").val());
        var WPI_MO_NUMBER = $.trim($("#WPI_MO_NUMBER_SHOW").val());
        var PCBA = $.trim($("#PCBA_SN").val());
        var WPI_TIME_BEGIN = $("#WPI_TIME_BEGIN").val();
        var WPI_TIME_END = $("#WPI_TIME_END").val();
        var DATA_AUTH = $("#DATA_AUTH").val();
        var newSn = $.trim($("#NEW_SN").val());

        var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=478de7009ba64f0bb688c2c60e6cafef";
        $.ajax({
            type: "post",
            dataType: "json",
            url: GetEmpPages,
            data: {
                "WPI_PCB_SN": WPI_PCB_SN,
                "WPI_ITEM_CODE": WPI_ITEM_CODE,
                "WPI_MO_NUMBER": WPI_MO_NUMBER,
                "PCBA": PCBA,
                "WPI_TIME_BEGIN": WPI_TIME_BEGIN,
                "WPI_TIME_END": WPI_TIME_END,
                "DATA_AUTH": DATA_AUTH,
                "newSn": newSn,
                "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
            },
            success: function (data) {
                $("#tbody_f8f38593803b49eda68064fc7a5b0169").empty();
                $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f").empty();
                if (null == data) {
                    return;
                }
                var tempFreeze;
                var formId = $("#formId1").val();
                var relColVals = "";
                var subRelColIds = $("#subRelColIds").val();
                var subFormIds = $("#subFormIds").val();
                if (null != data.ajaxPage.dataList) {
                    var list = eval(data.ajaxPage.dataList);
                    for (var i = 0; i < list.length; i++) {
                        if (list[i].WPI_TRACE_FLAG == null) tempFreeze = "";
                        if (list[i].WPI_TRACE_FLAG == 'Y') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
                        if (list[i].WPI_TRACE_FLAG == 'N') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";

                        if (list[i].WPI_PCB_SN == null) list[i].WPI_PCB_SN = "";
                        if (list[i].WPI_ITEM_CODE == null) list[i].WPI_ITEM_CODE = "";
                        if (list[i].WPI_ITEM_SPEC == null) list[i].WPI_ITEM_SPEC = "";
                        if (list[i].WPI_ITEM_NAME == null) list[i].WPI_ITEM_NAME = "";
                        if (list[i].WPI_ITEM_COUNT == null) list[i].WPI_ITEM_COUNT = "";
                        if (list[i].SUPPLIER_NAME == null) list[i].SUPPLIER_NAME = "";
                        if (list[i].LOGIN_NAME == null) list[i].LOGIN_NAME = "";
                        if (list[i].WPI_MO_NUMBER == null) list[i].WPI_MO_NUMBER = "";
                        if (list[i].WPI_LOT_NUMBER == null) list[i].WPI_LOT_NUMBER = "";
                        if (list[i].WPI_ITEM_MARK_CODE == null) list[i].WPI_ITEM_MARK_CODE = "";

                        if (list[i].NAME == null) list[i].NAME = "";
                        if (list[i].WPI_TIMES == null) list[i].WPI_TIMES = "";

                        $("#tbody_f8f38593803b49eda68064fc7a5b0169").append("<tr style='height:30px;' id='tr_" + list[i].ID + "'  onclick=\"listPcbaTable('" + list[i].ID + "');\"     ></tr>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align: center;'>" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + i + "' type='checkbox' name='" + formId + "$ID' class='isSubmit _selectdata' onclick=\"listChildTable('" + list[i].ID + "');\"  value='" + list[i].ID + "' /></td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-233' style='width:200px;text-align: center;' ><span style='display: inline;border-bottom: 1px solid #004098;'>" + list[i].DATA_AUTH2 + "</span><input type='hidden' id='auth_" + list[i].ID + "' value='" + list[i].ID + "'/></td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:170px;text-align: left;' ondblclick=\"itemJump0('" + list[i].WPI_PCB_SN + "')\" ><span style='display: inline;border-bottom: 1px solid #004098;'>" + list[i].WPI_PCB_SN + "</span></td></td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;text-align: left;'>" + list[i].WPI_ITEM_CODE + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;'>" + list[i].WPI_ITEM_NAME + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: left;'>" + list[i].WPI_ITEM_SPEC + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;'>" + list[i].WPI_ITEM_COUNT + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: center;'>" + list[i].SUPPLIER_NAME + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:170px;text-align: center;'>" + list[i].WPI_MO_NUMBER + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:70px;text-align: center;'>" + list[i].WPI_LOT_NUMBER + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:70px;text-align: center;'>" + list[i].WPI_ITEM_MARK_CODE + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:70px;text-align: center;'><span >" + tempFreeze + "</span></td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:80px;text-align: left;'>" + list[i].NAME + "</td>");
                        $("#tbody_f8f38593803b49eda68064fc7a5b0169 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:140px;text-align: left;'>" + list[i].WPI_TIMES + "</td>");

                    }
                    $('.scroll2').mCustomScrollbar("destroy");
                    listPcbaTable(list[0].ID);
                    setPopScroll('.scroll2', '.head2');
                }

                pageFun(data.ajaxPage, "f8f38593803b49eda68064fc7a5b0169");
                var tableTrJs = $("#datagrid-btable-ajaxf8f38593803b49eda68064fc7a5b0169 tbody tr");
                _tongLineColor(tableTrJs);
                clickTr('datagrid-btable-ajaxf8f38593803b49eda68064fc7a5b0169');
                defTableWidthRewrite('f8f38593803b49eda68064fc7a5b0169');
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
            }
        })
    }

    function clickTr(tableId) {

        $("#" + tableId + " tr").unbind("click");
        $("#" + tableId + " tr input[type=checkbox]").unbind("click");
        $("#" + tableId + " tr").on("click", function (e) {
            var trId = $(this).attr("id");
            if ($("#" + trId + " :checkbox").attr("checked")) {
                $("#" + trId + " :checkbox").prop("checked", false);
                $("#" + trId).css("background-color", "");
            } else {
                $("#" + tableId + " input[type='checkbox']").each(function () {
                    if ($(this).attr("checked")) {
                        $(this).prop("checked", false);
                        $(this).parents("tr").css("background-color", "");
                    }
                });
                $("#" + trId + " :checkbox").prop("checked", true);
                $("#" + trId).css("background-color", "#d3eafc");
            }
        });

        $("#" + tableId + " tr input[type=checkbox]").click(function (e) {
            e.stopPropagation();
            var style = $(this).parents("tr").attr("style");
            if (style && style.indexOf("background-color") > -1) {
                $(this).parents("tr").css("background-color", "");
            } else {
                $(this).parents("tr").css("background-color", "#d3eafc");
            }
        });
    }

    function listPcbaTable(dataId) {
        $("#pcbaId").val(dataId);
        var fomid = $("#subFormIds").val();

        var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=d22e9ab844ee44b58a836150a3a504f0";
        $.ajax({
            type: "post",
            dataType: "json",
            data: {
                "dataId": dataId
            },
            url: GetEmpPages,
            success: function (data) {
                $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f").empty();
                if (null == data) {
                    return;
                }
                var tempFreeze;
                if (null != data.ajaxPage.dataList) {
                    var list = eval(data.ajaxPage.dataList);

                    for (var i = 0; i < list.length; i++) {
                        if (list[i].SPLIT_FLAG == null) tempFreeze = "";
                        if (list[i].SPLIT_FLAG == 'Y') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
                        if (list[i].SPLIT_FLAG == 'N') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
                        if (list[i].OLD_SN == null) list[i].OLD_SN = "";
                        if (list[i].MO_NUMBER == null) list[i].MO_NUMBER = "";
                        if (list[i].LINK_NUM == null) list[i].LINK_NUM = "";

                        if (list[i].NAME == null) list[i].NAME = "";
                        if (list[i].WPI_TIMES == null) list[i].WPI_TIMES = "";
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f").append("<tr style='height:30px;'       ></tr>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align: center;'>" + (i + 1) + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + i + "' type='checkbox' name='" + fomid + "$ID'  class='isSubmit _selectdata'  value='" + list[i].ID + "' /></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' ><span onclick='itemJump3(\"" + list[i].OLD_SN + "\")' style='display: inline;border-bottom: 1px solid #004098;'>" + (list[i].OLD_SN == null ? "" : list[i].OLD_SN) + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' ><span onclick='itemJump4(\"" + list[i].NEW_SN + "\")' style='display: inline;border-bottom: 1px solid #004098;'>" + (list[i].NEW_SN == null ? "" : list[i].NEW_SN) + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;'>" + list[i].MO_NUMBER + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: right;'>" + list[i].LINK_NUM + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;'><span >" + tempFreeze + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'>" + list[i].NAME + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'>" + list[i].WPI_TIMES + "</td>");


                    }
                }

                pageFun(data.ajaxPage, "1e386669daf84b4c8c5cd1e7a15e700f");
                var tableTrJs = $("#datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f tbody tr");
                _tongLineColor(tableTrJs);
                clickTr('datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f');
                defTableWidthRewrite('1e386669daf84b4c8c5cd1e7a15e700f');
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
            }

        })


    }

    function listPcbaTablePage(paginationImpl, url) {
        var dataId = $("#pcbaId").val();
        var isFirstLoad = firstLoadThisPage(paginationImpl);
        var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        var GetEmpPages = "${path}buss/bussModel_exeFunc.ms?funcMId=d22e9ab844ee44b58a836150a3a504f0";

        var fomid = $("#subFormIds").val();
        $.ajax({
            type: "post",
            dataType: "json",
            data: {
                "dataId": dataId,
                "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
            },
            url: GetEmpPages,
            success: function (data) {
                $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f").empty();
                if (null == data) {
                    return;
                }
                var tempFreeze;
                if (null != data.ajaxPage.dataList) {
                    var list = eval(data.ajaxPage.dataList);

                    for (var i = 0; i < list.length; i++) {
                        if (list[i].SPLIT_FLAG == null) tempFreeze = "";
                        if (list[i].SPLIT_FLAG == 'Y') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
                        if (list[i].SPLIT_FLAG == 'N') tempFreeze = "<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
                        if (list[i].OLD_SN == null) list[i].OLD_SN = "";
                        if (list[i].MO_NUMBER == null) list[i].MO_NUMBER = "";
                        if (list[i].LINK_NUM == null) list[i].LINK_NUM = "";

                        if (list[i].NAME == null) list[i].NAME = "";
                        if (list[i].WPI_TIMES == null) list[i].WPI_TIMES = "";
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f").append("<tr style='height:30px;'        ></tr>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align: center;'>" + (i + 1) + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='" + i + "' type='checkbox' name='" + fomid + "$ID'  class='isSubmit _selectdata'  value='" + list[i].ID + "' /></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' ><span onclick='itemJump3(\"" + list[i].OLD_SN + "\")' style='display: inline;border-bottom: 1px solid #004098;'>" + (list[i].OLD_SN == null ? "" : list[i].OLD_SN) + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' ><span onclick='itemJump4(\"" + list[i].NEW_SN + "\")' style='display: inline;border-bottom: 1px solid #004098;'>" + (list[i].NEW_SN == null ? "" : list[i].NEW_SN) + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;'>" + list[i].MO_NUMBER + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: right;'>" + list[i].LINK_NUM + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;'><span >" + tempFreeze + "</span></td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'>" + list[i].NAME + "</td>");
                        $("#tbody_1e386669daf84b4c8c5cd1e7a15e700f tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: center;'>" + list[i].WPI_TIMES + "</td>");


                    }
                }

                pageFun(data.ajaxPage, "1e386669daf84b4c8c5cd1e7a15e700f");
                var tableTrJs = $("#datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f tbody tr");
                _tongLineColor(tableTrJs);
                clickTr('datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f');
                defTableWidthRewrite('1e386669daf84b4c8c5cd1e7a15e700f');
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
            }

        })


    }

    function itemJump0(obj) {

        itemJump(obj);
    }

    //跳转到产品信息页面
    function proJump(obj) {
        //alert("Ssssssssssssss");
        var formId = $("#formId1").val();

        var url = "${path}buss/bussModel.ms?exeid=aec0089e4d69487cbe28b4b70b1ffa21&FUNC_CODE=F10630&formId=" + formId + "&iframeId=" + _currentFrame + "&proSn=" + obj;
        showPopWinFp(url, 800, 400, null, "<dict:lang value="产品追溯报表" />", obj, 1);
    }

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

    //物料追溯
    function itemJump1(obj) {
        winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418", "F10790", "jumpId", obj);
    }


    //制令单信息
    function itemJump2(obj) {
        winOptMethod.jump("7d0349f7a60b405299af347205b1d92f", "F3454", "jumpId", obj);
    }

    //产品追溯
    function itemJump3(obj) {
        winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21", "F10630", "jumpId", obj);
    }

    //产品追溯
    function itemJump4(obj) {
        winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21", "F10630", "jumpId", obj);
    }


</script>

<script>(function ($) {
    $(window).on('load', function () {
        setPopScroll('.scroll1', '.head1');
        setPopScroll('.scroll2', '.head2');
    })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
