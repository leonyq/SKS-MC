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
        <dict:lang value="VOID-RFC接口日志"/>
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
    <bu:header formId="7132154349de44f6a85b24ed69b29b03"/>

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
            <bu:func viewId="ddb30f5c465c4319840de5cd682e9a74"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>

                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="ddb30f5c465c4319840de5cd682e9a74"/>
                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPage7132154349de44f6a85b24ed69b29b03" id="formPage7132154349de44f6a85b24ed69b29b03" value="${formPage7132154349de44f6a85b24ed69b29b03}"/>
                <input type="hidden" name="formId" id="formId1" value='7132154349de44f6a85b24ed69b29b03'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1" id="7132154349de44f6a85b24ed69b29b03">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7132154349de44f6a85b24ed69b29b03" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner7132154349de44f6a85b24ed69b29b03">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable7132154349de44f6a85b24ed69b29b03">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="7132154349de44f6a85b24ed69b29b03" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_7132154349de44f6a85b24ed69b29b03" onclick="_selectAjaxTableAllData(this,'7132154349de44f6a85b24ed69b29b03')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td style="width:200px; text-align:center" name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_FUNC_NAME" class="datagrid-cell">
                                            <bu:uitn colNo="RL_FUNC_NAME" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_RL_FLAG" class="datagrid-cell">
                                            <bu:uitn colNo="RL_FLAG" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:150px; text-align:center" name="noprintset_RL_MESSAGE" class="datagrid-cell">
                                            <bu:uitn colNo="RL_MESSAGE" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_IMPORT" class="datagrid-cell">
                                            <bu:uitn colNo="RL_IMPORT" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_EXPORT" class="datagrid-cell">
                                            <bu:uitn colNo="RL_EXPORT" formId="7132154349de44f6a85b24ed69b29b03"/></td>
<%--
                                        <td style="width:200px; text-align:center" name="noprintset_RL_SY_ERROR" class="datagrid-cell">
                                            <bu:uitn colNo="RL_SY_ERROR" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_TABLES" class="datagrid-cell">
                                            <bu:uitn colNo="RL_TABLES" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_CHANGING" class="datagrid-cell">
                                            <bu:uitn colNo="RL_CHANGING" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_RL_EXCEPTIONS" class="datagrid-cell">
                                            <bu:uitn colNo="RL_EXCEPTIONS" formId="7132154349de44f6a85b24ed69b29b03"/></td>
