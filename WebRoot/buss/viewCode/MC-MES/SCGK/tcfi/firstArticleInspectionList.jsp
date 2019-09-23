<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <title>
        <dict:lang value="VM-首件检测-列表"/>
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
    <bu:header formId="1c6dc1908e8645b5b0104ac2031b5c41"/>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;">
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="6615260816a946ccac5a88d775aac1e9"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>
                    <bu:search viewId="6615260816a946ccac5a88d775aac1e9"/>
                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"/>
                <input type="hidden" name="formPage1c6dc1908e8645b5b0104ac2031b5c41" id="formPage1c6dc1908e8645b5b0104ac2031b5c41" value="${formPage1c6dc1908e8645b5b0104ac2031b5c41}"/>
                <input type="hidden" name="formId" id="formId1" value='1c6dc1908e8645b5b0104ac2031b5c41'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1" id="1c6dc1908e8645b5b0104ac2031b5c41">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1c6dc1908e8645b5b0104ac2031b5c41" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner1c6dc1908e8645b5b0104ac2031b5c41">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1c6dc1908e8645b5b0104ac2031b5c41" style="">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="1c6dc1908e8645b5b0104ac2031b5c41" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_1c6dc1908e8645b5b0104ac2031b5c41" onclick="_selectAjaxTableAllData(this,'1c6dc1908e8645b5b0104ac2031b5c41')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td class="datagrid-cell" style="width:200px; text-align:center;">
                                            <bu:uitn colNo="DATA_AUTH" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:150px; text-align:center;">
                                            <bu:uitn colNo="CFI_PROJECT_ID" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:70px; text-align:center;">
                                            <bu:uitn colNo="CFI_CHECK_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:70px; text-align:center;">
                                            <bu:uitn colNo="CFI_EXAMINE_RESULT" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:70px; text-align:center;">
                                            <bu:uitn colNo="CFI_PRODUCT_STEP" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:150px; text-align:center;">
                                            <bu:uitn colNo="CFI_MODEL_CODE" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:150px; text-align:center;">
                                            <bu:uitn colNo="CFI_MODEL_NAME" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;">
                                            <bu:uitn colNo="CFI_SPEC" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:100px; text-align:center;">
                                            <bu:uitn colNo="CFI_FAI_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:100px; text-align:center;">
                                            <bu:uitn colNo="CFI_CHECK_NUM" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:110px; text-align:center;">
                                            <bu:uitn colNo="CFI_CHECK_SN" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;">
                                            <bu:uitn colNo="CFI_CHECK_EMP" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:140px; text-align:center;">
                                            <bu:uitn colNo="CFI_CHECK_TIME" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;">
                                            <bu:uitn colNo="CFI_EXAMINE_EMP" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                        <td class="datagrid-cell" style="width:140px;text-align:center;">
                                            <bu:uitn colNo="CFI_EXAMINE_TIME" formId="1c6dc1908e8645b5b0104ac2031b5c41"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1c6dc1908e8645b5b0104ac2031b5c41" onscroll="ajaxTableScroll(this,'1c6dc1908e8645b5b0104ac2031b5c41')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax1c6dc1908e8645b5b0104ac2031b5c41" style="">
                                <tbody id="tbody_1c6dc1908e8645b5b0104ac2031b5c41" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage1c6dc1908e8645b5b0104ac2031b5c41==1}">
                <div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1c6dc1908e8645b5b0104ac2031b5c41&showLoading=0"/>
                </div>
                </c:if>
        </div>

        <input type="hidden" name="tableCount" id="tableCount" value='1'/>

        </form>
    </div>
