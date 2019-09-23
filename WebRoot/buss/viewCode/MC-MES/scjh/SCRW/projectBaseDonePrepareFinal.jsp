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
        <dict:lang value="VOID-生产备料-当日已备料"/>
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
    <bu:header formId="f76584409e4a476381f8d66c3ec36d5c"/>


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
            <bu:func viewId="00c5979ef553457b8b2763ffed16f26b"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="00c5979ef553457b8b2763ffed16f26b"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPagef76584409e4a476381f8d66c3ec36d5c" id="formPagef76584409e4a476381f8d66c3ec36d5c" value="${formPagef76584409e4a476381f8d66c3ec36d5c}"/>
                <input type="hidden" name="formId" id="formId1" value='f76584409e4a476381f8d66c3ec36d5c'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='5ee6f7f0d5e04e9ea961d06ac1a909e2'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='76819937bf4340c7a136992246a07831'/>
                <div class="panel-ajax datagrid datagrid-div1" id="f76584409e4a476381f8d66c3ec36d5c">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf76584409e4a476381f8d66c3ec36d5c" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innerf76584409e4a476381f8d66c3ec36d5c">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef76584409e4a476381f8d66c3ec36d5c">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="f76584409e4a476381f8d66c3ec36d5c" i18n="1"/></td>
                                        <td class=" no-print" style="width:30px; text-align:center">
                                            <span><input type="checkbox" id="selectAll_f76584409e4a476381f8d66c3ec36d5c" onchange="getAllItem();" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                      	<!--
                                        <td class="datagrid-cell" style="width:200px;">
                                            <bu:uitn colNo="DATA_AUTH" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_STATUS" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="IS_REL" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_SORT" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_MATERIAL" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_NAME" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                            <bu:uitn colNo="PRODUCT_STANDARD" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="width:70px;">
                                            <bu:uitn colNo="PRODUCT_COUNT" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>-->
                                        
                                     <!--	<td class="datagrid-cell" style="width:200px;">
           									<bu:uitn colNo="DATA_AUTH" formId="f76584409e4a476381f8d66c3ec36d5c"/></td> -->
          								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PROJECT_ID" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
          								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PROJECT_STATUS" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
          
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="LOT_NUMBER" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
           
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PRODUCT_MATERIAL" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
           
           								<td class="datagrid-cell" style="text-align:center;width:150px;">
           									<bu:uitn colNo="PRODUCT_NAME" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
          
          
           								<td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="PRODUCT_COUNT" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
          
		  								<td class="datagrid-cell" style="text-align:center;width:70px;">
          									<bu:uitn colNo="PROJECT_SORT" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                      
                                       <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="REL_NUM" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                      
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="CREATE_USER" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="EDIT_USER" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>
                                      <!--  <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PM_MEMO" formId="f76584409e4a476381f8d66c3ec36d5c"/></td>-->
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf76584409e4a476381f8d66c3ec36d5c" onscroll="ajaxTableScroll(this,'f76584409e4a476381f8d66c3ec36d5c')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxf76584409e4a476381f8d66c3ec36d5c">
                                <tbody id="tbody_f76584409e4a476381f8d66c3ec36d5c" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPagef76584409e4a476381f8d66c3ec36d5c==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f76584409e4a476381f8d66c3ec36d5c&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('f76584409e4a476381f8d66c3ec36d5c','1');">打印</button>
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
                                    <span>工单ID</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="工单ID"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单状态</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_STATUS" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_STATUS" value="" title_name="工单状态"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>关联状态</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="IS_REL" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="IS_REL" value="" title_name="关联状态"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?工单类别</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_SORT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_SORT" value="" title_name="?工单类别"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>机种料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_MATERIAL" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_MATERIAL" value="" title_name="机种料号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>机种名称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_NAME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_NAME" value="" title_name="机种名称"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>规格</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_STANDARD" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_STANDARD" value="" title_name="规格"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>计划数量</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_COUNT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_COUNT" value="" title_name="计划数量"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>关联数量</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REL_NUM" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REL_NUM" value="" title_name="关联数量"/>px
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
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>备注</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_MEMO" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_MEMO" value="" title_name="备注"/>px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="formPage76819937bf4340c7a136992246a07831" id="formPage76819937bf4340c7a136992246a07831" value="${formPage76819937bf4340c7a136992246a07831}"/>
                <input type="hidden" name="formId" id="formId2" value='76819937bf4340c7a136992246a07831'/>
                <div class="panel-ajax datagrid datagrid-div1" id="76819937bf4340c7a136992246a07831">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax76819937bf4340c7a136992246a07831" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner76819937bf4340c7a136992246a07831">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable76819937bf4340c7a136992246a07831">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="76819937bf4340c7a136992246a07831" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center;display:none;">
                                            <span><input type="checkbox" id="selectAll_76819937bf4340c7a136992246a07831" onclick="_selectAjaxTableAllData(this,'76819937bf4340c7a136992246a07831')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                     <!--   <td class="datagrid-cell" style="width:200px;">
                                            <bu:uitn colNo="DATA_AUTH" formId="76819937bf4340c7a136992246a07831"/></td> -->
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="REL_PROJECT_ID" formId="76819937bf4340c7a136992246a07831"/></td>
                                      
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="T2#PROJECT_STATUS" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="T2#LOT_NUMBER" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="T2#PRODUCT_MATERIAL" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:150px;">
           									<bu:uitn colNo="T2#PRODUCT_NAME" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="T2#PRODUCT_COUNT" formId="76819937bf4340c7a136992246a07831"/></td>
               						    <td class="datagrid-cell" style="text-align:center;width:70px;">
           									<bu:uitn colNo="T2#PROJECT_SORT" formId="76819937bf4340c7a136992246a07831"/></td>
                                      
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="CREATE_USER" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="EDIT_USER" formId="76819937bf4340c7a136992246a07831"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="76819937bf4340c7a136992246a07831"/></td>
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
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=76819937bf4340c7a136992246a07831&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('76819937bf4340c7a136992246a07831','1');">打印</button>
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
                                    <span>?关联工单</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REL_PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REL_PROJECT_ID" value="" title_name="?关联工单"/>px
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
                <input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
                <input type="hidden" name="tableCount" id="tableCount" value='2'/>

            </form>
        </div>
    </div>
