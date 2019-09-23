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
                <!--     <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button> -->
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
                <s:set name="_$viewId" value="'3db54305500741bc99b5d5dfe1b1ed90'"/>
                <s:set name="_$formId_1" value="'734fa2159c4344848a3c1b5584c17b2b'"/>
                <s:set name="_$type" value="'edit'"/>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b">
                        <bu:ui colNo="PROJECT_ID" formId="734fa2159c4344848a3c1b5584c17b2b" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

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
            <div style="padding:1px;"></div>

            <div class="mod">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="物料信息"/></h3>
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
                                    <tbody id="tbody_5a4ae0bc729d430dac8d2d784e4687c5">

                                    <tbody id="dataList" style="display: none;">
                                    <c:forEach var="item" items="${dataList}" varStatus="status">
                                        <tr>
                                            <td id="INDEX_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
                                            <td id="ITEM_CODE_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:150px;'>${item.CBD_ITEM_CODE}</td>
                                            <td id="ITEM_MANE_${status.count}" class='datagrid-cell datagrid-cell-2' style="width:150px;">${item.CI_ITEM_NAME}</td>
                                            <td id="ITEM_SPEC_${status.count}" class='datagrid-cell datagrid-cell-3' style="width:150px;">${item.CI_ITEM_SPEC}</td>
                                            <td id="WORK_SPACE_${status.count}" class='datagrid-cell datagrid-cell-2' style="width:150px;">${item.WORK_SPACE}</td>
                                            <td id="WARE_HOUSE_${status.count}" class='datagrid-cell datagrid-cell-3' style="width:150px;">${item.WARE_HOUSE}</td>
                                            <td id="ITEM_NUM_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:150px;">${item.CBD_ITEM_NUM}</td>
                                            <td id="PACK_NUM_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:150px;">0.000</td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function initEditDataLs() {
                    getEditRows("5a4ae0bc729d430dac8d2d784e4687c5", "2", "734fa2159c4344848a3c1b5584c17b2b", "", "0510a29df5354c2c96aa45c07d3a0773", "");
                    $('table').find('tbody tr:eq(0)').click();
                }
            </script>
            <script>

                $(function () {
                    // initFeedInfo1();
                    tableInfo();
                    checkFinashCount();
                    $("#paraMapObj_FINISH_COUNT").keyup(function () {
                        onlyNumber(this);
                    });
                });

                /* function initFeedInfo1(){
                   console.log("初始化>>>>");
                   var projectId = $("#paraMapObj_PROJECT_ID").val();
                   var finishCount = $("#paraMapObj_FINISH_COUNT").val();
                   var productCount = $("#paraMapObj_PRODUCT_COUNT").val()
                  $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:"${path}buss/bussModel_exeFunc.ms?funcMId=6d2ea6c6546141daae5762a863cbedba",
       data:{"projectId":projectId},
       success:function(data){
       var pList = data.ajaxList;
       var l = pList.length;
       var pocunt = parseFloat(finishCount)/parseFloat(productCount);
  ;
                $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").empty();

                for (var i = 0; i < pList.length; i++) {
                    var j = i;
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
                    }

                    //$("#" + pre + "CBD_POINT").val(pList[i].CBD_POINT);
                    //$("#" + pre + "CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                    //$("#" + pre + "CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
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
    }*/
                function tableInfo() {

                    var packnumArr = [];
                    var itemcodeArr = [];
                    var itemnumArr = [];
                    var itemspecArr = [];
                    var itemnameArr = [];
                    var workspaceArr = [];
                    var warehouseArr = [];


                    $("td[id^='WORK_SPACE_']").each(function () {
                        var cur = $(this).text();
                        if (cur != null) {
                            workspaceArr.push(cur);
                        } else {
                            workspaceArr.push("");
                        }
                    });
                    $("td[id^='WARE_HOUSE_']").each(function () {
                        var cur = $(this).text();
                        if (cur != null) {
                            warehouseArr.push(cur);
                        } else {
                            warehouseArr.push("");
                        }
                    });
                    $("td[id^='PACK_NUM_']").each(function () {
                        var cur = $(this).text();
                        if (cur != null) {
                            packnumArr.push(cur);
                        } else {
                            packnumArr.push("");
                        }
                    });

                    $("td[id^='ITEM_CODE_']").each(function () {
                        var cur = $(this).text();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemcodeArr.push(cur);
                        } else {
                            itemcodeArr.push("");
                        }
                    });
                    $("td[id^='ITEM_NUM_']").each(function () {
                        var cur = $(this).text();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemnumArr.push(cur);
                        } else {
                            itemnumArr.push("");
                        }
                    });
                    $("td[id^='ITEM_SPEC_']").each(function () {
                        var cur = $(this).text();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemspecArr.push(cur);
                        } else {
                            itemspecArr.push("");
                        }
                    });
                    $("td[id^='ITEM_MANE_']").each(function () {
                        var cur = $(this).text();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemnameArr.push(cur);
                        } else {
                            itemnameArr.push("");
                        }
                    });

                    $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5").empty();

                    for (var i = 0; i < itemcodeArr.length; i++) {
                        _addRowExtend('5a4ae0bc729d430dac8d2d784e4687c5', '2', '', '', '');
                        $("#paraMap" + (i + 1) + "_ITEM_CODE").val(itemcodeArr[i]);
                        $("#paraMap" + (i + 1) + "_ITEM_CODE_SHOW").val(itemcodeArr[i]);
                        $("#paraMap" + (i + 1) + "_ITEM_MANE").val(itemnameArr[i]);
                        $("#paraMap" + (i + 1) + "_ITEM_SPEC").val(itemspecArr[i]);
                        $("#paraMap" + (i + 1) + "_WORK_SPACE").val(workspaceArr[i]);
                        $("#paraMap" + (i + 1) + "_WARE_HOUSE").val(warehouseArr[i]);
                        var feednum = itemnumArr[i];
                        var finishCount = $("#paraMapObj_FINISH_COUNT").val();
                        var productCount = $("#paraMapObj_PRODUCT_COUNT").val();
                        var pocunt = parseFloat(finishCount) / parseFloat(productCount);
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
                }

                //数据键盘监听
                /*   $("input").bind("input keypress", function (event) {
                             calNumber();
                           });*/
                $("input[name='paraMapObj.FINISH_COUNT']").bind("change", function (event) {
                    calNumber();
                });

                function calNumber() {

                    var finishCount = $("#paraMapObj_FINISH_COUNT").val();
                    var productCount = $("#paraMapObj_PRODUCT_COUNT").val();
                    var l = $("#tbody_5a4ae0bc729d430dac8d2d784e4687c5 tr").length;
                    var pocunt = parseFloat(finishCount) / parseFloat(productCount);
                    console.log("p>>" + pocunt);
                    for (var i = 0; i < l; i++) {
                        var feednum = $("#paraMap" + (i + 1) + "_ITEM_NUM").val();

                        if (finishCount == null || finishCount == "") {
                            $("#paraMap" + (i + 1) + "_PACK_NUM").val("0");
                        } else {
                            var packnum1 = pocunt * parseFloat(feednum);
                            console.log("packnum1>>" + packnum1);
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
                    }

                }

                //包装保存
                function packsave1() {

                    var projectId = $("#paraMapObj_PROJECT_ID").val();
                    var finishCount = $("#paraMapObj_FINISH_COUNT").val();
                    var packnumArr = [];
                    var itemcodeArr = [];
                    var itemnumArr = [];
                    var itemspecArr = [];
                    var itemnameArr = [];
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
                        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="仓库值不能为空" />", "", "260", "145");
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
                        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="工厂值不能为空" />", "", "260", "145");
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
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemcodeArr.push(cur);
                        } else {
                            itemcodeArr.push("");
                        }
                    });
                    $("input[id$='_ITEM_NUM']").each(function () {
                        var cur = $(this).val();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemnumArr.push(cur);
                        } else {
                            itemnumArr.push("");
                        }
                    });
                    $("input[id$='_ITEM_SPEC']").each(function () {
                        var cur = $(this).val();
                        console.log("cur>>>>" + cur);
                        if (cur != null) {
                            itemspecArr.push(cur);
                        } else {
                            itemspecArr.push("");
                        }
                    });
                    $("input[id$='_ITEM_MANE']").each(function () {
                        var cur = $(this).val();
                        console.log("cur>>>>" + cur);
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
                        dataType: "json",
                        url: "${path}buss/bussModel_exeFunc.ms?funcMId=36c41bb8ce3946158d219f9b20c9ca8c",
                        data: "&projectId=" + projectId + "&finishCount=" + finishCount + "&packnumArr=" + packnumArr + "&itemcodeArr=" + itemcodeArr + "&itemspecArr=" + itemspecArr + "&itemnumArr=" + itemnumArr + "&itemnameArr=" + itemnameArr + "&workspaceArr=" + workspaceArr + "&warehouseArr=" + warehouseArr,
                        success: function (data) {
                            var flag = false;
                            if (data.ajaxString == "ok") {
                                //utilsFp.confirmIcon(2,"","","", "保存成功",0,"300","");
                                // $('#isCloseWin').attr('checked',true);
                                //top.document.getElementById('iframe1').contentWindow.reloadPgAx('?包装提交成功','摩尔提示','200','150','3000','0');
                                utilsFp.confirmIcon(2, "", "closew", "", "保存成功", 0, "300", "");
                                flag = true;
                            }
                            if (data.ajaxString == "ng1") {
                                utilsFp.confirmIcon(3, "", "", "", "包装单不存在", 0, "300", "");

                            }
                            if (data.ajaxString == "ng2") {
                                utilsFp.confirmIcon(3, "", "", "", "该包装单已包装", 0, "300", "");

                            }
                            if (data.ajaxString == "ng3") {
                                utilsFp.confirmIcon(3, "", "", "", "包装保存失败", 0, "300", "");
                            }
                        },
                        error: function (msg) {
                            utilsFp.confirmIcon(3, "", "", "", "error:" + "保存失败", 0, "300", "");
                        }
                    });
                }

                function closew() {
                    // query(this)
                    console.log("this is closew function : >>> ");
                    console.log(this);
                    query(this);
                }

                function query(thisObj){
                    // var _pageCurrentPageObj.value="1";
                    document.forms.editForm.submit();
                    thisObj.onclick = function(){util.alert(util.submit_default_info);};
                    util.showTopLoading();
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
    function checkFinashCount() {
        $("#paraMapObj_FINISH_COUNT").mouseleave(function () {
            var isFocus = $("#paraMapObj_FINISH_COUNT").is(":focus");
            if (true == isFocus) {

                var projectId = $("#paraMapObj_PROJECT_ID").val();
                var finishCount = Number($("#paraMapObj_FINISH_COUNT").val());
                var total_number = Number($("#paraMapObj_PRODUCT_COUNT").val());

                if (isEmpty(finishCount)) {
                    _alertValMsg(this, "<dict:lang value="该项不能为空" />");
                    return;
                }

                if (total_number == 0 || !isNumber(total_number)) {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");
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
                            utilsFp.confirmIcon(3, "", "", "", "产出数量超出阈值:" + Threshold * 100 + "%", 0, "160", "");
                            return;
                        }
                        if (total_number * (1 - Threshold) > finishCount) {
                            utilsFp.confirmIcon(3, "", "", "", "产出数量低于阈值:" + Threshold * 100 + "%", 0, "160", "");

                        }
                    },
                    error: function (msg) {
                        utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
                    }
                });
                calNumber();
            }

        });
    }

    //产出数量校验
    function packsave() {
        var projectId = $("#paraMapObj_PROJECT_ID").val();
        var finishCount = Number($("#paraMapObj_FINISH_COUNT").val());
        var idStr = "paraMapObj_T5#PRODUCT_COUNT";
        var projectCount = Number($("#paraMapObj_PRODUCT_COUNT").val());

        if (isEmpty(finishCount)) {
            _alertValMsg(this, "<dict:lang value="该项不能为空" />");
            return;
        }

        if (!isNumber(projectCount)) {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="计划数量不正确，请核实" />", 0, "160", "");
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


<script>
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
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>
