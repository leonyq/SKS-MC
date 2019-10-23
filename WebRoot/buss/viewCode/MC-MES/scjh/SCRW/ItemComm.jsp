<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<head>
    <title>
        #{view.title}# </title>
    <style>
        .datagrid-body {
            height: 262px !important;
        }
    </style>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
</head>
<body style="background-color:#fff;overflow:hidden;">
<div class="content-in">
    <div class="dlist">
        <div class="hd" style="background-color: #f6f5f7;padding-bottom: 6px;margin: 0;">
            <div>
                <div id='timeBucketId'></div>
                <div class="optn">
                    <form id="funForm" name="funForm" action="/mes/buss/bussModel.ms" method="post" target="submitFrame">
                        <table class="func_table">
                            <tr>
                                <td width="100%" align="right">
                                    <button type="button" value="" onclick="backFill('${paraMap.popId}pop','${paraMap.popId}shadow','${paraMap.thisId }');" sytle="" class="botton_img_add">
                                        <i class="ico ico-kl "></i> <dict:lang value="提交"/>
                                    </button>
                                    <button type="button" value="" onclick="clearSel('${paraMap.popId}pop','${paraMap.popId}shadow','${paraMap.thisId }');" sytle="" class="botton_img_add">
                                        <i class="ico ico-xg "></i> <dict:lang value="清空"/>
                                    </button>
                                    <button type="button" value="" onclick="parent.closePopWinFp('${paraMap.popId}pop','${popId}shadow');" sytle="" class="botton_img_add">
                                        <i class="ico ico-sc "></i> <dict:lang value="关闭"/>
                                    </button>
                                    <button type="button" class="botton_img_add" onclick="searchOpen();">
                                        <i class="ico ico-search-new"></i><dict:lang value="查询"/>
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="bd" style="border-top:none;border-bottom:none;">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="" method="post">
                    <input type="hidden" id="classId" name="paraMap2.classId" value="${paraMap.classId}"/>
                    <input type="hidden" id="dataAuth" name="paraMap2.dataAuth" value="${paraMap.dataAuth}"/>
                    <table class="search_table">
                        <tbody id="search-tbody">
                        <tr>
                            <td>
                                <div class="group" style="width:300px;">
                                    <div class="name" title="等于"><dict:lang value="物料编码"/></div>
                                    <div class="dec" style="width:200px;">
                                        <input class="input inputsd" id="ciItemCode" name="paraMap2.ciItemCode" style="width:200px;" onkeyup="searchOpen();">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="group" style="width:300px;">
                                    <div class="name" title="等于"><dict:lang value="物料名称"/></div>
                                    <div class="dec" style="width:200px;">
                                        <input class="input inputsd" id="ciItemName" name="paraMap2.ciItemName" style="width:200px;" onkeyup="searchOpen();">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="group" style="width:300px;">
                                    <div class="name" title="等于"><dict:lang value="物料规格"/></div>
                                    <div class="dec" style="width:200px;">
                                        <input class="input inputsd" id="ciItemSpec" name="paraMap2.ciItemSpec" style="width:200px;" onkeyup="searchOpen();">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="group" style="width:300px;">
                                    <div class="name" title="等于"><dict:lang value="存货代码"/></div>
                                    <div class="dec" style="width:200px;">
                                        <input class="input inputsd" id="ciStockCode" name="paraMap2.ciStockCode" style="width:200px;" onkeyup="searchOpen();">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="group" style="width:300px;">
                                    <div class="name" title="等于"><dict:lang value="单位"/></div>
                                    <div class="dec" style="width:200px;">
                                        <input class="input inputsd" id="itemUnit" name="paraMap2.itemUnit" style="width:200px;" onkeyup="searchOpen();">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        </tbody>
                    </table>
                </form>
            
            </div>
            <input type="hidden" name="formId" id="formId1" value='123456'/>
            <form id="submitForm" name="submitForm" action="" method="post" target="submitFrame">
                <div class="panel datagrid datagrid-div1">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner123456">
                                <table id="datagrid-htable123456" class="datagrid-htable fixedTable  " style="height: 25px; ">
                                    <tbody id="title-tbody"></tbody>
                                </table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv123456" style="height:293px;overflow-x: hidden;">
                            <table class=" fixedTable" id="datagrid-btable-ajax123456">
                                <tbody id="tbody_123456"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="center">
                    <c:choose> <c:when test="${isFullScreen==1}">
                        <s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=getDataTable&formId=formId1&showLoading=0"/>
                    </c:when> <c:otherwise>
                        <s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=getDataTable&formId=formId1&showLoading=0"/>
                    </c:otherwise> </c:choose>
                </div>
            </form>
        </div>
    
    </div>
    
    </form>
</div>
</div>
<div>
    <input type="hidden" id="selVal" name="selVal"/> <input type="hidden" id="trClass" name="trClass" value=""/>
    <s:hidden name="paraMap.popId"/>