</div>
<bu:submit viewId="00c5979ef553457b8b2763ffed16f26b"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="00c5979ef553457b8b2763ffed16f26b"/>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

  
<!-- 修改组织机构的width-->
<script type="text/javascript">
     $(function (){
      
       editDadtAuthStyle();
    });
  
function editDadtAuthStyle(){
     $("#DATA_AUTH").width("150px");
}  
</script>
  

<script>

   function chgCheck(e) {
     
        if ($(e).attr('checked')) {
            $(e).attr("checked", true);
            
        } else {
            $(e).attr("checked", false);
        }
      var array = [];
            $('input[name="f76584409e4a476381f8d66c3ec36d5c$ID"]:checked').each(function(i,v){
              array.push($(this).val());
            });
           var arrystr = array.join(",");
          console.log("选中值:"+arrystr);
            var projectIds = arrystr;
            var arrHtml = [];
          var formId ="76819937bf4340c7a136992246a07831";
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=b879bc69f1e64d9eb1dca131af099c6e";
            $.ajax({
              type: "POST",
              datatype: "json",
              url: url,
              data:"&projectIds="+projectIds,
              success: function(data){
                console.log(data.ajaxList );
              /* for(var i=0;i<data.ajaxMap.modelList.length;i++){
                 for(var j =0;j<data.ajaxMap.modelList[i].length;j++){
                  arrHtml.push("<tr class='datagrid-row' id='" + data.ajaxMap.modelList[i][0].ID + "' abbr='" + data.ajaxMap.modelList[i][0].ID + "' style='cursor: pointer;>");
                  arrHtml.push("<input type='hidden' name='ID' value='" + data.ajaxMap.modelList[i][0].ID + "' />");
                  arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + data.ajaxMap.modelList[i][0].ID + "'  value='" + data.ajaxMap.modelList[i][0].DATA_AUTH_ID + "' />");
                  arrHtml.push("<input type='hidden' name='PROJECT_ID' value='undefined'/>");
               
                  arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:28.5px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>");
                  arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;display:none' ><span class='_noedit'>");
                  arrHtml.push("<input type='hidden' name='76819937bf4340c7a136992246a07831$ID' value='" + data.ajaxMap.modelList[i][0].ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                  arrHtml.push("</td>");
             
                  arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell ' style='text-align: center; width: 112.364px;'>")
                  arrHtml.push("<span colno='REL_PROJECT_ID' class style title >" + data.ajaxMap.modelList[i][0]['REL_PROJECT_ID'] + "</span>")
                  arrHtml.push("</td>");
                  if(data.ajaxMap.modelList[i][0]['PROJECT_STATUS'] == '3'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 112.364px;'>")
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#6fa8dc;color:#FFFFFF;width:45px'>备料</span></span>")
                    arrHtml.push("</td>");
                  }else {
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 112.364px;'>")
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title >" + data.ajaxMap.modelList[i][0]['PROJECT_STATUS'] + "</span>")
                    arrHtml.push("</td>");
                  }
          		
                  if(data.ajaxMap.modelList[i][0]['LOT_NUMBER'] == null){
                    arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:112.364px;'>")
                    arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' ></span>")
                    arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:112.364px;'>")
                   arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' >" + data.ajaxMap.modelList[i][0]['LOT_NUMBER'] + "</span>")
                   arrHtml.push("</td>");
                  }
                 
          		  if(data.ajaxMap.modelList[i][0]['PRODUCT_MATERIAL'] == null ){
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['PRODUCT_MATERIAL'] + "</span>")
                   arrHtml.push("</td>");
                  }
                 
                  if(data.ajaxMap.modelList[i][0]['PRODUCT_NAME'] == null){
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:192.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:192.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['PRODUCT_NAME'] + "</span>")
                   arrHtml.push("</td>");
                  }
                  
          		  if(data.ajaxMap.modelList[i][0]['PRODUCT_COUNT']  == null){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' >" + data.ajaxMap.modelList[i][0]['PRODUCT_COUNT'] + "</span>")
                   arrHtml.push("</td>");
                  }
                 
          		  if(data.ajaxMap.modelList[i][0]['PROJECT_SORT']  == null){
                   arrHtml.push("<td colno='T2#PROJECT_SORT' name='noprintset_T2#PROJECT_SORT' class='datagrid-cell ' style='text-align:center;width:112.364px;'>")
                   arrHtml.push("<span colno='T2#PROJECT_SORT' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else if(data.ajaxMap.modelList[i][0]['PROJECT_SORT'] == '0' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#cccccc;color:#FFFFFF;width:45px'>未分类</span></span>")
                   arrHtml.push("</td>");
                  }
          		
          		
                  if(data.ajaxMap.modelList[i][0]['CREATE_USER']  == null){
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['CREATE_USER'] + "</span>")
                   arrHtml.push("</td>");
                 }
                 
                  if(data.ajaxMap.modelList[i][0]['CREATE_TIME']  == null){
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:142.364px;' >")
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:142.364px;' >")
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['CREATE_TIME'].replace("T"," ") + "</span>")
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxMap.modelList[i][0]['EDIT_USER']  == null){
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:112.364px;' >")
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['EDIT_USER'] + "</span>")
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxMap.modelList[i][0]['EDIT_TIME']  == null){
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:142.364px;'>")
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' ></span>")
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:142.364px;'>")
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' >" + data.ajaxMap.modelList[i][0]['EDIT_TIME'].replace("T"," ") + "</span>")
                   arrHtml.push("</td>");
                  }
               
                  arrHtml.push("</tr>")
                 }
               }
                
               setCrossWiseScroll(formId, arrHtml);
               $("#tbody_" + formId).html(arrHtml.join(""));*/
               for(var i=0;i< data.ajaxList.length;i++){
                 arrHtml.push("<tr class='datagrid-row' id='" + data.ajaxList[i].ID + "' abbr='" + data.ajaxList[i].ID + "' style='cursor: pointer;>");
                  arrHtml.push("<input type='hidden' name='ID' value='" + data.ajaxList[i].ID + "' />");
                  arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + data.ajaxList[i].ID + "'  value='" + data.ajaxList[i].DATA_AUTH_ID + "' />");
                  arrHtml.push("<input type='hidden' name='PROJECT_ID' value='undefined'/>");
               
                  arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:24.8px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>");
                  arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;display:none' ><span class='_noedit'>");
                  arrHtml.push("<input type='hidden' name='76819937bf4340c7a136992246a07831$ID' value='" + data.ajaxList[i].ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                  arrHtml.push("</td>");
             
                  arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell ' style='text-align: center; width: 115.2px;'>");
                  arrHtml.push("<span colno='REL_PROJECT_ID' class style title >" + data.ajaxList[i]['REL_PROJECT_ID'] + "</span>");
                  arrHtml.push("</td>");
                  if(data.ajaxList[i]['PROJECT_STATUS'] == '3'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#6fa8dc;color:#FFFFFF;width:45px'>备料</span></span>");
                    arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_STATUS'] == '4'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#674ea7;color:#FFFFFF;width:45px'>投料</span></span>");
                    arrHtml.push("</td>");     
                  }else if(data.ajaxList[i]['PROJECT_STATUS'] == '5'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#a64d79;color:#FFFFFF;width:45px'>包装</span></span>");
                    arrHtml.push("</td>");        
                  }else {
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title >" + data.ajaxList[i]['PROJECT_STATUS'] + "</span>");
                    arrHtml.push("</td>");
                  }
          		
                  if(data.ajaxList[i]['LOT_NUMBER'] == null){
                    arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:115.2px;'>");
                    arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' ></span>");
                    arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:115.2px;'>");
                   arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' >" + data.ajaxList[i]['LOT_NUMBER'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
          		  if(data.ajaxList[i]['PRODUCT_MATERIAL'] == null ){
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' >" + data.ajaxList[i]['PRODUCT_MATERIAL'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
                  if(data.ajaxList[i]['PRODUCT_NAME'] == null){
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:197.6px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:197.6px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' >" + data.ajaxList[i]['PRODUCT_NAME'] + "</span>");
                   arrHtml.push("</td>");
                  }
                  
          		  if(data.ajaxList[i]['PRODUCT_COUNT']  == null){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' >" + data.ajaxList[i]['PRODUCT_COUNT'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
          		  if(data.ajaxList[i]['PROJECT_SORT']  == null){
                   arrHtml.push("<td colno='T2#PROJECT_SORT' name='noprintset_T2#PROJECT_SORT' class='datagrid-cell ' style='text-align:center;width:115.2px;'>");
                   arrHtml.push("<span colno='T2#PROJECT_SORT' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '0' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#cccccc;color:#FFFFFF;width:45px'>未分类</span></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '1' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#6aa84f;color:#FFFFFF;width:45px'>制造单</span></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '2' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#45818e;color:#FFFFFF;width:45px'>包装单</span></span>");
                   arrHtml.push("</td>");
                  }
          		
          		
                  if(data.ajaxList[i]['CREATE_USER']  == null){
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' >" + data.ajaxList[i]['CREATE_USER'] + "</span>");
                   arrHtml.push("</td>");
                 }
                 
                  if(data.ajaxList[i]['CREATE_TIME']  == null){
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;' >");
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;' >");
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' >" + data.ajaxList[i]['CREATE_TIME'].replace("T"," ") + "</span>");
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxList[i]['EDIT_USER']  == null){
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' >" + data.ajaxList[i]['EDIT_USER'] + "</span>");
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxList[i]['EDIT_TIME']  == null){
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;'>");
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;'>");
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' >" + data.ajaxList[i]['EDIT_TIME'].replace("T"," ") + "</span>");
                   arrHtml.push("</td>");
                  }
               
                  arrHtml.push("</tr>")
                 }
               
                
               setCrossWiseScroll(formId, arrHtml);
               $("#tbody_" + formId).html(arrHtml.join(""));
              
            },
            error: function(msg){
              //  utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        }); 
    

    }


  
  
  //单行选择时
  function chgCheckTr(e) {
    var flag = false;
        var trId = $(e).attr('id'); 
    
        if ($("#check_" + trId).attr('checked')) {
            
            $("#check_" + trId).attr("checked", false);
           
         $("#selectAll_f76584409e4a476381f8d66c3ec36d5c").attr("checked",false);
        } else {
          
            $("#check_" + trId).attr("checked", true);
          $("#tbody_f76584409e4a476381f8d66c3ec36d5c :checkbox").each(function() {
           if ($(e).attr('checked')) {
             
           }else{
              flag = true;
           }
                
         });
        /* if(flag){
             $("#selectAll_f76584409e4a476381f8d66c3ec36d5c").attr("checked",false);
           }else{
             $("#selectAll_f76584409e4a476381f8d66c3ec36d5c").attr("checked",true);
           }*/
        }
     
    }
  
    
    function getAllItem() {
        if ($("#selectAll_f76584409e4a476381f8d66c3ec36d5c").attr("checked") == "checked") {
            $("#tbody_f76584409e4a476381f8d66c3ec36d5c :checkbox").attr("checked", true);
        } else {
            $("#tbody_f76584409e4a476381f8d66c3ec36d5c :checkbox").each(function () {
                $(this).attr("checked", false);
            });
        }
       var array = [];
            $('input[name="f76584409e4a476381f8d66c3ec36d5c$ID"]:checked').each(function(i,v){
              array.push($(this).val());
            });
           var arrystr = array.join(",");
          console.log("选中值:"+arrystr);
            var projectIds = arrystr;
            var arrHtml = [];
          var formId ="76819937bf4340c7a136992246a07831";
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=b879bc69f1e64d9eb1dca131af099c6e";
            $.ajax({
              type: "POST",
              datatype: "json",
              url: url,
              data:"&projectIds="+projectIds,
              success: function(data){
                if(data.ajaxList==null){
                 // utilsFp.confirmIcon(3,"","","", "当前无数据","","260","145"); 
                  return;
                }
                for(var i=0;i< data.ajaxList.length;i++){
                 arrHtml.push("<tr class='datagrid-row' id='" + data.ajaxList[i].ID + "' abbr='" + data.ajaxList[i].ID + "' style='cursor: pointer;>");
                  arrHtml.push("<input type='hidden' name='ID' value='" + data.ajaxList[i].ID + "' />");
                  arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + data.ajaxList[i].ID + "'  value='" + data.ajaxList[i].DATA_AUTH_ID + "' />");
                  arrHtml.push("<input type='hidden' name='PROJECT_ID' value='undefined'/>");
               
                  arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:24.8px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>");
                  arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;display:none' ><span class='_noedit'>");
                  arrHtml.push("<input type='hidden' name='76819937bf4340c7a136992246a07831$ID' value='" + data.ajaxList[i].ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                  arrHtml.push("</td>");
             
                  arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell ' style='text-align: center; width: 115.2px;'>");
                  arrHtml.push("<span colno='REL_PROJECT_ID' class style title >" + data.ajaxList[i]['REL_PROJECT_ID'] + "</span>");
                  arrHtml.push("</td>");
                 if(data.ajaxList[i]['PROJECT_STATUS'] == '3'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#6fa8dc;color:#FFFFFF;width:45px'>备料</span></span>");
                    arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_STATUS'] == '4'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#674ea7;color:#FFFFFF;width:45px'>投料</span></span>");
                    arrHtml.push("</td>");     
                  }else if(data.ajaxList[i]['PROJECT_STATUS'] == '5'){
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title ><span class='state' style='background-color:#a64d79;color:#FFFFFF;width:45px'>包装</span></span>");
                    arrHtml.push("</td>");        
                  }else {
                    arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell' style='text-align: center; width: 115.2px;'>");
                    arrHtml.push("<span colno='T2#PROJECT_STATUS'  class style title >" + data.ajaxList[i]['PROJECT_STATUS'] + "</span>");
                    arrHtml.push("</td>");
                  }
          		
                  if(data.ajaxList[i]['LOT_NUMBER'] == null){
                    arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:115.2px;'>");
                    arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' ></span>");
                    arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell' style='text-align:center;width:115.2px;'>");
                   arrHtml.push("<span colno='T2#LOT_NUMBER' class='' style=''  title='' >" + data.ajaxList[i]['LOT_NUMBER'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
          		  if(data.ajaxList[i]['PRODUCT_MATERIAL'] == null ){
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='' style='' title='' >" + data.ajaxList[i]['PRODUCT_MATERIAL'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
                  if(data.ajaxList[i]['PRODUCT_NAME'] == null){
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:197.6px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell' style='text-align:center;width:197.6px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_NAME' class='' style='' title='' >" + data.ajaxList[i]['PRODUCT_NAME'] + "</span>");
                   arrHtml.push("</td>");
                  }
                  
          		  if(data.ajaxList[i]['PRODUCT_COUNT']  == null){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' >" + data.ajaxList[i]['PRODUCT_COUNT'] + "</span>");
                   arrHtml.push("</td>");
                  }
                 
          		   if(data.ajaxList[i]['PROJECT_SORT']  == null){
                   arrHtml.push("<td colno='T2#PROJECT_SORT' name='noprintset_T2#PROJECT_SORT' class='datagrid-cell ' style='text-align:center;width:115.2px;'>");
                   arrHtml.push("<span colno='T2#PROJECT_SORT' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '0' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#cccccc;color:#FFFFFF;width:45px'>未分类</span></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '1' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#6aa84f;color:#FFFFFF;width:45px'>制造单</span></span>");
                   arrHtml.push("</td>");
                  }else if(data.ajaxList[i]['PROJECT_SORT'] == '2' ){
                   arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell ' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='' style=''  title='' ><span class='state' style='background-color:#45818e;color:#FFFFFF;width:45px'>包装单</span></span>");
                   arrHtml.push("</td>");
                  }
          		
          		
                  if(data.ajaxList[i]['CREATE_USER']  == null){
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='CREATE_USER' class='' style='' title='' >" + data.ajaxList[i]['CREATE_USER'] + "</span>");
                   arrHtml.push("</td>");
                 }
                 
                  if(data.ajaxList[i]['CREATE_TIME']  == null){
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;' >");
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;' >");
                   arrHtml.push("<span colno='CREATE_TIME' class='' style='' title='' >" + data.ajaxList[i]['CREATE_TIME'].replace("T"," ") + "</span>");
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxList[i]['EDIT_USER']  == null){
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell' style='text-align:center;width:115.2px;' >");
                   arrHtml.push("<span colno='EDIT_USER' class='' style='' title='' >" + data.ajaxList[i]['EDIT_USER'] + "</span>");
                   arrHtml.push("</td>");
                  }
                
                  if(data.ajaxList[i]['EDIT_TIME']  == null){
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;'>");
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' ></span>");
                   arrHtml.push("</td>");
                  }else{
                   arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell ' style='text-align:center;width:144.8px;'>");
                   arrHtml.push("<span colno='EDIT_TIME' class='' style='' title='' >" + data.ajaxList[i]['EDIT_TIME'].replace("T"," ") + "</span>");
                   arrHtml.push("</td>");
                  }
               
                  arrHtml.push("</tr>")
                 }
               
                
               setCrossWiseScroll(formId, arrHtml);
               $("#tbody_" + formId).html(arrHtml.join(""));
              
            },
            error: function(msg){
              //  utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    
    }

    function doUnPrepare() {
        var projectSnArr = [];

        $("span[colno='PROJECT_ID']").each(function () {
            var dataId = $(this).parent().parent().attr("id");
            if ($("#check_" + dataId).attr('checked')) {
                var curTitle = $(this).text();
                if (curTitle != null) {
                    projectSnArr.push(curTitle);
                }
            }
        });

        var workOrderSn = projectSnArr.join(",");

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=70c0a9c7794e47a5a0aacfd0c76bd23f";

        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: {"workOrderSn": workOrderSn},
            success: function (data) {
                var msg = data.ajaxString;
                util.closeLoading();
                utilsFp.confirmIcon(2, "", "query", "", msg, 0, "300", "");
            },
            error: function (e1, e2, e3) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
        //iframe6
        /*
        document.forms.listForm.action = "
        ${path}buss/bussModel_exeFunc.ms?funcMId=70c0a9c7794e47a5a0aacfd0c76bd23f&workOrderSn=" + workOrderSn;
        document.forms.listForm.submit();
        */
    }

    <%--生成异步表格--%>

    function createTableModel(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == 'f76584409e4a476381f8d66c3ec36d5c') {<%--VOID-工单关联-历史关联列表--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr onclick='chgCheckTr(this)' class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' id ='check_" + v.ID + "' onchange='chgCheck(this);' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
          /*
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">")
                arrHtml.push("<span colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' name='noprintset_IS_REL' class='datagrid-cell  " + ms.tdClass(formId, 'IS_REL') + "' style='" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">")
                arrHtml.push("<span colno='IS_REL' class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " title='" + ms.titleAttr(formId, 'IS_REL', 'IS_TITLE_ATTR', v) + "' >" + v['IS_REL'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">")
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' name='noprintset_PRODUCT_STANDARD' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">")
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + ms.titleAttr(formId, 'PRODUCT_STANDARD', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_STANDARD'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">")
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>")
                arrHtml.push("</td>");*/
          		
          		/*arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'LOT_NUMBER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'LOT_NUMBER') + "' " + ms.tdEvent(formId, 'LOT_NUMBER') + ">");
                arrHtml.push("<span colno='LOT_NUMBER' class='" + ms.uiClass(formId, 'LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'LOT_NUMBER') + "' " + ms.uiEvent(formId, 'LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['LOT_NUMBER'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='text-align:center;width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
          		
          		arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">");
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
          
          
                arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'REL_NUM') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'REL_NUM') + "' " + ms.tdEvent(formId, 'REL_NUM') + ">");
                arrHtml.push("<span colno='REL_NUM' class='" + ms.uiClass(formId, 'REL_NUM') + "' style='" + ms.uiStyle(formId, 'REL_NUM') + "' " + ms.uiEvent(formId, 'REL_NUM') + " title='" + ms.titleAttr(formId, 'REL_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['REL_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">");
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
                arrHtml.push("</td>");
                /*arrHtml.push("<td colno='PM_MEMO' name='noprintset_PM_MEMO' class='datagrid-cell  " + ms.tdClass(formId, 'PM_MEMO') + "' style='" + ms.tdStyle(formId, 'PM_MEMO') + "' " + ms.tdEvent(formId, 'PM_MEMO') + ">")
                arrHtml.push("<span colno='PM_MEMO' class='" + ms.uiClass(formId, 'PM_MEMO') + "' style='" + ms.uiStyle(formId, 'PM_MEMO') + "' " + ms.uiEvent(formId, 'PM_MEMO') + " title='" + ms.titleAttr(formId, 'PM_MEMO', 'IS_TITLE_ATTR', v) + "' >" + v['PM_MEMO'] + "</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        if (formId == '76819937bf4340c7a136992246a07831') {<%--VOID-工单关联-已关联明细--%>
          
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;display:none' ><span class='_noedit'>");
                arrHtml.push("<input type='hidden' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                /*arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">")
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>")
                arrHtml.push("</td>");*/
                arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'REL_PROJECT_ID') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'REL_PROJECT_ID') + "' " + ms.tdEvent(formId, 'REL_PROJECT_ID') + ">");
                arrHtml.push("<span colno='REL_PROJECT_ID' class='" + ms.uiClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'REL_PROJECT_ID') + "' " + ms.uiEvent(formId, 'REL_PROJECT_ID') + " title='" + ms.titleAttr(formId, 'REL_PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['REL_PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
          
          		arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'T2#PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'T2#PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='T2#PROJECT_STATUS' class='" + ms.uiClass(formId, 'T2#PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'T2#PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'T2#PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'T2#PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");
          		arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'T2#LOT_NUMBER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#LOT_NUMBER') + "' " + ms.tdEvent(formId, 'T2#LOT_NUMBER') + ">");
                arrHtml.push("<span colno='T2#LOT_NUMBER' class='" + ms.uiClass(formId, 'T2#LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'T2#LOT_NUMBER') + "' " + ms.uiEvent(formId, 'T2#LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'T2#LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['T2#LOT_NUMBER'] + "</span>");
                arrHtml.push("</td>");
          		arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'T2#PRODUCT_MATERIAL') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'T2#PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'T2#PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'T2#PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'T2#PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'T2#PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");
          		arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'T2#PRODUCT_NAME') + "' style='text-align:center;width:150px;" + ms.tdStyle(formId, 'T2#PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'T2#PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='T2#PRODUCT_NAME' class='" + ms.uiClass(formId, 'T2#PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'T2#PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'T2#PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'T2#PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
          		arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'T2#PRODUCT_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'T2#PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='" + ms.uiClass(formId, 'T2#PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'T2#PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'T2#PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'T2#PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
          		arrHtml.push("<td colno='T2#PROJECT_SORT' name='noprintset_T2#PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'T2#PROJECT_SORT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#PROJECT_SORT') + "' " + ms.tdEvent(formId, 'T2#PROJECT_SORT') + ">");
                arrHtml.push("<span colno='T2#PROJECT_SORT' class='" + ms.uiClass(formId, 'T2#PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'T2#PROJECT_SORT') + "' " + ms.uiEvent(formId, 'T2#PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'T2#PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
          
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">");
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
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
        if (formId == 'f76584409e4a476381f8d66c3ec36d5c') {<%--VOID-工单关联-历史关联列表--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' name='noprintset_IS_REL' class='datagrid-cell " + ms.tdClass(formId, 'IS_REL') + "' style='" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">");
                arrHtml.push("<span colno='IS_REL' class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " title='" + ms.titleAttr(formId, 'IS_REL', 'IS_TITLE_ATTR', v) + "' >" + v['IS_REL'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">");
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' name='noprintset_PRODUCT_STANDARD' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">");
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + ms.titleAttr(formId, 'PRODUCT_STANDARD', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_STANDARD'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell " + ms.tdClass(formId, 'REL_NUM') + "' style='" + ms.tdStyle(formId, 'REL_NUM') + "' " + ms.tdEvent(formId, 'REL_NUM') + ">");
                arrHtml.push("<span colno='REL_NUM' class='" + ms.uiClass(formId, 'REL_NUM') + "' style='" + ms.uiStyle(formId, 'REL_NUM') + "' " + ms.uiEvent(formId, 'REL_NUM') + " title='" + ms.titleAttr(formId, 'REL_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['REL_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MEMO' name='noprintset_PM_MEMO' class='datagrid-cell " + ms.tdClass(formId, 'PM_MEMO') + "' style='" + ms.tdStyle(formId, 'PM_MEMO') + "' " + ms.tdEvent(formId, 'PM_MEMO') + ">");
                arrHtml.push("<span colno='PM_MEMO' class='" + ms.uiClass(formId, 'PM_MEMO') + "' style='" + ms.uiStyle(formId, 'PM_MEMO') + "' " + ms.uiEvent(formId, 'PM_MEMO') + " title='" + ms.titleAttr(formId, 'PM_MEMO', 'IS_TITLE_ATTR', v) + "' >" + v['PM_MEMO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_print_" + formId).html(arrHtml.join(""));
        }
        if (formId == '76819937bf4340c7a136992246a07831') {<%--VOID-工单关联-已关联明细--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td colno='REL_PROJECT_ID' name='noprintset_REL_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'REL_PROJECT_ID') + "' " + ms.tdEvent(formId, 'REL_PROJECT_ID') + ">");
                arrHtml.push("<span colno='REL_PROJECT_ID' class='" + ms.uiClass(formId, 'REL_PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'REL_PROJECT_ID') + "' " + ms.uiEvent(formId, 'REL_PROJECT_ID') + " title='" + ms.titleAttr(formId, 'REL_PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['REL_PROJECT_ID'] + "</span>");
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
