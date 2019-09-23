<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title><dict:lang value="修改"/></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body style="overflow:auto;">
<div class="edit">
    <div class="js-tab">
        <form id="listForm" name="listForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame" <bu:formet exeid="%{exeid}"/>>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
                    <s:if test="${isDataAuth == '1'}">
                        <span class="dot">*</span>
                        <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                        <s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                    </s:if> <s:else>
                        <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                    </s:else> </s:if>
                </div>
            </div>
            <div class="bd">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
                    <jsp:param name="location" value="editForm"/>
                </jsp:include>
                <bu:set name="paraMapObj" value="${dataId}" formId="b36254ac37e74240b1528d44627b6a84" type="edit"/>
                <table class="basic-table">
                    <input type="hidden" name="formIds" value="b36254ac37e74240b1528d44627b6a84"/>
                    <input type="hidden" id="prefixInd" name="b36254ac37e74240b1528d44627b6a84" value="paraMap1@"/>
                    <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                    <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                    <s:set name="_$viewId" value="'2ee93fb82f634d6abf18c3b1fa665ff3'"/>
                    <s:set name="_$formId_1" value="'b36254ac37e74240b1528d44627b6a84'"/>
                    <s:set name="_$type" value="'detail'"/>

                    <%--工单+批次+机种--%>
                    <tr>
                        <td class="name-four"/>
                        <bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>
                    </tr>

                    <%--司称+监称+工艺--%>
                    <tr>
                        <td class="name-four"/>
                        <bu:uitn colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>
                    </tr>

                    <%--总重+备重+实投--%>
                    <tr>
                        <td class="name-four"/>
                        <bu:uitn colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>
                    </tr>

                    <%--投个+管理员--%>
                    <tr>
                        <td class="name-four"/>
                        <bu:uitn colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>

                        <td class="name-four"/>
                        <bu:uitn colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                        <bu:td cssClass="dec-self" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled">
                            <bu:ui colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
                        </bu:td>
                    </tr>
                </table>
                <bu:jsVal formId="b36254ac37e74240b1528d44627b6a84" formIndex="1"/>

                <div id="container">
                    <DIV style="margin-bottom: 11px;">
                        <UL class="tab-list tab">
                            <LI id="tag1">
                                <A class="selectli1" onclick="switchTag('tag1','content1','','');this.blur();" href="javascript:void(0);">
                                    <SPAN><dict:lang value="投料明细"/></SPAN>
                                </A>
                            </LI>
                        </UL>
                    </DIV>
                    <DIV class="content1" id="content">
                        <DIV id="content1" data-tab="tag1">
                            <div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
                                <div class="datagrid-div2 datagrid-div6 datagrid-view" style="overflow-x:hidden;border-bottom:0;">
                                    <div class="datagrid-header">
                                        <div class="datagrid-header-inner head1" id="">
                                            <table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
                                                <tbody>
                                                <tr class="datagrid-header-row thcolor">
                                                    <td class="datagrid-cell " style="width:30px;text-align:center"></td>
                                                    <td class="datagrid-cell " style="width:60px;text-align:center">
                                                        <dict:lang value="物料编码"/></td>
                                                    <td class="datagrid-cell " style="width:170px;text-align:center">
                                                        <dict:lang value="备料数量"/></td>
                                                    <td class="datagrid-cell " style="width:225px;text-align:center">
                                                        <dict:lang value="投入量"/></td>
                                                    <td class="datagrid-cell " style="width:195px;text-align:center">
                                                        <dict:lang value="工艺顺序"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll1" style="height:300px;"><!--130-->
                                        <table class="datagrid-btable fixedTable dblClick " id="datagrid-btable-ajax123456">
                                            <tbody id="itemTbody">
                                            <c:forEach var="item" items="${dataList}" varStatus="status">
                                                <tr>
                                                    <td class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
                                                    <td class='datagrid-cell datagrid-cell-1' style='width:60px;'>${item.ITEM_CODE}</td>
                                                    <td class='datagrid-cell datagrid-cell-2' style="width:170px;">${item.ITEM_NUM}</td>
                                                    <td class='datagrid-cell datagrid-cell-3' style="width:225px;">${item.FEED_NUM}</td>
                                                    <td class='datagrid-cell datagrid-cell-4' style="width:195px;">${item.PROCESS_ORDER}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </DIV>
                    </DIV>
                </div>
            </div>
        </form>
    </div>

    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

    <!-- js初始化方法 -->
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11"/>
        <jsp:param name="location" value="jsLoading"/>
    </jsp:include>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="popConfirm" value="1"/>
        <jsp:param name="needValidate" value="1"/>
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>

<script type="text/javascript">
    var addTableTrMap;
    var loaded = 1;
    var tab_len = 1;

    var currentTag;
    var tabs = "";

    var tabLength = 0;

    function switchTag(tag, content, url) {
        if (currentTag == tag) {
            return false;
        }
        document.getElementById("content1").style.display = "";

        for (i = 1; i < (tab_len + 1); i++) {
            if ("tag" + i == tag) {
                document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
            } else {
                document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
            }
            $("#" + tag).addClass("current").siblings().removeClass("current");
            if ("content" + i == content) {
                currentTag = tag;
                document.getElementById(content).className = "";
            } else {
                document.getElementById("content" + i).className = "hidecontent";
            }
            document.getElementById("content").className = content;
        }
    }
</script>
