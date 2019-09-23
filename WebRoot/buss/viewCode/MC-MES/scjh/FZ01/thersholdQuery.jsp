<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
    <title>
        <dict:lang value="HLY-阀值列表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
        <jsp:param name="jqueryprint" value="1" />

    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
    <bu:header formId ="640840a5c9ad4beba8b135096ed4ce00"/>


    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->


    <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>

</head>

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="62da29fc377b41a1be7d8181a9b19ff6" />
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17" />
                        <jsp:param name="location" value="searchForm" />
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="62da29fc377b41a1be7d8181a9b19ff6" />

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17" />
                    <jsp:param name="location" value="listForm" />
                </jsp:include>
                <input type="hidden" name="formPage640840a5c9ad4beba8b135096ed4ce00" id="formPage640840a5c9ad4beba8b135096ed4ce00" value="${formPage640840a5c9ad4beba8b135096ed4ce00}"/>
                <input type="hidden" name="formId" id="formId1" value='640840a5c9ad4beba8b135096ed4ce00'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='a86f0d2967e04ae2bb95a9aa8dfb8a02'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='ec7d8835a55f4dfbae645cf1192a6a97'/>
                <div class="panel-ajax datagrid datagrid-div1"  id="640840a5c9ad4beba8b135096ed4ce00">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax640840a5c9ad4beba8b135096ed4ce00" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner640840a5c9ad4beba8b135096ed4ce00">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable640840a5c9ad4beba8b135096ed4ce00">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="640840a5c9ad4beba8b135096ed4ce00" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_640840a5c9ad4beba8b135096ed4ce00" onclick="_selectAjaxTableAllData(this,'640840a5c9ad4beba8b135096ed4ce00')" style="cursor: pointer;"title="全选"/></span></td>
                                        <td name="noprintset_THRESHOLD_TYPE" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
                                        <td name="noprintset_FACTORY_CODE" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
                                        <td name="noprintset_WORK_STATION_CODE" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
                                        <td name="noprintset_ITEM_CODE" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
                                        <td name="noprintset_THRESHOLD_NUM" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv640840a5c9ad4beba8b135096ed4ce00" onscroll="ajaxTableScroll(this,'640840a5c9ad4beba8b135096ed4ce00')">
                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax640840a5c9ad4beba8b135096ed4ce00">
                                <tbody id="tbody_640840a5c9ad4beba8b135096ed4ce00" class="isParents">
                                </tbody>
                            </table>		</div>
                    </div>
                </div>
                <c:if test="${formPage640840a5c9ad4beba8b135096ed4ce00==1}">			<div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=640840a5c9ad4beba8b135096ed4ce00&showLoading=0" />
                </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('640840a5c9ad4beba8b135096ed4ce00','1');">打印</button>
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
                                <td style="width: 100px;text-align: right;"><span>序号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?工厂编码</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="FACTORY_CODE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="FACTORY_CODE" value="" title_name="?工厂编码" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?工单编码</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_CODE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_CODE" value="" title_name="?工单编码" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?阀值</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="THRESHOLD_NUM" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="THRESHOLD_NUM" value="" title_name="?阀值" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?阀值类型:1.收料阀值;2.产出阀值</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="THRESHOLD_TYPE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="THRESHOLD_TYPE" value="" title_name="?阀值类型:1.收料阀值;2.产出阀值" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?父级ID</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="UP_ID" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="UP_ID" value="" title_name="?父级ID" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?工作中心编码</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WORK_STATION_CODE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WORK_STATION_CODE" value="" title_name="?工作中心编码" />px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="formPageec7d8835a55f4dfbae645cf1192a6a97" id="formPageec7d8835a55f4dfbae645cf1192a6a97" value="${formPageec7d8835a55f4dfbae645cf1192a6a97}"/>
                <input type="hidden" name="formId" id="formId2" value='ec7d8835a55f4dfbae645cf1192a6a97'/>
                <div class="panel-ajax datagrid datagrid-div1"  id="ec7d8835a55f4dfbae645cf1192a6a97">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxec7d8835a55f4dfbae645cf1192a6a97" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innerec7d8835a55f4dfbae645cf1192a6a97">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableec7d8835a55f4dfbae645cf1192a6a97">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="ec7d8835a55f4dfbae645cf1192a6a97" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ec7d8835a55f4dfbae645cf1192a6a97" onclick="_selectAjaxTableAllData(this,'ec7d8835a55f4dfbae645cf1192a6a97')" style="cursor: pointer;"title="全选"/></span></td>
                                        <td name="noprintset_LEVEL_NAME" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="LEVEL_NAME" formId="ec7d8835a55f4dfbae645cf1192a6a97" /></td>
                                        <td name="noprintset_LEVEL_LOW" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="LEVEL_LOW" formId="ec7d8835a55f4dfbae645cf1192a6a97" /></td>
                                        <td name="noprintset_LEVEL_HIGHT" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="LEVEL_HIGHT" formId="ec7d8835a55f4dfbae645cf1192a6a97" /></td>
                                        <td name="noprintset_THRESHOLD_NUM" class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="THRESHOLD_NUM" formId="ec7d8835a55f4dfbae645cf1192a6a97" /></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivec7d8835a55f4dfbae645cf1192a6a97" onscroll="ajaxTableScroll(this,'ec7d8835a55f4dfbae645cf1192a6a97')">
                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxec7d8835a55f4dfbae645cf1192a6a97">
                                <tbody id="tbody_ec7d8835a55f4dfbae645cf1192a6a97" class="isChilds">
                                </tbody>
                            </table>		</div>
                    </div>
                </div>
                <c:if test="${formPageec7d8835a55f4dfbae645cf1192a6a97==1}">			<div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=ec7d8835a55f4dfbae645cf1192a6a97&showLoading=0" />
                </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('ec7d8835a55f4dfbae645cf1192a6a97','1');">打印</button>
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
                                <td style="width: 100px;text-align: right;"><span>序号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?阀值ID</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="THRESHOLD_ID" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="THRESHOLD_ID" value="" title_name="?阀值ID" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?量级Low</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LEVEL_LOW" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LEVEL_LOW" value="" title_name="?量级Low" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?量级Hight</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LEVEL_HIGHT" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LEVEL_HIGHT" value="" title_name="?量级Hight" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?量级名称</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LEVEL_NAME" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LEVEL_NAME" value="" title_name="?量级名称" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?阀值</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="THRESHOLD_NUM" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="THRESHOLD_NUM" value="" title_name="?阀值" />px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" id="relColVals" name="relColVals" value='ID'/>
                <input type="hidden" name="tableCount" id="tableCount" value='2' />

            </form>
        </div>
    </div>
