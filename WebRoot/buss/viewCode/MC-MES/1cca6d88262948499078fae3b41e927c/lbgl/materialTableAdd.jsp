<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title><dict:lang value="新增"/>
    </title>
    <style>
        #tbody_1abddbae1d704169a987c0af3e06c1df select {
            width: 100%;
        }
    </style>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js"></script>

    <!-- head里面 -->
    <script type="text/javascript">
        var addTableTrMap;
        var loaded = 1;
        var tab_len = 2;

        var currentTag;
        var tabs = "";

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
            if (tag == "tag1") {
                document.getElementById("tag3").style.display = "none";
                document.getElementById("tag4").style.display = "";

            }
            if (tag == "tag2") {
                document.getElementById("tag3").style.display = "";
                document.getElementById("tag4").style.display = "none";
            }

        }
    </script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
</head>
<body>
<div class="edit">
    <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post"
            <bu:formet exeid="%{exeid}"/> target="submitFrame">
        <div class="hd">
            <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
            <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value="关闭保存并关闭窗口"/> onclick="saveClose(this)"></div>
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                    <span class="dot">*</span>
                    <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if> <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else> </s:if>
            </div>
            <div class="optn">
                <button type="button" onclick="saveObj(this);"><i class="ico ico-save"></i><dict:lang value="保存"/>
                </button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
            </div>

        </div>
        <div class="bd" style="height: 510px;">

            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_10"/>
                <jsp:param name="location" value="addForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="167639778c8f4ee08caad77b61e5081c" type="add"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="167639778c8f4ee08caad77b61e5081c"/>
                <input type="hidden" name="167639778c8f4ee08caad77b61e5081c" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/> <input type="hidden" id="len" value=""/>
                <input type="hidden" id="areaSns" name="areaSns" value=""/>
                <s:set name="_$viewId" value="'c54485c1926748f1a9172a3a2126d444'"/>
                <s:set name="_$formId_1" value="'167639778c8f4ee08caad77b61e5081c'"/>
                <s:set name="_$type" value="'add'"/>
                <tr>
                    <td class="name" style="width:82px"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" style="width:225px" colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_SN}" formIndex="1" style="width:200px"/></bu:td>
                    <td class="name" style="width:82px"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" style="width:225px" colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_NAME}" formIndex="1" style="width:200px"/></bu:td>
                    <td class="name" style="width:68px"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" style="width:205px" colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_PROCESS_FACE}" formIndex="1" style="width:200px"/></bu:td>

                </tr>
                <tr>
                    <td class="name"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_CODE}" formIndex="1" style="width:200px"/></bu:td>
                    <td class="name"/>
                    <bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_NAME}" formIndex="1" style="width:200px"/></bu:td>

                    <td class="name"/>
                    <bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_STANDARD}" formIndex="1" style="width:200px"/></bu:td>

                </tr>


                <tr>
                    <td class="name"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MOUNT_SPEED}" formIndex="1" style="width:200px"/></bu:td>
                    <td class="name"/>
                    <bu:uitn colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_ITEM_COUNT}" formIndex="1" style="width:200px"/></bu:td>

                    <td class="name"/>
                    <bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_STAUS}" formIndex="1" style="width:100px"/>

                    </bu:td>
                </tr>
                <tr>
                    <td class="name"/>
                    <span class="dot">*</span>
                    <bu:uitn colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c"/></td>
                    <bu:td cssClass="dec" colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_TRACK" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_TRACK}" formIndex="1" style="width:200px"/>

                    </bu:td>

                </tr>
                <tr>

                    <td class="name"/>
                    <bu:uitn colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" style="width:200px"/></td>
                    <bu:td cssClass="dec" colspan="5" colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c"><bu:ui colNo="CM_MEMO" rows="3" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MEMO}" formIndex="1" style="width:100%"/></bu:td>

                </tr>
            </table>
            <bu:jsVal formId="167639778c8f4ee08caad77b61e5081c" formIndex="1"/>
            <div style="padding:1px;"></div>

            <div class="js-tab">
                <div id="container">
                    <DIV style="margin-bottom: 11px;">
                        <UL class="tab-list tab">

                            <LI id="tag2">
                                <A class="selectli1" onclick="switchTag('tag2','content2','','');this.blur();" href="javascript:void(0);">
                                    <SPAN><dict:lang value="关联线别"/></SPAN>
                                </A>
                            </LI>

                            <LI id="tag1">
                                <A class="" onclick="switchTag('tag1','content1','','');this.blur();" href="javascript:void(0);">
                                    <SPAN class="selectspan1"><dict:lang value="料站表明细"/></SPAN>
                                </A>
                            </LI>
                            <LI id="tag3" style="display:block;margin-left:69%;">
                                <div class="extend-btn" style="float: right;margin-top:8px;">
                                    <button type="button" onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3');" style="padding:0;" title="<dict:lang value="添加" />">
                                        <i class="ico ico-kl-new-add ico-small"></i>
                                    </button>
                                    <button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');" style="padding:0" title="<dict:lang value="移除" /> ">
                                        <i class="ico ico-sc-new-add ico-small"></i>
                                    </button>
                                </div>

                            </LI>
                            <LI id="tag4" style="display:none;margin-left:62%;">
                                <div class="extend-btn" style="float: right;margin-top:8px;">
                                    <button type="button" onclick="showAddPopWin('1abddbae1d704169a987c0af3e06c1df','57dfee4dbc9f40b3bf376573e86795b4');" style="padding:0;" title="<dict:lang value="添加" />">
                                        <i class="ico ico-kl-new-add ico-small"></i>
                                    </button>
                                    <button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');" style="padding:0" title="<dict:lang value="移除" /> ">
                                        <i class="ico ico-sc-new-add ico-small"></i>
                                    </button>
                                    <button type="button" onclick="programImport('1abddbae1d704169a987c0af3e06c1df','c786895d0e51458c8cd30d91eb4c863a');" style="padding:0" title="<dict:lang value="程式导入" /> ">
                                        <i class="ico ico-program ico-small "></i>
                                    </button>
                                    <button type="button" onclick="excelImport('1abddbae1d704169a987c0af3e06c1df','07e5aa1695024ab4816b4538020d83a7','2');" style="padding:0" title="<dict:lang value="标准Excel导入" /> ">
                                        <i class="ico ico-excel ico-small "></i>
                                    </button>
                                </div>

                            </LI>


                        </UL>
                    </DIV>
                    <DIV class="content1" id="content">
                        <DIV id="content1" data-tab="tag1" style="display:none">
                            <div class="mod">
                                <!--<div class="mod-hd">
				
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="showAddPopWin('1abddbae1d704169a987c0af3e06c1df','57dfee4dbc9f40b3bf376573e86795b4');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
						<!--<button type="button" onclick="excelImport('1abddbae1d704169a987c0af3e06c1df','07e5aa1695024ab4816b4538020d83a7','1');"     style="padding:0"   title="<dict:lang value="航天信息Excel导入" /> " >   <i class="ico ico-excel ico-small "></i> 
						</button> -->
                                <!--	<button type="button" onclick="programImport('1abddbae1d704169a987c0af3e06c1df','c786895d0e51458c8cd30d91eb4c863a');"     style="padding:0"   title="<dict:lang value="程式导入" /> " >   <i class="ico ico-program ico-small "></i>
						</button>
						<button type="button" onclick="excelImport('1abddbae1d704169a987c0af3e06c1df','07e5aa1695024ab4816b4538020d83a7','2');"     style="padding:0"   title="<dict:lang value="标准Excel导入" /> " >   <i class="ico ico-excel ico-small "></i> 
						</button> 
					</div>
			</div>-->
                                <div class="mod-bd">
                                    <div class="panel datagrid datagrid-div1">
                                        <div class="datagrid-div2 datagrid-div6 datagrid-view">
                                            <div class="datagrid-header">
                                                <div class="datagrid-header-inner" id="datagrid-header-inner1abddbae1d704169a987c0af3e06c1df">
                                                    <bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="2" selfformid="1abddbae1d704169a987c0af3e06c1df" hidecol="" viewid=""/>
                                                </div>
                                            </div>
                                            <div class="datagrid-body datagrid-div3" style="height:200px" onscroll="ajaxTableScroll(this,'1abddbae1d704169a987c0af3e06c1df')">
                                                <table class="glxb-table fixedTable" style="width:100%;min-width:1750px;" id="addTable_1abddbae1d704169a987c0af3e06c1df">
                                                    <tbody id="tbody_1abddbae1d704169a987c0af3e06c1df"></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </DIV>
                        <DIV id="content2" data-tab="tag2">
                            <div class="mod">
                                <!--	<div class="mod-hd">
					<div class="extend-btn" style="float: right;margin-top:8px;">
						<button type="button"    onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>-->
                                <div class="mod-bd">
                                    <div class="panel datagrid datagrid-div1">
                                        <div class="datagrid-div2 datagrid-div6 datagrid-view">
                                            <div class="datagrid-header">
                                                <div class="datagrid-header-inner" id="datagrid-header-inner99b52ba36c464464aef5216e173ca678">
                                                    <bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="3" selfformid="99b52ba36c464464aef5216e173ca678" hidecol="" viewid=""/>
                                                </div>
                                            </div>
                                            <div class="datagrid-body datagrid-div3" style="height:180px">
                                                <table class="glxb-table fixedTable" style="width:100%;" id="addTable_99b52ba36c464464aef5216e173ca678">
                                                    <tbody id="tbody_99b52ba36c464464aef5216e173ca678"></tbody>
                                                </table>
                                                <div style="display:none;">
                                                    <dict:selectDict id="CMD_DEVICE_TYPE" name="CMD_DEVICE_TYPE" dictCode="CMD_DEVICE_TYPE"/>
                                                </div>
                                                <div style="display:none;">
                                                    <dict:selectDict id="TRACK_TYPE" name="TRACK_TYPE" dictCode="TRACK_TYPE"/>
                                                </div>
                                                <div style="display:none;">
                                                    <dict:selectDict id="CHANEL_SN" name="CHANEL_SN" dictCode="CHANEL_SN"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </DIV>
                    </DIV>
                </div>
            </div>
    </form>