</div>
</div>
<script type="text/javascript">

    var parentWindow;
    if (top.$("#" + window.frameElement.name)[0] != null) {
        parentWindow = top.$("#" + window.frameElement.name)[0].contentWindow;
    }

    // 回填值
    function backFill(popId, shadow, thisId) {
        var checkedIs = $("input[name='selectValue']:checked").val();
        if (!checkedIs) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择一条数据"/>", "", "260", "145");
            return;
        }
        var text = $("input[name='selectValue']:checked").parents("tr").children("td:last-child").text();
        var trObj = JSON.parse(text);
        parentWindow.backFillItemVal(trObj, thisId);
        parent.closePopWinFp(popId, shadow);
    }

    // 清空值
    function clearSel(pop, shadow, thisId) {
        parentWindow.clearItemVal(thisId);
        parent.closePopWinFp(pop, shadow);
    }


    function getDataTable(paginationImpl) {
        debugger;
        var url = "${path}buss/bussModel_exeCommonTableFunc.ms";
        var isFirstLoad = firstLoadThisPage(paginationImpl);
        var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;

        var itemCode = $("#ciItemCode").val();
        var itemName = $("#ciItemName").val();
        var itemSpec = $("#ciItemSpec").val();
        var stockCode = $("#ciStockCode").val();
        var itemUnit = $("#itemUnit").val();


        util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: $("#searchForm").serialize() + "&page.currentPage=" + currentPage + "&page.pageRecord=" + pageRecord
            + "&item_code=" + itemCode + "&item_name=" + itemName + "&item_spec=" + itemSpec + "&stock_code=" + stockCode,
            success: function (data) {
                var arrDataList = JSON.parse(data.ajaxString);
                if (isFirstLoad) {
                    //createSerachModel(arrDataList.serach);
                    createTableTitleModel(arrDataList.title, arrDataList.setHiddenCol);
                }
                createTableModel(arrDataList.tableData, arrDataList.setHiddenCol, currentPage, pageRecord);
                //executeJs(arrDataList.javaScriptFun);
                initPage(arrDataList.page);
            },
            error: function (msg) {
                isSubmit = false;
            }
        });
    }

    function firstLoadThisPage(paginationImpl) {
        if (typeof(_GLO_FORM_PAGE_MAP[paginationImpl].currentPage) == "undefined") {
            return true;
        }
        return false;
    }


    // 创建搜索条件
    function createSerachModel(serachData) {
        if (!$.isEmptyObject(serachData)) {
            var arr = [];
            var count = 0;
            for (var key in serachData) {
                if (count % 3 == 0) {
                    arr.push("<tr>");
                }
                arr.push("<td>");
                arr.push("<div class=\"group\">");
                arr.push("<div class=\"name\" title=\"<dict:lang value="等于"/>\">");
                arr.push(key);
                arr.push("</div>");
                arr.push("<div class=\"dec\">");
                arr.push(serachData[key]);
                arr.push("</div>");
                arr.push("</div>");
                if (count != 0 && count % 3 == 1) {
                    arr.push("</tr>");
                }

            }
            $("#search-tbody").empty().append(arr.join(""));
        }
    }

    // 创建表格标题
    function createTableTitleModel(titleData, hiddenCol) {

        if (!$.isEmptyObject(titleData)) {
            var arr = [];
            arr.push("<tr class='datagrid-header-row'>");
            arr.push("<td style='width:30px;'></td>");
            arr.push("<td style='width:30px;' align=\"center\"><input type=\"radio\" style=\"display:none;\"><input type=\"checkbox\" style=\"display:none;\"></td>");
            for (var key in titleData) {
                if (hiddenCol.length > 0) {
                    var flag = true;
                    $.each(hiddenCol, function (i, v) {
                        if (key == v) {
                            arr.push("<td colName=" + key + "");
                            arr.push(" style=\"display:none;\"");
                            arr.push(">");
                            arr.push(titleData[key]);
                            arr.push("</td>");
                            flag = false;
                            return false;
                        }
                    });
                    if (flag == true) {
                        arr.push("<td style='width:158px;' colName=" + key + ">");
                        arr.push(titleData[key]);
                        arr.push("</td>");
                    }
                } else {
                    arr.push("<td style='width:158px;' colName=" + key + ">");
                    arr.push(titleData[key]);
                    arr.push("</td>");
                }
            }
            arr.push("<td class=\"datagrid-cell\" style=\"display:none;\">数据对象</td>");
            arr.push("</tr>");
            $("#title-tbody").empty().append(arr.join(""));
            _addDragTableEvent("123456");
        }
    }

    // 创建表格内容
    function createTableModel(tableData, hiddenCol, currentPage, pageRecord) {
        var count = 1;
        var arr = [];
        var selVal = $("#selVal").val();
        var trClass = $("#trClass").val();
        if (!$.isEmptyObject(tableData)) {
            $.each(tableData, function (i, v) {

                if (count % 2 == 0) {
                    arr.push("<tr class=\"datagrid-row tr-hover\" style=\"cursor: pointer;\"  >");
                } else {
                    arr.push("<tr class=\"datagrid-row\" style=\"cursor: pointer;\" >");
                }
                arr.push("<td class=\"datagrid-cell\" style=\"width:30px;text-align: center;\">" + ((currentPage - 1) * pageRecord + (i + 1)) + "</td>");
                arr.push("<td class=\"datagrid-cell\" style=\"width:30px;text-align: center;\">");
                if (v.KEY == selVal) {
                    arr.push("<input type=\"radio\" value=" + v.KEY + " checked=\"checked\" name=\"selectValue\">");
                } else {
                    arr.push("<input type=\"radio\" value=" + v.KEY + " name=\"selectValue\">");
                }
                arr.push("</td>");
                for (var key in v) {
                    if (hiddenCol.length > 0) {
                        var flag = true;
                        $.each(hiddenCol, function (i, value) {
                            if (key == value) {
                                arr.push("<td colName=" + key + " class=\"datagrid-cell\"");
                                arr.push(" style=\"display:none;\"");
                                arr.push(">");
                                arr.push(v[key]);
                                arr.push("</td>");
                                flag = false;
                                return false;
                            }
                        });
                        if (flag == true) {
                            arr.push("<td colName=" + key + " style='width:158px;' class=\"datagrid-cell\" align=\"center\">");
                            arr.push(v[key]);
                            arr.push("</td>");
                        }
                    } else {
                        arr.push("<td colName=" + key + " style='width:158px;' class=\"datagrid-cell\" align=\"center\">");
                        arr.push(v[key]);
                        arr.push("</td>");
                    }
                }
                arr.push("<td class=\"datagrid-cell\" style=\"display:none;\">" + JSON.stringify(v) + "</td>");
                arr.push("</tr>");
                count++;
            });
        }
        if (arr.length > 0) {
            $("#tbody_123456").empty().append(arr.join(""));
        } else {
            $("#tbody_123456").empty();
        }
        if (trClass != "") {
            $("input[name='selectValue']:checked").parents("tr").attr("class", trClass);
        }
        defTableWidthRewrite("123456");
        setScroll("123456");
    }

    function searchOpen() {
        getDataTable("formId1");
    }

    // 执行自定义脚本
    function executeJs(javaScriptFun) {
        eval(javaScriptFun);
    }

    function initPage(page) {
        var ajaxPage = {};
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        showPageBar(ajaxPage, "formId1");
    }

    getDataTable("formId1");

    $(function () {
        $("input[name='selectValue']").live("change", function () {
            var selectVal = $(this).val();
            $("#selVal").val(selectVal);
            var trClass = $(this).parents("tr").attr("class");
            $("#trClass").val(trClass);
        });

        $("#datagrid-btable-ajax123456").width($("#tableDiv123456").width());
        $("#datagrid-btable-ajax123456 tr").live("click", function () {
            var _this = $(this);
            if (!_this.hasClass("datagrid-selected")) {
                _this.addClass("datagrid-selected").siblings().removeClass("datagrid-selected");
            }
            if (_this.hasClass("tr-hover") && _this.hasClass("datagrid-selected")) {
                _this.removeClass("tr-hover").addClass("tr-hover-flag");
            }

            _this.siblings().each(function () {
                if ($(this).hasClass("tr-hover-flag")) {
                    $(this).addClass("tr-hover").removeClass("tr-hover-flag");
                }
            });
            $(this).parent().find("input[name='selectValue']").prop("checked", false);
            $(this).find("input[name='selectValue']").prop("checked", true);
            var selectVal = $("input[name='selectValue']:checked").val();
            $("#selVal").val(selectVal);
            var trClass = $("input[name='selectValue']:checked").parents("tr").attr("class");
            $("#trClass").val(trClass);
        });

        $(".datagrid-row").live("dblclick", function () {
            var popId = "${paraMap.popId}" + "pop";
            var shadow = "${paraMap.shadow}" + "shadow";
            var thisId = "${paraMap.thisId}";
            backFill(popId, shadow, thisId);
        });
    });

    $('.more').click(function () {
        substr(1,);
        if ($('.hideTr').css('display') != "none") {
            $('.hideTr').css('display', 'none');
            $(this).css('background', 'url(../mes/plf/page/fp/img/ico-s-more.png) no-repeat')
        }
        else {
            $('.hideTr').css('display', 'block');
            $(this).css('background', 'url(../mes/plf/page/fp/img/ico-s-more-h.png) no-repeat')
        }
    });

</script>

<script>
    (function ($) {
        $(window).on('load', function () {
            // setPopScroll('.scroll');
        })
    })(jQuery);

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
