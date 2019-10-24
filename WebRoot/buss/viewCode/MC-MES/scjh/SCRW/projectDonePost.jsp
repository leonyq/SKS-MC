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
        <dict:lang value="VOID-工单缴库-今日已缴库"/>
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
    <bu:header formId="2c88768c86a3467f901210be05a180a9"/>


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

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="63a1dc975a0c4692b44876ed6fb12fa4"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="63a1dc975a0c4692b44876ed6fb12fa4"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPage2c88768c86a3467f901210be05a180a9" id="formPage2c88768c86a3467f901210be05a180a9" value="${formPage2c88768c86a3467f901210be05a180a9}"/>
                <input type="hidden" name="formId" id="formId1" value='2c88768c86a3467f901210be05a180a9'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1" id="2c88768c86a3467f901210be05a180a9">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2c88768c86a3467f901210be05a180a9" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner2c88768c86a3467f901210be05a180a9">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2c88768c86a3467f901210be05a180a9">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="2c88768c86a3467f901210be05a180a9" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_2c88768c86a3467f901210be05a180a9" onclick="_selectAjaxTableAllData(this,'2c88768c86a3467f901210be05a180a9')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td name="noprintset_DATA_AUTH" style="width:120px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td name="noprintset_PROJECT_ID" style="width:110px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td name="noprintset_PROJECT_SORT" style="width:100px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_SORT" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_LOT" class="datagrid-cell">
                                            <bu:uitn colNo="LOT" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_ITEM_NUM" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_NUM" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_BASE_UNIT" class="datagrid-cell">
                                            <bu:uitn colNo="BASE_UNIT" formId="2c88768c86a3467f901210be05a180a9"/></td>

                                        <td name="noprintset_ITEM_CODE" style="width:100px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_CODE" formId="2c88768c86a3467f901210be05a180a9"/></td>

                                        <td name="noprintset_T2#CI_ITEM_NAME" style="width:300px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="T2#CI_ITEM_NAME" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td name="noprintset_T2#STOCK_CODE" style="width:165px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="T2#STOCK_CODE" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td name="noprintset_T2#SAP_COLOR_CODE" style="width:230px; text-align:center" class="datagrid-cell">
                                            <bu:uitn colNo="T2#SAP_COLOR_CODE" formId="2c88768c86a3467f901210be05a180a9"/></td>


                                        <td style="width:100px; text-align:center" name="noprintset_WORK_SPACE" class="datagrid-cell">
                                            <bu:uitn colNo="WORK_SPACE" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_WARE_HOUSE" class="datagrid-cell">
                                            <bu:uitn colNo="WARE_HOUSE" formId="2c88768c86a3467f901210be05a180a9"/></td>

                                        <td style="width:150px; text-align:center" name="noprintset_ITEM_SN" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_SN" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_REVERSE" class="datagrid-cell">
                                            <bu:uitn colNo="REVERSE" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_SFLAG" class="datagrid-cell">
                                            <bu:uitn colNo="SFLAG" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:150px; text-align:center" name="noprintset_MESSAGE" class="datagrid-cell">
                                            <bu:uitn colNo="MESSAGE" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:140px; text-align:center" name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="2c88768c86a3467f901210be05a180a9"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2c88768c86a3467f901210be05a180a9" onscroll="ajaxTableScroll(this,'2c88768c86a3467f901210be05a180a9')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax2c88768c86a3467f901210be05a180a9">
                                <tbody id="tbody_2c88768c86a3467f901210be05a180a9" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage2c88768c86a3467f901210be05a180a9==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2c88768c86a3467f901210be05a180a9&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('2c88768c86a3467f901210be05a180a9','1');">打印</button>
                        </div>
                    </div>
                    <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
                        <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
                            <tr>
                                <td style="width: 100px;text-align: right;">列字段</td>
                                <td style="padding-left: 5px;">是否打印</td>
                                <td style="padding-left: 5px;">打印列宽</td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>序号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>组织机构</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="DATA_AUTH" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="DATA_AUTH" value="" title_name="组织机构"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单类别</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_SORT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_SORT" value="" title_name="工单类别"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="工单号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ITEM_CODE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ITEM_CODE" value="" title_name="料号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>批次号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LOT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LOT" value="" title_name="批次号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工厂</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WORK_SPACE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WORK_SPACE" value="" title_name="工厂"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>仓库</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WARE_HOUSE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WARE_HOUSE" value="" title_name="仓库"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>数量</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ITEM_NUM" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ITEM_NUM" value="" title_name="数量"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>基本单位</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="BASE_UNIT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="BASE_UNIT" value="" title_name="基本单位"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?物料凭证</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ITEM_SN" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ITEM_SN" value="" title_name="?物料凭证"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?反向标识</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REVERSE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REVERSE" value="" title_name="?反向标识"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>同步结果</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SFLAG" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SFLAG" value="" title_name="同步结果"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>消息文本</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="MESSAGE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="MESSAGE" value="" title_name="消息文本"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>创建时间</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CREATE_TIME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CREATE_TIME" value="" title_name="创建时间"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>创建人</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CREATE_USER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CREATE_USER" value="" title_name="创建人"/>px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="tableCount" id="tableCount" value='1'/>

            </form>
        </div>
    </div>
