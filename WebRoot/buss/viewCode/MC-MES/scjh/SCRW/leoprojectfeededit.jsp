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
            <div style="margin-left:10px;">
                <div class="save-close" onclick="switchInput(this)"></div>
                <input type="checkbox" checked id="inputType" name="inputType" value="0" style="display: none;"/>
            </div>
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
                <button type="button" onclick="doSave(this)"><i class="ico ico-save"></i><dict:lang value="保存"/>
                </button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
                <!--<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>-->
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
                <input type="hidden" id="oldLength" name="oldLength" value="0" />
                <input type="hidden" id="prefixInd" name="b36254ac37e74240b1528d44627b6a84" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'b5111853ca65422fb14572829366a96a'"/>
                <s:set name="_$formId_1" value="'b36254ac37e74240b1528d44627b6a84'"/>
                <s:set name="_$type" value="'edit'"/>
                <tr>
                    <!-- <td class="name-four"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui style="background-color:rgb(235, 235, 228);width:230px;" disabled="disabled" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>-->
                    <td class="name-four"/>
                    <span class="dot">*</span>
                    工单号</td>
                    <bu:td cssClass="dec" colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" colspan="">
                        <input type="text" id="paraMapObj_PROJECT_ID" name="paraMapObj_PROJECT_ID" autocomplete="off" value="" class="input isSubmit " style="width:230px;" save_mark="0" onkeydown="addSplit(event);"> </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui disabled="disabled" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>

                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui disabled="disabled" colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>


                </tr>


                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>
            </table>
            <bu:jsVal formId="b36254ac37e74240b1528d44627b6a84" formIndex="1"/>
            <div style="padding:1px;"></div>

            <div class="mod">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="VOID-投料明细表单"/></h3>
                    <div class="extend-btn" style="float: right;margin-top:15px;">
                        <button type="button" onclick="_addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','2','','','');" style="padding:0;" title="<dict:lang value="添加" />">
                            <i class="ico ico-kl-new-add ico-small"></i>
                        </button>
                        <button type="button" onclick="_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');" style="padding:0" title="<dict:lang value="移除" /> ">
                            <i class="ico ico-sc-new-add ico-small"></i>
                        </button>
                    </div>
                </div>
                <div class="mod-bd">
                    <div class="panel datagrid datagrid-div1">
                        <div class="datagrid-div2 datagrid-div6 datagrid-view">
                            <div class="datagrid-header">
                                <div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
                                    <bu:addSub formid="b36254ac37e74240b1528d44627b6a84" formIndex="2" selfformid="92c585de53ff4e9f879b4e4bc0c16e8f" hidecol="" viewid=""/>
                                </div>
                            </div>
                            <div class="datagrid-body datagrid-div3 scroll12 " style="height:150px;" onscroll="ajaxTableScroll(this,'92c585de53ff4e9f879b4e4bc0c16e8f')">
                                <table class="glxb-table" style="width:100%" id="addTable_92c585de53ff4e9f879b4e4bc0c16e8f">
                                    <tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function initEditDataLs() {
                    getEditRows("92c585de53ff4e9f879b4e4bc0c16e8f", "2", "b36254ac37e74240b1528d44627b6a84", "", "339b7c191163426684496a67b2a51866", "");
                    $('table').find('tbody tr:eq(0)').click();
                }
            </script>


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
<script>
    $(function(){
        $(".tr1").eq(0).width(92);
        $(".tr1").eq(4).width(40);
        $(".tr1").eq(6).width(120);
    })
    $(function () {
        $("#paraMapObj_PROJECT_ID").focus();
        //calNumber();

        $("#paraMapObj_RECEIVE_COUNT").keyup(function () {
            onlyNumber(this);
        });

        $("input[id$='_FEED_NUM']").keyup(function () {
            cursorMovement(this, event);
            onlyNumber(this);
        });

        $("input[id$='_FEED_NUM']").keyup(function() {
            cursorMovement(this,event);
            onlyNumber(this);
        });
        $("input[id$='_RAW_LOTNUMBER']").keyup(function () {
            currawMovement(this, event);
        });
    });
    var manual = true;

    var error = false;

    var stop = false;


    function switchInput(self) {
        if (manual == true) {
            $(self).addClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:扫描输入"/>");
            manual = false;
            $('#inputType').attr('checked', false);
        }
        else if (manual == false) {
            $(self).removeClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:手动输入"/>");
            manual = true;
            $('#inputType').attr('checked', true);
        }
    }

    //回车事件初始值
    function addSplit(e) {
        var _mcDataAuth = top.$("#_mcDataAuth").val();
        var e = e || window.event;
        if (e && e.keyCode == 13) {
            var projectId = $("#paraMapObj_PROJECT_ID").val();
            console.log("projectId>>>" + projectId);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=5f0303d28ead4e68956b1c5f0cbc1af9",
                data: {"projectId": projectId,"_mcDataAuth" :_mcDataAuth},
                success: function (data) {
                    var reg = data.ajaxString;
                    if ("ng" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单输入错误,请重新输入", 0, "300", "");
                    } else if ("ng1" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单输已投料,请重新输入", 0, "300", "");
                    } else if("ng2" == reg){
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "无操作当前单据权限,请切换组织机构后重试", 0, "300", "");
                    } else {
                        doBlur();
                        //工单初始化
                        var pmap = data.ajaxMap;
                        $("#paraMapObj_PROJECT_ID").val(pmap.PROJECT_ID);
                        $("#paraMapObj_LOT_NUMBER").val(pmap.LOT_NUMBER);
                        $("#paraMapObj_ADMIN_EMP").val(pmap.CUR_USER);
                        $("#paraMapObj_ADMIN_EMP_SHOW").val(pmap.CUR_USER);
                        $("#paraMapObj_T5#PRODUCT_MATERIAL").val(pmap.PRODUCT_MATERIAL);
                        $("#paraMapObj_T5#PRODUCT_COUNT").val(pmap.PRODUCT_COUNT);
                        $("#paraMapObj_RECEIVE_COUNT").val(pmap.RECEIVE_COUNT);
                        $("#paraMapObj_T3#FEED_COUNT").val(pmap.FEED_COUNT);
                        $("#paraMapObj_T4#FEED_NUM").val(pmap.FEED_NUM);
                        $("#paraMapObj_T5#PRODUCT_NAME").val(pmap.PRODUCT_NAME);


                        //BOM初始化
                        var plist = data.ajaxList;
                        var len1 = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
                        var len = 0;
                        if (len1 != 0) {
                            var tid = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").find('tr').last().attr('id');
                            var ltid = tid.substr("10", tid.indexOf("_") - 10);
                            len = Number(ltid);
                        }

                        var plist = data.ajaxList;
                        var loginUserId = pmap.CUR_USER_ID;

                        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").empty();
                        if (plist.length > 0) {
                            for (var i = 0; i < plist.length; i++) {
                                _addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f', '2', '', '', '');

                                if (len1 != 0) {

                                    $("#paraMap" + (len + i + 1) + "_ITEM_CODE_SHOW").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_CODE").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_CODE_SHOW").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + (len + i + 1) + "_RAW_LOTNUMBER").val(plist[i].ITEM_LOT);
                                    $("#paraMap" + (len + i + 1) + "_RAW_LOTNUMBER").css("background-color", "rgb(173, 236, 178)");
                                    $("#paraMap" + (len + i + 1) + "_RAW_LOTNUMBER").attr("autocomplete","off");

                                    $("#paraMap" + (len + i + 1) + "_STOCK_CODE").val(plist[i].ITEM_STOCK);
                                    $("#paraMap" + (len + i + 1) + "_STOCK_CODE").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").val(plist[i].ITEM_NUM);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + (len + i + 1) + "_ITEM_UNIT").val(plist[i].ITEM_UNIT);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_UNIT").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + (len + i + 1) + "_FEED_NUM").val(plist[i].FEED_NUM);
                                    $("#paraMap" + (len + i + 1) + "_FEED_NUM").attr("autocomplete", "off");

                                    $("#paraMap" + (len + i + 1) + "_THRESHOLD_NUM").val(plist[i].THRESHOLD_NUM);
                                    $("#paraMap" + (len + i + 1) + "_THRESHOLD_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_T3#PRODUCT_NAME").val(plist[i].ITEM_NAME);
                                    $("#paraMap" + (len + i + 1) + "_T3#PRODUCT_NAME").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_PROCESS_ORDER").val(plist[i].ITEM_ORDER);
                                    $("#paraMap" + (len + i + 1) + "_PROCESS_ORDER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_WORK_SPACE").val(plist[i].WORK_SPACE);
                                    $("#paraMap" + (len + i + 1) + "_WORK_SPACE").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_WAREHOUSE").val(plist[i].WARE_HOUSE);
                                    $("#paraMap" + (len + i + 1) + "_WAREHOUSE").css("background-color", "rgb(225, 251, 227)");
                                    $("#addTableTr1_92c585de53ff4e9f879b4e4bc0c16e8f").each(function(){
                                        $(this).find("td:eq(5)").width(40);
                                        $(this).find("td:eq(7)").width(120);
                                    })
                                } else {

                                    $("#paraMap" + i + "_ITEM_CODE_SHOW").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + i + "_ITEM_CODE").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + i + "_ITEM_CODE_SHOW").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + i + "_RAW_LOTNUMBER").val(plist[i].ITEM_LOT);
                                    $("#paraMap" + i + "_RAW_LOTNUMBER").css("background-color", "rgb(173, 236, 178)");
                                    $("#paraMap" + i + "_RAW_LOTNUMBER").attr("autocomplete","off");

                                    $("#paraMap" + i + "_STOCK_CODE").val(plist[i].ITEM_STOCK);
                                    $("#paraMap" + i + "_STOCK_CODE").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + i + "_ITEM_NUM").val(plist[i].ITEM_NUM);
                                    $("#paraMap" + i + "_ITEM_NUM").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + i + "_ITEM_UNIT").val(plist[i].ITEM_UNIT);
                                    $("#paraMap" + i + "_ITEM_UNIT").css("background-color", "rgb(173, 236, 178)");

                                    $("#paraMap" + i + "_FEED_NUM").val(plist[i].FEED_NUM);
                                    $("#paraMap" + i + "_FEED_NUM").attr("autocomplete", "off");

                                    $("#paraMap" + i + "_THRESHOLD_NUM").val(plist[i].THRESHOLD_NUM);
                                    $("#paraMap" + i + "_THRESHOLD_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + i + "_T3#PRODUCT_NAME").val(plist[i].ITEM_NAME);
                                    $("#paraMap" + i + "_T3#PRODUCT_NAME").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + i + "_PROCESS_ORDER").val(plist[i].ITEM_ORDER);
                                    $("#paraMap" + i + "_PROCESS_ORDER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + i + "_WORK_SPACE").val(plist[i].FACTORY_CODE);
                                    $("#paraMap" + i + "_WORK_SPACE").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + i + "_WAREHOUSE").val(plist[i].WARE_HOUSE);
                                    $("#paraMap" + i + "_WAREHOUSE").css("background-color", "rgb(225, 251, 227)");
                                    $("#addTableTr1_92c585de53ff4e9f879b4e4bc0c16e8f").each(function(){
                                        $(this).find("td:eq(5)").width(40);
                                        $(this).find("td:eq(7)").width(120);
                                    })
                                }

                                var oldLength = pmap.SIZE;
                                $("#oldLength").val(oldLength);

                                if(plist[i].CREATE_USER != loginUserId){
                                    $("#paraMap" + (i) + "_ITEM_CODE_SHOW").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_ITEM_CODE").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_STOCK_CODE").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_ITEM_NUM").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_THRESHOLD_NUM").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_T3#PRODUCT_NAME").attr("disabled", "disabled");

                                    $("#paraMap" + (i) + "_FEED_NUM").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_ITEM_UNIT").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_RAW_LOTNUMBER").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_PROCESS_ORDER").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_WORK_SPACE").attr("disabled", "disabled");
                                    $("#paraMap" + (i) + "_WAREHOUSE").attr("disabled", "disabled");


                                    $("#paraMap" + (i) + "_ITEM_CODE_SHOW").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_ITEM_CODE").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_STOCK_CODE").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_ITEM_NUM").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_THRESHOLD_NUM").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_T3#PRODUCT_NAME").css("background-color", "rgb(187, 187, 187)");

                                    $("#paraMap" + (i) + "_FEED_NUM").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_ITEM_UNIT").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_RAW_LOTNUMBER").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_PROCESS_ORDER").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_WORK_SPACE").css("background-color", "rgb(187, 187, 187)");
                                    $("#paraMap" + (i) + "_WAREHOUSE").css("background-color", "rgb(187, 187, 187)");
                                    $("#addTableTr1_92c585de53ff4e9f879b4e4bc0c16e8f").each(function(){
                                        $(this).find("td:eq(5)").width(40);
                                        $(this).find("td:eq(7)").width(120);
                                    })
                                }
                            }
                        }
                    }

                    //阈值校验
                    thresholdCheck();
                    $("input[id$='_FEED_NUM']").keyup(function () {
                        cursorMovement(this, event);
                        onlyNumber(this);
                    });
                    $("input[id$='_RAW_LOTNUMBER']").keyup(function () {
                        currawMovement(this, event);
                    });

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    util.closeLoading();
                    var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                    if (null != sessionstatus && sessionstatus == "noAuthority") {
                    } else {
                        utilsFp.alert("error:" + errorThrown);
                    }
                }
            });
        }
    }

    function doFocus() {
        $("#paraMapObj_PROJECT_ID").focus();
        $("#paraMapObj_PROJECT_ID").val("");

    }

    function doBlur() {

        $("#paraMapObj_PROJECT_ID").blur();
    }
