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
                <button type="button" onclick="savePack(this);"><i class="ico ico-save"></i><dict:lang value="包装"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
                <%--<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>--%>
            </div>

        </div>
        <div class="bd">
            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_11"/>
                <jsp:param name="location" value="editForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="3ed22e0bef7744dcb3ea955b7bb638fb" type="edit"/>

            <table class="basic-table">
                <input type="hidden" name="formIds" value="3ed22e0bef7744dcb3ea955b7bb638fb"/>
                <input type="hidden" id="prefixInd" name="3ed22e0bef7744dcb3ea955b7bb638fb" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'d15f61123fcd4cbf81311d1eef27e0c8'"/>
                <s:set name="_$formId_1" value="'3ed22e0bef7744dcb3ea955b7bb638fb'"/>
                <s:set name="_$type" value="'edit'"/>

                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui style="background-color:rgb(235, 235, 228);width:230px;" colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>

                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colspan="3" colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>

                    <%--<textarea id="paraMapObj_PM_MEMO" name="paraMapObj.PM_MEMO" maxlength="500" class="isSubmit input_textarea _VAL_DATABASE" save_mark="0" style="margin: 0px; width: 546px; height: 133px;"></textarea>--%>
                    <%--</bu:td>--%>
                </tr>
<%--
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colspan="5" colNo="PM_MEMO" formId="50c012f45e304e2993fb61b37d32e6be">
                        <textarea id="paraMap1_PM_MEMO" name="paraMap1@0#PM_MEMO" value="" class=" input_textarea isSubmit  _VAL_OjbsData" readonly="readonly" save_mark="0" style="margin: 0px; width: 300px; height: 200px;"></textarea> </bu:td>
                </tr>
--%>
            </table>
            <bu:jsVal formId="3ed22e0bef7744dcb3ea955b7bb638fb" formIndex="1"/>

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
    function savePack(){
        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=226f32a6e518442dbd879ea4942d5fd4";
        document.forms.editForm.submit();
    }
</script>