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
        <dict:lang value="默认库位配置"/>
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
    <bu:header formId="156afc67d65c4cf0bd0ac3e81ec0f359"/>


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
            <bu:func viewId="6fdec9c4f0fb4ac8be8f8f9c320c2ebc"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="6fdec9c4f0fb4ac8be8f8f9c320c2ebc"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPage156afc67d65c4cf0bd0ac3e81ec0f359" id="formPage156afc67d65c4cf0bd0ac3e81ec0f359" value="${formPage156afc67d65c4cf0bd0ac3e81ec0f359}"/>
                <input type="hidden" name="formId" id="formId1" value='156afc67d65c4cf0bd0ac3e81ec0f359'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1" id="156afc67d65c4cf0bd0ac3e81ec0f359">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax156afc67d65c4cf0bd0ac3e81ec0f359" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner156afc67d65c4cf0bd0ac3e81ec0f359">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable156afc67d65c4cf0bd0ac3e81ec0f359">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="156afc67d65c4cf0bd0ac3e81ec0f359" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_156afc67d65c4cf0bd0ac3e81ec0f359" onclick="_selectAjaxTableAllData(this,'156afc67d65c4cf0bd0ac3e81ec0f359')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td style="width:150px; text-align:center" name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_WORK_SPACE" class="datagrid-cell">
                                            <bu:uitn colNo="WORK_SPACE" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_WORK_CENTER" class="datagrid-cell">
                                            <bu:uitn colNo="WORK_CENTER" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_WARE_HOUSE" class="datagrid-cell">
                                            <bu:uitn colNo="WARE_HOUSE" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:140px; text-align:center" name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_EDIT_USER" class="datagrid-cell">
                                            <bu:uitn colNo="EDIT_USER" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                        <td style="width:140px; text-align:center" name="noprintset_EDIT_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="EDIT_TIME" formId="156afc67d65c4cf0bd0ac3e81ec0f359"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv156afc67d65c4cf0bd0ac3e81ec0f359" onscroll="ajaxTableScroll(this,'156afc67d65c4cf0bd0ac3e81ec0f359')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax156afc67d65c4cf0bd0ac3e81ec0f359">
                                <tbody id="tbody_156afc67d65c4cf0bd0ac3e81ec0f359" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage156afc67d65c4cf0bd0ac3e81ec0f359==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=156afc67d65c4cf0bd0ac3e81ec0f359&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('156afc67d65c4cf0bd0ac3e81ec0f359','1');">打印</button>
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
                                    <span>工作中心</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WORK_CENTER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WORK_CENTER" value="" title_name="工作中心"/>px
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
                                    <span>创建人</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CREATE_USER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CREATE_USER" value="" title_name="创建人"/>px
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
                                    <span>修改人</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="EDIT_USER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="EDIT_USER" value="" title_name="修改人"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>修改时间</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="EDIT_TIME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="EDIT_TIME" value="" title_name="修改时间"/>px
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
<bu:submit viewId="6fdec9c4f0fb4ac8be8f8f9c320c2ebc"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="6fdec9c4f0fb4ac8be8f8f9c320c2ebc"/>

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
        if (formId == '156afc67d65c4cf0bd0ac3e81ec0f359') {<%--默认库位配置表单--%>
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
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='text-align:center;" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  " + ms.tdClass(formId, 'WORK_SPACE') + "' style='text-align:center;" + ms.tdStyle(formId, 'WORK_SPACE') + "' " + ms.tdEvent(formId, 'WORK_SPACE') + ">");
                arrHtml.push("<span colno='WORK_SPACE' class='" + ms.uiClass(formId, 'WORK_SPACE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WORK_SPACE') + "' " + ms.uiEvent(formId, 'WORK_SPACE') + " title='" + ms.titleAttr(formId, 'WORK_SPACE', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_SPACE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_CENTER' name='noprintset_WORK_CENTER' class='datagrid-cell  " + ms.tdClass(formId, 'WORK_CENTER') + "' style='text-align:center;" + ms.tdStyle(formId, 'WORK_CENTER') + "' " + ms.tdEvent(formId, 'WORK_CENTER') + ">");
                arrHtml.push("<span colno='WORK_CENTER' class='" + ms.uiClass(formId, 'WORK_CENTER') + "' style='text-align:center;" + ms.uiStyle(formId, 'WORK_CENTER') + "' " + ms.uiEvent(formId, 'WORK_CENTER') + " title='" + ms.titleAttr(formId, 'WORK_CENTER', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_CENTER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell  " + ms.tdClass(formId, 'WARE_HOUSE') + "' style='text-align:center;" + ms.tdStyle(formId, 'WARE_HOUSE') + "' " + ms.tdEvent(formId, 'WARE_HOUSE') + ">");
                arrHtml.push("<span colno='WARE_HOUSE' class='" + ms.uiClass(formId, 'WARE_HOUSE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WARE_HOUSE') + "' " + ms.uiEvent(formId, 'WARE_HOUSE') + " title='" + ms.titleAttr(formId, 'WARE_HOUSE', 'IS_TITLE_ATTR', v) + "' >" + v['WARE_HOUSE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">");
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='text-align:center;" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='text-align:center;" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
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
        if (formId == '156afc67d65c4cf0bd0ac3e81ec0f359') {<%--默认库位配置表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell " + ms.tdClass(formId, 'WORK_SPACE') + "' style='text-align:center;" + ms.tdStyle(formId, 'WORK_SPACE') + "' " + ms.tdEvent(formId, 'WORK_SPACE') + ">");
                arrHtml.push("<span colno='WORK_SPACE' class='" + ms.uiClass(formId, 'WORK_SPACE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WORK_SPACE') + "' " + ms.uiEvent(formId, 'WORK_SPACE') + " title='" + ms.titleAttr(formId, 'WORK_SPACE', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_SPACE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_CENTER' name='noprintset_WORK_CENTER' class='datagrid-cell " + ms.tdClass(formId, 'WORK_CENTER') + "' style='text-align:center;" + ms.tdStyle(formId, 'WORK_CENTER') + "' " + ms.tdEvent(formId, 'WORK_CENTER') + ">");
                arrHtml.push("<span colno='WORK_CENTER' class='" + ms.uiClass(formId, 'WORK_CENTER') + "' style='text-align:center;" + ms.uiStyle(formId, 'WORK_CENTER') + "' " + ms.uiEvent(formId, 'WORK_CENTER') + " title='" + ms.titleAttr(formId, 'WORK_CENTER', 'IS_TITLE_ATTR', v) + "' >" + v['WORK_CENTER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell " + ms.tdClass(formId, 'WARE_HOUSE') + "' style='text-align:center;" + ms.tdStyle(formId, 'WARE_HOUSE') + "' " + ms.tdEvent(formId, 'WARE_HOUSE') + ">");
                arrHtml.push("<span colno='WARE_HOUSE' class='" + ms.uiClass(formId, 'WARE_HOUSE') + "' style='text-align:center;" + ms.uiStyle(formId, 'WARE_HOUSE') + "' " + ms.uiEvent(formId, 'WARE_HOUSE') + " title='" + ms.titleAttr(formId, 'WARE_HOUSE', 'IS_TITLE_ATTR', v) + "' >" + v['WARE_HOUSE'] + "</span>");
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
