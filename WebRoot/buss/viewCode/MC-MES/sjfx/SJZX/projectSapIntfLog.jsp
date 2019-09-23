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
        <dict:lang value="VOID-工单日志接口"/>
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
    <bu:header formId="aea4491a7a9f4d028e283e0dbd24d6be"/>


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
            <bu:func viewId="00d5c687a05d42c89ea1e75d75b95b89"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="00d5c687a05d42c89ea1e75d75b95b89"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPageaea4491a7a9f4d028e283e0dbd24d6be" id="formPageaea4491a7a9f4d028e283e0dbd24d6be" value="${formPageaea4491a7a9f4d028e283e0dbd24d6be}"/>
                <input type="hidden" name="formId" id="formId1" value='aea4491a7a9f4d028e283e0dbd24d6be'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='c2594ebc9f4f46489cfebba54c37a13f'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='90716fb0552a4172aadeac93dd6f32f5'/>
                <div class="panel-ajax datagrid datagrid-div1" id="aea4491a7a9f4d028e283e0dbd24d6be">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxaea4491a7a9f4d028e283e0dbd24d6be" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inneraea4491a7a9f4d028e283e0dbd24d6be">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableaea4491a7a9f4d028e283e0dbd24d6be">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="aea4491a7a9f4d028e283e0dbd24d6be" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_aea4491a7a9f4d028e283e0dbd24d6be" onclick="_selectAjaxTableAllData(this,'aea4491a7a9f4d028e283e0dbd24d6be')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td style="width:140px; text-align:center" name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:150px; text-align:center" name="noprintset_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_INTF_TYPE" class="datagrid-cell">
                                            <bu:uitn colNo="INTF_TYPE" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_ITEM_SN" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_SN" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_SFLAG" class="datagrid-cell">
                                            <bu:uitn colNo="SFLAG" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:350px; text-align:center" name="noprintset_MESSAGE" class="datagrid-cell">
                                            <bu:uitn colNo="MESSAGE" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:140px; text-align:center" name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_SAP_INFO" class="datagrid-cell">
                                            <bu:uitn colNo="SAP_INFO" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                        <td name="noprintset_INTF_NAME" class="datagrid-cell">
                                            <bu:uitn colNo="INTF_NAME" formId="aea4491a7a9f4d028e283e0dbd24d6be"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivaea4491a7a9f4d028e283e0dbd24d6be" onscroll="ajaxTableScroll(this,'aea4491a7a9f4d028e283e0dbd24d6be')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxaea4491a7a9f4d028e283e0dbd24d6be">
                                <tbody id="tbody_aea4491a7a9f4d028e283e0dbd24d6be" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPageaea4491a7a9f4d028e283e0dbd24d6be==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=aea4491a7a9f4d028e283e0dbd24d6be&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('aea4491a7a9f4d028e283e0dbd24d6be','1');">打印</button>
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
                                    <span>接口类型</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="INTF_TYPE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="INTF_TYPE" value="" title_name="接口类型"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?产品料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ITEM_SN" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ITEM_SN" value="" title_name="?产品料号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?传输结果</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SFLAG" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SFLAG" value="" title_name="?传输结果"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?文本消息</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="MESSAGE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="MESSAGE" value="" title_name="?文本消息"/>px
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
                                    <span>?SAP消息</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SAP_INFO" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SAP_INFO" value="" title_name="?SAP消息"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>接口名称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="INTF_NAME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="INTF_NAME" value="" title_name="接口名称"/>px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="formPage90716fb0552a4172aadeac93dd6f32f5" id="formPage90716fb0552a4172aadeac93dd6f32f5" value="${formPage90716fb0552a4172aadeac93dd6f32f5}"/>
                <input type="hidden" name="formId" id="formId2" value='90716fb0552a4172aadeac93dd6f32f5'/>
                <div class="panel-ajax datagrid datagrid-div1" id="90716fb0552a4172aadeac93dd6f32f5">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax90716fb0552a4172aadeac93dd6f32f5" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner90716fb0552a4172aadeac93dd6f32f5">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable90716fb0552a4172aadeac93dd6f32f5">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="90716fb0552a4172aadeac93dd6f32f5" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_90716fb0552a4172aadeac93dd6f32f5" onclick="_selectAjaxTableAllData(this,'90716fb0552a4172aadeac93dd6f32f5')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td style="width:140px; text-align:center" name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:150px; text-align:center" name="noprintset_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_INTF_TYPE" class="datagrid-cell">
                                            <bu:uitn colNo="INTF_TYPE" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_ITEM_SN" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_SN" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_ITEM_CODE" class="datagrid-cell">
                                            <bu:uitn colNo="ITEM_CODE" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:80px; text-align:center" name="noprintset_SFLAG" class="datagrid-cell">
                                            <bu:uitn colNo="SFLAG" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:350px; text-align:center" name="noprintset_MESSAGE" class="datagrid-cell">
                                            <bu:uitn colNo="MESSAGE" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:100px; text-align:center" name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:140px; text-align:center" name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td style="width:200px; text-align:center" name="noprintset_SAP_INFO" class="datagrid-cell">
                                            <bu:uitn colNo="SAP_INFO" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                        <td name="noprintset_INTF_NAME" class="datagrid-cell">
                                            <bu:uitn colNo="INTF_NAME" formId="90716fb0552a4172aadeac93dd6f32f5"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv90716fb0552a4172aadeac93dd6f32f5" onscroll="ajaxTableScroll(this,'90716fb0552a4172aadeac93dd6f32f5')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajax90716fb0552a4172aadeac93dd6f32f5">
                                <tbody id="tbody_90716fb0552a4172aadeac93dd6f32f5" class="isChilds"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage90716fb0552a4172aadeac93dd6f32f5==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=90716fb0552a4172aadeac93dd6f32f5&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('90716fb0552a4172aadeac93dd6f32f5','1');">打印</button>
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
                                    <span>接口类型</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="INTF_TYPE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="INTF_TYPE" value="" title_name="接口类型"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?产品料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ITEM_SN" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ITEM_SN" value="" title_name="?产品料号"/>px
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
                                    <span>?传输结果</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SFLAG" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SFLAG" value="" title_name="?传输结果"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?文本消息</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="MESSAGE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="MESSAGE" value="" title_name="?文本消息"/>px
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
                                    <span>?SAP消息</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SAP_INFO" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SAP_INFO" value="" title_name="?SAP消息"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>接口名称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="INTF_NAME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="INTF_NAME" value="" title_name="接口名称"/>px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
                <input type="hidden" name="tableCount" id="tableCount" value='2'/>

            </form>
        </div>
    </div>
