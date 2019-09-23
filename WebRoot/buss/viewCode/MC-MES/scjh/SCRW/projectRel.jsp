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
        <dict:lang value="VOID-工单关联列表"/>
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
    <bu:header formId="7be0e5e80b8f4977ba730bfdc6e382ae"/>

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
            <bu:func viewId="6e322a8459e943b391804b69a19cffb9"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>

                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="6e322a8459e943b391804b69a19cffb9"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPage7be0e5e80b8f4977ba730bfdc6e382ae" id="formPage7be0e5e80b8f4977ba730bfdc6e382ae" value="${formPage7be0e5e80b8f4977ba730bfdc6e382ae}"/>
                <input type="hidden" name="formId" id="formId1" value='7be0e5e80b8f4977ba730bfdc6e382ae'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1" id="7be0e5e80b8f4977ba730bfdc6e382ae">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7be0e5e80b8f4977ba730bfdc6e382ae" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner7be0e5e80b8f4977ba730bfdc6e382ae">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable7be0e5e80b8f4977ba730bfdc6e382ae">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="7be0e5e80b8f4977ba730bfdc6e382ae" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_7be0e5e80b8f4977ba730bfdc6e382ae" onclick="_selectAjaxTableAllData(this,'7be0e5e80b8f4977ba730bfdc6e382ae')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <%--
                                        <td name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td name="noprintset_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td name="noprintset_REL_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="REL_PROJECT_ID" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        --%>
                                        <td class="datagrid-cell" style="width:200px;">
                                            <bu:uitn colNo="DATA_AUTH" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="REL_PROJECT_ID" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                            <bu:uitn colNo="CREATE_USER" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                        <td class="datagrid-cell" style="width:140px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="7be0e5e80b8f4977ba730bfdc6e382ae"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv7be0e5e80b8f4977ba730bfdc6e382ae" onscroll="ajaxTableScroll(this,'7be0e5e80b8f4977ba730bfdc6e382ae')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax7be0e5e80b8f4977ba730bfdc6e382ae">
                                <tbody id="tbody_7be0e5e80b8f4977ba730bfdc6e382ae" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <c:if test="${formPage7be0e5e80b8f4977ba730bfdc6e382ae==1}">

                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=7be0e5e80b8f4977ba730bfdc6e382ae&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('7be0e5e80b8f4977ba730bfdc6e382ae','1');">打印</button>
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
                                    <span>?工单ID</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="?工单ID"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?关联工单ID</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REL_PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REL_PROJECT_ID" value="" title_name="?关联工单ID"/>px
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
<bu:submit viewId="6e322a8459e943b391804b69a19cffb9"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="6e322a8459e943b391804b69a19cffb9"/>

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
        var uiRaw = ms.uiRaw(formId) == null ? [] : ms.uiRaw(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == '7be0e5e80b8f4977ba730bfdc6e382ae') {<%--工单关联表单--%>
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
/*
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell  " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");
*/

                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='width:200px;text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + v['DATA_AUTH'] + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /> ");
                arrHtml.push("</td>");

/*
                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='width:150px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + v['PROJECT_ID'] + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");
*/
                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' onclick='itemJump1(\""+v['PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>")
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");

/*
                arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'REL_PROJECT_ID') + "' " + ms.tdEvent(formId, 'REL_PROJECT_ID') + ">")
                arrHtml.push("<span colno='REL_PROJECT_ID' class='" + ms.uiClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'REL_PROJECT_ID') + "' " + ms.uiEvent(formId, 'REL_PROJECT_ID') + " title='" + ms.titleAttr(formId, 'REL_PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['REL_PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");
*/

                arrHtml.push("<td colno='REL_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'REL_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'REL_PROJECT_ID')+"' "+ms.tdEvent(formId, 'REL_PROJECT_ID')+">")
                arrHtml.push("<span colno='REL_PROJECT_ID' class='"+ms.uiClass(formId, 'REL_PROJECT_ID')+"' onclick='itemJump1(\""+v['REL_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'REL_PROJECT_ID')+" title='"+ms.titleAttr(formId,'REL_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['REL_PROJECT_ID']+"</span>")
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");


                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>")
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
        if (formId == '7be0e5e80b8f4977ba730bfdc6e382ae') {<%--工单关联表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell  " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'REL_PROJECT_ID') + "' " + ms.tdEvent(formId, 'REL_PROJECT_ID') + ">")
                arrHtml.push("<span colno='REL_PROJECT_ID' class='" + ms.uiClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'REL_PROJECT_ID') + "' " + ms.uiEvent(formId, 'REL_PROJECT_ID') + " title='" + ms.titleAttr(formId, 'REL_PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['REL_PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>")
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

<script TYPE="text/javascript">
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
