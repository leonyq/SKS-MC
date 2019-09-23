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
            <bu:set name="paraMapObj" value="${dataId}" formId="50c012f45e304e2993fb61b37d32e6be" type="edit"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="50c012f45e304e2993fb61b37d32e6be"/>
                <input type="hidden" id="prefixInd" name="50c012f45e304e2993fb61b37d32e6be" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'0f44ed140f174dfdb2bb119f916818b3'"/>
                <s:set name="_$formId_1" value="'50c012f45e304e2993fb61b37d32e6be'"/>
                <s:set name="_$type" value="'edit'"/>
                <%--1.工单号+机种--%>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>

                <%--2.规格+机种名称--%>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>

                <%--3.检测员+判定结果--%>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>

                <%--4.检测时间+检测数量--%>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>

                <%--5.检测内容--%>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be"/></td>
                    <bu:td cssClass="dec-self" colspan="3" colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be">
                        <bu:ui colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>


                <%--

                            <td class="name-six" /><bu:uitn colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_CHECK_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        <td>&nbsp;</td>

                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_CHECK_EMP" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_CHECK_NUM" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        <td>&nbsp;</td>
                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_CHECK_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_CHECK_TIME" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        <td>&nbsp;</td>
                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_CONTENT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" /></bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_EMP" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" /></bu:td>
                        <td>&nbsp;</td>
                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_RESULT" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" /></bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" ><bu:ui colNo="QT_EXAMINE_TIME" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" /></bu:td>
                        <td>&nbsp;</td>
                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_MODEL_CODE" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_PROJECT_ID" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        <td>&nbsp;</td>
                        <tr>
                            <td class="name-six" /><bu:uitn colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_MODEL_NAME" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        </tr>
                            <td class="name-six" /><bu:uitn colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" /></td>
                            <bu:td cssClass="dec-self" colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" >
                                <bu:ui colNo="QT_SPEC" formId="50c012f45e304e2993fb61b37d32e6be" dataId="${dataId}" formIndex="1" />
                            </bu:td>
                        <td>&nbsp;</td>
                --%>

            </table>
            <bu:jsVal formId="50c012f45e304e2993fb61b37d32e6be" formIndex="1"/>

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