</div>
<bu:submit viewId="00d5c687a05d42c89ea1e75d75b95b89"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="00d5c687a05d42c89ea1e75d75b95b89"/>

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
        if (formId == 'aea4491a7a9f4d028e283e0dbd24d6be') {<%--VOID-SAP工单接口日志--%>
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
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_TYPE' name='noprintset_INTF_TYPE' class='datagrid-cell  " + ms.tdClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_TYPE') + "' " + ms.tdEvent(formId, 'INTF_TYPE') + ">");
                arrHtml.push("<span colno='INTF_TYPE' class='" + ms.uiClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_TYPE') + "' " + ms.uiEvent(formId, 'INTF_TYPE') + " title='" + ms.titleAttr(formId, 'INTF_TYPE', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_TYPE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">");
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell  " + ms.tdClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">");
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell  " + ms.tdClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">");
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_INFO' name='noprintset_SAP_INFO' class='datagrid-cell  " + ms.tdClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.tdStyle(formId, 'SAP_INFO') + "' " + ms.tdEvent(formId, 'SAP_INFO') + ">");
                arrHtml.push("<span colno='SAP_INFO' class='" + ms.uiClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.uiStyle(formId, 'SAP_INFO') + "' " + ms.uiEvent(formId, 'SAP_INFO') + " title='" + ms.titleAttr(formId, 'SAP_INFO', 'IS_TITLE_ATTR', v) + "' >" + v['SAP_INFO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_NAME' name='noprintset_INTF_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_NAME') + "' " + ms.tdEvent(formId, 'INTF_NAME') + ">");
                arrHtml.push("<span colno='INTF_NAME' class='" + ms.uiClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_NAME') + "' " + ms.uiEvent(formId, 'INTF_NAME') + " title='" + ms.titleAttr(formId, 'INTF_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        if (formId == '90716fb0552a4172aadeac93dd6f32f5') {<%--VOID-SAP工单接口日志明细--%>
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
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_TYPE' name='noprintset_INTF_TYPE' class='datagrid-cell  " + ms.tdClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_TYPE') + "' " + ms.tdEvent(formId, 'INTF_TYPE') + ">");
                arrHtml.push("<span colno='INTF_TYPE' class='" + ms.uiClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_TYPE') + "' " + ms.uiEvent(formId, 'INTF_TYPE') + " title='" + ms.titleAttr(formId, 'INTF_TYPE', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_TYPE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">");
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_CODE') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">");
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell  " + ms.tdClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">");
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell  " + ms.tdClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">");
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='text-align:center;" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_INFO' name='noprintset_SAP_INFO' class='datagrid-cell  " + ms.tdClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.tdStyle(formId, 'SAP_INFO') + "' " + ms.tdEvent(formId, 'SAP_INFO') + ">");
                arrHtml.push("<span colno='SAP_INFO' class='" + ms.uiClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.uiStyle(formId, 'SAP_INFO') + "' " + ms.uiEvent(formId, 'SAP_INFO') + " title='" + ms.titleAttr(formId, 'SAP_INFO', 'IS_TITLE_ATTR', v) + "' >" + v['SAP_INFO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_NAME' name='noprintset_INTF_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_NAME') + "' " + ms.tdEvent(formId, 'INTF_NAME') + ">");
                arrHtml.push("<span colno='INTF_NAME' class='" + ms.uiClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_NAME') + "' " + ms.uiEvent(formId, 'INTF_NAME') + " title='" + ms.titleAttr(formId, 'INTF_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_NAME'] + "</span>");
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
        if (formId == 'aea4491a7a9f4d028e283e0dbd24d6be') {<%--VOID-SAP工单接口日志--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_TYPE' name='noprintset_INTF_TYPE' class='datagrid-cell " + ms.tdClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_TYPE') + "' " + ms.tdEvent(formId, 'INTF_TYPE') + ">");
                arrHtml.push("<span colno='INTF_TYPE' class='" + ms.uiClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_TYPE') + "' " + ms.uiEvent(formId, 'INTF_TYPE') + " title='" + ms.titleAttr(formId, 'INTF_TYPE', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_TYPE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">");
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell " + ms.tdClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">");
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell " + ms.tdClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">");
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_INFO' name='noprintset_SAP_INFO' class='datagrid-cell " + ms.tdClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.tdStyle(formId, 'SAP_INFO') + "' " + ms.tdEvent(formId, 'SAP_INFO') + ">");
                arrHtml.push("<span colno='SAP_INFO' class='" + ms.uiClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.uiStyle(formId, 'SAP_INFO') + "' " + ms.uiEvent(formId, 'SAP_INFO') + " title='" + ms.titleAttr(formId, 'SAP_INFO', 'IS_TITLE_ATTR', v) + "' >" + v['SAP_INFO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_NAME' name='noprintset_INTF_NAME' class='datagrid-cell " + ms.tdClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_NAME') + "' " + ms.tdEvent(formId, 'INTF_NAME') + ">");
                arrHtml.push("<span colno='INTF_NAME' class='" + ms.uiClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_NAME') + "' " + ms.uiEvent(formId, 'INTF_NAME') + " title='" + ms.titleAttr(formId, 'INTF_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_print_" + formId).html(arrHtml.join(""));
        }
        if (formId == '90716fb0552a4172aadeac93dd6f32f5') {<%--VOID-SAP工单接口日志明细--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='text-align:center;" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_TYPE' name='noprintset_INTF_TYPE' class='datagrid-cell " + ms.tdClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_TYPE') + "' " + ms.tdEvent(formId, 'INTF_TYPE') + ">");
                arrHtml.push("<span colno='INTF_TYPE' class='" + ms.uiClass(formId, 'INTF_TYPE') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_TYPE') + "' " + ms.uiEvent(formId, 'INTF_TYPE') + " title='" + ms.titleAttr(formId, 'INTF_TYPE', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_TYPE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_SN' name='noprintset_ITEM_SN' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_SN') + "' " + ms.tdEvent(formId, 'ITEM_SN') + ">");
                arrHtml.push("<span colno='ITEM_SN' class='" + ms.uiClass(formId, 'ITEM_SN') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_SN') + "' " + ms.uiEvent(formId, 'ITEM_SN') + " title='" + ms.titleAttr(formId, 'ITEM_SN', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_SN'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell " + ms.tdClass(formId, 'ITEM_CODE') + "' style='text-align:center;" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">");
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='text-align:center;" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SFLAG' name='noprintset_SFLAG' class='datagrid-cell " + ms.tdClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.tdStyle(formId, 'SFLAG') + "' " + ms.tdEvent(formId, 'SFLAG') + ">");
                arrHtml.push("<span colno='SFLAG' class='" + ms.uiClass(formId, 'SFLAG') + "' style='text-align:center;" + ms.uiStyle(formId, 'SFLAG') + "' " + ms.uiEvent(formId, 'SFLAG') + " title='" + ms.titleAttr(formId, 'SFLAG', 'IS_TITLE_ATTR', v) + "' >" + v['SFLAG'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MESSAGE' name='noprintset_MESSAGE' class='datagrid-cell " + ms.tdClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.tdStyle(formId, 'MESSAGE') + "' " + ms.tdEvent(formId, 'MESSAGE') + ">");
                arrHtml.push("<span colno='MESSAGE' class='" + ms.uiClass(formId, 'MESSAGE') + "' style='text-align:center;" + ms.uiStyle(formId, 'MESSAGE') + "' " + ms.uiEvent(formId, 'MESSAGE') + " title='" + ms.titleAttr(formId, 'MESSAGE', 'IS_TITLE_ATTR', v) + "' >" + v['MESSAGE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_INFO' name='noprintset_SAP_INFO' class='datagrid-cell " + ms.tdClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.tdStyle(formId, 'SAP_INFO') + "' " + ms.tdEvent(formId, 'SAP_INFO') + ">");
                arrHtml.push("<span colno='SAP_INFO' class='" + ms.uiClass(formId, 'SAP_INFO') + "' style='text-align:center;" + ms.uiStyle(formId, 'SAP_INFO') + "' " + ms.uiEvent(formId, 'SAP_INFO') + " title='" + ms.titleAttr(formId, 'SAP_INFO', 'IS_TITLE_ATTR', v) + "' >" + v['SAP_INFO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='INTF_NAME' name='noprintset_INTF_NAME' class='datagrid-cell " + ms.tdClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.tdStyle(formId, 'INTF_NAME') + "' " + ms.tdEvent(formId, 'INTF_NAME') + ">");
                arrHtml.push("<span colno='INTF_NAME' class='" + ms.uiClass(formId, 'INTF_NAME') + "' style='text-align:center;" + ms.uiStyle(formId, 'INTF_NAME') + "' " + ms.uiEvent(formId, 'INTF_NAME') + " title='" + ms.titleAttr(formId, 'INTF_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['INTF_NAME'] + "</span>");
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