</div>
<bu:submit viewId="62da29fc377b41a1be7d8181a9b19ff6" />
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforeJsLoad" />
</jsp:include>
<bu:script viewId="62da29fc377b41a1be7d8181a9b19ff6" />

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>

<script>
    <%--生成异步表格--%>
    function createTableModel(ms,formId){
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if(formId=='640840a5c9ad4beba8b135096ed4ce00'){<%--HLY-阀值配置--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_TYPE' name='noprintset_THRESHOLD_TYPE' class='datagrid-cell  "+ms.tdClass(formId, 'THRESHOLD_TYPE')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_TYPE')+"' "+ms.tdEvent(formId, 'THRESHOLD_TYPE')+">");
                arrHtml.push("<span colno='THRESHOLD_TYPE' class='"+ms.uiClass(formId, 'THRESHOLD_TYPE')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_TYPE')+"' "+ms.uiEvent(formId, 'THRESHOLD_TYPE')+" title='"+ms.titleAttr(formId,'THRESHOLD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_TYPE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FACTORY_CODE' name='noprintset_FACTORY_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'FACTORY_CODE')+"' style='"+ms.tdStyle(formId, 'FACTORY_CODE')+"' "+ms.tdEvent(formId, 'FACTORY_CODE')+">");
                arrHtml.push("<span colno='FACTORY_CODE' class='"+ms.uiClass(formId, 'FACTORY_CODE')+"' style='"+ms.uiStyle(formId, 'FACTORY_CODE')+"' "+ms.uiEvent(formId, 'FACTORY_CODE')+" title='"+ms.titleAttr(formId,'FACTORY_CODE','IS_TITLE_ATTR',v)+"' >"+v['FACTORY_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_STATION_CODE' name='noprintset_WORK_STATION_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_STATION_CODE')+"' style='"+ms.tdStyle(formId, 'WORK_STATION_CODE')+"' "+ms.tdEvent(formId, 'WORK_STATION_CODE')+">");
                arrHtml.push("<span colno='WORK_STATION_CODE' class='"+ms.uiClass(formId, 'WORK_STATION_CODE')+"' style='"+ms.uiStyle(formId, 'WORK_STATION_CODE')+"' "+ms.uiEvent(formId, 'WORK_STATION_CODE')+" title='"+ms.titleAttr(formId,'WORK_STATION_CODE','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_PROJECT_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
                arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
                arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if($("#leftTableDiv"+formId).length>0){
                $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId,arrHtml);
            $("#tbody_"+formId).html(arrHtml.join(""));
        }
        if(formId=='ec7d8835a55f4dfbae645cf1192a6a97'){<%--HLY-量级配置--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_NAME' name='noprintset_LEVEL_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'LEVEL_NAME')+"' style='"+ms.tdStyle(formId, 'LEVEL_NAME')+"' "+ms.tdEvent(formId, 'LEVEL_NAME')+">");
                arrHtml.push("<span colno='LEVEL_NAME' class='"+ms.uiClass(formId, 'LEVEL_NAME')+"' style='"+ms.uiStyle(formId, 'LEVEL_NAME')+"' "+ms.uiEvent(formId, 'LEVEL_NAME')+" title='"+ms.titleAttr(formId,'LEVEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_NAME']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_LOW' name='noprintset_LEVEL_LOW' class='datagrid-cell  "+ms.tdClass(formId, 'LEVEL_LOW')+"' style='"+ms.tdStyle(formId, 'LEVEL_LOW')+"' "+ms.tdEvent(formId, 'LEVEL_LOW')+">");
                arrHtml.push("<span colno='LEVEL_LOW' class='"+ms.uiClass(formId, 'LEVEL_LOW')+"' style='"+ms.uiStyle(formId, 'LEVEL_LOW')+"' "+ms.uiEvent(formId, 'LEVEL_LOW')+" title='"+ms.titleAttr(formId,'LEVEL_LOW','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_LOW']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_HIGHT' name='noprintset_LEVEL_HIGHT' class='datagrid-cell  "+ms.tdClass(formId, 'LEVEL_HIGHT')+"' style='"+ms.tdStyle(formId, 'LEVEL_HIGHT')+"' "+ms.tdEvent(formId, 'LEVEL_HIGHT')+">");
                arrHtml.push("<span colno='LEVEL_HIGHT' class='"+ms.uiClass(formId, 'LEVEL_HIGHT')+"' style='"+ms.uiStyle(formId, 'LEVEL_HIGHT')+"' "+ms.uiEvent(formId, 'LEVEL_HIGHT')+" title='"+ms.titleAttr(formId,'LEVEL_HIGHT','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_HIGHT']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
                arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
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
        setScroll(formId);
    }
</script><script>
    <%--生成异步表格--%>
    function createTableModel_print(ms,formId){
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if(formId=='640840a5c9ad4beba8b135096ed4ce00'){<%--HLY-阀值配置--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td colno='FACTORY_CODE' name='noprintset_FACTORY_CODE' class='datagrid-cell "+ms.tdClass(formId, 'FACTORY_CODE')+"' style='"+ms.tdStyle(formId, 'FACTORY_CODE')+"' "+ms.tdEvent(formId, 'FACTORY_CODE')+">");
                arrHtml.push("<span colno='FACTORY_CODE' class='"+ms.uiClass(formId, 'FACTORY_CODE')+"' style='"+ms.uiStyle(formId, 'FACTORY_CODE')+"' "+ms.uiEvent(formId, 'FACTORY_CODE')+" title='"+ms.titleAttr(formId,'FACTORY_CODE','IS_TITLE_ATTR',v)+"' >"+v['FACTORY_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_CODE' name='noprintset_PROJECT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_CODE')+"' style='"+ms.tdStyle(formId, 'PROJECT_CODE')+"' "+ms.tdEvent(formId, 'PROJECT_CODE')+">");
                arrHtml.push("<span colno='PROJECT_CODE' class='"+ms.uiClass(formId, 'PROJECT_CODE')+"' style='"+ms.uiStyle(formId, 'PROJECT_CODE')+"' "+ms.uiEvent(formId, 'PROJECT_CODE')+" title='"+ms.titleAttr(formId,'PROJECT_CODE','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
                arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_TYPE' name='noprintset_THRESHOLD_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'THRESHOLD_TYPE')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_TYPE')+"' "+ms.tdEvent(formId, 'THRESHOLD_TYPE')+">");
                arrHtml.push("<span colno='THRESHOLD_TYPE' class='"+ms.uiClass(formId, 'THRESHOLD_TYPE')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_TYPE')+"' "+ms.uiEvent(formId, 'THRESHOLD_TYPE')+" title='"+ms.titleAttr(formId,'THRESHOLD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_TYPE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='UP_ID' name='noprintset_UP_ID' class='datagrid-cell "+ms.tdClass(formId, 'UP_ID')+"' style='"+ms.tdStyle(formId, 'UP_ID')+"' "+ms.tdEvent(formId, 'UP_ID')+">");
                arrHtml.push("<span colno='UP_ID' class='"+ms.uiClass(formId, 'UP_ID')+"' style='"+ms.uiStyle(formId, 'UP_ID')+"' "+ms.uiEvent(formId, 'UP_ID')+" title='"+ms.titleAttr(formId,'UP_ID','IS_TITLE_ATTR',v)+"' >"+v['UP_ID']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORK_STATION_CODE' name='noprintset_WORK_STATION_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WORK_STATION_CODE')+"' style='"+ms.tdStyle(formId, 'WORK_STATION_CODE')+"' "+ms.tdEvent(formId, 'WORK_STATION_CODE')+">");
                arrHtml.push("<span colno='WORK_STATION_CODE' class='"+ms.uiClass(formId, 'WORK_STATION_CODE')+"' style='"+ms.uiStyle(formId, 'WORK_STATION_CODE')+"' "+ms.uiEvent(formId, 'WORK_STATION_CODE')+" title='"+ms.titleAttr(formId,'WORK_STATION_CODE','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION_CODE']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if($("#leftTableDiv"+formId).length>0){
                $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId,arrHtml);
            $("#tbody_print_"+formId).html(arrHtml.join(""));
        }
        if(formId=='ec7d8835a55f4dfbae645cf1192a6a97'){<%--HLY-量级配置--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td colno='THRESHOLD_ID' name='noprintset_THRESHOLD_ID' class='datagrid-cell "+ms.tdClass(formId, 'THRESHOLD_ID')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_ID')+"' "+ms.tdEvent(formId, 'THRESHOLD_ID')+">");
                arrHtml.push("<span colno='THRESHOLD_ID' class='"+ms.uiClass(formId, 'THRESHOLD_ID')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_ID')+"' "+ms.uiEvent(formId, 'THRESHOLD_ID')+" title='"+ms.titleAttr(formId,'THRESHOLD_ID','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_ID']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_LOW' name='noprintset_LEVEL_LOW' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_LOW')+"' style='"+ms.tdStyle(formId, 'LEVEL_LOW')+"' "+ms.tdEvent(formId, 'LEVEL_LOW')+">");
                arrHtml.push("<span colno='LEVEL_LOW' class='"+ms.uiClass(formId, 'LEVEL_LOW')+"' style='"+ms.uiStyle(formId, 'LEVEL_LOW')+"' "+ms.uiEvent(formId, 'LEVEL_LOW')+" title='"+ms.titleAttr(formId,'LEVEL_LOW','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_LOW']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_HIGHT' name='noprintset_LEVEL_HIGHT' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_HIGHT')+"' style='"+ms.tdStyle(formId, 'LEVEL_HIGHT')+"' "+ms.tdEvent(formId, 'LEVEL_HIGHT')+">");
                arrHtml.push("<span colno='LEVEL_HIGHT' class='"+ms.uiClass(formId, 'LEVEL_HIGHT')+"' style='"+ms.uiStyle(formId, 'LEVEL_HIGHT')+"' "+ms.uiEvent(formId, 'LEVEL_HIGHT')+" title='"+ms.titleAttr(formId,'LEVEL_HIGHT','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_HIGHT']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LEVEL_NAME' name='noprintset_LEVEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_NAME')+"' style='"+ms.tdStyle(formId, 'LEVEL_NAME')+"' "+ms.tdEvent(formId, 'LEVEL_NAME')+">");
                arrHtml.push("<span colno='LEVEL_NAME' class='"+ms.uiClass(formId, 'LEVEL_NAME')+"' style='"+ms.uiStyle(formId, 'LEVEL_NAME')+"' "+ms.uiEvent(formId, 'LEVEL_NAME')+" title='"+ms.titleAttr(formId,'LEVEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_NAME']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
                arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if($("#leftTableDiv"+formId).length>0){
                $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId,arrHtml);
            $("#tbody_print_"+formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);
        setScroll(formId);
    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>