</div>
<bu:submit viewId="63a1dc975a0c4692b44876ed6fb12fa4"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="63a1dc975a0c4692b44876ed6fb12fa4"/>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

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
        if (formId == '2c88768c86a3467f901210be05a180a9') {<%--VOID-工单缴库表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='text-align:center;" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">")
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LOT' name='noprintset_LOT' class='datagrid-cell  " + ms.tdClass(formId, 'LOT') + "' style='" + ms.tdStyle(formId, 'LOT') + "' " + ms.tdEvent(formId, 'LOT') + ">")
                arrHtml.push("<span colno='LOT' class='" + ms.uiClass(formId, 'LOT') + "' style='text-align:center;" + ms.uiStyle(formId, 'LOT') + "' " + ms.uiEvent(formId, 'LOT') + " title='" + ms.titleAttr(formId, 'LOT', 'IS_TITLE_ATTR', v) + "' >" + v['LOT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_NUM') + "' style='" + ms.tdStyle(formId, 'ITEM_NUM') + "' " + ms.tdEvent(formId, 'ITEM_NUM') + ">")
                arrHtml.push("<span colno='ITEM_NUM' class='" + ms.uiClass(formId, 'ITEM_NUM') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_NUM') + "' " + ms.uiEvent(formId, 'ITEM_NUM') + " title='" + ms.titleAttr(formId, 'ITEM_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='BASE_UNIT' name='noprintset_BASE_UNIT' class='datagrid-cell  " + ms.tdClass(formId, 'BASE_UNIT') + "' style='" + ms.tdStyle(formId, 'BASE_UNIT') + "' " + ms.tdEvent(formId, 'BASE_UNIT') + ">")
                arrHtml.push("<span colno='BASE_UNIT' class='" + ms.uiClass(formId, 'BASE_UNIT') + "' style='text-align:center;" + ms.uiStyle(formId, 'BASE_UNIT') + "' " + ms.uiEvent(formId, 'BASE_UNIT') + " title='" + ms.titleAttr(formId, 'BASE_UNIT', 'IS_TITLE_ATTR', v) + "' >" + v['BASE_UNIT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_CODE') + "' style='" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">")
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T2#CI_ITEM_NAME' name='noprintset_T2#CI_ITEM_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'T2#CI_ITEM_NAME') + "' style='" + ms.tdStyle(formId, 'T2#CI_ITEM_NAME') + "' " + ms.tdEvent(formId, 'T2#CI_ITEM_NAME') + ">");
                arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='" + ms.uiClass(formId, 'T2#CI_ITEM_NAME') + "' style='" + ms.uiStyle(formId, 'T2#CI_ITEM_NAME') + "' " + ms.uiEvent(formId, 'T2#CI_ITEM_NAME') + " title='" + ms.titleAttr(formId, 'T2#CI_ITEM_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['T2#CI_ITEM_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T2#STOCK_CODE' name='noprintset_T2#STOCK_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'T2#STOCK_CODE') + "' style='" + ms.tdStyle(formId, 'T2#STOCK_CODE') + "' " + ms.tdEvent(formId, 'T2#STOCK_CODE') + ">");
                arrHtml.push("<span colno='T2#STOCK_CODE' class='" + ms.uiClass(formId, 'T2#STOCK_CODE') + "' style='" + ms.uiStyle(formId, 'T2#STOCK_CODE') + "' " + ms.uiEvent(formId, 'T2#STOCK_CODE') + " title='" + ms.titleAttr(formId, 'T2#STOCK_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['T2#STOCK_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T2#SAP_COLOR_CODE' name='noprintset_T2#SAP_COLOR_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'T2#SAP_COLOR_CODE') + "' style='" + ms.tdStyle(formId, 'T2#SAP_COLOR_CODE') + "' " + ms.tdEvent(formId, 'T2#SAP_COLOR_CODE') + ">");
                arrHtml.push("<span colno='T2#SAP_COLOR_CODE' class='" + ms.uiClass(formId, 'T2#SAP_COLOR_CODE') + "' style='" + ms.uiStyle(formId, 'T2#SAP_COLOR_CODE') + "' " + ms.uiEvent(formId, 'T2#SAP_COLOR_CODE') + " title='" + ms.titleAttr(formId, 'T2#SAP_COLOR_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['T2#SAP_COLOR_CODE'] + "</span>");
                arrHtml.push("</td>");


                arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  " + ms.tdClass(formId, 'WORK_SPACE') + "' style='" + ms.tdStyle(formId, 'WORK_SPACE') + "' " + ms.tdEvent(formId, 'WORK_SPACE') + ">")
                arrHtml.push("<span colno='WORK_SPACE' class='" + ms.uiClass(formId, 'WORK_SPACE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WORK_SPACE') + "' " + ms.uiEvent(formId, 'WORK_SPACE') + " title='" + ms.titleAttr(formId, 'WORK_SPACE', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_SPACE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell  " + ms.tdClass(formId, 'WARE_HOUSE') + "' style='" + ms.tdStyle(formId, 'WARE_HOUSE') + "' " + ms.tdEvent(formId, 'WARE_HOUSE') + ">")
                arrHtml.push("<span colno='WARE_HOUSE' class='" + ms.uiClass(formId, 'WARE_HOUSE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WARE_HOUSE') + "' " + ms.uiEvent(formId, 'WARE_HOUSE') + " title='" + ms.titleAttr(formId, 'WARE_HOUSE', 'IS_TITLE_ATTR', v) + "' >" + v['WARE_HOUSE'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_SN') + "' style='" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">")
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REVERSE' name='noprintset_REVERSE' class='datagrid-cell  " + ms.tdClass(formId, 'REVERSE') + "' style='" + ms.tdStyle(formId, 'REVERSE') + "' " + ms.tdEvent(formId, 'REVERSE') + ">")
                arrHtml.push("<span colno='REVERSE' class='" + ms.uiClass(formId, 'REVERSE') + "' style='text-align:center;" + ms.uiStyle(formId, 'REVERSE') + "' " + ms.uiEvent(formId, 'REVERSE') + " title='" + ms.titleAttr(formId, 'REVERSE', 'IS_TITLE_ATTR', v) + "' >" + v['REVERSE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell  " + ms.tdClass(formId, 'SFLAG') + "' style='text-align:center " + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">")
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell  " + ms.tdClass(formId, 'MESSAGE') + "' style='" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">")
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>")
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
        setScroll(formId);
    }
</script>
<script>
    <%--生成异步表格--%>

    function createTableModel_print(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == '2c88768c86a3467f901210be05a180a9') {<%--VOID-工单缴库表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">")
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_CODE') + "' style='" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">")
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LOT' name='noprintset_LOT' class='datagrid-cell " + ms.tdClass(formId, 'LOT') + "' style='" + ms.tdStyle(formId, 'LOT') + "' " + ms.tdEvent(formId, 'LOT') + ">")
                arrHtml.push("<span colno='LOT' class='" + ms.uiClass(formId, 'LOT') + "' style='" + ms.uiStyle(formId, 'LOT') + "' " + ms.uiEvent(formId, 'LOT') + " title='" + ms.titleAttr(formId, 'LOT', 'IS_TITLE_ATTR', v) + "' >" + v['LOT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell " + ms.tdClass(formId, 'WORK_SPACE') + "' style='" + ms.tdStyle(formId, 'WORK_SPACE') + "' " + ms.tdEvent(formId, 'WORK_SPACE') + ">")
                arrHtml.push("<span colno='WORK_SPACE' class='" + ms.uiClass(formId, 'WORK_SPACE') + "' style='" + ms.uiStyle(formId, 'WORK_SPACE') + "' " + ms.uiEvent(formId, 'WORK_SPACE') + " title='" + ms.titleAttr(formId, 'WORK_SPACE', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_SPACE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell " + ms.tdClass(formId, 'WARE_HOUSE') + "' style='" + ms.tdStyle(formId, 'WARE_HOUSE') + "' " + ms.tdEvent(formId, 'WARE_HOUSE') + ">")
                arrHtml.push("<span colno='WARE_HOUSE' class='" + ms.uiClass(formId, 'WARE_HOUSE') + "' style='" + ms.uiStyle(formId, 'WARE_HOUSE') + "' " + ms.uiEvent(formId, 'WARE_HOUSE') + " title='" + ms.titleAttr(formId, 'WARE_HOUSE', 'IS_TITLE_ATTR', v) + "' >" + v['WARE_HOUSE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_NUM') + "' style='" + ms.tdStyle(formId, 'ITEM_NUM') + "' " + ms.tdEvent(formId, 'ITEM_NUM') + ">")
                arrHtml.push("<span colno='ITEM_NUM' class='" + ms.uiClass(formId, 'ITEM_NUM') + "' style='" + ms.uiStyle(formId, 'ITEM_NUM') + "' " + ms.uiEvent(formId, 'ITEM_NUM') + " title='" + ms.titleAttr(formId, 'ITEM_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='BASE_UNIT' name='noprintset_BASE_UNIT' class='datagrid-cell " + ms.tdClass(formId, 'BASE_UNIT') + "' style='" + ms.tdStyle(formId, 'BASE_UNIT') + "' " + ms.tdEvent(formId, 'BASE_UNIT') + ">")
                arrHtml.push("<span colno='BASE_UNIT' class='" + ms.uiClass(formId, 'BASE_UNIT') + "' style='" + ms.uiStyle(formId, 'BASE_UNIT') + "' " + ms.uiEvent(formId, 'BASE_UNIT') + " title='" + ms.titleAttr(formId, 'BASE_UNIT', 'IS_TITLE_ATTR', v) + "' >" + v['BASE_UNIT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_SN') + "' style='" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">")
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REVERSE' name='noprintset_REVERSE' class='datagrid-cell " + ms.tdClass(formId, 'REVERSE') + "' style='" + ms.tdStyle(formId, 'REVERSE') + "' " + ms.tdEvent(formId, 'REVERSE') + ">")
                arrHtml.push("<span colno='REVERSE' class='" + ms.uiClass(formId, 'REVERSE') + "' style='" + ms.uiStyle(formId, 'REVERSE') + "' " + ms.uiEvent(formId, 'REVERSE') + " title='" + ms.titleAttr(formId, 'REVERSE', 'IS_TITLE_ATTR', v) + "' >" + v['REVERSE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell " + ms.tdClass(formId, 'SFLAG') + "' style='" + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">")
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell " + ms.tdClass(formId, 'MESSAGE') + "' style='" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">")
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_print_" + formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);
        setScroll(formId);
    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
<script type="text/javascript">

    $(function () {
        $("#DATA_AUTH").width("150px");
        $("#DATA_AUTH_chosen").width("150px");
    });
</script>