</script>

<script>
    function calFeedCount_bak() {
        $("#paraMapObj_T3#FEED_COUNT").val(0);
        var arr = [];
        var count = 0;

        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                if (cur.length < 1) {
                    cur = 0;
                }
                arr.push(cur);
                count = numAdd(parseFloat(count), parseFloat(cur));
            } else {
                arr.push("");
                count = numAdd(parseFloat(count), parseFloat(cur));
            }
        });
        $("#paraMapObj_T3#FEED_COUNT").val(count);
        $("#paraMap1_T4#FEED_NUM").val(count);
        var pec = $("#paraMapObj_T2#PREPARE_COUNT").val();
        //if(count>parseFloat(pec)){
        //   alert("投入物料大于备料重量,请核实")
        //}
    }

    //小数相加减
    function numAdd(num1, num2) {

        var r1, r2, m;
        try {
            r1 = num1.toString().split(".")[1].length;
        } catch (e) {
            r1 = 0;
        }
        try {
            r2 = num2.toString().split(".")[1].length;
        } catch (e) {
            r2 = 0;
        }

        m = Math.pow(10, Math.max(r1, r2));
        a = Math.round(num1 * m + num2 * m) / m;
        try {
            countLen = a.toString().split('.')[1].length;
            if (countLen == 1) {
                count = a.toString() + "00";
            } else if (countLen == 2) {
                count = a.toString() + "0";
            } else if (countLen == 3) {
                count = a.toString();
            } else {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量小数位错误,请正确输入" />", 0, "260", "");
                return;
            }
        } catch (e) {
            count = a.toString() + ".000";
        }
        return count;
    }

    function calFeedNum() {

        var count = $("tr[id^=addTableTr]").length;
        $("#paraMapObj_T4#FEED_NUM").val(count);
    }

    function calNumber() {
        //calItemNum();
        //calFeedTimes();
        calFeedCount();

        calFeedNum();
    }

    function calFeedTimes() {
        $("#paraMap1_T4#FEED_NUM").val(0);
        var count = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
        $("#paraMap1_T4#FEED_NUM").val(count);
    }

    // 鼠标移入移出事件  "input[id$='_FEED_NUM']"
    $("input[id$='_FEED_NUM']").hover(function () {
        //做实际投入的计算
        $("input").bind("input keypress", function (event) {
            calNumber();
        });
    }, function () {

        var arr = [];
        var count = 0;
        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                if (cur.length < 1) {
                    cur = 0;
                }
                arr.push(cur);
                count = numAdd(parseFloat(count), parseFloat(cur));
            } else {
                arr.push("");
                count = numAdd(parseFloat(count), parseFloat(cur));
            }
        });
        $("#paraMapObj_T3#FEED_COUNT").val(count);

    });

    //删除_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');
    function delRow(obj) {
        //_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');

        //获取选中的复选框，然后循环遍历删除
        var ckbs = $("input[id^=${status.count}]:checked");
        if (ckbs.size() == 0) {
            alert("要删除指定行，需选中要删除的行！");
            return;
        }
        ckbs.each(function () {
            $(this).parent().parent().remove();
        });
        calNumber();
    }

    function addRow() {
        _addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f', '2', '', '', '');
        calNumber();
    }

    /*
    function saveData(){
          document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=";
        document.forms.editForm.submit();
    }*/
    function listenEnter(e) {
        var curId = e.path[0].id;
        var cur = $("#" + curId).val();
        var e = e || window.event;
        if (e.keyCode == 13) {
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1b372d136ed94c1b837eea37bd75420b";
            $.ajax({
                type: "POST",
                dataType: "json",
                url: url,
                data: {"STOCK_CODE": cur},
                success: function (data) {
                    var obj = data.ajaxList[0];
                    //paraMap4_STOCK_CODE
                    var curCode = curId.replace("STOCK_CODE", "ITEM_CODE");
                    var curNum = curId.replace("STOCK_CODE", "ITEM_NUM");
                    $("#" + curCode).val(obj.ITEM_CODE);
                    $("#" + curCode + "_SHOW").val(obj.ITEM_CODE);
                    $("#" + curNum).val(obj.ITEM_NUM);
                    //paraMap0_T3#PRODUCT_NAME
                    var curName = curId.replace("STOCK_CODE", "T3#PRODUCT_NAME");
                    $("#" + curName).val(obj.ITEM_NAME);
                    //paraMap6_WORK_SPACE paraMap6_WAREHOUSE
                    var curSpace = curId.replace("STOCK_CODE", "WORK_SPACE");
                    $("#" + curSpace).val(obj.WORK_SPACE);
                    var curHouse = curId.replace("STOCK_CODE", "WAREHOUSE");
                    $("#" + curHouse).val(obj.WARE_HOUSE);
                },
                error: function (msg) {
                    utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                }
            });
        }
    }

    function doSave() {
        var projectId = $("#paraMapObj_PROJECT_ID").val();
        var receive_number = Number($("#paraMapObj_RECEIVE_COUNT").val());
        var idStr = "paraMapObj_T3#FEED_COUNT";
        var total_number = Number($("#" + idStr).val());

        if (isEmpty(receive_number)) {
            _alertValMsg(this, "<dict:lang value="该项不能为空" />");
            return;
        }

        if (!isNumber(total_number)) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=a381493664ad4dbd845f2051af2313af",
            data: {
                "TYPE": "1",
                "ItEM_CODE": "",
                "PROJECT_ID": projectId
            },
            success: function (data) {
                //阈值
                var Threshold = data.ajaxString;
                if (!isNumber(Threshold)) {
                    utilsFp.confirmIcon(1, "", "doSave1", "", "该工单未维护阀值,是否重继续？", "1", "260", "");
                    return;
                } else {
                    Threshold = Number(Threshold) / 100;
                }

                if (total_number == receive_number) {
                    doSave1();
                    return;
                }
                if (total_number * (1 + Threshold) < receive_number) {
                    utilsFp.confirmIcon(1, "", "doSave1", "", "收货重量超出阈值:" + Threshold * 100 + "%，是否重继续？", "1", "260", "");

                } else if (total_number * (1 - Threshold) > receive_number) {
                    utilsFp.confirmIcon(1, "", "doSave1", "", "收货重量低于阈值:" + Threshold * 100 + "%，是否重继续？", "1", "260", "");

                } else {
                    doSave1();

                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }

    function doSave1() {
        var projectId = $("#paraMapObj_PROJECT_ID").val();
        var oldLength = parseInt($("#oldLength").val());

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f915f2a4135c4aa2bad32e47a0853e13";

        console.log("oldLength: >>> ");
        console.log(oldLength);

        var itemCodeArr = [];
        var stockCodeArr = [];
        var stockCodeArr = [];
        var itemNumArr = [];
        var feedNumArr = [];
        var rawLotArr = [];
        var processOrderArr = [];

        var projectId = $("#paraMapObj_PROJECT_ID").val();

        var number = $("#paraMapObj_RECEIVE_COUNT").val();

        var workSpace = [];
        var wareHouse = [];

        var fag = false;
        $("input[id$='_WAREHOUSE']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                wareHouse.push(cur);


            } else {
                fag = true;
                return fag;
            }
        });
        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="仓库值不能为空" />", 0, "160", "");
            return;
        }

        $("input[id$='_WORK_SPACE']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                workSpace.push(cur);


            } else {
                fag = true;
                return fag;
            }
        });
        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
            return;
        }


        $("input[id$='_ITEM_CODE']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemCodeArr.push(cur);
            } else {
                itemCodeArr.push("");
            }
        });

        $("input[id$='_STOCK_CODE']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                stockCodeArr.push(cur);
            } else {
                stockCodeArr.push("");
            }
        });

        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemNumArr.push(cur);
            } else {
                itemNumArr.push("");
            }
        });

        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                feedNumArr.push(cur);
            } else {
                fag = true;
                return fag;
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量不能为空" />", "", "260", "145");
            return;
        }

        $("input[id$='_RAW_LOTNUMBER']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                rawLotArr.push(cur);
            } else {
                rawLotArr.push("");
            }
        });

        $("input[id$='_PROCESS_ORDER']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                processOrderArr.push(cur);
            } else {
                processOrderArr.push("");
            }
        });


        //--------------------------------------------------------
        var old_itemCodeArr = [];
        var old_stockCodeArr = [];
        var old_itemNumArr = [];
        var old_itemUnitArr = [];
        var old_feedNumArr = [];
        var old_rawLotArr = [];
        var old_processOrderArr = [];
        var old_workSpace = [];
        var old_wareHouse = [];

        $("input[id$='_WAREHOUSE']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_wareHouse.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });
        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
            return;
        }

        //工作中心
        $("input[id$='_WORK_SPACE']").each(function () {
            var cur = $(this).val();
            // for(var i=oldLength+1; i < rowMax+1 ; i++){
            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_workSpace.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
            return;
        }

        //物料号
        $("input[id$='_ITEM_CODE']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_itemCodeArr.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料编码不能为空" />", "", "260", "145");
            return;
        }



        //库存代码
        $("input[id$='_STOCK_CODE']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_stockCodeArr.push(cur);
                } else {
                    old_stockCodeArr.push("");
                }
            }
        });

        //理论数量
        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_itemNumArr.push(cur);
                } else {
                    old_itemNumArr.push("");
                }
            }
        });

        //单位
        $("input[id$='_ITEM_UNIT']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_itemUnitArr.push(cur);
                } else {
                    old_itemUnitArr.push("");
                }
            }
        });

        //投入数量
        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_itemUnitArr.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量不能为空" />", "", "260", "145");
            return;
        }

        //原材批次
        $("input[id$='_RAW_LOTNUMBER']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_rawLotArr.push(cur);
                } else {
                    old_rawLotArr.push("");
                }
            }
        });

        //工艺顺序
        $("input[id$='_PROCESS_ORDER']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(flag){
                if (cur != null) {
                    old_processOrderArr.push(cur);
                } else {
                    old_processOrderArr.push("");
                }
            }
        });

        //--------------------------------------------------------
        var new_itemCodeArr = [];
        var new_stockCodeArr = [];
        var new_itemNumArr = [];
        var new_itemUnitArr = [];
        var new_feedNumArr = [];
        var new_rawLotArr = [];
        var new_processOrderArr = [];
        var new_workSpace = [];
        var new_wareHouse = [];

        var lastId = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr:last").attr('id');
        var join = (lastId.split("addTableTr"))[1].split("_");
        var rowMax = parseInt(join[0])+1;

        $("input[id$='_WAREHOUSE']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_wareHouse.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });
        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
            return;
        }

        //工作中心
        $("input[id$='_WORK_SPACE']").each(function () {
            var cur = $(this).val();
            // for(var i=oldLength+1; i < rowMax+1 ; i++){
            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_workSpace.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
            return;
        }

        //物料号
        $("input[id$='_ITEM_CODE']").each(function () {
            var cur = $(this).val();
            debugger;
            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_itemCodeArr.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料编码不能为空" />", "", "260", "145");
            return;
        }



        //库存代码
        $("input[id$='_STOCK_CODE']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_stockCodeArr.push(cur);
                } else {
                    new_stockCodeArr.push("");
                }
            }
        });

        //理论数量
        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_itemNumArr.push(cur);
                } else {
                    new_itemNumArr.push("");
                }
            }
        });

        //单位
        $("input[id$='_ITEM_UNIT']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_itemUnitArr.push(cur);
                } else {
                    new_itemUnitArr.push("");
                }
            }
        });

        //投入数量
        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_feedNumArr.push(cur);
                } else {
                    fag = true;
                    return fag;
                }
            }
        });

        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量不能为空" />", "", "260", "145");
            return;
        }

        //原材批次
        $("input[id$='_RAW_LOTNUMBER']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_rawLotArr.push(cur);
                } else {
                    new_rawLotArr.push("");
                }
            }
        });

        //工艺顺序
        $("input[id$='_PROCESS_ORDER']").each(function () {
            var cur = $(this).val();

            var flag = $(this).prop("disabled");
            if(!flag){
                if (cur != null) {
                    new_processOrderArr.push(cur);
                } else {
                    new_processOrderArr.push("");
                }
            }
        });

        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=f915f2a4135c4aa2bad32e47a0853e13" +
            "&PROJECT_ID=" + projectId + "" +
            "&ITEM_CODE=" + itemCodeArr.join(",") +
            "&STOCK_CODE=" + stockCodeArr.join(",") +
            "&ITEM_NUM=" + itemNumArr.join(",") +
            "&FEED_NUM=" + feedNumArr.join(",") +
            "&RAW_LOTNUMBER=" + rawLotArr.join(",") +
            "&PROCESS_ORDER=" + processOrderArr.join(",") +
            "&WORK_SPACE=" + workSpace.join(",") +
            "&WARE_HOUSE=" + wareHouse.join(",") +

            "&OLD_ITEM_CODE="       + old_itemCodeArr.join(",") +
            "&OLD_STOCK_CODE="      + old_stockCodeArr.join(",") +
            "&OLD_ITEM_NUM="        + old_itemNumArr.join(",") +
            "&OLD_ITEM_UNIT="       + old_itemUnitArr.join(",") +
            "&OLD_FEED_NUM="        + old_feedNumArr.join(",") +
            "&OLD_RAW_LOTNUMBER="   + old_rawLotArr.join(",") +
            "&OLD_PROCESS_ORDER="   + old_processOrderArr.join(",") +
            "&OLD_WORK_SPACE="      + old_workSpace.join(",") +
            "&OLD_WARE_HOUSE="      + old_wareHouse.join(",")+

            "&NEW_ITEM_CODE="       + new_itemCodeArr.join(",") +
            "&NEW_STOCK_CODE="      + new_stockCodeArr.join(",") +
            "&NEW_ITEM_NUM="        + new_itemNumArr.join(",") +
            "&NEW_ITEM_UNIT="       + new_itemUnitArr.join(",") +
            "&NEW_FEED_NUM="        + new_feedNumArr.join(",") +
            "&NEW_RAW_LOTNUMBER="   + new_rawLotArr.join(",") +
            "&NEW_PROCESS_ORDER="   + new_processOrderArr.join(",") +
            "&NEW_WORK_SPACE="      + new_workSpace.join(",") +
            "&NEW_WARE_HOUSE="      + new_wareHouse.join(",");

        document.forms.editForm.submit();
    }

    function calFeedCount() {
        $("#paraMap1_T3#FEED_COUNT").val(0);
        var arr = [];
        var count = 0;

        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                if (cur.length < 1) {
                    cur = 0;
                }
                arr.push(cur);
                count = numAdd(parseFloat(count), parseFloat(cur));
            } else {
                arr.push("");
                count = numAdd(parseFloat(count), parseFloat(cur));
            }
        });

        $("#paraMapObj_T3#FEED_COUNT").val(count);
        $("#paraMapObj_RECEIVE_COUNT").val(count);
        var pec = $("#paraMap1@0#T5#PRODUCT_COUNT").val();
        if (count > parseFloat(pec)) {
            alert("投入物料大于备料重量,请核实");
        }
    }

    $("#paraMapObj_RECEIVE_COUNT").mouseleave(function () {
        var isFocus = $("#paraMapObj_RECEIVE_COUNT").is(":focus");
        if (true == isFocus) {
            var projectId = $("#paraMapObj_PROJECT_ID").val();
            var receive_number = Number($("#paraMapObj_RECEIVE_COUNT").val());
            var idStr = "paraMapObj_T3#FEED_COUNT";
            var total_number = Number($("#" + idStr).val());

            if (!isNumber(total_number)) {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");
                return;
            }

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=a381493664ad4dbd845f2051af2313af",
                data: {
                    "TYPE": "1",
                    "ItEM_CODE": "",
                    "PROJECT_ID": projectId
                },
                success: function (data) {
                    //阈值
                    var Threshold = data.ajaxString;
                    if (!isNumber(Threshold)) {
                        utilsFp.confirmIcon(3, "", "", "", "该工单未维护的阀值", 0, "160", "");
                        return;
                    } else {
                        Threshold = Number(Threshold) / 100;
                    }

                    if (total_number == receive_number) {
                        return;
                    }
                    if (total_number * (1 + Threshold) < receive_number) {
                        utilsFp.confirmIcon(3, "", "", "", "收货重量超出阈值:" + Threshold * 100 + "%", 0, "160", "");
                        return;
                    }
                    if (total_number * (1 - Threshold) > receive_number) {
                        utilsFp.confirmIcon(3, "", "", "", "收货重量低于阈值:" + Threshold * 100 + "%", 0, "160", "");

                    } else {
                        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="重量总计\实投总重\收货重量 数值有误" />", 0, "160", "");

                    }
                },
                error: function (msg) {
                    utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                }
            });
        }
    });


    function thresholdCheck(obj) {
        $("input[id$='_FEED_NUM']").mouseleave(function () {
            var isFocus = $("input[id$='_FEED_NUM']").is(":focus");
            if (true == isFocus) {
                var total_number = Number(this.parentElement.previousElementSibling.firstElementChild.value);
                var receive_number = Number(this.value);
                var threshold_number = this.parentElement.nextElementSibling.firstElementChild.value;

                if (!isNumber(threshold_number)) {
                    //utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="该物料未维护阀值!" />", 0, "160", "");
                    return;
                } else {
                    threshold_number = Number(threshold_number) / 100;
                }

                if (total_number * (1 + threshold_number) < receive_number) {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料超出阈值" />", 0, "160", "");
                    return;
                }
                if (total_number * (1 - threshold_number) > receive_number) {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料低于阈值" />", 0, "160", "");
                }
            }
        });
    }


    function isEmpty(obj) {
        if (typeof obj == "undefined" || obj == null || obj == "") {
            return true;
        } else {
            return false;
        }
    }

    function onlyNumber(obj) {
        //得到第一个字符是否为负号
        var t = obj.value.charAt(0);
        //先把非数字的都替换掉，除了数字和.
        obj.value = obj.value.replace(/[^\d\.]/g, '');
        //必须保证第一个为数字而不是.
        obj.value = obj.value.replace(/^\./g, '');
        //保证只有出现一个.而没有多个.
        obj.value = obj.value.replace(/\.{2,}/g, '.');
        //保证.只出现一次，而不能出现两次以上
        obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
        //如果第一位是负号，则允许添加
        if (t == '-') {
            obj.value = '-' + obj.value;
        }
    }

    function isNumber(val) {
        var regPos = /^\d+(\.\d+)?$/; //非负浮点数
        if (regPos.test(val)) {
            return true;
        } else {
            return false;
        }
    }

    function cursorMovement(obj, event) {
        if(event.keyCode==40 || event.keyCode==13){
            if(!checkFeedNum(obj)){
                return false;
            }
            var nextNode = $(obj).parent().parent().next().children().find('input[name$="FEED_NUM"]');
            if(nextNode.length==0){
                return false;
            }
            nextNode.focus();
        }
        if(event.keyCode==38){
            if(!checkFeedNum(obj)){
                return false;
            }
            var nextNode = $(obj).parent().parent().prev().children().find('input[name$="FEED_NUM"]');
            if(nextNode.length==0){
                return false;
            }
            nextNode.focus();
        }
    }
    function cursorMovement(obj, event) {
        if (event.keyCode == 40 || event.keyCode == 13) {
            var nextNode = $(obj).parent().parent().next().children().find('input[name$="FEED_NUM"]');
            if (nextNode.length == 0) {
                return false;
            }
            nextNode.focus();
        }
        if (event.keyCode == 38) {
            var nextNode = $(obj).parent().parent().prev().children().find('input[name$="FEED_NUM"]');
            if (nextNode.length == 0) {
                return false;
            }
            nextNode.focus();
        }
    }

    function checkFeedNum(obj) {
        var total_number = Number(obj.parentElement.previousElementSibling.firstElementChild.value);
        var receive_number = Number(obj.value);
        var threshold_number = obj.parentElement.nextElementSibling.firstElementChild.value;

        if (isEmpty(receive_number)) {
            //utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料不能为空" />", 0, "160", "");
            _alertValMsg(obj, "<dict:lang value="该项不能为空" />");
            return false;
        }

        if (!isNumber(threshold_number)) {
            //utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="该物料未维护阀值!" />", 0, "160", "");
            return false;
        } else {
            threshold_number = Number(threshold_number) / 100;
        }

        if (total_number * (1 + threshold_number) < receive_number) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料超出阈值" />", 0, "160", "");
            return false;
        }
        if (total_number * (1 - threshold_number) > receive_number) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料低于阈值" />", 0, "160", "");
            return false;
        }
        return true;
    }

    //删除本身及子表单
    function _delRowExtendConfirm(obj) {
        var tableId = obj.tableId;
        var subformids = obj.subformids;

        $("input[name='checkbox" + tableId + "']:checked").each(function () { // 遍历选中的checkbox
            var trIndex = $(this).parents("tr").index();
            $("#addTable_" + tableId).find("tr:eq(" + trIndex + ")").remove();
            if (subformids == 'null' || subformids == '' || subformids == null || subformids == undefined) {
                return true;
            }
            var subformidArray = subformids.split(',');
            for (var k = 0; k < subformidArray.length; k++) {
                var subformid = subformidArray[k];
                var colNoRel = $("input[name='COL_NO" + subformid + "']").val();

                var relValue = $(this).parents("tr").find('td').find(":input[name^='paraMap'][name$='" + colNoRel + "']").val();

                var colNo = $("input[name='COL_NO_D" + subformid + "']").val();
                $("#addTable_" + subformid + " tbody tr td").find(":input[name^='paraMap'][name$='" + colNo + "']").each(function () {
                    var relV = $(this).val();
                    if (relV == relValue) {
                        $(this).parent().parent().remove();
                    }
                });
            }
        });
        calNumber()
    }
    //批次键盘操作
    function currawMovement(obj, event) {
        console.log("+++++++");
        if (event.keyCode == 40 || event.keyCode == 13) {
            var nextNode = $(obj).parent().parent().next().children().find('input[name$="RAW_LOTNUMBER"]');
            if (nextNode.length == 0) {
                return false;
            }
            nextNode.focus();
        }
        if (event.keyCode == 38) {
            var nextNode = $(obj).parent().parent().prev().children().find('input[name$="RAW_LOTNUMBER"]');
            if (nextNode.length == 0) {
                return false;
            }
            nextNode.focus();
        }
    }
    (function($) {
        $(window).on('load', function() {
            setPopScroll('.scroll12');
        })
    })(jQuery)
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
