<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title><dict:lang value="新增"/>
    </title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- head里面 -->

    <!-- 产品静态资源 -->


</head>
<body style="overflow:auto;">
<div class="edit">
    <form autocomplete="off" id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post"
            <bu:formet exeid="%{exeid}"/> target="submitFrame">
        <div class="hd">
            <div style="margin-left:10px;">
                <div class="save-close" onclick="switchInput(this)"></div>
                <input type="checkbox" checked id="inputType" name="inputType" value="0" style="display: none;"/>
            </div>
            <div style="margin-left:10px;">
                <div class="save-close" style="display:none;"
                        <dict:lang value="关闭保存并关闭窗口"/> onclick="saveClose(this)"></div>
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                    <span class="dot">*</span>
                    <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if> <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else> </s:if>
            </div>


            <div class="optn">
                <button type="button" onclick="doSave();"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
            </div>

        </div>
        <div class="bd">

            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_10"/>
                <jsp:param name="location" value="addForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="b36254ac37e74240b1528d44627b6a84" type="add"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="b36254ac37e74240b1528d44627b6a84"/>
                <input type="hidden" id="prefixInd" name="b36254ac37e74240b1528d44627b6a84" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'b4c11c874315446aa80cb82883a392ee'"/>
                <s:set name="_$formId_1" value="'b36254ac37e74240b1528d44627b6a84'"/>
                <s:set name="_$type" value="'add'"/>
                <tr>
                    <!--   <td class="name-four"/>
                    <span class="dot">*</span>
                   <bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui style="background-color:rgb(235, 235, 228);width:230px;" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" value="%{PROJECT_ID}" formIndex="1"/>
                    </bu:td> -->
                    <td class="name-four"/>
                    <span class="dot">*</span>
                    工单号</td>
                    <bu:td cssClass="dec" colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" colspan="">
                        <input type="text" id="paraMap1_PROJECT_ID" name="paraMap1_PROJECT_ID" autocomplete="off" value="" class="input isSubmit " style="width:230px;" save_mark="0" onkeydown="addSplit(event);"> </bu:td>


                    <td class="name-four"/>
                    <bu:uitn colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" value="%{LOT_NUMBER}" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui disabled="disabled" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>
                </tr>

                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="RECEIVE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>
                </tr>

                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#PRODUCT_MATERIAL" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#PRODUCT_NAME" formId="b36254ac37e74240b1528d44627b6a84" dataId="" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="RAW_LICENSE" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td colspan="5" cssClass="dec-self" colNo="RAW_LICENSE" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T5#RAW_LICENSE" formId="b36254ac37e74240b1528d44627b6a84" dataId="" formIndex="1"/>
                    </bu:td>
                </tr>
                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" value="" formIndex="1"/>
                    </bu:td>

                    <td class="name-four"/>
                    <bu:uitn colNo="VAT_NO" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colNo="VAT_NO" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="VAT_NO" formId="b36254ac37e74240b1528d44627b6a84" dataId="" formIndex="1"/>
                    </bu:td>

                </tr>
                <%--
                                <tr>
                                    <td class="name-four"/>
                                    <bu:uitn colNo="T5#PM_MEMO" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                                    <bu:td colspan="5" cssClass="dec-self" colNo="T5#PM_MEMO" formId="b36254ac37e74240b1528d44627b6a84">
                                        <bu:ui readonly="readonly" colNo="T5#PM_MEMO" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" formIndex="1"/>
                                    </bu:td>
                                </tr>
                --%>

                <tr>
                    <td class="name-four"/>
                    <bu:uitn colNo="T5#PM_MEMO" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec-self" colspan="5" colNo="T5#PM_MEMO" formId="50c012f45e304e2993fb61b37d32e6be">
                        <%--<bu:ui colNo="T5#PM_MEMO" formId="50c012f45e304e2993fb61b37d32e6be" value="%{T5#PM_MEMO}" formIndex="1" />--%>
                        <textarea id="paraMap1_T5#PM_MEMO" name="paraMap1@0#T5#PM_MEMO" value="" class=" input_textarea isSubmit  _VAL_OjbsData" readonly="readonly" save_mark="0" style="margin: 0px; width: 844px; height: 30px;"></textarea> </bu:td>
                </tr>
            </table>
            <bu:jsVal formId="b36254ac37e74240b1528d44627b6a84" formIndex="1"/>
            <div style="padding:1px;"></div>

            <div class="mod">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="投料明细表单"/></h3>
                    <div class="extend-btn" style="float: right;margin-top:15px;">
                        <button type="button" onclick="_addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','2','','','');addRow();" style="padding:0;" title="<dict:lang value="添加" />">
                            <i class="ico ico-kl-new-add ico-small"></i>
                        </button>

                        <button type="button" onclick="_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');" style="padding:0" title="<dict:lang value="移除" /> ">
                            <i class="ico ico-sc-new-add ico-small"></i>
                        </button>
                    </div>
                </div>
                <div class="mod-bd">
                    <div class="panel datagrid datagrid-div1">
                        <div class="datagrid-div2 datagrid-div6 datagrid-view" onscroll="ajaxTableScroll(this,'92c585de53ff4e9f879b4e4bc0c16e8f')">
                            <div class="datagrid-header">
                                <div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
                                    <bu:addSub formid="b36254ac37e74240b1528d44627b6a84" formIndex="2" selfformid="92c585de53ff4e9f879b4e4bc0c16e8f" hidecol="" viewid=""/>
                                </div>
                            </div>
                            <div class="datagrid-body datagrid-div3" style="height:250px">
                                <table class="glxb-table fixedTable" style="width:100%" id="addTable_92c585de53ff4e9f879b4e4bc0c16e8f">
                                    <tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="needValidate" value="1"/>
