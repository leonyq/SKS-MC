<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <title>
        <dict:lang value="VOID-工单关联-当日待处理"/>
    </title>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
        <jsp:param name="msData" value="1"/>
        <jsp:param name="scroll" value="1"/>
        <jsp:param name="jqueryprint" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp" %>
    <bu:header formId="b376f2a126f2414d81c63507a3c699c0"/>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>
</head>

<body scroll="auto" style="overflow: auto;">
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="422f5fbd313d45c88ce1cde491b539f9"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>

                    <bu:search viewId="422f5fbd313d45c88ce1cde491b539f9"/>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>

                <input type="hidden" name="formPageb376f2a126f2414d81c63507a3c699c0" id="formPageb376f2a126f2414d81c63507a3c699c0" value="${formPageb376f2a126f2414d81c63507a3c699c0}"/>
                <input type="hidden" name="formId" id="formId1" value='b376f2a126f2414d81c63507a3c699c0'/>

                <input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>

                <input type="hidden" id="subRelColIds" name="subRelColIds" value='b550241e7dc74ce7bf837e8d7c74e3a2'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='b376f2a126f2414d81c63507a3c699c0'/>
                <div class="panel-ajax datagrid datagrid-div1" id="b376f2a126f2414d81c63507a3c699c0">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb376f2a126f2414d81c63507a3c699c0" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innerb376f2a126f2414d81c63507a3c699c0">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb376f2a126f2414d81c63507a3c699c0" style="min-width:2030px;">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="b376f2a126f2414d81c63507a3c699c0" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_b376f2a126f2414d81c63507a3c699c0" onclick="_selectAjaxTableAllData(this,'b376f2a126f2414d81c63507a3c699c0')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td class="datagrid-cell" style="width:200px;">
                                            <bu:uitn colNo="DATA_AUTH" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_STATUS" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="IS_REL" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_MATERIAL" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_NAME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_STANDARD" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:70px;">
                                            <bu:uitn colNo="PRODUCT_COUNT" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                            <bu:uitn colNo="CREATE_USER" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:140px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                        <td class="datagrid-cell" style="width:140px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="b376f2a126f2414d81c63507a3c699c0"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb376f2a126f2414d81c63507a3c699c0" onscroll="ajaxTableScroll(this,'b376f2a126f2414d81c63507a3c699c0')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxb376f2a126f2414d81c63507a3c699c0" style="min-width:2030px;">
                                <tbody id="tbody_b376f2a126f2414d81c63507a3c699c0" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPageb376f2a126f2414d81c63507a3c699c0==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b376f2a126f2414d81c63507a3c699c0&showLoading=0"/>
                    </div>
                </c:if>

                <input type="hidden" name="formPage76819937bf4340c7a136992246a07831" id="formPage76819937bf4340c7a136992246a07831" value="${formPage76819937bf4340c7a136992246a07831}"/>
                <input type="hidden" name="formId" id="formId2" value='76819937bf4340c7a136992246a07831'/>
                <div class="panel-ajax datagrid datagrid-div1" id="76819937bf4340c7a136992246a07831" style="display: none;">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax76819937bf4340c7a136992246a07831" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner76819937bf4340c7a136992246a07831">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable76819937bf4340c7a136992246a07831">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="76819937bf4340c7a136992246a07831" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_76819937bf4340c7a136992246a07831" onclick="_selectAjaxTableAllData(this,'76819937bf4340c7a136992246a07831')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td name="noprintset_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td name="noprintset_ITEM_CODE" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_CODE" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td name="noprintset_MODEL_CODE" class="datagrid-cell">
                                            <bu:uitn colNo="MODEL_CODE" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td name="noprintset_ITEM_NUM" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_NUM" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td name="noprintset_FEED_NUM" class="datagrid-cell">
                                            <bu:uitn colNo="FEED_NUM" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td name="noprintset_PROCESS_ORDER" class="datagrid-cell">
                                            <bu:uitn colNo="PROCESS_ORDER" formId="76819937bf4340c7a136992246a07831"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv76819937bf4340c7a136992246a07831" onscroll="ajaxTableScroll(this,'76819937bf4340c7a136992246a07831')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax76819937bf4340c7a136992246a07831">
                                <tbody id="tbody_76819937bf4340c7a136992246a07831" class="isChilds"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage76819937bf4340c7a136992246a07831==1}">
                    <div class="center" id="time76819937bf4340c7a136992246a07831" style="display:none">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=76819937bf4340c7a136992246a07831&showLoading=0"/>
                    </div>
                </c:if>
                <input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
                <input type="hidden" name="tableCount" id="tableCount" value='2'/>

            </form>
        </div>
    </div>
</div>

<bu:submit viewId="422f5fbd313d45c88ce1cde491b539f9"/>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>

