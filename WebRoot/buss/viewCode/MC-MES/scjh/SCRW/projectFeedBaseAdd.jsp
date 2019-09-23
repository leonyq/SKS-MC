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
    <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post"
    <bu:formet exeid="%{exeid}"/> target="submitFrame">
        <div class="hd">

            <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
            <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value="关闭保存并关闭窗口"/> onclick="saveClose(this)"></div>
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                    <span class="dot">*</span>
                    <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if> <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" value="" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else> </s:if>


            </div>
            <div class="optn">
                <button type="button" onclick="saveObj();">
                    <i class="ico ico-save"></i><dict:lang value="保存"/>
                </button>
                <button type="button" onclick="closeWindow();">
                    <i class="ico ico-cancel"></i><dict:lang value="取消"/>
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
                <s:set name="_$viewId" value="'9e78319760684c91880458ffa17c4e76'"/>
                <s:set name="_$formId_1" value="'b36254ac37e74240b1528d44627b6a84'"/>
                <s:set name="_$type" value="'add'"/>
                <td class="name-four"/>

                <%--工单号+生产批次+管理员--%>
                <tr>
                    <td class="name" style="width:89px;"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" value="%{PROJECT_ID}" formIndex="0" style="width:200px;"/>
                    </bu:td>

                    <td class="name" style="width:89px;"/>
                    <%--<span class="dot">*</span>--%><bu:uitn colNo="LOT_NUMBER"
                                                               formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" value="%{LOT_NUMBER}" formIndex="0" style="width:200px"/>
                    </bu:td>

                    <td class="name" style="width:89px;"/>
                    <%--<span class="dot">*</span>--%><bu:uitn colNo="ADMIN_EMP"
                                                               formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" value="%{ADMIN_EMP}" formIndex="0" style="width:200px"/>
                    </bu:td>
                </tr>

                <%--司称+监称+工艺员--%>
                <tr>
                    <td class="name" style="width:89px;"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" value="%{WEIGHT_EMP}" formIndex="0" style="width:200px"/>
                    </bu:td>

                    <td class="name" style="width:89px;"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" value="%{WEIGHT_MONITOR}" formIndex="0" style="width:200px"/>
                    </bu:td>

                    <td class="name" style="width:89px;"/>
                    <%--<span class="dot">*</span>--%><bu:uitn colNo="CRAFTS_EMP"
                                                               formId="b36254ac37e74240b1528d44627b6a84"/></td>
                    <bu:td cssClass="dec" style="width:225px;" colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84">
                        <bu:ui colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" value="%{CRAFTS_EMP}" formIndex="0" style="width:200px"/>
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
                        <LI id="tag2" style="display:block;margin-left:82%;">
                            <div class="extend-btn" style="float: right;margin-top:8px;">
                                <button type="button" onclick="_addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','1');" style="padding:0;" title="<dict:lang value="添加" />">
                                    <i class="ico ico-kl-new-add ico-small"></i>
                                </button>
                                <button type="button" onclick="_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');" style="padding:0" title="<dict:lang value="移除" /> ">
                                    <i class="ico ico-sc-new-add ico-small"></i>
                                </button>
                            </div>

                        </LI>
                    </UL>
                </DIV>
                <DIV class="content1" id="content">
                    <DIV id="content1" data-tab="tag1">
                        <div class="mod">
                            <div class="extend-btn" style="float: right;margin-top:-35px;display: none;">
                                <button type="button" onclick="newaddRow();" style="padding:0;" title="<dict:lang value="添加" />">
                                    <i class="ico ico-kl-new-add ico-small"></i>
                                </button>
                                <button type="button" onclick="_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f');" style="padding:0" title="<dict:lang value="移除" /> ">
                                    <i class="ico ico-sc-new-add ico-small"></i>
                                </button>
                            </div>
                            <div class="mod-bd">
                                <div class="panel datagrid datagrid-div1">
                                    <div class="datagrid-div2 datagrid-div6 datagrid-view">
                                        <div class="datagrid-header">
                                            <div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
                                                <bu:addSub formid="b36254ac37e74240b1528d44627b6a84" formIndex="1" selfformid="92c585de53ff4e9f879b4e4bc0c16e8f" hidecol="" viewid=""/>
                                            </div>
                                        </div>
                                        <div class="datagrid-body datagrid-div3" style="height:235px" onscroll="ajaxTableScroll(this,'92c585de53ff4e9f879b4e4bc0c16e8f')">
                                            <table class="glxb-table " style="width:100%" id="addTable_92c585de53ff4e9f879b4e4bc0c16e8f"><!--fixedTable-->
                                                <tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f">
                                              
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </DIV>
                </DIV>
            </div>
        </div>
</div>
</form></div>

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