</div>

</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>

<script type="text/javascript">
    function delddd() {
        $("#tbody_1abddbae1d704169a987c0af3e06c1df").empty();
    }

    function addw() {

        //  $("#paraMap1_CM_MODEL_CODE").addClass("_VAL_NULL isSubmit input readonly _VAL_DATABASE");
        $("#paraMap1_CM_MODEL_CODE").attr("disabled", "disabled");
        $("#paraMap1_CM_MODEL_CODE").attr("class", "_VAL_NULL isSubmit input readonly _VAL_DATABASE");
        $("#paraMap1_CM_MODEL_CODE_SHOW").addClass("input _VAL_NULL isSubmit input readonly _VAL_DATABASE ico-search-input");
    }

    function init() {

        document.getElementById("paraMap1_CM_STAUS_1").checked = true;
        $("#tag2").addClass("current");
        if ($("#leftTable-kz").length > 0) {
            $("#leftTable-kz").show();
        }

        if ($("#leftTable").length > 0) {
            $("#leftTable").show();
        }
        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
    }//初始化方法

    function showAddPopWin(formId, exeid) {
        var piframeId = window.frameElement.id;
        var relcol = $("input[type='hidden'][name='relcol']").val();
        var url;
        var trid = getCurRow();

        var modelCode = $("#paraMap1_CM_MODEL_CODE").val();
        if (modelCode == '') {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请先选择机种" />", 0, "", "");
            return false;
        }
        var areaSn = checkAreaSn();
        if (areaSn == '') {

            return false;
        }
        url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&formId=" + formId + "&areaSn=" + areaSn + "&modelCode=" + modelCode;

        showPopWinFp(url, 680, 350, "", "<dict:lang value="新增"/>", "add", "");
    }

    function checkAreaSn() {
        var areaSn = '';
        $("#addTable_99b52ba36c464464aef5216e173ca678").find("tbody tr td").find(":input[name^='paraMap'][name$='CML_AREA_SN']").each(function (i) {
            if (areaSn == '') areaSn += $(this).val();
            else {
                areaSn = areaSn + "," + $(this).val();
            }
        });
        if (areaSn == '') {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请先关联线别" />", 0, "", "");
        }
        return areaSn;
    }

    var typessss = 0;

    function excelImport(formId, exeid, flag) {
        typessss = $("#tbody_1abddbae1d704169a987c0af3e06c1df tr").length;
        var len = $("#tbody_1abddbae1d704169a987c0af3e06c1df tr").length;
        $("#len").val(len);
        var areaSn = checkAreaSn();
        if (areaSn == '') {
            return;
        }
        var modelCode = $("#paraMap1_CM_MODEL_CODE").val();
        if (modelCode == '') {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请先选择机种" />", 0, "", "");
            return;
        }
        var url;
        var piframeId = window.frameElement.id;
        url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&formId=" + formId + "&areaSn=" + areaSn + "&modelCode=" + modelCode + "&flag=" + flag + "&len=" + len;

        showPopWinFp(url, 680, 350, "", "<dict:lang value="选择文件"/>", "add", "");
    }

    function programImport(formId, exeid) {
        var areaSn = checkAreaSn();
        if (areaSn == '') {
            return;
        }
        var modelCode = $("#paraMap1_CM_MODEL_CODE").val();
        if (modelCode == '') {
            utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请先选择机种" />", 0, "", "");
            return;
        }
        var url;
        var piframeId = window.frameElement.id;
        url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&formId=" + formId + "&areaSn=" + areaSn + "&modelCode=" + modelCode;

        showPopWinFp(url, 680, 350, "", "<dict:lang value="选择程式"/>", "add", "");
    }

    function _delRowExtendConfirm(obj) {
        var tableId = obj.tableId;
        $("input[name='checkbox" + tableId + "']:checked").each(function () { // 遍历选中的checkbox
            var trIndex = $(this).parents("tr").index();
            $("#addTable_" + tableId).find("tr:eq(" + trIndex + ")").remove();


        });
        calItemCount(tableId);
    }

    //贴片点数合计
    function calItemCount(formId) {
        var relV;
        var itemCount = 0;
        //console.log(formId);
        $("#addTable_" + formId + " tbody tr td").find(":input[name^='paraMap'][name$='CMD_POINT_NUM']").each(function (k) {
            relV = $(this).val();
            itemCount = Number(itemCount) + Number(relV);
        });

        $("#paraMap1_CM_ITEM_COUNT").val(itemCount);
    }

    var tabLength = 0;

    function addData(data, formId, rowCount) {
        if (rowCount == undefined) {

            //_addRowExtend(formId,'2')
            //newAddData(data,formId,rowCount);
            newAddData();

        }
        else {

            //_addRowExtendFlag(formId,'2',rowCount);
            newAddData2(rowCount);
        }

    }

    //视图扩展新增追加行
    function _addRowExtend(tableId, formIndex, getSelectedCountExtend, ptableId, subformid, pCols, selCols) {
        var flag = false;

        if (typeof getSelectedCountExtend == "function") {
            var selCount = getSelectedCountExtend(ptableId, tableId, 1);
            if (selCount == 0 || selCount > 1) {
                return false;
            }

            $("input[name='checkbox" + ptableId + "']:checked").each(function () {
                var ptrIndex = $(this).parents("tr").index();

                var colNoUp = $("input[name='COL_NO" + tableId + "']").val();
                var selectValue = getColObjBySeq(ptableId, ptrIndex, colNoUp);
                if (selectValue == null) {
                    flag = true;
                    utilsFp.confirmIcon(3, "", "", "", "关联字段未配置显示或隐藏", "", "360", "145");
                    return;
                }

                var colNo = $("input[name='COL_NO_D" + tableId + "']").val();
                $("#addTable_" + tableId + " tbody tr td").find(":input[name^='paraMap'][name$='" + colNo + "']").each(function () {
                    var relV = $(this).val();
                    if (relV != selectValue[0].value) {
                        $(this).parent().parent().hide();
                    }
                    else if (relV == selectValue[0].value) {
                        $(this).parent().parent().show();
                    }
                });

            });

        }
        if (flag) return;
        util.showLoading();
        var url = "${path}buss/bussModel_ajaxAddRowExtend.ms?FUNC_CODE=F285";

        var addTtable = $('#addTable_' + tableId);
        var tableTrJq = addTtable.find("tbody tr");
        var row_count = tableTrJq.length;
        if (row_count == 0) {
            //curRowSeq=0;
        }
        var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D' + tableId).val();
        jQuery.ajax({
            type: "POST",
            dataType: "json",
            async: false,
            url: url,
            data: {
                'paraMap.FORMID': tableId,
                'paraMap.subformid': subformid,
                'paraMap.formIndex': formIndex,
                'paraMap.FORM_COL_ID_D': FORM_COL_ID_D,
                'paraMap.trIndex': curRowSeq
            },
            success: function (data) {
                util.closeLoading();

                var row = $(data.ajaxString);
                if (row_count % 2 != 0) {
                    row.addClass("tr1");//
                }
                _toClickColor(row);//
                addTtable.append(row);
                if (typeof getSelectedCountExtend == "function") {
                    getSelectedCountExtend(ptableId, tableId, 2, pCols, selCols);
                }
                var dataCountObj = $("input[name='paraMap" + formIndex + formSplit + FORM_PAGE_DATA_COUNT_FLAG + "']");
                dataCountObj.val(row_count + 1);
                curRowSeq++;
                setChosen();//设置下拉框样式
                $(".glxb-table .chosen-container").css("width", "100%");
                tabLength++;
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


    function newAddData() {
        var obj1 = $("#CMD_DEVICE_TYPE").html();
        var obj2 = $("#TRACK_TYPE").html();
        var obj3 = $("#CHANEL_SN").html();
        var l = $("#tbody_1abddbae1d704169a987c0af3e06c1df tr").length;
        var j = l;
        var j2 = l;
        var pre = "paraMapObj_" + j2 + "_";
        var preName = "paraMap2@" + j2 + "#";
        var oneTr = "<tr id='addTableTr" + j + "_1abddbae1d704169a987c0af3e06c1df' >"
            + "<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox1abddbae1d704169a987c0af3e06c1df' style='cursor: pointer;width:13px;height:30px;'></span><input type='hidden' class='associted' name='" + preName + "ID' ></td>"
            + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_DEVICE_TYPE' name='paraMap2@CMD_DEVICE_TYPE' style='width:100%'>" + obj1
            + "</select></td>"
            + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_PROGRAM_NAME' name='paraMap2@CMD_PROGRAM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
            + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_DEVICE_SEQ' name='paraMap2@CMD_DEVICE_SEQ' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
            //+"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_TRACK' name='"+preName+"CMD_TRACK' class='coctra' style='width:100%'>"+obj2
            //+"</select></td>"
            + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_TABLE_NO' name='paraMap2@CMD_TABLE_NO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
            + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_LOADPOINT' name='paraMap2@CMD_LOADPOINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
            + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_CHANEL_SN' name='paraMap2@CMD_CHANEL_SN' style='width:100%'>" + obj3
            + "</select></td>"
            + "<td style='position: relative; width: 150px;'><input type='hidden' id='" + pre + "CMD_ITEM_CODE' name='paraMap2@CMD_ITEM_CODE' value='' ><input editname='" + preName + "CMD_ITEM_CODE' textval='" + preName + "CMD_ITEM_CODESHOW' type='text' id='" + pre + "CMD_ITEM_CODE_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" readonly='readonly'></td>"
            + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_ITEM_NAME' name='paraMap2@CMD_ITEM_NAME' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"
            + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_ITEM_STANDARD' name='paraMap2@CMD_ITEM_STANDARD' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"
            + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_FEEDER_SPEC' name='paraMap2@CMD_FEEDER_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
            + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_TRY_FLAG' name='paraMap2@CMD_TRY_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
            + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_SHKIP_FLAG' name='paraMap2@CMD_SHKIP_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
            + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_POINT_NUM' name='paraMap2@CMD_POINT_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
            + "<td style='position: relative; width: 150px;'><input type='text' id='" + pre + "CMD_POINT_LOCATION' name='paraMap2@CMD_POINT_LOCATION' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
            + "<td style='position: relative; width: 80px;'><select id='" + pre + "CMD_BOM_FLAG' name='paraMap2@CMD_BOM_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
            + "<td style='position: relative;'><input type='text' id='" + pre + "CMD_MEMO' name='paraMap2@CMD_MEMO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
            + "</tr>";
        $("#tbody_1abddbae1d704169a987c0af3e06c1df").append(oneTr);

    }

    function newAddData2(rowCount) {
        var obj1 = $("#CMD_DEVICE_TYPE").html();
        var obj2 = $("#TRACK_TYPE").html();
        var obj3 = $("#CHANEL_SN").html();
        console.log("obj1" + obj1);
        var allTr = "";
        //var len = $("#len").val();
        for (var i = 0; i < rowCount; i++) {
            var j = i + $("#tbody_1abddbae1d704169a987c0af3e06c1df tr").length;//+parseInt(len)
            console.log("j::::::::::::" + j);
            var j2 = j;

            var pre = "paraMapObj_" + j2 + "_";
            var preName = "paraMap2@" + j2 + "#";
            var oneTr = "<tr id='addTableTr" + j + "_1abddbae1d704169a987c0af3e06c1df' >"
                + "<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox1abddbae1d704169a987c0af3e06c1df' style='cursor: pointer;width:13px;height:30px;'></span><input type='hidden' class='associted' name='" + preName + "ID' ></td>"
                + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_DEVICE_TYPE' name='paraMap2@CMD_DEVICE_TYPE' style='width:100%'>" + obj1
                + "</select></td>"
                + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_PROGRAM_NAME' name='paraMap2@CMD_PROGRAM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_DEVICE_SEQ' name='paraMap2@CMD_DEVICE_SEQ' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                //+"<td style='position: relative; width: 100px;'><select id='"+pre+"CMD_TRACK' name='"+preName+"CMD_TRACK' class='coctra' style='width:100%'>"+obj2
                //+"</select></td>"
                + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_TABLE_NO' name='paraMap2@CMD_TABLE_NO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_LOADPOINT' name='paraMap2@CMD_LOADPOINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_CHANEL_SN' name='paraMap2@CMD_CHANEL_SN' style='width:100%'>" + obj3
                + "</select></td>"
                + "<td style='position: relative; width: 150px;'><input type='hidden' id='" + pre + "CMD_ITEM_CODE' name='paraMap2@CMD_ITEM_CODE' value='' ><input editname='" + preName + "CMD_ITEM_CODE' textval='" + preName + "CMD_ITEM_CODESHOW' type='text' id='" + pre + "CMD_ITEM_CODE_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" readonly='readonly'></td>"
                + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_ITEM_NAME' name='paraMap2@CMD_ITEM_NAME' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"
                + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_ITEM_STANDARD' name='paraMap2@CMD_ITEM_STANDARD' value='' maxlength='50' disabled class='isSubmit input  _VAL_DATABASE'></td>"
                + "<td style='position: relative; width: 100px;'><input type='text' id='" + pre + "CMD_FEEDER_SPEC' name='paraMap2@CMD_FEEDER_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
                + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_TRY_FLAG' name='paraMap2@CMD_TRY_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                + "<td style='position: relative; width: 100px;'><select id='" + pre + "CMD_SHKIP_FLAG' name='paraMap2@CMD_SHKIP_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                + "<td style='position: relative; width: 80px;'><input type='text' id='" + pre + "CMD_POINT_NUM' name='paraMap2@CMD_POINT_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
                + "<td style='position: relative; width: 150px;'><input type='text' id='" + pre + "CMD_POINT_LOCATION' name='paraMap2@CMD_POINT_LOCATION' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
                + "<td style='position: relative; width: 80px;'><select id='" + pre + "CMD_BOM_FLAG' name='paraMap2@CMD_BOM_FLAG' value='' maxlength='50'  style='width:100%' ><option value='Y'>是</option><option value='N'>否</option></select></td>"
                + "<td style='position: relative;'><input type='text' id='" + pre + "CMD_MEMO' name='paraMap2@CMD_MEMO' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE'></td>"
                + "</tr>";
            allTr = allTr + oneTr;

        }

        $("#tbody_1abddbae1d704169a987c0af3e06c1df").append(allTr);
        //util.closeLoading();
    }

    function editData(formId, colNo, colNoValue, rowI) {
        var trId;
        // console.log("len"+len);
        // console.log("rowI::"+rowI);
        if (rowI != undefined) {
            var rowI2 = parseInt(typessss) + parseInt(rowI);
            console.log("rowI::" + rowI + "typessss::" + typessss);
            trId = 'addTableTr' + rowI2 + '_' + formId;
        }
        else {
            trId = $("#addTable_" + formId + " tbody").find("tr:last").attr("id");
        }
        console.log("trId:" + trId);
        $("#" + trId).find(":input[name^='paraMap'][name$='" + colNo + "']").each(function (k) {
            if (colNo == 'CMD_ITEM_CODE') {
                //console.log($(this).attr('id'));
                var show = $(this).attr('id') + "_SHOW";
                $("#" + show).val(colNoValue);
            }
            $(this).val(colNoValue);
            console.log("colNoValue::" + colNoValue);
            console.log("colNo::" + colNo);
            console.log("geshi::" + $(this)[0].tagName);
            if ($(this)[0].tagName == 'SELECT') {
                $(this).trigger("chosen:updated");
            }
            console.log("`````````````````````````````````````");
        });


    }


    function saveObj() {
        isQuery = false;
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


        $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
        $DisInput.attr("disabled", false);
        if ($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0) {
            $("#addForm").append($("#isCloseWin").clone());
            $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
        }
        $("#saveBtn").prop("disabled", "disabled");
        var tblen = $("#tbody_99b52ba36c464464aef5216e173ca678 tr").length;
        var areaSns = "";
        console.log("tabLength===>", tabLength);
        for (var i = 0; i < tabLength; i++) {
            if (areaSns == "") {
                console.log("1==>", $("#paraMap" + (i + 1) + "_CML_AREA_SN").val());
                if (undefined != $("#paraMap" + (i + 1) + "_CML_AREA_SN").val()) {
                    areaSns = $("#paraMap" + (i + 1) + "_CML_AREA_SN").val();
                }

            } else {
                console.log("1==>", $("#paraMap" + (i + 1) + "_CML_AREA_SN").val());
                if (undefined != $("#paraMap" + (i + 1) + "_CML_AREA_SN").val()) {
                    areaSns = areaSns + "," + $("#paraMap" + (i + 1) + "_CML_AREA_SN").val();
                }

            }
        }
        $("#areaSns").val(areaSns);
        console.log("areaSns===>", areaSns);
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=588afbdc7ddc4085b3dd5df2878b31fc";

        document.forms.addForm.submit();
        isQuery = true;
        $DisInput.attr("disabled", true);
    }

    //$("#paraMap1_CM_TRACK").change(function(){
    //   var newval = $(this).val();
    //    $(".coctra").val(newval);
    //})
    function backFillItemVal(obj, thisId) {
//$("#paraMap1_CBD_ITEM_CODE").val(obj.KEY);
//$("#paraMap1_CBD_ITEM_CODE_SHOW").val(obj.KEY);
        $("#" + thisId).val(obj.MKEY);
        $("#" + thisId + "_SHOW").val(obj.MKEY);
        var iName = thisId.replace("CODE", "NAME");
        var iSpec = thisId.replace("CODE", "STANDARD");
        $("#" + iName).val(obj.VAL);
        $("#" + iSpec).val(obj.ITEMSPEC);
    }

    function clearItemVal(thisId) {
        $("#" + thisId).val("");
        $("#" + thisId + "_SHOW").val("");
        var iName = thisId.replace("CODE", "NAME");
        var iSpec = thisId.replace("CODE", "STANDARD");
        $("#" + iName).val("");
        $("#" + iSpec).val("");
    }
</script>
<bu:script viewId="c54485c1926748f1a9172a3a2126d444"/>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="needValidate" value="1"/>
</jsp:include>
<script>(function ($) {
    $(window).on('load', function () {
        setPopScroll('.datagrid-body', '.datagrid-header-inner');
    })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
 
 