<bu:script viewId="422f5fbd313d45c88ce1cde491b539f9"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<script type="text/javascript">
    // 主列表
    function listAjaxTable(formId) {
        var currentPage = "";
        var pageRecord = "";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw=" + "{\"" + formId + "\":\"PROJECT_STATUS,PROJECT_OFONESELF,PRODUCT_CONFIGURE\"}";

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

    // 判断是否分页
    function isPage(formId) {
        var isPageVal = $("#formPage" + formId).val();
        if (isPageVal == "1") {
            return true;
        }
        return false;
    }

    // 查询
    function query(thisObj) {
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }

    // 清空表格
    function clearChildTable() {
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }

    // 当出现滚动条时动态设置表格宽度
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

    // 清空全选
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

    // 数据为空时设置横向滚动条
    function setCrossWiseScroll(formId, arrHtml) {
        if (arrHtml.length == 0) {
            var tableWidth = $("#datagrid-btable-ajax" + formId).width();
            var tableHeight =
                arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth + "px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv" + formId).css({"overflow-y": "hidden", "overflow-x": "auto"});
        } else {
            $("#tableDiv" + formId).css({"overflow-y": "auto", "overflow-x": "auto"});
        }
    }


    // 初始化子分页
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


    // 初始化分页插件
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

    // 判断是否首次异步访问
    function firstLoadThisPage(formId) {
        if (typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) == "undefined") {
            return true;
        }
        return false;
    }

    // 初始化子表单
    function getFormIdInitChildPage() {
        var tableCount = $("#tableCount").val();
        for (var i = 2; i <= tableCount; i++) {
            var formId = $("#formId" + i).val();
            if (isPage(formId)) {
                initChildPage(formId);
            }
        }
    }

    function init() {
        if ($(".leftTable-ajax").length > 0) {
            $(".leftTable-ajax").show();
        }
        ;
        var jumpId = $("#jumpId").val();
        if (jumpId != "") {
            $("#PROJECT_ID_SHOW").val(jumpId);
            $("#PROJECT_ID").val(jumpId);
        }
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();
        </s:if>
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
                    var childVal = $("tr[abbr='" + abbr + "']").find("input[type='hidden']").val();
                    relColVals += childVal + ",";
                });
                setSubData(formId1, subFormIds, subRelColIds, relColVals, "", "", true);
            });
        }
        ;
    });

    //帮助
    function help_mc(exeid) {
        //alert(exeid);
        top.window.open("${path}sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID=" + exeid, "_blank");
    }


</script>
<script>
    var isFirstSetScroll = 0;

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
    //生成异步表格
    function createTableModel(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var uiRaw = ms.uiRaw(formId) == null ? [] : ms.uiRaw(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        if (formId == 'b376f2a126f2414d81c63507a3c699c0') {<%--工单信息--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr onclick='itemJump2(\"" + v['PROJECT_ID'] + "\")' class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                if ($("#" + formId).find(".left-datagrid-title-ajax").length > 0) {
                    arrLeftHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                    arrLeftHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrLeftHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrLeftHtml.push("</td>");
                } else {
                    arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrHtml.push("</td>");
                }
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='width:200px;text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + v['DATA_AUTH'] + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /> ");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='width:150px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + v['PROJECT_ID'] + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");

                arrHtml.push("<td colno='PROJECT_STATUS' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">")
                arrHtml.push("<span colno='PROJECT_STATUS'  class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " >" + v['PROJECT_STATUS'] + "</span>")
                arrHtml.push("<input type='hidden' id='PROJECT_STATUS_" + v.ID + "' value='" + uiRaw[i].PROJECT_STATUS + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' class='datagrid-cell " + ms.tdClass(formId, 'IS_REL') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">")
                arrHtml.push("<span colno='IS_REL'  class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " >" + v['IS_REL'] + "</span>")
                arrHtml.push("<input type='hidden' id='IS_REL" + v.ID + "' value='" + uiRaw[i].IS_REL + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL'  class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' onclick='itemJump1(\"" + v['PRODUCT_MATERIAL'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + v['PRODUCT_MATERIAL'] + "' >" + v['PRODUCT_MATERIAL'] + "</span>")
                arrHtml.push("<input type='hidden' id='PRODUCT_CONFIGURE_" + v.ID + "' value='" + uiRaw[i].PRODUCT_CONFIGURE + "' /></td>");
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + v['PRODUCT_NAME'] + "' >" + v['PRODUCT_NAME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">")
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + v['PRODUCT_STANDARD'] + "' >" + v['PRODUCT_STANDARD'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">")
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " >" + v['PRODUCT_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_USER') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " >" + v['CREATE_USER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " >" + v['CREATE_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell " + ms.tdClass(formId, 'EDIT_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">")
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " >" + v['EDIT_TIME'] + "</span>")
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
        if (isFirstSetScroll == 0) {
            isFirstSetScroll = 1;
            setScroll();
        }
    }

    function listChildAjaxTable(formId,paramList){
    }
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

    function itemJump1(obj) {
        var title = "<dict:lang value="工单信息" />";
        var formId = $("#formId1").val();
        var url = "${path}buss/bussModel.ms?&formId=" + formId + "&exeid=53745dab58e344cdb6e278900138763f&FUNC_CODE=F3466&frameId=" + _currentFrame + "&jumpId=" + obj;
        judgIsOpen(title, url);
    }

    function itemJump2(obj) {
        $("#76819937bf4340c7a136992246a07831").css({"display": "block"});
        $("#time76819937bf4340c7a136992246a07831").css({"display": "block"});
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
