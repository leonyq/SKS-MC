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
    <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
            <bu:formet exeid="%{exeid}"/>>
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
            <div class="optn">
                <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
                <button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
            </div>

        </div>
        <div class="bd">
            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_11"/>
                <jsp:param name="location" value="editForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="426d60fe64314fb0b97a38b40090f10d" type="edit"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="426d60fe64314fb0b97a38b40090f10d"/>
                <input type="hidden" id="prefixInd" name="426d60fe64314fb0b97a38b40090f10d" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'404d25acde194e1ba491b8bd9a64e90d'"/>
                <s:set name="_$formId_1" value="'426d60fe64314fb0b97a38b40090f10d'"/>
                <s:set name="_$type" value="'edit'"/>
                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="PROJECT_ID" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="PROJECT_ID" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="REP_NUM" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="REP_NUM" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="REP_NUM" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                </tr>

                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="PROJECT_UNIT" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_UNIT" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="PROJECT_UNIT" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-three"/>
                    <bu:uitn colNo="BASE_NUM" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="BASE_NUM" formId="426d60fe64314fb0b97a38b40090f10d" colspan="3"><bu:ui colNo="BASE_NUM" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>

                <tr>

                    <td class="name-four"/>
                    <bu:uitn colNo="PREPARE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="PREPARE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="PREPARE_TIME" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="MEASURE_UNIT1" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="MEASURE_UNIT1" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="MEASURE_UNIT1" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <tr>

                    <td class="name-four"/>
                    <bu:uitn colNo="MACHINE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="MACHINE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="MACHINE_TIME" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="MEASURE_UNIT2" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="MEASURE_UNIT2" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="MEASURE_UNIT2" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="PEOPLE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="PEOPLE_TIME" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="PEOPLE_TIME" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="MEASURE_TIME3" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="MEASURE_TIME3" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="MEASURE_TIME3" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="FINISH_DATE" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="FINISH_DATE" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="FINISH_DATE" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                    <td class="name-four"/>
                    <bu:uitn colNo="REVERSE_FLAG" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="REVERSE_FLAG" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="REVERSE_FLAG" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <tr>
                    <%--
                    <td class="name-four" disabled="disabled"/>
                    <bu:uitn colNo="SFLAG" formId="426d60fe64314fb0b97a38b40090f10d" disabled="disabled"/></td>
                    <bu:td cssClass="dec-self" colNo="SFLAG" formId="426d60fe64314fb0b97a38b40090f10d" disabled="disabled">
                        <bu:ui disabled="disabled" colNo="SFLAG" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1" />
                    </bu:td>
                    --%>

                    <td class="name-four"/>
                    <bu:uitn colNo="MESSAGE" formId="426d60fe64314fb0b97a38b40090f10d"/></td>
                    <bu:td cssClass="dec-self" colNo="MESSAGE" formId="426d60fe64314fb0b97a38b40090f10d"><bu:ui colNo="MESSAGE" formId="426d60fe64314fb0b97a38b40090f10d" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>

            </table>
            <bu:jsVal formId="426d60fe64314fb0b97a38b40090f10d" formIndex="1"/>

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
