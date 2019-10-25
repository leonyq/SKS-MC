<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title><dict:lang value="新增包装"/>
    </title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- head里面 -->
</head>
<body>
<div class="edit">
    <form id="editForm" name="editForm" action="${path}buss/bussModel.ms?" method="post"
            <bu:formet exeid="%{exeid}"/> target="submitFrame">
        <!--  <div class="hd">
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
            </div> -->
        <div class="hd">
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

            <div style="margin-left:10px;">
                <div class="save-close" onclick="switchInput(this)"></div>
                <input type="checkbox" checked id="inputType" name="inputType" value="0" style="display: none;"/>
            </div>

            <div class="optn">
                <button type="button" onclick="packsave();"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
            </div>

        </div>
        <div class="bd">
            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_11"/>
                <jsp:param name="location" value="editForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="734fa2159c4344848a3c1b5584c17b2b" type="edit"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="734fa2159c4344848a3c1b5584c17b2b"/>
                <input type="hidden" id="prefixInd" name="734fa2159c4344848a3c1b5584c17b2b" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'ca452037688e4eb29fa0413619cf90f4'"/>
                <s:set name="_$formId_1" value="'734fa2159c4344848a3c1b5584c17b2b'"/>
                <s:set name="_$type" value="'add'"/>

                <tr>
                    <td class="name-six"/>
                    <span class="dot">*</span>
                    工单号</td>
                    <bu:td cssClass="dec" colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" colspan="">
                        <input type="text" id="PROJECT_ID" name="PROJECT_ID" autocomplete="off" value="" class="input isSubmit " style="width:230px;" save_mark="0" onkeydown="addSplit(event);"> </bu:td>
                    <td class="name-six"/>
                    <bu:uitn colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="LOT_NUMBER" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="PRODUCT_MATERIAL" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="PRODUCT_NAME" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>

                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="PRODUCT_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="FINISH_COUNT" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
            </table>
            <bu:jsVal formId="734fa2159c4344848a3c1b5584c17b2b" formIndex="1"/>

            <div id="container">
                <div class="mod">
                    <div class="mod-hd">
                        <h3 class="tit"><dict:lang value="包装物料单"/></h3>
                        <div class="extend-btn" style="float: right;margin-top:15px;">
                            <button type="button" onclick="_addRowExtend('5a4ae0bc729d430dac8d2d784e4687c5','2','','','');" style="padding:0;" title="<dict:lang value="添加" />">
                                <i class="ico ico-kl-new-add ico-small"></i>
                            </button>
                            <button type="button" onclick="_delRowExtend('5a4ae0bc729d430dac8d2d784e4687c5','');" style="padding:0" title="<dict:lang value="移除" /> ">
                                <i class="ico ico-sc-new-add ico-small"></i>
                            </button>
                        </div>
                    </div>
                    <div class="mod-bd">
                        <div class="panel datagrid datagrid-div1">
                            <div class="datagrid-div2 datagrid-div6 datagrid-view">
                                <div class="datagrid-header">
                                    <div class="datagrid-header-inner" id="datagrid-header-inner5a4ae0bc729d430dac8d2d784e4687c5">
                                        <bu:addSub formid="734fa2159c4344848a3c1b5584c17b2b" formIndex="2" selfformid="5a4ae0bc729d430dac8d2d784e4687c5" hidecol="" viewid=""/>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3" style="height:150px" onscroll="ajaxTableScroll(this,'5a4ae0bc729d430dac8d2d784e4687c5')">
                                    <table class="glxb-table" style="width:100%" id="addTable_5a4ae0bc729d430dac8d2d784e4687c5">
                                        <tbody id="tbody_5a4ae0bc729d430dac8d2d784e4687c5"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</div>

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
<bu:submit viewId="c24df99aeef2475da3870e356a2f4a52"/> <bu:script viewId="c24df99aeef2475da3870e356a2f4a52"/>