--%>

                                        <td style="width:140px; text-align:center" name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="7132154349de44f6a85b24ed69b29b03"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv7132154349de44f6a85b24ed69b29b03" onscroll="ajaxTableScroll(this,'7132154349de44f6a85b24ed69b29b03')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax7132154349de44f6a85b24ed69b29b03">
                                <tbody id="tbody_7132154349de44f6a85b24ed69b29b03" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage7132154349de44f6a85b24ed69b29b03==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=7132154349de44f6a85b24ed69b29b03&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('7132154349de44f6a85b24ed69b29b03','1');">打印</button>
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
                                    <span>?SAP接口名称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_FUNC_NAME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_FUNC_NAME" value="" title_name="?SAP接口名称"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?同步结果</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_FLAG" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_FLAG" value="" title_name="?同步结果"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?消息文本</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_MESSAGE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_MESSAGE" value="" title_name="?消息文本"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?接口输入</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_IMPORT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_IMPORT" value="" title_name="?接口输入"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?接口输出</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_EXPORT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_EXPORT" value="" title_name="?接口输出"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?系统异常</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_SY_ERROR" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_SY_ERROR" value="" title_name="?系统异常"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?RL_TABLES</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_TABLES" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_TABLES" value="" title_name="?RL_TABLES"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?RL_CHANGING</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_CHANGING" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_CHANGING" value="" title_name="?RL_CHANGING"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?RL_EXCEPTIONS</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="RL_EXCEPTIONS" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="RL_EXCEPTIONS" value="" title_name="?RL_EXCEPTIONS"/>px
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
<bu:submit viewId="ddb30f5c465c4319840de5cd682e9a74"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="ddb30f5c465c4319840de5cd682e9a74"/>

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
        if (formId == '7132154349de44f6a85b24ed69b29b03') {<%--VOID-RFC接口日志表单--%>
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
                arrHtml.push("<td style='text-align:center;' colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_FUNC_NAME' name='noprintset_RL_FUNC_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'RL_FUNC_NAME') + "' style='" + ms.tdStyle(formId, 'RL_FUNC_NAME') + "' " + ms.tdEvent(formId, 'RL_FUNC_NAME') + ">");
                arrHtml.push("<span colno='RL_FUNC_NAME' class='" + ms.uiClass(formId, 'RL_FUNC_NAME') + "' style='" + ms.uiStyle(formId, 'RL_FUNC_NAME') + "' " + ms.uiEvent(formId, 'RL_FUNC_NAME') + " title='" + ms.titleAttr(formId, 'RL_FUNC_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['RL_FUNC_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td style='text-align:center;' colno='RL_FLAG' name='noprintset_RL_FLAG' class='datagrid-cell " + ms.tdClass(formId, 'RL_FLAG') + "' style='" + ms.tdStyle(formId, 'RL_FLAG') + "' " + ms.tdEvent(formId, 'RL_FLAG') + ">");
                arrHtml.push("<span colno='RL_FLAG' class='" + ms.uiClass(formId, 'RL_FLAG') + "' style='" + ms.uiStyle(formId, 'RL_FLAG') + "' " + ms.uiEvent(formId, 'RL_FLAG') + " title='" + ms.titleAttr(formId, 'RL_FLAG', 'IS_TITLE_ATTR', v) + "' >" + v['RL_FLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_MESSAGE' name='noprintset_RL_MESSAGE' class='datagrid-cell  " + ms.tdClass(formId, 'RL_MESSAGE') + "' style='" + ms.tdStyle(formId, 'RL_MESSAGE') + "' " + ms.tdEvent(formId, 'RL_MESSAGE') + ">");
                arrHtml.push("<span colno='RL_MESSAGE' class='" + ms.uiClass(formId, 'RL_MESSAGE') + "' style='" + ms.uiStyle(formId, 'RL_MESSAGE') + "' " + ms.uiEvent(formId, 'RL_MESSAGE') + " title='" + ms.titleAttr(formId, 'RL_MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['RL_MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_IMPORT' name='noprintset_RL_IMPORT' class='datagrid-cell  " + ms.tdClass(formId, 'RL_IMPORT') + "' style='" + ms.tdStyle(formId, 'RL_IMPORT') + "' " + ms.tdEvent(formId, 'RL_IMPORT') + ">");
                arrHtml.push("<span colno='RL_IMPORT' class='" + ms.uiClass(formId, 'RL_IMPORT') + "' style='" + ms.uiStyle(formId, 'RL_IMPORT') + "' " + ms.uiEvent(formId, 'RL_IMPORT') + " title='" + ms.titleAttr(formId, 'RL_IMPORT', 'IS_TITLE_ATTR', v) + "' >" + v['RL_IMPORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_EXPORT' name='noprintset_RL_EXPORT' class='datagrid-cell  " + ms.tdClass(formId, 'RL_EXPORT') + "' style='" + ms.tdStyle(formId, 'RL_EXPORT') + "' " + ms.tdEvent(formId, 'RL_EXPORT') + ">");
                arrHtml.push("<span colno='RL_EXPORT' class='" + ms.uiClass(formId, 'RL_EXPORT') + "' style='" + ms.uiStyle(formId, 'RL_EXPORT') + "' " + ms.uiEvent(formId, 'RL_EXPORT') + " title='" + ms.titleAttr(formId, 'RL_EXPORT', 'IS_TITLE_ATTR', v) + "' >" + v['RL_EXPORT'] + "</span>");
                arrHtml.push("</td>");
/*
                arrHtml.push("<td colno='RL_SY_ERROR' name='noprintset_RL_SY_ERROR' class='datagrid-cell  " + ms.tdClass(formId, 'RL_SY_ERROR') + "' style='" + ms.tdStyle(formId, 'RL_SY_ERROR') + "' " + ms.tdEvent(formId, 'RL_SY_ERROR') + ">")
                arrHtml.push("<span colno='RL_SY_ERROR' class='" + ms.uiClass(formId, 'RL_SY_ERROR') + "' style='" + ms.uiStyle(formId, 'RL_SY_ERROR') + "' " + ms.uiEvent(formId, 'RL_SY_ERROR') + " title='" + ms.titleAttr(formId, 'RL_SY_ERROR', 'IS_TITLE_ATTR', v) + "' >" + v['RL_SY_ERROR'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_TABLES' name='noprintset_RL_TABLES' class='datagrid-cell  " + ms.tdClass(formId, 'RL_TABLES') + "' style='" + ms.tdStyle(formId, 'RL_TABLES') + "' " + ms.tdEvent(formId, 'RL_TABLES') + ">")
                arrHtml.push("<span colno='RL_TABLES' class='" + ms.uiClass(formId, 'RL_TABLES') + "' style='" + ms.uiStyle(formId, 'RL_TABLES') + "' " + ms.uiEvent(formId, 'RL_TABLES') + " title='" + ms.titleAttr(formId, 'RL_TABLES', 'IS_TITLE_ATTR', v) + "' >" + v['RL_TABLES'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_CHANGING' name='noprintset_RL_CHANGING' class='datagrid-cell  " + ms.tdClass(formId, 'RL_CHANGING') + "' style='" + ms.tdStyle(formId, 'RL_CHANGING') + "' " + ms.tdEvent(formId, 'RL_CHANGING') + ">")
                arrHtml.push("<span colno='RL_CHANGING' class='" + ms.uiClass(formId, 'RL_CHANGING') + "' style='" + ms.uiStyle(formId, 'RL_CHANGING') + "' " + ms.uiEvent(formId, 'RL_CHANGING') + " title='" + ms.titleAttr(formId, 'RL_CHANGING', 'IS_TITLE_ATTR', v) + "' >" + v['RL_CHANGING'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_EXCEPTIONS' name='noprintset_RL_EXCEPTIONS' class='datagrid-cell  " + ms.tdClass(formId, 'RL_EXCEPTIONS') + "' style='" + ms.tdStyle(formId, 'RL_EXCEPTIONS') + "' " + ms.tdEvent(formId, 'RL_EXCEPTIONS') + ">")
                arrHtml.push("<span colno='RL_EXCEPTIONS' class='" + ms.uiClass(formId, 'RL_EXCEPTIONS') + "' style='" + ms.uiStyle(formId, 'RL_EXCEPTIONS') + "' " + ms.uiEvent(formId, 'RL_EXCEPTIONS') + " title='" + ms.titleAttr(formId, 'RL_EXCEPTIONS', 'IS_TITLE_ATTR', v) + "' >" + v['RL_EXCEPTIONS'] + "</span>")
                arrHtml.push("</td>");
*/
                arrHtml.push("<td style='text-align:center;' colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td style='text-align:center;' colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
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
        if (formId == '7132154349de44f6a85b24ed69b29b03') {<%--VOID-RFC接口日志表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='RL_FUNC_NAME' name='noprintset_RL_FUNC_NAME' class='datagrid-cell " + ms.tdClass(formId, 'RL_FUNC_NAME') + "' style='" + ms.tdStyle(formId, 'RL_FUNC_NAME') + "' " + ms.tdEvent(formId, 'RL_FUNC_NAME') + ">");
                arrHtml.push("<span colno='RL_FUNC_NAME' class='" + ms.uiClass(formId, 'RL_FUNC_NAME') + "' style='" + ms.uiStyle(formId, 'RL_FUNC_NAME') + "' " + ms.uiEvent(formId, 'RL_FUNC_NAME') + " title='" + ms.titleAttr(formId, 'RL_FUNC_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['RL_FUNC_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_FLAG' name='noprintset_RL_FLAG' class='datagrid-cell " + ms.tdClass(formId, 'RL_FLAG') + "' style='" + ms.tdStyle(formId, 'RL_FLAG') + "' " + ms.tdEvent(formId, 'RL_FLAG') + ">");
                arrHtml.push("<span colno='RL_FLAG' class='" + ms.uiClass(formId, 'RL_FLAG') + "' style='" + ms.uiStyle(formId, 'RL_FLAG') + "' " + ms.uiEvent(formId, 'RL_FLAG') + " title='" + ms.titleAttr(formId, 'RL_FLAG', 'IS_TITLE_ATTR', v) + "' >" + v['RL_FLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_MESSAGE' name='noprintset_RL_MESSAGE' class='datagrid-cell " + ms.tdClass(formId, 'RL_MESSAGE') + "' style='" + ms.tdStyle(formId, 'RL_MESSAGE') + "' " + ms.tdEvent(formId, 'RL_MESSAGE') + ">");
                arrHtml.push("<span colno='RL_MESSAGE' class='" + ms.uiClass(formId, 'RL_MESSAGE') + "' style='" + ms.uiStyle(formId, 'RL_MESSAGE') + "' " + ms.uiEvent(formId, 'RL_MESSAGE') + " title='" + ms.titleAttr(formId, 'RL_MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['RL_MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_IMPORT' name='noprintset_RL_IMPORT' class='datagrid-cell " + ms.tdClass(formId, 'RL_IMPORT') + "' style='" + ms.tdStyle(formId, 'RL_IMPORT') + "' " + ms.tdEvent(formId, 'RL_IMPORT') + ">");
                arrHtml.push("<span colno='RL_IMPORT' class='" + ms.uiClass(formId, 'RL_IMPORT') + "' style='" + ms.uiStyle(formId, 'RL_IMPORT') + "' " + ms.uiEvent(formId, 'RL_IMPORT') + " title='" + ms.titleAttr(formId, 'RL_IMPORT', 'IS_TITLE_ATTR', v) + "' >" + v['RL_IMPORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_EXPORT' name='noprintset_RL_EXPORT' class='datagrid-cell " + ms.tdClass(formId, 'RL_EXPORT') + "' style='" + ms.tdStyle(formId, 'RL_EXPORT') + "' " + ms.tdEvent(formId, 'RL_EXPORT') + ">");
                arrHtml.push("<span colno='RL_EXPORT' class='" + ms.uiClass(formId, 'RL_EXPORT') + "' style='" + ms.uiStyle(formId, 'RL_EXPORT') + "' " + ms.uiEvent(formId, 'RL_EXPORT') + " title='" + ms.titleAttr(formId, 'RL_EXPORT', 'IS_TITLE_ATTR', v) + "' >" + v['RL_EXPORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_SY_ERROR' name='noprintset_RL_SY_ERROR' class='datagrid-cell " + ms.tdClass(formId, 'RL_SY_ERROR') + "' style='" + ms.tdStyle(formId, 'RL_SY_ERROR') + "' " + ms.tdEvent(formId, 'RL_SY_ERROR') + ">");
                arrHtml.push("<span colno='RL_SY_ERROR' class='" + ms.uiClass(formId, 'RL_SY_ERROR') + "' style='" + ms.uiStyle(formId, 'RL_SY_ERROR') + "' " + ms.uiEvent(formId, 'RL_SY_ERROR') + " title='" + ms.titleAttr(formId, 'RL_SY_ERROR', 'IS_TITLE_ATTR', v) + "' >" + v['RL_SY_ERROR'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_TABLES' name='noprintset_RL_TABLES' class='datagrid-cell " + ms.tdClass(formId, 'RL_TABLES') + "' style='" + ms.tdStyle(formId, 'RL_TABLES') + "' " + ms.tdEvent(formId, 'RL_TABLES') + ">");
                arrHtml.push("<span colno='RL_TABLES' class='" + ms.uiClass(formId, 'RL_TABLES') + "' style='" + ms.uiStyle(formId, 'RL_TABLES') + "' " + ms.uiEvent(formId, 'RL_TABLES') + " title='" + ms.titleAttr(formId, 'RL_TABLES', 'IS_TITLE_ATTR', v) + "' >" + v['RL_TABLES'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_CHANGING' name='noprintset_RL_CHANGING' class='datagrid-cell " + ms.tdClass(formId, 'RL_CHANGING') + "' style='" + ms.tdStyle(formId, 'RL_CHANGING') + "' " + ms.tdEvent(formId, 'RL_CHANGING') + ">");
                arrHtml.push("<span colno='RL_CHANGING' class='" + ms.uiClass(formId, 'RL_CHANGING') + "' style='" + ms.uiStyle(formId, 'RL_CHANGING') + "' " + ms.uiEvent(formId, 'RL_CHANGING') + " title='" + ms.titleAttr(formId, 'RL_CHANGING', 'IS_TITLE_ATTR', v) + "' >" + v['RL_CHANGING'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RL_EXCEPTIONS' name='noprintset_RL_EXCEPTIONS' class='datagrid-cell " + ms.tdClass(formId, 'RL_EXCEPTIONS') + "' style='" + ms.tdStyle(formId, 'RL_EXCEPTIONS') + "' " + ms.tdEvent(formId, 'RL_EXCEPTIONS') + ">");
                arrHtml.push("<span colno='RL_EXCEPTIONS' class='" + ms.uiClass(formId, 'RL_EXCEPTIONS') + "' style='" + ms.uiStyle(formId, 'RL_EXCEPTIONS') + "' " + ms.uiEvent(formId, 'RL_EXCEPTIONS') + " title='" + ms.titleAttr(formId, 'RL_EXCEPTIONS', 'IS_TITLE_ATTR', v) + "' >" + v['RL_EXCEPTIONS'] + "</span>");
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