</body>
<%@ include file="/plf/common/pub_end.jsp" %>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
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
        // if (tag == "tag1") {
        //     document.getElementById("tag2").style.display = "none";
        // }
        if (tag == "tag1") {
            document.getElementById("tag2").style.display = "";
        }
    }

    function newaddRow() {
        var len = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
        var j = len + 1;
        var pre = "paraMap" + j + "_";
        var preName = "paraMap1@" + j + "#";
        var tempHtml = "<tr id='addTableTr" + j + "_92c585de53ff4e9f879b4e4bc0c16e8f' onclick=\"_selectExtend(event,this,'')\">"
            + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkbox92c585de53ff4e9f879b4e4bc0c16e8f' id='checkbox92c585de53ff4e9f879b4e4bc0c16e8f'></td>"

            + "<td style='position:relative;' class='dec' width='180px'><input type='hidden' id='" + pre + "ITEM_CODE' name='paraMap1@ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
            + "<input editname='" + preName + "ITEM_CODE' textval='" + preName + "ITEM_CODE_SHOW' type='text' id='" + pre + "ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ico-search-input' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
            + "</td>"

            + "<td style='position:relative;' class='dec' width='180px'><input type='text' id='" + pre + "ITEM_NUM' name='paraMap1@ITEM_NUM' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"

            + "<td style='position:relative;' class='dec' width='180px'><input type='text' id='" + pre + "FEED_NUM' name='paraMap1@FEED_NUM' value='' class='_VAL_NULL input isSubmit'></td>"

            + "<td style='position:relative;' class='dec' width='180px'><input type='text' id='" + pre + "PROCESS_ORDER' name='paraMap1@PROCESS_ORDER' value='' class='_VAL_NULL input isSubmit'></td>"
            + "</tr>";
        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").append(tempHtml);
    }

    function saveObj() {
        isQuery = false;
        var itemCode = "";
        var itemNum = "";
        var feedCount = "";
        var processOrder = "";
        var flag = true;
        var i = 1;
        var len = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;

        var itemCodeArr = new Array();
        var itemNumArr = new Array();
        var feedCountArr = new Array();
        var processOrderArr = new Array();

        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").each(function () {
            itemCode = $("#paraMap" + i + "_ITEM_CODE").val();
            itemNum = $("#paraMap" + i + "_ITEM_NUM").val();
            feedCount = $("#paraMap" + i + "_FEED_NUM").val();
            processOrder = $("#paraMap" + i + "_PROCESS_ORDER").val();

            console.log("itemCode: >>> ");
            console.log(itemCode);
            console.log("itemNum: >>> ");
            console.log(itemNum);
            console.log("feedCount: >>> ");
            console.log(feedCount);
            console.log("processOrder: >>> ");
            console.log(processOrder);

            if (itemCode == "" || itemNum == "" || feedCount == "" || processOrder == "") {
                switchTag('tag1', 'content1', '${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');
            }else{
                itemCodeArr.push(itemCode);
                itemNumArr.push(itemNum);
                feedCountArr.push(feedCount);
                processOrderArr.push(processOrder);

            }

            if (!/^[1-9]+$/.test(itemNum)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_ITEM_NUM"), "<dict:lang value="该项只能为正整数" />");
            }

            if (!/^[1-9]+$/.test(feedCount)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_FEED_NUM"), "<dict:lang value="该项只能为正整数" />");
            }

            if (!/^[1-9]+$/.test(processOrder)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_PROCESS_ORDER"), "<dict:lang value="该项只能为正整数" />");
            }

            i++;
        });

        itemCodeArr = itemCodeArr.join(",");
        itemNumArr = itemNumArr.join(",");
        feedCountArr = feedCountArr.join(",");
        processOrderArr = processOrderArr.join(",");


        if (!val.valNullData()) {
            return;
        }
        if (!valData()) {
            return;
        }
        if (!val.valOjbsData()) {
            return;
        }
        if (!val.valDataBaseSetData()) {
            return;
        }

        if ($("#paraMap0_PROJECT_ID").val() == "") {
            _alertValMsg($("#paraMap0_PROJECT_ID_chosen"), "<dict:lang value="该项不能为空" />");
            return;
        }
        if ($("#paraMap1_PROJECT_FLAG_1").val() == "Y") {
            var stratNum = Number($("#paraMap0_PRODUCT_SN_START").val());
            var endNum = Number($("#paraMap0_PRODUCT_SN_END").val());

            if (!isNaN(stratNum) && !isNaN(endNum)) {
                if (stratNum >= endNum) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
                if (endNum - stratNum >= Number($("#paraMap0_PRODUCT_COUNT").val())) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_END"), "<dict:lang value="号段终止不能大于计划数量" />");
                    return;
                }
            } else {
                if ($("#paraMap0_PRODUCT_SN_START").val() >= $("#paraMap0_PRODUCT_SN_END").val()) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
            }
        }

        $("#paraMap1_PROJECT_FLAG_1").attr("disabled", "disabled");
        if (flag == true) {
            $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            $DisInput.attr("disabled", false);
            if ($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0) {
                $("#addForm").append($("#isCloseWin").clone());
                $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
            }
            $("#saveBtn").prop("disabled", "disabled");
            var ckval = $("#PROJECT_OFONESELF").val();
            var flag = $("#paraMap1_PROJECT_FLAG_1").val();
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6db7bc9fe7994715b514af25e7a4a4f6&ckval=" + ckval + "&flag=" + flag+"&itemCodeArr="+itemCodeArr+"&itemNumArr="+itemNumArr+"&feedCountArr="+feedCountArr+"&processOrderArr="+processOrderArr;

            var seval = $("#paraMap0_PRODUCT_LINE").val();
            if (ckval == "Y") {
                if (seval == "") {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择线别" />", 0, "260", "");
                } else {
                    //20180531 工单自动下达校验指示单
                    //checkIndicator();
                    document.forms.addForm.submit();

                }
            } else {
                document.forms.addForm.submit();
            }

            isQuery = true;
            $DisInput.attr("disabled", true);
            parentWindow.query("");
            $("#paraMap1_PROJECT_FLAG_1").removeAttr("disabled");
            
        }
    }
</script>