<script type="text/javascript">

    var manual = true;

    var error = false;

    var stop = false;

    $("#paraMap1_FINISH_COUNT").keyup(function () {
        onlyNumber(this);
    });

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

    //添加工单分隔符
    function addSplit(e) {
        var e = e || window.event;
        if (e && e.keyCode == 13) {
            var projectId = $("#PROJECT_ID").val();
            console.log("projectId>>>" + projectId);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=d62915a270334b6e9606d1ec392de713",
                data: {"projectId": projectId},
                success: function (data) {
                    console.log("data: >>> ");
                    console.log(data);

                    var reg = data.ajaxString;
                    var resMap = data.ajaxMap;
                    var res = resMap.res;
                    var msg = resMap.msg;

                    if("N" == res){
                        utilsFp.confirmIcon(3, "", "", "", msg, 0, "300", "");
                    }

                    if ("ng" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单输入错误,请重新输入", 0, "300", "");
                    } else if ("ng1" == reg) {
                        doFocus();
                        utilsFp.confirmIcon(3, "", "", "", "工单已包装,请重新输入", 0, "300", "");
                    }else {
                        doBlur();
                        //工单初始化
                        var pmap = data.ajaxMap;
                        $("#PROJECT_ID").val(pmap.PROJECT_ID);
                        $("#paraMap1_LOT_NUMBER_SHOW").val(pmap.LOT_NUMBER);
                        $("#paraMap1_PRODUCT_MATERIAL_SHOW").val(pmap.PRODUCT_MATERIAL);
                        $("#paraMap1_PRODUCT_NAME").val(pmap.PRODUCT_NAME);
                        $("#paraMap1_PRODUCT_COUNT").val(pmap.PRODUCT_COUNT);
                        $("#paraMap1_FINISH_COUNT").val(pmap.FINISH_COUNT);

                        //BOM初始化
                        var pList = data.ajaxList;
                        var l = pList.length;
                        var finishCount = $("#paraMap1_FINISH_COUNT").val();
                        var productCount = $("#paraMap1_PRODUCT_COUNT").val();
                        var pocunt = parseFloat(finishCount) / parseFloat(productCount);

                        var len1 = $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5 tr").length;
                        var len = 0;
                        if (len1 != 0) {
                            var tid = $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").find('tr').last().attr('id');
                            var ltid = tid.substr("10", tid.indexOf("_") - 10);
                            len = Number(ltid);
                        }


                        $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").empty();

                        for (var i = 0; i < pList.length; i++) {
                            _addRowExtend('5a4ae0bc729d430dac8d2d784e4687c5', '2', '', '', '');

                            if (len1 != 0) {
                                $("#paraMap" + (len + i + 1) + "_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                                $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").find("tr").find("td").eq(1).css("width", "103.5px");
                                $("#paraMap" + (len + i + 1) + "_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                                $("#paraMap" + (len + i + 1) + "_ITEM_MANE").val(pList[i].CI_ITEM_NAME);
                                $("#paraMap" + (len + i + 1) + "_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                                $("#paraMap" + (len + i + 1) + "_WARE_HOUSE").val(pList[i].WARE_HOUSE);
                                $("#paraMap" + (len + i + 1) + "_WORK_SPACE").val(pList[i].WORK_SPACE);
                                var feednum = pList[i].CBD_ITEM_NUM;
                                if (feednum == null || feednum == "") {
                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").val("0");
                                    feednum = 0;
                                } else {
                                    $("#paraMap" + (len + i + 1) + "_ITEM_NUM").val(feednum);
                                }
                                var packnum1 = pocunt * parseFloat(feednum);

                                if (packnum1 == null || packnum1 == "" || packnum1 == "NAN") {
                                    $("#paraMap" + (len + i + 1) + "_PACK_NUM").val("0");
                                } else {
                                    try {
                                        countLen = packnum1.toString().split('.')[1].length;
                                        if (countLen == 1) {
                                            packnum = packnum1.toString() + "00";
                                        } else if (countLen == 2) {
                                            packnum = packnum1.toString() + "0";
                                        } else if (countLen == 3) {
                                            packnum = packnum1.toString();
                                        } else if (countLen > 3) {
                                            packnum = packnum1.toString().substring(0, packnum1.toString().indexOf(".") + 4);
                                        }
                                    } catch (e) {
                                        packnum = packnum1.toString() + ".000";
                                    }
                                    $("#paraMap" + (len + i + 1) + "_PACK_NUM").val(packnum);
                                }
                            } else {
                                $("#paraMap" + (i + 1) + "_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                                $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").find("tr").find("td").eq(1).css("width", "103.5px");
                                $("#paraMap" + (i + 1) + "_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                                $("#paraMap" + (i + 1) + "_ITEM_MANE").val(pList[i].CI_ITEM_NAME);
                                $("#paraMap" + (i + 1) + "_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                                $("#paraMap" + (i + 1) + "_WARE_HOUSE").val(pList[i].WARE_HOUSE);
                                $("#paraMap" + (i + 1) + "_WORK_SPACE").val(pList[i].WORK_SPACE);
                                var feednum = pList[i].CBD_ITEM_NUM;
                                if (feednum == null || feednum == "") {
                                    $("#paraMap" + (i + 1) + "_ITEM_NUM").val("0");
                                    feednum = 0;
                                } else {
                                    $("#paraMap" + (i + 1) + "_ITEM_NUM").val(feednum);
                                }
                                var packnum1 = pocunt * parseFloat(feednum);

                                if (packnum1 == null || packnum1 == "" || packnum1 == "NAN") {
                                    $("#paraMap" + (i + 1) + "_PACK_NUM").val("0");
                                } else {
                                    try {
                                        countLen = packnum1.toString().split('.')[1].length;
                                        if (countLen == 1) {
                                            packnum = packnum1.toString() + "00";
                                        } else if (countLen == 2) {
                                            packnum = packnum1.toString() + "0";
                                        } else if (countLen == 3) {
                                            packnum = packnum1.toString();
                                        } else if (countLen > 3) {
                                            packnum = packnum1.toString().substring(0, packnum1.toString().indexOf(".") + 4);
                                        }
                                    } catch (e) {
                                        packnum = packnum1.toString() + ".000";
                                    }
                                    $("#paraMap" + (i + 1) + "_PACK_NUM").val(packnum);
                                }
                            }

                            /*var j = i;
                            var pre = "paraMapObj_" + j + "_";
                            var preName = "paraMap1@" + j + "#";
                            var tempHtml = "<tr id='addTableTr_" + j + "_5a4ae0bc729d430dac8d2d784e4687c5' onclick=\"_selectExtend(event,this,'')\">"
                                + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkbox5a4ae0bc729d430dac8d2d784e4687c5' id='checkbox5a4ae0bc729d430dac8d2d784e4687c5'></td>"
                                + "<td style='position:relative;display:none' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_SEQUENCE' name='" + preName + "CBD_SEQUENCE' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                                + "<td style='position:relative; ' class='dec' width='128px'><input save_mark='0' type='hidden' id='" + pre + "CBD_ITEM_CODE' name='" + preName + "CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
                                + "<input save_mark='0' editname='" + preName + "CBD_ITEM_CODE' textval='" + preName + "CBD_ITEM_CODESHOW' type='text' id='" + pre + "CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ' onfocus='this.blur()' readonly='readonly'>"
                                + "</td>"
                                + "<td style='position:relative;' class='dec' width='128px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_MANE' name='" + preName + "CBD_ITEM_MANE' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                + "<td style='position:relative;' class='dec' width='128px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_SPEC' name='" + preName + "CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                + "<td style='position:relative;' class='dec' width='128px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_NUM' name='" + preName + "CBD_ITEM_NUM' value='' class='_VAL_NULL input isSubmit'  readonly='readonly' ></td>"
                                + "<td style='position:relative;display:none' class='dec' width='130px'><input save_mark='0' type='text' id='" + pre + "CBD_POINT' name='" + preName + "CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
                                + "<td style='position:relative;' class='dec' width='128.8px'><input save_mark='0' type='text' id='" + pre + "PACK_NUM' name='" + preName + "PACK_NUM' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                                + "<td style='position:relative;display:none' class='dec'><select save_mark='0' id='" + pre + "CBD_ITEM_TYPE' name='" + preName + "CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                                + "<option value='1'>PCB</option></select>"
                                + "</tr>";
                            $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").append(tempHtml);
                            //$("#" + pre + "CBD_SEQUENCE").val(pList[i].CBD_SEQUENCE);
                            $("#" + pre + "CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                            $("#" + pre + "CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                            $("#" + pre + "CBD_ITEM_MANE").val(pList[i].CI_ITEM_NAME);
                            $("#" + pre + "CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);

                            var feednum = pList[i].CBD_ITEM_NUM;
                            if(feednum==null || feednum ==""){
                              $("#" + pre + "CBD_ITEM_NUM").val("0");
                              feednum=0;
                            }else{
                              $("#" + pre + "CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                            }
                            var packnum1 =  pocunt*parseFloat(feednum);

                            if(packnum1 == null || packnum1 =="" ||packnum1 == "NAN"){
                              $("#" + pre + "PACK_NUM").val("0");
                            }else{
                              try{
                                countLen = packnum1.toString().split('.')[1].length;
                                if(countLen ==1){
                                    packnum = packnum1.toString()+"00";
                                }else if(countLen ==2){
                                    packnum = packnum1.toString()+"0";
                                }else if(countLen ==3){
                                    packnum = packnum1.toString();
                                }else if(countLen > 3){
                                    packnum = packnum1.toString().substring(0,packnum1.toString().indexOf(".")+4);
                                }
                              }catch (e) {
                                packnum = packnum1.toString()+".000";
                              }
                              $("#" + pre + "PACK_NUM").val(packnum);
                            }*/


                        }
                    }

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
        $("#PROJECT_ID").focus();
        $("#PROJECT_ID").val("");
        stop = false;
    }

    function doBlur() {
        stop = true;
        $("#PROJECT_ID").blur();
    }


    function init() {

        if ($("#leftTable-kz").length > 0) {
            $("#leftTable-kz").show();
        }

        if ($("#leftTable").length > 0) {
            $("#leftTable").show();
        }

        $("#PROJECT_ID").focus();

        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
    }//初始化方法

</script>
<script>
    //数据键盘监听
    /*  $("input").bind("input keypress", function (event) {
                calNumber();
              });
     $("input[name='paraMap1@0#FINISH_COUNT']").bind("change", function (event) {
                calNumber();
              });
     */
    function calNumber() {

        var finishCount = $("#paraMap1_FINISH_COUNT").val();
        var productCount = $("#paraMap1_PRODUCT_COUNT").val();
        var l = $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5 tr").length;
        var pocunt = parseFloat(finishCount) / parseFloat(productCount);


        var len = 0;
        if (l != 0) {
            var tid = $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").find('tr').last().attr('id');
            var ltid = tid.substr("10", tid.indexOf("_") - 10);
            len = Number(ltid);
        }

        console.log("p>>" + pocunt);
        console.log("len>>" + len);
        for (var i = 0; i < l; i++) {
            if (len == l) {
                var feednum = $("#paraMap" + (i + 1) + "_ITEM_NUM").val();
                if (finishCount == null || finishCount == "") {
                    $("#paraMap" + (i + 1) + "_PACK_NUM").val("0");
                } else {
                    var packnum1 = pocunt * parseFloat(feednum);
                    if (isNaN(packnum1)) {
                        $("#paraMap" + (i + 1) + "_PACK_NUM").val("0");
                    } else {
                        try {
                            countLen = packnum1.toString().split('.')[1].length;
                            if (countLen == 1) {
                                packnum = packnum1.toString() + "00";
                            } else if (countLen == 2) {
                                packnum = packnum1.toString() + "0";
                            } else if (countLen == 3) {
                                packnum = packnum1.toString();
                            } else if (countLen > 3) {
                                packnum = packnum1.toString().substring(0, packnum1.toString().indexOf(".") + 4);
                            }
                        } catch (e) {
                            packnum = packnum1.toString() + ".000";
                        }
                        $("#paraMap" + (i + 1) + "_PACK_NUM").val(packnum);
                    }


                }
            } else {
                var feednum = $("#paraMap" + (len - i) + "_ITEM_NUM").val();
                if (finishCount == null || finishCount == "") {
                    $("#paraMap" + (len - i) + "_PACK_NUM").val("0");
                } else {
                    var packnum1 = pocunt * parseFloat(feednum);
                    if (isNaN(packnum1)) {
                        $("#paraMap" + (len - i) + "_PACK_NUM").val("0");
                    } else {
                        try {
                            countLen = packnum1.toString().split('.')[1].length;
                            if (countLen == 1) {
                                packnum = packnum1.toString() + "00";
                            } else if (countLen == 2) {
                                packnum = packnum1.toString() + "0";
                            } else if (countLen == 3) {
                                packnum = packnum1.toString();
                            } else if (countLen > 3) {
                                packnum = packnum1.toString().substring(0, packnum1.toString().indexOf(".") + 4);
                            }
                        } catch (e) {
                            packnum = packnum1.toString() + ".000";
                        }
                        $("#paraMap" + (len - i) + "_PACK_NUM").val(packnum);
                    }


                }
            }

        }

    }

    //包装保存
    function packsave1() {
        var projectId = $("#PROJECT_ID").val();
        var finishCount = $("#paraMap1_FINISH_COUNT").val();
        var packnumArr = [];
        var itemcodeArr = [];
        var itemnumArr = [];
        var itemspecArr = [];
        var itemnameArr = [];
        if (isEmpty(finishCount)) {
            _alertValMsg(this,"<dict:lang value="该项不能为空" />");
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="产出数量不能为空，请核实" />", 0, "160", "");--%>
            return;
        }
        var workspaceArr = [];
        var warehouseArr = [];

        var fag = false;

        $("input[id$='_WARE_HOUSE']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                warehouseArr.push(cur);

            } else {
                fag = true;

            }
        });
        if (fag) {
            _alertValMsg(this,"<dict:lang value="仓库值不能为空" />");
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="仓库值不能为空" />", "", "260", "145");--%>
            return;
        }

        $("input[id$='_WORK_SPACE']").each(function () {
            var cur = $(this).val();
            if (cur != "") {
                workspaceArr.push(cur);

            } else {
                fag = true;

            }
        });
        if (fag) {
            _alertValMsg(this,"<dict:lang value="工厂值不能为空" />");
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");--%>
            return;
        }


        $("input[id$='_PACK_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                packnumArr.push(cur);
            } else {
                packnumArr.push("");
            }
        });

        $("input[id$='_ITEM_CODE_SHOW']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemcodeArr.push(cur);
            } else {
                itemcodeArr.push("");
            }
        });
        $("input[id$='_ITEM_NUM']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemnumArr.push(cur);
            } else {
                itemnumArr.push("");
            }
        });
        $("input[id$='_ITEM_SPEC']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemspecArr.push(cur);
            } else {
                itemspecArr.push("");
            }
        });
        $("input[id$='_ITEM_MANE']").each(function () {
            var cur = $(this).val();
            if (cur != null) {
                itemnameArr.push(cur);
            } else {
                itemnameArr.push("");
            }
        });

        packnumArr.join(",");
        itemcodeArr.join(",");
        itemnumArr.join(",");
        itemspecArr.join(",");
        itemnameArr.join(",");
        workspaceArr.join(",");
        warehouseArr.join(",");

        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=664a393743bc45318bbb28783d53764c",
            data: "&projectId=" + projectId + "&finishCount=" + finishCount + "&packnumArr=" + packnumArr + "&itemcodeArr=" + itemcodeArr + "&itemspecArr=" + itemspecArr + "&itemnumArr=" + itemnumArr + "&itemnameArr=" + itemnameArr + "&workspaceArr=" + workspaceArr + "&warehouseArr=" + warehouseArr,
            success: function (data) {
                console.log("data: >>> ");
                console.log(data);
                var flag = false;
                if (data.ajaxString == "ok") {
                    //utilsFp.confirmIcon(2,"","","", "保存成功",0,"300","");
                    // $('#isCloseWin').attr('checked',true);
                    //top.document.getElementById('iframe2').contentWindow.reloadPgAx('包装提交成功', '摩尔提示', '200', '150', '3000', '0');
                    utilsFp.confirmIcon(2,"","closew","", "保存成功",0,"300","");
                    flag = true;
                }
            },
            error: function (msg) {
                console.log(msg);
                utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");

            }
        });
    }

    function query(thisObj) {

        var _pageCurrentPageObj = "1";
        //document.forms.editForm.submit();
        parentWindow.query(thisObj);
        top.$(".dialog-close").click();

        /*
        thisObj.onclick = function(){
          util.alert(util.submit_default_info);
        };
        util.showTopLoading();
        */
    }

    //关闭窗口
    function closew() {

        query(this);

    }


    function isEmpty(obj) {
        if (typeof obj == "undefined" || obj == null || obj == "") {
            return true;
        } else {
            return false;
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

    $("#paraMap1_FINISH_COUNT").keyup(function () {
        onlyNumber(this);
    });

    $("#paraMap1_FINISH_COUNT").mouseleave(function () {
        var isFocus = $("#paraMap1_FINISH_COUNT").is(":focus");
        if (true == isFocus) {

            var projectId = $("#PROJECT_ID").val();
            var finishCount = Number($("#paraMap1_FINISH_COUNT").val());
            var total_number = Number($("#paraMap1_PRODUCT_COUNT").val());

            if (isEmpty(finishCount)) {
                _alertValMsg(this, "<dict:lang value="该项不能为空" />");
                return;
            }

            if (total_number == 0 || !isNumber(total_number)) {
                _alertValMsg(this, "<dict:lang value="计划数量不正确，请核实" />");
                <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");--%>
                return;
            }

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=a381493664ad4dbd845f2051af2313af",
                data: {
                    "TYPE": "2",
                    "ItEM_CODE": "",
                    "PROJECT_ID": projectId
                },
                success: function (data) {
                    //阈值
                    var Threshold = data.ajaxString;
                    if (!isNumber(Threshold)) {
                        utilsFp.confirmIcon(3, "", "", "", "该工单未维护阀值", 0, "160", "");
                        return;
                    } else {
                        Threshold = Number(Threshold) / 100;
                    }

                    if (total_number == finishCount) {
                        return;
                    }

                    if (total_number * (1 + Threshold) < finishCount) {
                        // utilsFp.confirmIcon(3, "", "", "", "产出数量超出阈值:" + Threshold * 100 + "%", 0, "160", "");
                        _alertValMsg($("#paraMap1_FINISH_COUNT"), "<dict:lang value="产出数量超出阈值" />");
                        return;
                    }
                    if (total_number * (1 - Threshold) > finishCount) {
                        // utilsFp.confirmIcon(3, "", "", "", "产出数量低于阈值:" + Threshold * 100 + "%", 0, "160", "");
                        _alertValMsg($("#paraMap1_FINISH_COUNT"), "<dict:lang value="产出数量低于阈值" />");
                    }
                },
                error: function (msg) {
                    utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                }
            });
            calNumber();
        }

    });

    //产出数量校验
    function packsave() {
        var projectId = $("#PROJECT_ID").val();
        var finishCount = Number($("#paraMap1_FINISH_COUNT").val());
        var idStr = "paraMap1_T5#PRODUCT_COUNT";
        var projectCount = Number($("#paraMap1_PRODUCT_COUNT").val());

        if (isEmpty(finishCount)) {
            _alertValMsg($("#paraMap1_FINISH_COUNT"), "<dict:lang value="该项不能为空" />");
            return;
        }

        if (!isNumber(projectCount)) {
            _alertValMsg(this, "<dict:lang value="计划数量不正确，请核实" />");
            <%--utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");--%>
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=a381493664ad4dbd845f2051af2313af",
            data: {
                "TYPE": "2",
                "ItEM_CODE": "",
                "PROJECT_ID": projectId
            },
            success: function (data) {
                //阈值
                var Threshold = data.ajaxString;
                if (!isNumber(Threshold)) {
                    utilsFp.confirmIcon(1, "", "packsave1", "", "该工单未维护阀值，是否重继续？", "1", "260", "");
                    return;
                } else {
                    Threshold = Number(Threshold) / 100;
                }

                if (projectCount * (1 + Threshold) < finishCount) {
                    utilsFp.confirmIcon(1, "", "packsave1", "", "产出数量超出阈值:" + Threshold * 100 + "%，是否重继续", "1", "260", "");

                } else if (projectCount * (1 - Threshold) > finishCount) {
                    utilsFp.confirmIcon(1, "", "packsave1", "", "产出数量低于阈值:" + Threshold * 100 + "%，是否重继续？", "1", "260", "");

                } else {
                    packsave1();

                }
            },
            error: function (msg) {
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
    }

</script>

<!--<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="needValidate" value="1"/>
</jsp:include>-->

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