</div>
</div>        <bu:submit viewId="6615260816a946ccac5a88d775aac1e9"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="6615260816a946ccac5a88d775aac1e9"/>
<script type="text/javascript">
    <%--主列表--%>

    function listAjaxTable(formId) {
        var currentPage = "";
        var pageRecord = "";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CFI_EXAMINE_RESULT\"}";
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw=" + "{\"" + formId + "\":\"CREATE_TIME,CREATE_USER,CFI_EXAMINE_RESULT\"}";
        var searchParams = $("#searchForm").serialize() + "&" + $("#searchFormTop").serialize();
        if (isPage(formId)) {
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
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
                    clearChildTable();
                } else {
                    utilsFp.confirmIcon(3, "", "", "", data.RES_MSG, "", "260", "145");
                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }

    <%--判断是否分页--%>

    function isPage(formId) {
        var isPageVal = $("#formPage" + formId).val();
        if (isPageVal == "1") {
            return true;
        }
        return false;
    }

    <%--查询--%>

    function query(thisObj) {
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }

    <%--清空表格--%>

    function clearChildTable() {
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }

    <%--当出现滚动条时动态设置表格宽度 --%>

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


    /*function alertInfo(msg){
        utilsFp.alert(msg);
    }*/

    <%--清空全选 --%>

    function clearAllSelect() {
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked", false);
    }

    function reloadPg(msg, title, width, height, time, isCloseWin) {
        msgPop(msg, reloadPgExe, title, width, height, time, isCloseWin);
    }

    function reloadPgExe(isCloseWin) {
        query("formId1");
        if ("0" == isCloseWin || undefined == isCloseWin) {
            top.$(".dialog-close").click();
        }
        checkboxAll("joblist");
    }

    <%--子列表 --%>

    function listChildAjaxTable(formId, paramList) {
        var data = {
            "paraMap.formidFirstId": _GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId": _GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId": _GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal": _GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol": _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder": _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if (isPage(formId)) {
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if (paramList != null && paramList != "") {
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: data,
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
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }

    <%-- 数据为空时设置横向滚动条 --%>

    function setCrossWiseScroll(formId, arrHtml) {
        if (arrHtml.length == 0) {
            var tableWidth = $("#datagrid-btable-ajax" + formId).width();
            arrHtml.push("<tr>");
            var tableWidth = 0;
            var matchReg = /.*width\s*:\s*(\d*\.?\d*)px/;
            var widthDisplay = /.*display\s*:\s*(\d+)e/;
            $("#datagrid-htable" + formId + " .datagrid-header-row>td").each(function (i, v) {
                var styleTd = $(this).attr("style");
                if (styleTd && styleTd.indexOf("display") > -1 && styleTd.match(widthDisplay) != null && styleTd.match(widthDisplay) == "non") {
                    return true;
                }
                if (styleTd && styleTd.indexOf("width") > -1) {
                    arrHtml.push("<td  style='visibility:hidden;width:" + parseFloat(styleTd.match(matchReg)[1]) + "px;'></td>");
                }
                ;
            });
            arrHtml.push("</tr>");
            $("#tableDiv" + formId).css({"overflow-y": "hidden", "overflow-x": "auto"});
        } else {
            $("#tableDiv" + formId).css({"overflow-y": "auto", "overflow-x": "auto"});
        }
    }

    <%-- 初始化子分页 --%>

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


    <%-- 初始化分页插件 --%>

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

    <%-- 判断是否首次异步访问 --%>

    function firstLoadThisPage(formId) {
        if (typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) == "undefined") {
            return true;
        }
        return false;
    }

    <%-- 初始化子表单 --%>

    function getFormIdInitChildPage() {
        var tableCount = $("#tableCount").val();
        for (var i = 2; i <= tableCount; i++) {
            var formId = $("#formId" + i).val();
            if (isPage(formId)) {
                initChildPage(formId);
            }
        }
    }

    function timeBeginString() {
        var datetime = new Date();
        datetime.setDate(datetime.getDate() - 7);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + "00" + ":" + "00" + ":" + "00";
    }

    function timeEndString() {
        var datetime = new Date();
        //datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + "23" + ":" + "59" + ":" + "59";
    }

    function init() {
        $("#CFI_CHECK_TIME_BEGIN").val(timeBeginString());
        $("#CFI_CHECK_TIME_END").val(timeEndString());
        if ($(".leftTable-ajax").length > 0) {
            $(".leftTable-ajax").show();
        }
        ;
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();
        </s:if>
    }

    /*$(function(){
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
    });*/
</script>
<script>
    var isFirstSetScroll = 0;
    <%--生成异步表格--%>

    function createTableModel(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var uiRaw = ms.uiRaw(formId) == null ? [] : ms.uiRaw(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        if (formId == '1c6dc1908e8645b5b0104ac2031b5c41') {<%--首件检测表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='text-align:center;width:200px;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /></td>");

                arrHtml.push("<td colno='CFI_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'CFI_PROJECT_ID') + "' style='width:150px;" + ms.tdStyle(formId, 'CFI_PROJECT_ID') + "' " + ms.tdEvent(formId, 'CFI_PROJECT_ID') + ">")
                arrHtml.push("<span colno='CFI_PROJECT_ID' class='" + ms.uiClass(formId, 'CFI_PROJECT_ID') + "' onclick='itemJump1(\"" + v['CFI_PROJECT_ID'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'CFI_PROJECT_ID') + " title='" + ms.titleAttr(formId, 'CFI_PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CFI_CHECK_RESULT' class='datagrid-cell " + ms.tdClass(formId, 'CFI_CHECK_RESULT') + "' style='width:70px;text-align:center;" + ms.tdStyle(formId, 'CFI_CHECK_RESULT') + "' " + ms.tdEvent(formId, 'CFI_CHECK_RESULT') + ">")
                arrHtml.push("<span colno='CFI_CHECK_RESULT' class='" + ms.uiClass(formId, 'CFI_CHECK_RESULT') + "' style='" + ms.uiStyle(formId, 'CFI_CHECK_RESULT') + "' " + ms.uiEvent(formId, 'CFI_CHECK_RESULT') + " title='" + ms.titleAttr(formId, 'CFI_CHECK_RESULT', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_CHECK_RESULT'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CFI_EXAMINE_RESULT' class='datagrid-cell " + ms.tdClass(formId, 'CFI_EXAMINE_RESULT') + "' style='width:70px;text-align:center;" + ms.tdStyle(formId, 'CFI_EXAMINE_RESULT') + "' " + ms.tdEvent(formId, 'CFI_EXAMINE_RESULT') + ">")
                arrHtml.push("<span colno='CFI_EXAMINE_RESULT' class='" + ms.uiClass(formId, 'CFI_EXAMINE_RESULT') + "' style='" + ms.uiStyle(formId, 'CFI_EXAMINE_RESULT') + "' " + ms.uiEvent(formId, 'CFI_EXAMINE_RESULT') + " title='" + ms.titleAttr(formId, 'CFI_EXAMINE_RESULT', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_EXAMINE_RESULT'] + "</span>")
                arrHtml.push("<input type='hidden' id='state_" + v.ID + "' value='" + uiRaw[i].CFI_EXAMINE_RESULT + "'></td>");

                arrHtml.push("<td colno='CFI_PRODUCT_STEP' class='datagrid-cell " + ms.tdClass(formId, 'CFI_PRODUCT_STEP') + "' style='width:70px;" + ms.tdStyle(formId, 'CFI_PRODUCT_STEP') + "' " + ms.tdEvent(formId, 'CFI_PRODUCT_STEP') + ">")
                arrHtml.push("<span colno='CFI_PRODUCT_STEP' class='" + ms.uiClass(formId, 'CFI_PRODUCT_STEP') + "' style='" + ms.uiStyle(formId, 'CFI_PRODUCT_STEP') + "' " + ms.uiEvent(formId, 'CFI_PRODUCT_STEP') + " title='" + ms.titleAttr(formId, 'CFI_PRODUCT_STEP', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_PRODUCT_STEP'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CFI_MODEL_CODE' class='datagrid-cell " + ms.tdClass(formId, 'CFI_MODEL_CODE') + "' style='width:150px;" + ms.tdStyle(formId, 'CFI_MODEL_CODE') + "' " + ms.tdEvent(formId, 'CFI_MODEL_CODE') + ">")
                arrHtml.push("<span colno='CFI_MODEL_CODE' class='" + ms.uiClass(formId, 'CFI_MODEL_CODE') + "' style='" + ms.uiStyle(formId, 'CFI_MODEL_CODE') + "' " + ms.uiEvent(formId, 'CFI_MODEL_CODE') + " title='" + ms.titleAttr(formId, 'CFI_MODEL_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_MODEL_CODE'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CFI_MODEL_NAME' class='datagrid-cell " + ms.tdClass(formId, 'CFI_MODEL_NAME') + "' style='width:150px;" + ms.tdStyle(formId, 'CFI_MODEL_NAME') + "' " + ms.tdEvent(formId, 'CFI_MODEL_NAME') + ">")
                arrHtml.push("<span colno='CFI_MODEL_NAME' class='" + ms.uiClass(formId, 'CFI_MODEL_NAME') + "' style='" + ms.uiStyle(formId, 'CFI_MODEL_NAME') + "' " + ms.uiEvent(formId, 'CFI_MODEL_NAME') + " title='" + ms.titleAttr(formId, 'CFI_MODEL_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_MODEL_NAME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_SPEC' class='datagrid-cell " + ms.tdClass(formId, 'CFI_SPEC') + "' style='width:90px;" + ms.tdStyle(formId, 'CFI_SPEC') + "' " + ms.tdEvent(formId, 'CFI_SPEC') + ">")
                arrHtml.push("<span colno='CFI_SPEC' class='" + ms.uiClass(formId, 'CFI_SPEC') + "' style='" + ms.uiStyle(formId, 'CFI_SPEC') + "' " + ms.uiEvent(formId, 'CFI_SPEC') + " title='" + ms.titleAttr(formId, 'CFI_SPEC', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_SPEC'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_FAI_NUM' class='datagrid-cell " + ms.tdClass(formId, 'CFI_FAI_NUM') + "' style='width:100px;text-align:right;" + ms.tdStyle(formId, 'CFI_FAI_NUM') + "' " + ms.tdEvent(formId, 'CFI_FAI_NUM') + ">")
                arrHtml.push("<span colno='CFI_FAI_NUM' class='" + ms.uiClass(formId, 'CFI_FAI_NUM') + "' style='" + ms.uiStyle(formId, 'CFI_FAI_NUM') + "' " + ms.uiEvent(formId, 'CFI_FAI_NUM') + " title='" + ms.titleAttr(formId, 'CFI_FAI_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_FAI_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CHECK_NUM' class='datagrid-cell " + ms.tdClass(formId, 'CFI_CHECK_NUM') + "' style='width:100px;text-align:right;" + ms.tdStyle(formId, 'CFI_CHECK_NUM') + "' " + ms.tdEvent(formId, 'CFI_CHECK_NUM') + ">")
                arrHtml.push("<span colno='CFI_CHECK_NUM' class='" + ms.uiClass(formId, 'CFI_CHECK_NUM') + "' style='" + ms.uiStyle(formId, 'CFI_CHECK_NUM') + "' " + ms.uiEvent(formId, 'CFI_CHECK_NUM') + " title='" + ms.titleAttr(formId, 'CFI_CHECK_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_CHECK_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CHECK_SN' class='datagrid-cell " + ms.tdClass(formId, 'CFI_CHECK_SN') + "' style='width:110px;" + ms.tdStyle(formId, 'CFI_CHECK_SN') + "' " + ms.tdEvent(formId, 'CFI_CHECK_SN') + ">")
                arrHtml.push("<span colno='CFI_CHECK_SN' class='" + ms.uiClass(formId, 'CFI_CHECK_SN') + "' style='" + ms.uiStyle(formId, 'CFI_CHECK_SN') + "' " + ms.uiEvent(formId, 'CFI_CHECK_SN') + " title='" + ms.titleAttr(formId, 'CFI_CHECK_SN', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_CHECK_SN'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CHECK_EMP' class='datagrid-cell " + ms.tdClass(formId, 'CFI_CHECK_EMP') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CFI_CHECK_EMP') + "' " + ms.tdEvent(formId, 'CFI_CHECK_EMP') + ">")
                arrHtml.push("<span colno='CFI_CHECK_EMP' class='" + ms.uiClass(formId, 'CFI_CHECK_EMP') + "' style='" + ms.uiStyle(formId, 'CFI_CHECK_EMP') + "' " + ms.uiEvent(formId, 'CFI_CHECK_EMP') + " title='" + ms.titleAttr(formId, 'CFI_CHECK_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_CHECK_EMP'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_CHECK_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CFI_CHECK_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CFI_CHECK_TIME') + "' " + ms.tdEvent(formId, 'CFI_CHECK_TIME') + ">")
                arrHtml.push("<span colno='CFI_CHECK_TIME' class='" + ms.uiClass(formId, 'CFI_CHECK_TIME') + "' style='" + ms.uiStyle(formId, 'CFI_CHECK_TIME') + "' " + ms.uiEvent(formId, 'CFI_CHECK_TIME') + " title='" + ms.titleAttr(formId, 'CFI_CHECK_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_CHECK_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_EXAMINE_EMP' class='datagrid-cell " + ms.tdClass(formId, 'CFI_EXAMINE_EMP') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CFI_EXAMINE_EMP') + "' " + ms.tdEvent(formId, 'CFI_EXAMINE_EMP') + ">")
                arrHtml.push("<span colno='CFI_EXAMINE_EMP' class='" + ms.uiClass(formId, 'CFI_EXAMINE_EMP') + "' style='" + ms.uiStyle(formId, 'CFI_EXAMINE_EMP') + "' " + ms.uiEvent(formId, 'CFI_EXAMINE_EMP') + " title='" + ms.titleAttr(formId, 'CFI_EXAMINE_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_EXAMINE_EMP'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CFI_EXAMINE_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CFI_EXAMINE_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CFI_EXAMINE_TIME') + "' " + ms.tdEvent(formId, 'CFI_EXAMINE_TIME') + ">")
                arrHtml.push("<span colno='CFI_EXAMINE_TIME' class='" + ms.uiClass(formId, 'CFI_EXAMINE_TIME') + "' style='" + ms.uiStyle(formId, 'CFI_EXAMINE_TIME') + "' " + ms.uiEvent(formId, 'CFI_EXAMINE_TIME') + " title='" + ms.titleAttr(formId, 'CFI_EXAMINE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CFI_EXAMINE_TIME'] + "</span>")
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
        if (isFirstSetScroll == 0) {
            isFirstSetScroll = 1;
            setScroll();
        }
    }

    function judgIsOpen(title, url) {
        var flag = true;
        var timestamp = Date.parse(new Date());
        $(window.parent.document).find("#tag1").siblings().each(function (seq, item) {
            //打开过的标签不再重复打开
            console.log(top);
            if (title == $(item).attr("title")) {
                var count = item.id.substring(3);
                $(window.parent.document).find("#iframe" + count).attr("src", url);
                top.switchTag(item.id, "content" + count, url);
                flag = false;
                return;
            }
        });
        if (flag) {
            showPopWinFp(url, 800, 400, null, title, timestamp, 1);
        }
    }

    function itemJump1(obj) {
        var title = "<dict:lang value="工单信息" />";
        var formId = $("#formId1").val();
        var url = "${path}buss/bussModel.ms?&formId=" + formId + "&exeid=53745dab58e344cdb6e278900138763f&FUNC_CODE=F3466&frameId=" + _currentFrame + "&jumpId=" + obj;
        judgIsOpen(title, url);

    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>