</jsp:include>
<script>
    var manual = true;

    var error = false;

    var stop = false;

    $("#paraMap1_PROJECT_ID").focus();

    $("#paraMap1_RECEIVE_COUNT").keyup(function () {
        onlyNumber(this);
    });

    function addRow() {
        console.log("addRow function: >>> ");
        var ws = "1101";
        var wh = "3107";

        var _mcDataAuth = top.$("#_mcDataAuth").val();
        if (_mcDataAuth == "9e33fa093ca74f229a997f0cf3734a9c") {
            ws = "1101";
            wh = "3109";
        } else if (_mcDataAuth == "7f60fed22c004015a9a4f1ab2fc59194") {
            ws = "1101";
            wh = "3107";
        } else {
            ws = "1101";
            wh = "3107";
        }

        var tid = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").find('tr').last().attr('id');
        var ftid = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").find('tr').first().attr('id');

        var fws = $("#" + ftid).find("td").eq(10).find("input").eq(0).val();
        var fwh = $("#" + ftid).find("td").eq(11).find("input").eq(0).val();

        $("#" + tid).find("td").eq(10).find("input").eq(0).val(fws);
        $("#" + tid).find("td").eq(11).find("input").eq(0).val(fwh);
    }

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
            var projectId = $("#paraMap1_PROJECT_ID").val();
            console.log("projectId>>>" + projectId);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=4a2911c7c5b04fea8b87d41679e1bb26",
                data: {"projectId": projectId,"_mcDataAuth":_mcDataAuth},
                success: function (data) {
                    var reg = data.ajaxString;
                    if ("ng" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单输入错误,请重新输入", 0, "300", "");


                    } else if ("ng1" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单输已投料,请重新输入", 0, "300", "");
                    } else {
                        doBlur();
                        //工单初始化
                        var pmap = data.ajaxMap;
                        $("#paraMap1_PROJECT_ID").val(pmap.PROJECT_ID);
                        $("#paraMap1_LOT_NUMBER").val(pmap.LOT_NUMBER);
                        $("#paraMap1_ADMIN_EMP").val(pmap.curr_man);
                        $("#paraMap1_PRODUCT_NAME").val(pmap.PRODUCT_NAME);
                        $("#paraMap1_ADMIN_EMP_SHOW").val(pmap.CUR_USER);
                        $("#paraMap1_ADMIN_EMP").val(pmap.CUR_USER);

                        $("#paraMap1_T5#PRODUCT_MATERIAL").val(pmap.PRODUCT_MATERIAL);
                        $("#paraMap1_T5#PRODUCT_NAME").val(pmap.PRODUCT_NAME);
                        $("#paraMap1_T3#FEED_COUNT").val("0");
                        $("#paraMap1_RECEIVE_COUNT").val("0");
                        $("#paraMap1_T5#PM_MEMO").val(pmap.PM_MEMO);

                        $("#paraMap1_T5#PRODUCT_COUNT").val(pmap.PRODUCT_COUNT);
                        $("#paraMap1_VAT_NO").find("option[value=" + pmap.VAT_NO + "]").attr("selected", true);
                        // $("#paraMap1_VAT_NO_chosen").innerText(pmap.VAT_NO);

                        //BOM初始化
                        var plist = data.ajaxList;
                        var len1 = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
                        var len = 0;
                        if (len1 != 0) {
                            var tid = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").find('tr').last().attr('id');
                            var ltid = tid.substr("10", tid.indexOf("_") - 10);
                            len = Number(ltid);
                        }

                        // var len = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
                        //$("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").remove();
                        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").empty();

                        if (plist.length > 0) {
                            for (var i = 0; i < plist.length; i++) {
                                _addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f', '2', '', '', '');
                                if (len1 != 0) {
                                    $("#paraMap" + (len + i + 1) + "_ITEM_CODE_SHOW").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_CODE").val(plist[i].ITEM_CODE);

                                    $("#paraMap" + (len + i + 1) + "_RAW_LOTNUMBER").val(plist[i].ITEM_LOT);
                                    $("#paraMap" + (len + i + 1) + "_RAW_LOTNUMBER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_STOCK_CODE").val(plist[i].ITEM_STOCK);
                                    $("#paraMap" + (len + i + 1) + "_STOCK_CODE").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").val(plist[i].ITEM_NUM);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_ITEM_UNIT").val(plist[i].ITEM_UNIT);
                                    $("#paraMap" + (len + i + 1) + "_ITEM_UNIT").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_THRESHOLD_NUM").val(plist[i].THRESHOLD_NUM);
                                    $("#paraMap" + (len + i + 1) + "_THRESHOLD_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_T3#PRODUCT_NAME").val(plist[i].ITEM_NAME);
                                    $("#paraMap" + (len + i + 1) + "_T3#PRODUCT_NAME").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_PROCESS_ORDER").val(plist[i].ITEM_ORDER);
                                    $("#paraMap" + (len + i + 1) + "_PROCESS_ORDER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_FEED_NUM").val(plist[i].FEED_NUM);
                                    $("#paraMap" + (len + i + 1) + "_FEED_NUM").css("background-color", "rgb(225, 251, 227)");


                                    $("#paraMap" + (len + i + 1) + "_WORK_SPACE").val(plist[i].WORK_SPACE);
                                    $("#paraMap" + (len + i + 1) + "_WORK_SPACE").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (len + i + 1) + "_WAREHOUSE").val(plist[i].WARE_HOUSE);
                                    $("#paraMap" + (len + i + 1) + "_WAREHOUSE").css("background-color", "rgb(225, 251, 227)");
                                } else {
                                    $("#paraMap" + (i + 1) + "_ITEM_CODE_SHOW").val(plist[i].ITEM_CODE);
                                    $("#paraMap" + (i + 1) + "_ITEM_CODE").val(plist[i].ITEM_CODE);

                                    $("#paraMap" + (i + 1) + "_RAW_LOTNUMBER").val(plist[i].ITEM_LOT);
                                    $("#paraMap" + (i + 1) + "_RAW_LOTNUMBER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_STOCK_CODE").val(plist[i].ITEM_STOCK);
                                    $("#paraMap" + (i + 1) + "_STOCK_CODE").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_ITEM_NUM").val(plist[i].ITEM_NUM);
                                    $("#paraMap" + (i + 1) + "_ITEM_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_ITEM_UNIT").val(plist[i].ITEM_UNIT);
                                    $("#paraMap" + (i + 1) + "_ITEM_UNIT").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_THRESHOLD_NUM").val(plist[i].THRESHOLD_NUM);
                                    $("#paraMap" + (i + 1) + "_THRESHOLD_NUM").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_T3#PRODUCT_NAME").val(plist[i].ITEM_NAME);
                                    $("#paraMap" + (i + 1) + "_T3#PRODUCT_NAME").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_PROCESS_ORDER").val(plist[i].ITEM_ORDER);
                                    $("#paraMap" + (i + 1) + "_PROCESS_ORDER").css("background-color", "rgb(225, 251, 227)");

                                    $("#paraMap" + (i + 1) + "_FEED_NUM").val(plist[i].FEED_NUM);
                                    $("#paraMap" + (i + 1) + "_FEED_NUM").css("background-color", "rgb(225, 251, 227)");


                                    $("#paraMap" + (i + 1) + "_WORK_SPACE").val(plist[i].WORK_SPACE);
                                    $("#paraMap" + (i + 1) + "_WORK_SPACE").css("background-color", "rgb(225, 251, 227)");

                                    //  $("#paraMap" + (i + 1) + "_WAREHOUSE").val(plist[i].WARE_HOUSE);
                                    $("#paraMap" + (i + 1) + "_WAREHOUSE").val("3107");
                                    $("#paraMap" + (i + 1) + "_WAREHOUSE").css("background-color", "rgb(225, 251, 227)");
                                }
                            }
                        }
                    }
                    thresholdCheck();
                    $("input[id$='_FEED_NUM']").keyup(function (event) {
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
        $("#paraMap1_PROJECT_ID").focus();
        $("#paraMap1_PROJECT_ID").val("");
    }

    function doBlur() {
        $("#paraMap1_PROJECT_ID").blur();
    }

    //批次键盘操作
    function currawMovement(obj, event) {
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
</script>
<script>
    function listenEnter(e) {
        var curId = e.path[0].id;
        var cur = $("#" + curId).val();
        var curProjectId = $("#paraMap1_PROJECT_ID").val();
        var e = e || window.event;
        if (e.keyCode == 13) {
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=8931e553409f434e8792555b1d9027ba";
            $.ajax({
                type: "POST",
                dataType: "json",
                url: url,
                data: {"STOCK_CODE": cur, "PROJECT_ID": curProjectId},
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

    function StockCodeOnBlur(e) {
        console.log("this is StockCodeOnBlur function: >>> ");
        var curProjectId = $("#paraMap1_PROJECT_ID").val();
        var curId = e.path[0].id;
        var cur = $("#" + curId).val();
        var e = e || window.event;
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1b372d136ed94c1b837eea37bd75420b";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: {"STOCK_CODE": cur, "PROJECT_ID": curProjectId},
            success: function (data) {
                if (data.ajaxList != null) {
                    var obj = data.ajaxList[0];
                    var curCode = curId.replace("STOCK_CODE", "ITEM_CODE");
                    //var curNum = curId.replace("STOCK_CODE", "ITEM_NUM");
                    $("#" + curCode).val(obj.ITEM_CODE);
                    $("#" + curCode + "_SHOW").val(obj.ITEM_CODE);
                    // $("#" + curNum).val(obj.ITEM_NUM);
                    var curName = curId.replace("STOCK_CODE", "T3#PRODUCT_NAME");
                    $("#" + curName).val(obj.ITEM_NAME);
                    var curSpace = curId.replace("STOCK_CODE", "WORK_SPACE");
                    $("#" + curSpace).val(obj.WORK_SPACE);
                    var curHouse = curId.replace("STOCK_CODE", "WAREHOUSE");
                    $("#" + curHouse).val("3107");
                } else {
                    var curCode = curId.replace("STOCK_CODE", "ITEM_CODE");
                    // var curNum = curId.replace("STOCK_CODE", "ITEM_NUM");
                    var curName = curId.replace("STOCK_CODE", "T3#PRODUCT_NAME");
                    var curSpace = curId.replace("STOCK_CODE", "WORK_SPACE");
                    var curHouse = curId.replace("STOCK_CODE", "WAREHOUSE");

                    $("#" + curCode).val("");
                    $("#" + curCode + "_SHOW").val("");
                    //  $("#" + curNum).val("");
                    $("#" + curName).val("");
                    $("#" + curSpace).val("");
                    $("#" + curHouse).val("");
                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }


    function doSave() {

        var feedNums = $("input[id$='_FEED_NUM']");
        for (var i = 0; i < feedNums.size(); i++) {
            if (feedNums[i].value == null || feedNums[i].value == "") {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量不能为空" />", "", "260", "145");
                return;
            }
        }

        var itemCodes = $("input[id$='ITEM_CODE']");
        for (var i = 0; i < itemCodes.size(); i++) {
            if (itemCodes[i].value == null || itemCodes[i].value == "") {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料编码不能为空" />", "", "260", "145");
                return;
            }
        }
        
        var projectId = $("#paraMap1_PROJECT_ID").val();
        var receive_number = Number($("#paraMap1_RECEIVE_COUNT").val());
        var idStr = "paraMap1_T3#FEED_COUNT";
        var total_number = Number($("#" + idStr).val());

        if (isEmpty(receive_number)) {
            _alertValMsg(this, "<dict:lang value="该项不能为空" />");
            return;
        }

        if (!isNumber(total_number)) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "260", "");
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
                    utilsFp.confirmIcon(1, "", "doSave1", "", "该工单未维护阀值，是否重继续？", "1", "260", "");
                    return;
                } else {
                    Threshold = Number(Threshold) / 100;
                }


                if (total_number * (1 + Threshold) < receive_number) {
                    utilsFp.confirmIcon(1, "", "doSave1", "", "收货数量超出阈值:" + Threshold * 100 + "%，是否重继续？", "1", "260", "");

                } else if (total_number * (1 - Threshold) > receive_number) {
                    utilsFp.confirmIcon(1, "", "doSave1", "", "收货数量低于阈值:" + Threshold * 100 + "%，是否重继续？", "1", "260", "");

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

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=3da1e9b4b7e84a409abf14b7bcdaa43f";

        var projectId = $("#paraMap1_PROJECT_ID").val();
        var itemCodeArr = [];
        var stockCodeArr = [];
        var itemNumArr = [];
        var itemUnitArr = [];
        var feedNumArr = [];
        var rawLotArr = [];

        var processOrderArr = [];

        var workSpace = [];
        var wareHouse = [];

        var number = $("#paraMap1_RECEIVE_COUNT").val();

        var fag = false;

        $("input[id$='_WAREHOUSE']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                wareHouse.push(cur);

            } else {
                fag = true;

            }
        });
        if (fag) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="仓库值不能为空" />", "", "260", "145");
            return;
        }

        $("input[id$='_WORK_SPACE']").each(function () {

            var cur = $(this).val();

            if (cur != "") {
                workSpace.push(cur);

            } else {
                fag = true;

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


        $("input[id$='_ITEM_UNIT']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemUnitArr.push(cur);
            } else {
                itemUnitArr.push("");
            }
        });

        $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                feedNumArr.push(cur);
            } else {
                feedNumArr.push("");
            }
        });

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


        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3da1e9b4b7e84a409abf14b7bcdaa43f" +
            "&PROJECT_ID=" + projectId + "" +
            "&RECEIVE_COUNT=" + number + "" +
            "&ITEM_CODE=" + itemCodeArr.join(",") +
            "&STOCK_CODE=" + stockCodeArr.join(",") +
            "&ITEM_NUM=" + itemNumArr.join(",") +
            "&ITEM_UNIT=" + itemUnitArr.join(",") +
            "&FEED_NUM=" + feedNumArr.join(",") +
            "&RAW_LOTNUMBER=" + rawLotArr.join(",") +
            "&PROCESS_ORDER=" + processOrderArr.join(",") +
            "&WORK_SPACE=" + workSpace.join(",") +
            "&WARE_HOUSE=" + wareHouse.join(",");
        document.forms.addForm.submit();
        /*

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    data: {
                        "PROJECT_ID": projectId,
                        "ITEM_CODE": itemCodeArr.join(","),
                        "STOCK_CODE": stockCodeArr.join(","),
                        "ITEM_NUM": itemNumArr.join(","),
                        "FEED_NUM": feedNumArr.join(","),
                        "RAW_LOTNUMBER": rawLotArr.join(","),
                        "PROCESS_ORDER": processOrderArr.join(",")
                    },
                    success: function (data) {
                        var msg = data.ajaxString;
                        util.closeLoading();
                        utilsFp.confirmIcon(2, "", "query", "", msg, 0, "300", "");
                    },
                    error: function (msg) {
                        utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                    }
                });
        */

    }

    //监听原材合格证输入框
    $("#paraMap1_T5#RAW_LICENSE").bind("input keypress", function (e) {
        var curProjectId = $("#paraMap1_PROJECT_ID").val();
        var curId = e.currentTarget.id;
        var cur = $("#" + curId).val();

        var e = e || window.event;
        if (e.keyCode == 13) {
            var split = cur.split("$");
            if (split[1] != null) {
                var curStock = split[0];
                var curLot = split[1];
                var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1b372d136ed94c1b837eea37bd75420b";
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    data: {"STOCK_CODE": curStock, "PROJECT_ID": curProjectId},
                    success: function (data) {
                        if (data.ajaxList != null) {
                            var obj = data.ajaxList[0];
                            var otherStockArr = [];
                            var otherStockIdArr = [];
                            $("input[id$='_STOCK_CODE']").each(function () {
                                var otherStock = $(this).val();
                                var otherStockId = $(this).attr("id");
                                otherStockIdArr.push(otherStockId);
                                if (otherStock != null) {
                                    otherStockArr.push(otherStock);
                                } else {
                                    otherStockArr.push("");
                                }
                            });

                            var index = $.inArray(curStock, otherStockArr);


                            if ($.inArray(curStock, otherStockArr) == -1) {
                                _addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f', '2', '', '', '');
                                var tid = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").find('tr').last().attr('id');
                                var ltid = tid.substr("10", tid.indexOf("_") - 10);
                                var lastId = Number(ltid);
                                $("#paraMap" + (lastId) + "_ITEM_CODE_SHOW").val(obj.ITEM_CODE);
                                $("#paraMap" + (lastId) + "_ITEM_CODE").val(obj.ITEM_CODE);
                                // $("#paraMap" + (lastId) + "_ITEM_NUM").val(obj.ITEM_NUM);
                                $("#paraMap" + (lastId) + "_RAW_LOTNUMBER").val(curLot);
                                $("#paraMap" + (lastId) + "_STOCK_CODE").val(curStock);
                                $("#paraMap" + (lastId) + "_T3#PRODUCT_NAME").val(obj.ITEM_NAME);
                                $("#paraMap" + (lastId) + "_WORK_SPACE").val(obj.WORK_SPACE);
                                $("#paraMap" + (lastId) + "_WAREHOUSE").val(obj.WARE_HOUSE);
                                $("#paraMap" + (lastId) + "_ITEM_UNIT").val(obj.ITEM_UNIT);
                            } else {
                                $("#paraMap" + (index + 1) + "_ITEM_CODE_SHOW").val(obj.ITEM_CODE);
                                $("#paraMap" + (index + 1) + "_ITEM_CODE").val(obj.ITEM_CODE);
                                // $("#paraMap" + (index + 1) + "_ITEM_NUM").val(obj.ITEM_NUM);
                                $("#paraMap" + (index + 1) + "_RAW_LOTNUMBER").val(curLot);
                                $("#paraMap" + (index + 1) + "_STOCK_CODE").val(curStock);
                                $("#paraMap" + (index + 1) + "_T3#PRODUCT_NAME").val(obj.ITEM_NAME);
                                $("#paraMap" + (index + 1) + "_WORK_SPACE").val(obj.WORK_SPACE);
                                $("#paraMap" + (index + 1) + "_WAREHOUSE").val(obj.WARE_HOUSE);
                                $("#paraMap" + (index + 1) + "_ITEM_UNIT").val(obj.ITEM_UNIT);
                            }
                        } else {
                            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="无匹配结果" />", 0, "260", "")
                        }
                        $("#" + curId).val("");
                    },
                    error: function (msg) {
                        utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                        $("#" + curId).val("");
                    }
                });
            } else {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="合格原料标识格式错误(参考格式：XXX$YYMMDD001)" />", 0, "260", "");
                $("#" + curId).val("");
            }
        }
    });

    //paraMap1_T5#PRODUCT_COUNT
    function calItemNum() {
        $("#paraMap1_T5#PRODUCT_COUNT").val(0);
        var arr = [];
        var count = 0;

        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                arr.push(cur);
                count = parseInt(count) + parseInt(cur);
            } else {
                arr.push("");
                count = parseInt(count) + parseInt(0);
            }
        });

        $("#paraMap1_T5#PRODUCT_COUNT").val(count);
    }


    function calReceiveNum() {
        //$("#paraMap1_T5#PRODUCT_COUNT").val(0);
        var arr = [];
        var count = 0;
        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                arr.push(cur);
                count = parseInt(count) + parseInt(cur);
            } else {
                arr.push("");
                count = parseInt(count) + parseInt(0);
            }
        });

        $("#paraMap1_RECEIVE_COUNT").val(count);
    }

    function calProductCount() {
        $("#paraMap1_T5#PRODUCT_COUNT").val(0);
        var arr = [];
        var count = 0;

        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                arr.push(cur);
                count = parseInt(count) + parseInt(cur);
            } else {
                arr.push("");
                count = parseInt(count) + parseInt(0);
            }
        });
        $("#paraMap1_T5#PRODUCT_COUNT").val(count);
    }


    function calFeedCount() {
        $("#paraMap1_T3#FEED_COUNT").val(0);
        var arr = [];
        var count = 0;

        /**    $("input[id$='_FEED_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                if (cur.length < 1) {
                    cur = 0;
                }
                arr.push(cur);
                count = parseInt(count) + parseInt(cur);
            } else {
                arr.push("");
                count = parseInt(count) + parseInt(0);
            }
        });**/
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


        $("#paraMap1_T3#FEED_COUNT").val(count);
        $("#paraMap1_RECEIVE_COUNT").val(count);
        var pec = $("#paraMap1@0#T5#PRODUCT_COUNT").val();
        if (count > parseFloat(pec)) {
            alert("投入物料大于备料重量,请核实")
        }
    }

    //小数相加减
    function numAdd(num1, num2) {
        var r1, r2, m;
        try {
            r1 = num1.toString().split('.')[1].length;
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
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="投入数量小数位错误,请正确输入" />", 0, "260", "")
            }
        } catch (e) {
            count = a.toString() + ".000";
        }
        return count;
    }

    function calFeedTimes() {
        $("#paraMap1_T4#FEED_NUM").val(0);
        var count = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
        $("#paraMap1_T4#FEED_NUM").val(count);
    }

    function calNumber() {
        //calItemNum();
        calFeedCount();
        calFeedTimes();
        $("input[id$='_FEED_NUM']").keyup(function (event) {
            cursorMovement(this, event);
            onlyNumber(this);
        });
        $("input[id$='_RAW_LOTNUMBER']").keyup(function () {
            currawMovement(this, event);
        });
    }

    /* $("input").bind("input keypress", function (event) {
        calNumber();

    });*/
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

    // 鼠标移入移出事件
    $("input[id$='_FEED_NUM']").hover(function () {
        //做实际投入的计算
        $("input").bind("input keypress", function (event) {
            calNumber();
        });
    });

    $("#paraMap1_RECEIVE_COUNT").mouseleave(function () {
        var isFocus = $("#paraMap1_RECEIVE_COUNT").is(":focus");
        if (true == isFocus) {
            var projectId = $("#paraMap1_PROJECT_ID").val();
            var receive_number = Number($("#paraMap1_RECEIVE_COUNT").val());
            var idStr = "paraMap1_T3#FEED_COUNT";
            var total_number = Number($("#" + idStr).val());

            if (isEmpty(receive_number)) {
                _alertValMsg(this, "<dict:lang value="该项不能为空" />");
                return;
            }

            if (!isNumber(total_number)) {
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "260", "");
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
                        utilsFp.confirmIcon(3, "", "", "", "该工单未维护阀值", 0, "260", "");
                        return;
                    } else {
                        Threshold = Number(Threshold) / 100;
                    }

                    if (total_number == receive_number) {
                        return;
                    }
                    if (total_number * (1 + Threshold) < receive_number) {
                        utilsFp.confirmIcon(3, "", "", "", "产出数量超出阈值:" + Threshold * 100 + "%", 0, "260", "");
                        return;
                    }
                    if (total_number * (1 - Threshold) > receive_number) {
                        utilsFp.confirmIcon(3, "", "", "", "产出数量低于阈值:" + Threshold * 100 + "%", 0, "260", "");

                    }
                },
                error: function (msg) {
                    utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                }
            });
        }
    });

    function thresholdCheck(obj) {
        console.log("this is thresholdCheck function: >>> ");
        $("input[id$='_FEED_NUM']").mouseleave(function () {
            var idStr = this.id;
            var isFocus = $("#" + idStr).is(":focus");
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
                    <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料超出阈值" />", 0, "160", "");--%>
                    _alertValMsg(this, "<dict:lang value="物料超出阈值" />");
                    return;
                }
                if (total_number * (1 - threshold_number) > receive_number) {
                    console.log("rownum: 1001: >>>");
                    <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料低于阈值" />", 0, "160", "");--%>
                    _alertValMsg(this, "<dict:lang value="物料低于阈值" />");

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

    /*function cursorMovement(obj, event) {
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
    }*/

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
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料超出阈值" />", 0, "160", "");--%>
            _alertValMsg(obj, "<dict:lang value="物料超出阈值" />");
            return false;
        }
        if (total_number * (1 - threshold_number) > receive_number) {
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料低于阈值" />", 0, "160", "");--%>
            _alertValMsg(obj, "<dict:lang value="物料低于阈值" />");
            return false;
        }
        return true;
    }
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
